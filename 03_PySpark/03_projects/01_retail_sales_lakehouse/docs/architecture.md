# Architecture (Retail Sales Lakehouse)

## Data Model
- `orders` is the main fact table
- `order_items` is the line-item fact
- `customers`, `products`, `stores` are dimensions

## Gold KPI Examples
- Daily sales = sum(quantity * unit_price)
- Top customers = rank by revenue (window function)
- Category sales = groupBy(category)
