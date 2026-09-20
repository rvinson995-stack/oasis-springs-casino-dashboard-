WITH clean_sessions AS (
    SELECT 
        player_id,
        SUM(CAST(REPLACE(REPLACE(coin_in, '$', ''), ',', '') AS REAL) * 
            (CAST(REPLACE(house_hold_pct, '%', '') AS REAL) / CASE WHEN house_hold_pct LIKE '%%' THEN 100.0 ELSE 1.0 END)
        ) AS total_theo_win
    FROM slot_sessions
    GROUP BY player_id
),
clean_promos AS (
    SELECT 
        player_id,
        COUNT(promo_id) AS total_offers,
        SUM(CAST(REPLACE(REPLACE(promo_amount_redeemed, '$', ''), ',', '') AS REAL)) AS total_free_play
    FROM promotions
    GROUP BY player_id
)
SELECT 
    p.loyalty_tier,
    COALESCE(SUM(pr.total_offers), 0) AS total_offers_redeemed,
    ROUND(COALESCE(SUM(pr.total_free_play), 0), 2) AS total_free_play_given,
    ROUND(COALESCE(SUM(cs.total_theo_win), 0), 2) AS total_theo_win,
    ROUND((COALESCE(SUM(pr.total_free_play), 0) / NULLIF(SUM(cs.total_theo_win), 0)) * 100, 2) AS reinvestment_rate_pct
FROM players p
LEFT JOIN clean_sessions cs ON p.player_id = cs.player_id
LEFT JOIN clean_promos pr ON p.player_id = pr.player_id
GROUP BY p.loyalty_tier
ORDER BY reinvestment_rate_pct DESC;