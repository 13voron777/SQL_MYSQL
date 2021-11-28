# HW 1 Task 2
CREATE DATABASE MyDB;

USE MyDB; 


# HW 1 Task 3               
CREATE TABLE emp_names
(
	 id INT AUTO_INCREMENT NOT NULL,
     name VARCHAR(30),
     telephone_number VARCHAR(30),
     PRIMARY KEY (id)
);

CREATE TABLE emp_salaries
(
	 id INT AUTO_INCREMENT NOT NULL,
	 salary FLOAT,
     position VARCHAR(30),
     PRIMARY KEY (id)
);

CREATE TABLE emp_personal
(
	 id INT AUTO_INCREMENT NOT NULL,
     marital_status VARCHAR(30),
     birth_date DATE,
     place_of_residence VARCHAR(30),
     PRIMARY KEY (id)
)