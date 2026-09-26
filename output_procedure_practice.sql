-- OUTPUT in CREATE PROCEDURE
-- Task 1
CREATE PROCEDURE GetPurchaseCountByCategory @category nvarchar(50), @count INT OUT AS 
BEGIN
SELECT @count = COUNT(id) 
FROM purchases 
WHERE category = @category
END;

DECLARE @result INT;

EXECUTE GetPurchaseCountByCategory 'Food', @result OUT;

SELECT @result

-- Task 2
CREATE PROCEDURE GetTotalSpentByCategory @category nvarchar(50), @sum DECIMAL(10, 2) OUT AS
BEGIN
SELECT @sum = SUM(purchase_price * quantity)
FROM purchases
WHERE category = @category
END;

DECLARE @TotalSpent DECIMAL(10, 2);

EXECUTE GetTotalSpentByCategory 'Shopping', @TotalSpent OUT;

-- Task 3
CREATE PROCEDURE GetCategoryStats @category nvarchar(50), @ttl DECIMAL(10, 2) OUT AS
BEGIN
SELECT @ttl = SUM(purchase_price * quantity)
FROM purchases
WHERE category = @category;

SELECT id, item, category, purchase_price, quantity, date
FROM purchases
WHERE category = @category
END;

DECLARE @total DECIMAL(10, 2);

EXECUTE GetCategoryStats 'Bills', @total OUT;