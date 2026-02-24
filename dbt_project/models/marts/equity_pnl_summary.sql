{{ config(
    materialized='table'
) }}

WITH fx AS (
    SELECT *
    FROM {{ ref('stg_forex_metrics') }}
)

SELECT
    RUN_DATE AS TRADE_DATE,
    SUM(CLOSE) AS TOTAL_FX_CLOSE  -- aggregate example
FROM fx
GROUP BY  RUN_DATE
ORDER BY TRADE_DATE