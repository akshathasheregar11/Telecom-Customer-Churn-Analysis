WITH RevenueRanking AS
(
    SELECT
        customerID,
        Contract,
        InternetService,
        MonthlyCharges,
        TotalCharges,
        Churn,

        DENSE_RANK() OVER
        (
            ORDER BY TotalCharges DESC
        ) AS Revenue_Rank

    FROM Customers
    WHERE TotalCharges IS NOT NULL
)

SELECT *
FROM RevenueRanking
WHERE Revenue_Rank <= 10
ORDER BY Revenue_Rank;