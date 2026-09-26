-- Task 1
CREATE PROCEDURE GetPurchases AS 
BEGIN 
SELECT 
id, item, category, purchase_price, quantity, date
FROM purchases
END;

EXECUTE GetPurchases;
-- Task 2
CREATE PROCEDURE GetPurchasesByCategory @category NVARCHAR(50) AS
BEGIN
SELECT id, item, category, purchase_price, quantity, date
FROM purchases
WHERE category = @category
END;

EXECUTE GetPurchasesByCategory 'Food';
-- Task 3
CREATE PROCEDURE GetPurchasesByCategoryAndPrice @category NVARCHAR(50), @purchase_price FLOAT AS
BEGIN
SELECT id, item, category, purchase_price, quantity, date
FROM purchases
WHERE category = @category AND purchase_price < @purchase_price
END;

EXECUTE GetPurchasesByCategoryAndPrice 'Shopping', 20;
-- Task 4
CREATE PROCEDURE UpdatePurchasePrice @id INT, @new_price DECIMAL AS
BEGIN
UPDATE purchases 
SET purchase_price = @new_price
WHERE id = @id
id, item, category, purchase_price, quantity, date
FROM purchases
WHERE id = @id AND purchase_price = @new_price
SELECT 
END;

EXECUTE UpdatePurchasePrice 5, 25.50