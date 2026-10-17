{{
    config(
        materialized='table',
        query_tag='DBT',
        database= 'DB2_LAB',
        schema='RAW_SCHEMA'
    )
}}

SELECT 
    CUSTOMER_ID as CUSTID, FIRST_NAME,LAST_NAME, concat_ws (' ',FIRST_NAME,LAST_NAME) as full_name,
    EMAIL,PHONE AS PHN_NUMBER,CITY,STATE
FROM SNOWFLAKE_DBT_DATA.SF_SCHEMA.CUSTOMER
from {{source('raw_data', 'cust')}}  --jinja
    