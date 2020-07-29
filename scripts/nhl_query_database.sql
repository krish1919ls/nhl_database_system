USE nhl;

-- AT1: How many hits are recorded each year?
SELECT SUBSTRING(game_id, 1, 4) AS season,
	COUNT(*) AS hit_count
FROM hits
GROUP BY season;

-- AT2: Who was the hits leader for each year?
SELECT ph2.season, 
	ph2.player_id, 
	pi.first_name, 
    pi.last_name, 
    pi.primary_position, 
    ph2.hit_count
FROM (
	SELECT season, 
		MAX(hit_count) AS hit_count
    FROM player_hits 
    GROUP BY season
) AS ph1 
JOIN player_hits AS ph2 
	USING (season, 
		hit_count)
LEFT JOIN player_info pi
	USING (player_id);

-- AT3: What is the distribution of yearly hit totals per player?
SELECT SUBSTRING(game_id, 1, 4) AS season,
	player_id,
    first_name, 
    last_name, 
    primary_position,
	COUNT(*) AS hit_count
FROM hits 
GROUP BY season, 
	player_id;

-- AT4: What is the distribution of yearly hit totals per team?
SELECT *,
    RANK() OVER (
		PARTITION BY season
        ORDER BY hit_count DESC
    ) AS season_rank
FROM (
	SELECT SUBSTRING(h.game_id, 1, 4) AS season,
		h.team_id_for, 
		ti.short_name,
		ti.team_name,
		COUNT(*) AS hit_count
	FROM hits AS h
	LEFT JOIN team_info AS ti
		ON h.team_id_for = ti.team_id
	GROUP BY season, 
		h.team_id_for
) AS team_hits;

-- AT5: Who is taking the most hits?
SELECT b.player_id,
	pi.first_name,
    pi.last_name,
    pi.primary_position,
	COUNT(*) AS beat_count
FROM beats AS b
LEFT JOIN player_info AS pi
	USING(player_id)
GROUP BY player_id
ORDER BY beat_count DESC
LIMIT 10;

-- AT6: How many goals are recorded each season?
SELECT SUBSTRING(game_id, 1, 4) AS season,
	COUNT(*) AS goal_count
FROM goals
GROUP BY season;

-- AT7: Who scored the most goals each year?
SELECT pg2.season, 
	pg2.player_id, 
	pi.first_name, 
    pi.last_name, 
    pi.primary_position, 
    pg2.goal_count
FROM (
	SELECT season, 
		MAX(goal_count) AS goal_count
    FROM player_goals 
    GROUP BY season
) AS pg1 
JOIN player_goals AS pg2 
	USING (season, 
		goal_count)
LEFT JOIN player_info AS pi
	USING (player_id);

-- AT8: What is the distribution of yearly goal totals per player?
SELECT SUBSTRING(game_id, 1, 4) AS season,
	player_id,
    first_name, 
    last_name, 
    primary_position,
	COUNT(*) AS goal_count
FROM goals 
GROUP BY season, 
	player_id;

-- AT9: What is the distribution of yearly goal totals per team?
SELECT *,
    RANK() OVER (
		PARTITION BY season
        ORDER BY goal_count DESC
    ) season_rank
FROM (
	SELECT SUBSTRING(g.game_id, 1, 4) AS season,
		g.team_id_for, 
		ti.short_name,
		ti.team_name,
		COUNT(*) AS goal_count
	FROM goals AS g
	LEFT JOIN team_info AS ti
		ON g.team_id_for = ti.team_id
	GROUP BY season, 
		g.team_id_for
) AS team_goals;
