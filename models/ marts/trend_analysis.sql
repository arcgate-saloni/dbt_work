-- 1. Electric Vehicle Distribution by Location:
-- Number of registered vehicles per County, City, and Legislative District.
select 
    county,
    city,
    legislative_district,
    count(vin) as registered_vehicles
from  
    electric_vehicle
group by 
    county, city, legislative_district;

-- Top 5 Counties with the highest number of EV registrations.
select 
    county,
    count(vin) as registered_vehicles
from 
    electric_vehicle
group by 
    county
order by 
    registered_vehicles desc
limit 5;

-- 2. Market Analysis:
-- Most common Makes and Models.
select 
    make,
    model,
    count(vin) as vehicle_count
from  
    electric_vehicle
group by 
    make, model
order by 
    vehicle_count desc;

-- Average Base MSRP by Make and Electric Vehicle Type.
select 
    make,
    electric_vehicle_type,
    avg(base_msrp) as avg_base_msrp
from 
    electric_vehicle
group by 
    make, electric_vehicle_type;

-- Percentage of BEVs vs. PHEVs in each County.
select 
    county,
    electric_vehicle_type,
    count(vin) * 100.0 / (select count(*) from electric_vehicle where county = e.county) as ev_percentage
from 
    electric_vehicle e
where 
    electric_vehicle_type in ('bev', 'phev')
group by 
    county, electric_vehicle_type;

-- 3. Environmental Impact:
-- Total Electric Range by Legislative District.
select 
    legislative_district, 
    sum(electric_range) as total_electric_range
from 
    electric_vehicle
group by  
    legislative_district;

-- Counties with the highest percentage of CAFV-eligible vehicles.
select 
    county,
    count(case when cafv_eligibility = 'yes' then 1 end) * 100.0 / count(vin) as cafv_percentage
from 
    electric_vehicle
group by 
    county
order by 
    cafv_percentage desc;

-- 4. Historical Trends:
-- Changes in EV registrations over time (using snapshots).
select 
    extract(year from registration_date) as year,
    count(vin) as ev_registrations
from  
    electric_vehicle
group by 
    extract(year from registration_date)
order by 
    year;

-- Trends in Model Year distribution for BEVs and PHEVs.
select  
    model_year,
    electric_vehicle_type,
    count(vin) as vehicle_count
from 
    electric_vehicle
group by 
    model_year, electric_vehicle_type
order by 
    model_year, electric_vehicle_type;

-- 5. Electric Range Analysis:
-- Vehicles with an Electric Range > 300 miles.
select 
    vin,
    make,
    model,
    electric_range
from 
    electric_vehicle
where 
    electric_range > 300;

-- Count of registered vehicles by County, City, and Model Year.
select 
    county, 
    city, 
    model_year, 
    count(vin) as registered_vehicles
from 
    electric_vehicle
group by 
    county, city, model_year
order by 
    county, city, model_year;

-- Average Electric Range by Make and Model.
select 
    make, 
    model, 
    avg(electric_range) as avg_electric_range
from 
    electric_vehicle
group by 
    make, model
order by 
    avg_electric_range desc;

-- Average Base MSRP by Electric Vehicle Type.
select 
    electric_vehicle_type, 
    avg(base_msrp) as avg_base_msrp
from 
    electric_vehicle
group by 
    electric_vehicle_type
order by 
    avg_base_msrp desc;
