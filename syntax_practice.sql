-- sql practice to maintain my skills
-- inserting all information into my tables i previously created so I can practice
INSERT INTO categories_2 (name)
VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home'),
('Sports'),
('Gaming'),
('Food'),
('Beauty');

INSERT INTO products_2 (name, category_id, price)
VALUES
('Laptop', 1, 999.99),
('Wireless Mouse', 1, 29.99),
('Mechanical Keyboard', 1, 89.99),
('T-Shirt', 2, 24.99),
('Jeans', 2, 59.99),
('Python Book', 3, 39.99),
('SQL Book', 3, 44.99),
('Desk Lamp', 4, 34.50),
('Office Chair', 4, 179.99),
('Football', 5, 29.99),
('Tennis Racket', 5, 119.99),
('Gaming Headset', 6, 79.99),
('Game Controller', 6, 64.99),
('Coffee', 7, 12.50),
('Face Cream', 8, 18.99);

INSERT INTO customers_2 (name, email)
VALUES
('Peter Lopatin', 'peter@example.com'),
('Anna Novak', 'anna@example.com'),
('John Smith', 'john@example.com'),
('Mark Wilson', 'mark@example.com'),
('Emma Brown', 'emma@example.com'),
('Daniel Miller', 'daniel@example.com'),
('Sophie Davis', 'sophie@example.com'),
('Michael Taylor', 'michael@example.com'),
('Olivia Anderson', 'olivia@example.com'),
('James Thomas', 'james@example.com');

INSERT INTO purchases_2 (customer_id, product_id)
VALUES
(1, 1),
(1, 2),
(1, 6),
(2, 4),
(2, 7),
(2, 10),
(3, 3),
(3, 12),
(3, 14),
(4, 5),
(4, 9),
(5, 1),
(5, 11),
(5, 15),
(6, 6),
(6, 8),
(7, 2),
(7, 13),
(8, 10),
(8, 12),
(8, 14),
(9, 7),
(9, 9),
(10, 3),
(10, 5),
(10, 1),
(1, 13),
(2, 2),
(3, 1),
(5, 6);

-- Task 1 basic select + where
SELECT 
name, price
FROM products_2
WHERE price > 50 
ORDER BY price desc;

-- Task 2 JOINS
SELECT 
p2.name,
p2.price,
c2.name
FROM products_2 p2
LEFT JOIN categories_2 c2
	ON p2.category_id = c2.id;
    
-- Task 3 JOINS + WHERE
SELECT 
p2.name,
p2.price,
c2.name
FROM products_2 p2
LEFT JOIN categories_2 c2
	ON p2.category_id = c2.id
WHERE c2.name = "Electronics";

-- Task 4 JOINS + GROUP BY + COUNT
SELECT 
cm2.name,
COUNT(*) as purchases_count
FROM purchases_2 ps2
LEFT JOIN customers_2 cm2
	ON ps2.customer_id = cm2.id
GROUP BY cm2.id;

-- Task 5 JOINS + GROUP BY + COUNT + HAVING
SELECT 
cm2.name,
COUNT(*) as purchases_count
FROM purchases_2 ps2
LEFT JOIN customers_2 cm2
	ON ps2.customer_id = cm2.id
GROUP BY cm2.id
HAVING COUNT(*) > 2;

-- Task 6 Multiple Joins + SUM + GROUP BY
SELECT 
cm2.name,
SUM(p2.price) as total_customer_spent
FROM purchases_2 ps2
LEFT JOIN customers_2 cm2
	ON ps2.customer_id = cm2.id 
LEFT JOIN products_2 p2
	ON ps2.product_id = p2.id
GROUP BY cm2.id;

-- Task 7 Multiple Joins + AVG + GROUP BY + HAVING
SELECT 
cm2.name,
AVG(p2.price) as avg_customer_spent
FROM purchases_2 ps2
LEFT JOIN customers_2 cm2
	ON ps2.customer_id = cm2.id 
LEFT JOIN products_2 p2
	ON ps2.product_id = p2.id
GROUP BY cm2.id
HAVING AVG(p2.price) > 100;

-- Task 8 SUBQUERIES + GROUP BY + HAVING 
SELECT 
    cm2.name,
    SUM(p2.price) AS total_customer_spent
FROM purchases_2 ps2
LEFT JOIN customers_2 cm2
    ON ps2.customer_id = cm2.id
LEFT JOIN products_2 p2
    ON ps2.product_id = p2.id
GROUP BY cm2.id
HAVING SUM(p2.price) > (
SELECT AVG(x.total_customer_spent)
FROM (
SELECT 
cm2.name,
SUM(p2.price) as total_customer_spent
FROM purchases_2 ps2
LEFT JOIN products_2 p2
	ON ps2.product_id = p2.id
GROUP BY ps2.customer_id) AS x);

-- Task 9 CASE
SELECT 
name, price,
CASE
	WHEN price < 30 THEN "Cheap"
    WHEN price BETWEEN 30 AND 100 THEN "Medium"
    WHEN price BETWEEN 100 AND 500 THEN "Expensive"
    WHEN price > 500 THEN "Very Expensive"
END as price_groups
FROM products_2
ORDER BY price DESC;

-- Task 10 EXISTS
SELECT 
name, 
email
FROM customers_2 c
WHERE EXISTS ( SELECT 1
FROM purchases_2 p
JOIN products_2 pr
	ON p.product_id = pr.id
WHERE p.customer_id = c.id AND pr.price > 500);