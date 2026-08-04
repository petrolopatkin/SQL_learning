-- Expliccit Joins Syntax(better to use)
-- SELECT * 
-- FROM orders o
-- JOIN customers c
  -- ON o.customer_id = c.customer_id
  
-- Implicit Join Syntax(can use, but explicit syntax is better)
SELECT *
FROM orders o, customers c
WHERE o.customer_id = c.customer_id
