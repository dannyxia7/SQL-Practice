SELECT 
  SUM(CASE WHEN LOWER(product) LIKE 'turbotax%' THEN 1 ELSE 0 END) as turbotax_total,
  SUM(CASE WHEN LOWER(product) LIKE 'quickbooks%' THEN 1 ELSE 0 END) as quickbooks_total
FROM filed_taxes