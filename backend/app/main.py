from contextlib import asynccontextmanager
from fastapi import FastAPI
from app.routers import spaces, search, route, analytics, admin
from app.core.db import init_db


@asynccontextmanager
async def lifespan(app: FastAPI):
    # Initialize DB extensions
    await init_db()
    yield


app = FastAPI(title="Indoor Navigation API", version="0.1.0", lifespan=lifespan)

app.include_router(spaces.router, tags=["spaces"])
app.include_router(search.router, tags=["search"])
app.include_router(route.router, tags=["route"])
app.include_router(analytics.router, tags=["analytics"])
app.include_router(admin.router, tags=["admin"])
