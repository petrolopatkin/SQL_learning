-- SQL practice in order to not forget syntax

-- Task 1 Find all customers from Slovakia and their orders with id and date
SELECT 
c.name as CustomerName,
o.id as OrderId,
o.order_date as OrderDate,
c.country as Country
FROM orders o
LEFT JOIN customers c 
	ON o.customer_id = c.id
WHERE c.country = 'Slovakia'
ORDER BY o.order_date;

-- Task 2 Find all customers and how much they spent
SELECT 
c.name as CustomerName,
SUM(oi.quantity * p.price) as TotalSpent
FROM order_items oi
LEFT JOIN orders o 
	ON oi.order_id = o.id
LEFT JOIN products p 
	ON oi.product_id = p.id
LEFT JOIN customers c 
	ON o.customer_id = c.id
GROUP BY c.name
ORDER BY TotalSpent DESC;

-- Task 3 Find all items and how much they a shop earned on each of them
SELECT 
p.name as ProductName,
SUM(oi.quantity) as UnitsSold,
SUM(oi.quantity * p.price) as TotalRevenue
FROM order_items oi
JOIN products p
	ON oi.product_id = p.id
GROUP BY ProductName
ORDER BY TotalRevenue DESC;

-- Task 4 Find all customers who spent at least 100 euro
SELECT 
c.name as CustomerName,
SUM(oi.quantity * p.price) as TotalSpent
FROM order_items oi
LEFT JOIN orders o 
	ON oi.order_id = o.id
LEFT JOIN products p 
	ON oi.product_id = p.id
LEFT JOIN customers c 
	ON o.customer_id = c.id
GROUP BY c.name
HAVING TotalSpent > 100
ORDER BY TotalSpent DESC;

-- Task 5 find all categories of products and revenue for each of them
SELECT 
p.category as CategoryName,
SUM(oi.quantity) as UnitsSold,
SUM(oi.quantity * p.price) as TotalRevenue
FROM order_items oi
JOIN products p
	ON oi.product_id = p.id
GROUP BY CategoryName
ORDER BY TotalRevenue DESC;

-- Task 6  Find all registered cutomers who haven't bought anything yet
SELECT 
c.name CustomerName
FROM customers c 
LEFT JOIN orders o
	ON o.customer_id = c.id
WHERE o.id is NULL;

-- Task 7 Find all items in catalog which weren't sold yet
SELECT
p.name as ProductName,
p.category as CategoryName
FROM products p
LEFT JOIN order_items oi
	ON p.id = oi.product_id
WHERE oi.id is NULL;

-- Task 8 Find all the items more expensive than average price 
SELECT 
name as ProductName,
category as Category, 
price as Price
FROM products
WHERE price > (SELECT 
AVG(price) as AveragePrice
FROM products
)
ORDER BY price DESC;

-- Task 9 Catalog pagination (Example SQL for Backend)
SELECT
id, name, price
FROM products
ORDER BY id ASC
LIMIT 3, 3;

-- Task 10 Find all items from category Electronics with price between 30 and 100(another backend example)
SELECT 
id, 
name as ProductName,
category as CategoryName,
price as Price
FROM products
WHERE category = "Electronics" and price BETWEEN 30 AND 100
ORDER BY price ASC