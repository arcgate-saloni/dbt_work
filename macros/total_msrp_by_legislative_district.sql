{% macro total_msrp_by_legislative_district(district) %}
    select "Legislative District", SUM("Base MSRP") AS total_msrp
    from {{ source('DBT_DB', 'ELECTRIC_VEHICLE') }}
    where "Legislative District" = '{{ district }}'
    group by "Legislative District"
{% endmacro %}