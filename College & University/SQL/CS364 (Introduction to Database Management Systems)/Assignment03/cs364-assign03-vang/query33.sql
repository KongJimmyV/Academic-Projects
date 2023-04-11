SELECT t.Name AS TrackName, 
       art.Name AS ArtistName, 
       t.Milliseconds / 1000 AS Seconds
    FROM Track AS t
        JOIN Album AS alb
        JOIN Artist AS art
            ON t.AlbumId = alb.AlbumId
                AND alb.ArtistId = art.ArtistId
    ORDER BY t.Milliseconds DESC
    LIMIT 51 OFFSET 49