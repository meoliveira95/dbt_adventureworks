with order_detail as (
        select
                order_qty
                , sales_order_id
                , sales_order_detail_id
                , unit_price
                , special_offer_id
                , product_id
        from
        {{ ref ('stg_sales_order_detail') }}
)


, products as (
    SELECT *
    from
        {{ ref ('dim_products') }}
)

, final as (
        select 
                order_detail.order_qty
                , order_detail.sales_order_id
                , order_detail.sales_order_detail_id
                , order_detail.unit_price
                , order_detail.special_offer_id
                , order_detail.product_id
                , products.product_name
        from order_detail
        left join products
        on order_detail.product_id = products.product_id
)

select *
from final
