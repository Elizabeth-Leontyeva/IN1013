-- 1

SELECT bill_date, bill_total
FROM restBill
WHERE cust_name = 'Bob Crow';

-- 2

SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE '% Smith'
ORDER BY cust_name DESC;

-- 3

SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE '% C%';

-- 4

SELECT DISTINCT first_name, surname
FROM restStaff
WHERE staff_no IN (SELECT DISTINCT headwaiter FROM restStaff WHERE headwaiter IS NOT NULL);

-- 5

SELECT *
FROM restBill
WHERE bill_date BETWEEN 20160201 AND 20160229;

-- 6

SELECT DISTINCT bill_date
FROM restBill
WHERE bill_date BETWEEN 20150101 AND 20151231
ORDER BY bill_date;
