-- created users table
CREATE TABLE users(
 user_id SERIAL PRIMARY KEY,
 name VARCHAR(50),
 city VARCHAR(50)
);

-- insert multiple data into users 
INSERT INTO users(user_id, name, city) VALUES 
(1,'Priya','Mumbai'),
(2,'Rahul','Delhi'),
(3,'Arjun','Chennai'),
(4,'Meera','Bangalore'),
(5,'Ayush','Surat'),
(6,'Shruti','Pune'),
(7,'Nidhi','Mumbai'),
(8,'Om','Mumbai'),
(9,'Yash','Ahmedabad'),
(10,'Rutwa','Bangalore');

-- created purchases table
CREATE TABLE purchases(
purchase_id SERIAL PRIMARY KEY,
purchase_date DATE,
amount NUMERIC,
user_id INTEGER NOT NULL REFERENCES users(user_id)
);

-- insert multiple data into purchases 
INSERT INTO purchases(purchase_id, purchase_date, amount, user_id) VALUES
(101,'2024-06-01',5000,1),
(102,'2024-06-05',7000,1),
(103,'2024-06-07',3000,2),
(104,'2024-06-10',2500,3),
(105,'2024-06-15',6000,5),
(106,'2024-06-20',3500,4),
(107,'2024-06-25',4000,2),
(108,'2024-06-01',5500,7),
(109,'2024-06-03',2500,8),
(110,'2024-06-05',7200,9),
(111,'2024-06-08',4100,10),
(112,'2024-06-10',6300,6),
(113,'2024-06-12',4800,7),
(114,'2024-06-14',3100,8),
(115,'2024-06-15',3900,9),
(116,'2024-06-18',5700,10),
(117,'2024-06-20',8000,6);

-- select all
SELECT * FROM users;
SELECT * FROM purchases;

-- Add a new column to users
ALTER TABLE users ADD COLUMN email VARCHAR(100), ADD COLUMN gender char;

-- Drop newly added column 
ALTER TABLE users DROP COLUMN gender;

-- Rename table and column
ALTER TABLE users RENAME TO customers; -- table rename 
ALTER TABLE customers RENAME COLUMN name TO user_name; -- column rename
ALTER TABLE customers RENAME TO users;

-- insert multiple data into 1 column 
UPDATE users 
SET email = CASE user_id
WHEN 1 THEN'priya@gmail.com'
WHEN 2 THEN'rahul12@gmail.com'
WHEN 3 THEN'arjunn@gmail.com'
WHEN 4 THEN'meera@gmail.com'
WHEN 5 THEN'ayush2110@gmail.com'
WHEN 6 THEN'shruti27@gmail.com'
WHEN 7 THEN'nidz12@gmail.com'
WHEN 8 THEN'om0224@gmail.com'
WHEN 9 THEN'yash19@gmail.com'
WHEN 10 THEN'19rutwa@gmail.com'
END
WHERE user_id IN (1,2,3,4,5,6,7,8,9,10);

-- insert single data into users 
INSERT INTO users(user_name,city,email) VALUES 
('Gita','Bhopal','gitac@ldce.ac.in');

-- basic SELECT queries 
SELECT user_name FROM users; -- one col
SELECT user_name,email FROM users; -- multiple cols

-- order by queries
SELECT user_name,city FROM users ORDER BY city ASC; -- in ascending 
SELECT * FROM purchases ORDER BY purchase_date DESC; -- in descending
SELECT user_id,user_name,city FROM users ORDER BY user_name ASC, city DESC;  

-- WHERE clause 
SELECT * FROM users WHERE city='Mumbai';
SELECT * FROM users WHERE user_name='Nidhi' AND city='Mumbai';
SELECT user_name,city FROM users WHERE city IN ('Bangalore','Surat','Ahmedabad');

UPDATE users SET user_name='RAHUL' WHERE user_name='Rahul'; -- update query
SELECT * FROM users WHERE user_name LIKE '%u%'; --LIKE(case-sensitive)
SELECT * FROM users WHERE user_name ILIKE '%u%'; --ILIKE(case-insensitive)

-- Join examples
DELETE FROM purchases WHERE user_id=6; -- delete query
SELECT * FROM purchases AS p INNER JOIN users AS u ON p.user_id=u.user_id;
SELECT * FROM users AS u LEFT JOIN purchases AS p ON u.user_id=p.user_id;
SELECT * FROM users AS u RIGHT JOIN purchases AS p ON u.user_id=p.user_id;
SELECT * FROM users AS u FULL JOIN purchases AS p ON u.user_id=p.user_id;

-- aggregation with GROUP BY
SELECT u.user_id,u.user_name,u.email,
	COUNT(p.purchase_id) AS purchase, 
	SUM(p.amount) AS total
FROM users AS u INNER JOIN purchases AS p ON u.user_id=p.user_id
GROUP BY u.user_id;

SELECT u.user_id,u.user_name,u.email,
	COUNT(p.purchase_id) AS purchase, 
	SUM(p.amount) AS total
FROM users AS u INNER JOIN purchases AS p ON u.user_id=p.user_id
GROUP BY u.user_id 
HAVING COUNT(p.purchase_id)>1 AND SUM(p.amount)>10000;

-- subqueries

SELECT * FROM purchases WHERE user_id IN
(SELECT user_id FROM users WHERE city='Bangalore');

SELECT user_id,user_name,email FROM users WHERE EXISTS 
(SELECT 1 FROM purchases WHERE users.user_id=purchases.user_id);

-- delete table
DROP TABLE IF EXISTS purchases;
DROP TABLE IF EXISTS users;

