with cte as
(select cust_id, market, event_date, event, s_period, ADD_MONTHS(event_date, s_period) as extended_date, row_number() over(partition by cust_id order by event_date desc) as rnk from prime_history
where event_date<='20-12-31')
select *
from cte where rnk=1 and event!='C' and extended_date>='20-12-31';
