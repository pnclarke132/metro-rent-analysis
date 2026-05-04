CREATE TABLE fact_income_annual AS
SELECT
	d.size_rank,
	i.year,
	i.renter_income,
	i.owner_income,
	i.total_income
FROM stg_income_annual i
JOIN dim_metro d
	ON i.metro_name = d.metro_name
	AND i.state = d.state;
