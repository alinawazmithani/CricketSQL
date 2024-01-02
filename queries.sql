-- Basic Queries

-- Retrieve all players and their teams.

SELECT player_name, team_name
FROM players
JOIN teams ON players.team_id = teams.team_id;

-- Get a list of all teams and their coaches.

SELECT team_name, coach_name
FROM teams;

-- Find the total number of matches played.

SELECT COUNT(*) AS total_matches
FROM matches;

-- Aggregation and Grouping

-- Calculate the average runs scored and wickets taken per player.

SELECT
    player_name,
    AVG(runs_scored) AS avg_runs,
    AVG(wickets_taken) AS avg_wickets
FROM player_statistics
JOIN players ON player_statistics.player_id = players.player_id
GROUP BY player_name;

-- Find the team with the highest number of matches won.

SELECT
    team_name,
    COUNT(*) AS matches_won
FROM teams
JOIN matches ON teams.team_id = matches.winner_team_id
GROUP BY team_name
ORDER BY matches_won DESC
LIMIT 1;

-- Conditional Queries

-- Retrieve players who have scored more than 50 runs in a single match.

SELECT
    player_name,
    runs_scored
FROM player_statistics
JOIN players ON player_statistics.player_id = players.player_id
WHERE runs_scored > 50;

-- List matches played in the year 2022.

SELECT *
FROM matches
WHERE EXTRACT(YEAR FROM date_played) = 2022;

-- Find the team that hasn't won any matches.

SELECT team_name
FROM teams
WHERE team_id NOT IN (SELECT DISTINCT winner_team_id FROM matches WHERE winner_team_id IS NOT NULL);

-- Joining Multiple Tables

-- Retrieve players along with their teams and the matches they have played.

SELECT
    player_name,
    team_name,
    date_played
FROM players
JOIN teams ON players.team_id = teams.team_id
JOIN matches ON players.team_id = matches.team1_id OR players.team_id = matches.team2_id;

-- Get the total number of matches won by players belonging to each team.

SELECT
    team_name,
    COUNT(*) AS matches_won
FROM teams
JOIN matches ON teams.team_id = matches.winner_team_id
GROUP BY team_name;

