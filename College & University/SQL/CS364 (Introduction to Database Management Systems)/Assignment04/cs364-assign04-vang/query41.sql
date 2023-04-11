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
