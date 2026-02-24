{{ config(materialized='table') }}

WITH fx AS (
    SELECT *
    FROM {{ ref('stg_forex_metrics') }}
)
SELECT
    CURRENCY_PAIR AS CURRENCY_PAIR_NAME,
    RUN_DATE AS TRADE_DATE,
    SUM(CLOSE) AS TOTAL_FX_CLOSE  -- aggregate example
FROM fx
GROUP BY CURRENCY_PAIR, RUN_DATE
ORDER BY TRADE_DATE, CURRENCY_PAIR_NAME