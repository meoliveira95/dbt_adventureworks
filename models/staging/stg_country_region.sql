with source_data as (
    select *
    from
        {{ source ('adventureworks_etl', 'countryregion') }}
)

, renamed as (
        select 
            countryregioncode as country_region_code
            , name as name_region
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

    