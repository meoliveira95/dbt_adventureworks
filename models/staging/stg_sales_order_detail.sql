with source_data as (
    select *
    from
        {{ source ('adventureworks_etl', 'salesorderdetail' ) }}
)

, renamed as (
        select
            orderqty as order_qty
            , salesorderid as sales_order_id
            , salesorderdetailid as sales_order_detail_id
            , unitprice as unit_price
            , specialofferid as special_offer_id--ver se precisa categorizar
            , productid as product_id
            , carriertrackingnumber
            , unitpricediscount
            , modifieddate
            , rowguid
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
        from
            source_data
)

select *
from renamed