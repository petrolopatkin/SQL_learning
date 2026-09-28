-- syntax practice day 2
-- Task 1 Find all categories that have at least one item costs more than 100
SELECT 
pr2.name,
c2.name,
pr2.price
FROM categories_2 c2
JOIN products_2 pr2
	ON c2.id = pr2.category_id
WHERE pr2.price > 100;

-- Task 2 Find all categories that have at least 2 items
SELECT 
c2.name,
COUNT(pr2.category_id) as count_items
FROM categories_2 c2
JOIN products_2 pr2
	ON c2.id = pr2.category_id
GROUP BY c2.name
HAVING COUNT(pr2.category_id) >= 2;

-- Task 3 Find all the customers that have bought at least one item from the category "Electronics"
SELECT
name,
email
FROM customers_2 c
WHERE EXISTS(
SELECT 1 
FROM purchases_2 p2
JOIN products_2 pr2
	ON p2.product_id = pr2.id
JOIN categories_2 c2
	ON pr2.category_id = c2.id
WHERE c2.name = "Electronics" AND p2.customer_id = c.id);

--  Task 4 something similar to a backend problem solving
SELECT 
c.name,
COALESCE(COUNT(p.id), 0) as PurchaseCount,
COALESCE(SUM(pr.price), 0) as TotalSpentByCustomer
FROM customers_2 c
LEFT JOIN purchases_2 p
	ON c.id = p.customer_id
LEFT JOIN products_2 pr
	ON p.product_id = pr.id
GROUP BY c.id, c.name;

-- Task 5 find all the customers that spent more money than average customer spent
SELECT 
c.name,
COALESCE(SUM(pr.price), 0) as TotalCustomerSpent
FROM customers_2 c
LEFT JOIN purchases_2 p
	ON c.id = p.customer_id
LEFT JOIN products_2 pr
	ON p.product_id = pr.id
GROUP BY c.id, c.name
HAVING SUM(pr.price) > (
SELECT 
AVG(PAvg.TotalCustomerSpent)
FROM (
SELECT 
c.name, 
SUM(pr.price) as TotalCustomerSpent
FROM purchases_2 p
LEFT JOIN products_2 pr
	ON p.product_id = pr.id
GROUP BY p.customer_id) as PAvg);