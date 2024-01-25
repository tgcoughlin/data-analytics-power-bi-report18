SELECT 
    dim_store.store_type,
    dim_store.country_code,
    ROUND(SUM(CAST(orders.product_quantity * dim_product.sale_price AS NUMERIC)), 2) AS Revenue

FROM 
    orders

JOIN
    dim_product ON orders.product_code = dim_product.product_code
JOIN
    dim_store ON orders.store_code = dim_store.store_code

WHERE
    orders.order_date::TIMESTAMP >= '2022-01-01'::TIMESTAMP AND orders.order_date::TIMESTAMP < '2023-01-01'::TIMESTAMP
    AND dim_store.country_code = 'DE'

GROUP BY
    dim_store.store_type, dim_store.country_code

ORDER BY    
    Revenue DESC

LIMIT 1

