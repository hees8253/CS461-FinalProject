-- phpMyAdmin SQL Dump
-- version 3.4.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 13, 2021 at 09:19 PM
-- Server version: 5.0.95
-- PHP Version: 5.3.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hees8253`
--

-- --------------------------------------------------------

--
-- Table structure for table `Games`
--

CREATE TABLE IF NOT EXISTS `Games` (
  `title` varchar(255) NOT NULL,
  `coach` varchar(255) NOT NULL,
  PRIMARY KEY  (`title`),
  KEY `coach` (`coach`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Games`
--

INSERT INTO `Games` (`title`, `coach`) VALUES
('Overwatch', 'agrandorange@gmail.com'),
('Rainbow 6: Seige', 'agrandorange@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `Leagues`
--

CREATE TABLE IF NOT EXISTS `Leagues` (
  `leagueID` varchar(255) NOT NULL,
  `leagueName` varchar(255) NOT NULL,
  `startDate` date default NULL,
  `endDate` date default NULL,
  `teamID` varchar(3) NOT NULL,
  `game` varchar(255) NOT NULL,
  PRIMARY KEY  (`leagueID`),
  KEY `game` (`game`),
  KEY `teamID` (`teamID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Leagues`
--

INSERT INTO `Leagues` (`leagueID`, `leagueName`, `startDate`, `endDate`, `teamID`, `game`) VALUES
('cr6sum21', 'CR6 Summer 2021', '2021-06-10', '2021-06-09', 'r6v', 'Rainbow 6: Seige'),
('ovvnacesum21', 'NACE Summer 2021 Overwatch League', '2021-06-09', '2021-07-31', 'ovw', 'Overwatch');

-- --------------------------------------------------------

--
-- Table structure for table `Matches`
--

CREATE TABLE IF NOT EXISTS `Matches` (
  `matchID` varchar(255) NOT NULL,
  `league` varchar(255) NOT NULL,
  `awayTeam` varchar(255) NOT NULL,
  PRIMARY KEY  (`matchID`),
  KEY `league` (`league`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Matches`
--

INSERT INTO `Matches` (`matchID`, `league`, `awayTeam`) VALUES
('Match 1', 'ovvnacesum21', 'Some Team');

-- --------------------------------------------------------

--
-- Table structure for table `OrgMembers`
--

CREATE TABLE IF NOT EXISTS `OrgMembers` (
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `inGameName` varchar(255) NOT NULL,
  `discordId` varchar(255) default NULL,
  `dbRole` varchar(255) NOT NULL,
  PRIMARY KEY  (`email`),
  UNIQUE KEY `inGameName` (`inGameName`),
  UNIQUE KEY `discordId` (`discordId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `OrgMembers`
--

INSERT INTO `OrgMembers` (`email`, `name`, `inGameName`, `discordId`, `dbRole`) VALUES
('agrandorange@gmail.com', 'Dan', 'AGrandOrange', 'AGrandOrange#1234', 'Staff'),
('hees8253@kettering.edu', 'Kyle Heestand', 'kheestand', 'kheestand#1234', 'Player'),
('reic6330@kettering.edu', 'Erik Reich', 'TrunkMankey', 'TrunkMankey#1234', 'Player');

-- --------------------------------------------------------

--
-- Table structure for table `Players`
--

CREATE TABLE IF NOT EXISTS `Players` (
  `inGameName` varchar(255) NOT NULL,
  `classStanding` varchar(2) NOT NULL,
  `gradDate` date NOT NULL,
  `teamID` varchar(255) NOT NULL,
  `teamRole` varchar(255) default NULL,
  PRIMARY KEY  (`inGameName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Players`
--

INSERT INTO `Players` (`inGameName`, `classStanding`, `gradDate`, `teamID`, `teamRole`) VALUES
('kheestand', 'SR', '2021-06-19', 'owv', 'Support'),
('TrunkMankey', 'SR', '2022-06-19', 'r6a', 'Fragger');

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE IF NOT EXISTS `Staff` (
  `inGameName` varchar(255) NOT NULL,
  `role` varchar(255) default NULL,
  `gameTitle` varchar(255) default NULL,
  PRIMARY KEY  (`inGameName`),
  KEY `gameTitle` (`gameTitle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`inGameName`, `role`, `gameTitle`) VALUES
('AGrandOrange', 'Coach', 'Rainbow 6: Seige');

-- --------------------------------------------------------

--
-- Table structure for table `Stats`
--

CREATE TABLE IF NOT EXISTS `Stats` (
  `statID` int(11) NOT NULL auto_increment,
  `statName` varchar(255) default NULL,
  `statValue` varchar(255) default NULL,
  `playerID` varchar(255) default NULL,
  `teamID` varchar(3) default NULL,
  `matchID` varchar(255) default NULL,
  `leagueID` varchar(255) default NULL,
  PRIMARY KEY  (`statID`),
  KEY `playerID` (`playerID`),
  KEY `teamID` (`teamID`),
  KEY `matchID` (`matchID`),
  KEY `leagueID` (`leagueID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Stats`
--

INSERT INTO `Stats` (`statID`, `statName`, `statValue`, `playerID`, `teamID`, `matchID`, `leagueID`) VALUES
(1, 'K/D', '0.8', 'kheestand', 'ovw', 'Match 1', 'ovvnacesum21');

-- --------------------------------------------------------

--
-- Table structure for table `Teams`
--

CREATE TABLE IF NOT EXISTS `Teams` (
  `teamID` varchar(3) NOT NULL,
  `numPlayers` int(11) default NULL,
  `teamName` varchar(255) NOT NULL,
  `game` varchar(255) default NULL,
  PRIMARY KEY  (`teamID`),
  KEY `game` (`game`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Teams`
--

INSERT INTO `Teams` (`teamID`, `numPlayers`, `teamName`, `game`) VALUES
('ovw', 7, 'Overwatch Varsity', 'Overwatch'),
('r6a', 6, 'R6 Academy', 'Rainbow 6: Seige'),
('r6v', 8, 'R6 Varsity', 'Rainbow 6: Seige');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Games`
--
ALTER TABLE `Games`
  ADD CONSTRAINT `Games_ibfk_1` FOREIGN KEY (`coach`) REFERENCES `OrgMembers` (`email`) ON DELETE CASCADE;

--
-- Constraints for table `Leagues`
--
ALTER TABLE `Leagues`
  ADD CONSTRAINT `Leagues_ibfk_1` FOREIGN KEY (`game`) REFERENCES `Games` (`title`) ON DELETE CASCADE,
  ADD CONSTRAINT `Leagues_ibfk_2` FOREIGN KEY (`teamID`) REFERENCES `Teams` (`teamID`) ON DELETE CASCADE;

--
-- Constraints for table `Matches`
--
ALTER TABLE `Matches`
  ADD CONSTRAINT `Matches_ibfk_1` FOREIGN KEY (`league`) REFERENCES `Leagues` (`leagueID`);

--
-- Constraints for table `Players`
--
ALTER TABLE `Players`
  ADD CONSTRAINT `Players_ibfk_1` FOREIGN KEY (`inGameName`) REFERENCES `OrgMembers` (`inGameName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Staff`
--
ALTER TABLE `Staff`
  ADD CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`inGameName`) REFERENCES `OrgMembers` (`inGameName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Staff_ibfk_2` FOREIGN KEY (`gameTitle`) REFERENCES `Games` (`title`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Stats`
--
ALTER TABLE `Stats`
  ADD CONSTRAINT `Stats_ibfk_1` FOREIGN KEY (`playerID`) REFERENCES `OrgMembers` (`inGameName`),
  ADD CONSTRAINT `Stats_ibfk_2` FOREIGN KEY (`teamID`) REFERENCES `Teams` (`teamID`),
  ADD CONSTRAINT `Stats_ibfk_3` FOREIGN KEY (`matchID`) REFERENCES `Matches` (`matchID`),
  ADD CONSTRAINT `Stats_ibfk_4` FOREIGN KEY (`leagueID`) REFERENCES `Leagues` (`leagueID`);

--
-- Constraints for table `Teams`
--
ALTER TABLE `Teams`
  ADD CONSTRAINT `Teams_ibfk_1` FOREIGN KEY (`game`) REFERENCES `Games` (`title`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
