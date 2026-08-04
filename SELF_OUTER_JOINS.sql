-- Self Outer Join
USE sql_hr; 

SELECT 
e.first_name,
e.last_name,
e.job_title,
em.first_name AS managers_name,
em.last_name AS managers_last_name
FROM employees e
LEFT JOIN employees em
ON e.reports_to = em.employee_id