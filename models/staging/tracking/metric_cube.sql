select * 
from {{ metrics.calculate(
    [metric('users'),metric('new_users'),metric('triggers'),metric('activity')],
    grain='day',
    dimensions=['event','browser','os'],
    start_date='2020-01-01',
    end_date='2022-12-31',
) }}
where users >0