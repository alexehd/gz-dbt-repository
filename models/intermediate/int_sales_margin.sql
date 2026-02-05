select *,
    quantity*purchase_price AS purchase_cost,
    revenue-(quantity*purchase_price) AS margin

FROM {{ref('stg_raw__sales')}}
    LEFT JOIN {{ref('stg_raw__product')}}
    ON pdt_id = products_id 