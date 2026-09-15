-- 1. Create Database
CREATE DATABASE ecommerce;

-- 2. Create 4 tables under ecommerce database
CREATE TABLE gold_member_users (
    userid VARCHAR(50),
    signup_date DATE
);

CREATE TABLE users (
    userid VARCHAR(50),
    signup_date DATE
);

CREATE TABLE sales (
    userid VARCHAR(50),
    created_date DATE,
    product_id INT
);

CREATE TABLE product (
    product_id INT,
    product_name VARCHAR(50),
    price INT
);

-- 3. Insert values with respective datatypes
INSERT INTO gold_member_users
VALUES
('John','2017-09-22'),
('Mary','2017-04-21');

INSERT INTO users
VALUES
('John','2014-09-02'),
('Michel','2015-01-15'),
('Mary','2014-04-11');

INSERT INTO sales
VALUES
('John','2017-04-19',2),
('Mary','2019-12-18',1),
('Michel','2020-07-20',3),
('John','2019-10-23',2),
('John','2018-03-19',3),
('Mary','2016-12-20',2),
('John','2016-11-09',1),
('John','2016-05-20',3),
('Michel','2017-09-24',1),
('John','2017-03-11',2),
('John','2016-03-11',1),
('Mary','2016-11-10',1),
('Mary','2017-12-07',2);

INSERT INTO product
VALUES
(1,'Mobile',980),
(2,'Ipad',870),
(3,'Laptop',330);

-- 4. Show all the tables in the same database
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES;

-- 5. Count all the records of all four tables using a single query
SELECT
    (SELECT COUNT(*) FROM gold_member_users) AS gold_count,
    (SELECT COUNT(*) FROM users) AS user_count,
    (SELECT COUNT(*) FROM sales) AS sales_count,
    (SELECT COUNT(*) FROM product) AS product_count;

-- 6. Total amount each customer spent on the ecommerce company
SELECT
    s.userid,
    SUM(p.price) AS total_spent
FROM sales AS s
JOIN product AS p
    ON s.product_id = p.product_id
GROUP BY s.userid;

-- 7. Distinct dates each customer visited the website (date, customer name)
SELECT DISTINCT
    created_date AS date,
    userid AS customer_name
FROM sales
ORDER BY userid;

-- 8. First product purchased by each customer (using users, sales, product)
SELECT
    s.userid,
    p.product_name
FROM sales AS s
JOIN product AS p
    ON s.product_id = p.product_id
JOIN (
    -- This subquery finds the first purchase date for each user
    SELECT
        userid,
        MIN(created_date) AS first_purchase_date
    FROM sales
    GROUP BY userid
) AS first_sales
    ON s.userid = first_sales.userid
    AND s.created_date = first_sales.first_purchase_date;

-- 9. Most purchased item of each customer and how many times purchased
--    (item_count, customer name)
SELECT
    userid,
    COUNT(product_id) AS item_count
FROM sales
GROUP BY userid
ORDER BY item_count DESC;

-- 10. Customers who are not gold_member_users
SELECT userid
FROM users
WHERE userid NOT IN
(
    SELECT userid
    FROM gold_member_users
);

-- 11. Amount spent by each customer while he was a gold_member (order by user)
SELECT s.userid,
    SUM(p.price) AS gold_spent
FROM sales AS s
JOIN product AS p
    ON s.product_id = p.product_id
JOIN gold_member_users AS g
    ON s.userid = g.userid
WHERE s.created_date >= g.signup_date
GROUP BY s.userid
ORDER BY s.userid;

-- 12. Customer names whose name starts with M
SELECT userid
FROM users
WHERE userid LIKE 'M%';

-- 13. Distinct customer id of each customer
SELECT DISTINCT userid
FROM users;

-- 14. Change the column name from product table as price_value from price
EXEC sp_rename 'product.price', 'price_value', 'COLUMN';

SELECT * FROM product;

-- 15. Change the column value product_name - Ipad to Iphone
UPDATE product
SET product_name = 'Iphone'
WHERE product_name = 'Ipad';

SELECT * FROM product;

-- 16. Change the table name of gold_member_users to gold_membership_users
EXEC sp_rename 'gold_member_users', 'gold_membership_users';

-- 17. Create a new column Status in gold_membership_users
--     (Yes if gold member, No otherwise)
ALTER TABLE gold_membership_users
ADD status VARCHAR(10);

UPDATE gold_membership_users
SET status = 'Yes';

SELECT * FROM gold_membership_users;

-- 18. Delete userids 1,2 from users table and rollback the changes
--     (deleted one by one; result mentioned after rollback)
BEGIN TRANSACTION;

DELETE FROM users WHERE userid = 'John';

ROLLBACK TRANSACTION;

SELECT * FROM users;

-- 19. Insert one more record as (3,'Laptop',330) into product table
INSERT INTO product VALUES (3, 'Laptop', 330);

SELECT * FROM product;

-- 20. Query to find the duplicates in product table
SELECT product_id, product_name, price_value, COUNT(*) AS cnt
FROM product
GROUP BY product_id, product_name, price_value
HAVING COUNT(*) > 1;