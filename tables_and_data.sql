CREATE DATABASE ScoutingDB
use ScoutingDB;

CREATE TABLE countries(
countryid int primary key auto_increment,
country_name nvarchar(100)
);
INSERT INTO countries (country_name) VALUES ('England'); 
INSERT INTO countries (country_name) VALUES ('Spain');
select * from countries;
 
CREATE TABLE leagues(
leagueid int primary key auto_increment,
league_name nvarchar(100),
countryid int,
FOREIGN KEY (countryid) REFERENCES countries(countryid)
);
INSERT INTO leagues (league_name, countryid) VALUES ('Premier League', 1); 
INSERT INTO leagues (league_name, countryid) VALUES ('La Liga', 2);
select * from leagues;

CREATE TABLE teams(
teamid int primary key auto_increment,
team_name nvarchar(100),
manager nvarchar(100),
president nvarchar(100),
stadium nvarchar(100),
leagueid int,
FOREIGN KEY (leagueid) REFERENCES leagues(leagueid)
);
INSERT INTO teams (team_name, manager, president, stadium, leagueid) VALUES ('Tottenham', 'Antonio Conte', 'Daniel Levy', 'Tottenham Hotspur Stadium', 1); 
INSERT INTO teams (team_name, manager, president, stadium, leagueid) VALUES ('Manchester United', 'Ralf Rangnick', 'Joel Glazer, Avram Glazer', 'Old Trafford', 1);
INSERT INTO teams (team_name, manager, president, stadium, leagueid) VALUES ('Arsenal', 'Mikel Arteta', 'Vinai Venkatesham', 'Emirates Stadium', 1);
INSERT INTO teams (team_name, manager, president, stadium, leagueid) VALUES ('Atletico Madrid', 'Diego Simeone', 'Enrique Cerezo', 'Wanda Metropolitano', 2);  
select * from teams;

CREATE TABLE scouts(
scoutid int primary key auto_increment,
scout_name nvarchar(100),
dob date,
nationality nvarchar(100),
teamid int,
FOREIGN KEY (teamid) REFERENCES teams(teamid),
judging_ability int,
judging_potential int,
wage int,
contract_until date
);
INSERT INTO scouts (scout_name, dob, nationality, teamid, judging_ability, judging_potential, wage, contract_until) VALUES ('Kerem Doğan', '2000-07-15', 'Turkey', 1, 16, 18, 10000, '2023-06-30'); 
INSERT INTO scouts (scout_name, dob, nationality, teamid, judging_ability, judging_potential, wage, contract_until) VALUES ('Selçuk Doğan', '1987-01-06', 'USA', 2, 18, 19, 20000, '2023-06-30'); 
select * from scouts;

CREATE TABLE agents(
agentid int primary key auto_increment,
address nvarchar(100),
contact_number nvarchar(100),
email nvarchar(100)
);
INSERT INTO agents (address, contact_number, email) VALUES ('São Paulo, Brazil', '123456789', 'tfm@agency.com'); 
INSERT INTO agents (address, contact_number, email) VALUES ('London, England', '987654321', 'ck66@agency.com'); 
INSERT INTO agents (address, contact_number, email) VALUES ('LA, USA', '147258369', 'jdoe@gmail.com'); 
select * from agents;

CREATE TABLE IndividualAgent(
iaid int primary key auto_increment,
agentid int,
FOREIGN KEY (agentid) REFERENCES agents(agentid),
agent_name nvarchar(100),
agent_surname nvarchar(100)
);
INSERT INTO IndividualAgent (agentid, agent_name, agent_surname) VALUES (3, 'John', 'Doe'); 
select * from IndividualAgent;

CREATE TABLE Agency(
agencyid int primary key auto_increment,
agentid int,
FOREIGN KEY (agentid) REFERENCES agents(agentid),
agency_name nvarchar(100)
);
INSERT INTO Agency (agentid, agency_name) VALUES (1, 'TFM Agency'); 
INSERT INTO Agency (agentid, agency_name) VALUES (2, 'CK66'); 
select * from Agency;

