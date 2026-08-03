-- LIMIT operator

-- SELECT *
-- FROM customers
-- LIMIT 6, 3

-- Task
-- SELECT *
-- FROM customers
-- ORDER BY points DESC
-- LIMIT 3

-- Task 2 
SELECT *, quantity_in_stock * unit_price AS "total price"
FROM products
WHERE quantity_in_stock > 30 or "total price" > 100
ORDER BY "total price" 
LIMIT 7