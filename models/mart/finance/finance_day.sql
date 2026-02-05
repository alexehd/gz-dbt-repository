WITH orders_per_day AS
(
SELECT
    date_date,
    COUNT(DISTINCT orders_id) AS nb_of_transactions,
    ROUND(SUM(revenue)) AS revenue,
    ROUND(SUM(shipping_fee)) AS shipping_fee,
    ROUND(SUM(ship_cost)) AS ship_cost,
    ROUND(SUM(log_cost)) AS log_cost,
    ROUND(SUM(purchase_cost)) AS purchase_cost,
    ROUND(SUM(margin)) AS margin,
    ROUND(SUM(operational_margin)) AS operational_margin,
    ROUND(SUM(quantity)) AS quantity,




FROM {{ref('int_orders_operational')}}
    GROUP BY date_date
)

SELECT
    date_date,
    nb_of_transactions,
    revenue,
    margin,
    operational_margin,
    purchase_cost,
    shipping_fee,
    log_cost,
    ship_cost,
    quantity,
    ROUND(revenue/NULLIF(nb_of_transactions, 0), 2) AS average_basket

 FROM orders_per_day
 ORDER BY  date_date DESC