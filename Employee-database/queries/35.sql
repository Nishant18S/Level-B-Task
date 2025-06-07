SELECT ProductID, ProductName
FROM Products
WHERE UnitsInStock < 10 AND UnitsOnOrder = 0;