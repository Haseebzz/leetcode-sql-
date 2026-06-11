--The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.
--The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places


-- group by machineid,process id then take max since we need aggreate sql doesnt know the start time and end time for each m,p_id  group by machine id and perform avg
select machine_id, round(avg(x.end_value-x.start_value),3) as processing_time 
from ( 
select 
machine_id,process_id, 
max(case when activity_type = 'start' then timestamp END) as start_value,
 max(case when activity_type = 'end' then timestamp END) as end_value 
 from Activity 
 group by machine_id, process_id 
) x  
group by machine_id
