with categorized_vehicles AS (
    select *,
        case
            when electric_range > 200 then 'High-Range'
            else 'Low-Range'
        end as range_category
    from 
        cleaned_data
)
select * 
from categorized_vehicles; 
