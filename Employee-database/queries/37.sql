SELECT E.EmployeeID, E.FirstName + ' ' + E.LastID AS EmployeeName,
       COUNT(O.OrderID) AS NumberOfOrders
FROM Employees E
JOIN Orders O ON E.EmployeeID = O.EmployeeID
WHERE O.CustomerID BETWEEN 'A' AND 'AO'
GROUP BY E.EmployeeID, E.FirstName, E.LastID;