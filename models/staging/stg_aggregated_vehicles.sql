with aggregated_data AS (
    select
        county,
        city,
        legislative_district,
        count(vin) as total_vehicles,
        count(distinct make) as unique_makes,
        count(distinct model) as unique_models,
        avg(electric_range) as avg_electric_range
    from 
        cleaned_data
    group by 
        county, city, legislative_district
)
select * 
from aggregated_data;
