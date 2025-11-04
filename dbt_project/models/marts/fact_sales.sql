SELECT
    o.orderid,
    o.orderitemid,
    o.customerid,
    o.productid,
    o.orderdate,
    o.quantity,
    o.unitprice,
    o.line_item_revenue,
    p.cost_price,
    o.quantity * p.cost_price AS line_item_cost,
    o.line_item_revenue - (o.quantity * p.cost_price) AS line_item_profit
    
FROM
    {{ ref('stg_orders') }} o
LEFT JOIN
    {{ ref('stg_products') }} p
    ON o.productid = p.productid
WHERE
    o.order_status IN ('SH', 'DL')