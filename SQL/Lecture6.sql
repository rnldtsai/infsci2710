--One more one approach to the quiz join question
SELECT player, teamid, gtime  FROM game JOIN goal ON (id = matchid) WHERE (teamid = team1 OR teamid = team2) AND ((team1 != 'ITA' AND team2 != 'ITA'))

--Subquery
SELECT * FROM goal where matchid in (SELECT id FROM game WHERE team1 != 'ITA' AND team2 != 'ITA' AND stadiuum = 'Stadion Miejski (Wroclaw)' AND (teamid = (SELECT team1 FROM game where id=matchid) OR teamid = (SELECT team2 FROM game where id=matchid))
