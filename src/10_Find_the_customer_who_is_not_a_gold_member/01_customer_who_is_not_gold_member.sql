SELECT user_id
FROM users
WHERE user_id NOT IN
(
    SELECT user_id
    FROM gold_member_users
);