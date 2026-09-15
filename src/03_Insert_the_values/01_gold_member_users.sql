USE ecommerce;
GO

INSERT INTO gold_member_users
(user_id, signup_date)
VALUES
('John', '2017-09-22'),
('Mary', '2017-04-21');
GO

SELECT *
FROM gold_member_users;