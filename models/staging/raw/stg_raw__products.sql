 -- stg_raw__products.sql

 with

 source as (

     select * from {{ source('raw', 'products') }}

 ),

 renamed2 as (

     select
        products_id,
        purchSE_PRICE

     from source

 )

 select * from renamed2