USE nhl;
 
SELECT NOW(),
	@@hostname;

SELECT game, 
	game_plays,
	game_plays_players, 
	game_shifts,
	game_goalie_stats,
	game_skater_stats,
	game_teams_stats,
	player_info,
	team_info
 FROM 
	(SELECT COUNT(*) 'GAME' FROM game) a, 
	(SELECT COUNT(*) 'GAME_PLAYS' FROM game_plays) b,
	(SELECT COUNT(*) 'GAME_PLAYS_PLAYERS' FROM game_plays_players ) c,
	(SELECT COUNT(*) 'GAME_SHIFTS' FROM game_shifts) d,
	(SELECT COUNT(*) 'GAME_GOALIE_STATS' FROM game_goalie_stats) e,
	(SELECT COUNT(*) 'GAME_SKATER_STATS' FROM game_skater_stats ) f, 
	(SELECT COUNT(*) 'GAME_TEAMS_STATS' FROM game_teams_stats ) g, 
	(SELECT COUNT(*) 'PLAYER_INFO' FROM player_info ) h,
	(SELECT COUNT(*) 'TEAM_INFO' FROM team_info) i;

SELECT table_schema, 
	table_name, 
	column_name, 
	column_key 
FROM information_schema.columns
WHERE table_name IN ( 
	'game',
	'game_plays',
	'game_plays_players',
	'game_shifts',
	'game_goalie_stats'
	'game_skater_stats',
	'game_teams_stats',
	'team_info',
	'player_info')
AND column_key = 'PRI'
AND table_schema = database();

SELECT i.table_schema,  
	i.table_name, 
	i.constraint_type, 
	i.constraint_name, 
	k.referenced_table_name, 
	k.referenced_column_name 
FROM information_schema.table_constraints i 
LEFT JOIN information_schema.key_column_usage k 
ON i.constraint_name = k.constraint_name 
WHERE i.constraint_type = 'FOREIGN KEY' 
AND i.table_schema = database();

SELECT table_schema,  
	table_name,
	index_name 
FROM information_schema.statistics
WHERE table_schema = database() 
AND index_name != 'PRIMARY';

SELECT DISTINCT table_schema, 
	data_type 
FROM information_schema.columns 
WHERE table_schema = database();

SELECT table_name, 
	COUNT(*) AS n_attributes
FROM information_schema.columns 
WHERE table_schema = database()
GROUP BY table_name;
