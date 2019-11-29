-- More JOIN operations

-- 1)
-- Modify it to show the matchid and player name for all goals scored by Germany. 
-- To identify German players, check for: teamid = 'GER'
SELECT * FROM goal 
  WHERE player LIKE '%Bender'

--  Answer 
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'


-- 2)
-- Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2
  FROM game

--  Answer  
SELECT id,stadium,team1,team2
 FROM game
  WHERE id = 1012


-- 3)
-- Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player,stadium
  FROM game JOIN goal ON (id=matchid)

--  Answer  
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid = 'GER'



-- 4)
--  Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'

-- Answer  
SELECT  team1, team2, player
  FROM game JOIN goal ON (id=matchid)
  WHERE player LIKE 'Mario%'



-- 5)
-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, gtime
  FROM goal 
 WHERE gtime<=10

--  Answer  
SELECT player, teamid,coach,  gtime
  FROM goal JOIN eteam ON (id=teamid)
 WHERE gtime<=10



-- 6)
-- List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

--  Answer  
SELECT mdate, teamname
  FROM game JOIN eteam ON team1=eteam.id
 WHERE coach = 'Fernando Santos'


-- 7)
-- For each continent show the continent and number of countries with populations of at least 10 million.

--  Answer  
SELECT player
  FROM goal JOIN game ON (id=matchid)
 WHERE stadium= 'National Stadium, Warsaw'


-- 8)
-- Instead show the name of all players who scored a goal against Germany.
SELECT player, gtime
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' AND team2='GRE')

--  Answer  
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER') AND teamid != 'GER'

-- 9)
-- Show teamname and the total number of goals scored.
SELECT teamname, player
  FROM eteam JOIN goal ON id=teamid
 ORDER BY teamname

--  Answer  
SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname

-- 10)
-- Show the stadium and the number of goals scored in each stadium.

--  Answer  
SELECT stadium, COUNT(player)
  FROM game JOIN goal ON (id=matchid)
 GROUP BY stadium 

-- 11)
-- For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid,mdate, team1, team2,teamid
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')

--  Answer  
SELECT matchid,mdate, COUNT(player)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
 GROUP BY matchid

-- 12)
-- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

--  Answer  
SELECT matchid,mdate, COUNT(player)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid = 'GER'
 GROUP BY matchid



-- 13)
-- Sort your result by mdate, matchid, team1 and team2.
SELECT mdate,
  team1,
  CASE WHEN teamid=team1 THEN 1 ELSE 0 END score1
  FROM game JOIN goal ON matchid = id
  
--  Answer  
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
  FROM game LEFT JOIN goal ON matchid = id
GROUP BY team1,mdate,team2,matchid
ORDER BY mdate, matchid, team1, team2