SELECT FirstName, LastName, round(sum(UnitPrice), 2) AS TotalSpent
    FROM Customer 
        NATURAL JOIN Invoice
        NATURAL JOIN InvoiceLine
        NATURAL JOIN Track
    GROUP BY FirstName, LastName
    ORDER BY TotalSpent DESC, LastName ASC