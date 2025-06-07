SELECT TOP 10 O.ShipCountry, SUM(OD.Quantity * OD.UnitPrice) AS TotalSales
FROM Orders O
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
GROUP BY O.ShipCountry
ORDER BY TotalSales DESC;