
-- Returns artists and the average length of each album
SELECT Album.AlbumId, Album.Title, Artist.Name, avg(Track.Milliseconds), count(*)
    FROM Artist
        JOIN Album
        JOIN Track
            ON Artist.ArtistId = Album.ArtistId
            AND Album.AlbumId = Track.AlbumId
    GROUP BY Album.AlbumId, Album.Title;

-- Returns artists and the average length of all their albums
SELECT AlbumTotalLengths.ArtistName, count(*) AS NumAlbums, avg(AlbumTotalLengths.MillisecondsTotal)
    FROM (SELECT Album.AlbumId, 
                 Album.Title, 
                 Artist.ArtistId, 
                 Artist.Name AS ArtistName, 
                 sum(Track.Milliseconds) AS MillisecondsTotal, 
                 count(*)
            FROM Artist
                JOIN Album
                JOIN Track
                    ON Artist.ArtistId = Album.ArtistId
                    AND Album.AlbumId = Track.AlbumId
            GROUP BY Album.AlbumId, Album.Title) AS AlbumTotalLengths
    GROUP BY AlbumTotalLengths.ArtistId, AlbumTotalLengths.ArtistName;
    
-- Returns artists and the total sum of their albums lengths
SELECT Album.AlbumId, Album.Title, Artist.Name, sum(Track.Milliseconds), count(*)
    FROM Artist
        JOIN Album
        JOIN Track
            ON Artist.ArtistId = Album.ArtistId
            AND Album.AlbumId = Track.AlbumId
    GROUP BY Album.AlbumId, Album.Title;

-- Returns the artist with the longest total album length
SELECT AlbumLengths.AlbumId, AlbumLengths.Title, AlbumLengths.Name, max(TotalMilliseconds), count(*)
    FROM (SELECT Album.AlbumId, Album.Title, Artist.Name, sum(Track.Milliseconds) AS TotalMilliseconds, count(*)
            FROM Artist
                JOIN Album
                JOIN Track
                    ON Artist.ArtistId = Album.ArtistId
                    AND Album.AlbumId = Track.AlbumId
            GROUP BY Album.AlbumId, Album.Title) AS AlbumLengths;

-- Returns the artist ID that has the longest total album length
SELECT AlbumMaxLength.ArtistId
    FROM (SELECT AlbumLengths.ArtistId, max(MillisecondsTotal)
            FROM (SELECT Artist.ArtistId, sum(Track.Milliseconds) AS MillisecondsTotal
                    FROM Artist
                        JOIN Album
                        JOIN Track
                            ON Artist.ArtistId = Album.ArtistId
                            AND Album.AlbumId = Track.AlbumId
                    GROUP BY Album.AlbumId, Album.Title
                 ) AS AlbumLengths
         ) AS AlbumMaxLength;

-- (IN clause) Returns the average length of the albums sung by the artist who sang the album with the longest total length.
SELECT AlbumTotalLengths.ArtistName, count(*) AS NumAlbums, avg(AlbumTotalLengths.MillisecondsTotal) AS AvgAlbumLength
    FROM (SELECT Artist.ArtistId, Artist.Name AS ArtistName, sum(Track.Milliseconds) AS MillisecondsTotal
            FROM Artist
                JOIN Album
                JOIN Track
                    ON Artist.ArtistId = Album.ArtistId
                    AND Album.AlbumId = Track.AlbumId
            GROUP BY Album.AlbumId, Album.Title) AS AlbumTotalLengths
    WHERE AlbumTotalLengths.ArtistId 
        IN (SELECT AlbumMaxLength.ArtistId
                FROM (SELECT AlbumLengths.ArtistId, max(MillisecondsTotal)
                        FROM (SELECT Artist.ArtistId, sum(Track.Milliseconds) AS MillisecondsTotal
                                FROM Artist
                                    JOIN Album
                                    JOIN Track
                                        ON Artist.ArtistId = Album.ArtistId
                                        AND Album.AlbumId = Track.AlbumId
                                GROUP BY Album.AlbumId, Album.Title
                             ) AS AlbumLengths
                     ) AS AlbumMaxLength
           )
    GROUP BY AlbumTotalLengths.ArtistId, AlbumTotalLengths.ArtistName;

-- (EXISTS clause) Returns the average length of the albums sung by the artist who sang the album with the longest total length.
SELECT AlbumTotalLengths.ArtistName, count(*) AS NumAlbums, avg(AlbumTotalLengths.MillisecondsTotal) AS AvgAlbumLength
    FROM (SELECT Artist.ArtistId, Artist.Name AS ArtistName, sum(Track.Milliseconds) AS MillisecondsTotal
            FROM Artist
                JOIN Album
                JOIN Track
                    ON Artist.ArtistId = Album.ArtistId
                    AND Album.AlbumId = Track.AlbumId
            GROUP BY Album.AlbumId, Album.Title) AS AlbumTotalLengths
    WHERE EXISTS (SELECT AlbumMaxLength.ArtistId
                    FROM (SELECT AlbumLengths.ArtistId, max(MillisecondsTotal)
                            FROM (SELECT Artist.ArtistId, sum(Track.Milliseconds) AS MillisecondsTotal
                                    FROM Artist
                                        JOIN Album
                                        JOIN Track
                                            ON Artist.ArtistId = Album.ArtistId
                                            AND Album.AlbumId = Track.AlbumId
                                    GROUP BY Album.AlbumId, Album.Title
                                 ) AS AlbumLengths
                         ) AS AlbumMaxLength
                    WHERE AlbumMaxLength.ArtistId = AlbumTotalLengths.ArtistId
                 )
    GROUP BY AlbumTotalLengths.ArtistId, AlbumTotalLengths.ArtistName;

-- (NATURAL JOIN clause)
--      Returns the average length of the albums sung by the artist who sang the album with the longest total length.
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
