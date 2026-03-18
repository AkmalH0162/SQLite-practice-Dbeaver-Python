-- 02_data_transformation.sql
-- Goal:
-- Transform invoice data into a more analysis-friendly format
-- 1. Extract year and month from InvoiceDate
-- 2. Categorize invoices by value
-- 3. Rename columns clearly for reporting

SELECT
    InvoiceId,
    CustomerId,

    -- Extract year from the invoice date
    strftime('%Y', InvoiceDate) AS InvoiceYear,

    -- Extract month number from the invoice date
    strftime('%m', InvoiceDate) AS InvoiceMonth,

    BillingCountry,
    Total,

    -- Categorize invoice totals into groups
    CASE
        WHEN Total < 5 THEN 'Low Value'
        WHEN Total BETWEEN 5 AND 15 THEN 'Medium Value'
        ELSE 'High Value'
    END AS InvoiceCategory

FROM Invoice
ORDER BY InvoiceDate;
