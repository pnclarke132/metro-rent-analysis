CREATE TABLE mart_affordability AS
WITH base AS (
	SELECT
		r.size_rank,
		r.year,
		r.avg_annual_rent,
		i.renter_income,
		i.owner_income,
		i.total_income
		
	FROM fact_rent_annual r
	JOIN fact_income_annual i
		ON r.size_rank = i.size_rank
		AND r.year = i.year
),

growth_calc AS (
	SELECT *,

		/*rent-to-income ratio per annum*/	
		avg_annual_rent / renter_income AS rent_to_income,
		
		/*year-over-year rent growth calculation*/
		(
			avg_annual_rent -
			LAG(avg_annual_rent) OVER(
				PARTITION BY size_rank
				ORDER BY year)
		) * 1.0
		/
		LAG(avg_annual_rent) OVER (
			PARTITION BY size_rank
			ORDER BY year
		) AS yoy_rent_growth,
		
		/*year-over-year income growth calculation*/
		(
			renter_income -
			LAG(renter_income) OVER (
				PARTITION BY size_rank
				ORDER BY year)
		) * 1.0 
		/
		LAG(renter_income) OVER (
			PARTITION BY size_rank
			ORDER BY year
		) AS yoy_income_growth		
		
	FROM base
)

SELECT *,
    /*rent growth vs income growth calculation*/
	yoy_rent_growth - yoy_income_growth AS growth_gap
	
FROM growth_calc;

