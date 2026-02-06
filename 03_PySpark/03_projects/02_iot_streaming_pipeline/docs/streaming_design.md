# Streaming Design

## Input
- CSV events dropped continuously in a folder

## Bronze
- store raw events in Delta

## Silver
- cast schema
- handle null readings
- quarantine invalid rows

## Gold
- 5-minute window aggregations
- device KPIs
