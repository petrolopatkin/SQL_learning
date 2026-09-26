-- Triggers
-- Task 1 
CREATE TABLE purchase_log(
id INT IDENTITY(1,1) PRIMARY KEY,
purchase_id INT,
purchase_price DECIMAL(10, 2)
);

CREATE TRIGGER trg_insert ON purchases
AFTER INSERT
AS
BEGIN
	INSERT INTO purchase_log(purchase_id, purchase_price)
    SELECT id, purchase_price
    FROM inserted
END;

-- Task 2
CREATE TABLE purchase_quantity_log(
id INT IDENTITY(1,1) PRIMARY KEY,
purchase_id INT,
quantity INT
);

CREATE TRIGGER trg_insert_quantity_log ON purchases
AFTER INSERT 
AS 
BEGIN
	INSERT INTO purchase_quantity_log(purchase_id, quantity)
    SELECT id, quantity
    FROM inserted
END;

INSERT INTO purchases
VALUES(11, "Food", "Apple", 2, 1.5, "2026-09-09")