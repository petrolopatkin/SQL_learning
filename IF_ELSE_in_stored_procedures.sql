-- if/else statements in stored procedures
-- Task 1
CREATE PROCEDURE CheckCategorySpending @category nvarchar(50) AS
BEGIN
SELECT @total =  SUM(purchase_price * quantity)
FROM purchases 
WHERE category = @category

IF @total > 100
print 'High spending'
ELSE
print 'Normal spending'
END;

EXECUTE CheckCategorySpending 'Food' @total;

-- Task 2 
CREATE PROCEDURE CheckPurchasePrice @id INT AS
BEGIN
SELECT @total = SUM(purchase_price * quantity)
FROM purchases 
WHERE id = @id

IF  @total > 100
print 'Expensive'
ELSE IF @total = BETWEEN 20 AND 100
print 'Normal'
ELSE 
print 'Cheap'
END

EXECUTE CheckPurchasePrice 5;

-- Task 3 
CREATE PROCEDURE CheckCategory @category nvarchar(50) AS 
BEGIN
SELECT 
id, item, category, quantity, purchase_price, date,
@count = COUNT(*)
FROM purchases
WHERE category = @category

IF @count > 1
print 'Category exists'
ELSE 
prin 'Category not found'
END

EXECUTE CheckCategory;