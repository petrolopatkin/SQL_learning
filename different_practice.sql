-- Practice on different topics
-- Task 1
SELECT 
category, 
COUNT(*)  as category_count,
AVG(price)  as category_avg,
SUM(price) as sum_overall,
MAX(price)  as max_price_category
FROM purchases
GROUP BY category
ORDER BY SUM(price) DESC;

-- Task 2
SELECT
category, 
COUNT(*) as count,
AVG(price) as avg_price
FROM purchases
GROUP BY category
HAVING COUNT(*) >= 3 AND AVG(price) > 20;

-- Task 3
SELECT 
c.name,
COUNT(*) as count,
SUM(price) as overall_sum
FROM purchases p
LEFT JOIN customers c 
	ON p.customer_id = c.id
GROUP BY c.name
HAVING SUM(price) > 100
ORDER BY SUM(price) DESC;

-- Task 4 GOURP BY + HAVING
SELECT
category,
COUNT(*) as purchase_count,
AVG(price) as avg_price,
MAX(price) as max_price
FROM purchases
GROUP BY category
HAVING COUNT(*) >= 2 AND AVG(price)> 30;

-- Task 5 CTE
WITH category_stats AS (
SELECT 
category,
COUNT(*) as purchase_count,
SUM(price) as total_amount
FROM purchases 
GROUP BY category
)
SELECT 
category,
purchase_count,
total_amount
FROM category_stats
WHERE total_amount > 200
ORDER BY total_amount DESC;

-- Task 6 CASE
SELECT 
id, category, price,
CASE 
	WHEN price < 20 THEN 'Cheap'
    WHEN price BETWEEN 20 AND 50 THEN 'Medium'
    WHEN price > 50 THEN 'Expensive'
    END as price_level
FROM purchases;

-- Task 7 NULL and COALESCE
SELECT 
name,
discount,
COALESCE(discount, 0) as discount_value
FROM customers;

-- Task 8 COALESCE + Window Functions
SELECT 
id,
customer_id,
COALESCE(category, 'Unknown') as category,
price,
AVG(price) OVER(PARTITION BY customer_id) as customer_avg,
price - AVG(price) OVER(PARTITION BY customer_id) as price_difference
FROM purchases;

-- Task 9 Views
CREATE VIEW expensive_purchases AS
SELECT 
id,
customer_id,
category,
price
FROM purchases
WHERE price > 50;

SELECT * 
FROM expensive_purchases;

-- Task 10 TRIGGERS
CREATE TABLE purchase_log(
id INT AUTO_INCREMENT PRIMARY KEY,
purchase_id INT,
old_price DECIMAL(10, 2),
new_price DECIMAL(10, 2)
);

CREATE TRIGGER trg_purchase_log
AFTER UPDATE 
ON purchases
FOR EACH ROW

BEGIN
INSERT INTO purchase_log(purchase_id, old_price, new_price)
VALUES(OLD.id, OLD.price, NEW.price);
END;

-- Task 11 STORED PROCEDURE + Transaction
DELIMITER //
CREATE PROCEDURE ChangePurchasePrice ( IN p_purchase_id INT, IN p_new_price DECIMAL(10, 2)
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
	END;
    
    START TRANSACTION;
    
    UPDATE purchases
    SET price = p_new_price
    WHERE id = p_purchase_id;
    
    COMMIT;
END //

DELIMITER ;