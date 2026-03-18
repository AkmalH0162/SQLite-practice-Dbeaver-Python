-- 06_create_view.sql
-- Goal:
-- Create a reusable view for customer invoice analysis
-- Views are useful when you want to save a query as a virtual table

DROP VIEW IF EXISTS vw_customer_invoice_summary;

CREATE VIEW vw_customer_invoice_summary AS
SELECT
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    c.Country,
    i.InvoiceId,
    date(i.InvoiceDate) AS InvoiceDateOnly,
    i.BillingCountry,
    i.Total
FROM Customer c
JOIN Invoice i
    ON c.CustomerId = i.CustomerId;

-- Query the view like a normal table
SELECT *
FROM vw_customer_invoice_summary
ORDER BY Total DESC;
