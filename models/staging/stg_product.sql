with source_data as (
    select *
    from
        {{ source ('adventureworks_etl', 'product' ) }}
)

, renamed as (
        select
            productid as product_id
            , name as product_name
            , productmodelid as product_model_id
            , productsubcategoryid as product_subcategory_id
            , sellenddate
            , listprice
            , daystomanufacture
            , productline
            , size
            , weight
            , color
            , safetystocklevel
            , finishedgoodsflag
            , class
            , makeflag
            , productnumber
            , sellstartdate
            , reorderpoint
            , modifieddate
            , rowguid
            , weightunitmeasurecode
            , standardcost
            , style
            , sizeunitmeasurecode
            , _sdc_received_at
            , _sdc_table_version
            , _sdc_sequence
            , _sdc_batched_at
        from
            source_data
)

select *
from renamed