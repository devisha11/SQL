/* Q.The "trips" table stores records for all taxi trips. Each trip is uniquely identified by a trip ID, while both the "client_id" and "driver_id" are foreign keys referencing the "user_id" in the "users" table. The "status" column is of the ENUM data type, with possible values of 'completed', 'cancelled_by_driver', and 'cancelled_by_client'.

The user table holds all users. Each user has an unique iser_id, and role is an Enum type of('client','driver','partner').

Write a SQL query to find the cancellation rate of requests made by unbanned users(both client and driver) between 1st oct'2013 and 3rd oct'2013.

The cancellation rate = sum(cancel requests)/ total requests.*/

/* Create table: */
create table trip(
ID integer, 
Client_id integer, 
Driver_id integer, City_id integer, 
Status varchar(50), 
Request_at date,
constraint status_chk check(status in ('completed','cancelled_by_driver','cancelled_by_client'))
);

create table user_info(
User_id integer, 
Banned varchar(3), 
Role_n varchar(10)
constraint role_chk check(role_n in('client','driver'))
);

/* Insert values: */
insert into trip values(1,1,10,1, 'completed','2013-10-01');
insert into trip values(2,2,11,1,'cancelled_by_driver','2013-10-01');
insert into trip values(3,3,12,6, 'completed','2013-10-01');
insert into trip values(4,4,13,6,'cancelled_by_client','2013-10-01');
insert into trip values(5,1,10,1, 'completed','2013-10-02');
insert into trip values(6,2,11,6, 'completed','2013-10-02');
insert into trip values(7,3,12,6, 'completed','2013-10-02');
insert into trip values(8,2,12,12, 'completed','2013-10-03');
insert into trip values(9,3,10,12, 'completed','2013-10-03');
insert into trip values(10,4,13,12, 'cancelled_by_driver','2013-10-03');

insert into user_info values(1,'No','client');
insert into user_info values(2,'Yes','client');
insert into user_info values(3,'No','client');
insert into user_info values(4,'No','client');
insert into user_info values(10,'No','driver');
insert into user_info values(11,'No','driver');
insert into user_info values(12,'No','driver');
insert into user_info values(13,'No','driver');

/* Query to solve the Question: */
select request_at as day, round(count(case when status != 'completed' then 1 end)/count(*),2) 
  from trip
where client_id in (select user_id from user_info where banned='No') 
  and driver_id in (select user_id from user_info where banned='No')
group by request_at;
