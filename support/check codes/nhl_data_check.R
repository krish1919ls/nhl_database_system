setwd('../../nhl-game-data')

team.info.df <- read.csv('team_info.csv', stringsAsFactors = FALSE)
sapply(team.info.df, function(x) sum(length(which(is.na(x) | x == ''))))

player.info.df <- read.csv('player_info.csv', stringsAsFactors = FALSE)
sapply(player.info.df, function(x) sum(length(which(is.na(x) | x == ''))))

game.df <- read.csv('game.csv', stringsAsFactors = FALSE)
sapply(game.df, function(x) sum(length(which(is.na(x) | x == ''))))

game.plays.df <- read.csv('game_plays.csv', stringsAsFactors = FALSE)
sapply(game.plays.df, function(x) sum(length(which(is.na(x) | x == ''))))

game.plays.players.df <- read.csv('game_plays_players.csv', stringsAsFactors = FALSE)
sapply(game.plays.players.df, function(x) sum(length(which(is.na(x) | x == ''))))

game.shifts.df <- read.csv('game_shifts.csv', stringsAsFactors = FALSE)
sapply(game.shifts.df, function(x) sum(length(which(is.na(x) | x == ''))))

game.teams.stats.df <- read.csv('game_teams_stats.csv', stringsAsFactors = FALSE)
sapply(game.teams.stats.df, function(x) sum(length(which(is.na(x) | x == ''))))

game.skater.stats.df <- read.csv('game_skater_stats.csv', stringsAsFactors = FALSE)
sapply(game.skater.stats.df, function(x) sum(length(which(is.na(x) | x == ''))))

game.goalie.stats.df <- read.csv('game_goalie_stats.csv', stringsAsFactors = FALSE)
sapply(game.goalie.stats.df , function(x) sum(length(which(is.na(x) | x == ''))))