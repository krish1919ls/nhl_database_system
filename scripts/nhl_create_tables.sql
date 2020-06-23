USE nhl;

DROP TABLE IF EXISTS team_info;
CREATE TABLE team_info (
	team_id INT NOT NULL,
    franchise_id INT NOT NULL,
    short_name VARCHAR(40) NULL,
    team_name VARCHAR(40) NULL,
    abbreviation VARCHAR(5) NULL,
    link VARCHAR(100) NULL
) COMMENT 'Table contains basic team information';

DROP TABLE IF EXISTS player_info;
CREATE TABLE player_info (
	player_id INT NOT NULL,
    first_name VARCHAR(40) NULL,
    last_name VARCHAR(40) NULL,
    nationality VARCHAR(5) NULL,
    birth_city VARCHAR(50) NULL,
    primary_position VARCHAR(5) NULL,
    birth_date DATE NULL,
    link VARCHAR(100) NULL
) COMMENT 'Table contains basic player information';

DROP TABLE IF EXISTS game;
CREATE TABLE game (
	game_id INT NOT NULL,
    season INT NULL,
    game_type VARCHAR(2) NULL,
    date_time DATE NULL,
    date_time_GMT DATETIME NULL,
    away_team_id INT NULL,
    home_team_id INT NULL,
    away_goals INT NULL,
    home_goals INT NULL,
    outcome VARCHAR(20) NULL,
    home_rink_start VARCHAR(5) NULL,
    venue VARCHAR(50) NULL,
    venue_link VARCHAR(100) NULL,
    venue_time_zone_id VARCHAR(50) NULL,
    venue_time_zone_offset INT NULL,
    venue_time_zone_tz VARCHAR(5) NULL
) COMMENT 'Table contains record of every game';

DROP TABLE IF EXISTS game_plays;
CREATE TABLE game_plays (
	play_id VARCHAR(20) NOT NULL,
	game_id INT NOT NULL,
    play_num INT NOT NULL,
    team_id_for INT NULL,
    team_id_against INT NULL,
    play_event VARCHAR(40) NULL,
    secondary_type VARCHAR(40) NULL,
    x INT NULL,
    y INT NULL,
    period INT NULL,
    period_type VARCHAR(10) NULL,
    period_time INT NULL,
    period_time_remaining INT NULL,
    date_time DATETIME NULL,
    goals_away INT NULL,
    goals_home INT NULL,
    play_description VARCHAR(200) NULL,
    st_x INT NULL,
    st_y INT NULL,
    rink_side VARCHAR(5) NULL
) COMMENT 'Table contains information about individual plays that make up a game';

DROP TABLE IF EXISTS game_plays_players;
CREATE TABLE game_plays_players (
	play_id VARCHAR(20) NOT NULL,
    game_id INT NOT NULL,
    play_num INT NOT NULL,
    player_id INT NOT NULL,
    player_type VARCHAR(20) NULL
) COMMENT 'Table contains information about players involved in a play';

DROP TABLE IF EXISTS game_shifts;
CREATE TABLE game_shifts (
	game_id INT NOT NULL,
    player_id INT NOT NULL,
    period INT NULL,
    shift_start INT NULL,
    shift_end INT NULL
) COMMENT 'Table contains details of which players were on the ice and at which times for each game';

DROP TABLE IF EXISTS game_teams_stats;
CREATE TABLE game_teams_stats (
	game_id INT NOT NULL,
    team_id INT NOT NULL,
    hoa VARCHAR(5) NULL,
    won VARCHAR(5) NULL,
    settled_in VARCHAR(5) NULL,
    head_coach VARCHAR(40) NULL,
	goals INT NULL,
    shots INT NULL,
    hits INT NULL,
    pim INT NULL,
    powerplay_opportunities INT NULL,
    powerplay_goals INT NULL,
    faceoff_win_percentage DECIMAL(8,5) NULL,
    giveaways INT NULL,
    takeaways INT NULL
) COMMENT 'Table contains basic stats for each team per game';

DROP TABLE IF EXISTS game_skater_stats;
CREATE TABLE game_skater_stats (
	game_id INT NOT NULL,
    player_id INT NOT NULL,
    team_id INT NOT NULL,
    time_on_ice INT NULL,
    assists INT NULL,
    goals INT NULL,
    shots INT NULL,
    hits INT NULL,
    power_play_goals INT NULL,
    power_play_assists INT NULL,
    penality_minutes INT NULL,
    faceoff_wins INT NULL,
    faceoff_taken INT NULL,
    takeaways INT NULL,
    giveaways INT NULL,
    short_handed_goals INT NULL,
    short_handed_assists INT NULL,
    blocked INT NULL,
    plus_minus INT NULL,
    even_time_on_ice INT NULL,
    short_handed_time_on_ice INT NULL,
    powerplay_time_on_ice INT NULL
) COMMENT 'Table contains basic stats for each skater that played in a game';

DROP TABLE IF EXISTS game_goalie_stats;
CREATE TABLE game_goalie_stats (
	game_id INT NOT NULL,
    player_id INT NOT NULL,
    team_id INT NOT NULL,
    time_on_ice INT NULL,
    assists INT NULL,
    goals INT NULL,
    pim INT NULL,
    shots INT NULL,
    saves INT NULL,
    power_play_saves INT NULL,
    short_handed_saves INT NULL,
    even_saves INT NULL,
    short_handed_shots_against INT NULL,
    even_shots_against INT NULL,
    powerplay_shots_against INT NULL,
    decision VARCHAR(1) NULL,
    save_percentage DECIMAL(8,5) NULL,
    powerplay_save_percentage DECIMAL(8,5) NULL,
    even_strength_save_percentage DECIMAL(8,5) NULL
) COMMENT 'Table contains basic stats for each goalie that played in a game';
