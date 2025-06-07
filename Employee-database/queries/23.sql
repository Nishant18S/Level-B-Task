SELECT DISTINCT P.ProductID, P.ProductName
FROM Products P
JOIN OrderDetails OD ON P.ProductID = OD.ProductID
JOIN Orders O ON OD.OrderID = O.OrderID
WHERE P.Discontinued = 1
  AND O.OrderDate BETWEEN '1997-01-01' AND '1998-01-01';