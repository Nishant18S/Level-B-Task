SELECT P.ProductName, SUM(OD.Quantity * OD.UnitPrice) AS TotalRevenue
FROM Products P
JOIN OrderDetails OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductName
ORDER BY TotalRevenue DESC;