# Write your MySQL query statement below
WITH DailySum AS (
    SELECT 
        visited_on, 
        SUM(amount) as day_amount
    FROM Customer
    GROUP BY visited_on
),
MovingStats AS (
    SELECT 
        visited_on,
        SUM(day_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
        ROUND(AVG(day_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount,
        ROW_NUMBER() OVER(ORDER BY visited_on) as rn
    FROM DailySum
)
SELECT 
    visited_on, 
    amount, 
    average_amount
FROM MovingStats
WHERE rn >= 7
ORDER BY visited_on;