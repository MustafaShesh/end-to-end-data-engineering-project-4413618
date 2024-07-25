with
    CUSTOMERS as (select * from {{ ref("stg_customers") }}),
    ORDERS as (select * from {{ ref("stg_orders") }}),
    CUSTOMER_ORDERS as (
        select
            C.CUSTOMER_ID,
            C.email,
            C.COUNTRY,
            C.CITY,
            min(O.ORDER_APPROVED_AT) as FIRST_ORDER_DATE,
            max(O.ORDER_APPROVED_AT) as MOST_RECENT_ORDER_DATE,
            count(O.ORDER_ID) as NUMBER_OF_ORDERS
        from ORDERS O
        inner join CUSTOMERS C using (CUSTOMER_ID)
        group by C.CUSTOMER_ID, C.EMAIL, C.COUNTRY, C.CITY
    )
select *
from CUSTOMER_ORDERS

