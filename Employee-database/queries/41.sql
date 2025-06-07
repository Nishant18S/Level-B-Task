SELECT TOP 10 C.CustomerID, C.ContactName, SUM(OD.Quantity * OD.UnitPrice) AS TotalBusiness
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
GROUP BY C.CustomerID, C.ContactName
ORDER BY TotalBusiness DESC;