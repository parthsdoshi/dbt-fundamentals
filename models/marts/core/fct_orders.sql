/*
Create a fct_orders.sql (not stg_orders) model with the following fields.  Place this in the marts/core directory.
order_id
customer_id
amount
*/

SELECT
    order_id,
    customer_id,
    order_date,
    sum(if(payments.status = "success", amount, 0)) as amount,
FROM {{ ref('stg_orders') }} orders
LEFT JOIN {{ ref('stg_payments') }} payments USING (order_id)
group by 1, 2, 3