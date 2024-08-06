-- models/question_two.sql

{{ config(
    materialized='ephemeral'
) }}

SELECT 
    i.name as institution,
    count(distinct program_group_id) as programs,
    count(distinct u.id) as students,
    count(distinct u.id)/count(distinct program_group_id) as student_per_program
 FROM 
    programs as p
    JOIN institutions as i on i.id = p.institution_id
    join users as u on COALESCE(u.active_institution_id,u.institution_id) = p.institution_id and u.deleted_at is null
GROUP BY 
    1
ORDER BY 
    2;
