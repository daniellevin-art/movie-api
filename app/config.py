from pathlib import Path

from pydantic_settings import BaseSettings, SettingsConfigDict

# .env lives in the project root, one level above this file
ENV_FILE = Path(__file__).resolve().parents[1] / ".env"


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_file=ENV_FILE, extra="ignore")

    database_url: str


settings = Settings()
