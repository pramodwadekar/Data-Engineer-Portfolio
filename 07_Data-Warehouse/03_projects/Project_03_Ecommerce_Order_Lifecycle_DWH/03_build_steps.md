# 03 — Build Steps (End-to-End)

1. Create staging tables + sample data
2. Create dimensions
3. Create transaction fact for order items
4. Create accumulating snapshot fact for lifecycle
5. Load initial lifecycle rows (order created)
6. Update lifecycle as payment/shipment/delivery events arrive
7. Build marts for SLA + funnel reporting
8. Add DQ checks
