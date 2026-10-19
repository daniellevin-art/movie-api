# movie-api

# Accessing the database inside docker from terminal

docker exec -it movie-db psql -U movie -d moviedb

# Displays variable 
docker compose config 

# Postgresql

Command	What it does
psql moviedb accessing the database
\dt	list tables
\d movies	show columns, types, constraints and indexes
\x auto	expanded display; makes wide rows like plot readable
\q	quit
SELECT imdb_id, title, year FROM movies;	plain SQL works as usual (don’t forget the ;)