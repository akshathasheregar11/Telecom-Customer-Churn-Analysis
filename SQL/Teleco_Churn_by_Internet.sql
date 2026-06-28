/*
=====================================================
Churn By Internet Service
Purpose: Analyze churn behavior across internet
service categories.
=====================================================
*/


CREATE VIEW Churn_By_Internet AS
SELECT

    InternetService,

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

GROUP BY InternetService;





