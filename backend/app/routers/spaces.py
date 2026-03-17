from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import text
from app.core.db import get_db

router = APIRouter()


@router.get("/spaces/{space_id}/version")
async def get_space_version(space_id: int, db: AsyncSession = Depends(get_db)):
    """GET /spaces/{id}/version"""
    q = text("SELECT id, version FROM space WHERE id = :id")
    row = (await db.execute(q, {"id": space_id})).mappings().first()
    if not row:
        raise HTTPException(404, "Space não encontrado")
    return {"space_id": row["id"], "space_version": row["version"]}


from sqlalchemy import text


@router.get("/spaces/{space_id}/sync")
async def sync_space(space_id: int, db: AsyncSession = Depends(get_db)):
    """GET /spaces/{id}/sync"""
    # NOTE: usar a version do space para filtrar tudo
    vrow = (
        (
            await db.execute(
                text("SELECT version FROM space WHERE id = :id"),
                {"id": space_id},
            )
        )
        .mappings()
        .first()
    )
    if not vrow:
        raise HTTPException(404, "Space não encontrado")
    space_version = vrow["version"]

    units_q = text("""
        SELECT jsonb_build_object(
          'type','FeatureCollection',
          'features', COALESCE(jsonb_agg(
            jsonb_build_object(
              'type','Feature',
              'id', u.id,
              'geometry', ST_AsGeoJSON(u.geom)::jsonb,
              'properties', jsonb_build_object(
                'name', u.name,
                'unit_type', u.unit_type,
                'level', u.level,
                'restriction_level', u.restriction_level,
                'is_blocked', u.is_blocked
              )
            )
          ), '[]'::jsonb)
        ) AS fc
        FROM unit_polygon u
        WHERE u.space_id = :sid AND u.space_version = :sv
    """)

    edges_q = text("""
        SELECT jsonb_build_object(
          'type','FeatureCollection',
          'features', COALESCE(jsonb_agg(
            jsonb_build_object(
              'type','Feature',
              'id', e.id,
              'geometry', ST_AsGeoJSON(e.geom)::jsonb,
              'properties', jsonb_build_object(
                'edge_type', e.edge_type,
                'is_walkable', e.is_walkable,
                'is_accessible', e.is_accessible,
                'level', e.level,
                'restriction_level', e.restriction_level,
                'source', e.source,
                'target', e.target,
                'cost', e.cost
              )
            )
          ), '[]'::jsonb)
        ) AS fc
        FROM edge_line e
        WHERE e.space_id = :sid AND e.space_version = :sv
    """)

    pois_q = text("""
        SELECT jsonb_build_object(
          'type','FeatureCollection',
          'features', COALESCE(jsonb_agg(
            jsonb_build_object(
              'type','Feature',
              'id', p.id,
              'geometry', ST_AsGeoJSON(p.geom)::jsonb,
              'properties', jsonb_build_object(
                'poi_type', p.poi_type,
                'level', p.level
              )
            )
          ), '[]'::jsonb)
        ) AS fc
        FROM point_of_interest p
        WHERE p.space_id = :sid AND p.space_version = :sv
    """)

    beacons_q = text("""
        SELECT jsonb_build_object(
          'type','FeatureCollection',
          'features', COALESCE(jsonb_agg(
            jsonb_build_object(
              'type','Feature',
              'id', b.id,
              'geometry', ST_AsGeoJSON(b.geom)::jsonb,
              'properties', jsonb_build_object(
                'level', b.level,
                'rssi', b.rssi
              )
            )
          ), '[]'::jsonb)
        ) AS fc
        FROM beacon b
        WHERE b.space_id = :sid AND b.space_version = :sv
    """)

    params = {"sid": space_id, "sv": space_version}
    units = (await db.execute(units_q, params)).scalar_one()
    edges = (await db.execute(edges_q, params)).scalar_one()
    pois = (await db.execute(pois_q, params)).scalar_one()
    beacons = (await db.execute(beacons_q, params)).scalar_one()

    return {
        "space_id": space_id,
        "space_version": space_version,
        "units": units,
        "edges": edges,
        "pois": pois,
        "beacons": beacons,
    }
