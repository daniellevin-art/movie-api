from decimal import Decimal

from sqlalchemy.orm import Mapped, mapped_column

from app.database import Base


# Mirrors the movies table in db/init/01_schema.sql (the SQL file owns the schema).
# Only the columns we use so far are mapped.
class Movie(Base):
    __tablename__ = "movies"

    imdb_id: Mapped[str] = mapped_column(primary_key=True)
    title: Mapped[str]
    year: Mapped[str | None]
    genre: Mapped[str | None]
    director: Mapped[str | None]
    plot: Mapped[str | None]
    imdb_rating: Mapped[Decimal | None]
