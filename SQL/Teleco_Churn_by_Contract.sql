
/*
=====================================================
Churn By Contract
Purpose: Analyze churn rates across different
contract types.
=====================================================
*/

CREATE VIEW Churn_By_Contract AS
SELECT

    Contract,

    COUNT(*) AS Total_Customers,

    SUM(
        CASE
            WHEN Churn='Yes' THEN 1
            ELSE 0
        END
    ) AS Churned_Customers,

    ROUND(
        100.0 *
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS Churn_Rate

FROM Customers

GROUP BY Contract;



