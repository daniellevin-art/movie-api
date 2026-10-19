-- Starter schema for the movie service.
-- Place in ./db/init/ — Postgres runs it automatically on first start.

-- Cache of movies fetched from OMDb. imdb_id is the natural key
-- and is also what we use to redirect to https://www.imdb.com/title/{imdb_id}/
CREATE TABLE movies (
    imdb_id      VARCHAR(12) PRIMARY KEY,          -- e.g. 'tt0133093'
    title        TEXT        NOT NULL,
    year         VARCHAR(10),                      -- OMDb returns '1999' or '2010–2013'
    rated        VARCHAR(20),
    runtime      VARCHAR(20),
    genre        TEXT,
    director     TEXT,
    actors       TEXT,
    plot         TEXT,
    poster_url   TEXT,
    imdb_rating  NUMERIC(3,1),
    omdb_raw     JSONB,                            -- full OMDb response, for later exercises
    fetched_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_movies_title ON movies (LOWER(title));

-- Our own data on top of OMDb — this is what makes it "our" service.
CREATE TABLE reviews (
    id          SERIAL PRIMARY KEY,
    imdb_id     VARCHAR(12) NOT NULL REFERENCES movies(imdb_id) ON DELETE CASCADE,
    author      VARCHAR(50) NOT NULL,
    rating      SMALLINT    NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment     TEXT,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE watchlist (
    id          SERIAL PRIMARY KEY,
    imdb_id     VARCHAR(12) NOT NULL REFERENCES movies(imdb_id) ON DELETE CASCADE,
    added_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
    watched     BOOLEAN     NOT NULL DEFAULT false,
    UNIQUE (imdb_id)
);
