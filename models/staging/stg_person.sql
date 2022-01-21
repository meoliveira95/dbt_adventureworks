with source_data as (
    select *
    from
        {{ source ('adventureworks_etl', 'person' ) }}
)

, renamed as (
        select 
            firstname as first_name
            , lastname as last_name
            , persontype as person_type
            , businessentityid as business_entity_id
            , middlename
            , title	
            , namestyle
            , suffix
            , modifieddate
            , rowguid	
            , emailpromotion
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
            , _sdc_table_version
        from
            source_data
)

select *
from renamed