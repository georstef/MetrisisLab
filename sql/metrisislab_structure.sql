/*
SQLyog Community v12.2.1 (64 bit)
MySQL - 5.6.28-log : Database - metrisislab
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `athathlete` */

DROP TABLE IF EXISTS `athathlete`;

CREATE TABLE `athathlete` (
  `athAthleteID` int(11) NOT NULL AUTO_INCREMENT,
  `athAthleteName` varchar(250) DEFAULT NULL,
  `athAthleteHmGennisis` date DEFAULT NULL,
  `athGenderID` int(11) DEFAULT NULL,
  `athFootID` int(11) DEFAULT NULL,
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
