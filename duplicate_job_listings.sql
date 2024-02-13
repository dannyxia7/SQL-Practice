WITH duplicate_cte AS (
  SELECT
    company_id,
    title,
    description,
    COUNT(job_id) as dupes
  FROM job_listings
  GROUP BY company_id, title, description
)

SELECT 
  COUNT(company_id) as duplicate_companies
FROM duplicate_cte
WHERE dupes >= 2