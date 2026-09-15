SELECT
    s.user_id,
    p.product_name
FROM sales AS s
JOIN product AS p
    ON s.product_id = p.product_id
JOIN
(
    SELECT
        user_id,
        MIN(created_date) AS first_purchase_date
    FROM sales
    GROUP BY user_id
) AS first_purchase
    ON s.user_id = first_purchase.user_id
    AND s.created_date = first_purchase.first_purchase_date
ORDER BY s.user_id;