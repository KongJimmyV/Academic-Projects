SELECT art.Name AS ArtistName, alb.Title, t.Name AS TrackName 
    FROM Artist AS art 
        JOIN Album AS alb
        JOIN Track AS t
            ON art.ArtistId = alb.ArtistId
                AND alb.AlbumId = t.TrackId
                AND alb.Title = t.TrackName
    WHERE t.Name = alb.Title;
    