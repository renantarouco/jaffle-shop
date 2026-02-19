with orders as (
    select
        order_id,
        customer_id
    from {{ ref('stg_jaffle_shop__orders') }}
),
payments as (
    select
        order_id,
        amount
    from {{ ref('stg_stripe__payments') }}
)
select
    orders.order_id,
    orders.customer_id,
    payments.amount
from orders
left join payments using (order_id)