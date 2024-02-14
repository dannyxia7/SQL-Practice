WITH rank_cte AS(
SELECT
  item_count,
  RANK() OVER(
    ORDER BY order_occurrences DESC
  ) as order_rank
FROM items_per_order
)
SELECT
  item_count as mode
FROM rank_cte
WHERE order_rank = 1