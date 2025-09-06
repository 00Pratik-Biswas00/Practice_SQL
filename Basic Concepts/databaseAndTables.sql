-- For creating a database -
CREATE DATABASE techno_main_saltlake;
CREATE DATABASE epam_systems_india;
create database epam_india;
-- Create db if it is not pre exist 
CREATE DATABASE IF NOT EXISTS techno_main_saltlake;

-- For deleting a database -
DROP DATABASE epam_india;
DROP DATABASE epam_systems_india;
-- delete db if it exists
DROP DATABASE IF EXISTS epam_systems_india;

-- To use a database -
USE techno_main_saltlake;

-- To create a table (schema) -
CREATE TABLE student (
id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL
);

DROP TABLE student;

-- To insert data into a table (schema) -
INSERT INTO student VALUES (1, "Pratik", 21);
INSERT INTO student (id, name, age) VALUES (2, "Chandrima", 22), (3, "Ayaan", 23);


-- To print all data from a table (schema) -
SELECT * FROM student;

-- To show databases or tables -
SHOW DATABASES;
SHOW TABLES;


