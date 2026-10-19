-- Light SQL practice
-- Task 1 Show a client with id = 1 all his orders adn their dates
SELECT 
o.id as OrderId,
o.order_date as OrderDate,
c.name as CustomerName
FROM customers c
JOIN orders o
	ON c.id = o.customer_id
WHERE c.id = 1;

-- Task 2 show client with the purchase id = 1 how much his order costs
SELECT 
SUM(p.price * oi.quantity) as OrderSum
FROM products p
JOIN order_items oi
	ON p.id = oi.product_id
WHERE oi.order_id = 1;

-- Task 3 show clients who made at least 1 order and their spent is more than 100
SELECT 
c.name as CustomerName,
COUNT(DISTINCT o.id) as OrdersCount,
SUM(p.price * oi.quantity) as TotalSpent
FROM customers c
JOIN orders o
	ON c.id = o.customer_id
JOIN order_items oi
	ON o.id = oi.order_id
JOIN products p
	ON oi.product_id = p.id
GROUP BY c.id, c.name
HAVING TotalSpent > 100 AND OrdersCount >= 1;

-- Task 4 find all items which price is more than average price of all items
SELECT 
name as ProductName,
category as ProductCategory,
price as ProductPrice
FROM products
WHERE price > (
SELECT 
AVG(price)
FROM products)