-- 1

SELECT DISTINCT b.cust_name
FROM restBill b
JOIN restRoom_management rm ON b.table_no IN (
    SELECT table_no FROM restRest_table WHERE room_name = rm.room_name
)
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE b.bill_total > 450.00 AND s.first_name = 'Charles';

-- 2

SELECT s.first_name, s.surname
FROM restRoom_management rm
JOIN restRest_table rt ON rm.room_name = rt.room_name
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE rt.table_no = (
    SELECT table_no
    FROM restBill
    WHERE cust_name = 'Nerida' AND bill_date = 20160111
);

-- 3

SELECT b.cust_name
FROM restBill b
WHERE b.bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);

-- 4

SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no NOT IN (
    SELECT DISTINCT waiter_no
    FROM restBill
);

-- 5

SELECT b.cust_name, hs.first_name AS headwaiter_first_name, hs.surname AS headwaiter_surname, rt.room_name
FROM restBill b
JOIN restRest_table rt ON b.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name
JOIN restStaff hs ON rm.headwaiter = hs.staff_no
WHERE b.bill_total = (
    SELECT MAX(bill_total)
    FROM restBill
);
