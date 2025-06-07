SELECT P.ProductName, C.CategoryName
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
JOIN Suppliers S ON P.SupplierID = S.SupplierID
WHERE S.CompanyName = 'Specialty Biscuits, Ltd.';