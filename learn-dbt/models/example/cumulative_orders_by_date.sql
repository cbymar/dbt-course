{{ config(materialized='table') }}

SELECT DISTINCT o.o_orderdate, 
SUM(o.o_totalprice) over (ORDER BY o.o_orderdate) AS cumulative_sales
FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" o 
ORDER BY o.o_orderdate
