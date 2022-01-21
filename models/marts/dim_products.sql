with products as (
    SELECT
        product_id
        , product_name
        , product_model_id
        from
        {{ ref ('stg_product') }}
)

select * 
from products