CREATE TABLE players(
playerid int primary key auto_increment,
player_name nvarchar(100),
dob date,
nationality nvarchar(100),
teamid int,
FOREIGN KEY (teamid) REFERENCES teams(teamid),
agentid int,
FOREIGN KEY (agentid) REFERENCES agents(agentid),
preferred_foot nvarchar(100),
height int,
weight int
);
INSERT INTO players (player_name, dob, nationality, teamid, agentid, preferred_foot, height, weight) VALUES ('Harry Kane', '1993-07-28', 'England', 1, 2, 'Right', 188, 86);
INSERT INTO players (player_name, dob, nationality, teamid, agentid, preferred_foot, height, weight) VALUES ('Gabriel Martinelli', '2001-06-18', 'Brazil', 3, 1, 'Right', 176, 76);
INSERT INTO players (player_name, dob, nationality, teamid, agentid, preferred_foot, height, weight) VALUES ('David de Gea', '1990-11-07', 'Spain', 2, 3, 'Right', 189, 82);
INSERT INTO players (player_name, dob, nationality, teamid, agentid, preferred_foot, height, weight) VALUES ('Cristiano Ronaldo', '1985-02-05', 'Portugal', 2, 1, 'Right', 187, 85);
select * from players;

CREATE TABLE TrainingPerformanceReport(
tpid int primary key auto_increment,
playerid int,
FOREIGN KEY (playerid) REFERENCES players(playerid),
teamid int,
FOREIGN KEY (teamid) REFERENCES teams(teamid),
training_date date,
training_type nvarchar(100),
workload nvarchar(100),
training_happiness nvarchar(100),
training_point float
);
INSERT INTO TrainingPerformanceReport (playerid, teamid, training_date, training_type, workload, training_happiness, training_point) VALUES (1, 1, '2022-01-19', 'Tactics', 'High', 'Happy', 8.41);
INSERT INTO TrainingPerformanceReport (playerid, teamid, training_date, training_type, workload, training_happiness, training_point) VALUES (1, 1, '2022-01-20', 'Shooting', 'High', 'Happy', 7.66);
INSERT INTO TrainingPerformanceReport (playerid, teamid, training_date, training_type, workload, training_happiness, training_point) VALUES (2, 3, '2022-01-19', 'Counter-Attacks', 'Normal', 'Happy', 7.23);
INSERT INTO TrainingPerformanceReport (playerid, teamid, training_date, training_type, workload, training_happiness, training_point) VALUES (3, 2, '2022-01-19', 'One-to-Ones', 'Low', 'Unhappy', 5.11);
select * from TrainingPerformanceReport;

CREATE TABLE report(
reportid int primary key auto_increment,
playerid int,
FOREIGN KEY (playerid) REFERENCES players(playerid),
scoutid int,
FOREIGN KEY (scoutid) REFERENCES scouts(scoutid),
report_date date
);
INSERT INTO report (playerid, scoutid, report_date) VALUES (1, 2, '2022-01-20');
INSERT INTO report (playerid, scoutid, report_date) VALUES (2, 1, '2022-01-20');
INSERT INTO report (playerid, scoutid, report_date) VALUES (3, 1, '2022-01-20');
select * from report;

CREATE TABLE Technical(
technical_reportid int primary key auto_increment,
reportid int,
FOREIGN KEY (reportid) REFERENCES report(reportid),
tackling int,
marking int,
heading int,
finishing int,
dribbling int,
passing int,
FK_taking int
);
INSERT INTO Technical (reportid, tackling, marking, heading, finishing, dribbling, passing, FK_taking) VALUES (1, 12,12,15,20,14,19,13);
INSERT INTO Technical (reportid, tackling, marking, heading, finishing, dribbling, passing, FK_taking) VALUES (2, 3,4,13,13,16,13,12);
select * from Technical;

CREATE TABLE Mental(
mental_reportid int primary key auto_increment,
reportid int,
FOREIGN KEY (reportid) REFERENCES report(reportid),
concentration int,
decisions int,
vision int,
composure int,
positioning int,
off_the_ball int,
leadership int
);
INSERT INTO Mental (reportid, concentration, decisions, vision, composure, positioning, off_the_ball, leadership) VALUES (1, 16,17,20,20,11,17,16);
INSERT INTO Mental (reportid, concentration, decisions, vision, composure, positioning, off_the_ball, leadership) VALUES (2, 13,12,13,13,7,17,6);
INSERT INTO Mental (reportid, concentration, decisions, vision, composure, positioning, off_the_ball, leadership) VALUES (3, 12,16,3,16,16,11,11);
select * from Mental;

