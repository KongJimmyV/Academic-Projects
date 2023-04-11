SELECT art.Name AS ArtistName, count(DISTINCT t.AlbumId) AS NumAlbums
    FROM Artist AS art
        JOIN Album AS alb
        JOIN Track AS t
            ON alb.ArtistId = art.ArtistId
                AND t.AlbumId = alb.AlbumId
    GROUP BY art.ArtistId, art.Name
    HAVING count(DISTINCT t.AlbumId) >= 5 AND sum(Milliseconds) > 2500000
    
SELECT ArtistName, NumAlbums
    FROM (SELECT DISTINCT art.Name AS ArtistName, count(*) AS NumAlbums, t.Milliseconds AS Milliseconds
            FROM Artist AS art
                JOIN Album AS alb
                JOIN Track AS t
                    ON alb.ArtistId = art.ArtistId
                    AND t.AlbumId = alb.AlbumId
            GROUP BY alb.AlbumId, alb.Title
            HAVING count(*) >= 5)
    GROUP BY ArtistName
    HAVING sum(Milliseconds) > 2500000

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