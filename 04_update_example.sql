-- 04_update_example.sql
-- Goal:
-- Demonstrate UPDATE safely on a copied table
-- Important:
-- We copy the original table first so the real data is not affected

DROP TABLE IF EXISTS Customer_Copy;

CREATE TABLE Customer_Copy AS
SELECT *
FROM Customer;

-- Check original values before updating
SELECT CustomerId, FirstName, LastName, Company
FROM Customer_Copy
WHERE Company IS NULL;

-- Replace NULL company values with a default label
UPDATE Customer_Copy
SET Company = 'Individual Customer'
WHERE Company IS NULL;

-- Verify the update worked
SELECT CustomerId, FirstName, LastName, Company
FROM Customer_Copy
WHERE Company = 'Individual Customer';
