with standardized_data as (
    select 
        upper(trim("VIN (1-10)")) as vin,
        upper(trim(county)) as county,
        upper(trim(city)) as city,
        state,
        postalcode,
        modelyear,
        upper(trim(make)) as make,
        upper(trim(model)) as model,
        "Electric Vehicle Type" as electric_vehicle_type,
        "Clean Alternative Fuel Vehicle (CAFV) Eligibility" as clean_alternative_fuel_vehicle_eligibility,
        "Electric Range" as electric_range,
        "Base MSRP" as base_msrp,
        "Legislative District" as legistlative_district,
        "DOL Vehicle ID" as dol_vehicle_id,
        "Vehicle Location" as vehicle_location,
        "Electric Utility" as electric_utility,
        "2020 Census Tract" as 2020_census_tract
    from 
        electric_vehicle  
)
select * 
from standardized_data;
