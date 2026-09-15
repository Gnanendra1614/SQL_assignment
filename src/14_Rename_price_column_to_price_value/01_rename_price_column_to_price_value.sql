USE ecommerce;
GO

EXEC sp_rename
    'product.price',
    'price_value',
    'COLUMN';

SELECT *
FROM product;