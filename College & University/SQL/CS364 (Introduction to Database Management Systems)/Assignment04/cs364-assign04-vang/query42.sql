SELECT AlbumTotalLengths.ArtistName, count(*) AS NumAlbums, avg(AlbumTotalLengths.MillisecondsTotal) AS AvgAlbumLength
    FROM (SELECT Artist.ArtistId, Artist.Name AS ArtistName, sum(Track.Milliseconds) AS MillisecondsTotal
            FROM Artist
                JOIN Album
                JOIN Track
                    ON Artist.ArtistId = Album.ArtistId
                    AND Album.AlbumId = Track.AlbumId
            GROUP BY Album.AlbumId, Album.Title) AS AlbumTotalLengths
        NATURAL JOIN (SELECT AlbumLengths.ArtistId, max(MillisecondsTotal)
                            FROM (SELECT Artist.ArtistId, sum(Track.Milliseconds) AS MillisecondsTotal
                                    FROM Artist
                                        JOIN Album
                                        JOIN Track
                                            ON Artist.ArtistId = Album.ArtistId
                                            AND Album.AlbumId = Track.AlbumId
                                    GROUP BY Album.AlbumId, Album.Title
                                 ) AS AlbumLengths
                     ) AS AlbumMaxLength
    GROUP BY AlbumTotalLengths.ArtistId, AlbumTotalLengths.ArtistName;
