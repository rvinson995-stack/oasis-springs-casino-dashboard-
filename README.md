# Oasis Springs Resort & Casino — Executive Player Worth & Reinvestment Dashboard

## Project Overview
This project analyzes player gaming activity and promotional spend for Oasis Springs Resort & Casino. Using an end-to-end data pipeline (Excel → SQLite → Tableau Public), the analysis evaluates player tier profitability, theoretical vs. actual win, and promotional reinvestment efficiency against an executive 20% reinvestment target.

## Tech Stack & Data Pipeline
1. **Excel:** Initial data extraction, schema validation, and preliminary hygiene.
2. **SQLite:** Cleaned raw transactions, transformed loyalty tier metrics, and aggregated key performance metrics:
   - Theoretical Win vs. Actual Win by Loyalty Tier
   - Promotional Reinvestment Rate (%)
3. **Tableau Public:** Built an interactive Executive Dashboard highlighting high-yield player segments and identifying promotional slippage in upper tiers.

---

## Key Business Findings
- **Platinum Tier Severe Margin Erosion:** Reinvestment rates for Platinum members reach **57.20%**—nearly triple the 20% executive threshold—indicating excessive VIP comps and free-play allocation that severely erode net gaming yield.
- **Gold Tier Threshold Breach:** Gold tier reinvestment sits at **23.45%**, also exceeding the 20% target cap and signaling loose promotional reinvestment rules across mid-to-upper player segments.
- **Silver Tier Baseline Efficiency:** Silver members maintain a low reinvestment rate of **8.69%**, remaining well within target parameters and providing a stable foundation for selective growth incentives.
- **Strategic Recommendation:** Audit and cap high-tier free-play and comp rules to reduce Platinum and Gold reinvestment back toward the 20% threshold, reallocating saved promotional capital toward driving trip frequency among high-potential Silver players.
---

## Live Interactive Dashboard
View the live dashboard on Tableau Public: [Oasis Springs Casino Executive Dashboard](https://public.tableau.com/views/Oasis_Springs_Casino_Executive_Dashboard/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

---

## Repository Structure
- `01_raw_data/`: Initial player activity datasets.
- `02_sql_queries/`: SQLite transformation and aggregation scripts.
- `03_processed_data/`: Cleaned CSV outputs feeding the Tableau model.
