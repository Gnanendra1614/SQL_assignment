INSERT INTO sales
(user_id, created_date, product_id)
VALUES
('John',   '2017-04-19', 2),
('Mary',   '2019-12-18', 1),
('Michel', '2020-07-20', 3),
('John',   '2019-10-23', 2),
('John',   '2018-03-19', 3),
('Mary',   '2016-12-20', 1),
('John',   '2017-11-09', 1),
('Michel', '2016-05-20', 3),
('John',   '2017-09-24', 1),
('John',   '2016-03-11', 1),
('Mary',   '2016-11-10', 1),
('Mary',   '2017-12-07', 2);
GO

SELECT *
FROM sales;