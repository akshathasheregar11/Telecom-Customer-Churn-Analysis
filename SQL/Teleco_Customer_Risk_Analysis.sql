
/*
=====================================================
Customer Risk Analysis
Purpose: Identify customers at risk of churn by
comparing them against contract-level benchmarks.
=====================================================
*/

WITH ContractBenchmarks AS
(
    SELECT
        Contract,
        AVG(MonthlyCharges) AS Avg_MonthlyCharges,
        AVG(CAST(tenure AS FLOAT)) AS Avg_Tenure
    FROM Customers
    GROUP BY Contract
)

SELECT
    c.customerID,
    c.Contract,
    c.tenure,
    c.MonthlyCharges,

    cb.Avg_MonthlyCharges,
    ROUND(cb.Avg_Tenure, 2) AS Avg_Tenure,

    CASE
        WHEN c.MonthlyCharges > cb.Avg_MonthlyCharges
             AND c.tenure < cb.Avg_Tenure
        THEN 'High Risk'

        WHEN c.tenure < cb.Avg_Tenure
        THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS Risk_Category,

    c.Churn

FROM Customers c
INNER JOIN ContractBenchmarks cb
    ON c.Contract = cb.Contract

ORDER BY
    Risk_Category,
    c.MonthlyCharges DESC;