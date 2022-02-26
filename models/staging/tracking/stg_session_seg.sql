SELECT
  ROW_NUMBER() OVER(PARTITION BY lag.user_id ORDER BY lag.e_tstamp) || '-' || lag.user_id AS session_id
, lag.user_id
, lag.e_tstamp AS session_start
, ROW_NUMBER()
    OVER(PARTITION BY lag.user_id ORDER BY lag.e_tstamp)
    AS session_seq_number
, COALESCE(LEAD(lag.e_tstamp)
    OVER (PARTITION BY lag.user_id ORDER BY lag.e_tstamp), '3000-01-01')
    AS next_session_start
FROM {{ ref('stg_session_lag') }} as lag
WHERE (lag.idle_time > 30 OR lag.idle_time IS NULL)