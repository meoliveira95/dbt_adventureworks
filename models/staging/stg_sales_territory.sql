with source_data as (
    select *
    from
        {{ source ('adventureworks_etl', 'salesterritory' ) }}
)

, renamed as (
        select
            countryregioncode as country_region_code
            , name as name_region
            , territoryid as territory_id
            , modifieddate
            , rowguid
            , saleslastyear
            , costlastyear
            , salesytd
            , costytd
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
            , _sdc_table_version
        from
            source_data
)

select *
from renamed