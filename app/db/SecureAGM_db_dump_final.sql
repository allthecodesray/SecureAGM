-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: AGM_RECORDS
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.17.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AGM`
--

DROP TABLE IF EXISTS `AGM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AGM` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agm_title` varchar(50) NOT NULL,
  `location` varchar(80) NOT NULL,
  `start_date` datetime NOT NULL,
  `status` enum('draft','completed','ready to schedule','scheduled') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AGM`
--

LOCK TABLES `AGM` WRITE;
/*!40000 ALTER TABLE `AGM` DISABLE KEYS */;
INSERT INTO `AGM` VALUES (1,'Q4 2017 Investors Briefing','National Convention Centre','2017-12-05 00:00:00','scheduled'),(2,'Q1 2019 International Consortium','The Central Hotel','2019-02-14 00:00:00','scheduled'),(3,'EGM 2017 for Employees','Convention Centre','2017-12-29 00:00:00','scheduled'),(4,'AGM for Corporate Investors','The Grand Hotel, Main St.','2018-05-07 00:00:00','scheduled'),(5,'33rd AGM 2nd Quarter','The old Ballroom, O’Connell St.','2019-09-29 00:00:00','scheduled'),(6,'International Consortium Proceeding','The Halls, Stephens Green','2015-08-14 00:00:00','scheduled'),(7,'Extraorindary Meeting of Investors 2015','The Exam Hall, Earllfort Terrace','2014-10-01 00:00:00','scheduled'),(8,'Group PLC and Subsidiaries AGM','The Oreilly Hall, DCU','2010-07-10 00:00:00','scheduled');
/*!40000 ALTER TABLE `AGM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BALLOT`
--

DROP TABLE IF EXISTS `BALLOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BALLOT` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agm_id` int(11) NOT NULL,
  `ballot_name` varchar(255) NOT NULL,
  `proposal` varchar(255) NOT NULL,
  `agenda_sequence` int(11) NOT NULL,
  `isClosed` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_id` (`agm_id`),
  CONSTRAINT `BALLOT_ibfk_1` FOREIGN KEY (`agm_id`) REFERENCES `AGM` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BALLOT`
--

