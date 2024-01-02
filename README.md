# Cricket SQL Database

This is a sample relational database designed for a cricket management system. The database is created using PostgreSQL and consists of four main tables: `players`, `teams`, `matches`, and `player_statistics`. The schema is designed to capture essential information about players, teams, matches, and player statistics.

## Table Descriptions:

### 1. Players

- **Columns:**
  - `player_id`: Unique identifier for each player.
  - `player_name`: Name of the player.
  - `date_of_birth`: Date of birth of the player.
  - `team_id`: Foreign key referencing the team to which the player belongs.

### 2. Teams

- **Columns:**
  - `team_id`: Unique identifier for each team.
  - `team_name`: Name of the team.
  - `coach_name`: Name of the team's coach.
  - `established_year`: Year the team was established.

### 3. Matches

- **Columns:**
  - `match_id`: Unique identifier for each match.
  - `date_played`: Date on which the match was played.
  - `venue`: Venue where the match took place.
  - `team1_id`: Foreign key referencing the first team participating in the match.
  - `team2_id`: Foreign key referencing the second team participating in the match.
  - `winner_team_id`: Foreign key referencing the winning team.

### 4. Player Statistics

- **Columns:**
  - `stat_id`: Unique identifier for each player's statistics.
  - `player_id`: Foreign key referencing the player for whom the statistics are recorded.
  - `matches_played`: Number of matches played by the player.
  - `runs_scored`: Total runs scored by the player.
  - `wickets_taken`: Total wickets taken by the player.

## Sample Data and Queries:

Below are some sample SQL queries and exercises that can be executed on this database to practice various SQL concepts:

### Basic Queries

1. Retrieve all players and their teams.

    ```sql
    SELECT player_name, team_name
    FROM players
    JOIN teams ON players.team_id = teams.team_id;
    ```

2. Get a list of all teams and their coaches.

    ```sql
    SELECT team_name, coach_name
    FROM teams;
    ```

3. Find the total number of matches played.

    ```sql
    SELECT COUNT(*) AS total_matches
    FROM matches;
    ```

### Aggregation and Grouping

4. Calculate the average runs scored and wickets taken per player.

    ```sql
    SELECT
        player_name,
        AVG(runs_scored) AS avg_runs,
        AVG(wickets_taken) AS avg_wickets
    FROM player_statistics
    JOIN players ON player_statistics.player_id = players.player_id
    GROUP BY player_name;
    ```

5. Find the team with the highest number of matches won.

    ```sql
    SELECT
        team_name,
        COUNT(*) AS matches_won
    FROM teams
    JOIN matches ON teams.team_id = matches.winner_team_id
    GROUP BY team_name
    ORDER BY matches_won DESC
    LIMIT 1;
    ```

### Conditional Queries

6. Retrieve players who have scored more than 50 runs in a single match.

    ```sql
    SELECT
        player_name,
        runs_scored
    FROM player_statistics
    JOIN players ON player_statistics.player_id = players.player_id
    WHERE runs_scored > 50;
    ```

7. List matches played in the year 2022.

    ```sql
    SELECT *
    FROM matches
    WHERE EXTRACT(YEAR FROM date_played) = 2022;
    ```

8. Find the team that hasn't won any matches.

    ```sql
    SELECT team_name
    FROM teams
    WHERE team_id NOT IN (SELECT DISTINCT winner_team_id FROM matches WHERE winner_team_id IS NOT NULL);
    ```

### Joining Multiple Tables

9. Retrieve players along with their teams and the matches they have played.

    ```sql
    SELECT
        player_name,
        team_name,
        date_played
    FROM players
    JOIN teams ON players.team_id = teams.team_id
    JOIN matches ON players.team_id = matches.team1_id OR players.team_id = matches.team2_id;
    ```

10. Get the total number of matches won by players belonging to each team.

    ```sql
    SELECT
        team_name,
        COUNT(*) AS matches_won
    FROM teams
    JOIN matches ON teams.team_id = matches.winner_team_id
    GROUP BY team_name;
    ```
