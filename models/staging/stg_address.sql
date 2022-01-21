with source_data as (
    select *
    from
        {{ source ('adventureworks_etl', 'address') }}
)
    
, renamed as (
        select 
            addressid as address_id
            , stateprovinceid as state_province_id
            , city as city_name
            , addressline1 as address_line_1
            , addressline2 as address_line_2
            , postalcode
            , modifieddate
            , rowguid
            , _sdc_table_version
            , spatiallocation
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
        from
            source_data
)

select *
from renamed