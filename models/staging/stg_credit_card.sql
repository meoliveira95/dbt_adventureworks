with source_data as (
    select *
    from
        {{ source ('adventureworks_etl', 'creditcard') }}
)

, renamed as (
        select 
            creditcardid as credit_card_id
            , cardtype as flag_credit_card
            , expmonth		
            , expyear
            , modifieddate
            , cardnumber		
            , _sdc_received_at
            , _sdc_table_version		
            , _sdc_sequence
            , _sdc_batched_at
        from
            source_data
)

select *
from renamed