CREATE TABLE Physical(
physical_reportid int primary key auto_increment,
reportid int,
FOREIGN KEY (reportid) REFERENCES report(reportid),
pace int,
acceleration int,
agility int,
strenght int,
stamina int,
natural_fitness int,
balance int
);
INSERT INTO Physical (reportid, pace, acceleration, agility, strenght, stamina, natural_fitness, balance) VALUES (1, 12,12,12,16,18,18,14);
INSERT INTO Physical (reportid, pace, acceleration, agility, strenght, stamina, natural_fitness, balance) VALUES (2, 17,17,16,11,12,12,13);
INSERT INTO Physical (reportid, pace, acceleration, agility, strenght, stamina, natural_fitness, balance) VALUES (3, 12,13,20,13,14,17,12);
select * from Physical;

CREATE TABLE GK_Technical(
gktechnical_reportid int primary key auto_increment,
reportid int,
FOREIGN KEY (reportid) REFERENCES report(reportid),
aerial_reach int,
command_of_area int,
communication int,
one_to_ones int,
handling int,
kicking int,
reflexes int
);
INSERT INTO GK_Technical (reportid, aerial_reach, command_of_area, communication, one_to_ones, handling, kicking, reflexes) VALUES (3, 18,8,12,16,20,16,20);
select * from GK_Technical;

CREATE TABLE stats(
statid int primary key auto_increment,
playerid int,
FOREIGN KEY (playerid) REFERENCES players(playerid),
season nvarchar(100)
);
INSERT INTO stats (playerid, season) VALUES (1, '2020-2021');
INSERT INTO stats (playerid, season) VALUES (2, '2020-2021');
INSERT INTO stats (playerid, season) VALUES (3, '2020-2021');
INSERT INTO stats (playerid, season) VALUES (1, '2021-2022');
INSERT INTO stats (playerid, season) VALUES (2, '2021-2022');
INSERT INTO stats (playerid, season) VALUES (3, '2021-2022');
select * from stats;

CREATE TABLE Club_Stats(
clubstatsid int primary key auto_increment,
statid int,
FOREIGN KEY (statid) REFERENCES stats(statid),
club_goals int,
club_assists int,
club_matches int,
club_total_minutes int,
club_yellow_cards int,
club_red_cards int,
club_distance_per_match float
);
INSERT INTO Club_Stats (statid, club_goals, club_assists, club_matches, club_total_minutes, club_yellow_cards, club_red_cards, club_distance_per_match) VALUES (1, 23,14,35,3150,1,0,15.4);
INSERT INTO Club_Stats (statid, club_goals, club_assists, club_matches, club_total_minutes, club_yellow_cards, club_red_cards, club_distance_per_match) VALUES (2, 2,1,14,350,0,0,4.6);
INSERT INTO Club_Stats (statid, club_goals, club_assists, club_matches, club_total_minutes, club_yellow_cards, club_red_cards, club_distance_per_match) VALUES (4, 0,0,0,0,0,0,0);
INSERT INTO Club_Stats (statid, club_goals, club_assists, club_matches, club_total_minutes, club_yellow_cards, club_red_cards, club_distance_per_match) VALUES (5, 0,0,0,0,0,0,0);
select * from Club_Stats;

CREATE TABLE International_Stats(
internationalstatsid int primary key auto_increment,
statid int,
FOREIGN KEY (statid) REFERENCES stats(statid),
nat_goals int,
nat_assists int,
nat_matches int,
nat_total_minutes int,
nat_yellow_cards int,
nat_red_cards int,
nat_distance_per_match float
);
INSERT INTO International_Stats (statid, nat_goals, nat_assists, nat_matches, nat_total_minutes, nat_yellow_cards, nat_red_cards, nat_distance_per_match) VALUES (1, 4,4,15,1350,0,0,14.21);
INSERT INTO International_Stats (statid, nat_goals, nat_assists, nat_matches, nat_total_minutes, nat_yellow_cards, nat_red_cards, nat_distance_per_match) VALUES (2, 0,1,3,185,1,0,9.3);
select * from International_Stats;

