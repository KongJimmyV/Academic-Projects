SELECT Employee.FirstName, Employee.LastName, Employee.Title, 
       s.FirstName AS SuperFirst, s.LastName AS SuperLast, s.Title AS SuperTitle
    FROM Employee LEFT JOIN Employee AS s
        ON Employee.ReportsTo = s.EmployeeId;
        