/*Q. We have customer and product tables.

Write a query to get customers who have bought all the products. */

/*Create table:*/
create table cust
(
cust_id integer,
cust_name varchar2(10),
product_id integer
);

create table prod
(
product_id integer,
prod_name varchar2(10)
);

/*Insert values:*/
insert into cust values(1,'John', 3);
insert into cust values(1,'John', 4);
insert into cust values(1,'John', 1);
insert into cust values(1,'John', 2);
insert into cust values(2,'Smith', 3);
insert into cust values(2,'Smith', 3);
insert into cust values(2,'Smith', 2);
insert into cust values(2,'Smith', 2);
insert into cust values(3,'Mark', 1);
insert into cust values(3,'Mark', 2);
insert into cust values(3,'Mark', 2);
insert into cust values(3,'Mark', 2);

insert into prod values(1, 'Pen');
insert into prod values(2, 'Pencil');
insert into prod values(3, 'Eraser');
insert into prod values(4, 'Sharpner');

/* Query to solve the question: */
select cust_id
from cust
group by cust_id
having count(distinct product_id)=(select count(distinct product_id) from prod);
