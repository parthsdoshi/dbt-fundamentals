select 
    id AS payment_id, 
    orderid AS order_id,
    paymentmethod AS payment_method,
    status,
    amount / 100 AS amount,  -- amount is stored in cents...
    created AS created_at,
    -- _batched_at,  # Unused
from {{ source('stripe', 'payment') }}