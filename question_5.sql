SELECT 
    dim_store.country_region AS Region,
    dim_product.category AS Category,
    ROUND(SUM(CAST((orders.product_quantity * dim_product.sale_price) - (orders.product_quantity * dim_product.cost_price) AS NUMERIC)), 2) AS "Total Profit"

FROM 
    orders

JOIN
    dim_product ON orders.product_code = dim_product.product_code
JOIN    
    dim_store ON orders.store_code = dim_store.store_code

WHERE
    dim_store.country_region = 'Wiltshire'
    AND EXTRACT(YEAR FROM orders.order_date::TIMESTAMP) = 2021 

GROUP BY
    dim_store.country_region, dim_product.category 

ORDER BY    
     "Total Profit" DESC

LIMIT 1

