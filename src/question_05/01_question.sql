-- Window Functions - sales_data

-- 1. Create table
CREATE TABLE sales_data (
    productid INT,
    sale_date DATE,
    quantity_sold INT
);

-- 2. Insert sample data
INSERT INTO sales_data (productid, sale_date, quantity_sold) VALUES
(1, '2022-01-01', 20),
(2, '2022-01-01', 15),
(1, '2022-01-02', 10),
(2, '2022-01-02', 25),
(1, '2022-01-03', 30),
(2, '2022-01-03', 18),
(1, '2022-01-04', 12),
(2, '2022-01-04', 22);

-- 3. Assign rank by partition based on product_id; find latest product sold
SELECT * FROM (
    SELECT productid, sale_date, quantity_sold,
        RANK() OVER (PARTITION BY productid ORDER BY sale_date DESC) AS rnk
    FROM sales_data
) AS ranked_data
WHERE rnk = 1;

-- 4. Retrieve quantity_sold from previous row and compare
SELECT productid, sale_date, quantity_sold,
    LAG(quantity_sold) OVER (PARTITION BY productid ORDER BY sale_date)
        AS previous_quantity,
    quantity_sold - LAG(quantity_sold) OVER (PARTITION BY productid ORDER BY sale_date)
        AS difference
FROM sales_data;

-- 5. Partition based on product_id; return first and last values in ordered set
SELECT productid, sale_date, quantity_sold,
    FIRST_VALUE(quantity_sold) OVER (PARTITION BY productid ORDER BY sale_date)
        AS first_sale_quantity,
    LAST_VALUE(quantity_sold) OVER (
        PARTITION BY productid ORDER BY sale_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS last_sale_quantity
FROM sales_data;