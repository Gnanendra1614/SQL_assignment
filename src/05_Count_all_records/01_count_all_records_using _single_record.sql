SELECT
    (SELECT COUNT(*) FROM gold_member_users) AS gold_member_count,
    (SELECT COUNT(*) FROM users) AS users_count,
    (SELECT COUNT(*) FROM sales) AS sales_count,
    (SELECT COUNT(*) FROM product) AS product_count;