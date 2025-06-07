SELECT DISTINCT c.CustomerID, c.CompanyName
FROM Sales_Customer c
JOIN Sales_SalesOrderHeader s
ON c.CustomerID = s.CustomerID;