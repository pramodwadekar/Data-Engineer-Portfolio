CREATE OR REPLACE TABLE upi_dwh.dim_user
USING DELTA
AS SELECT * FROM upi_stg.users_stg;

CREATE OR REPLACE TABLE upi_dwh.dim_merchant
USING DELTA
AS SELECT * FROM upi_stg.merchants_stg;

CREATE OR REPLACE TABLE upi_dwh.fact_transactions
USING DELTA
AS SELECT * FROM upi_stg.transactions_stg;
