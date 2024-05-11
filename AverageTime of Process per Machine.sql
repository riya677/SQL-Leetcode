SELECT machine_id,
       ROUND(AVG(processing_time), 3) AS processing_time
FROM (
    SELECT machine_id,
           process_id,
           MIN(CASE WHEN activity_type = 'start' THEN timestamp END) AS start_time,
           MAX(CASE WHEN activity_type = 'end' THEN timestamp END) AS end_time,
           MAX(CASE WHEN activity_type = 'end' THEN timestamp END) - MIN(CASE WHEN activity_type = 'start' THEN timestamp END) AS processing_time
    FROM Activity
    GROUP BY machine_id, process_id
) AS T
GROUP BY machine_id;

