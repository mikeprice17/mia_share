-- models/question_one.sql

{{ config(
    materialized='ephemeral'
) }}

WITH EarliestPayments AS (
    SELECT
        application_id,
        institution_id,
        MIN(created_at) AS earliest_created_at
    FROM
        forge.payments  -- Specify the database explicitly
    GROUP BY
        application_id,
        institution_id
),
RecentPayments AS (
    SELECT
        institution_id,
        COUNT(*) AS recent_application_count
    FROM
        EarliestPayments
    WHERE
        earliest_created_at >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
    GROUP BY
        institution_id
)

SELECT 
    'received any payment in last 3 months' AS dimension,
    COUNT(DISTINCT institution_id) AS school_count
FROM 
    forge.payments  -- Specify the database explicitly
WHERE 
    paid_at > DATE_SUB(CURDATE(), INTERVAL 3 MONTH)

UNION

SELECT 
    'received 1 new payment in last 3 months' AS dimension,
    COUNT(DISTINCT institution_id) AS school_count
FROM
    RecentPayments

UNION

SELECT
    'received 5 new payments in last 3 months'
