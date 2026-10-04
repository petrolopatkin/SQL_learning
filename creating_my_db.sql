
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    
    FOREIGN KEY (customer_id)
        REFERENCES customers(id)
);

CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    
    FOREIGN KEY (order_id)
        REFERENCES orders(id),
        
    FOREIGN KEY (product_id)
        REFERENCES products(id)
);

INSERT INTO customers (name, email, country)
VALUES
('Peter Novak', 'peter@example.com', 'Slovakia'),
('Anna Schmidt', 'anna@example.com', 'Germany'),
('Mark Wilson', 'mark@example.com', 'USA'),
('Sofia Rossi', 'sofia@example.com', 'Italy'),
('Daniel Brown', 'daniel@example.com', 'UK'),
('Emma Kowalska', 'emma@example.com', 'Poland'),
('Alex Martin', 'alex@example.com', 'France'),
('Laura Silva', 'laura@example.com', 'Portugal');

INSERT INTO products (name, category, price)
VALUES
('Mechanical Keyboard', 'Electronics', 89.99),
('Wireless Mouse', 'Electronics', 35.50),
('USB-C Cable', 'Electronics', 12.99),
('Laptop Stand', 'Accessories', 45.00),
('Desk Lamp', 'Accessories', 29.90),
('Notebook', 'Stationery', 6.50),
('Pen Set', 'Stationery', 4.99),
('Monitor', 'Electronics', 249.99),
('Webcam', 'Electronics', 79.90),
('Coffee Mug', 'Other', 8.50);

INSERT INTO orders (customer_id, order_date)
VALUES
(1, '2026-09-01'),
(1, '2026-09-05'),
(2, '2026-09-07'),
(3, '2026-09-10'),
(3, '2026-09-12'),
(4, '2026-09-15'),
(6, '2026-09-18');

INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1, 1, 1),
(1, 3, 2),

(2, 8, 1),
(2, 2, 1),

(3, 6, 3),

(4, 1, 1),
(4, 4, 1),

(5, 10, 2),
(5, 7, 5),

(6, 9, 1),

(7, 5, 2),
(7, 3, 1);

