-- Practice
-- Task 1
DELIMITER //
CREATE PROCEDURE ChangePurchasePrice (IN p_purchase_id INT, IN p_new_price DECIMAL(10, 2)
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

CALL ChangePurchasePrice(5, 75);

SELECT *
FROM purchases 
WHERE id = 5;

-- Indexes practice
-- Task 1
CREATE INDEX customer_id_idx
ON purchases(customer_id);

EXPLAIN
SELECT * 
FROM purchases
WHERE customer_id  = 5;

-- Task 2
CREATE INDEX customer_id_idx2
ON customers(customer_id);

EXPLAIN
SELECT *
FROM customers;

SHOW INDEXES FROM customers;

-- Task 3
EXPLAIN analyze
SELECT * 
FROM customers
WHERE customer_id = 5;

-- Other
CREATE TABLE customers_2 (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
email VARCHAR(50)
);

CREATE TABLE products_2 (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
category_id INT,
price DECIMAL(10,2)
);

CREATE TABLE categories_2 (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE purchases_2 (
id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
product_id INT 
);