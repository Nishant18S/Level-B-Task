SELECT E.FirstName, E.LastID,
       M.FirstName AS SupervisorFirstName, M.LastID AS SupervisorLastName
FROM Employees E
LEFT JOIN Employees M ON E.ReportsTo = M.EmployeeID;