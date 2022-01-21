with customer as (
    select
        customer_id
        , person_id
        , territory_id
        , store_id
        from
        {{ ref ('stg_customers') }}
)

select * 
from customer 
