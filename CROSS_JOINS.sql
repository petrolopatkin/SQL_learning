-- Cross Joins
-- SELECT 
-- c.first_name AS customer,
-- p.product_id,
-- p.name,
-- p.unit_price
-- FROM customers c
-- CROSS JOIN products p
-- ORDER BY c.first_name

-- Task 1.1
-- SELECT 
-- p.product_id,
-- p.name,
-- p.unit_price,
-- sh.name AS shipper
-- FROM shippers sh, products p
-- ORDER BY shipper

-- Task 1.2
SELECT
p.product_id,
p.name,
p.unit_price,
sh.name AS shipper
FROM shippers sh
CROSS JOIN products p
ORDER BY shipper 