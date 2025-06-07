WITH BestCustomer AS (
    SELECT TOP 1 WITH TIES CustomerID
    FROM Orders
    GROUP BY CustomerID
    ORDER BY COUNT(OrderID) DESC
)
SELECT *
FROM Orders
WHERE CustomerID IN (SELECT CustomerID FROM BestCustomer);