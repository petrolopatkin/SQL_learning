-- ORDER BY method
-- SELECT * 
-- FROM customers
-- ORDER BY first_name
-- ORDER BY first_name DESC
-- ORDER BY state, first_name

-- Task
SELECT *, quantity * unit_price AS "total price"
FROM order_items
WHERE order_id = 2
ORDER BY "total price"