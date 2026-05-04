# U.S. Rental Affordability Analysis Dashboard

## Overview
Analyzes rental affordability trends across major U.S. metro areas from 2015–2024, comparing rent growth against renter household income growth to identify affordability deterioration by location.

## Key Questions
- Which metros have experienced the greatest deterioration in rental affordability since 2015?
- Where has rent growth persistently outpaced income growth?
- What impact did pandemic-era disruptions have on rent vs. income trends?

## Tools
Power Query - Initial preprocessing and file consolidation
SQL (SQLite / DB Browser) - Data cleaning, transformation, metric calculation
Power BI - Dashboard design and visualization

## Metrics
Calculated in SQL:
- YoY Rent Growth
- YoY Income Growth
- Rent-to-Income Ratio
- Affordability Deterioration Rate (Rent Growth − Income Growth)

## Dashboard Features
Geographic Map — Rent burden across U.S. metros
Deterioration Ranking — Metros where rent growth most exceeds income growth
Rent vs. Income Trend — Temporal divergence over 2015–2024
KPI Cards — High-level affordability summary


## Key Findings
- Rent consumes roughly 37% of renter household income on average across analyzed metros
- Providence, RI and Tampa, FL show sustained periods of rent growth outpacing income growth
- Affordability deterioration accelerated sharply during the COVID-era housing disruption
- Affordability stress is geographically clustered in select Sun Belt and Northeast metros


## Repository Structure
├── data/
│   ├── raw/
│   └── cleaned/
├── sql/
│   ├── queries/
│   └── csv outputs/
├── dashboard/
│   └── rental_affordability_dashboard.pbix
└── images/
    └── dashboard_screenshots/

Data Sources: Zillow Observed Rent Index (ZORI) and U.S. Census ACS Table B25119 (median renter household income)
