with
    users as (select * from {{ ref("stg_users") }}),
    purchases as (select * from {{ ref("stg_purchases") }}),
    user_purchases as (
        select
            u.id,
            u.email,
            u.address,
            min(p.purchased_at) as first_purchase_date,
            max(p.purchased_at) as most_recent_purchase_date,
            count(p.id) as number_of_product_purchased
        from purchases p
        inner join users u using (id)
        group by u.id, u.email, u.address
    )
select *
from user_purchases

