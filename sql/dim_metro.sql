CREATE TABLE dim_mtero AS
SELECT DISTINCT
	size_rank,
	metro_name,
	state
FROM stg_rent_monthly
ORDER BY size_rank;