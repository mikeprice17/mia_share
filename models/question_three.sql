{{ config(
    materialized='ephemeral'
) }}

SELECT 
	institution_id,
	sum(
	coalesce(servicing_fee,0) + 
	coalesce(credit_card_processing_fee,0) + 
	coalesce(returned_payment_fee,0) + 
	coalesce(late_fee,0) + 
	coalesce(misc_retained_fee,0)
	) as revenue
FROM 
	payments
WHERE 
	DATE_FORMAT(paid_at, '%Y-%m-01') = '2024-07-01'
GROUP BY
	1
