-- Project 01 - UC Governance SQL Pack

USE CATALOG main;
CREATE SCHEMA IF NOT EXISTS uc_governance;
USE SCHEMA uc_governance;

-- 1) Basic exploration
SELECT * FROM data_assets LIMIT 20;
SELECT * FROM access_events LIMIT 20;

-- 2) Sensitivity wise assets
SELECT sensitivity, COUNT(*) AS assets
FROM data_assets
GROUP BY sensitivity;

-- 3) Layer wise assets
SELECT layer, COUNT(*) AS assets
FROM data_assets
GROUP BY layer
ORDER BY assets DESC;

-- 4) Most active principals
SELECT principal, COUNT(*) AS events
FROM access_events
GROUP BY principal
ORDER BY events DESC;

-- 5) Most risky actions (DROP/GRANT)
SELECT action, COUNT(*) AS events
FROM access_events
WHERE action IN ('DROP','GRANT')
GROUP BY action;
