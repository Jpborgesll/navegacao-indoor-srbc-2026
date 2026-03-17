from pydantic import BaseModel, Field

class RouteRequest(BaseModel):
    space_id: int
    start_x: float
    start_y: float
    end_x: float
    end_y: float
    user_restriction_level: int = 0  # 0=público, 1+=níveis de acesso (staff, manutenção, etc)
    accessibility: bool = False  # se True: filtra apenas trechos acessíveis para cadeirantes

class RouteResponse(BaseModel):
    total_cost: float
    geojson: dict
