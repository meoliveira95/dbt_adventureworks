with 
    order_detail as (
        SELECT
             sales_order_id --join
            , bill_to_address_id
            , customer_id 
            , sales_person_id 
            , taxa_mt
            , ship_to_address_id
            , territory_id --join
            , order_date 
            , ship_date
            , subtotal
            , credit_card_id --join
            , total_due
            , ship_method_id
            from
            {{ ref ('stg_sales_order_header') }}
)

, products as (
    SELECT
        product_id
        , product_name
        , product_model_id
        from
        {{ ref ('dim_products') }}
)

, customer as (
    SELECT * 
     from
        {{ ref ('dim_customer') }}
)

, credit_card as (
    SELECT * 
     from
        {{ ref ('dim_credit_card') }}
)

, sales_reason as (
    SELECT * 
     from
        {{ ref ('dim_sales_reason') }}
)

, fact_pedidos as (
    select
 	     order_detail.sales_order_id
        , order_detail.bill_to_address_id
        , order_detail.customer_id 
        , order_detail.sales_person_id 
        , order_detail.taxa_mt
        , order_detail.ship_to_address_id
        , order_detail.territory_id --join
        , order_detail.order_date 
        , order_detail.ship_date
        , order_detail.subtotal
        , order_detail.credit_card_id
        , credit_card.flag_credit_card
        , order_detail.total_due
        , sales_reason.name_reason
	from order_detail
left join sales_reason
	on order_detail.sales_order_id = sales_reason.sales_order_id
left join credit_card
	on order_detail.credit_card_id = credit_card.credit_card_id
)

select *
from fact_pedidos