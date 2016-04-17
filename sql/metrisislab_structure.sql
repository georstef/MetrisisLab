/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.28-log : Database - metrisislab
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`metrisislab` /*!40100 DEFAULT CHARACTER SET greek */;

/*Table structure for table `_param` */

DROP TABLE IF EXISTS `_param`;

CREATE TABLE `_param` (
  `ParamID` int(11) NOT NULL AUTO_INCREMENT,
  `ParamUsername` varchar(32) NOT NULL DEFAULT 'everyone',
  `ParamName` varchar(48) NOT NULL DEFAULT '',
  `ParamVisible` tinyint(4) NOT NULL DEFAULT '1',
  `ParamGroupName` varchar(128) DEFAULT NULL,
  `ParamOrder` int(11) NOT NULL DEFAULT '0',
  `ParamDescription` varchar(128) NOT NULL DEFAULT '',
  `ParamType` varchar(16) NOT NULL DEFAULT '',
  `ParamListSource` varchar(48) DEFAULT NULL,
  `ParamKeyField` varchar(48) DEFAULT NULL,
  `ParamListField` varchar(48) DEFAULT NULL,
  `ParamValue` text,
  `ParamDisplayValue` text,
  `ParamPipelined` tinyint(4) NOT NULL DEFAULT '0',
  `_DateCreated` datetime DEFAULT NULL,
  `_DateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ParamYpokatastima` varchar(32) DEFAULT 'all',
  PRIMARY KEY (`ParamID`),
  UNIQUE KEY `ak_ParamName` (`ParamUsername`,`ParamName`,`ParamYpokatastima`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `athathlete` */

DROP TABLE IF EXISTS `athathlete`;

CREATE TABLE `athathlete` (
  `athAthleteID` int(11) NOT NULL AUTO_INCREMENT,
  `athAthleteName` varchar(250) DEFAULT NULL,
  `athAthleteHmGennisis` date DEFAULT NULL,
  `athGenderID` int(11) DEFAULT NULL,
  `athFootID` int(11) DEFAULT NULL,
  `athAthleteTelephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`athAthleteID`),
  KEY `ak_athAthlete_athGender` (`athGenderID`),
  KEY `ak_athAthlete_athFoot` (`athFootID`),
  CONSTRAINT `fk_athAthlete_athFoot` FOREIGN KEY (`athFootID`) REFERENCES `athfoot` (`athFootID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_athAthlete_athGender` FOREIGN KEY (`athGenderID`) REFERENCES `athgender` (`athGenderID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `athfoot` */

DROP TABLE IF EXISTS `athfoot`;

CREATE TABLE `athfoot` (
  `athFootID` int(11) NOT NULL,
  `athFootName` varchar(50) DEFAULT NULL,
  `athFootNameShort` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`athFootID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `athgender` */

DROP TABLE IF EXISTS `athgender`;

CREATE TABLE `athgender` (
  `athGenderID` int(11) NOT NULL,
  `athGenderName` varchar(50) DEFAULT NULL,
  `athGenderNameShort` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`athGenderID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `athsport` */

DROP TABLE IF EXISTS `athsport`;

CREATE TABLE `athsport` (
  `athSportID` varchar(50) NOT NULL,
  `athSportName` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`athSportID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `athtrainingphase` */

DROP TABLE IF EXISTS `athtrainingphase`;

CREATE TABLE `athtrainingphase` (
  `athTrainingPhaseID` int(11) NOT NULL,
  `athTrainingPhaseName` varchar(50) DEFAULT NULL,
  `athTrainingPhaseNameShort` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`athTrainingPhaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `metmetrisi` */

DROP TABLE IF EXISTS `metmetrisi`;

CREATE TABLE `metmetrisi` (
  `metMetrisiID` int(11) NOT NULL AUTO_INCREMENT,
  `metMetrisiHmerominia` date NOT NULL,
  `athAthleteID` int(11) DEFAULT NULL,
  `athSportID` varchar(50) DEFAULT NULL,
  `athTrainingPhaseID` int(11) DEFAULT NULL,
  `metPlaceID` int(11) DEFAULT NULL,
  `metMetrisiHlikiaCalc` decimal(11,1) DEFAULT NULL,
  `metMetrisiTeam` varchar(200) DEFAULT NULL,
  `metMetrisiCoach` varchar(200) DEFAULT NULL,
  `metMetrisiGeneralTrainingPerWeek` int(11) DEFAULT NULL,
  `metMetrisiWeightTrainingPerWeek` int(11) DEFAULT NULL,
  `metMetrisiJumpTrainingPerWeek` int(11) DEFAULT NULL,
  `metMetrisiMaza` decimal(11,1) DEFAULT NULL,
  `metMetrisiAnastima` decimal(11,1) DEFAULT NULL,
  `metMetrisiEktasi` decimal(11,1) DEFAULT NULL,
  `metMetrisiDiaforaEktasiAnastimaCalc` decimal(11,1) DEFAULT NULL,
  `metMetrisiAnatasi` decimal(11,1) DEFAULT NULL,
  `metMetrisiDiaforaAnatasiAnastimaCalc` decimal(11,1) DEFAULT NULL,
  `metMetrisiLipos` decimal(12,2) DEFAULT NULL,
  `metMetrisiNero` decimal(12,2) DEFAULT NULL,
  `metMetrisiEukampsia` decimal(11,1) DEFAULT NULL,
  `metMetrisiHRCalm` int(11) DEFAULT NULL,
  PRIMARY KEY (`metMetrisiID`),
  KEY `ak_metMetrisi_athAthlete` (`athAthleteID`),
  KEY `ak_metMetrisi_metMetrisiHmerominia` (`metMetrisiHmerominia`),
  KEY `ak_metMetrisi_athSport` (`athSportID`),
  KEY `ak_metMetrisi_athTrainingPhase` (`athTrainingPhaseID`),
  KEY `ak_metMetrisi_metPlace` (`metPlaceID`),
  CONSTRAINT `fk_metMetrisi_athAthlete` FOREIGN KEY (`athAthleteID`) REFERENCES `athathlete` (`athAthleteID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_metMetrisi_athSport` FOREIGN KEY (`athSportID`) REFERENCES `athsport` (`athSportID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_metMetrisi_athTrainingPhase` FOREIGN KEY (`athTrainingPhaseID`) REFERENCES `athtrainingphase` (`athTrainingPhaseID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_metMetrisi_metPlace` FOREIGN KEY (`metPlaceID`) REFERENCES `metplace` (`metPlaceID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `metplace` */

DROP TABLE IF EXISTS `metplace`;

CREATE TABLE `metplace` (
  `metPlaceID` int(11) NOT NULL,
  `metPlaceName` varchar(50) DEFAULT NULL,
  `metPlaceNameShort` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`metPlaceID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
