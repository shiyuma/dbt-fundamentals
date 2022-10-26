SELECT
  e.event AS event
, e.user_id AS user_id
, e.time AS e_tstamp
, TIMESTAMP_DIFF(e.time, LAG(e.time)
    OVER(PARTITION BY e.user_id ORDER BY e.time), MINUTE)
    AS idle_time
FROM  {{ source('t_source', 'ods_events') }} AS e 