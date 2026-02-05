SELECT
    o.orders_id,
    o.date_date,
    o.revenue,
    o.quantity,
    o.purchase_cost,
    o.margin,
    s.ship_cost,
    s.shipping_fee,
    s.log_cost,
    ROUND((margin+shipping_fee)-(log_cost-CAST(ship_cost AS FLOAT64))) AS operational_margin,



FROM {{ref("int_orders_margin")}} AS o
LEFT JOIN {{ref('stg_raw__ship')}} AS s
    USING (orders_id)
ORDER BY 
    orders_id