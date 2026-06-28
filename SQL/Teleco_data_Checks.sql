/*
=====================================================
Data Quality Checks
Purpose: Validate customer churn dataset before analysis
=====================================================
*/

-- Total Records
SELECT COUNT(*) AS Total_Customers
FROM Customers;

-----------------------------------------------------

-- Missing Monthly Charges
SELECT COUNT(*) AS Missing_MonthlyCharges
FROM Customers
WHERE MonthlyCharges IS NULL;

-----------------------------------------------------

-- Missing Total Charges
SELECT COUNT(*) AS Missing_TotalCharges
FROM Customers
WHERE TotalCharges IS NULL;

-----------------------------------------------------

-- Duplicate Customer IDs
SELECT
    customerID,
    COUNT(*) AS Duplicate_Count
FROM Customers
GROUP BY customerID
HAVING COUNT(*) > 1;

-----------------------------------------------------

-- Invalid Monthly Charges
SELECT COUNT(*) AS Invalid_MonthlyCharges
FROM Customers
WHERE MonthlyCharges <= 0;

-----------------------------------------------------

-- Monthly Charges Statistics
SELECT
    MIN(MonthlyCharges) AS Min_Charge,
    MAX(MonthlyCharges) AS Max_Charge,
    AVG(MonthlyCharges) AS Avg_Charge
FROM Customers;

-----------------------------------------------------

-- Churn Distribution
SELECT
    Churn,
    COUNT(*) AS Customer_Count
FROM Customers
GROUP BY Churn;