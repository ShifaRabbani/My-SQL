-- One to One relationship
DROP DATABASE IF EXISTS national_id_db;

CREATE DATABASE national_id_db; 
USE national_id_db; 

CREATE Table person(
    person_id int PRIMARY KEY,
    name VARCHAR(75),
    DOB DATE
);
INSERT into person(person_id,name,DOB)
VALUES
(1,"Ali",'2001-10-10'),
(2,"Bilal",'2005-02-20'),
(3,"Kainat",'2007-02-02'),
(4,"dani",'2002-08-09'),
(5,"yousuf",'2003-06-05');
SHOW TABLES;
SELECT * from person;


CREATE Table passport(
    passportID int PRIMARY key,
    passport_num int,
    person_id int UNIQUE,
    Foreign Key (person_id)REFERENCES person(person_id)
);
DROP TABLE passport;
insert into passport(passportID,passport_num,person_id)
VALUES
(101,1234392,1),
(102,1287432,2),
(103,1098342,3),
(104,1239814,4),
(105,9823432,5);
SELECT * from passport;

SELECT * from person JOIN passport ON person.person_id = passport.person_id;

SELECT person_id,name from person;
-- Update a passport_num  of id 5 person 
UPDATE passport set passport_num = 3433432 WHERE person_id = 5;

-- One to many relationship
DROP DATABASE company_db;
CREATE DATABASE company_db;
USE company_db;
CREATE table dep_db(
    dep_id int PRIMARY key,
    dep_name VARCHAR (75)
);
INSERT into dep_db
(dep_id,dep_name)
VALUES
(01,"Software"),
(02,"Cloud_Eng"),
(03,"DevOps");
SELECT * FROM  dep_db;

CREATE Table emp_db(
    emp_id int PRIMARY KEY,
    emp_name VARCHAR (55),
    dep_id int,
    Foreign Key (dep_id) REFERENCES dep_db(dep_id)
);

INSERT into emp_db
(emp_id,emp_name,dep_id)
VALUES
(1,"Noreen",01),
(2,"Arshad",03),
(3,"Mehmood",01),
(4,"Laiba",02),
(5,"Mehak",03),
(6,"Sana",01),
(7,"Yasir",03),
(8,"basit",02),
(9,"Sohail",01),
(10,"Zainb",03);

INSERT into emp_db
(emp_id,emp_name,dep_id)
VALUES
(11,"iram",04);

UPDATE emp_db set dep_id = 01 WHERE emp_id = 10;
SELECT * from emp_db;

SELECT dep_db.dep_id, dep_db.dep_name, emp_db.emp_id, emp_db.emp_name
FROM dep_db 
JOIN emp_db ON dep_db.dep_id = emp_db.dep_id
ORDER BY emp_db.emp_id;



-- Many many to many relationship
CREATE DATABASE uni_db;
use uni_db;
CREATE table student_db(
    studentId int PRIMARY key,
    stu_name VARCHAR (75)
);
INSERT into student_db
(studentId,stu_name)
VALUES
(111,"Anam"),
(222,"Shaban"),
(333,'Rehman');

SELECT * from student_db;
DROP table courses_db;
CREATE table courses_db(
    coursesId int PRIMARY key,
    courses_name VARCHAR (100)
);
INSERT into courses_db
(coursesId , courses_name)
VALUES
(1010 , "RDBMS"),
(2020 , "Cyber_Sec"),
(3030 ,"C++");

SELECT * from courses_db;


CREATE table enrollment_db(
    studentId int,
    coursesId int,
    Foreign Key (studentId) REFERENCES student_db(studentId),
    Foreign Key (coursesId) REFERENCES courses_db(coursesId)
);

INSERT into enrollment_db
(studentId,coursesId)
VALUES
(111,1010),
(222,2020),
(333,3030);

ALTER TABLE enrollment_db
ADD PRIMARY KEY (studentId, coursesId);
SELECT * from enrollment_db;


SELECT * FROM courses_db JOIN enrollment_db  ON courses_db.coursesId  = enrollment_db.coursesId ;
SELECT * FROM student_db JOIN enrollment_db  ON student_db.studentId  = enrollment_db.studentId;

SELECT DISTINCT stu_name , courses_name  -- DISTINCT reduce the replication
from student_db
JOIN enrollment_db ON student_db.studentId=enrollment_db.studentId
JOIN  courses_db ON enrollment_db.coursesId = courses_db.coursesId;

