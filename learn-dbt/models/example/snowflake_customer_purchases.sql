{{ config(materialized='table') }}

SELECT c.c_custkey, c.c_name, c.c_nationkey AS nation, SUM(o.o_totalprice) AS total_order_price
FROM {{ source('sample','customer') }} c
LEFT JOIN {{ source('sample','orders') }} o
ON c.c_custkey = o.o_custkey
GROUP BY c.c_custkey, c.c_name, c.c_nationkey

