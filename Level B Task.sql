SELECT DISTINCT CustomerID
FROM Orders
WHERE OrderDate LIKE '1997%';

UPDATE Employees SET Salary = 80000 WHERE EmployeeID = 1;   -- Nancy
UPDATE Employees SET Salary = 75000 WHERE EmployeeID = 2;   -- Andrew
UPDATE Employees SET Salary = 72000 WHERE EmployeeID = 3;   -- Janet
UPDATE Employees SET Salary = 70000 WHERE EmployeeID = 4;   -- Margaret
UPDATE Employees SET Salary = 68000 WHERE EmployeeID = 5;   -- Laura White
UPDATE Employees SET Salary = 67000 WHERE EmployeeID = 6;   -- Steve Black
UPDATE Employees SET Salary = 66000 WHERE EmployeeID = 7;   -- Olivia Green
UPDATE Employees SET Salary = 64000 WHERE EmployeeID = 8;   -- Ryan Brown
UPDATE Employees SET Salary = 63000 WHERE EmployeeID = 9;   -- David Grey
SELECT TOP 1 FirstName, LastID, Salary
FROM Employees
ORDER BY Salary DESC;

SELECT CategoryID, COUNT(*) AS ProductCount
FROM Products
GROUP BY CategoryID;

SELECT ProductName
FROM Products
WHERE SupplierID = (
  SELECT SupplierID FROM Suppliers WHERE CompanyName = 'Tokyo Traders'
);

SELECT AVG(Salary)
FROM Employees
WHERE ReportsTo = (
  SELECT EmployeeID FROM Employees WHERE FirstName = 'Nancy'
);

SELECT * FROM Orders WHERE ShipCountry = 'UK';

SELECT TOP 1 EmployeeID, COUNT(*) AS OrderCount
FROM Orders
GROUP BY EmployeeID
ORDER BY OrderCount DESC;

SELECT CustomerID, COUNT(*) AS OrderCount
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) > 1;

SELECT ProductID, SUM(UnitPrice * Quantity) AS Revenue
FROM OrderDetails
GROUP BY ProductID;

SELECT e.EmployeeID, e.FirstName, e.LastID, COUNT(DISTINCT o.CustomerID) AS CustomerCount
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastID;

SELECT TOP 1 CategoryID, COUNT(*) AS ProductCount
FROM Products
GROUP BY CategoryID
ORDER BY ProductCount DESC;

SELECT * FROM Customers WHERE City LIKE 'B%';

SELECT * FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products);


SELECT p.CategoryID, SUM(od.Quantity) AS TotalSold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.CategoryID;

SELECT DISTINCT o.CustomerID
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Chai';