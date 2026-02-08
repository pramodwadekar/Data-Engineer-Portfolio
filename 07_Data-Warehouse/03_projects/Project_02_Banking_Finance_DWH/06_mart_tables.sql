-- Finance marts

CREATE TABLE mart_daily_deposits AS
SELECT snapshot_date_sk, SUM(balance_amount) AS total_deposits
FROM fact_account_balance_snapshot
GROUP BY snapshot_date_sk;

CREATE TABLE mart_branch_deposits AS
SELECT b.branch_name, SUM(f.balance_amount) AS total_deposits
FROM fact_account_balance_snapshot f
JOIN dim_branch b ON f.branch_sk=b.branch_sk
GROUP BY b.branch_name;

CREATE TABLE mart_customer_avg_balance AS
SELECT c.full_name, AVG(f.balance_amount) AS avg_balance
FROM fact_account_balance_snapshot f
JOIN dim_customer c ON f.customer_sk=c.customer_sk
GROUP BY c.full_name;
