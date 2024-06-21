/*
This file contains a script of Transact SQL (T-SQL) command to interact with a database named 'Inventory'.
Requirements:
- SQL Server 2022 is installed and running
- database 'Inventory' already exists.
Details:
- if the database 'Inventory' does not exist, the script will print an error message and exit.
- Sets the default database to 'Inventory'.
- Creates a 'categories' table and related 'products' table if they do not already exist.
- Remove all rows from the products table and categories table.
- Populates the 'Categories' table with sample data.
- Populates the 'Products' table with sample data.
- Creates stored procedures to get all categories.
- Creates a stored procedure to get all products in a specific category.
- Creates a stored procudure to get all products in a specific price range sorted by price in ascending order.
*/

-- Check if the database 'Inventory' exists
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'Inventory')
BEGIN
    PRINT 'Database Inventory exists.'
END
ELSE
BEGIN
    PRINT 'Error: Database Inventory does not exist.'
    RETURN
END

-- Set the default database to 'Inventory'
USE Inventory
GO

-- Create the 'Categories' table if it does not exist.
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Categories')
BEGIN
    CREATE TABLE Categories (
        CategoryID INT PRIMARY KEY,
        CategoryName NVARCHAR(50) NOT NULL,
        -- Description of the category
        Description NVARCHAR(255)
    )
    PRINT 'Table Categories created.'
END

-- Create the 'Products' table if it does not exist.
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Products')
BEGIN
    CREATE TABLE Products (
        ProductID INT PRIMARY KEY,
        ProductName NVARCHAR(50) NOT NULL,
        CategoryID INT NOT NULL,
        UnitPrice DECIMAL(10, 2) NOT NULL,
        UnitsInStock INT NOT NULL,
        -- add a created date column
        CreatedDate DATETIME DEFAULT GETDATE(),
        -- add a modified date column
        ModifiedDate DATETIME DEFAULT GETDATE(),
        FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
    )
    PRINT 'Table Products created.'
END

-- Remove all rows from the products table and categories table.
TRUNCATE TABLE Products
TRUNCATE TABLE Categories

-- Populate the 'Categories' table with sample data.
INSERT INTO Categories (CategoryID, CategoryName, Description)
VALUES (1, 'Electronics', 'Electronic devices and accessories'),
       (2, 'Clothing', 'Clothing items and accessories'),
       (3, 'Home & Garden', 'Home and garden products'),
       (4, 'Toys & Games', 'Toys and games for all ages')

-- Populate the 'Products' table with sample data.
INSERT INTO Products (ProductID, ProductName, CategoryID, UnitPrice, UnitsInStock)
VALUES (101, 'Smartphone', 1, 599.99, 50),
       (102, 'Laptop', 1, 999.99, 30),
       (103, 'T-shirt', 2, 19.99, 100),
       (104, 'Jeans', 2, 39.99, 50),
       (105, 'Sofa', 3, 499.99, 20),
       (106, 'Dining Table', 3, 299.99, 10),
       (107, 'Board Game', 4, 29.99, 50),
       (108, 'Action Figure', 4, 9.99, 100)

-- Create a stored procedure to get all categories.
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'GetAllCategories')
BEGIN
    DROP PROCEDURE GetAllCategories
END

CREATE PROCEDURE GetAllCategories
AS
BEGIN
    SELECT * FROM Categories
END

-- Create a stored procedure to get all products in a specific category.
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'GetProductsByCategory')
BEGIN
    DROP PROCEDURE GetProductsByCategory
END

CREATE PROCEDURE GetProductsByCategory
    @CategoryID INT
AS
BEGIN
    SELECT * FROM Products WHERE CategoryID = @Category
END

-- Create a stored procedure to get all products in a specific price range sorted by price in ascending order.
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'GetProductsByPriceRange')
BEGIN
    DROP PROCEDURE GetProductsByPriceRange
END

CREATE PROCEDURE GetProductsByPriceRange
    @MinPrice DECIMAL(10, 2),
    @MaxPrice DECIMAL(10, 2)
AS
BEGIN
    SELECT * FROM Products WHERE UnitPrice BETWEEN @MinPrice AND @MaxPrice ORDER BY UnitPrice ASC
END

PRINT 'Inventory database setup completed.'





