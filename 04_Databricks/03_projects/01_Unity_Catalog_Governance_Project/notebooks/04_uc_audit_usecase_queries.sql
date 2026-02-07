-- Databricks notebook source
-- Project 01 - Audit / Governance Queries

USE CATALOG main;
USE SCHEMA uc_governance;

-- 1) Which team accessed most?
SELECT principal, SUM(events_count) AS total_events
FROM gold_access_summary
GROUP BY principal
ORDER BY total_events DESC;

-- 2) Most common actions
SELECT action, SUM(events_count) AS total_events
FROM gold_access_summary
GROUP BY action
ORDER BY total_events DESC;

-- 3) Access trend per day
SELECT event_date, SUM(events_count) AS total_events
FROM gold_access_summary
GROUP BY event_date
ORDER BY event_date;
