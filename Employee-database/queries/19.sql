SELECT O.OrderID, SUM(OD.Quantity * OD.UnitPrice) AS OrderTotal
FROM Orders O
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
GROUP BY O.OrderID
HAVING SUM(OD.Quantity * OD.UnitPrice) > 200;