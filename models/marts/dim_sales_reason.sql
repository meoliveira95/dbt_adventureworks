with 
    order_header_sales_reason as (
        select
            sales_order_id
            , sales_reason_id
        from
        {{ ref ('stg_sales_order_header_sales_reason') }}
)

, sales_reason as (
        select
            sales_reason_id
            , name_reason
            , reason_type
        from
        {{ ref ('stg_sales_reason') }}
)

, final as (
    select
        order_header_sales_reason.sales_order_id
        , order_header_sales_reason.sales_reason_id
        , sales_reason.name_reason
    from order_header_sales_reason
left join sales_reason
    on order_header_sales_reason.sales_reason_id = sales_reason.sales_reason_id
)

select *
from final
