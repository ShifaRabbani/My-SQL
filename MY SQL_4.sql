create database if not EXISTS shopping;
drop DATABASE shopping;
use shopping;
DROP TABLE coustomers;
CREATE table coustomers(
    coustmer_id int PRIMARY key,
    name VARCHAR (50),
    email VARCHAR (75),
    phone varchar (11),
    city VARCHAR (30)
);
INSERT into coustomers
(coustmer_id,name,email,phone,city)
VALUES
(21,"chahat","chahat@email.com",123432,"lahore"),
(22,"Rimsha","Rimsha@email.com",553434,"Islamabad"),
(23,"sumreen","sumreen@email.com",123632,"peshawer"),
(24,"Laiba","Laiba@email.com",123332,"peshawer"),
(25,"shefu","shefu@email.com",923432,"Islamabad"),
(26,"Mehak","Mehak@email.com",123430,"lahore");

SELECT count(name),city   
from coustomers
GROUP BY city;

UPDATE coustomers
set email = "Shefu12@gmail.com"
where email = "shefu@email.com";
SELECT * from coustomers;
drop table makeup;
CREATE Table makeup(
    product_id int PRIMARY key,
    product_name VARCHAR (90),
    brand VARCHAR(90),
    price int 
    
);
insert into makeup
(product_id,product_name,brand,price)
VALUES
(31,"Lipstic","Medora",600),
(32,"Foundation","J.",2000),
(33,"Blush","Medora",5000),
(34,"Highlighter","Medora",3200),
(35,"Concelar","Medora",1000),
(36,"Mascra","ponds",800),
(37,"Lipstic","Medora",1500),
(38,"Eyeliner","ponds",1100),
(39,"Blush","J.",6000),
(40,"Lipstic","ponds",8000);


SELECT * from makeup;

SELECT *
from coustomers
INNER join orders
on coustomers.coustmer_id = orders.coustmer_id;

SELECT coustomers.coustmer_id,name
FROM coustomers
LEFT JOIN orders
ON coustomers.coustmer_id = orders.coustmer_id;

SELECT *
FROM coustomers
LEFT JOIN orders
ON coustomers.coustmer_id = orders.coustmer_id;

SELECT *
FROM coustomers
LEFT JOIN orders
ON coustomers.coustmer_id = orders.coustmer_id

UNION

SELECT *
FROM coustomers
RIGHT JOIN orders
ON coustomers.coustmer_id = orders.coustmer_id;

drop table orders;
CREATE table orders(
    order_id int PRIMARY key ,
    coustmer_id int,
    product_id int,
    quntity int ,
    order_date DATE,
    total_amount DECIMAL(10,2),
    Foreign Key (coustmer_id) REFERENCES coustomers(coustmer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    Foreign Key (product_id) REFERENCES makeup(product_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
    
);

INSERT into orders
(order_id,coustmer_id,product_id,quntity,order_date)
VALUES
(111,21,31,3,'2026-02-20'),
(112,22,32,2,'2026-02-21'),
(113,23,33,1,'2026-02-22'),
(114,24,34,4,'2026-02-23'),
(115,25,35,5,'2026-02-24'),
(116,26,36,3,'2026-02-25'),
(117,21,37,2,'2026-02-26'),
(118,22,38,1,'2026-02-27'),
(119,23,39,3,'2026-02-28'),
(120,24,40,4,'2026-02-20');
SELECT * from orders;


DELETE from orders
WHERE order_id = 111;



DELIMITER //
-- Don’t finish the command until you see //
-- Trigger is called calculate_total and runs before inserting a new order.
-- It takes the product_id and quntity from the new order.
-- Looks up the price of that product from the makeup table.
-- Multiplies price × quantity.
-- Stores the result automatically in total_amount before saving the order.
CREATE TRIGGER calculate_total
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
   DECLARE product_price INT;

   SELECT price INTO product_price
   FROM makeup
   WHERE product_id = NEW.product_id;

   SET NEW.total_amount = product_price * NEW.quntity;
END //

DELIMITER ;


SELECT * from orders
WHERE quntity > (SELECT avg(quntity) from orders) ;


SELECT * from coustomers WHERE city = 'lahore'

SELECT * from makeup where price > 1000;

SELECT * from makeup where price >1500 and price limit 2;

SELECT * from orders ORDER BY coustmer_id;

SELECT * from coustomers ORDER BY name ASC;

SELECT count(order_id) , order_date 
from orders
GROUP BY order_date
having min(order_id) > 113;