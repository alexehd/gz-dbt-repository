 -- stg_raw__ship.sql

with

 source as (

     select * from {{ source('raw', 'ship') }}

 ),

 renamed1 as (

     select
         orders_id,
         shipping_fee,
         shipping_fee_1,
         logCost,
         ship_cost

     from source

 )

 select * from renamed1