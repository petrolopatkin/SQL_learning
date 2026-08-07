-- Creating a copy of a table

-- CREATE TABLE orders_archive AS
-- SELECT *
-- FROM orders

-- all orders before 2019
-- INSERT INTO orders_archive
-- SELECT *
-- FROM orders
-- WHERE order_date < '2019-01-01'

-- Task
USE sql_invoicing;
CREATE TABLE invoices_archive2
SELECT 
i.invoice_id,
i.number,
c.name AS client,
i.invoice_total,
i.payment_total,
i.invoice_date,
i.payment_date,
i.due_date
FROM invoices i
JOIN clients c
	USING (client_id)
WHERE payment_date IS NOT NULL