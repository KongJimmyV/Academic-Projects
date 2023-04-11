SELECT Artist.Name AS ArtistName, count(*) AS NumAlbums
    FROM Artist
        NATURAL JOIN Album
    GROUP BY Artist.ArtistId, Artist.Name
    HAVING count(*) >= 5 
        AND (SELECT sum(Milliseconds)
               FROM Artist AS art
                   JOIN Album AS alb
                   JOIN Track AS t
                       ON alb.ArtistId = art.ArtistId
                       AND t.AlbumId = alb.AlbumId
               WHERE Artist.ArtistId = art.ArtistId) > 2500000