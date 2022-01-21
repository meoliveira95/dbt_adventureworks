with source_data as (
    select *
    from
        {{ source ('adventureworks_etl', 'customer') }}
)

, renamed as (
        select 
            customerid as customer_id
            , personid  as person_id -- fazer '' the null
            , territoryid as territory_id
            , storeid as store_id
            , modifieddate
            , rowguid
            , _sdc_received_at
            , _sdc_table_version
            , _sdc_sequence
            , _sdc_batched_at
        from
            source_data
)

select *
from renamed