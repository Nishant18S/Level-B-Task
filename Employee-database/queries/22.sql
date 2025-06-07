SELECT C.ContactName
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.ContactName
HAVING COUNT(O.OrderID) > 3;