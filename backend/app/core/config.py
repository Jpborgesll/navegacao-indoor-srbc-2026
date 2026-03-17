from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_file=".env", extra="ignore")

    DATABASE_URL: str  # ex: postgresql+asyncpg://user:passwd@localhost:5432/nav_indoor


settings = Settings()
