SELECT E.EmployeeID, E.FirstName + ' ' + E.LastID AS EmployeeName,
       SUM(OD.Quantity * OD.UnitPrice) AS TotalSales
FROM Employees E
JOIN Orders O ON E.EmployeeID = O.EmployeeID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
GROUP BY E.EmployeeID, E.FirstName, E.LastID;