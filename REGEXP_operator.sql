-- REGEXP operator
-- SELECT * 
-- FROM customers
-- WHERE last_name REGEXP "field|mac|rose"
-- WHERE last_name REGEXP "([gim]e)"
-- ^ beginning
-- $ end
-- | logical or
-- [abcd] any charachters with those letters
-- [a-h] any charachters in this range of letters

-- Task 1 first names are elka or ambur
-- SELECT *
-- FROM customers
-- WHERE first_name REGEXP "elka|ambur"

-- Task 2 lastnames end with ey or on
-- SELECT * 
-- FROM customers
-- WHERE last_name REGEXP "ey$|on$"

-- Task 3 lastnames starts with MY or contains SE
-- SELECT * 
-- FROM customers
-- WHERE last_name REGEXP "^my|se"

-- Task 4 lastnames contain B followed by U or R
SELECT *
FROM customers
WHERE last_name REGEXP "b[u, r]"
