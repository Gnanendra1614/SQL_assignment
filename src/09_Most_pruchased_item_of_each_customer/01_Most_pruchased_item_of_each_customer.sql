WITH product_counts AS
(
    SELECT
        s.user_id AS customer_name,
        p.product_name,
        COUNT(*) AS item_count
    FROM sales AS s
    JOIN product AS p
        ON s.product_id = p.product_id
    GROUP BY
        s.user_id,
        p.product_name
),
ranked_products AS
(
    SELECT
        customer_name,
        product_name,
        item_count,
        ROW_NUMBER() OVER
        (
            PARTITION BY customer_name
            ORDER BY item_count DESC
        ) AS rn
    FROM product_counts
)
SELECT
    customer_name,
    item_count
FROM ranked_products
WHERE rn = 1
ORDER BY customer_name;