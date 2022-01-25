use ScoutingDB;

Select player_name, teams.team_name, wage, contract_details.contract_until from players
inner join teams on players.teamid = teams.teamid
inner join contract_details on players.playerid = contract_details.playerid;

Select Count(playerid), nationality from players
inner join teams on players.teamid = teams.teamid
where team_name='Manchester United' 
group by nationality;

Select player_name, team_name, pr_name from players
inner join teams on players.teamid = teams.teamid
inner join positionroles on players.playerid =  positionroles.playerid
inner Join pr_list on pr_list.prlistid = positionroles.prlistid;

Select player_name, playerdata.goals, playerdata.xG from players
inner join matchdata on players.playerid = matchdata.playerid
inner join playerdata on matchdata.matchdataid = playerdata.matchdataid
where matchdata.against_team = (select teamid from teams where team_name='Arsenal');

Select playerdata.goals, playerdata.shoots, playerdata.shoots_ontarget, playerdata.xG, team_name as against_team from playerdata
inner join matchdata on playerdata.matchdataid = matchdata.matchdataid
inner join players on matchdata.playerid = players.playerid
inner join teams on matchdata.against_team = teams.teamid
where players.player_name = 'Harry Kane';