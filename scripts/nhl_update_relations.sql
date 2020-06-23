USE nhl;

ALTER TABLE player_info ADD PRIMARY KEY (player_id); 
ALTER TABLE team_info ADD PRIMARY KEY (team_id); 
ALTER TABLE game ADD PRIMARY KEY (game_id);
ALTER TABLE game_plays ADD PRIMARY KEY (play_id);
ALTER TABLE game_plays_players ADD game_play_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE game_shifts ADD shift_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE game_teams_stats ADD PRIMARY KEY (game_id, team_id);
ALTER TABLE game_skater_stats ADD PRIMARY KEY (game_id, team_id, player_id);
ALTER TABLE game_goalie_stats ADD PRIMARY KEY (game_id, team_id, player_id);

ALTER TABLE game_plays ADD CONSTRAINT fk_game_id_gp_g FOREIGN KEY (game_id) 
REFERENCES game(game_id);
ALTER TABLE game_plays_players ADD CONSTRAINT fk_game_id_gpp_g FOREIGN KEY (game_id) 
REFERENCES game(game_id);
ALTER TABLE game_shifts ADD CONSTRAINT fk_game_id_gs_g FOREIGN KEY (game_id) 
REFERENCES game(game_id);
ALTER TABLE game_teams_stats ADD CONSTRAINT fk_game_id_gts_g FOREIGN KEY (game_id) 
REFERENCES game(game_id);
ALTER TABLE game_skater_stats ADD CONSTRAINT fk_game_id_gss_g FOREIGN KEY (game_id) 
REFERENCES game(game_id);
ALTER TABLE game_goalie_stats ADD CONSTRAINT fk_game_id_ggs_g FOREIGN KEY (game_id) 
REFERENCES game(game_id);

ALTER TABLE game_plays_players ADD CONSTRAINT fk_player_id_gpp_pi FOREIGN KEY (player_id) 
REFERENCES player_info(player_id);
ALTER TABLE game_shifts ADD CONSTRAINT fk_player_id_gs_pi FOREIGN KEY (player_id) 
REFERENCES player_info(player_id);
ALTER TABLE game_skater_stats ADD CONSTRAINT fk_player_id_gss_pi FOREIGN KEY (player_id) 
REFERENCES player_info(player_id);
ALTER TABLE game_goalie_stats ADD CONSTRAINT fk_player_id_ggs_pi FOREIGN KEY (player_id) 
REFERENCES player_info(player_id);

ALTER TABLE game_teams_stats ADD CONSTRAINT fk_team_id_gts_ti FOREIGN KEY (team_id) 
REFERENCES team_info(team_id);
ALTER TABLE game_skater_stats ADD CONSTRAINT fk_team_id_gss_ti FOREIGN KEY (team_id) 
REFERENCES team_info(team_id);
ALTER TABLE game_goalie_stats ADD CONSTRAINT fk_team_id_ggs_ti FOREIGN KEY (team_id) 
REFERENCES team_info(team_id);

ALTER TABLE game_plays_players ADD CONSTRAINT fk_play_id_gpp_gp FOREIGN KEY (play_id) 
REFERENCES game_plays(play_id);
