SELECT 
    TO_CHAR(DATE_TRUNC('month', orders.order_date::TIMESTAMP), 'Month') AS month,
    ROUND(SUM(CAST(orders.product_quantity * dim_product.sale_price AS NUMERIC)), 2) AS Revenue

FROM 
    orders

JOIN
    dim_product ON orders.product_code = dim_product.product_code

WHERE
    orders.order_date::TIMESTAMP >= '2022-01-01'::TIMESTAMP AND orders.order_date::TIMESTAMP < '2023-01-01'::TIMESTAMP

GROUP BY
    month

ORDER BY    
    Revenue DESC

LIMIT 1

