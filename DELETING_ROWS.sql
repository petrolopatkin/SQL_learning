-- Deleting rows
USE sql_invoicing;

DELETE FROM invoices
WHERE client_id IN 
	(SELECT *
	FROM clients 
	WHERE name = 'Myworks')