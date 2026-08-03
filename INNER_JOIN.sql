-- Inner joins

-- SELECT order_id, c.customer_id, first_name, last_name
-- FROM orders o
-- JOIN customers c
  -- ON o.customer_id = c.customer_id
  
-- Task
SELECT order_id, p.product_id, quantity, oi.unit_price, name
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id