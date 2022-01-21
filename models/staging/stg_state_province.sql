with source_data as (
    select *
    from
        {{ source ('adventureworks_etl', 'stateprovince' ) }}
)

, renamed as (
        select
            stateprovinceid as state_province_id
            , countryregioncode as country_region_code
            , name as name_state
            , territoryid as territory_id
            , stateprovincecode as state_province_code
            , modifieddate
            , rowguid
            , isonlystateprovinceflag
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
        from
            source_data
)

select *
from renamed