
SELECT 
    dim_store.store_type as "Store Type",
    ROUND(SUM(CAST(orders.product_quantity * dim_product.sale_price AS NUMERIC)), 2) AS "Total Sales",
    ROUND((SUM(CAST(orders.product_quantity * dim_product.sale_price AS NUMERIC)) / 
           SUM(SUM(CAST(orders.product_quantity * dim_product.sale_price AS NUMERIC))) OVER () ) * 100, 2) AS "% of Total Sales",
    COUNT(orders.order_date) AS "Number of Orders"

FROM    
    orders
JOIN
    dim_product ON orders.product_code = dim_product.product_code
JOIN    
    dim_store ON orders.store_code = dim_store.store_code

GROUP BY
    dim_store.store_type;