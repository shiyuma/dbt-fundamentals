select * FROM  {{ source('t_source', 'ods_events') }} 