CREATE TABLE product_details
(
    sell_date DATE,
    product VARCHAR(100)
);

INSERT INTO product_details
(sell_date, product)
VALUES
('2020-05-30', 'Headphones'),
('2020-06-01', 'Pencil'),
('2020-06-02', 'Mask'),
('2020-05-30', 'Basketball'),
('2020-06-01', 'Book'),
('2020-06-02', 'Mask'),
('2020-05-30', 'T-Shirt');


WITH distinct_products AS
(
SELECT *
FROM product_details;

        sell_date,
        LTRIM(RTRIM(product)) AS product
    FROM product_details
)
SELECT
    sell_date,
    COUNT(*) AS num_sold,
    STRING_AGG(product, ', ') AS product_list
FROM distinct_products
GROUP BY sell_date
ORDER BY sell_date;