{{ config(
    materialized='ephemeral'
) }}

SELECT
	 count(distinct CASE WHEN written_off_as_of_date is not null then id else null end) as 
Sent_to_collections,
    count(distinct CASE WHEN  is_satisfied  = 1 then id else null end) as Fully_paid,
    count(distinct CASE WHEN is_satisfied = 0 and written_off_as_of_date is null then id else null 
end) as still_actively_paying
FROM 
	isas 
