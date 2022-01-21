with credit_card as (
    select
        credit_card_id
        , flag_credit_card
    from
        {{ ref ('stg_credit_card') }}
)

select *
from credit_card