USE techno_main_saltlake;
CREATE TABLE faculty(
	id INT PRIMARY KEY,
    city VARCHAR(50),
    age INT,
    CONSTRAINT check_constraint CHECK (age <=60 AND city="Kolkata")
);

CREATE TABLE firstYearStudents(
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(2),
    city VARCHAR(50)
);

INSERT INTO firstYearStudents (rollno, name, marks, grade, city) VALUES 
(100, "Pratik", 98, "A", "Bardhaman"),
(101, "Ayaan", 98, "A", "Kolkata"),
(102, "Chandrima", 100, "A+", "Konnagar"),
(103, "Soumyajit", 95, "A", "Barasat"),
(104, "Shinjini", 92, "B", "Barrackpore");

INSERT INTO firstYearStudents (rollno, name, marks, grade, city) VALUES (105, "Shamik", 94, "B", "Barrackpore");

SELECT * FROM firstYearStudents;
SELECT city FROM firstYearStudents;
SELECT DISTINCT city FROM firstYearStudents;
SELECT * FROM firstYearStudents WHERE marks>95;
SELECT * FROM firstYearStudents WHERE marks BETWEEN 95 AND 98;
SELECT * FROM firstYearStudents WHERE city IN ("Konnagar", "Bardhaman");
SELECT * FROM firstYearStudents WHERE city NOT IN ("Konnagar", "Bardhaman");
SELECT * FROM firstYearStudents WHERE marks>95 LIMIT 2;
SELECT * FROM firstYearStudents WHERE marks>95 ORDER BY marks DESC LIMIT 2;
SELECT * FROM firstYearStudents ORDER BY marks ASC, name ASC;
SELECT MAX(marks) FROM firstYearStudents;
SELECT COUNT(name) FROM firstYearStudents;
SELECT city, COUNT(rollno) FROM firstYearStudents GROUP BY city;
SELECT city, marks, COUNT(rollno) FROM firstYearStudents GROUP BY city, marks;

-- find avg marks of each city in ascending order

SELECT city, AVG(marks) 
FROM firstYearStudents 
GROUP BY city 
ORDER BY AVG(marks);

CREATE TABLE payment(
	customer_id INT PRIMARY KEY,
    customer VARCHAR(50),
    mode VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO payment (customer_id, customer, mode, city) VALUES
(100, "Ayush", "Netbanking", "Hyderabad"),
(101, "Pratik", "Credit Card", "Kolkata"),
(102, "Chandrima", "Debit Card", "Kolkata"),
(103, "Ayaan", "Netbanking", "Kolkata"),
(104, "Kuntal", "Netbanking", "Bardhaman"),
(105, "Payel", "Debit Card", "Bardhaman"),
(106, "Titun", "Debit Card", "Bardhaman"),
(107, "Rajdip", "Credit Card", "Hyderabad");

-- find total payment according to each payment method

SELECT mode, COUNT(mode) FROM payment GROUP BY mode;

-- find total payment according to each payment method where count of mode is greater than 2
SELECT mode, COUNT(mode) 
FROM payment 
-- WHERE city="Kolkata"
GROUP BY mode
HAVING COUNT(mode) > 2 ;

-- General order to write SQL commands

-- select coulumn_name
-- from table_name
-- where condition_on_row
-- group by coulumn_name
-- having condition_on_groups
-- order by coulumn_name asc/desc;


-- to turn off safe mode command -> set SQL_SAFE_UPDATES = 0; 0 means off 1 means on. by default it is in on mode so that we don't perform updates on db.

-- update table_name
-- set col1=val1, col2=val2
-- where condition;

select * from firstyearstudents;

set SQL_SAFE_UPDATES = 0;

update firstyearstudents
set grade="O"
where grade="A+";

-- delete from table_name
-- where condition;

delete from firstyearstudents
where marks<93;

