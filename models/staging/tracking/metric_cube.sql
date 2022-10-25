with metrics_res as (select * 
from {{ metrics.calculate(
    [metric('users'),metric('triggers'),metric('activity')],
    grain='week',
    dimensions=['event','browser'],
    start_date='2020-01-01',
    end_date='2022-12-31',
) }}
)

select * from metrics_res where users>0
