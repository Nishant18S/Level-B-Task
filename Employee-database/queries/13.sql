SELECT OrderID, AVG(CAST(Quantity AS FLOAT)) AS AvgQuantity
FROM OrderDetails
GROUP BY OrderID;