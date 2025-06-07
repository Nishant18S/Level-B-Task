SELECT TOP 1 O.OrderDate, SUM(OD.Quantity * OD.UnitPrice) AS OrderTotal
FROM Orders O
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
GROUP BY O.OrderID, O.OrderDate
ORDER BY OrderTotal DESC;