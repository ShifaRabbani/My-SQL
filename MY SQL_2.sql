CREATE DATABASE colge_db;
drop DATABASE colge_db;
use colge_db;
CREATE table stu(
    rollNo int PRIMARY key,
    name VARCHAR(60),
    marks int,
    grade VARCHAR(1),
    city VARCHAR(80)
);
insert into stu
(rollNo, name , marks , grade , city)
VALUES
(100,"ALi",80,"A","Loralai"),
(200,"Sultan",90,"A","Quetta"),
(300,"Kainat",85,"A","Loralai"),
(400,"kamal",76,"B","Zhob"),
(500,"dani",64,"C","Zhob");

SELECT * from stu where marks >80;
SELECT * from stu where grade = "B";

SELECT * from stu where city ="QillaSafullah";

SELECT * FROM stu where marks + 10 < 80;

SELECT * from stu where marks > 80 and city = "loralai";
SELECT * from stu where grade > "B" or rollNo = 100;

SELECT * from stu
where marks BETWEEN 50 and 80;
SELECT * from stu
where city in ("loralai", "Zhob");

SELECT * FROM stu
where marks not in (70);

SELECT * from stu
limit 3;

SELECT * from stu
ORDER BY grade DESC;

SELECT * from stu   
ORDER BY marks LIMIT 2 ;

-- Aggregate functions
SELECT max(marks) from stu;
SELECT count(marks) from stu;
SELECT min(marks) from stu;
SELECT sum(rollNo) from stu;
SELECT avg(marks) from stu;

SELECT city , count(name)
from stu 
GROUP BY city;

SELECT grade, avg(marks)
from stu  
group by grade
ORDER  BY grade DESC;

SELECT city , count(marks)
from stu
GROUP BY city
ORDER  BY city;
-- having clause
SELECT name ,grade ,count(marks)
from stu 
where marks > 70
GROUP BY name ,grade
having grade > "A"
ORDER BY name DESC;
SELECT * from stu;
