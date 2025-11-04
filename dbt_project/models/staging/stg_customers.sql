SELECT
    customerid,
    firstname,
    lastname,
    TRIM(LOWER(email)) AS email,
    phone,
    address,
    city,
    UPPER(TRIM(state)) AS state,
    zipcode,
    updated_at,
    regionid
FROM
    {{ source('bronze', 'customers') }}