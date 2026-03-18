-- 03_create_summary_table.sql
-- Goal:
-- Create a summary table that stores total spending by customer
-- This demonstrates:
-- 1. CREATE TABLE AS
-- 2. GROUP BY aggregation
-- 3. Joining tables together

DROP TABLE IF EXISTS CustomerSpendingSummary;

CREATE TABLE CustomerSpendingSummary AS
SELECT
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    c.Country,
    COUNT(i.InvoiceId) AS NumberOfInvoices,
    ROUND(SUM(i.Total), 2) AS TotalSpent,
    ROUND(AVG(i.Total), 2) AS AverageInvoiceValue
FROM Customer c
LEFT JOIN Invoice i
    ON c.CustomerId = i.CustomerId
GROUP BY
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Country;

-- View the new summary table
SELECT *
FROM CustomerSpendingSummary
ORDER BY TotalSpent DESC;
