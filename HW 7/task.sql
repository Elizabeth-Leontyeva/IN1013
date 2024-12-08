-- 1

CREATE VIEW samsBills AS
SELECT first_name, surname, bill_date, cust_name, bill_total
FROM bills
WHERE waiter_id = (SELECT waiter_id FROM waiters WHERE first_name = 'Sam' AND surname = 'Pitt');

-- 2

SELECT * FROM samsBills
WHERE bill_total > 400;

-- 3

CREATE VIEW roomTotals AS
SELECT room_name, SUM(bill_total) AS total_sum
FROM bills
GROUP BY room_name;

-- 4

CREATE VIEW teamTotals AS
SELECT CONCAT(first_name, ' ', surname) AS headwaiter_name, SUM(bill_total) AS total_sum
FROM bills
JOIN waiters ON bills.waiter_id = waiters.waiter_id
GROUP BY waiters.waiter_id;
