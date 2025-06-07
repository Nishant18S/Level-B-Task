SELECT E.EmployeeID, E.FirstName + ' ' + E.LastID AS ManagerName,
       COUNT(S.EmployeeID) AS ReportsCount
FROM Employees E
JOIN Employees S ON S.ReportsTo = E.EmployeeID
GROUP BY E.EmployeeID, E.FirstName, E.LastID
HAVING COUNT(S.EmployeeID) > 4;