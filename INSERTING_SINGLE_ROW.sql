-- Column attributes + Inserting a Single Row

INSERT INTO customers
VALUES (DEFAULT, 'John', 'Smith', '1999-09-11', '1234-5678-9012','None Avenue 23', 'Millwakee','WI', '1488');

INSERT INTO customers (first_name, last_name, birth_date, address, city, state, points)
VALUES ('Chip', 'Chipov', '2000-01-01', '67 String Avenue', 'Sharlotte', 'NC', '67')