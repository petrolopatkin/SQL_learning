-- SQL Practice with some back-end queries
use python_sql;
-- Task 1 find all items from category 'Electronics' where price is more than 50
SELECT 
name as ProductName, 
category as ProductCategory,
price as ProductPrice
FROM products
WHERE category = 'Electronics' AND price > 50
ORDER BY price DESC;

-- Task 2 Show all client's history of purchases, but only those clients, who have at least 1 purchase and sort them by date
SELECT 
c.name as ClientName,
o.id as OrderId,
o.order_date as OrderDate
FROM customers c
JOIN orders o 
	ON c.id = o.customer_id
ORDER BY o.order_date DESC;

-- Task 3 find every client and how much orders every one of them did
SELECT 
c.name as CustomerName,
COUNT(o.id) as OrdersCount
FROM customers c 
LEFT JOIN orders o
	ON c.id = o.customer_id
GROUP BY c.id, c.name;

-- Task 4 find every customer who did more than 1 order
SELECT 
c.name as CustomerName,
COUNT(o.id) as OrdersCount
FROM customers c
JOIN orders o
	ON c.id = o.customer_id
GROUP BY c.id, c.name
HAVING COUNT(o.id) > 1
ORDER BY COUNT(o.id) DESC;

-- Task 5 find how much costs every order
WITH TotalSpentOnOrder AS(
SELECT 
o.id as OrderID,
o.order_date as OrderDate,
SUM(p.price * oi.quantity) as OrderTotal
FROM order_items oi
JOIN products p
	ON oi.product_id = p.id
JOIN orders o
	ON oi.order_id = o.id
GROUP BY o.id, o.order_date)
SELECT *
FROM TotalSpentOnOrder
ORDER BY OrderTotal DESC;

-- Find all clients and how much they spent
WITH TotalClients AS(
SELECT 
c.name as CustomerName,
COALESCE(SUM(p.price * oi.quantity), 0) as TotalSpent
FROM customers c
LEFT JOIN orders o 
	ON c.id = o.customer_id
LEFT JOIN order_items oi
	ON o.id = oi.order_id
LEFT JOIN products p
	ON p.id = oi.product_id
GROUP BY c.id, c.name)
SELECT *
FROM TotalClients
ORDER BY TotalSpent DESC