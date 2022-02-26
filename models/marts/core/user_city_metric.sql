select 
    users.city,
    count(distinct r.user_id) as uv,
    count(r.event) as events_count,
    count(distinct r.session_id) as sessions 
from 
{{ source('t_source', 'ods_users') }} users
left join
{{ref('stg_session_result')}} as r
on users.id=r.user_id
where users.city is not null
group by users.city
