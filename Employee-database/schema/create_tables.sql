-- Create the Employee database
CREATE DATABASE Employee;
GO

USE Employee;
GO

-- Create Customers table
CREATE TABLE Customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    ContactName VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50),
    Fax VARCHAR(50)
);

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastID INT,
    ReportsTo INT FOREIGN KEY REFERENCES Employees(EmployeeID)
);

-- Create Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    CompanyName VARCHAR(100)
);

-- Create Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    SupplierID INT FOREIGN KEY REFERENCES Suppliers(SupplierID),
    CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID),
    UnitPrice DECIMAL(10,2),
    UnitsInStock INT,
    UnitsOnOrder INT,
    Discontinued BIT
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(10) FOREIGN KEY REFERENCES Customers(CustomerID),
    EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    OrderDate DATE,
    ShipCountry VARCHAR(50),
    ShipPostalCode VARCHAR(20)
);

-- Create OrderDetails table
CREATE TABLE OrderDetails (
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    PRIMARY KEY (OrderID, ProductID)
);
