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
  `athAthleteEtiProponisis` decimal(11,1) DEFAULT NULL,
  `athAthleteAgonisma` varchar(250) DEFAULT NULL,
  `athFootID` int(11) DEFAULT NULL,
  `athAthleteAddress` varchar(250) DEFAULT NULL,
  `athAthleteTelephone1` varchar(20) DEFAULT NULL,
  `athAthleteTelephone2` varchar(20) DEFAULT NULL,
  `athAthleteEmail` varchar(150) DEFAULT NULL,
  `athAthleteTraumatismoi` text,
  PRIMARY KEY (`athAthleteID`),
  KEY `ak_athAthlete_athGender` (`athGenderID`),
  KEY `ak_athAthlete_athFoot` (`athFootID`),
  CONSTRAINT `fk_athAthlete_athFoot` FOREIGN KEY (`athFootID`) REFERENCES `athfoot` (`athFootID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_athAthlete_athGender` FOREIGN KEY (`athGenderID`) REFERENCES `athgender` (`athGenderID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `athaxiologisicategory` */

DROP TABLE IF EXISTS `athaxiologisicategory`;

CREATE TABLE `athaxiologisicategory` (
  `athAxiologisiCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `athAxiologisiCategoryOnoma` varchar(250) NOT NULL,
  PRIMARY KEY (`athAxiologisiCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=greek;

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
  `athAxiologisiCategoryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`athSportID`),
  KEY `ak_athSport_athAxiologisiCategory` (`athAxiologisiCategoryID`),
  CONSTRAINT `fk_athSport_athAxiologisiCategory` FOREIGN KEY (`athAxiologisiCategoryID`) REFERENCES `athaxiologisicategory` (`athAxiologisiCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `athtrainingphase` */

DROP TABLE IF EXISTS `athtrainingphase`;

CREATE TABLE `athtrainingphase` (
  `athTrainingPhaseID` int(11) NOT NULL,
  `athTrainingPhaseName` varchar(50) DEFAULT NULL,
  `athTrainingPhaseNameShort` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`athTrainingPhaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `metergospirometro` */

DROP TABLE IF EXISTS `metergospirometro`;

CREATE TABLE `metergospirometro` (
  `metErgospirometroID` int(11) NOT NULL AUTO_INCREMENT,
  `metMetrisiID` int(11) DEFAULT NULL,
  `metErgospirometroVO2max` decimal(12,2) DEFAULT NULL,
  `metErgospirometroMaxHR` int(11) DEFAULT NULL,
  `metErgospirometroVVO2MAX` decimal(11,1) DEFAULT NULL,
  `metErgospirometroVO2` decimal(12,2) DEFAULT NULL,
  `metErgospirometroHR` int(11) DEFAULT NULL,
  `metErgospirometroVLT` decimal(11,1) DEFAULT NULL,
  `metErgospirometroVTCalc` decimal(11,1) DEFAULT NULL,
  `metErgospirometroDromikiOikonomia` decimal(13,3) DEFAULT NULL,
  `metErgospirometroApokatastasi1min` int(11) DEFAULT NULL,
  `metErgospirometroApokatastasi3min` int(11) DEFAULT NULL,
  PRIMARY KEY (`metErgospirometroID`),
  KEY `ak_metErgospirometro_metMetrisi` (`metMetrisiID`),
  CONSTRAINT `fk_metErgospirometro_metMetrisi` FOREIGN KEY (`metMetrisiID`) REFERENCES `metmetrisi` (`metMetrisiID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `metergospirometrobike` */

DROP TABLE IF EXISTS `metergospirometrobike`;

CREATE TABLE `metergospirometrobike` (
  `metErgospirometroBikeID` int(11) NOT NULL AUTO_INCREMENT,
  `metMetrisiID` int(11) DEFAULT NULL,
  `metErgospirometroBikeVO2max` decimal(12,2) DEFAULT NULL,
  `metErgospirometroBikeMaxHR` int(11) DEFAULT NULL,
  `metErgospirometroBikeVVO2MAX` decimal(11,1) DEFAULT NULL,
  `metErgospirometroBikeVO2` decimal(12,2) DEFAULT NULL,
  `metErgospirometroBikeHR` int(11) DEFAULT NULL,
  `metErgospirometroBikeVLT` decimal(11,1) DEFAULT NULL,
  `metErgospirometroBikeVTCalc` decimal(11,1) DEFAULT NULL,
  `metErgospirometroBikeDromikiOikonomia` decimal(13,3) DEFAULT NULL,
  `metErgospirometroBikeApokatastasi1min` int(11) DEFAULT NULL,
  `metErgospirometroBikeApokatastasi3min` int(11) DEFAULT NULL,
  PRIMARY KEY (`metErgospirometroBikeID`),
  KEY `ak_metErgospirometroBike_metMetrisi` (`metMetrisiID`),
  CONSTRAINT `fk_metErgospirometroBike_metMetrisi` FOREIGN KEY (`metMetrisiID`) REFERENCES `metmetrisi` (`metMetrisiID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `metfitlight` */

DROP TABLE IF EXISTS `metfitlight`;

CREATE TABLE `metfitlight` (
  `metFitLightID` int(11) NOT NULL AUTO_INCREMENT,
  `metMetrisiID` int(11) DEFAULT NULL,
  `metFitLightXronosAntidrasisDexia` decimal(13,3) DEFAULT NULL,
  `metFitLightXronosAntidrasisAristera` decimal(13,3) DEFAULT NULL,
  PRIMARY KEY (`metFitLightID`),
  KEY `ak_metFitLight_metMetrisi` (`metMetrisiID`),
  CONSTRAINT `fk_metFitLight_metMetrisi` FOREIGN KEY (`metMetrisiID`) REFERENCES `metmetrisi` (`metMetrisiID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `metgoniometro` */

DROP TABLE IF EXISTS `metgoniometro`;

CREATE TABLE `metgoniometro` (
  `metGoniometroID` int(11) NOT NULL AUTO_INCREMENT,
  `metMetrisiID` int(11) DEFAULT NULL,
  `metGoniometroRaxiaiaKampsiDeksi` int(11) DEFAULT NULL,
  `metGoniometroPelmatiaiaKampsiDeksi` int(11) DEFAULT NULL,
  `metGoniometroEurosKinisisDeksi` int(11) DEFAULT NULL,
  `metGoniometroRaxiaiaKampsiAristero` int(11) DEFAULT NULL,
  `metGoniometroPelmatiaiaKampsiAristero` int(11) DEFAULT NULL,
  `metGoniometroEurosKinisisAristero` int(11) DEFAULT NULL,
  `metGoniometroRaxiaiaPosostoDiaforasCalc` decimal(11,1) DEFAULT NULL,
  `metGoniometroPelmatiaiaPosostoDiaforasCalc` decimal(11,1) DEFAULT NULL,
  `metGoniometroEurosKinisisPosostoDiaforasCalc` decimal(11,1) DEFAULT NULL,
  PRIMARY KEY (`metGoniometroID`),
  KEY `ak_metGoniometro_metMetrisi` (`metMetrisiID`),
  CONSTRAINT `fk_metGoniometro_metMetrisi` FOREIGN KEY (`metMetrisiID`) REFERENCES `metmetrisi` (`metMetrisiID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `methandgrip` */

DROP TABLE IF EXISTS `methandgrip`;

CREATE TABLE `methandgrip` (
  `metHandGripID` int(11) NOT NULL AUTO_INCREMENT,
  `metMetrisiID` int(11) DEFAULT NULL,
  `metHandGripMaxDeksi` decimal(12,2) DEFAULT NULL,
  `metHandGripMaxAristero` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`metHandGripID`),
  KEY `ak_metHandGrip_metMetrisi` (`metMetrisiID`),
  CONSTRAINT `fk_metHandGrip_metMetrisi` FOREIGN KEY (`metMetrisiID`) REFERENCES `metmetrisi` (`metMetrisiID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `metisokinetic` */

DROP TABLE IF EXISTS `metisokinetic`;

CREATE TABLE `metisokinetic` (
  `metIsokineticID` int(11) NOT NULL AUTO_INCREMENT,
  `metMetrisiID` int(11) DEFAULT NULL,
  `metIsokineticKampsi60Deksi` decimal(11,1) DEFAULT NULL,
  `metIsokineticKampsi180Deksi` decimal(11,1) DEFAULT NULL,
  `metIsokineticKampsi60Aristero` decimal(11,1) DEFAULT NULL,
  `metIsokineticKampsi180Aristero` decimal(11,1) DEFAULT NULL,
  `metIsokineticElleimmaDinamisKampsi60Calc` decimal(12,2) DEFAULT NULL,
  `metIsokineticElleimmaDinamisKampsi180Calc` decimal(12,2) DEFAULT NULL,
  `metIsokineticKampsi60DeksiCalc` decimal(13,3) DEFAULT NULL,
  `metIsokineticKampsi180DeksiCalc` decimal(13,3) DEFAULT NULL,
  `metIsokineticKampsi60AristeroCalc` decimal(13,3) DEFAULT NULL,
  `metIsokineticKampsi180AristeroCalc` decimal(13,3) DEFAULT NULL,
  `metIsokineticEktasi60Deksi` decimal(11,1) DEFAULT NULL,
  `metIsokineticEktasi180Deksi` decimal(11,1) DEFAULT NULL,
  `metIsokineticEktasi60Aristero` decimal(11,1) DEFAULT NULL,
  `metIsokineticEktasi180Aristero` decimal(11,1) DEFAULT NULL,
  `metIsokineticElleimmaDinamisEktasi60Calc` decimal(12,2) DEFAULT NULL,
  `metIsokineticElleimmaDinamisEktasi180Calc` decimal(12,2) DEFAULT NULL,
  `metIsokineticEktasi60DeksiCalc` decimal(13,3) DEFAULT NULL,
  `metIsokineticEktasi180DeksiCalc` decimal(13,3) DEFAULT NULL,
  `metIsokineticEktasi60AristeroCalc` decimal(13,3) DEFAULT NULL,
  `metIsokineticEktasi180AristeroCalc` decimal(13,3) DEFAULT NULL,
  `metIsokineticKampsiProsEktasi60DeksiCalc` decimal(11,1) DEFAULT NULL,
  `metIsokineticKampsiProsEktasi180DeksiCalc` decimal(11,1) DEFAULT NULL,
  `metIsokineticKampsiProsEktasi60AristeroCalc` decimal(11,1) DEFAULT NULL,
  `metIsokineticKampsiProsEktasi180AristeroCalc` decimal(11,1) DEFAULT NULL,
  PRIMARY KEY (`metIsokineticID`),
  KEY `ak_metIsokinetic_metMetrisi` (`metMetrisiID`),
  CONSTRAINT `fk_metIsokinetic_metMetrisi` FOREIGN KEY (`metMetrisiID`) REFERENCES `metmetrisi` (`metMetrisiID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `metisometric` */

DROP TABLE IF EXISTS `metisometric`;

CREATE TABLE `metisometric` (
  `metIsometricID` int(11) NOT NULL AUTO_INCREMENT,
  `metMetrisiID` int(11) DEFAULT NULL,
  `metIsometricFmax` int(11) DEFAULT NULL,
  `metIsometricFmaxDeksi` int(11) DEFAULT NULL,
  `metIsometricFmaxAristero` int(11) DEFAULT NULL,
  `metIsometricFmaxSxetikiCalc` decimal(12,2) DEFAULT NULL,
  `metIsometricFmaxSxetikiDeksiCalc` decimal(12,2) DEFAULT NULL,
  `metIsometricFmaxSxetikiAristeroCalc` decimal(12,2) DEFAULT NULL,
  `metIsometricF50SinoloCalc` int(11) DEFAULT NULL,
  `metIsometricF50SxetikiCalc` decimal(12,2) DEFAULT NULL,
  `metIsometricF50Deksi` int(11) DEFAULT NULL,
  `metIsometricF50Aristero` int(11) DEFAULT NULL,
  `metIsometricRFDmaxSinoloCalc` decimal(12,2) DEFAULT NULL,
  `metIsometricRFDmaxSxetikiCalc` decimal(12,2) DEFAULT NULL,
  `metIsometricRFDmaxDeksi` decimal(12,2) DEFAULT NULL,
  `metIsometricRFDmaxAristero` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`metIsometricID`),
  KEY `ak_metIsometric_metMetrisi` (`metMetrisiID`),
  CONSTRAINT `fk_metIsometric_metMetrisi` FOREIGN KEY (`metMetrisiID`) REFERENCES `metmetrisi` (`metMetrisiID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `metmedicineball` */

DROP TABLE IF EXISTS `metmedicineball`;

CREATE TABLE `metmedicineball` (
  `metMedicineBallID` int(11) NOT NULL AUTO_INCREMENT,
  `metMetrisiID` int(11) DEFAULT NULL,
  `metMedicineBallRipsi` decimal(13,3) DEFAULT NULL,
  PRIMARY KEY (`metMedicineBallID`),
  KEY `ak_metMedicineBall_metMetrisi` (`metMetrisiID`),
  CONSTRAINT `fk_metMedicineBall_metMetrisi` FOREIGN KEY (`metMetrisiID`) REFERENCES `metmetrisi` (`metMetrisiID`)
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
  `metMetrisiLiposSkinfold` decimal(12,2) DEFAULT NULL,
  `metMetrisiLiposBIA` decimal(12,2) DEFAULT NULL,
  `metMetrisiNeroBIA` decimal(12,2) DEFAULT NULL,
  `metMetrisiEukampsia` decimal(11,1) DEFAULT NULL,
  `metMetrisiHRCalm` int(11) DEFAULT NULL,
  `metMetrisiElxiPlati` decimal(11,1) DEFAULT NULL,
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

/*Table structure for table `metoptojump` */

DROP TABLE IF EXISTS `metoptojump`;

CREATE TABLE `metoptojump` (
  `metOptoJumpID` int(11) NOT NULL AUTO_INCREMENT,
  `metMetrisiID` int(11) DEFAULT NULL,
  `metOptoJumpSJ` decimal(12,2) DEFAULT NULL,
  `metOptoJumpCMJ` decimal(12,2) DEFAULT NULL,
  `metOptoJumpCMJh` decimal(12,2) DEFAULT NULL,
  `metOptoJumpDeiktisTaxidinamisCalc` decimal(11,1) DEFAULT NULL,
  `metOptoJumpDeiktisSintonismouCalc` decimal(12,2) DEFAULT NULL,
  `metOptoJumpDJ40cm` decimal(11,1) DEFAULT NULL,
  `metOptoJumpDJ40ms` decimal(13,3) DEFAULT NULL,
  `metOptoJumpDJ40watt` decimal(12,2) DEFAULT NULL,
  `metOptoJumpCMJhRms` decimal(13,3) DEFAULT NULL,
  `metOptoJumpCMJhRcm` decimal(11,1) DEFAULT NULL,
  `metOptoJumpCMJhLms` decimal(13,3) DEFAULT NULL,
  `metOptoJumpCMJhLcm` decimal(11,1) DEFAULT NULL,
  `metOptoJumpAlmaApoThesiEkkinisis` decimal(12,2) DEFAULT NULL,
  `metOptoJumpRJCount` int(11) DEFAULT NULL,
  `metOptoJumpRJMesoYpsos` decimal(12,2) DEFAULT NULL,
  `metOptoJumpRJYpsosA` decimal(12,2) DEFAULT NULL,
  `metOptoJumpRJYpsosB` decimal(12,2) DEFAULT NULL,
  `metOptoJumpRJDeiktisAntoxisTaxidinamisCalc` decimal(12,2) DEFAULT NULL,
  `metOptoJumpRJDeiktisKoposisCalc` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`metOptoJumpID`),
  KEY `ak_metOptoJump_metMetrisi` (`metMetrisiID`),
  CONSTRAINT `fk_metOptoJump_metMetrisi` FOREIGN KEY (`metMetrisiID`) REFERENCES `metmetrisi` (`metMetrisiID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `metphotocells` */

DROP TABLE IF EXISTS `metphotocells`;

CREATE TABLE `metphotocells` (
  `metPhotocellsID` int(11) NOT NULL AUTO_INCREMENT,
  `metMetrisiID` int(11) DEFAULT NULL,
  `metPhotocellsDD` decimal(13,3) DEFAULT NULL,
  `metPhotocells5` decimal(13,3) DEFAULT NULL,
  `metPhotocells10` decimal(13,3) DEFAULT NULL,
  `metPhotocells20` decimal(13,3) DEFAULT NULL,
  `metPhotocells30` decimal(13,3) DEFAULT NULL,
  `metPhotocells40` decimal(13,3) DEFAULT NULL,
  `metPhotocells10Sixn` decimal(13,3) DEFAULT NULL,
  `metPhotocellsSlalom20NoBall` decimal(13,3) DEFAULT NULL,
  `metPhotocellsDeiktisEukinisiasNoBallCalc` decimal(12,2) DEFAULT NULL,
  `metPhotocellsSlalom20WithBall` decimal(13,3) DEFAULT NULL,
  `metPhotocellsDeiktisOdigimatosWithBallCalc` decimal(13,3) DEFAULT NULL,
  PRIMARY KEY (`metPhotocellsID`),
  KEY `ak_metPhotocells_metMetrisi` (`metMetrisiID`),
  CONSTRAINT `fk_metPhotocells_metMetrisi` FOREIGN KEY (`metMetrisiID`) REFERENCES `metmetrisi` (`metMetrisiID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `metplace` */

DROP TABLE IF EXISTS `metplace`;

CREATE TABLE `metplace` (
  `metPlaceID` int(11) NOT NULL,
  `metPlaceName` varchar(50) DEFAULT NULL,
  `metPlaceNameShort` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`metPlaceID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `mettestantoxis` */

DROP TABLE IF EXISTS `mettestantoxis`;

CREATE TABLE `mettestantoxis` (
  `metTestAntoxisID` int(11) NOT NULL AUTO_INCREMENT,
  `metMetrisiID` int(11) DEFAULT NULL,
  `metTestAntoxisPalindromo` int(11) DEFAULT NULL,
  `metTestAntoxisTaxitita` decimal(11,1) NOT NULL,
  `metTestAntoxisVO2maxCalc` decimal(12,2) DEFAULT NULL,
  `metTestAntoxisMaxHR` int(11) DEFAULT NULL,
  PRIMARY KEY (`metTestAntoxisID`),
  KEY `ak_metTestAntoxis_metMetrisi` (`metMetrisiID`),
  CONSTRAINT `fk_metTestAntoxis_metMetrisi` FOREIGN KEY (`metMetrisiID`) REFERENCES `metmetrisi` (`metMetrisiID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `metwingatepodia` */

DROP TABLE IF EXISTS `metwingatepodia`;

CREATE TABLE `metwingatepodia` (
  `metWingatePodiaID` int(11) NOT NULL AUTO_INCREMENT,
  `metMetrisiID` int(11) DEFAULT NULL,
  `metWingatePodiaMaxPower` decimal(12,2) DEFAULT NULL,
  `metWingatePodiaMaxPowerXronos` decimal(12,2) DEFAULT NULL,
  `metWingatePodiaDeiktisAnaptixisCalc` decimal(12,2) DEFAULT NULL,
  `metWingatePodiaAvgPower` decimal(12,2) DEFAULT NULL,
  `metWingatePodiaDeiktisKoposisCalc` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`metWingatePodiaID`),
  KEY `ak_metWingatePodia_metMetrisi` (`metMetrisiID`),
  CONSTRAINT `fk_metWingatePodia_metMetrisi` FOREIGN KEY (`metMetrisiID`) REFERENCES `metmetrisi` (`metMetrisiID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/*Table structure for table `metwingatexeria` */

DROP TABLE IF EXISTS `metwingatexeria`;

CREATE TABLE `metwingatexeria` (
  `metWingateXeriaID` int(11) NOT NULL AUTO_INCREMENT,
  `metMetrisiID` int(11) DEFAULT NULL,
  `metWingateXeriaMaxPower` decimal(12,2) DEFAULT NULL,
  `metWingateXeriaMaxPowerXronos` decimal(12,2) DEFAULT NULL,
  `metWingateXeriaDeiktisAnaptixisCalc` decimal(12,2) DEFAULT NULL,
  `metWingateXeriaAvgPower` decimal(12,2) DEFAULT NULL,
  `metWingateXeriaDeiktisKoposisCalc` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`metWingateXeriaID`),
  KEY `ak_metWingateXeria_metMetrisi` (`metMetrisiID`),
  CONSTRAINT `fk_metWingateXeria_metMetrisi` FOREIGN KEY (`metMetrisiID`) REFERENCES `metmetrisi` (`metMetrisiID`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

/* Procedure structure for procedure `SetTableSameAxiologisiSport` */

/*!50003 DROP PROCEDURE IF EXISTS  `SetTableSameAxiologisiSport` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `SetTableSameAxiologisiSport`(ID VARCHAR(50))
BEGIN
  DROP TEMPORARY TABLE IF EXISTS spTableSameAxiologisiSport;
  CREATE TEMPORARY TABLE spTableSameAxiologisiSport AS   
  SELECT CASE WHEN athSport2.athSportID IS NOT NULL 
         THEN athSport2.athSportID
         ELSE athSport.athSportID
         END AS athSportID
  FROM athSport  
  LEFT JOIN athAxiologisiCategory ON athAxiologisiCategory.athAxiologisiCategoryID = athSport.athAxiologisiCategoryID
  LEFT JOIN athSport AS athSport2 ON athSport2.athAxiologisiCategoryID = athAxiologisiCategory.athAxiologisiCategoryID
  WHERE athSport.athSportID = ID;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
