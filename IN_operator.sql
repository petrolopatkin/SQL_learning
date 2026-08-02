-- IN operator
-- SELECT *
-- FROM Customers
-- WHERE state IN ("Wi", "GA", "FL") 
-- Task 1
SELECT *
FROM products 
WHERE quantity_in_stock IN(38, 49, 98)