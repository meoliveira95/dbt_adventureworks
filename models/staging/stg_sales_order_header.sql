with source_data as (
    select *
    from
        {{ source ('adventureworks_etl', 'salesorderheader' ) }}
)

, renamed as (
        select
            salesorderid as sales_order_id
            , billtoaddressid as bill_to_address_id
            , shipmethodid as ship_method_id
            , customerid as customer_id 
            , salespersonid as sales_person_id
            , taxamt as taxa_mt
            , shiptoaddressid as ship_to_address_id
            , territoryid as territory_id
            , currencyrateid as currency_rate_id
            , cast (orderdate as date) as order_date 
            , cast (shipdate as date) as ship_date
            , subtotal
            , creditcardid as credit_card_id 
            , freight 
            , totaldue as total_due
            , purchaseordernumber
            , shipdate
            , modifieddate
            , rowguid
            , onlineorderflag
            , accountnumber
            , status
            , creditcardapprovalcode
            , revisionnumber
            , _sdc_batched_at
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_table_version
        from
            source_data
)

select *
from renamed