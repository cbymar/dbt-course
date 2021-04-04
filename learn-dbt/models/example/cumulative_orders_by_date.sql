{{ config(materialized="table") }}

SELECT od AS o_orderdate, 
SUM(tp) OVER 
(ORDER BY o_orderdate) AS cumulative_sales
FROM (SELECT o.o_orderdate AS od, SUM(o.o_totalprice) AS tp FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" o 
GROUP BY o.o_orderdate
ORDER BY o.o_orderdate)
