SELECT
    regionid,
    regionname,
    country,
    continent,
    timezone,
    created_at
FROM
    {{ source('bronze', 'regions') }}