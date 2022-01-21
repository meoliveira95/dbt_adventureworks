with source_data as (
    select *
    from
        {{ source ('adventureworks_etl', 'employee' ) }}
)

, renamed as (
        select 
            nationalidnumber as national_number_id
            , gender
            , businessentityid as business_entity_id
            , jobtitle as job_title
        from
            source_data
)

select *
from renamed