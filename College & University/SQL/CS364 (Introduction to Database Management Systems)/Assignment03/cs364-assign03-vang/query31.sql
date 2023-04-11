SELECT Playlist.Name, count(*) AS RockCount
    FROM Playlist 
        JOIN PlaylistTrack
        JOIN Track
        JOIN Genre
            ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
                AND PlaylistTrack.TrackId = Track.TrackId
                AND Track.GenreId = Genre.GenreId
    GROUP BY Playlist.PlaylistId, Playlist.Name
    HAVING count(*) <= 700 AND Genre.Name = 'Rock'
    ORDER BY count(*) ASC