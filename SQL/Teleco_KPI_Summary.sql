/*
======================================================
KPI Summary
Purpose: Generate key business metrics for customer
churn analysis.
======================================================
*/
CREATE VIEW KPI_Summary AS
SELECT

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
    ) AS Churn_Rate,

    ROUND(
        AVG(MonthlyCharges),
        2
    ) AS Avg_Monthly_Charges,

    ROUND(
        SUM(
            CASE
                WHEN Churn='Yes'
                THEN MonthlyCharges
                ELSE 0
            END
        ),
        2
    ) AS Revenue_Loss

FROM Customers;



