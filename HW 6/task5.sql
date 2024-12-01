-- 1

SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS bill_count
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
GROUP BY s.staff_no, b.bill_date
HAVING COUNT(b.bill_no) >= 2;

-- 2

SELECT rt.room_name, COUNT(rt.table_no) AS table_count
FROM restRest_table rt
WHERE rt.no_of_seats > 6
GROUP BY rt.room_name;

-- 3

SELECT rt.room_name, SUM(b.bill_total) AS total_bills
FROM restRest_table rt
JOIN restBill b ON rt.table_no = b.table_no
GROUP BY rt.room_name;

-- 4

SELECT hs.first_name, hs.surname, SUM(b.bill_total) AS total_bill_amount
FROM restStaff hs
JOIN restStaff w ON hs.staff_no = w.headwaiter
JOIN restBill b ON w.staff_no = b.waiter_no
GROUP BY hs.staff_no
ORDER BY total_bill_amount DESC;

-- 5

SELECT b.cust_name, AVG(b.bill_total) AS average_spent
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;

-- 6

SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS bill_count
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
GROUP BY s.staff_no, b.bill_date
HAVING COUNT(b.bill_no) >= 3;
