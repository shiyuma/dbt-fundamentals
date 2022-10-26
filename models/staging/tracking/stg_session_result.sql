SELECT
  e.time
, e.event
, s.user_id
, s.session_id
, ROW_NUMBER()
    OVER(PARTITION BY s.session_id ORDER BY e.time)
    AS sess_seq_num
FROM {{ source('t_source', 'ods_events') }} AS e
INNER JOIN {{ ref('stg_session_seg') }}  AS  s
  ON e.user_id = s.user_id
  AND e.time >= s.session_start
  AND e.time < s.next_session_start