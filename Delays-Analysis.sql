select traffic_status,
       round( avg(waiting_Time) ,1) AS Avg_Wait
from logistics_data
group by traffic_Status;

