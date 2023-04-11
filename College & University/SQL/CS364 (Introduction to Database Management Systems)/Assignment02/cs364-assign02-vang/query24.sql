SELECT c.FirstName, c.LastName, t.Name
    FROM Customer AS c 
        JOIN Invoice AS i
        JOIN InvoiceLine AS iLine
        JOIN Track AS t
            ON c.CustomerId = i.CustomerId
                AND i.InvoiceId = iLine.InvoiceId
                AND iLine.TrackId = t.TrackId
    WHERE t.Name LIKE 'The %';
    