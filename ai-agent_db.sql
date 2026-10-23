-- Creating a database for my Ai Agent studying

CREATE DATABASE ai_spending;
USE ai_spending;

CREATE TABLE spending (
Id int AUTO_INCREMENT PRIMARY KEY ,
Description VARCHAR(255),
Amount DECIMAL(10, 2),
currency VARCHAR(10),
category VARCHAR(100)
);

DESCRIBE spending;

-- Changing structure of my table a little bit
ALTER TABLE spending
	MODIFY COLUMN 
    Description VARCHAR(255) NOT NULL,
    MODIFY COLUMN
    Amount DECIMAL(10,2) NOT NULL,
    MODIFY COLUMN 
    currency VARCHAR(10) NOT NULL;
    
-- Cheking result of my tests
SELECT *
FROM spending
ORDER BY Id DESC
LIMIT 5;