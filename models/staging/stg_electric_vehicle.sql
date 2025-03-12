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
        "Electric Vehicle Type",
        "Clean Alternative Fuel Vehicle (CAFV) Eligibility",
        "Electric Range",
        "Base MSRP",
        "Legislative District",
        "DOL Vehicle ID",
        "Vehicle Location",
        "Electric Utility",
        "2020 Census Tract"
    from 
        electric_vehicle  
)
select * 
from standardized_data;
