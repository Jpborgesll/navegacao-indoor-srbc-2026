from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import text
from app.core.db import get_db
from app.schemas.route import RouteRequest, RouteResponse

router = APIRouter()


@router.post("/route/calculate", response_model=RouteResponse)
async def calculate(req: RouteRequest, db: AsyncSession = Depends(get_db)):
    """POST /route/calculate"""
    sv = (
        await db.execute(
            text("SELECT version FROM space WHERE id=:id"),
            {"id": req.space_id},
        )
    ).scalar_one_or_none()
    if not sv:
        raise HTTPException(404, "Space não encontrado")

    if not isinstance(req.user_restriction_level, int):
        raise HTTPException(400, "Parâmetro inválido")
    if not isinstance(req.space_id, int):
        raise HTTPException(400, "Parâmetro inválido")

    # Filtros baseados no usuário:
    # 1. Apenas arestas com restriction_level compatível
    # 2. Se accessible=True, filtrar apenas arestas acessíveis (coluna is_accessible)
    
    access_filter = f"AND e.restriction_level <= {req.user_restriction_level}"
    accessibility_filter = ""
    if req.accessibility:
        accessibility_filter = "AND e.is_accessible = true"

    # SQL de busca de arestas para o pgr_dijkstra
    edges_sql = f"""
        SELECT
          en.id AS id,
          en.source AS source,
          en.target AS target,
          en.cost AS cost
        FROM edge_line_noded en
        JOIN edge_line e ON en.old_id = e.id
        WHERE e.space_id = {req.space_id} AND e.space_version = '{sv}'
          AND e.is_walkable = true
          {access_filter}
          {accessibility_filter}
    """

    q = text("""
      WITH
      input_start AS (
        SELECT ST_SetSRID(ST_MakePoint(:start_x, :start_y), 4326) AS geom
      ),
      input_end AS (
        SELECT ST_SetSRID(ST_MakePoint(:end_x, :end_y), 4326) AS geom
      ),
      start_nodes AS (
        SELECT v.id, v.the_geom,
               ST_Distance(v.the_geom::geography, (SELECT geom FROM input_start)::geography) AS dist_start
        FROM edge_line_noded_vertices_pgr v
        WHERE EXISTS (
            SELECT 1 FROM edge_line_noded en
            JOIN edge_line e ON en.old_id = e.id
            WHERE (v.id = en.source OR v.id = en.target)
              AND e.space_id = :sid AND e.space_version = :sv
        )
        ORDER BY v.the_geom <-> (SELECT geom FROM input_start)
        LIMIT 5
      ),
      end_nodes AS (
        SELECT v.id, v.the_geom,
               ST_Distance(v.the_geom::geography, (SELECT geom FROM input_end)::geography) AS dist_end
        FROM edge_line_noded_vertices_pgr v
        WHERE EXISTS (
            SELECT 1 FROM edge_line_noded en
            JOIN edge_line e ON en.old_id = e.id
            WHERE (v.id = en.source OR v.id = en.target)
              AND e.space_id = :sid AND e.space_version = :sv
        )
        ORDER BY v.the_geom <-> (SELECT geom FROM input_end)
        LIMIT 5
      ),
      pgr_routes AS (
        SELECT * FROM pgr_dijkstra(
          :edges_sql,
          array(SELECT id::bigint FROM start_nodes),
          array(SELECT id::bigint FROM end_nodes),
          directed := false
        )
      ),
      path_costs AS (
        SELECT start_vid, end_vid, sum(cost) as route_cost
        FROM pgr_routes
        GROUP BY start_vid, end_vid
      ),
      best_pair AS (
        SELECT p.start_vid, p.end_vid, p.route_cost, s.dist_start, e.dist_end
        FROM path_costs p
        JOIN start_nodes s ON p.start_vid = s.id
        JOIN end_nodes e ON p.end_vid = e.id
        ORDER BY (p.route_cost + s.dist_start + e.dist_end) ASC
        LIMIT 1
      ),
      best_route AS (
        SELECT r.*
        FROM pgr_routes r
        JOIN best_pair bp ON r.start_vid = bp.start_vid AND r.end_vid = bp.end_vid
      ),
      route_geom AS (
        -- Arestas da rota (best_route pode ser vazio se não houver caminho)
        SELECT en.geom as geometry
        FROM best_route r
        JOIN edge_line_noded en ON r.edge = en.id
        UNION ALL
        -- Linha do ponto de clique inicial até o nó escolhido
        SELECT ST_MakeLine(
            (SELECT geom FROM input_start), 
            (SELECT the_geom FROM start_nodes WHERE id = (SELECT start_vid FROM best_pair))
        )
        UNION ALL
        -- Linha do ponto de clique final até o nó escolhido
        SELECT ST_MakeLine(
            (SELECT geom FROM input_end), 
            (SELECT the_geom FROM end_nodes WHERE id = (SELECT end_vid FROM best_pair))
        )
      ),
      final_res AS (
        SELECT
          ST_AsGeoJSON(ST_LineMerge(ST_Collect(geometry)))::jsonb AS gj,
          COALESCE((SELECT route_cost + dist_start + dist_end FROM best_pair), 0) AS total_cost,
          (SELECT COUNT(*) FROM best_route) as route_found
        FROM route_geom
      )
      SELECT gj, total_cost, route_found FROM final_res
    """)

    row = (
        (
            await db.execute(
                q,
                {
                    "sid": req.space_id,
                    "sv": sv,
                    "start_x": req.start_x,
                    "start_y": req.start_y,
                    "end_x": req.end_x,
                    "end_y": req.end_y,
                    "edges_sql": edges_sql,
                },
            )
        )
        .mappings()
        .first()
    )

    if not row or row["gj"] is None or row["route_found"] == 0:
        raise HTTPException(404, "Rota não encontrada")

    return {"total_cost": float(row["total_cost"] or 0.0), "geojson": row["gj"]}
