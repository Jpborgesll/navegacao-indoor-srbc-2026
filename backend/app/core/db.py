from sqlalchemy.ext.asyncio import create_async_engine, async_sessionmaker, AsyncSession
from sqlalchemy import text
from .config import settings

import logging

logger = logging.getLogger(__name__)

engine = create_async_engine(settings.DATABASE_URL, pool_pre_ping=True)
AsyncSessionLocal = async_sessionmaker(
    engine, expire_on_commit=False, class_=AsyncSession
)


async def get_db():
    async with AsyncSessionLocal() as session:
        yield session


async def init_db():
    extensions = [
        "plpgsql",
        "postgis",
        "pgrouting",
        "fuzzystrmatch",
        "pg_trgm",
    ]
    async with engine.begin() as conn:
        for ext in extensions:
            try:
                await conn.execute(text(f"CREATE EXTENSION IF NOT EXISTS {ext}"))
                logger.info(f"Extension {ext} checked/created successfully.")
            except Exception as e:
                logger.warning(f"Could not create extension {ext}: {e}")

        check_table = await conn.execute(text(
            "SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'edge_line')"
        ))
        if check_table.scalar():
            check_noded = await conn.execute(text(
                "SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'edge_line_noded')"
            ))
            if not check_noded.scalar():
                logger.info("Initializing pgRouting topology for edge_line...")
                try:
                    # Cria a rede de nós
                    await conn.execute(text("SELECT pgr_nodeNetwork('edge_line', 0.00000001, 'id', 'geom', 'noded')"))
                    # Cria a topologia
                    await conn.execute(text("SELECT pgr_createTopology('edge_line_noded', 0.00000001, 'geom', 'id')"))
                    # Adiciona custo
                    await conn.execute(text("ALTER TABLE edge_line_noded ADD COLUMN IF NOT EXISTS cost float"))
                    await conn.execute(text("UPDATE edge_line_noded SET cost = ST_Length(geom::geography)"))
                    logger.info("Topology setup successful.")
                except Exception as e:
                    logger.error(f"Failed to setup topology: {e}")
            else:
                logger.info("Topology table edge_line_noded already exists.")


# opcional: healthcheck rápido
async def ping_db() -> bool:
    async with AsyncSessionLocal() as s:
        await s.execute(text("SELECT 1"))
    return True
