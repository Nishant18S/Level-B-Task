SELECT * FROM Sales_Customer;

SELECT * FROM Sales_Customer
WHERE CompanyName LIKE '%N';

SELECT * FROM Person_Address
WHERE City IN ('Berlin', 'London');

SELECT * FROM Person_CountryRegion
WHERE Name IN ('United Kingdom', 'United States');

SELECT * FROM Production_Product
ORDER BY Name ASC;

SELECT * FROM Production_Product
WHERE Name LIKE 'A%';

SELECT DISTINCT c.CustomerID, c.CompanyName
FROM Sales_Customer c
JOIN Sales_SalesOrderHeader s
ON c.CustomerID = s.CustomerID;

SELECT DISTINCT C.CustomerID, C.ContactName
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
WHERE C.City = 'London' AND P.ProductName = 'Chai';

SELECT CustomerID, ContactName
FROM Customers
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders);

SELECT DISTINCT C.CustomerID, C.ContactName
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.ProductName = 'Tofu';

SELECT TOP 1 *
FROM Orders
ORDER BY OrderDate ASC, OrderID ASC;

SELECT TOP 1 O.OrderDate, SUM(OD.Quantity * OD.UnitPrice) AS OrderTotal
FROM Orders O
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
GROUP BY O.OrderID, O.OrderDate
ORDER BY OrderTotal DESC;

SELECT OrderID, AVG(CAST(Quantity AS FLOAT)) AS AvgQuantity
FROM OrderDetails
GROUP BY OrderID;

SELECT OrderID, MIN(Quantity) AS MinQuantity, MAX(Quantity) AS MaxQuantity
FROM OrderDetails
GROUP BY OrderID;

SELECT E.EmployeeID AS ManagerID, E.FirstName + ' ' + E.LastID AS ManagerName,
       COUNT(S.EmployeeID) AS ReportsCount
FROM Employees E
LEFT JOIN Employees S ON S.ReportsTo = E.EmployeeID
GROUP BY E.EmployeeID, E.FirstName, E.LastID
HAVING COUNT(S.EmployeeID) > 0;

SELECT OrderID, SUM(Quantity) AS TotalQuantity
FROM OrderDetails
GROUP BY OrderID
HAVING SUM(Quantity) > 300;

SELECT * FROM Orders
WHERE OrderDate >= '1996-12-31';

SELECT * FROM Orders
WHERE ShipCountry = 'Canada';

SELECT O.OrderID, SUM(OD.Quantity * OD.UnitPrice) AS OrderTotal
FROM Orders O
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
GROUP BY O.OrderID
HAVING SUM(OD.Quantity * OD.UnitPrice) > 200;

SELECT O.ShipCountry, SUM(OD.Quantity * OD.UnitPrice) AS TotalSales
FROM Orders O
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
GROUP BY O.ShipCountry;

SELECT C.ContactName, COUNT(O.OrderID) AS NumberOfOrders
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.ContactName;

SELECT C.ContactName
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.ContactName
HAVING COUNT(O.OrderID) > 3;

SELECT DISTINCT P.ProductID, P.ProductName
FROM Products P
JOIN OrderDetails OD ON P.ProductID = OD.ProductID
JOIN Orders O ON OD.OrderID = O.OrderID
WHERE P.Discontinued = 1
  AND O.OrderDate BETWEEN '1997-01-01' AND '1998-01-01';

SELECT E.FirstName, E.LastID,
       M.FirstName AS SupervisorFirstName, M.LastID AS SupervisorLastName
FROM Employees E
LEFT JOIN Employees M ON E.ReportsTo = M.EmployeeID;

SELECT E.EmployeeID, E.FirstName + ' ' + E.LastID AS EmployeeName,
       SUM(OD.Quantity * OD.UnitPrice) AS TotalSales
FROM Employees E
JOIN Orders O ON E.EmployeeID = O.EmployeeID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
GROUP BY E.EmployeeID, E.FirstName, E.LastID;

SELECT EmployeeID, FirstName, LastID
FROM Employees
WHERE FirstName LIKE '%a%';

SELECT E.EmployeeID, E.FirstName + ' ' + E.LastID AS ManagerName,
       COUNT(S.EmployeeID) AS ReportsCount
FROM Employees E
JOIN Employees S ON S.ReportsTo = E.EmployeeID
GROUP BY E.EmployeeID, E.FirstName, E.LastID
HAVING COUNT(S.EmployeeID) > 4;

SELECT O.OrderID, P.ProductName
FROM Orders O
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID;

WITH BestCustomer AS (
    SELECT TOP 1 WITH TIES CustomerID
    FROM Orders
    GROUP BY CustomerID
    ORDER BY COUNT(OrderID) DESC
)
SELECT *
FROM Orders
WHERE CustomerID IN (SELECT CustomerID FROM BestCustomer);

SELECT O.*
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE C.Fax IS NULL OR LTRIM(RTRIM(C.Fax)) = '';

SELECT DISTINCT O.ShipPostalCode
FROM Orders O
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.ProductName = 'Tofu';

SELECT DISTINCT P.ProductName
FROM Orders O
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
WHERE O.ShipCountry = 'France';

SELECT P.ProductName, C.CategoryName
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
JOIN Suppliers S ON P.SupplierID = S.SupplierID
WHERE S.CompanyName = 'Specialty Biscuits, Ltd.';

SELECT ProductID, ProductName
FROM Products
WHERE ProductID NOT IN (SELECT DISTINCT ProductID FROM OrderDetails);

SELECT ProductID, ProductName
FROM Products
WHERE UnitsInStock < 10 AND UnitsOnOrder = 0;

SELECT TOP 10 O.ShipCountry, SUM(OD.Quantity * OD.UnitPrice) AS TotalSales
FROM Orders O
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
GROUP BY O.ShipCountry
ORDER BY TotalSales DESC;

SELECT E.EmployeeID, E.FirstName + ' ' + E.LastID AS EmployeeName,
       COUNT(O.OrderID) AS NumberOfOrders
FROM Employees E
JOIN Orders O ON E.EmployeeID = O.EmployeeID
WHERE O.CustomerID BETWEEN 'A' AND 'AO'
GROUP BY E.EmployeeID, E.FirstName, E.LastID;


SELECT TOP 1 O.OrderDate, SUM(OD.Quantity * OD.UnitPrice) AS OrderTotal
FROM Orders O
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
GROUP BY O.OrderID, O.OrderDate
ORDER BY OrderTotal DESC;

SELECT P.ProductName, SUM(OD.Quantity * OD.UnitPrice) AS TotalRevenue
FROM Products P
JOIN OrderDetails OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductName
ORDER BY TotalRevenue DESC;

SELECT SupplierID, COUNT(ProductID) AS NumberOfProducts
FROM Products
GROUP BY SupplierID;

SELECT TOP 10 C.CustomerID, C.ContactName, SUM(OD.Quantity * OD.UnitPrice) AS TotalBusiness
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
GROUP BY C.CustomerID, C.ContactName
ORDER BY TotalBusiness DESC;

SELECT SUM(OD.Quantity * OD.UnitPrice) AS TotalRevenue
FROM OrderDetails OD;