SELECT
    s.user_id AS customer_name,
    SUM(p.price) AS total_amount_spent
FROM sales s
JOIN product p
    ON s.product_id = p.product_id
GROUP BY s.user_id
ORDER BY s.user_id;