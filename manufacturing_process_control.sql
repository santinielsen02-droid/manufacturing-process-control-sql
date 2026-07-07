/*
====================================================
Project: Manufacturing Process Control (SQL)
Author: Santiago Nielsen
Database: PostgreSQL

Business Problem
----------------------------------------------------
A manufacturing company wants to monitor product quality
by detecting manufactured parts whose heights fall
outside statistically acceptable control limits.

Project Objectives
----------------------------------------------------
- Calculate rolling average height
- Calculate rolling standard deviation
- Compute Upper Control Limit (UCL)
- Compute Lower Control Limit (LCL)
- Flag products outside acceptable limits

SQL Skills Demonstrated
----------------------------------------------------
- Window Functions
- ROW_NUMBER()
- AVG()
- STDDEV()
- CASE
- Nested Queries
- Statistical Process Control (SPC)

====================================================
*/

SELECT 
    operator,
    row_number,
    height,
    avg_height,
    stddev_height,
    avg_height + (3 * (stddev_height / SQRT(5))) AS ucl,
    avg_height - (3 * (stddev_height / SQRT(5))) AS lcl,
    CASE
        WHEN height > (avg_height + (3 * (stddev_height / SQRT(5))))
          OR height < (avg_height - (3 * (stddev_height / SQRT(5))))
        THEN TRUE
        ELSE FALSE
    END AS alert

FROM
(
    SELECT
        operator,
        item_no,
        height,

        AVG(height) OVER (
            PARTITION BY operator
            ORDER BY item_no
            ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
        ) AS avg_height,

        STDDEV(height) OVER (
            PARTITION BY operator
            ORDER BY item_no
            ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
        ) AS stddev_height,

        ROW_NUMBER() OVER (
            PARTITION BY operator
            ORDER BY item_no
        ) AS row_number

    FROM manufacturing_parts
) AS subquery
WHERE row_number >= 5
;