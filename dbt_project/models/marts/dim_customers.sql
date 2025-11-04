SELECT
    c.customerid,
    c.firstname,
    c.lastname,
    c.email,
    c.city,
    c.state,
    c.zipcode,
    r.regionname,
    r.country,
    r.continent,
    c.updated_at
    
FROM
    {{ ref('stg_customers') }} c 
LEFT JOIN
    {{ ref('stg_regions') }} r  
    ON c.regionid = r.regionid