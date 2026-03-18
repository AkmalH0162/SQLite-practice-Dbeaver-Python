-- 01_data_cleaning.sql
-- Goal:
-- Show common cleaning techniques:
-- 1. Replace NULL values
-- 2. Trim extra spaces
-- 3. Standardize text casing
-- 4. Create a cleaned result set without changing the original table

SELECT
    CustomerId,

    -- Remove leading/trailing spaces from names
    TRIM(FirstName) AS CleanFirstName,
    TRIM(LastName) AS CleanLastName,

    -- Standardize email to lowercase
    LOWER(Email) AS CleanEmail,

    -- Replace missing company values with a readable label
    COALESCE(Company, 'Individual Customer') AS CleanCompany,

    -- Replace missing fax with 'No Fax'
    COALESCE(Fax, 'No Fax') AS CleanFax,

    -- Standardize country and city formatting
    UPPER(TRIM(Country)) AS CleanCountry,
    TRIM(City) AS CleanCity

FROM Customer
ORDER BY CustomerId;
