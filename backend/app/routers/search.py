from fastapi import APIRouter, Depends, Query
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import text
from app.core.db import get_db

router = APIRouter()


@router.get("/search")
async def search(
    space_id: int = Query(...),
    q: str = Query(..., min_length=1),
    limit: int = Query(20, ge=1, le=50),
    db: AsyncSession = Depends(get_db),
):
    """GET /search"""
    # pega a versão atual do space pra filtrar
    sv = (
        await db.execute(
            text("SELECT version FROM space WHERE id=:id"),
            {"id": space_id},
        )
    ).scalar_one_or_none()
    if not sv:
        return []

    query = text("""
      WITH units AS (
        SELECT
          'unit' AS kind,
          u.id,
          u.name AS label,
          COALESCE(ep.geom, ST_PointOnSurface(u.geom)) AS entry_geom,
          -- Combina similarity (trigramas) com levenshtein para tolerar erros de digitação
          (
            word_similarity(:q, u.name) * 0.7 +
            (1.0 - LEAST(levenshtein(lower(left(:q, 255)), lower(left(u.name, 255))), length(u.name))::float / GREATEST(length(u.name), 1)) * 0.3
          ) AS sml
        FROM unit_polygon u
        LEFT JOIN entry_point ep ON ep.unit_id = u.id
        WHERE u.space_id=:sid AND u.space_version=:sv
          AND (
            word_similarity(:q, u.name) > 0.2
            OR u.name ILIKE '%' || :q || '%' 
            OR levenshtein(lower(left(:q, 255)), lower(left(u.name, 255))) <= 2
          )
      ),
      pois AS (
        SELECT
          'poi' AS kind,
          p.id,
          p.poi_type AS label,
          p.geom AS entry_geom,
          (
            word_similarity(:q, p.poi_type) * 0.7 +
            (1.0 - LEAST(levenshtein(lower(left(:q, 255)), lower(left(p.poi_type, 255))), length(p.poi_type))::float / GREATEST(length(p.poi_type), 1)) * 0.3
          ) AS sml
        FROM point_of_interest p
        WHERE p.space_id=:sid AND p.space_version=:sv
          AND (
            word_similarity(:q, p.poi_type) > 0.2
            OR p.poi_type ILIKE '%' || :q || '%'
            OR levenshtein(lower(left(:q, 255)), lower(left(p.poi_type, 255))) <= 2
          )
      )
      SELECT kind, id, label,
             ST_AsGeoJSON(entry_geom)::jsonb AS entry_point
      FROM (
        SELECT * FROM units
        UNION ALL
        SELECT * FROM pois
      ) x
      ORDER BY sml DESC
      LIMIT :limit
    """)

    rows = (
        (await db.execute(query, {"sid": space_id, "sv": sv, "q": q, "limit": limit}))
        .mappings()
        .all()
    )
    return rows
