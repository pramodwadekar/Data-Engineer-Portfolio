-- Initial dimension load

INSERT INTO dim_customer (customer_id, full_name, city, start_date, end_date, is_current)
SELECT customer_id, full_name, city, CURRENT_DATE, '9999-12-31', 1
FROM stg_customers;

INSERT INTO dim_branch (branch_id, branch_name, city, state, start_date, end_date, is_current)
SELECT branch_id, branch_name, city, state, CURRENT_DATE, '9999-12-31', 1
FROM stg_branches;

INSERT INTO dim_account (account_id, customer_id, branch_id, account_type, status, opened_date, start_date, end_date, is_current)
SELECT account_id, customer_id, branch_id, account_type, status, opened_date, CURRENT_DATE, '9999-12-31', 1
FROM stg_accounts;
