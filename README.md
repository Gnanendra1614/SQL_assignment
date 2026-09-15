SQL Assignment
Overview
This repository contains SQL solutions for the SQL Assignment. The assignment covers ecommerce database operations, aggregation, joins, string and date functions, table alterations, transactions, duplicate detection, and window functions.

The assignment is organized into five SQL files under the src directory.

# SQL Assignment

## Overview

This repository contains SQL solutions for the SQL Assignment. The assignment covers ecommerce database operations, aggregation, joins, string and date functions, table alterations, transactions, duplicate detection, and window functions.

The assignment is organized into five SQL files under the `src` directory, with each question grouped into its own folder.

## Repository File Structure

```text
SQL_assignment-main/
│
├── README.md
│
└── src/
    ├── question_01/
    │   └── 01_question.sql
    │
    ├── question_02/
    │   └── 01_questiuon.sql
    │
    ├── question_03/
    │   └── 01_question.sql
    │
    ├── question_04/
    │   └── 01_question.sql
    │
    └── question_05/
        └── 01_question.sql

File Description
src/question_01/01_question.sql

This file contains the main ecommerce database setup and SQL queries.

Topics covered:

Create the ecommerce database.
Create the following four tables:
gold_member_users
users
sales
product
Insert the provided dataset into the respective tables.
Display all tables in the database.
Count the records of all four tables using a single query.
Find the total amount spent by each customer.
Find the distinct dates on which each customer visited the website.
Find the first product purchased by each customer using sales and product tables.
Find the most purchased item of each customer and its purchase count.
Find the customer who is not a Gold Member.
Find the amount spent by each customer after becoming a Gold Member.
Find customer names starting with M.
Find the distinct customer IDs.
Rename the price column to price_value.
Change the product name from Ipad to Iphone.
Rename the gold_member_users table to gold_membership_users.
Add a status column to the Gold Membership table.
Demonstrate DELETE and ROLLBACK using a transaction.
Insert a duplicate product record.
Find duplicate records in the product table.
src/question_02/01_questiuon.sql

This file contains a product sales analysis based on different dates.

Topics covered:

Create the product_details table.
Insert the provided product sales data.
Remove duplicate product entries using DISTINCT.
Remove extra spaces using TRIM().
Count the number of different products sold on each date.
Display the names of the products sold on each date.
Use STRING_AGG() to combine product names into a single column.
Group and order the results by sale date.

Expected output columns:

sell_date
num_sold
product_list
src/question_03/01_question.sql

This file contains department-wise salary aggregation.

Topics covered:

Create the dept_tbl table.
Insert the provided employee and department data.
Extract department names from the id_deptname column.
Use SUBSTRING() to extract department names.
Use CHARINDEX() to locate the hyphen (-).
Calculate the total salary of each department using SUM().
Group the results by department.

Expected output columns:

Department
Total_Salary

Expected department totals:

Department	Total Salary
BIO	12300
CHEM	37000
MATH	30000
SCIENCE	20000
src/question_04/01_question.sql

This file contains SQL queries related to Gmail accounts, date functions, and NULL handling.

Topics covered:

Create the email_signup table.
Insert the provided email and signup-date data.
Identify Gmail accounts using LOWER() and LIKE.
Find the latest signup date using MAX().
Find the first signup date using MIN().
Calculate the difference between the first and latest signup dates using DATEDIFF().
Replace NULL signup dates with 1970-01-01.
Update the table and verify the results.

Expected output columns:

count_gmail_account
latest_signup_date
first_signup_date
diff_in_days
src/question_05/01_question.sql

This file contains SQL window-function problems using the sales_data table.

Topics covered:

Create the sales_data table with:
productid
sale_date
quantity_sold
Insert the provided sample sales data.
Assign ranks by partitioning data based on productid.
Find the latest sale for each product using RANK().
Retrieve the previous quantity_sold value using LAG().
Compare the current quantity with the previous quantity.
Return the first quantity sold using FIRST_VALUE().
Return the last quantity sold using LAST_VALUE().

Window functions practiced:

RANK()
LAG()
FIRST_VALUE()
LAST_VALUE()
PARTITION BY
ORDER BY
Database Tables
Ecommerce Tables
Table Name	Purpose
gold_member_users	Stores Gold Member customer details
users	Stores customer details
sales	Stores customer purchase transactions
product	Stores product details and prices
Additional Tables
Table Name	Purpose
product_details	Stores products sold on different dates
dept_tbl	Stores employee salary and department data
email_signup	Stores email IDs and signup dates
sales_data	Stores product-wise daily sales quantities
Main Ecommerce Dataset
Gold Members

The gold_member_users table contains:

user_id	signup_date
John	2017-09-22
Mary	2017-04-21
Users

The users table contains:

user_id	signup_date
John	2014-09-02
Michel	2015-01-15
Mary	2014-04-11
Products

The product table contains:

product_id	product_name	price
1	Mobile	980
2	Ipad	870
3	Laptop	330

During the assignment, the price column is renamed to price_value, and Ipad is updated to Iphone.

SQL Concepts Practiced

The assignment provides practice with:

Database creation
Table creation
Data types
INSERT
SELECT
UPDATE
DELETE
ALTER TABLE
sp_rename
DISTINCT
WHERE
LIKE
NOT IN
JOIN
GROUP BY
HAVING
ORDER BY
COUNT()
SUM()
MIN()
MAX()
DATEDIFF()
ISNULL()
TRIM()
SUBSTRING()
CHARINDEX()
STRING_AGG()
Subqueries
Transactions
BEGIN TRANSACTION
ROLLBACK
RANK()
LAG()
FIRST_VALUE()
LAST_VALUE()
PARTITION BY
Execution Order

Execute the SQL files in the following order:

1. src/question_01/01_question.sql
2. src/question_02/01_questiuon.sql
3. src/question_03/01_question.sql
4. src/question_04/01_question.sql
5. src/question_05/01_question.sql

The files should be executed in sequence where required because some queries depend on tables or changes made in earlier questions.

How to Run
Open SQL Server Management Studio (SSMS).
Connect to your SQL Server instance.
Open src/question_01/01_question.sql.
Execute the database creation and ecommerce table queries.
Insert the provided dataset.
Execute the remaining questions in the same file.
Open and execute the SQL files under question_02, question_03, question_04, and question_05.
Verify the output of each query using the Results grid.
Technologies Used
SQL
Microsoft SQL Server
SQL Server Management Studio (SSMS)
Git
GitHub
Key Learning Outcomes

By completing this assignment, the following SQL skills are practiced:

Creating and managing databases and tables.
Inserting and modifying data.
Writing queries using joins and subqueries.
Performing aggregation and grouping.
Working with string and date functions.
Handling NULL values.
Detecting duplicate records.
Using transactions and rollback.
Applying SQL window functions.
Comparing current and previous rows using LAG().
Ranking records using RANK().
Finding first and last values using window functions.
Author
Gnanendra Reddy Avula 