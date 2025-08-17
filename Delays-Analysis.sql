use logistics;
with cte as (
    select *,
           case 
               when hour(timestamp) between 6 and 11 then 'Morning'
               when hour(timestamp) between 12 and 17 then 'Afternoon'
               when hour(timestamp) between 18 and 23 then 'Evening'
               else 'Night'
           end as Time_of_Day
    from logistics_data
)
select Time_of_Day,
       count(*) AS Total_Shipments,
       sum( logistics_Delay) AS Delayed_Shipments,
       round( sum(logistics_Delay) / count(*) * 100,1) AS Delay_Percentage
from cte
group by Time_of_Day
order by 4 desc;

select traffic_status,
       round( avg(waiting_Time) ,1) AS Avg_Wait
from logistics_data
group by traffic_Status;

