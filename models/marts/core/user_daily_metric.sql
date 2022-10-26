select 
    date(r.time) as date_num,
    count(distinct r.user_id) as uv,
    count(r.event) as events_count,
    count(distinct r.session_id) as sessions 
from 
{{ref('stg_session_result')}} as r
group by date_num
order by date_num asc