LOCK TABLES `BALLOT` WRITE;
/*!40000 ALTER TABLE `BALLOT` DISABLE KEYS */;
INSERT INTO `BALLOT` VALUES (1,1,'Company Accounts 2017','Do you accept the figures and conclusion..',1,'0'),(2,3,'Company Accounts','To receive the Company’s accounts, the strategic report and reports of the Directors and the auditor for the year ended 31 March 2017',1,''),(3,3,'Director Election','To re-elect Gerard Kleisterlee as a Director',2,''),(4,3,'Director Election','To re-elect Dame Clara Furse as a Director',3,''),(5,3,'Dividends','To declare a final dividend of 10.03 eurocents per ordinary share for the year ended 31 March 2017',4,''),(6,3,'Auditor Reappointment','To reappoint PricewaterhouseCoopers LLP as the Company’s auditor until the end of the next general meeting at which accounts are laid before the Company',5,''),(7,3,'Share BuyBacks','To authorise the Company to purchase its own shares',6,''),(8,4,'Director Renumeration','To Approve Director Renumeration Policy',1,''),(9,4,'General Meeting Policy','To authorise the Directors to call general meetings (other than annual general meetings) on a minimum of 14 clear days’ notice',2,''),(10,4,'Dividends','To declare a final dividend of 10.03 eurocents per ordinary share for the year ended 31 March 2017',3,''),(11,5,'Divestiture','To approve divestiture of 10% holding in AEG',1,''),(12,5,'Share Issue','To approve the further issuing of share at 12p per share',2,''),(13,5,'Chariman Re-election','To relect the Chairman Stanley Bartholemew',3,''),(14,5,'Director Renumeration','To Approve Director Renumeration Policy',4,''),(15,6,'Dividends','To declare a final dividend of 7.62 pence per ordinary share for the \nyear ended 31 March 2015.',1,''),(16,6,'EGM Authority','To maintain the existing authority to convene an EGC by 14 days’ notice\n.',2,''),(17,6,'Director Election','To relect the Director Sean Bolay',3,''),(18,7,'Stock Issue','To authorise the Directors to issue stock',1,''),(19,7,'Auditor Reappointment','To reappoint Ernst and Youn LLP as the Company’s auditor until the end of the next general meeting at which accounts are laid before the Company',2,''),(20,7,'Dividends','To declare final dividend of 20 euro cents per ordinary share',3,''),(21,7,'Company Accounts','To receive the Company Accounts, for the year ended 31 March 2015',4,''),(22,8,'Board Re-elections','To re-elect the members of the board',1,''),(23,8,'Funds approval','Approve the release of funds',2,'');
/*!40000 ALTER TABLE `BALLOT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHOICE`
--

DROP TABLE IF EXISTS `CHOICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CHOICE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(255) NOT NULL,
  `ballot_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ballot_id` (`ballot_id`),
  CONSTRAINT `fk_ballot_id` FOREIGN KEY (`ballot_id`) REFERENCES `BALLOT` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHOICE`
--

LOCK TABLES `CHOICE` WRITE;
/*!40000 ALTER TABLE `CHOICE` DISABLE KEYS */;
INSERT INTO `CHOICE` VALUES (1,'for',1),(2,'against',1),(3,'abstain',1),(4,'for',2),(5,'against',2),(6,'abstain',2),(7,'for',3),(8,'against',3),(9,'abstain',3),(10,'for',4),(11,'against',4),(12,'abstain',4),(13,'for',5),(14,'against',5),(15,'abstain',5),(16,'for',6),(17,'against',6),(18,'abstain',6),(19,'for',7),(20,'against',7),(21,'abstain',7),(22,'for',8),(23,'against',8),(24,'abstain',8),(25,'for',9),(26,'against',9),(27,'abstain',9),(28,'for',10),(29,'against',10),(30,'abstain',10),(31,'for',11),(32,'against',11),(33,'abstain',11),(34,'for',12),(35,'against',12),(36,'abstain',12),(37,'for',13),(38,'against',13),(39,'abstain',13),(40,'for',14),(41,'against',14),(42,'abstain',14),(43,'for',15),(44,'against',15),(45,'abstain',15),(46,'for',16),(47,'against',16),(48,'abstain',16),(49,'for',17),(50,'against',17),(51,'abstain',17),(52,'for',18),(53,'against',18),(54,'abstain',18),(55,'for',19),(56,'against',19),(57,'abstain',19),(58,'for',20),(59,'against',20),(60,'abstain',20),(61,'for',21),(62,'against',21),(63,'abstain',21),(64,'for',22),(65,'against',22),(66,'abstain',22),(67,'for',23),(68,'against',23),(69,'abstain',23);
/*!40000 ALTER TABLE `CHOICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DECISION`
--

DROP TABLE IF EXISTS `DECISION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DECISION` (
  `vote_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL,
  `selected` tinyint(1) NOT NULL,
  PRIMARY KEY (`vote_id`,`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DECISION`
--

LOCK TABLES `DECISION` WRITE;
/*!40000 ALTER TABLE `DECISION` DISABLE KEYS */;
INSERT INTO `DECISION` VALUES (1,1,0),(1,2,0),(1,3,1),(2,1,0),(2,2,1),(2,3,0),(3,1,1),(3,2,0),(3,3,0),(4,1,0),(4,2,0),(4,3,1),(5,1,0),(5,2,0),(5,3,1),(6,1,0),(6,2,0),(6,3,1),(7,1,0),(7,2,1),(7,3,0),(8,1,1),(8,2,0),(8,3,0),(9,1,0),(9,2,1),(9,3,0),(10,1,0),(10,2,1),(10,3,0),(11,1,0),(11,2,1),(11,3,0),(12,1,1),(12,2,0),(12,3,0),(13,1,0),(13,2,0),(13,3,1),(14,1,0),(14,2,1),(14,3,0),(15,1,1),(15,2,0),(15,3,0),(16,1,0),(16,2,1),(16,3,0),(17,1,0),(17,2,1),(17,3,0),(18,1,0),(18,2,0),(18,3,0),(18,8,1),(19,1,0),(19,2,0),(19,3,0),(19,42,1),(20,1,0),(20,2,0),(20,3,0),(20,42,1),(21,1,0),(21,2,0),(21,3,0),(21,42,1),(22,1,0),(22,2,0),(22,3,0),(22,42,1),(23,1,0),(23,2,0),(23,3,0),(23,42,1),(24,1,0),(24,2,0),(24,3,0),(24,42,1),(25,1,0),(25,2,0),(25,3,0),(25,42,1),(26,1,0),(26,2,0),(26,3,0),(26,42,1),(27,1,0),(27,2,0),(27,3,0),(27,42,1),(28,1,0),(28,2,0),(28,3,0),(28,42,1),(29,1,0),(29,2,0),(29,3,0),(29,42,1),(30,1,0),(30,2,0),(30,3,0),(30,42,1),(31,1,0),(31,2,0),(31,3,0),(31,42,1),(32,1,0),(32,2,0),(32,3,0),(32,42,1),(33,1,0),(33,2,0),(33,3,0),(33,42,1),(34,1,0),(34,2,0),(34,3,0),(34,42,1),(35,1,0),(35,2,0),(35,3,0),(35,42,1),(36,1,0),(36,2,0),(36,3,0),(36,42,1),(37,1,0),(37,2,0),(37,3,0),(37,42,1),(38,1,0),(38,2,0),(38,3,0),(38,42,1),(39,1,0),(39,2,0),(39,3,0),(39,42,1),(40,1,0),(40,2,0),(40,3,0),(40,42,1),(41,1,0),(41,2,0),(41,3,0),(41,42,1),(42,1,0),(42,2,0),(42,3,0),(42,42,1),(43,1,0),(43,2,0),(43,3,0),(43,42,1),(44,1,0),(44,2,0),(44,3,0),(44,42,1),(45,1,0),(45,2,0),(45,3,0),(45,42,1),(46,1,0),(46,2,0),(46,3,0),(46,42,1),(47,1,0),(47,2,0),(47,3,0),(47,42,1),(48,1,0),(48,2,0),(48,3,0),(48,42,1),(49,1,0),(49,2,0),(49,3,0),(49,42,1),(50,1,0),(50,2,0),(50,3,0),(50,42,1),(51,1,0),(51,2,0),(51,3,0),(51,42,1),(52,1,0),(52,2,0),(52,3,0),(52,42,1),(53,1,0),(53,2,0),(53,3,0),(53,42,1),(54,1,0),(54,2,0),(54,3,0),(54,42,1),(55,1,0),(55,2,0),(55,3,0),(55,42,1),(56,1,0),(56,2,0),(56,3,0),(56,42,1),(57,1,0),(57,2,0),(57,3,0),(57,42,1),(58,1,0),(58,2,0),(58,3,0),(58,42,1),(59,1,0),(59,2,0),(59,3,0),(59,42,1),(60,1,0),(60,2,0),(60,3,0),(60,42,1),(61,1,0),(61,2,0),(61,3,0),(61,42,1),(62,1,0),(62,2,0),(62,3,0),(62,42,1),(63,1,0),(63,2,0),(63,3,0),(63,42,1),(64,1,0),(64,2,0),(64,3,0),(64,42,1),(65,1,0),(65,2,0),(65,3,0),(65,42,1),(66,1,0),(66,2,0),(66,3,0),(66,42,1),(67,1,0),(67,2,0),(67,3,0),(67,42,1),(68,1,0),(68,2,0),(68,3,0),(68,42,1),(69,1,0),(69,2,0),(69,3,0),(69,42,1),(70,1,0),(70,2,0),(70,3,0),(70,42,1),(71,1,0),(71,2,0),(71,3,0),(71,42,1),(72,1,0),(72,2,0),(72,3,0),(72,42,1),(73,1,0),(73,2,0),(73,3,0),(73,42,1),(74,1,0),(74,2,0),(74,3,0),(74,42,1),(75,1,0),(75,2,0),(75,3,0),(75,42,1),(76,1,0),(76,2,0),(76,3,0),(76,42,1),(77,1,0),(77,2,0),(77,3,0),(77,42,1),(78,1,0),(78,2,0),(78,3,0),(78,42,1),(79,1,0),(79,2,0),(79,3,0),(79,42,1),(80,1,0),(80,2,0),(80,3,0),(80,42,1),(81,1,0),(81,2,0),(81,3,0),(81,42,1),(82,1,0),(82,2,0),(82,3,0),(82,42,1),(83,1,0),(83,2,0),(83,3,0),(83,42,1),(84,1,0),(84,2,0),(84,3,0),(84,42,1),(85,1,0),(85,2,0),(85,3,0),(85,42,1),(86,1,0),(86,2,0),(86,3,0),(86,42,1),(87,1,0),(87,2,0),(87,3,0),(87,42,1),(88,1,0),(88,2,0),(88,3,0),(88,42,1),(89,1,0),(89,2,0),(89,3,0),(89,42,1),(90,1,0),(90,2,0),(90,3,0),(90,42,1),(91,1,0),(91,2,0),(91,3,0),(91,42,1),(92,1,0),(92,2,0),(92,3,0),(92,42,1),(93,1,0),(93,2,0),(93,3,0),(93,42,1),(94,1,0),(94,2,0),(94,3,0),(94,42,1),(95,1,0),(95,2,0),(95,3,0),(95,42,1),(96,1,0),(96,2,0),(96,3,0),(96,42,1),(97,1,0),(97,2,0),(97,3,0),(97,42,1),(98,1,0),(98,2,0),(98,3,0),(98,42,1),(99,1,0),(99,2,0),(99,3,0),(99,42,1),(100,1,0),(100,2,0),(100,3,0),(100,42,1),(101,42,1),(102,42,1),(103,42,1),(104,42,1),(105,42,1),(106,42,1),(107,42,1),(108,42,1),(109,42,1),(110,42,1),(111,42,1),(112,42,1),(113,42,1),(114,42,1),(115,42,1),(116,42,1),(117,42,1),(118,42,1),(119,42,1),(120,42,1),(121,42,1),(122,42,1),(123,42,1),(124,42,1),(125,42,1),(126,42,1),(127,42,1),(128,42,1),(129,42,1),(130,42,1),(131,42,1),(132,42,1),(133,42,1),(134,42,1),(135,42,1),(136,42,1),(137,42,1),(138,42,1),(139,42,1),(140,42,1),(141,42,1),(142,42,1),(143,42,1),(144,42,1),(145,42,1),(146,42,1),(147,42,1),(148,42,1),(149,42,1),(150,42,1),(151,42,1),(152,42,1),(153,42,1),(154,42,1),(155,42,1),(156,42,1),(157,42,1),(158,42,1),(159,42,1),(160,42,1),(161,42,1),(162,42,1),(163,42,1),(164,42,1),(165,42,1),(166,42,1),(167,42,1),(168,42,1),(169,42,1),(170,42,1),(171,42,1),(172,42,1),(173,42,1),(174,42,1),(175,42,1),(176,42,1),(177,42,1),(178,42,1),(179,42,1),(180,42,1),(181,42,1),(182,42,1),(183,42,1),(184,42,1),(185,42,1),(186,42,1),(187,42,1),(188,42,1),(189,42,1),(190,42,1),(191,42,1),(192,42,1),(193,42,1),(194,42,1),(195,42,1),(196,42,1),(197,42,1),(198,42,1),(199,42,1),(200,42,1),(201,42,1),(202,42,1),(203,42,1),(204,42,1),(205,42,1),(206,42,1),(207,42,1),(208,42,1),(209,42,1),(210,42,1),(211,42,1),(212,42,1),(213,42,1),(214,42,1),(215,42,1),(216,42,1),(217,42,1),(218,42,1),(219,42,1),(220,42,1),(221,42,1),(222,42,1),(223,42,1),(224,42,1),(225,42,1),(226,42,1),(227,42,1),(228,42,1),(229,42,1),(230,42,1),(231,42,1),(232,42,1),(233,42,1),(234,42,1),(235,42,1),(236,42,1),(237,42,1),(238,42,1),(239,42,1),(240,42,1),(241,42,1),(242,42,1),(243,42,1),(244,42,1),(245,42,1),(246,42,1),(247,42,1),(248,42,1),(249,42,1),(250,42,1),(251,42,1),(252,42,1),(253,42,1),(254,42,1),(255,42,1),(256,42,1),(257,42,1),(258,42,1),(259,42,1),(260,42,1),(261,42,1),(262,42,1),(263,42,1),(264,42,1),(265,42,1),(266,42,1),(267,42,1),(268,42,1),(269,42,1),(270,42,1),(271,42,1),(272,42,1),(273,42,1),(274,42,1),(275,42,1),(276,42,1),(277,42,1),(278,42,1),(279,42,1),(280,42,1),(281,42,1),(282,42,1),(283,42,1),(284,42,1),(285,42,1),(286,42,1),(287,42,1),(288,42,1),(289,42,1),(290,42,1),(291,42,1),(292,42,1),(293,42,1),(294,42,1),(295,42,1),(296,42,1),(297,42,1),(298,42,1),(299,42,1),(300,42,1),(301,41,1),(302,42,1),(303,41,1),(304,60,1),(305,58,1),(306,2,1),(307,2,1),(308,3,1),(309,1,1),(310,1,1),(311,4,1),(312,4,1),(313,64,1),(314,68,1);
/*!40000 ALTER TABLE `DECISION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TALLY`
--

DROP TABLE IF EXISTS `TALLY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TALLY` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TALLY`
--

LOCK TABLES `TALLY` WRITE;
/*!40000 ALTER TABLE `TALLY` DISABLE KEYS */;
/*!40000 ALTER TABLE `TALLY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VOTE`
--

DROP TABLE IF EXISTS `VOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VOTE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voter_id` int(11) NOT NULL,
  `ballot_id` int(11) NOT NULL,
  `time_cast` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_bid` (`ballot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VOTE`
--

LOCK TABLES `VOTE` WRITE;
/*!40000 ALTER TABLE `VOTE` DISABLE KEYS */;
INSERT INTO `VOTE` VALUES (1,1,1,'2017-11-25 16:18:17'),(2,2,1,'2017-11-25 17:17:42'),(3,2,1,'2017-11-25 17:41:11'),(4,2,1,'2017-11-25 17:55:30'),(5,2,1,'2017-11-25 17:56:50'),(6,2,1,'2017-11-25 18:02:03'),(7,2,1,'2017-11-30 10:38:53'),(8,2,1,'2017-12-01 22:00:23'),(9,2,1,'2017-12-01 22:03:42'),(10,2,1,'2017-12-02 01:21:05'),(11,1,1,'2017-12-02 01:40:51'),(12,1,1,'2017-12-05 20:06:34'),(13,1,1,'2017-12-07 14:22:37'),(14,1,1,'2017-12-07 14:22:48'),(15,1,1,'2017-12-07 14:22:54'),(16,1,1,'2017-12-07 18:47:25'),(17,1,1,'2017-12-07 18:52:04'),(18,1,3,'2017-12-08 00:45:46'),(19,1,14,'2017-12-08 22:32:56'),(20,1,14,'2017-12-08 22:33:53'),(21,1,14,'2017-12-08 22:33:53'),(22,1,14,'2017-12-08 22:33:53'),(23,1,14,'2017-12-08 22:33:53'),(24,1,14,'2017-12-08 22:33:53'),(25,1,14,'2017-12-08 22:33:53'),(26,1,14,'2017-12-08 22:33:53'),(27,1,14,'2017-12-08 22:33:53'),(28,1,14,'2017-12-08 22:33:53'),(29,1,14,'2017-12-08 22:33:53'),(30,1,14,'2017-12-08 22:33:53'),(31,1,14,'2017-12-08 22:33:53'),(32,1,14,'2017-12-08 22:33:53'),(33,1,14,'2017-12-08 22:33:53'),(34,1,14,'2017-12-08 22:33:53'),(35,1,14,'2017-12-08 22:33:53'),(36,1,14,'2017-12-08 22:33:53'),(37,1,14,'2017-12-08 22:33:53'),(38,1,14,'2017-12-08 22:33:53'),(39,1,14,'2017-12-08 22:33:53'),(40,1,14,'2017-12-08 22:33:53'),(41,1,14,'2017-12-08 22:33:53'),(42,1,14,'2017-12-08 22:33:53'),(43,1,14,'2017-12-08 22:33:53'),(44,1,14,'2017-12-08 22:33:53'),(45,1,14,'2017-12-08 22:33:54'),(46,1,14,'2017-12-08 22:33:54'),(47,1,14,'2017-12-08 22:33:54'),(48,1,14,'2017-12-08 22:33:54'),(49,1,14,'2017-12-08 22:33:54'),(50,1,14,'2017-12-08 22:33:54'),(51,1,14,'2017-12-08 22:33:54'),(52,1,14,'2017-12-08 22:33:54'),(53,1,14,'2017-12-08 22:33:54'),(54,1,14,'2017-12-08 22:33:54'),(55,1,14,'2017-12-08 22:33:54'),(56,1,14,'2017-12-08 22:33:54'),(57,1,14,'2017-12-08 22:33:54'),(58,1,14,'2017-12-08 22:33:54'),(59,1,14,'2017-12-08 22:33:54'),(60,1,14,'2017-12-08 22:33:54'),(61,1,14,'2017-12-08 22:33:54'),(62,1,14,'2017-12-08 22:33:54'),(63,1,14,'2017-12-08 22:33:54'),(64,1,14,'2017-12-08 22:33:54'),(65,1,14,'2017-12-08 22:33:54'),(66,1,14,'2017-12-08 22:33:54'),(67,1,14,'2017-12-08 22:33:54'),(68,1,14,'2017-12-08 22:33:54'),(69,1,14,'2017-12-08 22:33:54'),(70,1,14,'2017-12-08 22:33:56'),(71,1,14,'2017-12-08 22:33:56'),(72,1,14,'2017-12-08 22:33:56'),(73,1,14,'2017-12-08 22:33:56'),(74,1,14,'2017-12-08 22:33:56'),(75,1,14,'2017-12-08 22:33:56'),(76,1,14,'2017-12-08 22:33:56'),(77,1,14,'2017-12-08 22:33:56'),(78,1,14,'2017-12-08 22:33:56'),(79,1,14,'2017-12-08 22:33:56'),(80,1,14,'2017-12-08 22:33:56'),(81,1,14,'2017-12-08 22:33:56'),(82,1,14,'2017-12-08 22:33:56'),(83,1,14,'2017-12-08 22:33:56'),(84,1,14,'2017-12-08 22:33:56'),(85,1,14,'2017-12-08 22:33:56'),(86,1,14,'2017-12-08 22:33:56'),(87,1,14,'2017-12-08 22:33:56'),(88,1,14,'2017-12-08 22:33:56'),(89,1,14,'2017-12-08 22:33:56'),(90,1,14,'2017-12-08 22:33:58'),(91,1,14,'2017-12-08 22:33:58'),(92,1,14,'2017-12-08 22:33:58'),(93,1,14,'2017-12-08 22:33:58'),(94,1,14,'2017-12-08 22:33:58'),(95,1,14,'2017-12-08 22:33:58'),(96,1,14,'2017-12-08 22:33:58'),(97,1,14,'2017-12-08 22:33:58'),(98,1,14,'2017-12-08 22:33:59'),(99,1,14,'2017-12-08 22:33:59'),(100,1,14,'2017-12-08 22:33:59'),(101,1,14,'2017-12-08 22:33:59'),(102,1,14,'2017-12-08 22:33:59'),(103,1,14,'2017-12-08 22:33:59'),(104,1,14,'2017-12-08 22:34:01'),(105,1,14,'2017-12-08 22:34:01'),(106,1,14,'2017-12-08 22:34:01'),(107,1,14,'2017-12-08 22:34:01'),(108,1,14,'2017-12-08 22:34:01'),(109,1,14,'2017-12-08 22:34:01'),(110,1,14,'2017-12-08 22:34:01'),(111,1,14,'2017-12-08 22:34:01'),(112,1,14,'2017-12-08 22:34:01'),(113,1,14,'2017-12-08 22:34:01'),(114,1,14,'2017-12-08 22:34:01'),(115,1,14,'2017-12-08 22:34:01'),(116,1,14,'2017-12-08 22:34:01'),(117,1,14,'2017-12-08 22:34:01'),(118,1,14,'2017-12-08 22:34:01'),(119,1,14,'2017-12-08 22:34:01'),(120,1,14,'2017-12-08 22:34:01'),(121,1,14,'2017-12-08 22:34:01'),(122,1,14,'2017-12-08 22:34:01'),(123,1,14,'2017-12-08 22:34:01'),(124,1,14,'2017-12-08 22:34:01'),(125,1,14,'2017-12-08 22:34:01'),(126,1,14,'2017-12-08 22:34:01'),(127,1,14,'2017-12-08 22:34:01'),(128,1,14,'2017-12-08 22:34:02'),(129,1,14,'2017-12-08 22:34:02'),(130,1,14,'2017-12-08 22:34:02'),(131,1,14,'2017-12-08 22:34:02'),(132,1,14,'2017-12-08 22:34:02'),(133,1,14,'2017-12-08 22:34:02'),(134,1,14,'2017-12-08 22:34:02'),(135,1,14,'2017-12-08 22:34:02'),(136,1,14,'2017-12-08 22:34:02'),(137,1,14,'2017-12-08 22:34:02'),(138,1,14,'2017-12-08 22:34:02'),(139,1,14,'2017-12-08 22:34:02'),(140,1,14,'2017-12-08 22:34:02'),(141,1,14,'2017-12-08 22:34:02'),(142,1,14,'2017-12-08 22:34:02'),(143,1,14,'2017-12-08 22:34:02'),(144,1,14,'2017-12-08 22:34:02'),(145,1,14,'2017-12-08 22:34:02'),(146,1,14,'2017-12-08 22:34:02'),(147,1,14,'2017-12-08 22:34:02'),(148,1,14,'2017-12-08 22:34:02'),(149,1,14,'2017-12-08 22:34:02'),(150,1,14,'2017-12-08 22:34:02'),(151,1,14,'2017-12-08 22:34:02'),(152,1,14,'2017-12-08 22:34:02'),(153,1,14,'2017-12-08 22:34:02'),(154,1,14,'2017-12-08 22:34:02'),(155,1,14,'2017-12-08 22:34:02'),(156,1,14,'2017-12-08 22:34:02'),(157,1,14,'2017-12-08 22:34:02'),(158,1,14,'2017-12-08 22:34:02'),(159,1,14,'2017-12-08 22:34:02'),(160,1,14,'2017-12-08 22:34:02'),(161,1,14,'2017-12-08 22:34:02'),(162,1,14,'2017-12-08 22:34:03'),(163,1,14,'2017-12-08 22:34:03'),(164,1,14,'2017-12-08 22:34:03'),(165,1,14,'2017-12-08 22:34:03'),(166,1,14,'2017-12-08 22:34:03'),(167,1,14,'2017-12-08 22:34:03'),(168,1,14,'2017-12-08 22:34:03'),(169,1,14,'2017-12-08 22:34:03'),(170,1,14,'2017-12-08 22:34:03'),(171,1,14,'2017-12-08 22:34:03'),(172,1,14,'2017-12-08 22:34:03'),(173,1,14,'2017-12-08 22:34:03'),(174,1,14,'2017-12-08 22:34:03'),(175,1,14,'2017-12-08 22:34:03'),(176,1,14,'2017-12-08 22:34:03'),(177,1,14,'2017-12-08 22:34:03'),(178,1,14,'2017-12-08 22:34:06'),(179,1,14,'2017-12-08 22:34:06'),(180,1,14,'2017-12-08 22:34:06'),(181,1,14,'2017-12-08 22:34:06'),(182,1,14,'2017-12-08 22:34:06'),(183,1,14,'2017-12-08 22:34:06'),(184,1,14,'2017-12-08 22:34:06'),(185,1,14,'2017-12-08 22:34:06'),(186,1,14,'2017-12-08 22:34:06'),(187,1,14,'2017-12-08 22:34:06'),(188,1,14,'2017-12-08 22:34:06'),(189,1,14,'2017-12-08 22:34:06'),(190,1,14,'2017-12-08 22:34:06'),(191,1,14,'2017-12-08 22:34:06'),(192,1,14,'2017-12-08 22:34:06'),(193,1,14,'2017-12-08 22:34:06'),(194,1,14,'2017-12-08 22:34:06'),(195,1,14,'2017-12-08 22:34:06'),(196,1,14,'2017-12-08 22:34:06'),(197,1,14,'2017-12-08 22:34:06'),(198,1,14,'2017-12-08 22:34:06'),(199,1,14,'2017-12-08 22:34:06'),(200,1,14,'2017-12-08 22:34:06'),(201,1,14,'2017-12-08 22:34:06'),(202,1,14,'2017-12-08 22:34:06'),(203,1,14,'2017-12-08 22:34:06'),(204,1,14,'2017-12-08 22:34:06'),(205,1,14,'2017-12-08 22:34:06'),(206,1,14,'2017-12-08 22:34:06'),(207,1,14,'2017-12-08 22:34:06'),(208,1,14,'2017-12-08 22:34:06'),(209,1,14,'2017-12-08 22:34:06'),(210,1,14,'2017-12-08 22:34:07'),(211,1,14,'2017-12-08 22:34:07'),(212,1,14,'2017-12-08 22:34:07'),(213,1,14,'2017-12-08 22:34:07'),(214,1,14,'2017-12-08 22:34:07'),(215,1,14,'2017-12-08 22:34:07'),(216,1,14,'2017-12-08 22:34:07'),(217,1,14,'2017-12-08 22:34:07'),(218,1,14,'2017-12-08 22:34:07'),(219,1,14,'2017-12-08 22:34:07'),(220,1,14,'2017-12-08 22:34:07'),(221,1,14,'2017-12-08 22:34:07'),(222,1,14,'2017-12-08 22:34:07'),(223,1,14,'2017-12-08 22:34:07'),(224,1,14,'2017-12-08 22:34:07'),(225,1,14,'2017-12-08 22:34:07'),(226,1,14,'2017-12-08 22:34:07'),(227,1,14,'2017-12-08 22:34:07'),(228,1,14,'2017-12-08 22:34:07'),(229,1,14,'2017-12-08 22:34:07'),(230,1,14,'2017-12-08 22:34:07'),(231,1,14,'2017-12-08 22:34:07'),(232,1,14,'2017-12-08 22:34:07'),(233,1,14,'2017-12-08 22:34:07'),(234,1,14,'2017-12-08 22:34:07'),(235,1,14,'2017-12-08 22:34:07'),(236,1,14,'2017-12-08 22:34:07'),(237,1,14,'2017-12-08 22:34:07'),(238,1,14,'2017-12-08 22:34:07'),(239,1,14,'2017-12-08 22:34:07'),(240,1,14,'2017-12-08 22:34:07'),(241,1,14,'2017-12-08 22:34:07'),(242,1,14,'2017-12-08 22:34:10'),(243,1,14,'2017-12-08 22:34:10'),(244,1,14,'2017-12-08 22:34:10'),(245,1,14,'2017-12-08 22:34:10'),(246,1,14,'2017-12-08 22:34:10'),(247,1,14,'2017-12-08 22:34:10'),(248,1,14,'2017-12-08 22:34:10'),(249,1,14,'2017-12-08 22:34:10'),(250,1,14,'2017-12-08 22:34:10'),(251,1,14,'2017-12-08 22:34:10'),(252,1,14,'2017-12-08 22:34:10'),(253,1,14,'2017-12-08 22:34:10'),(254,1,14,'2017-12-08 22:34:10'),(255,1,14,'2017-12-08 22:34:10'),(256,1,14,'2017-12-08 22:34:10'),(257,1,14,'2017-12-08 22:34:10'),(258,1,14,'2017-12-08 22:34:10'),(259,1,14,'2017-12-08 22:34:10'),(260,1,14,'2017-12-08 22:34:11'),(261,1,14,'2017-12-08 22:34:11'),(262,1,14,'2017-12-08 22:34:13'),(263,1,14,'2017-12-08 22:34:13'),(264,1,14,'2017-12-08 22:34:13'),(265,1,14,'2017-12-08 22:34:13'),(266,1,14,'2017-12-08 22:34:13'),(267,1,14,'2017-12-08 22:34:13'),(268,1,14,'2017-12-08 22:34:14'),(269,1,14,'2017-12-08 22:34:14'),(270,1,14,'2017-12-08 22:34:14'),(271,1,14,'2017-12-08 22:34:14'),(272,1,14,'2017-12-08 22:34:14'),(273,1,14,'2017-12-08 22:34:14'),(274,1,14,'2017-12-08 22:34:14'),(275,1,14,'2017-12-08 22:34:14'),(276,1,14,'2017-12-08 22:34:14'),(277,1,14,'2017-12-08 22:34:14'),(278,1,14,'2017-12-08 22:34:14'),(279,1,14,'2017-12-08 22:34:14'),(280,1,14,'2017-12-08 22:34:14'),(281,1,14,'2017-12-08 22:34:14'),(282,1,14,'2017-12-08 22:34:15'),(283,1,14,'2017-12-08 22:34:15'),(284,1,14,'2017-12-08 22:34:15'),(285,1,14,'2017-12-08 22:34:15'),(286,1,14,'2017-12-08 22:34:15'),(287,1,14,'2017-12-08 22:34:15'),(288,1,14,'2017-12-08 22:34:15'),(289,1,14,'2017-12-08 22:34:15'),(290,1,14,'2017-12-08 22:34:15'),(291,1,14,'2017-12-08 22:34:15'),(292,1,14,'2017-12-08 22:34:15'),(293,1,14,'2017-12-08 22:34:15'),(294,1,14,'2017-12-08 22:34:15'),(295,1,14,'2017-12-08 22:34:15'),(296,1,14,'2017-12-08 22:34:15'),(297,1,14,'2017-12-08 22:34:15'),(298,1,14,'2017-12-08 22:34:17'),(299,1,14,'2017-12-08 22:34:17'),(300,1,14,'2017-12-08 22:34:18'),(301,4,14,'2017-12-08 22:45:53'),(302,4,1,'2017-12-08 22:49:58'),(303,4,23,'2017-12-08 23:02:51'),(304,4,20,'2017-12-09 21:34:25'),(305,4,19,'2017-12-09 21:34:32'),(306,8,17,'2017-12-12 21:14:59'),(307,8,17,'2017-12-12 21:15:11'),(308,8,17,'2017-12-12 21:15:18'),(309,8,16,'2017-12-12 21:15:27'),(310,8,15,'2017-12-12 21:15:35'),(311,8,2,'2017-12-12 21:19:00'),(312,8,2,'2017-12-12 21:19:10'),(313,8,22,'2017-12-12 21:27:02'),(314,8,23,'2017-12-12 22:07:58');
/*!40000 ALTER TABLE `VOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VOTER`
--

DROP TABLE IF EXISTS `VOTER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VOTER` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `org` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VOTER`
--

LOCK TABLES `VOTER` WRITE;
/*!40000 ALTER TABLE `VOTER` DISABLE KEYS */;
INSERT INTO `VOTER` VALUES (1,'Williemae Boston','bmccoll0@yopmail.com',NULL,'pbkdf2:sha256:50000$qk39zzxw$6f5bb7de2e559ced26f1b8508851977d3ecc933389f533d2acfc8d83923fb081','5492f8bcda2e49319cc6ee0b021db209'),(2,'Jerri Greenbaum','lcheverton1@yopmail.com',NULL,'pbkdf2:sha256:50000$t9bhIZkL$b223f0d9ad0cb9e6508f19c37b65750ec0a5a10d4d85dda79911e9f933cbdcd7','e74323cb612445628f10a406606fe1bc'),(3,'Adele Odea','awesker2@yopmail.com',NULL,'pbkdf2:sha256:50000$0H6bX1F8$3e17ac78f667b93724ef4ebdc0aabacccc1e8c06014c99ac3aa56ff8b4ffebe7','1f155edc3c814b0282f162483d3b0c33'),(4,'Theodora Gillooly','nbushel3@yopmail.com',NULL,'pbkdf2:sha256:50000$hf0K0inV$449f9869e88243b0e746e08f598d79a8e9d86919c9214af6266d2ba7de86d9e1','b7eadef237e2479cba3b82fdf1d69691'),(5,'Tierra Perfecto','rwarnock4@yopmail.com',NULL,'pbkdf2:sha256:50000$Umz9TSex$68b2252f84b70abc26513d62524b40096569553c92c9f57802ef056f4d79c5eb','c5f3b3c737134130aa9d0c46f059acdd'),(6,'Chester Royston','gjoris5@yopmail.com',NULL,'pbkdf2:sha256:50000$tVHlpTgV$3b4f0a350d67cdf37223da2b03b61dfcaaeed5cfa12a80771dcdde44f35c6ba6','85652d9204ff47a29e4e7bd0f64f54a0'),(7,'Nanci Weakley','gfasset6@yopmail.com',NULL,'pbkdf2:sha256:50000$KvveAyLo$97dbac8a29b6add32962bd79168e7af29f53f49dfc510a2ca51e0d5028aa3da8','8d42f7e795c84a269cc04a0e8784b086'),(8,'Linda Kelm','escase7@yopmail.com',NULL,'pbkdf2:sha256:50000$YKQt6nJE$2f8ca8cf71a33ef648aa884b5baeaa90e740b7675b727e145e818b860d8a0a52','9e2ee001b3a4443aa634b76c6af140e2'),(9,'Fern Morman','lcherm8@yopmail.com',NULL,'pbkdf2:sha256:50000$1lx2upnr$5ed6dde3ac5c6e6b9dabd8a457eeb452ecd85b6ea31387f730d1f73a7f6e0d82','fc14ba0349db44238b45cf38c496330e'),(10,'Darron Renwick','bliffe9@yopmail.com',NULL,'pbkdf2:sha256:50000$zpPOdOE4$4381e8f40272921ca78cb7cbb75ab57d5a0e615196a4e2d3884262007c207427','59b94040abc44e8db4c1debba7c5b04d'),(11,'Thomas Triana','klescopa@yopmail.com',NULL,'pbkdf2:sha256:50000$oY1dnsJ7$2218e8b0f2103e2ea382f924f2bbcfed2713a57d59610a28dcafd30ea41c8cef','5fcebe427a57490dad9d16306804ca38'),(12,'Gay Hesser','fsnewinb@yopmail.com',NULL,'pbkdf2:sha256:50000$YyCbTMEV$3b3d48ff697632e4538cf40cd61429f92403a894f847e3bf4e6e6e48c9a7dc57','a3eeaa8a023b428ab06747f33f7c103e'),(13,'Vergie Thomason','rtatteshallc@yopmail.com',NULL,'pbkdf2:sha256:50000$PlYalgjy$1a51be132c460627431baef189358c2aef832a6b7c3b3587f74e5af6bfb727b6','df965814971a4a9daff171d9ae960c2f'),(14,'Maida Torkelson','kbeaned@yopmail.com',NULL,'pbkdf2:sha256:50000$uTKLDq24$a7479ad54d45192b2652721662a7ff8b4001358b1653118ac80859b7f0e811c0','7f85d7e0c8c945c1929158ec49e8c1c6'),(15,'Mica Gehlert','ispareye@yopmail.com',NULL,'pbkdf2:sha256:50000$EAWM2i9W$e86119c3391dfee1b366c39efab2aad3f0ad3f1aebbb140e3038fca4d63f0841','63e2adc499a941578fe70abebe8ba9c7'),(16,'Laraine Jeansonne','rschukraftf@yopmail.com',NULL,'pbkdf2:sha256:50000$g4ucdnZ6$5e6dc8df477062dbc31bc0de140c57cc5528d5bfc5a5d5c94203275afe7898f6','6a35a040ea69429eb41433abfb4535e5'),(17,'Ara Notaro','wbailessg@yopmail.com',NULL,'pbkdf2:sha256:50000$qfashs2n$9169ae1078df79b322aae687ebf86c8244e324fa75eaa63b39c34b6722062332','ee88c34b3b1f4f94b10836823207c094'),(18,'Kathi Hanselman','ktingleh@yopmail.com',NULL,'pbkdf2:sha256:50000$Xh8fqJz8$aa1542c73096b9164a4b8957b899ce7fbd5638e83478df2ca554306c9f26f419','0210292aef4b4e5bad1587ac6004f3e6'),(19,'Su Tiernan','ccowderyi@yopmail.com',NULL,'pbkdf2:sha256:50000$awvSE5CO$d96f5dee6f24315ba21f3fd063971466646fe211e29ed625cfdaa286332727e0','4b061ce7957244d9ae1d4c6ad0b46259'),(20,'Lizbeth Schuman','ewiersmaj@yopmail.com',NULL,'pbkdf2:sha256:50000$XO7om99N$8565b387734d5b47b6e6fa6610feb11eb77a3026209f0e3ca80297ff2e974d20','09282569b19043faa08b6235bf988bcd'),(21,'Roland Ewing','ecurgenvenk@yopmail.com',NULL,'pbkdf2:sha256:50000$xqfxcca4$575ae6f9574bfeea911138dd50a31660b691f2c11d6307bb0388401871ed76f2','cf2fd181731c48d5843488ebbbd0e285'),(22,'Hosea Matias','gtottlel@yopmail.com',NULL,'pbkdf2:sha256:50000$CMjiH10Q$de50118b17237ec3aac96c9f7b2c47446bba0fd50e3ee5840eb34e15c565a94b','215a150a706d44ef9a92a7321e8eb5f2'),(23,'Larisa Racicot','cricketm@yopmail.com',NULL,'pbkdf2:sha256:50000$K5PDpRgc$f0420d6b38e4ae370375ab9f563688e35bc8b505aabbb7488ef98da64737c8a5','b4f2ca6f7a5446af84a78e9e6cdc34b7'),(24,'Shavonda Dobles','smcguiren@yopmail.com',NULL,'pbkdf2:sha256:50000$bl2ENvFU$08095c42f52817002ca6f83926275e7568d586af0d68f9fd4c3d9d6317f56263','2ae5edb75a284c2ebb5765754c5bf7a9'),(25,'Jonie Troxell','bbarclayo@yopmail.com',NULL,'pbkdf2:sha256:50000$SZuaU4gL$1e52b6a186583d9b858b35e06ec74f0d2bb35ffbf1956713ead47bd8ac74eddf','eca0e5b694524310a6129287c5a52de7'),(26,'Hue Pagel','lwadesworthp@yopmail.com',NULL,'pbkdf2:sha256:50000$RyH7SXcn$f48b5a516019c6bdecfe4c7f842ed6474daa17a249ab6eaf7c8a269c799b40c1','6f42e73e7005463dae5bcbb49bc7cee6'),(27,'Britteny Mcferron','sschulerq@yopmail.com',NULL,'pbkdf2:sha256:50000$fS7SVkBy$92227adf41f860f4dc613bf240843e222cb88a27e8460ef2c18632d256668db8','b510d575fa9a410284c5634df912fad3'),(28,'Lakeisha Mejias','amelhuishr@yopmail.com',NULL,'pbkdf2:sha256:50000$rYKrwD4o$5b382114db9223adab4be04554a15ca67454dcf4399f2c04656a54341604b6ae','bacbc0d3cd1942cb9f0b1468335b541a'),(29,'Juan Escarcega','lwadesons@yopmail.com',NULL,'pbkdf2:sha256:50000$EYIbl5jG$c5d4d6e1e32a569f68a565f57aa879c618bf5845b756aa6aeffb1a4bf821215a','299e7506f6d048a690a4a2df5e106962'),(30,'Toney Boring','cwatkisst@yopmail.com',NULL,'pbkdf2:sha256:50000$8JtowHWZ$6e4b2a017305c040c9706ba6d1638fac57df2526fe791862ad415d0866f1ab18','90f8b7c7c8ff4c4195157bfe86131569'),(31,'Gala Aday','mwestcotu@10minuteemail.com',NULL,'pbkdf2:sha256:50000$otY6mhkU$caa11e105061733f8dde8fb19ad716a52f6085d335e037a2d71f21f1913696d5','1414c1ea810d4c1c9182776c09d7bd36'),(32,'Carey Gormley','jgrayerv@10minuteemail.com',NULL,'pbkdf2:sha256:50000$WTgfxV4n$054a65ea08c4ca7e5bf3aa65daf7bc13a7a2ffbc71b852352bde6d6bcfa29fe6','6ee52d38cdde42e5a3144c26e2188860'),(33,'Harold Yetman','nmilsomw@10minuteemail.com',NULL,'pbkdf2:sha256:50000$6L3dMFYN$9032673393488056bce63d485d7415e02086a10bbf3d867368db7c563586479b','2b9b26bd881646b484f3a16b0354b3ff'),(34,'Ricardo Groen','cpusillx@10minuteemail.com',NULL,'pbkdf2:sha256:50000$30kVUhi3$8315ec9163e4e19cf84a1bf5f8364e9bbbce37f213efc3ff995b107df22e6f93','ef8c389fbe72494680afe0a66a1b3a98'),(35,'Suzette Bonacci','bgalletyy@10minuteemail.com',NULL,'pbkdf2:sha256:50000$01fCGPrD$161da3aa7c13df999d512649cf137772cdcd70da9664a7cd9d1041cf21c82e73','0b9ce5e9543d4f15af56dee7f82ebe3f'),(36,'Shona Pitkin','gwrintmorez@10minuteemail.com',NULL,'pbkdf2:sha256:50000$3xZ9H4z9$56f46559e43b466fae2e781bd4c0540bd0218de3e5e24aac0300e0c0668b74c6','07ccbd25cfed4012bec194012b885bbf'),(37,'Gale Campuzano','mcutts10@10minuteemail.com',NULL,'pbkdf2:sha256:50000$rqZBnpEi$d04916def815202b69ef9602f530b36239b70178e9f3fda40adbcbd81591344d','01d751348c5e4f889de33b0e5510fd0b'),(38,'Ellis Tindal','rmcmorland11@10minuteemail.com',NULL,'pbkdf2:sha256:50000$70ThExEz$a9124190682a6fd6246f1107037eab752b9c6d3b730e7ae1ab92b8aab2aeed59','14f470af6c964a99bba6fd9b47d46fe9'),(39,'Karin Yohn','ljedrysik12@10minuteemail.com',NULL,'pbkdf2:sha256:50000$64HXH8tj$c4371a6dc0f4efb6b60a1233ef0049e3d857aa4dd5fbdea308a55eff44f9139a','72d5671b2a744c3a8089186065562945'),(40,'Clarita Buzzard','srosenstengel13@10minuteemail.com',NULL,'pbkdf2:sha256:50000$1w6av7K6$920a328a81bda66edebf976666b4a69ba1230e43ae3bdcb03b7c3b408616ece4','9adeacd9f9f94756b5b23f470fa9bb0b'),(41,'Isela Osuna','dcondict14@10minuteemail.com',NULL,'pbkdf2:sha256:50000$IP9MlZE1$5e4540eba9d8434bb56d977bbc1925736bd5f465e59da7911fac936132b92e1d','84e850ec00584b7eb82745bf2542dfd6'),(42,'Geri Tutor','testevez15@10minuteemail.com',NULL,'pbkdf2:sha256:50000$jb1Yebn2$930be09203405aa34c05a544d58f50354e57ba72d8d59406af57ec7393c1cf68','69a3f6c4f4174661956a0af6ace63911'),(43,'Tristan Baldridge','dbrownsill16@10minuteemail.com',NULL,'pbkdf2:sha256:50000$f1wHdIry$1e60b17a445e9c8627c6d5f2e0e09471b29f4951acb56d94366a6aa311e72f61','398a068207274b7baba4a180b12213ec'),(44,'Renata Crissman','klythgoe17@10minuteemail.com',NULL,'pbkdf2:sha256:50000$uwx50Nos$6b7cc59d341f96cf0dc056ad20ac2d4a9108c152c146e6fde05702fc84bc0b9f','a68f3ae6508b44688c7c8c6b75a29908'),(45,'Fiona Tindel','bgibard18@10minuteemail.com',NULL,'pbkdf2:sha256:50000$hcgFHpSo$09f804a73a8137c3d023b5ff1806e7094fd1897fa644c260f6f347af37e2dabc','52d2076c960046b8a4c34b9e2f99cf9e'),(46,'Kaila Bailer','abarck19@10minuteemail.com',NULL,'pbkdf2:sha256:50000$ozYaIZXn$6a54f03b753565e6dab3766d5f0d41746b5360b6abcc4e0743641014bcc6ca4c','100ede2beab64c29a2a1425a3394e23e'),(47,'Agueda Yu','atort1a@10minuteemail.com',NULL,'pbkdf2:sha256:50000$iWn8EIU6$5dd1986d762b0d8bbb1a48bdc3fff7c0054b19735f2fdd64cab1ac9eafec4a5f','60ec2592cf184a31aafb2ea407fb9170'),(48,'Floy Cambell','melleyne1b@10minuteemail.com',NULL,'pbkdf2:sha256:50000$CABKvFYy$5d958eaf8a26c4ab0ad8264c100daaeca94f0f33118fd2aa7962a69e7dbfbf34','219fbf2198204d47a8a41a36e6021d53'),(49,'Devora Corley','cstampe1c@10minuteemail.com',NULL,'pbkdf2:sha256:50000$r8FhZ515$24adc2738fd5d2f8f579a19daece4d3a30421dc47fcdd635ed8c3e58b5563b71','443b9b43b64f4f1383fea29043fb4e46'),(50,'Florencio Sasse','sjenkison1d@10minuteemail.com',NULL,'pbkdf2:sha256:50000$rOYDLNfN$d094f71bb907983f4ae09bb85d557bbde819a3ea1a1d65168bf36d4a8746b467','b9d3b80563414290b201633dd8821a09'),(51,'Bebe Stabile','rburberye1e@10minuteemail.com',NULL,'pbkdf2:sha256:50000$VGBzTTav$70af30d2b0f4b41644e50d48baa9bf71709a3c15e616afad11b6ff8896d9d627','210fc842e4004c64aa926f4fcd4940c7'),(52,'Vernice Neve','jflaws1f@10minuteemail.com',NULL,'pbkdf2:sha256:50000$1KDp6kpg$6f0cba049d833b18ff4cde4040c11bd6fc6f3d6577cbcec82d65aa940732deed','eaf5f96ea4944c8b9c74d06093da4a67'),(53,'Jamila Washington','ibruce1g@10minuteemail.com',NULL,'pbkdf2:sha256:50000$UcffszR4$e7e66e7515601fd56b66b7e1645d9ef9ed7fea1743b30981df7027a1fe0fc8c4','1d3a4db6291d47b1bb4bf841c0203a48'),(54,'Coleen Vanzant','skose1h@10minuteemail.com',NULL,'pbkdf2:sha256:50000$xzWlX5lN$948dfbd52cdcae32efed7f9f053313ef193f407fc2f79d2cb49905449a7c549c','15be0619f4de40a0bcc688d4622a5cc3'),(55,'Asia Cossette','cstreak1i@10minuteemail.com',NULL,'pbkdf2:sha256:50000$zroTgFv7$a2e85e9924671ba9cbc3a1b6b6289d09b07228d31b5160d52ffeac3ffbb68ef6','87c033b8363b452abc17030b3e657703'),(56,'Melanie Wadley','hbachshell1j@10minuteemail.com',NULL,'pbkdf2:sha256:50000$9Agoxt7F$01aa5261bf6fc3d3e0e089566a63e750eb94d689bfd9224f8df98651b1fe1b5f','70cbcefce89e42509da1f502baf4b011'),(57,'Cleotilde Freeney','skenny1k@10minuteemail.com',NULL,'pbkdf2:sha256:50000$iIDrPbQX$42f30028b9199fcaf12e690377097d7c7700621bb9be3afaacc6cc3560eb0a27','793e28618df74c988d726cbd4c5c1852'),(58,'Modesta Standifer','jrieger1l@10minuteemail.com',NULL,'pbkdf2:sha256:50000$00RYBmLK$de809866f899cdd51ddbb389d87363cd39aa6f8d3c5a64f03903dded1d284b75','439abd2537b74efc9b0fe7776d8aab3b'),(59,'Kyoko Poli','tsutcliffe1m@10minuteemail.com',NULL,'pbkdf2:sha256:50000$TkiJGkR2$f8476c1606bcff48ad8959f7d9bb5debeaa9563aad46d5244b693771d6117087','a137b9d8baee4e79b61e64a340248974'),(60,'Beth Clawson','mthaine1n@10minuteemail.com',NULL,'pbkdf2:sha256:50000$HSkpoqEQ$118f9268b73acdcf70fe62c3cc5db5f0012eb3c7825c433d4683b5e468222a3f','ac3b5c5e379a421da73395042169f274'),(61,'Kerstin Swann','gondrich1o@10minuteemail.com',NULL,'pbkdf2:sha256:50000$q71hAfVB$022b3d4196bb09a2a93986c70689805636945d6b1ade26db7d3a2f1cd3ca173d','1ee1205bc7894e6d9e514112a47fc13a'),(62,'Esta Bever','aduffin1p@10minuteemail.com',NULL,'pbkdf2:sha256:50000$Ay0pLIlS$b2e1711a1cd38a170eace9098550f7f2823f00f0efbe12e9de822630339cbee6','947c6d2262ed42a783e186ea2640b0de'),(63,'Nicki Lundholm','wjouning1q@10minuteemail.com',NULL,'pbkdf2:sha256:50000$gbNZVLP6$84ae29a711f7611b4d67a77a4e3ed10fde4b075fe05f2ef5fd4da664293ec368','638f11651ca548489dd9500fea41d620'),(64,'Sherly Sharrow','hcutforth1r@10minuteemail.com',NULL,'pbkdf2:sha256:50000$bzkrc4Km$dfcfe73993cc68e0268b03f6a27c3980a8c91a3a13e8ac72afdb7f6d29482601','69bfc63f6de64adeb513cfc72a1654b1'),(65,'Tiffanie Cady','lmelia1s@10minuteemail.com',NULL,'pbkdf2:sha256:50000$uepBtxXq$894ac38a6016c30cbcde41bad3d4104f6fa2f76faa405b96d286c0e1877f1f83','1d950cd7f7d6414ba8d7772e9b586f41'),(66,'Jared Huitt','kmariault1t@10minuteemail.com',NULL,'pbkdf2:sha256:50000$CpWma383$ff65ec63766e6806a226d73d01920bf1279a1bcf6247693c6246ff029dec2768','d49b6bbdc6a54d4db32f975791628653'),(67,'Zenobia Plott','lbywater1u@10minuteemail.com',NULL,'pbkdf2:sha256:50000$ijg9gJwV$a90bfd3f93aa29fcb2eeaa67413ffaa39715b982ec45e243e89c24f29f1553ab','ded5a77774794a7ea2fb2ff986565232'),(68,'Magdalene Roa','ccheesman1v@10minuteemail.com',NULL,'pbkdf2:sha256:50000$OKV71jEJ$fbcbb924011164c6593aa56d2d0e09ef7d844f18e458ee2575d8d64bd5867848','5dd74943640342af9fb50c658d5b750b'),(69,'Broderick Lira','gdeacock1w@discardmail.com',NULL,'pbkdf2:sha256:50000$TECD86Ix$4d044c7b0cfe71c59073c063ca2cb9488234be70c2a845db5061e0fc50b19e9e','dcfdd02a50d1449bba29c180f658a3ed'),(70,'Xenia Sigmund','pjoris1x@discardmail.com',NULL,'pbkdf2:sha256:50000$RZXJkyJc$e6f725e22b12cc2e0a2b7c79c407c98cca4778d9905187472fc1884935201470','ebac3d31fa544996aad4ae097ae5e5d0'),(71,'Toby Shreffler','dbeamand1y@discardmail.com',NULL,'pbkdf2:sha256:50000$fUwAb6aF$e776a5b96ec033ab4d2901cbe331a6a25a004c614713ab45bd0b99380ece6a4d','c889aaaf426745108cda18c3d71ae315'),(72,'Jacinto Tomko','lskipper1z@discardmail.com',NULL,'pbkdf2:sha256:50000$uoiJvjvv$d367fc18fbb15234d5a8d4f6145550321422682293c6483fc8f1b98c22811a0a','d1ff3a063a7c41a481f7b518def54873'),(73,'Wendell Lambson','ainsoll20@discardmail.com',NULL,'pbkdf2:sha256:50000$Cowiz3l4$fb0195c104bb9ddb4f118a8636d11ec230469dee46628a41c30fba2e9695886d','bbb9238c58864b548c0091eaa8550afb'),(74,'Renna Salgado','jkayes21@discardmail.com',NULL,'pbkdf2:sha256:50000$yAa5GIab$4e91c6ed7118c29dd0a0d0264e2c59713d875402b60d2cf47961812448f6af54','8207ec24ef384e5989fd9c58a9dee0ef'),(75,'Maris Bernier','cpentecust22@discardmail.com',NULL,'pbkdf2:sha256:50000$0NdaInvH$8ab54a90852eec379a2bb5951b638bbe264ea0edf7a6a46d7b74885413315482','9c4319188ba74c2d8a0945e6d0f31397'),(76,'Adrienne Rabun','jhefferan23@discardmail.com',NULL,'pbkdf2:sha256:50000$W0co0aDD$d47be85d1839f8aed33c343d26b6cddd8bb4afbf3cec538e5e3dac13938b058d','9ee95ac6fd0f4386b96bad27167f2c4e'),(77,'Sergio Plaisted','jantonowicz24@discardmail.com',NULL,'pbkdf2:sha256:50000$PPLCHXhj$e28c5f6f02607251c1db895cdce8fd5826d969ec4983c38e2bbd48acebf17d02','d1e5fa737e3a4461845625051930db78'),(78,'Shawana Circle','dboast25@discardmail.com',NULL,'pbkdf2:sha256:50000$ImHUM82y$e9c2cc8e368e19cdf9c8d9ea4430d59c0476e16fbd20a39a2d9c6a478575f6af','9b69ed96879c4d80b5d1afc52730ac6e'),(79,'Adolph Penick','talenshev26@discardmail.com',NULL,'pbkdf2:sha256:50000$herae3WV$c8cedd014ebde815b9b8e3a6b9416e1f99c0acf732deadbf0e8a906c8f631a34','0596a3c319a5488f8e682ac87261f77e'),(80,'Mercedes Flippin','dbloomfield27@discardmail.com',NULL,'pbkdf2:sha256:50000$OetMFGac$35534259590e06cc5c24f63ff01c0943e6f496e6550e44805015168a4273f4fc','47695dc5e76b4fa3be297fea53040552'),(81,'Laree Vogl','cmarns28@discardmail.com',NULL,'pbkdf2:sha256:50000$01pR4bIq$c3c791c7b2d85d9342fb198189d1a251e28fc23fa3d994f80949652f7c21dcab','d8d5dcf752c744cbb733904ed3a529aa'),(82,'Tierra Saltz','psyred29@discardmail.com',NULL,'pbkdf2:sha256:50000$0izG76Zq$db651f21690b9064b6bc44216f0b34ba856d0f2b60a1b380db5caa8cb0250636','f8df49c949f741ce992dd809d3369ef4'),(83,'Qiana Mackson','cradclyffe2a@discardmail.com',NULL,'pbkdf2:sha256:50000$vSFnEHkn$0d30a62f0a373dd7ab5d7748bca659b9877673bfe8dbeb7dfcb282b6dfb4e9f1','2b497124a9964ea6839707e1b04c413a'),(84,'Ann Appling','nmaloney2b@discardmail.com',NULL,'pbkdf2:sha256:50000$ZeVhPdyD$5e18e5285b5930ffacb06accfd71ca17ecd65260d4f83c7b3cd8062d6ad07d1d','2be68984f9134eeb8058bf26df97e6f3'),(85,'Leighann Hegarty','mcouche2c@discardmail.com',NULL,'pbkdf2:sha256:50000$HeRnsXM4$a4e531170d47844e63ffcea0b0cd33779f1657b70a12a9ada50c0105ffff268e','f53ffc554f8d4f01b47f74a41119fe78'),(86,'Kandis Marlett','apetrishchev2d@discardmail.com',NULL,'pbkdf2:sha256:50000$bn91g8bH$dff84f7cbd1e150f1268dca49e7f253e40c15d9eea28263109dd497fb35e561b','e5ab818b277f4668bf583eb9f5209034'),(87,'Georgette Newborn','ahubbold2e@discardmail.com',NULL,'pbkdf2:sha256:50000$zIQ8iXrL$c632363899bc857b136485225a0145b171c302d6f7a2f8ddd54e2aa0073f44e7','032b5179338e450ab891ee852b18f6fb'),(88,'Jin Eland','rhowardgater2f@discardmail.com',NULL,'pbkdf2:sha256:50000$NzisYbDK$19d317cbf7e2a4fb6ba6ee36958847ad84104340c16d483306b62f12554e7f49','829c39efaadc47ec803895c37acdd4e9'),(89,'Mertie Maines','biacofo2g@discardmail.com',NULL,'pbkdf2:sha256:50000$GdV3HsEP$3bea5fca2a14c832b67d9372eb24ca37d8b964d25cd2091475e82a07036ef8d7','3379f3bc0c8a43ad86ccacdbb8e87725'),(90,'Elias Tavares','ccredland2h@discardmail.com',NULL,'pbkdf2:sha256:50000$cyO6MRtp$90a0f1570949a64a269974b1a568de9435c0642f29a82e0ba3acbc326e62ab2b','c8ad153c910d4a30891b74d1d5c7faa9'),(91,'Darin Ishee','cmclean2i@discardmail.com',NULL,'pbkdf2:sha256:50000$wg7I4Ifh$fbc0452366f7ae67a5840f3bb86fa324f06d731558259589d9881d0801ab9a8b','b661c1df205d4c33841ca80806b49f67'),(92,'Modesto Erazo','pvescovo2j@discardmail.com',NULL,'pbkdf2:sha256:50000$JK8GRDUC$8f741867db531a6502acc6f6e1c32b15eb2ee9ed3a77d67a00f9c04e203831fc','ac96991233e24e088cf50be4f42c3a8b'),(93,'Jenifer Youngberg','kwilloughby2k@discardmail.com',NULL,'pbkdf2:sha256:50000$eXw8HiPg$ebbc0acdb96a8e42a41342c211372fddc85ab5622b502d4650596b91dfb11dc2','b915442a57fd4a6db51e6d17a353d62c'),(94,'Tilda Perrodin','bmaccambridge2l@discardmail.com',NULL,'pbkdf2:sha256:50000$Blfcjrbn$bef4bed55612719a7f8f7be6e268fec4693807d31b6bb8ac14d58e65fbb2e514','55aa4bcce6fd4b4f9ed69e0ac14fd2ec'),(95,'See Swart','minnot2m@discardmail.com',NULL,'pbkdf2:sha256:50000$C94njCmf$ccc8abf65a4d5ab71ac1ec06df9e04e1fc4461a10c1e9077ef6297476fe4ade7','33e50da5964f4887a843e509ba8a2972'),(96,'Erika Tankersley','bnowakowski2n@discardmail.com',NULL,'pbkdf2:sha256:50000$ICqFkfQU$9687ef4c0a39089a0accfba82df5fabdff73d2ab475061bd63b939ddce7dad2a','41d94eccd8894dbf8aa84f29ed347834'),(97,'Williemae Boyes','igoudge2o@discardmail.com',NULL,'pbkdf2:sha256:50000$WE3T4bzi$eda447f909c609e770df49813cb87adb3d48b3998c539db90e07c439dd5686fd','538c6f96fe9947a09161de2ec75aacd1'),(98,'Irving Acoff','bantoniak2p@yopmail.com',NULL,'pbkdf2:sha256:50000$mItCdgqE$a934e64e6a58baf024c2a4b3c6b6cd6577f42c4c85a0904463922f9735114f6d','36ec63f190d04e17a92ec9c829c1e14f'),(99,'Clementina Grill','kmobley2q@yopmail.com',NULL,'pbkdf2:sha256:50000$CQ5NJOn5$1b710e1a0c7b58663a6d23c0cc12e162281c91bf0c871a6cf65198c58ac32822','b9f4583fd873414aa6c676c64bf0310f'),(100,'Many Bartee','mkiehne2r@yopmail.com',NULL,'pbkdf2:sha256:50000$jtmAv8u8$04d0ca6ebe352948d902ad78a360fb0e39a90002a3106e8fed734887418162ec','1a55a833214f47549f6a9f7de49169e1');
/*!40000 ALTER TABLE `VOTER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'AGM_RECORDS'
--
/*!50003 DROP PROCEDURE IF EXISTS `checkForVote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkForVote`(IN bid int(11),IN vid int(11))
BEGIN
SELECT id FROM VOTE WHERE ballot_id = bid AND voter_id = vid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FindByEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FindByEmail`(IN e VARCHAR(255))
BEGIN
SELECT email FROM VOTER WHERE email='e';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetBallots` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBallots`(IN aid INT(11))
BEGIN
SELECT id,agenda_sequence,ballot_name,proposal,isClosed FROM BALLOT WHERE agm_id = aid ORDER BY agenda_sequence ASC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetByVoterID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetByVoterID`(IN v INT(11))
BEGIN
SELECT id,email FROM VOTER WHERE ID=v;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RecordVote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RecordVote`(IN bid int(11),IN vid int(11),IN cid int(11))
BEGIN
INSERT INTO VOTE(voter_id,ballot_id) VALUES(vid,bid);
INSERT INTO DECISION VALUES((SELECT MAX(id) FROM VOTE),cid,1);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelectBallotAndChoices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SelectBallotAndChoices`(IN bid int(11))
BEGIN
SELECT b.ballot_name, b.proposal, c.id, c.choice_text

FROM BALLOT b
	INNER JOIN
CHOICE c ON b.id = c.ballot_id

WHERE b.id = bid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ShowVoterAGMs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowVoterAGMs`()
BEGIN
SELECT * FROM AGM WHERE status='scheduled';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ValidateLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidateLogin`(IN e VARCHAR(255))
BEGIN
SELECT id,email,password,salt FROM VOTER WHERE email = e;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-12 23:10:54
