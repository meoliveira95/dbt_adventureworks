with source_data as (
    select *
    from
        {{ source ('adventureworks_etl', 'salesperson' ) }}
)

, renamed as (
        select
            salesquota as sales_quota
            , saleslastyear as sales_last_year
            , territoryid as territory_id
            , businessentityid as business_entity_id
            , modifieddate
            , salesytd
            , rowguid
            , commissionpct
            , bonus
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
            , _sdc_table_version
        from
            source_data
)

select *
from renamed