select
    products_id,
    date_date,
    orders_id,
    revenue,
    quantity,
    cast(purchse_price as INTEG) as price,
    round(s.quantity * cast(p.purchse_price as float64), 2) as purchse_cost,
    s.revenue - round(s.quantity * cast(p.purchse_price as float64), 2) as margin
from {{ ref("stg_raw__sales") }} s
left join {{ ref("stg_raw__product") }} p using (products_id)
