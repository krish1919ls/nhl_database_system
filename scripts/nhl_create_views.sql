USE nhl;

CREATE OR REPLACE VIEW hits AS
SELECT gp.*,
	gpp.player_id, 
    pi.first_name, 
    pi.last_name, 
    pi.primary_position, 
    pi.birth_date
FROM game_plays AS gp
LEFT JOIN game_plays_players AS gpp
	USING (play_id)
LEFT JOIN player_info AS pi
	USING (player_id)
WHERE gp.play_event = "Hit"
	AND gpp.player_type = "Hitter";

CREATE OR REPLACE VIEW player_hits AS
SELECT SUBSTRING(game_id, 1, 4) AS season,
	player_id,
	COUNT(*) AS hit_count
FROM hits
GROUP BY season, 
	player_id;

CREATE OR REPLACE VIEW beats AS
SELECT gp.*,
	gpp.player_id, 
    pi.first_name, 
    pi.last_name, 
    pi.primary_position, 
    pi.birth_date
FROM game_plays AS gp
LEFT JOIN game_plays_players AS gpp
	USING (play_id)
LEFT JOIN player_info AS pi
	USING (player_id)
WHERE gp.play_event = "Hit"
	AND gpp.player_type = "Hittee";

CREATE OR REPLACE VIEW goals AS
SELECT gp.*,
	gpp.player_id, 
    pi.first_name, 
    pi.last_name, 
    pi.primary_position, 
    pi.birth_date
FROM game_plays AS gp
LEFT JOIN game_plays_players AS gpp
	USING (play_id)
LEFT JOIN player_info AS pi
	USING (player_id)
WHERE gp.play_event = "Goal"
	AND gpp.player_type = "Scorer";

CREATE OR REPLACE VIEW player_goals AS
SELECT SUBSTRING(game_id, 1, 4) AS season,
	player_id,
	COUNT(*) AS goal_count
FROM goals
GROUP BY season, 
	player_id;
