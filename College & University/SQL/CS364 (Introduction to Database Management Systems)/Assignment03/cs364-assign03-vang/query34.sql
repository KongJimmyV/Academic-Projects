SELECT Name AS TrackName, Milliseconds / 1000 AS Seconds
    FROM Track
    WHERE Seconds > (SELECT SubTrack.Milliseconds / 1000 AS SubTrackSeconds
                       FROM Invoice
                           NATURAL JOIN InvoiceLine
                           NATURAL JOIN Track AS SubTrack
                       GROUP BY SubTrack.Name
                       ORDER BY count(*) DESC, SubTrack.Milliseconds DESC
                       LIMIT 1)
    ORDER BY Seconds ASC