-- triggers practice day 2
-- Task 1
CREATE TABLE purchase_log (
id INT AUTO_INCREMENT PRIMARY KEY,
purchase_id INT,
purchase_price DECIMAL(10, 2)
);

CREATE TRIGGER trg_log 
AFTER INSERT 
ON purchases
FOR EACH ROW 

BEGIN
	INSERT INTO purchase_log(purchase_id, purchase_price)
    VALUES(NEW.id, NEW.purchase_price)
END;

INSERT INTO purchases 
VALUES
	(12, 'Shopping', 'Bag', 40.52,'2026-06-06'),
	(13, 'Bills', 'Electricity', 28.99, '2026-09-01')
    
-- Task 2
CREATE TABLE purchase_update_log (
id INT AUTO_INCREMENT PRIMARY KEY,
purchase_id INT,
old_price DECIMAL(10,2),
new_price DECIMAL(10,2)
);

CREATE TRIGGER trg_purchase_update_log
AFTER UPDATE
ON purchases
FOR EACH ROW 

BEGIN
	INSERT INTO purchase_update_log
    VALUES(NEW.id, OLD.purchase_price, NEW.purchase_price)
END;

UPDATE purchases
SET purchase_price = purchase_price + 5
WHERE id = 5;

-- Task 3 combined
CREATE TABLE purchase_audit (
id INT auto_increment PRIMARY KEY,
purchase_id INT,
action VARCHAR(20),
old_price DECIMAL(10,2),
new_price DECIMAL(10,2)
);

CREATE TRIGGER trg_insert_audit 
AFTER INSERT
ON purchases
FOR EACH ROW

BEGIN
	INSERT INTO purchase_audit(purchase_id, action, new_price)
    VALUES(NEW.id, 'Insert', NEW.purchase_price);
END;

CREATE TRIGGER trg_update_audit
AFTER UPDATE
ON purchases
FOR EACH ROW

BEGIN
	INSERT INTO purchase_audit(purchase_id, action, old_price, new_price)
    VALUES(NEW.id, 'Update', OLD.purchase_price, NEW.purchase_price);
END;

CREATE TRIGGER trg_delete_audit 
AFTER DELETE 
ON purchases 
FOR EACH ROW 

BEGIN
	INSERT INTO purchase_audit(purchase_id, action, old_price)
    VALUES(OLD.id, 'Delete', OLD.purchase_price);
END;