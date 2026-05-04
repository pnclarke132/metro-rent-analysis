CREATE TABLE fact_rent_annual AS
SELECT
	size_rank,
	substr(date, -4) AS year,
	AVG(zori) AS avg_monthly_rent,
	AVG(zori) * 12 AS avg_annual_rent
FROM stg_rent_monthly
GROUP BY size_rank, year;