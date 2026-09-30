-- syntax practice day 3
-- row_nuber(), rank(), dense_rank() practice
-- Task 1
SELECT 
c.name, 
pr.name,
pr.price,
ROW_NUMBER() OVER(PARTITION BY c.name ORDER BY pr.price DESC) as row_num
FROM products_2 pr
JOIN categories_2 c
	ON pr.category_id = c.id;
    
-- Task 2
SELECT 
c.name,
pr.name,
pr.price,
RANK() OVER(PARTITION BY c.name ORDER BY pr.price DESC) as row_rank,
DENSE_RANK() OVER(PARTITION BY c.name ORDER BY pr.price DESC) as row_dense_rank
FROM products_2 pr
JOIN categories_2 c
	ON pr.category_id = c.id;
    
-- Task 3 find 2 most expensive items in every category
SELECT *
FROM
(
SELECT 
c.name as CategoryName, 
pr.name ProductName,
pr.price,
ROW_NUMBER() OVER(PARTITION BY c.name ORDER BY pr.price DESC) as row_num
FROM products_2 pr
JOIN categories_2 c
	ON pr.category_id = c.id
) as exp
WHERE row_num <= 2;

-- Task 4 Rating of clients in order of their total spent
WITH CustomerSpending AS (
SELECT 
c.name as CustomerName,
COALESCE(SUM(pr.price), 0) as TotalSpent
FROM customers_2 c
LEFT JOIN purchases_2 p
	ON p.customer_id = c.id
LEFT JOIN products_2 pr
	ON p.product_id = pr.id
GROUP BY c.id, c.name)
SELECT 
CustomerName,
TotalSpent,
RANK() OVER(ORDER BY TotalSpent DESC) as CustomerRank
FROM CustomerSpending;

-- task 5 Ranking customers in every category by their total spent
WITH RankingCustomerSpentByCategory AS(
SELECT 
ct.name as CategoryName,
c.name as CustomerName,
COALESCE(SUM(pr.price), 0) as TotalSpent
FROM purchases_2 p
LEFT JOIN customers_2 c
	ON p.customer_id = c.id
LEFT JOIN products_2 pr
	ON p.product_id = pr.id
LEFT JOIN categories_2 ct
	ON pr.category_id = ct.id
GROUP BY ct.name, c.name
)
SELECT 
CategoryName,
CustomerName,
TotalSpent,
DENSE_RANK() OVER(PARTITION BY CategoryName ORDER BY TotalSpent DESC) as CustomerRankByCategory
FROM RankingCustomerSpentByCategory 