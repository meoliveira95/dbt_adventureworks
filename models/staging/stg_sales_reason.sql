with source_data as (
    select *
    from
        {{ source ('adventureworks_etl', 'salesreason' ) }}
)

, renamed as (
        select
            salesreasonid as sales_reason_id
            , name as name_reason
            , reasontype as reason_type
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