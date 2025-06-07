-- Insert data into Customers
INSERT INTO Customers VALUES
('ALFKI', 'Maria Anders', 'Berlin', 'Germany', NULL),
('ANATR', 'Ana Trujillo', 'Mexico City', 'Mexico', NULL),
('ANTON', 'Antonio Moreno', 'Mexico City', 'Mexico', NULL),
('AROUT', 'Thomas Hardy', 'London', 'UK', NULL),
('BERGS', 'Christina Berglund', 'Luleå', 'Sweden', NULL),
('BLAUS', 'Hanna Moos', 'Mannheim', 'Germany', NULL),
('C001', 'Emily Carter', 'London', NULL, NULL);

-- Insert data into Employees
INSERT INTO Employees VALUES
(1, 'Nancy', 101, NULL),
(2, 'Andrew', 102, 1),
(3, 'Janet', 103, 1),
(4, 'Margaret', 104, 2);

-- Insert data into Suppliers
INSERT INTO Suppliers VALUES
(1, 'Exotic Liquids'),
(2, 'New Orleans Cajun Delights'),
(3, 'Grandma Kelly’s Homestead'),
(4, 'Tokyo Traders'),
(5, 'Specialty Biscuits, Ltd.');

-- Insert data into Categories
INSERT INTO Categories VALUES
(1, 'Beverages'),
(2, 'Condiments'),
(3, 'Confections'),
(7, 'Produce');

-- Insert data into Products
INSERT INTO Products VALUES
(1, 'Chai', 1, 1, 18.00, 39, 0, 0),
(2, 'Chang', 1, 1, 19.00, 17, 40, 0),
(3, 'Aniseed Syrup', 1, 2, 10.00, 13, 70, 0),
(4, 'Tofu', 2, 7, 23.25, 35, 0, 0),
(5, 'Manjimup Dried Apples', 3, 7, 53.00, 0, 0, 1),
(6, 'Pavlova', 4, 3, 17.45, 29, 20, 0);

-- Insert data into Orders
INSERT INTO Orders VALUES
(1001, 'C001', 2, '2024-06-01', 'UK', 'E1 6AN'),
(10248, 'ALFKI', 1, '1996-07-04', 'UK', 'W1 1AA'),
(10252, 'AROUT', 1, '1997-01-10', 'UK', 'WC1N 3AX'),
(10253, 'C001', 2, '2024-06-02', 'UK', 'E2 7PL'),
(10254, 'ANATR', 3, '1997-06-15', 'Mexico', '01000'),
(10255, 'BERGS', 1, '1997-07-01', 'France', '75000');

-- Insert data into OrderDetails
INSERT INTO OrderDetails VALUES
(10248, 1, 12, 18.00),
(10252, 4, 300, 23.25),
(10254, 4, 200, 23.25),
(10255, 5, 50, 53.00),
(10255, 6, 30, 17.45);
