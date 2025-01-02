/*We have a table where we have Amazon Prime Membership History.

Event can have 3 values: S, R and C
S-> Subscribe
R-> Renewal
C-> Cancellation

Assume that one customer can only be present in one marketplace.

Write a query to find number of active prime members at the end of 2020.*/

/*Create table:*/
create table prime_history
(
cust_id integer,
market varchar(20),
event_date date,
event varchar(1),
s_period integer,
constraint chk_event check(event in ('S','R','C'))
);

/*Insert values:*/
insert into prime_history values(1, 'IND', '2020-01-05', 'S', 6);
insert into prime_history values(1, 'IND', '2020-12-05', 'R', 1);
insert into prime_history values(1, 'IND', '2021-02-05', 'C', Null);
insert into prime_history values(2, 'IND', '2020-02-15', 'S', 12);
insert into prime_history values(2, 'IND', '2020-11-20', 'C', Null);
insert into prime_history values(3, 'USA', '2019-12-01', 'S', 12);
insert into prime_history values(3, 'USA', '2020-12-01', 'R', 12);
insert into prime_history values(4, 'USA', '2020-01-10', 'S', 6);
insert into prime_history values(4, 'USA', '2020-09-10', 'R', 3);
insert into prime_history values(4, 'USA', '2020-12-25', 'C', Null);
insert into prime_history values(5, 'UK', '2020-06-20', 'S', 12);
insert into prime_history values(5, 'UK', '2020-11-20', 'C', Null);
insert into prime_history values(6, 'UK', '2020-07-05', 'S', 6);
insert into prime_history values(6, 'UK', '2021-03-05', 'R', 6);
insert into prime_history values(7, 'Canada', '2020-08-15', 'S', 12);
insert into prime_history values(8, 'Canada', '2020-09-10', 'S', 12);
insert into prime_history values(8, 'Canada', '2020-12-10', 'C', Null);
insert into prime_history values(9, 'Canada', '2020-11-10', 'S', 1);

/*Query to solve the question*/
with cte as(
  select cust_id, market, event_date, event, s_period, ADD_MONTHS(event_date, s_period) as extended_date, 
  row_number() over(partition by cust_id order by event_date desc) as rnk 
  from prime_history
  where event_date<='20-12-31'
)
select *
from cte 
  where rnk=1 and event!='C' and extended_date>='20-12-31';
