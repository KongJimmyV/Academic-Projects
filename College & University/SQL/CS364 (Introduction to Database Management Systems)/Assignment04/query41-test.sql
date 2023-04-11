
-- Returns artists who have 2 or more unique genres
SELECT ArtistName, count(*) AS NumGenres
    FROM (SELECT Artist.ArtistId, Artist.Name AS ArtistName
            FROM Artist
                JOIN Album
                JOIN Track
                JOIN Genre
                    ON Artist.ArtistId = Album.ArtistId
                    AND Album.AlbumId = Track.AlbumId
                    AND Track.GenreId = Genre.GenreId
            GROUP BY Genre.GenreId, Genre.Name) AS UniqueGenres
    GROUP BY ArtistId, ArtistName
    HAVING count(*) >= 2;

-- Find a query of every track of who is the artist that sung it and what is the genre of that track
SELECT Track.Name, Artist.ArtistId, Artist.Name AS ArtistName, Genre.Name AS GenreName
    FROM Artist
        JOIN Album
        JOIN Track
        JOIN Genre
            ON Artist.ArtistId = Album.ArtistId
            AND Album.AlbumId = Track.AlbumId
            AND Track.GenreId = Genre.GenreId

-- How many different genres has an artist sung?
SELECT ArtistDistinctTracks.ArtistId, ArtistDistinctTracks.ArtistName, count(*) AS NumGenres
    FROM (SELECT DISTINCT Artist.ArtistId, Artist.Name AS ArtistName, Genre.Name AS GenreName
            FROM Artist
                JOIN Album
                JOIN Track
                JOIN Genre
                    ON Artist.ArtistId = Album.ArtistId
                    AND Album.AlbumId = Track.AlbumId
                    AND Track.GenreId = Genre.GenreId) AS ArtistDistinctTracks
    GROUP BY ArtistDistinctTracks.ArtistId, ArtistDistinctTracks.ArtistName

-- Returns artists who have more than 20 songs
SELECT Artist.Name AS ArtistName, count(*) AS NumSongs
    FROM Artist
        JOIN Album
        JOIN Track
            ON Artist.ArtistId = Album.ArtistId
            AND Album.AlbumId = Track.AlbumId
    GROUP BY Artist.ArtistId, Artist.Name
    HAVING count(*) >= 20;

-- (IN clause) Returns artists who have more than 20 songs and have songs in 2 or more unique genres.
SELECT ArtistsGenres.ArtistName, count(*) AS NumGenres
    FROM (SELECT Artist.ArtistId, Artist.Name AS ArtistName
            FROM Artist
                JOIN Album
                JOIN Track
                JOIN Genre
                    ON Artist.ArtistId = Album.ArtistId
                    AND Album.AlbumId = Track.AlbumId
                    AND Track.GenreId = Genre.GenreId
            GROUP BY Genre.GenreId, Genre.Name) AS ArtistsGenres
    WHERE ArtistsGenres.ArtistId IN (SELECT a.ArtistId
                                        FROM Artist AS a
                                            JOIN Album AS alb
                                            JOIN Track AS t
                                                ON a.ArtistId = alb.ArtistId
                                                AND alb.AlbumId = t.AlbumId
                                        GROUP BY a.ArtistId, a.Name
                                        HAVING count(*) >= 20)
    GROUP BY ArtistsGenres.ArtistId, ArtistsGenres.ArtistName
    HAVING count(*) >= 2
    ORDER BY count(*) DESC, ArtistName ASC;

-- (EXISTS clause) Returns artists who have more than 20 songs and have songs in 2 or more unique genres.
SELECT ArtistsGenres.ArtistName, count(*) AS NumGenres
    FROM (SELECT Artist.ArtistId, Artist.Name AS ArtistName
            FROM Artist
                JOIN Album
                JOIN Track
                JOIN Genre
                    ON Artist.ArtistId = Album.ArtistId
                    AND Album.AlbumId = Track.AlbumId
                    AND Track.GenreId = Genre.GenreId
            GROUP BY Genre.GenreId, Genre.Name) AS ArtistsGenres
    WHERE EXISTS (SELECT a.ArtistId
                    FROM Artist AS a
                        JOIN Album AS alb
                        JOIN Track AS t
                            ON a.ArtistId = alb.ArtistId
                            AND alb.AlbumId = t.AlbumId
                    WHERE a.ArtistId = ArtistsGenres.ArtistId
                    GROUP BY a.ArtistId, a.Name
                    HAVING count(*) >= 20)
    GROUP BY ArtistsGenres.ArtistId, ArtistsGenres.ArtistName
    HAVING count(*) >= 2
    ORDER BY count(*) DESC, ArtistName ASC;

-- (NATURAL JOIN clause)
--      Returns artists who have more than 20 songs and have songs in 2 or more unique genres.
SELECT ArtistsGenres.ArtistName, count(*) AS NumGenres
    FROM (SELECT Artist.ArtistId, Artist.Name AS ArtistName
            FROM Artist
                JOIN Album
                JOIN Track
                JOIN Genre
                    ON Artist.ArtistId = Album.ArtistId
                    AND Album.AlbumId = Track.AlbumId
                    AND Track.GenreId = Genre.GenreId
            GROUP BY Genre.GenreId, Genre.Name) AS ArtistsGenres
        NATURAL JOIN (SELECT a.ArtistId
                        FROM Artist AS a
                            JOIN Album AS alb
                            JOIN Track AS t
                                ON a.ArtistId = alb.ArtistId
                                AND alb.AlbumId = t.AlbumId
                        GROUP BY a.ArtistId, a.Name
                        HAVING count(*) >= 20
                     )
    GROUP BY ArtistsGenres.ArtistId, ArtistsGenres.ArtistName
    HAVING count(*) >= 2
    ORDER BY count(*) DESC, ArtistName ASC;

-- (NATURAL JOIN clause - Better Version)
--      Returns artists who have more than 20 songs and have songs in 2 or more unique genres.
SELECT ArtistDistinctTracks.ArtistName, count(*) AS NumGenres
    FROM (SELECT DISTINCT Artist.ArtistId, Artist.Name AS ArtistName, Genre.Name AS GenreName
            FROM Artist
                JOIN Album
                JOIN Track
                JOIN Genre
                    ON Artist.ArtistId = Album.ArtistId
                    AND Album.AlbumId = Track.AlbumId
                    AND Track.GenreId = Genre.GenreId) AS ArtistDistinctTracks
        NATURAL JOIN (SELECT a.ArtistId
                        FROM Artist AS a
                            JOIN Album AS alb
                            JOIN Track AS t
                                ON a.ArtistId = alb.ArtistId
                                AND alb.AlbumId = t.AlbumId
                        GROUP BY a.ArtistId, a.Name
                        HAVING count(*) >= 20
                     )
    GROUP BY ArtistDistinctTracks.ArtistId, ArtistDistinctTracks.ArtistName
    HAVING count(*) >= 2
    ORDER BY count(*) DESC, ArtistName ASC;
