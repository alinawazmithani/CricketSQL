-- Create a table for teams
CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    team_name VARCHAR(50) NOT NULL,
    coach_name VARCHAR(50),
    established_year INT
);

-- Create a table for players
CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    player_name VARCHAR(50) NOT NULL,
    date_of_birth TIMESTAMP,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

-- Create a table for matches
CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    date_played TIMESTAMP,
    venue VARCHAR(100),
    team1_id INT,
    team2_id INT,
    winner_team_id INT,
    FOREIGN KEY (team1_id) REFERENCES teams(team_id),
    FOREIGN KEY (team2_id) REFERENCES teams(team_id),
    FOREIGN KEY (winner_team_id) REFERENCES teams(team_id)
);

-- Create a table for player statistics
CREATE TABLE player_statistics (
    stat_id SERIAL PRIMARY KEY,
    player_id INT,
    matches_played INT,
    runs_scored INT,
    wickets_taken INT,
    FOREIGN KEY (player_id) REFERENCES players(player_id)
);

-- Insert some sample data into the tables
INSERT INTO teams VALUES (DEFAULT, 'Team A', 'Coach X', 2000);
INSERT INTO teams VALUES (DEFAULT, 'Team B', 'Coach Y', 1995);

INSERT INTO players VALUES (DEFAULT, 'Player 1', '1990-05-15', 1);
INSERT INTO players VALUES (DEFAULT, 'Player 2', '1995-08-20', 2);

INSERT INTO matches VALUES (DEFAULT, '2022-01-10', 'Stadium 1', 1, 2, 1);

INSERT INTO player_statistics VALUES (DEFAULT, 1, 1, 50, 2);
INSERT INTO player_statistics VALUES (DEFAULT, 2, 1, 30, 1);