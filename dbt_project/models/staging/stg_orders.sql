WITH orders_header AS (
    SELECT
        orderid,
        orderdate,
        customerid,
        employeeid,
        storeid,
        status AS order_status,
        updated_at AS order_updated_at
    FROM
        {{ source('bronze', 'orders') }}
),

order_items AS (
    SELECT
        orderid,
        orderitemid,
        productid,
        quantity,
        unitprice,
        -- Calculate revenue for the line item
        quantity * unitprice AS line_item_revenue
    FROM
        {{ source('bronze', 'orderitems') }}
)

SELECT
    -- Key Fields
    h.orderid,
    i.orderitemid,
    h.orderdate,
    h.order_status,
    
    -- Foreign Keys
    h.customerid,
    i.productid,

    -- Metrics
    i.quantity,
    i.unitprice,
    i.line_item_revenue,

    -- Metadata
    h.order_updated_at

FROM
    orders_header h
INNER JOIN
    order_items i ON h.orderid = i.orderid