CREATE TABLE GK_Club_Stats(
gkclubstatsid int primary key auto_increment,
statid int,
FOREIGN KEY (statid) REFERENCES stats(statid),
club_matches int,
club_goal_conceded int,
club_clean_sheets int,
club_total_minutes int,
club_yellow_cards int,
club_red_cards int,
club_saves_per_match float
);
INSERT INTO GK_Club_Stats (statid, club_matches, club_goal_conceded, club_clean_sheets, club_total_minutes, club_yellow_cards, club_red_cards, club_saves_per_match) 
VALUES (3, 26,32,9,2340,0,0,3.4);
select * from GK_Club_Stats;

CREATE TABLE GK_International_Stats(
gkinternationalstatsid int primary key auto_increment,
statid int,
FOREIGN KEY (statid) REFERENCES stats(statid),
nat_matches int,
nat_goal_conceded int,
nat_clean_sheets int,
nat_total_minutes int,
nat_yellow_cards int,
nat_red_cards int,
nat_saves_per_match float
);
INSERT INTO GK_International_Stats (statid, nat_matches, nat_goal_conceded, nat_clean_sheets, nat_total_minutes, nat_yellow_cards, nat_red_cards, nat_saves_per_match) 
VALUES (3, 13,14,3,1170,1,0,3.7);
select * from GK_International_Stats;

CREATE TABLE contract_details(
detailid int primary key auto_increment,
playerid int,
FOREIGN KEY (playerid) REFERENCES players(playerid),
wage int,
total_bonusses int,
current_value int,
contract_until date,
eager_to_move boolean
);
ALTER TABLE contract_details MODIFY COLUMN eager_to_move nvarchar(100); 
INSERT INTO contract_details (playerid, wage, total_bonusses, current_value, contract_until, eager_to_move) VALUES (1,200000,125000,100000000,'2024-06-30','Unstable');
INSERT INTO contract_details (playerid, wage, total_bonusses, current_value, contract_until, eager_to_move) VALUES (2,90000,50000,28000000,'2024-06-30','No');
INSERT INTO contract_details (playerid, wage, total_bonusses, current_value, contract_until, eager_to_move) VALUES (3,375000,180000,18000000,'2023-06-30','Yes');
select * from contract_details;

CREATE TABLE value_history(
valuehistoryid int primary key auto_increment,
playerid int,
FOREIGN KEY (playerid) REFERENCES players(playerid),
teamid int,
FOREIGN KEY (teamid) REFERENCES teams(teamid),
player_value int,
value_date date,
value_change int
);
INSERT INTO value_history (playerid, teamid, player_value, value_date, value_change) VALUES (1, 1, 90000000, '2021-06-30', 0);
INSERT INTO value_history (playerid, teamid, player_value, value_date, value_change) VALUES (1, 1, 100000000, '2022-01-19', 10000000);
INSERT INTO value_history (playerid, teamid, player_value, value_date, value_change) VALUES (2, 3, 22000000, '2021-06-30', 0);
INSERT INTO value_history (playerid, teamid, player_value, value_date, value_change) VALUES (2, 3, 28000000, '2022-01-19', 6000000);
INSERT INTO value_history (playerid, teamid, player_value, value_date, value_change) VALUES (3, 2, 25000000, '2021-06-30', 0);
INSERT INTO value_history (playerid, teamid, player_value, value_date, value_change) VALUES (3, 2, 18000000, '2022-01-19', -7000000);
select * from value_history;

CREATE TABLE transfer_history(
transferhistoryid int primary key auto_increment,
playerid int,
FOREIGN KEY (playerid) REFERENCES players(playerid),
fromteamid int,
FOREIGN KEY (fromteamid) REFERENCES teams(teamid),
toteamid int,
FOREIGN KEY (toteamid) REFERENCES teams(teamid),
transfer_date date,
season nvarchar(100),
transfer_fee int
);
INSERT INTO transfer_history (playerid, fromteamid, toteamid, transfer_date, season, transfer_fee) VALUES (3, 4, 2, '2011-07-01', '2011-2012', 25000000);
select * from transfer_history;

