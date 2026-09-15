SELECT
    product_id,
    product_name,
    price_value,
    COUNT(*) AS duplicate_count
FROM product
GROUP BY
    product_id,
    product_name,
    price_value
HAVING COUNT(*) > 1;