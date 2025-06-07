SELECT C.ContactName, COUNT(O.OrderID) AS NumberOfOrders
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.ContactName;