tests:
- name: cafv_eligibility_check
  description: "Ensure CAFV Eligibility is not null for vehicles with Electric Range > 200"
  test: |
  SELECT * 
  FROM {{ source('DBT_DB', 'ELECTRIC_VEHICLE') }}
  WHERE "Electric Range" > 200 AND "Clean Alternative Fuel Vehicle (CAFV) Eligibility" IS NULL
