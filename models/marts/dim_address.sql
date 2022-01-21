
with addres as (
    select 
         address_id
        , state_province_id
        , city_name
    from
        {{ ref ('stg_address') }}
)

, province as (
    select
        state_province_id
        , country_region_code
        , name_state
        , territory_id
        , state_province_code
        from
        {{ ref ('stg_state_province') }}
)

, country_region as (
        SELECT
            name_region
            , country_region_code
        from 
            {{ ref ('stg_country_region') }}
)

, final as (
    select 
        addres.address_id
        , addres.state_province_id
        , addres.city_name
        , province.name_state
        , province.country_region_code
        , country_region.name_region
        , province.territory_id
        , province.state_province_code
    from addres
    left join province
    on addres.state_province_id = province.state_province_id
    left join country_region
    on province.country_region_code = country_region.country_region_code
)

select *
from final