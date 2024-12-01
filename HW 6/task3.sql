-- 1

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.cust_name = 'Tanya Singh';

-- 2

SELECT rm.room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' AND rm.room_name = 'Green'
  AND rm.room_date BETWEEN 20160201 AND 20160229;

-- 3

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

-- 4

SELECT b.cust_name, b.bill_total, s.first_name || ' ' || s.surname AS waiter_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- 5

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    SELECT b1.waiter_no
    FROM restBill b1
    WHERE b1.table_no IN (
        SELECT b2.table_no
        FROM restBill b2
        WHERE b2.bill_no IN (14, 17)
    )
);

-- 6

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    -- Waiters serving tables in the Blue room
    SELECT b.waiter_no
    FROM restBill b
    JOIN restRest_table rt ON b.table_no = rt.table_no
    WHERE rt.room_name = 'Blue' AND b.bill_date = 160312

    UNION

    -- Headwaiter managing the Blue room
    SELECT rm.headwaiter
    FROM restRoom_management rm
    WHERE rm.room_name = 'Blue' AND rm.room_date = 160312
);
