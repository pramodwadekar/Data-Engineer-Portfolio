-- Project 02 - DLT Claims: Helpful Validation Queries

-- After pipeline run, use these queries

SELECT * FROM bronze_claims LIMIT 20;
SELECT * FROM silver_claims_clean LIMIT 20;
SELECT * FROM gold_city_claims_kpi ORDER BY claim_date DESC, total_claim_amount DESC;

-- DQ quick check
SELECT status, COUNT(*) AS cnt
FROM silver_claims_clean
GROUP BY status;
