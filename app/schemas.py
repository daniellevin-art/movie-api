from pydantic import BaseModel, ConfigDict


class MovieOut(BaseModel):
    model_config = ConfigDict(from_attributes=True)  # lets Pydantic read SQLAlchemy objects

    imdb_id: str
    title: str
    year: str | None
    genre: str | None
    director: str | None
    plot: str | None
    imdb_rating: float | None
