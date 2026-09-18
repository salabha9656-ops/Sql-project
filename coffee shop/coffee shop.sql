-- =========================================
-- COFFEE SHOP MANAGEMENT SYSTEM
-- =========================================

-- Create Database
CREATE DATABASE CoffeeShopDB;

-- Use Database
USE CoffeeShopDB;


-- =========================================
-- 1. CREATE PRODUCTS TABLE
-- =========================================

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);


-- =========================================
-- 2. CREATE CUSTOMER TABLE
-- =========================================

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    City VARCHAR(50)
);


-- =========================================
-- 3. CREATE ORDERS TABLE
-- =========================================

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    
    CustomerID INT,
    ProductID INT,
    
    Quantity INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),

    -- Foreign Key: Customer
    FOREIGN KEY (CustomerID)
    REFERENCES Customer(CustomerID),

    -- Foreign Key: Product
    FOREIGN KEY (ProductID)
    REFERENCES Products(ProductID)
);


-- =========================================
-- INSERT 10 PRODUCTS
-- =========================================

INSERT INTO Products
(ProductID, ProductName, Category, Price, Stock)
VALUES
(1, 'Espresso', 'Coffee', 120.00, 50),
(2, 'Cappuccino', 'Coffee', 150.00, 40),
(3, 'Latte', 'Coffee', 160.00, 45),
(4, 'Americano', 'Coffee', 130.00, 35),
(5, 'Cold Coffee', 'Beverage', 180.00, 30),
(6, 'Mocha', 'Coffee', 170.00, 25),
(7, 'Green Tea', 'Tea', 100.00, 40),
(8, 'Chocolate Cake', 'Dessert', 200.00, 20),
(9, 'Blueberry Muffin', 'Bakery', 140.00, 25),
(10, 'Chicken Sandwich', 'Food', 220.00, 15);


-- =========================================
-- INSERT 10 CUSTOMERS
-- =========================================

INSERT INTO Customer
(CustomerID, CustomerName, Phone, Email, City)
VALUES
(1, 'Arun Kumar', '9876543210', 'arun@gmail.com', 'Kochi'),
(2, 'Meera Nair', '9876543211', 'meera@gmail.com', 'Thrissur'),
(3, 'Rahul Menon', '9876543212', 'rahul@gmail.com', 'Kozhikode'),
(4, 'Anjali Thomas', '9876543213', 'anjali@gmail.com', 'Kottayam'),
(5, 'Vishnu Raj', '9876543214', 'vishnu@gmail.com', 'Kannur'),
(6, 'Sneha Joseph', '9876543215', 'sneha@gmail.com', 'Ernakulam'),
(7, 'Akhil Varma', '9876543216', 'akhil@gmail.com', 'Alappuzha'),
(8, 'Fathima Ali', '9876543217', 'fathima@gmail.com', 'Malappuram'),
(9, 'Nikhil Das', '9876543218', 'nikhil@gmail.com', 'Palakkad'),
(10, 'Divya Krishnan', '9876543219', 'divya@gmail.com', 'Kollam');


-- =========================================
-- INSERT 10 ORDERS
-- =========================================

INSERT INTO Orders
(OrderID, CustomerID, ProductID, Quantity, OrderDate, TotalAmount)
VALUES
(1, 1, 2, 2, '2026-09-01', 300.00),
(2, 2, 3, 1, '2026-09-02', 160.00),
(3, 3, 1, 3, '2026-09-03', 360.00),
(4, 4, 5, 2, '2026-09-04', 360.00),
(5, 5, 8, 1, '2026-09-05', 200.00),
(6, 6, 6, 2, '2026-09-06', 340.00),
(7, 7, 10, 1, '2026-09-07', 220.00),
(8, 8, 7, 2, '2026-09-08', 200.00),
(9, 9, 9, 3, '2026-09-09', 420.00),
(10, 10, 4, 2, '2026-09-10', 260.00);


-- =========================================
-- DISPLAY PRODUCTS
-- =========================================

SELECT * FROM Products;


-- =========================================
-- DISPLAY CUSTOMERS
-- =========================================

SELECT * FROM Customer;


-- =========================================
-- DISPLAY ORDERS
-- =========================================

SELECT * FROM Orders;


-- =========================================
-- JOIN ALL 3 TABLES
-- =========================================

SELECT
    o.OrderID,
    c.CustomerID,
    c.CustomerName,
    p.ProductID,
    p.ProductName,
    p.Category,
    p.Price,
    o.Quantity,
    o.OrderDate,
    o.TotalAmount
FROM Orders o
JOIN Customer c
    ON o.CustomerID = c.CustomerID
JOIN Products p
    ON o.ProductID = p.ProductID;


-- =========================================
-- FOREIGN KEY RELATIONSHIP
-- =========================================

-- CustomerID in Orders references CustomerID in Customer
-- ProductID in Orders references ProductID in Products

