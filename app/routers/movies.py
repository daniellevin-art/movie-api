from fastapi import APIRouter, Depends, HTTPException, Path
from fastapi.responses import RedirectResponse
from sqlalchemy import select
from sqlalchemy.orm import Session

from app.database import get_db
from app.models import Movie
from app.schemas import MovieOut

router = APIRouter(prefix="/movies", tags=["movies"])

ImdbId = Path(pattern=r"^tt\d{7,10}$")

@router.get("/health")
def health_check():
    return {"status": "healthy"}


@router.get("", response_model=list[MovieOut])
def list_movies(db: Session = Depends(get_db)):
    return db.scalars(select(Movie).order_by(Movie.title)).all()


@router.get("/{imdb_id}", response_model=MovieOut)
def get_movie(imdb_id: str = ImdbId, db: Session = Depends(get_db)):
    movie = db.get(Movie, imdb_id)
    if movie is None:
        raise HTTPException(status_code=404, detail="Movie not found")
    return movie


@router.get("/{imdb_id}/imdb")
def go_to_imdb(imdb_id: str = ImdbId):
    return RedirectResponse(f"https://www.imdb.com/title/{imdb_id}/")
