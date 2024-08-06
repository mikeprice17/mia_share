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
	forge.payments
WHERE 
	DATE(paid_at) BETWEEN '2024-01-01' AND '2024-06-30'
GROUP BY
	1
