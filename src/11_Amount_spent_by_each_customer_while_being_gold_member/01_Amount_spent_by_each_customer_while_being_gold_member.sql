SELECT
    s.user_id,
    SUM(p.price) AS gold_spent
FROM sales AS s
JOIN product AS p
    ON s.product_id = p.product_id
JOIN gold_member_users AS g
    ON s.user_id = g.user_id
WHERE s.created_date >= g.signup_date
GROUP BY s.user_id
ORDER BY s.user_id;