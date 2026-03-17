from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import text
from pydantic import BaseModel
from app.core.db import get_db

router = APIRouter(prefix="/admin")


class UnitPatch(BaseModel):
    is_blocked: bool | None = None
    restriction_level: int | None = None


@router.patch("/units/{unit_id}")
async def patch_unit(unit_id: int, body: UnitPatch, db: AsyncSession = Depends(get_db)):
    """PATCH /admin/units/{id}"""
    sets = []
    params = {"id": unit_id}
    if body.is_blocked is not None:
        sets.append("is_blocked = :is_blocked")
        params["is_blocked"] = body.is_blocked
    if body.restriction_level is not None:
        sets.append("restriction_level = :restriction_level")
        params["restriction_level"] = body.restriction_level

    if not sets:
        return {"ok": True, "updated": False}

    q = text(f"UPDATE unit_polygon SET {', '.join(sets)} WHERE id=:id")
    await db.execute(q, params)
    await db.commit()
    return {"ok": True, "updated": True}


class PublishRequest(BaseModel):
    space_id: int
    new_version: str  


@router.post("/spaces/publish")
async def publish_space(body: PublishRequest, db: AsyncSession = Depends(get_db)):
    q = text(
        "UPDATE space SET version = :v, timestamp = CURRENT_TIMESTAMP WHERE id = :id"
    )
    await db.execute(q, {"v": body.new_version, "id": body.space_id})
    await db.commit()
    return {"ok": True, "space_id": body.space_id, "space_version": body.new_version}
