
-- Step 1: Basic SELECT Queries
SELECT * FROM customers;
SELECT ProductName, UnitPrice FROM products;

-- Step 2: Filtering Data with WHERE
SELECT * FROM customers WHERE Country = 'India';
SELECT * FROM products WHERE UnitPrice > 500;

-- Step 3: Sorting with ORDER BY
SELECT * FROM products ORDER BY UnitPrice DESC;

-- Step 4: Aggregation with GROUP BY
SELECT CustomerID, COUNT(*) AS TotalOrders
FROM orders
GROUP BY CustomerID;

SELECT ProductID, SUM(Quantity) AS TotalSold
FROM order_details
GROUP BY ProductID;

-- Step 5: JOINs
SELECT o.OrderID, c.CustomerName, o.OrderDate
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID;

SELECT p.ProductName, s.SupplierName, c.CategoryName
FROM products p
JOIN suppliers s ON p.SupplierID = s.SupplierID
JOIN categories c ON p.CategoryID = c.CategoryID;

-- Step 6: Subqueries
SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice > (
    SELECT AVG(UnitPrice) FROM products
);

-- Step 7: Aggregate Functions
SELECT CategoryID, AVG(UnitPrice) AS AvgPrice
FROM products
GROUP BY CategoryID;

-- Step 8: Create Views
CREATE VIEW product_sales_summary AS
SELECT p.ProductName, SUM(od.Quantity) AS TotalSold, SUM(od.Quantity * od.UnitPrice) AS Revenue
FROM order_details od
JOIN products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;

-- Step 9: Optimize with Indexes
CREATE INDEX idx_orderdate ON orders(OrderDate);
