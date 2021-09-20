CREATE TABLE `player` (
  `playerID` INT,
  `name` TEXT,
  PRIMARY KEY (`playerID`)
);

CREATE TABLE `team` (
  `teamID` INT,
  `name` TEXT,
  PRIMARY KEY (`teamID`)
);

CREATE TABLE `league` (
  `leagueID` INT,
  `name` TEXT,
  `understatNotation` TEXT,
  PRIMARY KEY (`leagueID`)
);

CREATE TABLE `game` (
  `gameID` INT,
  `leagueID` INT,
  `season` INT,
  `date` DATETIME,
  `homeTeamID` INT,
  `awayTeamID` INT,
  `homeGoals` INT,
  `awayGoals` INT,
  `homeProbability` FLOAT,
  `drawProbability` FLOAT,
  `awayProbability` FLOAT,
  `homeGoalsHalfTime` INT,
  `awayGoalsHalfTime` INT,
  `B365H` FLOAT,
  `B365D` FLOAT,
  `B365A` FLOAT,
  `BWH` FLOAT,
  `BWD` FLOAT,
  `BWA` FLOAT,
  `IWH` FLOAT,
  `IWD` FLOAT,
  `IWA` FLOAT,
  `PSH` FLOAT,
  `PSD` FLOAT,
  `PSA` FLOAT,
  `WHH` FLOAT,
  `WHD` FLOAT,
  `WHA` FLOAT,
  `VCH` FLOAT,
  `VCD` FLOAT,
  `VCA` FLOAT,
  `PSCH` FLOAT,
  `PSCD` FLOAT,
  `PSCA` FLOAT,
  PRIMARY KEY (`gameID`),
  FOREIGN KEY (`homeTeamID`) REFERENCES `team`(`teamID`),
  FOREIGN KEY (`leagueID`) REFERENCES `league`(`leagueID`),
  FOREIGN KEY (`awayTeamID`) REFERENCES `team`(`teamID`)
);

CREATE TABLE `appearance` (
  `gameID` INT,
  `playerID` INT,
  `goals` INT,
  `ownGoals` INT,
  `shots` INT,
  `xGoals` FLOAT,
  `xGoalsChain` FLOAT,
  `xGoalsBuildup` FLOAT,
  `assists` INT,
  `keyPasses` INT,
  `xAssists` FLOAT,
  `position` TEXT,
  `positionOrder` INT,
  `yellowCard` INT,
  `redCards` INT,
  `time` INT,
  `substituteIn` INT,
  `substituteOut` INT,
  `leagueID` INT,
  PRIMARY KEY (`gameID`, `playerID`, `leagueID`),
  FOREIGN KEY (`playerID`) REFERENCES `player`(`playerID`),
  FOREIGN KEY (`gameID`) REFERENCES `game`(`gameID`),
  FOREIGN KEY (`leagueID`) REFERENCES `league`(`leagueID`)
);

CREATE TABLE `teamstat` (
  `gameID` INT,
  `teamID` INT,
  `season` INT,
  `date` DATETIME,
  `location` CHAR,
  `goals` INT,
  `XGoals` FLOAT,
  `shots` INT,
  `shotsOnTarget` INT,
  `deep` INT,
  `ppda` FLOAT,
  `fouls` INT,
  `corners` INT,
  `yellowCards` INT,
  `redCards` INT,
  `results` CHAR,
  PRIMARY KEY (`gameID`, `teamID`),
  FOREIGN KEY (`teamID`) REFERENCES `team`(`teamID`),
  FOREIGN KEY (`gameID`) REFERENCES `game`(`gameID`)
);

CREATE TABLE `shot` (
  `gameID` INT,
  `shooterID` INT,
  `assisterID` INT,
  `minute` INT,
  `situation` TEXT,
  `lastAction` TEXT,
  `shotType` TEXT,
  `shotResult` TEXT,
  `xGoal` FLOAT,
  `positionX` FLOAT,
  `positionY` FLOAT,
  FOREIGN KEY (`assisterID`) REFERENCES `player`(`playerID`),
  FOREIGN KEY (`gameID`) REFERENCES `game`(`gameID`),
  FOREIGN KEY (`shooterID`) REFERENCES `player`(`playerID`)
);