SELECT DISTINCT
    created_date AS date,
    user_id AS customer_name
FROM sales
ORDER BY customer_name, date;