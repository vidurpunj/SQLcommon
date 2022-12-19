#Aggregate Functions
CREATE DATABASE SQLCOMMON;
DROP TABLE customer_orders;
CREATE TABLE customer_orders(first_name VARCHAR(10), last_name VARCHAR(10), amount DECIMAL(10,2),date DATETIME, city VARCHAR(10), quantity INT, postal_code INT);
INSERT INTO customer_orders(first_name, last_name, amount, date, city, quantity, postal_code) VALUES ('Raju', 'Malhotra', 120.50, '2020-06-06 09:10:55', 'Delhi', 1, 110078);
INSERT INTO customer_orders(first_name, last_name, amount, date, city, quantity, postal_code) VALUES ('Kaju', 'Srivastva', 285.00, '2020-06-06 11:21:32', 'Mumbai', 3, 400011);
INSERT INTO customer_orders(first_name, last_name, amount, date, city, quantity, postal_code) VALUES ('Vijay', 'Sinha', 835.43, '2020-06-08 18:12:15', 'Bengaluru', 4, 530068);
INSERT INTO customer_orders(first_name, last_name, amount, date, city, quantity, postal_code) VALUES ('Ajay', NULL, 643.62, '2020-06-01 18:12:15', NULL, NULL, 110033);
INSERT INTO customer_orders(first_name, last_name, amount, date, city, quantity, postal_code) VALUES ('Kirti', 'Banerjee', 1110.80, '2020-06-09 16:13:14', 'Kolkata', 1, 700032);
INSERT INTO customer_orders(first_name, last_name, amount, date, city, quantity, postal_code) VALUES ('Kanish', 'Murthy', 750.50, '2020-06-10 10:13:39', 'Bhopal', 5, 462001);
INSERT INTO customer_orders(first_name, last_name, amount, date, city, quantity, postal_code) VALUES ('Bhavaya', 'Rao', 2180.75, '2020-06-11 14:29:09', 'Indore', 4, 452001);
INSERT INTO customer_orders(first_name, last_name, amount, date, city, quantity, postal_code) VALUES ('Shivani', NULL, 1182.35, '2020-06-11 20:09:50', 'Jaipur', 1, 302001);
INSERT INTO customer_orders(first_name, last_name, amount, date, city, quantity, postal_code) VALUES ('Vaishali', 'Singh', 1000.50, '2020-06-12 08:10:50', 'Delhi', 2, 110034);
INSERT INTO customer_orders(first_name, last_name, amount, date, city, quantity, postal_code) VALUES ('Shrey', 'Aggrawal', 1322.90, '2020-06-13 10:12:12', 'Mumbai', 3, 400033);
SELECT * FROM customer_orders;
#COUNT will not count NULL
SELECT COUNT(city) FROM customer_orders;
# DICTINCT
SELECT COUNT(DISTINCT(city)) FROM customer_orders;
# SUM
SELECT SUM(amount) FROM customer_orders;
SELECT SUM(quantity) FROM customer_orders;
# Toatal amount spend city wise
SELECT city, SUM(amount) FROM customer_orders GROUP BY city;
# AVERAGE ORDER will the First come as they appear in table
SELECT city, AVG(amount) FROM customer_orders GROUP BY city;
# MIN and MAX
SELECT MIN(amount), MAX(amount) FROM customer_orders;
# Mathematical functions
SELECT city, amount - (SELECT AVG(amount) AS "Amount Devisation" FROM customer_orders) FROM customer_orders;
# convert nevagative to positive absolute values
SELECT city, ABS(amount - (SELECT AVG(amount) AS "Absolute Amount Devisation" FROM customer_orders)) FROM customer_orders;
# CEIL and FLOOR
SELECT first_name, city, amount, CEIL(amount), FLOOR(amount) FROM customer_orders;
# TRUNCATE
TRUNCATE TABLE any_table_name;
# MODULO MOD(x,y)
SELECT first_name, quantity, mod(quantity,2) FROM customer_orders;
SELECT first_name, quantity, amount, mod(amount,2) FROM customer_orders;

## String functions
# LOWER, UPPER
SELECT LOWER(first_name), UPPER(last_name) FROM customer_orders;
# CONCAT
SELECT CONCAT(first_name, ' ', last_name) FROM customer_orders;
# TRIM It removed the leading and trailing white space from the column
SELECT TRIM(CONCAT(first_name, ' ', last_name)) FROM customer_orders;

## DATE and TIME functions
# date() and time()
SELECT first_name, date, DATE(date), TIME(date) FROM customer_orders;
# Extract 
# YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
SELECT CONCAT(first_name, ' ', last_name), YEAR(date), MONTH(date), HOUR(date), MINUTE(date), SECOND(date), QUARTER(date) FROM customer_orders;
SELECT CONCAT(first_name, ' ', last_name), date, DATE_FORMAT(date, "%d %b %Y") FROM customer_orders;

# WINDOWS FUNCTION
SELECT first_name, city, amount, SUM(amount) OVER (ORDER BY city) FROM customer_orders;

# RANK
SELECT first_name, city, amount, RANK() OVER(PARTITION BY city ORDER BY amount DESC) FROM customer_orders;
# DENSE RANK
SELECT first_name, city, amount, DENSE_RANK() OVER(PARTITION BY city ORDER BY amount) FROM customer_orders;

# PERCENT_VALUE
SELECT first_name, city, amount, PERCENT_RANK() OVER(ORDER BY amount desc) FROM customer_orders;
# FIND Nth Top values
SELECT first_name, amount, NTH_VALUE(first_name, 1) OVER(ORDER BY amount DESC)FROM customer_orders;
SELECT first_name, amount, NTH_VALUE(first_name, 2) OVER(ORDER BY amount DESC)FROM customer_orders;

# More functions
#CONVERT
SELECT first_name, amount, date, CONVERT(date, date) FROM customer_orders;

# ISNULL
SELECT first_name, last_name, ISNULL(last_name) FROM customer_orders;

# IF
SELECT first_name, amount, if(amount > 1000, "Yes", "No") FROM customer_orders;

# CASE
SELECT first_name, amount, 
case 
WHEN amount < 200 THEN "< 200"
WHEN amount > 1200 THEN "> 1200"
ELSE "No Match"
END AS value_check FROM customer_orders;

## 












































