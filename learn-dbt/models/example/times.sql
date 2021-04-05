
{{ config(materialized='incremental', unique_key = 't_time_sk') }}

SELECT * 
FROM "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."TIME_DIM"
WHERE to_time(concat(T_HOUR::varchar, ':', T_MINUTE, ':', T_SECOND)) <= current_time

{% if is_incremental() %}
	and t_time_sk > (select max(t_time_sk) from {{ this }} )
{% endif %}
