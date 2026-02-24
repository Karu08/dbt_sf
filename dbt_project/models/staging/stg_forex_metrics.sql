{{ config(materialized='view') }}

SELECT
    VARIABLE AS CURRENCY_PAIR,
    DATE AS RUN_DATE,
    VALUE AS CLOSE  -- using VALUE as FX rate
FROM {{ source('forex_data', 'FX_RATES_TIMESERIES') }}
WHERE DATE >= '2024-01-01'