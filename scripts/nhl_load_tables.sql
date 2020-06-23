SET GLOBAL local_infile = ON;

USE nhl;

LOAD DATA LOCAL INFILE 
'nhl-game-data\\team_info.csv'  
INTO TABLE team_info  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY  '\r\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 
'nhl-game-data\\player_info.csv'  
INTO TABLE player_info  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY  '\r\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 
'nhl-game-data\\game.csv'  
INTO TABLE game  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY  '\r\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 
'nhl-game-data\\game_plays.csv'  
INTO TABLE game_plays  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY  '\r\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 
'nhl-game-data\\game_plays_players.csv'  
INTO TABLE game_plays_players  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY  '\r\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 
'nhl-game-data\\game_shifts.csv'  
INTO TABLE game_shifts  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY  '\r\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 
'nhl-game-data\\game_teams_stats.csv'  
INTO TABLE game_teams_stats  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY  '\r\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 
'nhl-game-data\\game_skater_stats.csv'  
INTO TABLE game_skater_stats  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY  '\r\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 
'nhl-game-data\\game_goalie_stats.csv'  
INTO TABLE game_goalie_stats  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY  '\r\n'
IGNORE 1 LINES;

SELECT TABLE_NAME, 
	TABLE_ROWS 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA ='nhl';
