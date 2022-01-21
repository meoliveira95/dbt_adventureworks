with
    validation as (
        select sum (order_qty) as sum_val
        from {{ref ('fact_orders_pedido')}}
    )

select * 
from validation
where sum_val != 274914