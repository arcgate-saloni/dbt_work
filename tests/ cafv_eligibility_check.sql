tests:
  - name: cafv_eligibility_check
    description: "Ensure CAFV Eligibility is not null for vehicles with Electric Range > 200"
    test: |
      select * 
      from {{ source('DBT_DB', 'ELECTRIC_VEHICLE') }}
      where "Electric Range" > 200 and "Clean Alternative Fuel Vehicle (CAFV) Eligibility" is null