CREATE TABLE psychological_issues(
psyid int primary key auto_increment,
playerid int,
FOREIGN KEY (playerid) REFERENCES players(playerid),
teamid int,
FOREIGN KEY (teamid) REFERENCES teams(teamid),
start_date date,
end_date date,
issue_description nvarchar(500)
);
INSERT INTO psychological_issues (playerid, teamid, start_date, issue_description) VALUES (3, 2, '2021-12-01', 'Homesick');
INSERT INTO psychological_issues (playerid, teamid, start_date, end_date, issue_description) VALUES (1, 1, '2021-06-15', '2021-11-02', 'Sad about the clubs failures. Wants to transfer to Man City.');
select * from psychological_issues;

CREATE TABLE pr_list(
prlistid int primary key auto_increment,
pr_name nvarchar(250)
);
INSERT INTO pr_list (pr_name) VALUES ('GK - Sweeper Keeper');
INSERT INTO pr_list (pr_name) VALUES ('GK - Standart Keeper');
INSERT INTO pr_list (pr_name) VALUES ('Left Wing - Inverted Wing');
INSERT INTO pr_list (pr_name) VALUES ('Midfielder - Advanced Playmaker');
INSERT INTO pr_list (pr_name) VALUES ('Forward - Advanced Forward');
INSERT INTO pr_list (pr_name) VALUES ('Forward - Deep-Lying Forward');
select * from pr_list;

CREATE TABLE PositionRoles(
prid int primary key auto_increment,
playerid int,
FOREIGN KEY (playerid) REFERENCES players(playerid),
prlistid int,
FOREIGN KEY (prlistid) REFERENCES pr_list(prlistid)
);
INSERT INTO PositionRoles (playerid, prlistid) VALUES (1, 5);
INSERT INTO PositionRoles (playerid, prlistid) VALUES (1, 6);
INSERT INTO PositionRoles (playerid, prlistid) VALUES (2, 3);
INSERT INTO PositionRoles (playerid, prlistid) VALUES (3, 1);
select * from PositionRoles;

CREATE TABLE matchdata(
matchdataid int primary key auto_increment,
playerid int,
FOREIGN KEY (playerid) REFERENCES players(playerid),
against_team int,
FOREIGN KEY (against_team) REFERENCES teams(teamid),
match_date date
);
INSERT INTO matchdata (playerid, against_team, match_date) VALUES (1, 3, '2022-01-20');
INSERT INTO matchdata (playerid, against_team, match_date) VALUES (2, 1, '2022-01-20');
INSERT INTO matchdata (playerid, against_team, match_date) VALUES (3, 3, '2022-01-23');
INSERT INTO matchdata (playerid, against_team, match_date) VALUES (1, 3, '2022-01-26');
select * from matchdata;

CREATE TABLE PlayerData(
pdid int primary key auto_increment,
matchdataid int,
FOREIGN KEY (matchdataid) REFERENCES matchdata(matchdataid),
goals int,
assists int,
shoots int,
shoots_ontarget int,
passes int,
passes_completed int,
dribbling_completed int,
tackles int,
fouls int,
xG float,
offsides int,
yellow_card int,
red_card int,
player_score float
);
INSERT INTO PlayerData (matchdataid, goals, assists, shoots, shoots_ontarget, passes, passes_completed, dribbling_completed, tackles, fouls, xG, offsides, yellow_card, red_card, player_score) 
VALUES (1, 1, 1, 5, 4, 57, 45, 2, 2, 3, 0.85, 2, 0, 0, 8.3);
INSERT INTO PlayerData (matchdataid, goals, assists, shoots, shoots_ontarget, passes, passes_completed, dribbling_completed, tackles, fouls, xG, offsides, yellow_card, red_card, player_score) 
VALUES (2, 0, 1, 3, 1, 64, 56, 4, 5, 3, 0.36, 3, 0, 0, 6.7);
select * from PlayerData;

CREATE TABLE GKData(
gkdid int primary key auto_increment,
matchdataid int,
FOREIGN KEY (matchdataid) REFERENCES matchdata(matchdataid),
goals_conceded int,
saves int,
tackles int,
passes int,
passes_completed int,
fouls int,
yellow_card int,
red_card int,
gkplayer_score float
);
INSERT INTO GKData (matchdataid, goals_conceded, saves, tackles, passes, passes_completed, fouls, yellow_card, red_card, gkplayer_score) 
VALUES (3, 2, 6, 1, 25, 19, 1, 1, 0, 6.5);
select * from GKData;