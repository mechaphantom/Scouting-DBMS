# Scouting-DBMS

Scouting DBMS is a database management system where information, statistics, performance reports and analyzes of football players are kept. It was developed by using MySQL. 

## Business Need

There is no system where football clubs, managers and coaches around the world can easily access the necessary 'talent hunting' reports about the players they want to transfer. Thanks to the system we will create, talent hunters (scouts) assigned by the clubs will observe the desired player on the spot and enter the report into the system, and the team to which this scout is affiliated will be able to view these reports. Clubs and coaches will have access to a comprehensive report on a player's technical, mental and physical characteristics, as well as detailed information about the player's transfer history, statistics, in-game features and existing contract with the team. 

## Business Requirements

<b>Player List:</b> The list of players in the database. Due to the main purpose of our system, the player data to be entered forms the basis of this system. Many different tables will be linked to the table where the players are listed. 
<b></b>
  <b>Scout Report:</b> Detailed reports prepared by the scouts assigned by the clubs will be specific to the players. Your report; It has three subclasses: technical, mental and physical. It will also include a subclass with information about the technical capabilities of goalkeepers. 

  <b>Position & Roles:</b> Players can take part in different roles in different positions. 
Transfer History: Every player has a transfer history. The date on which he was transferred to which team and until what date he played in that team are kept in this table. 

  <b>Value History:</b> Market values of players may change over time. Market values renewed between certain dates are kept in this table. 

  <b>Contract Details:</b> Contains information about players' contracts with their clubs. 

  <b>Agent/Agency Company:</b> Players must contract with their agent or agency company for contract negotiations and other administrative work.

  <b>Statistics:</b> Annual statistics of players. There are different tables which contain different types of data for goalkeepers. It has 4 subclasses: Club Statistics and National Team Statistics, GK Club Statistics, GK National Team Statistics. 

  <b>Training Performance:</b> Players have training performance reports and the necessary parts of these reports such as training type and training points (shows the success of player during this specific training session) are here in this table.

  <b>Psychological Issues:</b> Information about the psychological issues experienced by the players is kept in this table. 

  <b>Match Data:</b> It is the table where the performance data of the players in the matches are kept. There are two separate subclasses for players and goalkeepers. 

<b>Team List:</b> The list of teams in the database. Several different tables will be linked to the table where the teams are listed. 

  <b>Scout List:</b> Clubs assign scouts to monitor players and gather information. Which scout works for which club is kept in this table. 

  <b>Country:</b> Teams belong to one country. Which team is from which country is kept in this table. 

  <b>League:</b> Countries have leagues of different levels. The league to which each team belongs is held here. 
  
  ## Business Value
  
Thanks to the reports of the Scouts, the teams will have detailed information about the players they will transfer. 

Agents and Agency Companies will be able to learn about their players and have a great advantage in marketing their players to other teams. 

Players will have made a self-assessment for themselves, and the possibility of transferring to different teams and accessing new career opportunities will increase. 

Players will be able to request contract improvements from their clubs thanks to reports written about them at different times (Similarly, clubs may choose to weaken the existing contract over negative developments.).

Thanks to the training performance table, managers and scouts can access the data about training sessions which players are working on. It is very important for managers to learn players’ performance during training. Besides, players make self criticism and assess themselves according to their training points.

Increased opportunity to have general information about football players for fans to whom limited access will be provided. 

## Business Rules

A player can only play for one club. (A club can have an unlimited number of players.) 

A player can have more than one Scout report. (One scout report is for 1 player only.) 

A player can have an unlimited number of roles. (A role can be taken on an unlimited number of players.) (This is an M-M relationship.)

A player can have 1 contract with their current team. (One contract is for 1 player only.) 

A player can have a contract with 1 agent/agency company. (An agent/agency company can contract with unlimited players.) 

A player can only have an unlimited number of stat data. (Stat data belongs to only 1 player.) 

A player may have played on at least 1 team in the past (1..*). 

A player can have at least 1 of market values in the past (1..*). 

A player can have an unlimited number of training performance reports. (A performance report belongs to only 1 player.) 

A player may have an unlimited number of psychological issues.

A player can have an unlimited number of match data.

Match Data Table has 2 subclasses: Player Data and GK Data.

A team can have an unlimited number of scouts. (A scout can only work for 1 club.) 

A team belongs to only 1 country. (A country can have an unlimited number of teams.) 

A league belongs to only one country. (A country can have an unlimited number of leagues.) 

A Scout Report only belongs to 1 scout. (A scout can write an unlimited number of reports.) 

A Scout Report has 4 subclasses: Technical, Mental, Physical, GK Technical. (Scout Report is a superclass, the others are subclasses.) 

## Class Diagram of Database

![1](https://user-images.githubusercontent.com/57845882/150996133-aa6b77d1-2fbd-4147-8bbe-84b87cf0248a.png)
![2](https://user-images.githubusercontent.com/57845882/150996173-3e5febb4-f5aa-47b3-aeb1-4e3340ab1e33.png)

## Logical Diagram of Database

![3](https://user-images.githubusercontent.com/57845882/150996327-d363f07b-b81d-4385-820a-02be69d97989.png)
![4](https://user-images.githubusercontent.com/57845882/150996344-6a5def9e-6a81-4a4a-9c86-8a1f68047db9.png)
