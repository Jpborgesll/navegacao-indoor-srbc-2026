from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import text
from app.core.db import get_db
from pydantic import BaseModel
from datetime import datetime
from typing import Optional

router = APIRouter()


class AnalyticsPing(BaseModel):
    space_id: int
    level: int
    # geom em GeoJSON Point: {"type":"Point","coordinates":[lon,lat]}
    geom: dict
    timestamp: Optional[datetime] = None


@router.post("/analytics/ping")
async def analytics_ping(payload: AnalyticsPing, db: AsyncSession = Depends(get_db)):
    """POST /analytics/ping"""
    q = text("""
      INSERT INTO point_for_analytics(space_id, level, geom, timestamp)
      VALUES (:sid, :lvl, ST_SetSRID(ST_GeomFromGeoJSON(:gjson), 4326), COALESCE(:ts, CURRENT_TIMESTAMP))
      RETURNING id
    """)
    new_id = (
        await db.execute(
            q,
            {
                "sid": payload.space_id,
                "lvl": payload.level,
                "gjson": payload.geom,
                "ts": payload.timestamp,
            },
        )
    ).scalar_one()
    await db.commit()
    return {"ok": True, "id": new_id}
