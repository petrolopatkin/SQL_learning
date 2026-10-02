-- Another syntax practice as a training before combining SQL with Python in my projects 

-- Task 1 clients and their prices using my own little database
WITH ClientsAndPurchases AS (
SELECT 
c.name as ClientName,
COALESCE(COUNT(p.id), 0) as PurchasesByClientCount,
COALESCE(SUM(pr.price), 0) as SumByClient
FROM customers_2 c
LEFT JOIN purchases_2 p
	ON p.customer_id = c.id
LEFT JOIN products_2 pr
	ON p.product_id = pr.id
LEFT JOIN categories_2 ct
	ON pr.category_id = ct.id
GROUP BY c.id, c.name)
SELECT 
ClientName, 
PurchasesByClientCount,
SumByClient,
RANK() OVER(ORDER BY SumByClient DESC) as ClientRank
FROM ClientsAndPurchases;

-- Task 2 find all categories in which sales were more than 1000
SELECT 
ct.name as CategoryName,
SUM(pr.price) as TotalSales,
COUNT(p.id) as PurchaseCount
FROM purchases_2 p
LEFT JOIN products_2 pr
	ON p.product_id = pr.id
LEFT JOIN categories_2 ct
	ON pr.category_id = ct.id
GROUP BY ct.id, ct.name
HAVING SUM(pr.price) > 1000;

-- Task 3 Find all customers who bought items from category 'Electronics' and have total spent > 500. Using only base constructions
SELECT 
c.name as CustomerName,
SUM(pr.price) as TotalSpent
FROM customers_2 c
LEFT JOIN purchases_2 p
	ON c.id = p.customer_id
LEFT JOIN products_2 pr
	ON p.product_id = pr.id
LEFT JOIN categories_2 ct
	ON pr.category_id = ct.id
WHERE ct.name = 'Electronics'
GROUP BY c.id, c.name
HAVING SUM(pr.price) > 500;

-- Task 4 Find all customers who spent more than average of all clients and made at least 1 buy(Using CTE)
WITH ClientsMoreThanAVG AS (
SELECT 
c.name as CustomerName,
SUM(pr.price) as TotalSpent
FROM customers_2 c
LEFT JOIN purchases_2 p
	ON c.id = p.customer_id
LEFT JOIN products_2 pr
	ON p.product_id = pr.id
GROUP BY c.id, c.name
),
AverageSpending AS (
SELECT 
AVG(TotalSpent) as AvgPrice
FROM ClientsMoreThanAVG
)
SELECT 
CustomerName,
TotalSpent
FROM ClientsMoreThanAVG cmv
CROSS JOIN AverageSpending avs
WHERE cmv.TotalSpent > avs.AvgPrice;

-- Task 5 CRUD methods + Transactions
DELIMITER //

CREATE PROCEDURE ExerciseProcedure(
)
BEGIN

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO purchases_2 (customer_id, product_id)
    VALUES (6, 7);

    UPDATE purchases_2
    SET customer_id = 'This_IS_NOT_AN_INTEGER';

    COMMIT;

END //

DELIMITER ;

CALL ExerciseProcedure();