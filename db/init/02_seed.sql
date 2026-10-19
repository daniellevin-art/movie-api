-- A few movies so there is something to read before the OMDb integration exists.
INSERT INTO movies (imdb_id, title, year, genre, director, plot, imdb_rating) VALUES
    ('tt0133093', 'The Matrix',   '1999', 'Action, Sci-Fi',        'Lana Wachowski, Lilly Wachowski',
     'A hacker learns the true nature of his reality.', 8.7),
    ('tt1375666', 'Inception',    '2010', 'Action, Adventure, Sci-Fi', 'Christopher Nolan',
     'A thief steals secrets through dream-sharing technology.', 8.8),
    ('tt0816692', 'Interstellar', '2014', 'Adventure, Drama, Sci-Fi',  'Christopher Nolan',
     'Explorers travel through a wormhole to save humanity.', 8.7);
