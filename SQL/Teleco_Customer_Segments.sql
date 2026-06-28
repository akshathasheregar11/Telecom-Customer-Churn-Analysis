


/*
=====================================================
Customer Segmentation
Purpose: Categorize customers based on tenure and
monthly spending behavior.
=====================================================
*/

CREATE VIEW Customer_Segments AS
SELECT

    customerID,
    tenure,
    MonthlyCharges,

    CASE

        WHEN tenure > 50
             AND MonthlyCharges > 80
        THEN 'High Value Loyal'

        WHEN tenure <= 12
             AND MonthlyCharges > 80
        THEN 'High Risk High Value'

        WHEN tenure > 50
        THEN 'Loyal Customer'

        ELSE 'Regular Customer'

    END AS Customer_Segment

FROM Customers;



