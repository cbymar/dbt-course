
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table', alias='first_model', post_hook = 'grant select on {{this}} to role analyst') }}

with source_data as (

    select 1 as id
    -- union all
    -- select null as id
    -- union all
    -- select 3 as id

)

select *
from source_data
where id is not null
