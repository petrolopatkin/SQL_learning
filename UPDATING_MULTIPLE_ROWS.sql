-- Updaiting multiple rows
USE sql_store;

-- UPDATE invoices
-- SET payment_total = invoice_total * 0.5,  payment_date = due_date
-- WHERE client_id = 5

-- Task
UPDATE customers
SET points = points + 50
WHERE birth_date < '1990-01-01'