{% macro total_electric_range_by_county() %}
    select 
        County, 
        sum("Electric Range") AS total_range
    from 
        {{ ref(source('DBT_DB', 'ELECTRIC_VEHICLE') )}}
    group by 
        County
{% endmacro %}
