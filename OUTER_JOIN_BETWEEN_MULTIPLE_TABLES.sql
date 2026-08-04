-- Outer Join Between Multiple Tables
-- SELECT 
-- c.customer_id,
-- c.first_name,
-- c.last_name,
-- o.order_id,
-- o.order_date,
-- sh.name AS shipper
-- FROM  customers c
-- LEFT JOIN orders o
  -- ON c.customer_id = o.customer_id
-- LEFT JOIN shippers sh
  -- ON o.shipper_id = sh.shipper_id
-- ORDER BY c.customer_id

-- Task
SELECT 
o.order_date,
o.order_id,
c.first_name,
sh.name AS shipper,
os.name AS status
FROM orders o
LEFT JOIN customers c
  ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
  ON o.shipper_id = sh.shipper_id
LEFT JOIN order_statuses os
  ON o.status = os.order_status_id