SELECT 
    p.loyalty_tier,
    COUNT(DISTINCT p.player_id) AS total_active_players,
    COUNT(s.session_id) AS total_sessions,
    ROUND(SUM(CAST(REPLACE(REPLACE(s.coin_in, '$', ''), ',', '') AS REAL)), 2) AS total_coin_in,
    ROUND(SUM(
        CAST(REPLACE(REPLACE(s.coin_in, '$', ''), ',', '') AS REAL) * 
        (CAST(REPLACE(s.house_hold_pct, '%', '') AS REAL) / CASE WHEN s.house_hold_pct LIKE '%%' THEN 100.0 ELSE 1.0 END)
    ), 2) AS total_theo_win,
    ROUND(SUM(CAST(REPLACE(REPLACE(s.actual_win, '$', ''), ',', '') AS REAL)), 2) AS casino_actual_win
FROM players p
JOIN slot_sessions s ON p.player_id = s.player_id
GROUP BY p.loyalty_tier
ORDER BY total_theo_win DESC;