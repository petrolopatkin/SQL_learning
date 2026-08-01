-- Task 1
-- SELECT *
-- FROM orders
-- WHERE order_date >= "2018-01-01"
-- SELECT *
-- FROM customers
-- WHERE birth_date > "1990-01-01" AND points > 1000
 -- WHERE birth_date > "1990-01-01" OR points > 1500 AND NOT state = "WI" 
 -- Task 2
 SELECT *
 FROM order_items
 WHERE order_id = 6 AND unit_price * quantity > 30