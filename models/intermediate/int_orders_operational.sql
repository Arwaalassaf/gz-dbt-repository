SELECT 
    o.orders_id,
    o.date_date,
    ROUND(s.shipping_fee - (s.logcost + s.ship_cost ), 2) AS operational_margin
    o.quantity,
    o.revenue,
    o.purchse_cost,
    o.margin,
    s.shipping_fee,
    s.logcost,
    s.ship_cost,
FROM {{ ref("int_sales_margin") }} O
LEFT JOIN {{ ref("stg_raw__ship") }} S
    USING(orders_id)
ORDER BY orders_id DESC