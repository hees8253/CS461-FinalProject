

CREATE TABLE OrgMembers (
    email VARCHAR(255) NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    inGameName VARCHAR(255) NOT NULL UNIQUE,
    discordId VARCHAR(255) UNIQUE,
    dbRole VARCHAR(255) NOT NULL,
    CONSTRAINT playerorstaff CHECK (dbRole = 'Player' OR dbRole = 'Staff')
    
);

CREATE TABLE Players (
    inGameName VARCHAR(255) NOT NULL PRIMARY KEY,
    classStanding VARCHAR(2) NOT NULL,
    gradDate DATE NOT NULL,
    teamID VARCHAR(255) NOT NULL,
    teamRole VARCHAR(255),
    CONSTRAINT classCodes CHECK(
        classStanding = 'FR' OR 
        classStanding = 'SO' OR 
        classStanding = 'JR' OR 
        classStanding = 'SR'
    ),
    FOREIGN KEY (inGameName) REFERENCES OrgMembers(inGameName) ON DELETE CASCADE
);

CREATE TABLE Staff(
    inGameName VARCHAR(255) NOT NULL PRIMARY KEY,
    role VARCHAR(255),
    gameTitle VARCHAR(255),
    FOREIGN KEY (inGameName) REFERENCES OrgMembers(inGameName) ON DELETE CASCADE,
    FOREIGN KEY (gameTitle) REFERENCES Games(Title)
    ON DELETE CASCADE
);

CREATE TABLE Games(
    title VARCHAR(255) NOT NULL PRIMARY KEY,
    coach VARCHAR(255) NOT NULL,
    FOREIGN KEY (coach) REFERENCES OrgMembers(name)
    ON DELETE CASCADE
);

CREATE TABLE Teams(
    teamID VARCHAR(3) NOT NULL PRIMARY KEY,
    numPlayers INT,
    teamName VARCHAR(255) NOT NULL,
    game VARCHAR(255),
    FOREIGN KEY (game) REFERENCES Games(title) ON DELETE CASCADE
);

CREATE TABLE Leagues(
    leagueID VARCHAR(255) NOT NULL  PRIMARY KEY,
    leagueName VARCHAR(255) NOT NULL,
    startDate DATE,
    endDate DATE,
    teamID VARCHAR(3) NOT NULL,
    game VARCHAR(255) NOT NULL,
    FOREIGN KEY (game) REFERENCES Games(title) ON DELETE CASCADE,
    FOREIGN KEY (teamID) REFERENCES Teams(teamID)
    ON DELETE CASCADE
);

CREATE TABLE Matches(
    matchID VARCHAR(255) NOT NULL PRIMARY KEY,
    league VARCHAR(255) NOT NULL,
    awayTeam VARCHAR(255) NOT NULL,
    FOREIGN KEY (league) REFERENCES Leagues(leagueID) 
);

CREATE TABLE Stats(
    statID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    statName VARCHAR(255),
    statValue VARCHAR(255),
    playerID VARCHAR(255),
    teamID VARCHAR(3),
    matchID VARCHAR(255),
    leagueID VARCHAR(255),
    FOREIGN KEY (playerID) REFERENCES inGameName(inGameName),
    FOREIGN KEY (teamID) REFERENCES Teams(teamID),
    FOREIGN KEY (matchID) REFERENCES Matches(matchID),
    FOREIGN KEY (leagueID) REFERENCES Leagues(leagueID)
);

