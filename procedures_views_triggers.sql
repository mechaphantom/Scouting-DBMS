use ScoutingDB;

-- Stored Procedures 
DELIMITER 
CREATE procedure procedure1_matches();
begin
	select DISTINCT team_name, matchdata.against_team, match_date from matchdata
    inner join players on matchdata.playerid = players.playerid
    inner join teams on players.teamid = teams.teamid;
END 
DELIMITER ; 

DELIMITER 
CREATE procedure procedure1_matches();
begin
	select team_name, league_name, country_name from teams 
	inner join leagues on teams.leagueid = leagues.leagueid
	inner join countries on leagues.countryid = countries.countryid; 
END 
DELIMITER ; 

-- Views
CREATE VIEW `view1_psyissues` AS
select player_name, issue_description, start_date, end_date from players
inner join psychological_issues on psychological_issues.playerid = players.playerid;

CREATE VIEW `view2_trainingpoints` AS
select player_name, AVG(training_point) as average_training_point from trainingperformancereport 
inner join players on players.playerid = trainingperformancereport.playerid
group by trainingperformancereport.playerid;

CREATE VIEW `view3_teamsofleagues` AS
select team_name, league_name, country_name from teams 
inner join leagues on teams.leagueid = leagues.leagueid
inner join countries on leagues.countryid = countries.countryid; 

select * from view3_teamsofleagues;

-- Trigger
CREATE TRIGGER inserting_new_training_data AFTER INSERT
ON trainingperformancereport
FOR EACH ROW
update view2_trainingpoints
set average_training_point = (select player_name, AVG(training_point) as average_training_point from trainingperformancereport 
					 inner join players on players.playerid = trainingperformancereport.playerid
					 group by trainingperformancereport.playerid);

CREATE TRIGGER inserting_new_player BEFORE INSERT
ON players
FOR EACH ROW
SET NEW.player_name = UPPER(NEW.player_name);

INSERT INTO players (player_name, dob, nationality, teamid, agentid, preferred_foot, height, weight) VALUES ('Heung-Min Son', '1992-07-08', 'South Korea', 1, 3, 'Both', 184, 78);
INSERT INTO players (player_name, dob, nationality, teamid, agentid, preferred_foot, height, weight) VALUES ('kerem doğan', '1992-07-08', 'South Korea', 1, 3, 'Both', 184, 78);
select * from players;

CREATE TRIGGER updating_player_value AFTER INSERT
ON value_history
FOR EACH ROW
update contract_details set current_value = NEW.player_value where playerid = NEW.playerid;

INSERT INTO value_history (playerid, teamid, player_value, value_date, value_change) VALUES (1, 1, 120000000, '2022-03-20', 20000000);
INSERT INTO value_history (playerid, teamid, player_value, value_date, value_change) VALUES (1, 1, 130000000, '2022-03-20', 20000000);
INSERT INTO value_history (playerid, teamid, player_value, value_date, value_change) VALUES (1, 1, 140000000, '2022-03-20', 20000000);
select * from contract_details;

