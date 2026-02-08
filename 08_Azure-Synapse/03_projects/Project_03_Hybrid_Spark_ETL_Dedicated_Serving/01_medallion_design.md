# 01 — Medallion Architecture

## Bronze
Raw ingestion from source to ADLS raw.

## Silver
Cleaned + standardized Delta tables.

## Gold
Business-ready Delta tables + aggregates.

## Why medallion?
- easy debugging
- reprocessing
- quality checks
