
{{ config(materialized='view') }}

SELECT * FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF001"."CUSTOMER"
