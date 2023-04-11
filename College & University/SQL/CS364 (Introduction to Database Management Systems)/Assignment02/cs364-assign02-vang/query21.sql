SELECT *
    FROM Track JOIN Genre
        ON Track.GenreId = Genre.GenreId
    WHERE Genre.Name = 'Rock';
    