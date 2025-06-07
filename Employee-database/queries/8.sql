SELECT DISTINCT C.CustomerID, C.ContactName
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
WHERE C.City = 'London' AND P.ProductName = 'Chai';