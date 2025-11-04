SELECT
    productid,
    name AS product_name,
    category,
    -- CAST prices to the correct DECIMAL type
    CAST(retailprice AS DECIMAL(10, 2)) AS retail_price,
    CAST(supplierprice AS DECIMAL(10, 2)) AS cost_price,
    supplierid,
    updated_at,
    
    -- Calculate a new metric: Profit Margin
    CAST(retailprice - supplierprice AS DECIMAL(10, 2)) AS gross_profit_per_unit

FROM
    {{ source('bronze', 'products') }}