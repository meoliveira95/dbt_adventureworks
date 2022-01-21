with source_data as (
    select *
    from
        {{ source ('adventureworks_etl', 'salesorderheadersalesreason' ) }}
)

, renamed as (
        select
            salesorderid as sales_order_id
            , salesreasonid as sales_reason_id
            , modifieddate		
            , _sdc_sequence		
            , _sdc_table_version	
            , _sdc_received_at
            , _sdc_batched_at
        from
            source_data
)

select *
from renamed