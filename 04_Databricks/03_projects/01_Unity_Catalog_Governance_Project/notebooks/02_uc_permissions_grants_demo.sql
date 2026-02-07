-- Databricks notebook source
-- Project 01 - UC Permissions (Demo)

USE CATALOG main;
USE SCHEMA uc_governance;

-- NOTE:
-- These GRANTs require privileges.
-- In interview you should explain this design even if you can't run it.

-- Example groups
-- de_team, analyst_team, finance_team

-- Allow schema usage
GRANT USE SCHEMA ON SCHEMA main.uc_governance TO `de_team`;

-- Allow analysts to read only
GRANT SELECT ON TABLE main.uc_governance.data_assets TO `analyst_team`;

-- Allow DE team to modify
GRANT SELECT, MODIFY ON TABLE main.uc_governance.access_events TO `de_team`;

SHOW GRANTS ON SCHEMA main.uc_governance;
