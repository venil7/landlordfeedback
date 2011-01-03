-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: llfb
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1

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
-- Current Database: `llfb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `llfb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `llfb`;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `text` varchar(400) NOT NULL,
  `updated_at` datetime NOT NULL,
  `commentable_id` int(11) DEFAULT NULL,
  `commentable_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `index_comments_on_commentable_id_and_commentable_type` (`commentable_id`,`commentable_type`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,'nice post, thanks','2011-01-01 22:53:26',1,'Post'),(2,1,'ttt','2011-01-01 22:56:11',1,'Post'),(3,1,'help','2011-01-01 22:57:42',1,'Post'),(4,1,'ddd','2011-01-01 23:06:22',1,'Post'),(5,1,'some text goes here','2011-01-01 23:12:38',1,'Property'),(6,1,'my comment about this','2011-01-01 23:16:28',1,'Feedback'),(7,1,'aaa','2011-01-01 23:36:11',1,'Post'),(8,1,'sss','2011-01-01 23:36:31',1,'Property'),(9,1,'ddd','2011-01-01 23:36:47',1,'Feedback');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entrytype_id` int(11) NOT NULL,
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` text CHARACTER SET latin1,
  `rating` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_id` (`feedback_id`),
  KEY `user_id` (`user_id`),
  KEY `entrytype_id` (`entrytype_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `comment` text CHARACTER SET latin1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,'Landlord',NULL),(2,'Agency',NULL),(3,'Neighbors',NULL),(4,'Neighborhood',NULL),(5,'Area',NULL),(6,'Local Council',NULL),(7,'Local shops/facilities',NULL),(8,'Garden',NULL),(9,'Bills',NULL),(10,'Other',NULL);
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `feedbackproperties`
--

DROP TABLE IF EXISTS `feedbackproperties`;
/*!50001 DROP VIEW IF EXISTS `feedbackproperties`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `feedbackproperties` (
  `id` int(11),
  `rating` decimal(11,0),
  `address` varchar(255),
  `postcode` varchar(50),
  `lat` decimal(11,7),
  `lng` decimal(11,7),
  `propertytype_id` int(11),
  `updated_at` datetime,
  `user_id` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `totalmonths` int(11) NOT NULL DEFAULT '6',
  `lastdate` date DEFAULT NULL,
  `landlord` varchar(50) NOT NULL,
  `agency` varchar(50) NOT NULL,
  `anonymous` tinyint(1) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `property_id` (`property_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,1,1,6,'2011-01-03','some fucker','aaaaaaaaaaaaa',1,'2011-01-01 21:45:27','2011-01-01 21:45:27');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `photo_content_type` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_id` (`feedback_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `entry` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Welcome to Landlord Feedback','landlordfeedback@gmail.com','Hello and welcome to Landlord Feedback. This website is for everyone who is renting a property in the UK and is made to help prospective tenants make decisions based on others\' previous experience. It allows you to see how well your potential future landlord maintains their property and how quickly they fix any faults with it.\nTo get started with Landlord Feedback you need a Facebook account. (Who doesn’t have one these days?). Login, add your property by locating it on a map, or navigating to Add Property section. If you are using a good browser (like Firefox or Chrome) your location should be automatically determined, however if it didn’t you can move the map around to find the exact spot. Once added the property – add some information about your tenancy, and start rating your renting experience in different categories. You can add as many feedbacks as you like for all properties or landlords you’ve ever stayed with. \nYou can also search for properties on a map, or by typing address or postcode into a search box. Properties appear on a screen as blue houses.\n','2010-12-06 20:22:00','2010-12-06 20:22:00');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `propertytype_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `postcode` varchar(50) CHARACTER SET latin1 NOT NULL,
  `lat` decimal(11,7) NOT NULL,
  `lng` decimal(11,7) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `propertytype_id` (`propertytype_id`),
  KEY `user_id` (`user_id`),
  KEY `lat` (`lat`),
  KEY `lng` (`lng`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,2,'Bristol, Avon BS7 8RA, UK',1,'BS7 8RA','51.4829827','-2.5928775','2011-01-02 22:09:22','2011-01-02 22:09:22'),(2,2,'4-12 Radnor Rd, Canton, Cardiff CF5 1, UK',1,'CF5 1','51.4830277','-3.2082858','2011-01-02 22:09:49','2011-01-02 22:09:49'),(3,2,'Embankment Rd, Plymouth PL4 9, UK',1,'PL4 9','50.3745486','-4.1106157','2011-01-02 22:09:52','2011-01-02 22:09:52'),(4,2,'Oldridge Rd, Whitestone, Devon EX4 2, UK',1,'EX4 2','50.7508970','-3.6459890','2011-01-02 22:09:54','2011-01-02 22:09:54'),(5,2,'Marchwood, Southampton, Hampshire SO40 4AH, UK',1,'SO40 4AH','50.9011122','-1.4478620','2011-01-02 22:09:55','2011-01-02 22:09:55'),(6,2,'2-6 Dalkeith Rd, Poole BH13 6, UK',1,'BH13 6','50.7103385','-1.9116573','2011-01-02 22:09:57','2011-01-02 22:09:57'),(7,2,'Portsmouth PO2 9HA, UK',1,'PO2 9HA','50.8213027','-1.0764562','2011-01-02 22:09:58','2011-01-02 22:09:58'),(8,2,'A27, Falmer, East Sussex BN7 3, UK',1,'BN7 3','50.8662306','-0.0603970','2011-01-02 22:10:00','2011-01-02 22:10:00'),(9,2,'1-5 Eldon Rd, Eastbourne, East Sussex BN21 1, UK',1,'BN21 1','50.7800971','0.2636566','2011-01-02 22:10:03','2011-01-02 22:10:03'),(10,2,'6-34 Tenterden Rise, Hastings, East Sussex TN34 2, UK',1,'TN34 2','50.8699861','0.5709893','2011-01-02 22:10:07','2011-01-02 22:10:07'),(11,2,'6 Erith Close, Maidstone, Kent ME14 2, UK',1,'ME14 2','51.2908845','0.5274331','2011-01-02 22:10:11','2011-01-02 22:10:11'),(12,2,'Crawley, West Sussex RH10 8JH, UK',1,'RH10 8JH','51.1258878','-0.1870806','2011-01-02 22:10:12','2011-01-02 22:10:12'),(13,2,'1-5 Wheatsheaf Close, Woking, Surrey GU21 4, UK',1,'GU21 4','51.3254001','-0.5603474','2011-01-02 22:10:14','2011-01-02 22:10:14'),(14,2,'Hounslow, Greater London TW5 0LU, UK',1,'TW5 0LU','51.4830530','-0.3735178','2011-01-02 22:10:16','2011-01-02 22:10:16'),(15,2,'41-55 London Ln, Bromley, Greater London BR1 3, UK',1,'BR1 3','51.4143987','0.0110232','2011-01-02 22:10:29','2011-01-02 22:10:29'),(16,2,'238 Hamstel Rd, Southend-on-Sea SS2 4, UK',1,'SS2 4','51.5513570','0.7360890','2011-01-02 22:10:31','2011-01-02 22:10:31'),(17,2,'Swindon SN2 8UQ, UK',1,'SN2 8UQ','51.5787188','-1.7686078','2011-01-02 22:10:35','2011-01-02 22:10:35'),(18,2,'3 Savile Rd, Oxford, Oxfordshire OX1 3, UK',1,'OX1 3','51.7561779','-1.2525368','2011-01-02 22:10:36','2011-01-02 22:10:36'),(19,2,'Portway, Great Linford, Milton Keynes MK14 7, UK',1,'MK14 7','52.0474737','-0.7565100','2011-01-02 22:10:37','2011-01-02 22:10:37'),(20,2,'Crawley Green Rd, Luton LU1 3, UK',1,'LU1 3','51.8781637','-0.4064188','2011-01-02 22:10:38','2011-01-02 22:10:38'),(21,2,'12 Highfield Ln, Colney Heath, Hertfordshire AL4 0, UK',1,'AL4 0','51.7416014','-0.2985967','2011-01-02 22:10:39','2011-01-02 22:10:39'),(22,2,'122-146 Deeds Grove, High Wycombe, Buckinghamshire HP12 3, UK',1,'HP12 3','51.6264139','-0.7693441','2011-01-02 22:10:39','2011-01-02 22:10:39'),(23,2,'Church St, Chelmsford, Essex CM1 1, UK',1,'CM1 1','51.7356185','0.4720045','2011-01-02 22:10:41','2011-01-02 22:10:41'),(24,2,'Burnham-on-Crouch, Essex CM0 8JZ, UK',1,'CM0 8JZ','51.6260454','0.8238451','2011-01-02 22:10:42','2011-01-02 22:10:42'),(25,2,'16-54 Wilson Marriage Rd, Colchester, Essex CO4 0, UK',1,'CO4 0','51.8986739','0.9228287','2011-01-02 22:10:44','2011-01-02 22:10:44'),(26,2,'Ipswich, Suffolk IP1 6DD, UK',1,'IP1 6DD','52.0744388','1.1320759','2011-01-02 22:10:44','2011-01-02 22:10:44'),(27,2,'6-11 Lynfield Ln, Cambridge CB4 1, UK',1,'CB4 1','52.2158996','0.1426822','2011-01-02 22:10:46','2011-01-02 22:10:46'),(28,2,'N Hinksey Ln, North Hinksey, Oxfordshire OX2 0, UK',1,'OX2 0','51.7483718','-1.2879977','2011-01-02 22:11:01','2011-01-02 22:11:01'),(29,2,'34-40 Tower Rd, Swindon SN5 5, UK',1,'SN5 5','51.5786681','-1.8346813','2011-01-02 22:11:06','2011-01-02 22:11:06'),(30,2,'James St W, Bath, Bath and North East Somerset BA1 1, UK',1,'BA1 1','51.3801198','-2.3620464','2011-01-02 22:11:09','2011-01-02 22:11:09'),(31,2,'Wellington Ln, Norwich, Norfolk NR2 1, UK',1,'NR2 1','52.6311461','1.2852861','2011-01-02 22:11:18','2011-01-02 22:11:18'),(32,2,'17 Argyle St, King\'s Lynn, Norfolk PE30 5, UK',1,'PE30 5','52.7450320','0.4063478','2011-01-02 22:11:20','2011-01-02 22:11:20'),(33,2,'Longthorpe Pkwy, Peterborough PE3 6, UK',1,'PE3 6','52.5664818','-0.2775956','2011-01-02 22:11:21','2011-01-02 22:11:21'),(34,2,'15 Rannoch Close, Leicester LE4 0, UK',1,'LE4 0','52.6578868','-1.1536875','2011-01-02 22:11:22','2011-01-02 22:11:22'),(35,2,'Solihull, West Midlands B93 9AB, UK',1,'B93 9AB','52.3909581','-1.7677538','2011-01-02 22:11:23','2011-01-02 22:11:23'),(36,2,'85-101 Eagle St, Coventry CV1 4, UK',1,'CV1 4','52.4175383','-1.5049888','2011-01-02 22:11:24','2011-01-02 22:11:24'),(37,2,'11-15 Southdown Ave, Birmingham B18 5, UK',1,'B18 5','52.4977266','-1.9225866','2011-01-02 22:11:27','2011-01-02 22:11:27'),(38,2,'Secunda Way, Gloucester, Gloucestershire GL2 5, UK',1,'GL2 5','51.8447767','-2.2695034','2011-01-02 22:11:33','2011-01-02 22:11:33'),(39,2,'Cheltenham, Gloucestershire GL52 8LE, UK',1,'GL52 8LE','51.9458227','-2.0547142','2011-01-02 22:11:34','2011-01-02 22:11:34'),(40,2,'Lawley Dr, Lawley and Overdale, Telford and Wrekin TF4 2, UK',1,'TF4 2','52.6786822','-2.4837989','2011-01-02 22:11:40','2011-01-02 22:11:40'),(41,2,'17-19 Forest Rd, Dudley DY1 4, UK',1,'DY1 4','52.5211488','-2.0842656','2011-01-02 22:11:48','2011-01-02 22:11:48'),(42,2,'Stanhope St, West Bromwich, Sandwell DY2 9, UK',1,'DY2 9','52.4862391','-2.0683335','2011-01-02 22:11:50','2011-01-02 22:11:50'),(43,2,'11-81 Hartledon Rd, Birmingham B17 0, UK',1,'B17 0','52.4559061','-1.9611125','2011-01-02 22:11:51','2011-01-02 22:11:51'),(44,2,'Chapel Ash, Wolverhampton WV1 4, UK',1,'WV1 4','52.5846915','-2.1369271','2011-01-02 22:15:52','2011-01-02 22:15:52'),(45,2,'146 Miner St, Walsall WS2 8, UK',1,'WS2 8','52.5932407','-1.9982788','2011-01-02 22:15:54','2011-01-02 22:15:54'),(46,2,'Tamworth, Staffordshire B79 7BL, UK',1,'B79 7BL','52.6325674','-1.7016588','2011-01-02 22:15:56','2011-01-02 22:15:56'),(47,2,'111 Vernons Ln, Nuneaton, Warwickshire CV11 5, UK',1,'CV11 5','52.5269555','-1.4818249','2011-01-02 22:15:58','2011-01-02 22:15:58'),(48,2,'Upper Bath St, Northampton, Northamptonshire NN1 2, UK',1,'NN1 2','52.2393725','-0.9009520','2011-01-02 22:16:02','2011-01-02 22:16:02'),(49,2,'1-2 Wallingford Rd, Leicester LE4 5, UK',1,'LE4 5','52.6546852','-1.1318827','2011-01-02 22:16:03','2011-01-02 22:16:03'),(50,2,'51 Lodge Ln, Derby DE1 3, UK',1,'DE1 3','52.9269805','-1.4833852','2011-01-02 22:16:05','2011-01-02 22:16:05'),(51,2,'Nottingham NG1 2AU, UK',1,'NG1 2AU','52.9535287','-1.1478473','2011-01-02 22:16:06','2011-01-02 22:16:06'),(52,2,'10 Granby Ave, Mansfield, Nottinghamshire NG19 7, UK',1,'NG19 7','53.1515812','-1.1974433','2011-01-02 22:16:09','2011-01-02 22:16:09'),(53,2,'Saltergate, Chesterfield, Derbyshire S40 1, UK',1,'S40 1','53.2373665','-1.4279849','2011-01-02 22:16:10','2011-01-02 22:16:10'),(54,2,'123-129 Eaton St, Stoke-on-Trent ST1 2, UK',1,'ST1 2','53.0295147','-2.1642423','2011-01-02 22:16:13','2011-01-02 22:16:13'),(55,2,'Eldon St, Liverpool L3 6, UK',1,'L3 6','53.4175748','-2.9888374','2011-01-02 22:16:15','2011-01-02 22:16:15'),(56,2,'10-16 Marlborough Rd, Southport, Sefton PR9 0, UK',1,'PR9 0','53.6492177','-2.9934541','2011-01-02 22:16:18','2011-01-02 22:16:18'),(57,2,'Manchester, Greater Manchester M4 3AB, UK',1,'M4 3AB','53.4834596','-2.2416874','2011-01-02 22:16:19','2011-01-02 22:16:19'),(58,2,'Leeds LS3 1BW, UK',1,'LS3 1BW','53.8024195','-1.5599930','2011-01-02 22:16:25','2011-01-02 22:16:25'),(59,2,'Wakefield WF1 4EL, UK',1,'WF1 4EL','53.6786872','-1.4892968','2011-01-02 22:16:26','2011-01-02 22:16:26'),(60,2,'Lawson St, Preston, Lancashire PR1 2, UK',1,'PR1 2','53.7633070','-2.7024955','2011-01-02 22:16:33','2011-01-02 22:16:33'),(61,2,'1 Belford Rd, Harrogate, North Yorkshire HG1 1, UK',1,'HG1 1','53.9898976','-1.5381998','2011-01-02 22:16:35','2011-01-02 22:16:35'),(62,2,'20 Talbot St, Queensbury, Bradford BD7 1, UK',1,'BD7 1','53.7949207','-1.7739169','2011-01-02 22:16:36','2011-01-02 22:16:36'),(63,2,'Burdock Way, Halifax, Calderdale HX1 2, UK',1,'HX1 2','53.7210658','-1.8676088','2011-01-02 22:16:37','2011-01-02 22:16:37'),(64,2,'Newgate, Rochdale OL16 1, UK',1,'OL16 1','53.6168486','-2.1590857','2011-01-02 22:16:39','2011-01-02 22:16:39'),(65,2,'4-14 Cundey St, Bolton BL1 3, UK',1,'BL1 3','53.5876136','-2.4498330','2011-01-02 22:16:40','2011-01-02 22:16:40'),(66,2,'Park Way, Urmston, Trafford M17 1, UK',1,'M17 1','53.4672460','-2.3286845','2011-01-02 22:16:41','2011-01-02 22:16:41'),(67,2,'13-23 Swinley Ln, Pemberton, Wigan WN1 2, UK',1,'WN1 2','53.5549192','-2.6311810','2011-01-02 22:16:42','2011-01-02 22:16:42'),(68,2,'4-6 Nessgate, York YO1 9, UK',1,'YO1 9','53.9576391','-1.0821133','2011-01-02 22:16:47','2011-01-02 22:16:47'),(69,2,'2-76 Fairmont Crescent, North Lincolnshire DN16 1, UK',1,'DN16 1','53.5842642','-0.6424710','2011-01-02 22:16:49','2011-01-02 22:16:49'),(70,2,'76-84 Lime Tree Ave, Doncaster DN4 5, UK',1,'DN4 5','53.5158596','-1.1150292','2011-01-02 22:16:50','2011-01-02 22:16:50'),(71,2,'Hull, North Humberside HU1 3RQ, UK',1,'HU1 3RQ','53.7437911','-0.3406140','2011-01-02 22:16:52','2011-01-02 22:16:52'),(72,2,'1 Levington St, North East Lincolnshire DN31 3, UK',1,'DN31 3','53.5744747','-0.0660724','2011-01-02 22:16:53','2011-01-02 22:16:53'),(73,2,'Windward Way, Middlesbrough TS3 6, UK',1,'TS3 6','54.5767295','-1.2236164','2011-01-02 22:16:57','2011-01-02 22:16:57'),(74,2,'1-19 Frome Rd, Stockton-on-Tees TS20 2, UK',1,'TS20 2','54.5799892','-1.3073589','2011-01-02 22:16:57','2011-01-02 22:16:57'),(75,2,'44 Chandlers Close, Hartlepool TS24 0, UK',1,'TS24 0','54.6854750','-1.1997048','2011-01-02 22:16:59','2011-01-02 22:16:59'),(76,2,'36-37 Westbourne Rd, Sunderland SR1 3, UK',1,'SR1 3','54.9034672','-1.3949779','2011-01-02 22:17:00','2011-01-02 22:17:00'),(77,2,'A167, Newcastle Upon Tyne NE2 4, UK',1,'NE2 4','54.9833220','-1.6202307','2011-01-02 22:17:15','2011-01-02 22:17:15'),(78,2,'1-17 Punton Rd, Carlisle, Cumbria CA3 9, UK',1,'CA3 9','54.9067362','-2.9330152','2011-01-02 22:17:18','2011-01-02 22:17:18'),(79,2,'Glasgow, Glasgow City G22 9AT, UK',1,'G22 9AT','55.8861554','-4.2466074','2011-01-02 22:17:24','2011-01-02 22:17:24'),(80,2,'77 Mauchline St, Glasgow, Glasgow City G5 8, UK',1,'G5 8','55.8485988','-4.2635600','2011-01-02 22:17:24','2011-01-02 22:17:24'),(81,2,'3 Wallneuk Rd, Renfrew, Renfrewshire PA1 3, UK',1,'PA1 3','55.8491247','-4.4167908','2011-01-02 22:17:25','2011-01-02 22:17:25'),(82,2,'Edinburgh EH9 2DB, UK',1,'EH9 2DB','55.9325266','-3.1749420','2011-01-02 22:17:27','2011-01-02 22:17:27'),(83,2,'46-50 Campbell Ave, Edinburgh, City of Edinburgh EH12 6, UK',1,'EH12 6','55.9476983','-3.2465777','2011-01-02 22:17:28','2011-01-02 22:17:28'),(84,2,'1-12 Park Pl, Dunfermline, Fife KY12 7, UK',1,'KY12 7','56.0734847','-3.4496734','2011-01-02 22:17:29','2011-01-02 22:17:29'),(85,2,'Claverhouse Rd, Dundee, Dundee City DD4 9, UK',1,'DD4 9','56.4911584','-2.9665789','2011-01-02 22:17:31','2011-01-02 22:17:31'),(86,2,'24-40 Howard St, Belfast BT1 6, UK',1,'BT1 6','54.5958730','-5.9326209','2011-01-02 22:17:40','2011-01-02 22:17:40'),(87,2,'Pennyburn Pass, Londonderry, Derry BT48 0, UK',1,'BT48 0','55.0134434','-7.3172286','2011-01-02 22:17:41','2011-01-02 22:17:41'),(88,2,'A90, Aberdeen City AB22 8, UK',1,'AB22 8','57.1813088','-2.1490666','2011-01-02 22:17:47','2011-01-02 22:17:47'),(89,2,'14 Dalziel Rd, Angus DD4 0, UK',1,'DD4 0','56.5213068','-2.9484739','2011-01-02 22:17:48','2011-01-02 22:17:48'),(90,2,'1-13 Southerton Rd, Hammersmith, Greater London W6 0, UK',1,'W6 0','51.4950087','-0.2282816','2011-01-02 22:18:57','2011-01-02 22:18:57'),(91,2,'Hounslow, Greater London TW3 9SL, UK',1,'TW3 9SL','51.4752293','-0.3689578','2011-01-02 22:19:03','2011-01-02 22:19:03'),(92,2,'155-173 Ellerdine Rd, Hounslow, Greater London TW3 2, UK',1,'TW3 2','51.4622389','-0.3504122','2011-01-02 22:19:05','2011-01-02 22:19:05'),(93,2,'26-44 Tranmere Rd, Richmond, Greater London TW2 7, UK',1,'TW2 7','51.4514404','-0.3605071','2011-01-02 22:19:06','2011-01-02 22:19:06'),(94,2,'Ealing, London W13 9NL, UK',1,'W13 9NL','51.5094645','-0.3131198','2011-01-02 22:19:15','2011-01-02 22:19:15'),(95,2,'Hounslow, London W4 2BB, UK',1,'W4 2BB','51.4907867','-0.2595324','2011-01-02 22:20:03','2011-01-02 22:20:03'),(96,2,'Ealing, London W13 0DH, UK',1,'W13 0DH','51.5227828','-0.3288731','2011-01-02 22:20:12','2011-01-02 22:20:12'),(97,2,'53-61 Croham Rd, Croydon, Greater London CR2 7, UK',1,'CR2 7','51.3603387','-0.0842888','2011-01-02 22:20:27','2011-01-02 22:20:27'),(98,2,'21-26 Hillside Close, Merton, Greater London SM4 4, UK',1,'SM4 4','51.4002813','-0.2152647','2011-01-02 22:20:55','2011-01-02 22:20:55'),(99,2,'Thornton Heath, Greater London CR7 7DR, UK',1,'CR7 7DR','51.3988221','-0.1104104','2011-01-02 22:21:00','2011-01-02 22:21:00'),(100,2,'2-34 Kelsey Way, Bromley, Greater London BR3 3, UK',1,'BR3 3','51.4013863','-0.0270143','2011-01-02 22:21:03','2011-01-02 22:21:03'),(101,2,'2-52 Ticehurst Rd, Lewisham, Greater London SE23 2, UK',1,'SE23 2','51.4359265','-0.0393906','2011-01-02 22:21:04','2011-01-02 22:21:04'),(102,2,'2-46 Kellerton Rd, Lewisham, Greater London SE13 5, UK',1,'SE13 5','51.4549940','0.0013798','2011-01-02 22:21:08','2011-01-02 22:21:08'),(103,2,'15-21 Mells Crescent, Bromley, Greater London SE9 4, UK',1,'SE9 4','51.4255236','0.0493137','2011-01-02 22:21:09','2011-01-02 22:21:09'),(104,2,'83-133 Herbert Rd, Eltham, Greater London SE18 3, UK',1,'SE18 3','51.4783309','0.0668581','2011-01-02 22:21:11','2011-01-02 22:21:11'),(105,2,'17-31 Keyes Rd, Dartford, Kent DA1 5, UK',1,'DA1 5','51.4537054','0.2303763','2011-01-02 22:21:17','2011-01-02 22:21:17'),(106,2,'14-36 Jenningtree Rd, Crayford, Greater London DA8 2, UK',1,'DA8 2','51.4737307','0.1980599','2011-01-02 22:21:19','2011-01-02 22:21:19'),(107,2,'87 Springfield Gardens, Romford, Greater London RM14 3, UK',1,'RM14 3','51.5525662','0.2551529','2011-01-02 22:21:22','2011-01-02 22:21:22'),(108,2,'19-35 Acacia Gardens, Romford, Greater London RM14 1, UK',1,'RM14 1','51.5677908','0.2788790','2011-01-02 22:21:28','2011-01-02 22:21:28'),(109,2,'6-16 Settle Rd, Romford, Greater London RM3 9, UK',1,'RM3 9','51.6095480','0.2397070','2011-01-02 22:21:30','2011-01-02 22:21:30'),(110,2,'195 Clockhouse Ln, Romford, Greater London RM5 2, UK',1,'RM5 2','51.6085637','0.1656671','2011-01-02 22:21:32','2011-01-02 22:21:32'),(111,2,'32-36 Fairview Rd, Ilford, Greater London IG7 6, UK',1,'IG7 6','51.6131774','0.0982983','2011-01-02 22:21:36','2011-01-02 22:21:36'),(112,2,'1-9 Southern Dr, Loughton, Essex IG10 3, UK',1,'IG10 3','51.6376751','0.0625791','2011-01-02 22:21:39','2011-01-02 22:21:39'),(113,2,'106 Colebrook Ln, Loughton, Essex IG10 2, UK',1,'IG10 2','51.6597805','0.0846731','2011-01-02 22:21:40','2011-01-02 22:21:40'),(114,2,'West Bromwich, West Midlands B70 8PJ, UK',1,'B70 8PJ','52.5174592','-2.0021816','2011-01-02 22:22:32','2011-01-02 22:22:32'),(115,2,'33-51 Wills St, Birmingham B19 1, UK',1,'B19 1','52.5010041','-1.9124989','2011-01-02 22:22:40','2011-01-02 22:22:40'),(116,2,'79 Eyre St, Birmingham B18 7, UK',1,'B18 7','52.4841516','-1.9272857','2011-01-02 22:22:42','2011-01-02 22:22:42'),(117,2,'51-69 Arden Rd, West Bromwich, Sandwell B67 6, UK',1,'B67 6','52.4898940','-1.9702777','2011-01-02 22:22:56','2011-01-02 22:22:56');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertytypes`
--

DROP TABLE IF EXISTS `propertytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `comment` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertytypes`
--

LOCK TABLES `propertytypes` WRITE;
/*!40000 ALTER TABLE `propertytypes` DISABLE KEYS */;
INSERT INTO `propertytypes` VALUES (1,'flat',''),(2,'apartment',''),(3,'house',''),(4,'maisonette',''),(5,'studio',''),(6,'room',''),(7,'bedsit',''),(8,'other','');
/*!40000 ALTER TABLE `propertytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) CHARACTER SET latin1 NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20110101203803'),('20110101233058');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(16) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'1033864170','Art','Deineka','fighting_1r1sh@yahoo.ie',NULL,'2011-01-01 20:25:30','2011-01-01 20:25:30'),(2,'837178900','Svetlana','Kleimenova','mstemper1@gmail.com',NULL,'2011-01-02 00:06:57','2011-01-02 00:06:57');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `llfb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `llfb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `llfb`;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `text` varchar(400) NOT NULL,
  `updated_at` datetime NOT NULL,
  `commentable_id` int(11) DEFAULT NULL,
  `commentable_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `index_comments_on_commentable_id_and_commentable_type` (`commentable_id`,`commentable_type`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,'nice post, thanks','2011-01-01 22:53:26',1,'Post'),(2,1,'ttt','2011-01-01 22:56:11',1,'Post'),(3,1,'help','2011-01-01 22:57:42',1,'Post'),(4,1,'ddd','2011-01-01 23:06:22',1,'Post'),(5,1,'some text goes here','2011-01-01 23:12:38',1,'Property'),(6,1,'my comment about this','2011-01-01 23:16:28',1,'Feedback'),(7,1,'aaa','2011-01-01 23:36:11',1,'Post'),(8,1,'sss','2011-01-01 23:36:31',1,'Property'),(9,1,'ddd','2011-01-01 23:36:47',1,'Feedback');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entrytype_id` int(11) NOT NULL,
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` text CHARACTER SET latin1,
  `rating` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_id` (`feedback_id`),
  KEY `user_id` (`user_id`),
  KEY `entrytype_id` (`entrytype_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `comment` text CHARACTER SET latin1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,'Landlord',NULL),(2,'Agency',NULL),(3,'Neighbors',NULL),(4,'Neighborhood',NULL),(5,'Area',NULL),(6,'Local Council',NULL),(7,'Local shops/facilities',NULL),(8,'Garden',NULL),(9,'Bills',NULL),(10,'Other',NULL);
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `feedbackproperties`
--

DROP TABLE IF EXISTS `feedbackproperties`;
/*!50001 DROP VIEW IF EXISTS `feedbackproperties`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `feedbackproperties` (
  `id` int(11),
  `rating` decimal(11,0),
  `address` varchar(255),
  `postcode` varchar(50),
  `lat` decimal(11,7),
  `lng` decimal(11,7),
  `propertytype_id` int(11),
  `updated_at` datetime,
  `user_id` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `totalmonths` int(11) NOT NULL DEFAULT '6',
  `lastdate` date DEFAULT NULL,
  `landlord` varchar(50) NOT NULL,
  `agency` varchar(50) NOT NULL,
  `anonymous` tinyint(1) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `property_id` (`property_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,1,1,6,'2011-01-03','some fucker','aaaaaaaaaaaaa',1,'2011-01-01 21:45:27','2011-01-01 21:45:27');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `photo_content_type` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_id` (`feedback_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `entry` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Welcome to Landlord Feedback','landlordfeedback@gmail.com','Hello and welcome to Landlord Feedback. This website is for everyone who is renting a property in the UK and is made to help prospective tenants make decisions based on others\' previous experience. It allows you to see how well your potential future landlord maintains their property and how quickly they fix any faults with it.\nTo get started with Landlord Feedback you need a Facebook account. (Who doesn’t have one these days?). Login, add your property by locating it on a map, or navigating to Add Property section. If you are using a good browser (like Firefox or Chrome) your location should be automatically determined, however if it didn’t you can move the map around to find the exact spot. Once added the property – add some information about your tenancy, and start rating your renting experience in different categories. You can add as many feedbacks as you like for all properties or landlords you’ve ever stayed with. \nYou can also search for properties on a map, or by typing address or postcode into a search box. Properties appear on a screen as blue houses.\n','2010-12-06 20:22:00','2010-12-06 20:22:00');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `propertytype_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `postcode` varchar(50) CHARACTER SET latin1 NOT NULL,
  `lat` decimal(11,7) NOT NULL,
  `lng` decimal(11,7) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `propertytype_id` (`propertytype_id`),
  KEY `user_id` (`user_id`),
  KEY `lat` (`lat`),
  KEY `lng` (`lng`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,2,'Bristol, Avon BS7 8RA, UK',1,'BS7 8RA','51.4829827','-2.5928775','2011-01-02 22:09:22','2011-01-02 22:09:22'),(2,2,'4-12 Radnor Rd, Canton, Cardiff CF5 1, UK',1,'CF5 1','51.4830277','-3.2082858','2011-01-02 22:09:49','2011-01-02 22:09:49'),(3,2,'Embankment Rd, Plymouth PL4 9, UK',1,'PL4 9','50.3745486','-4.1106157','2011-01-02 22:09:52','2011-01-02 22:09:52'),(4,2,'Oldridge Rd, Whitestone, Devon EX4 2, UK',1,'EX4 2','50.7508970','-3.6459890','2011-01-02 22:09:54','2011-01-02 22:09:54'),(5,2,'Marchwood, Southampton, Hampshire SO40 4AH, UK',1,'SO40 4AH','50.9011122','-1.4478620','2011-01-02 22:09:55','2011-01-02 22:09:55'),(6,2,'2-6 Dalkeith Rd, Poole BH13 6, UK',1,'BH13 6','50.7103385','-1.9116573','2011-01-02 22:09:57','2011-01-02 22:09:57'),(7,2,'Portsmouth PO2 9HA, UK',1,'PO2 9HA','50.8213027','-1.0764562','2011-01-02 22:09:58','2011-01-02 22:09:58'),(8,2,'A27, Falmer, East Sussex BN7 3, UK',1,'BN7 3','50.8662306','-0.0603970','2011-01-02 22:10:00','2011-01-02 22:10:00'),(9,2,'1-5 Eldon Rd, Eastbourne, East Sussex BN21 1, UK',1,'BN21 1','50.7800971','0.2636566','2011-01-02 22:10:03','2011-01-02 22:10:03'),(10,2,'6-34 Tenterden Rise, Hastings, East Sussex TN34 2, UK',1,'TN34 2','50.8699861','0.5709893','2011-01-02 22:10:07','2011-01-02 22:10:07'),(11,2,'6 Erith Close, Maidstone, Kent ME14 2, UK',1,'ME14 2','51.2908845','0.5274331','2011-01-02 22:10:11','2011-01-02 22:10:11'),(12,2,'Crawley, West Sussex RH10 8JH, UK',1,'RH10 8JH','51.1258878','-0.1870806','2011-01-02 22:10:12','2011-01-02 22:10:12'),(13,2,'1-5 Wheatsheaf Close, Woking, Surrey GU21 4, UK',1,'GU21 4','51.3254001','-0.5603474','2011-01-02 22:10:14','2011-01-02 22:10:14'),(14,2,'Hounslow, Greater London TW5 0LU, UK',1,'TW5 0LU','51.4830530','-0.3735178','2011-01-02 22:10:16','2011-01-02 22:10:16'),(15,2,'41-55 London Ln, Bromley, Greater London BR1 3, UK',1,'BR1 3','51.4143987','0.0110232','2011-01-02 22:10:29','2011-01-02 22:10:29'),(16,2,'238 Hamstel Rd, Southend-on-Sea SS2 4, UK',1,'SS2 4','51.5513570','0.7360890','2011-01-02 22:10:31','2011-01-02 22:10:31'),(17,2,'Swindon SN2 8UQ, UK',1,'SN2 8UQ','51.5787188','-1.7686078','2011-01-02 22:10:35','2011-01-02 22:10:35'),(18,2,'3 Savile Rd, Oxford, Oxfordshire OX1 3, UK',1,'OX1 3','51.7561779','-1.2525368','2011-01-02 22:10:36','2011-01-02 22:10:36'),(19,2,'Portway, Great Linford, Milton Keynes MK14 7, UK',1,'MK14 7','52.0474737','-0.7565100','2011-01-02 22:10:37','2011-01-02 22:10:37'),(20,2,'Crawley Green Rd, Luton LU1 3, UK',1,'LU1 3','51.8781637','-0.4064188','2011-01-02 22:10:38','2011-01-02 22:10:38'),(21,2,'12 Highfield Ln, Colney Heath, Hertfordshire AL4 0, UK',1,'AL4 0','51.7416014','-0.2985967','2011-01-02 22:10:39','2011-01-02 22:10:39'),(22,2,'122-146 Deeds Grove, High Wycombe, Buckinghamshire HP12 3, UK',1,'HP12 3','51.6264139','-0.7693441','2011-01-02 22:10:39','2011-01-02 22:10:39'),(23,2,'Church St, Chelmsford, Essex CM1 1, UK',1,'CM1 1','51.7356185','0.4720045','2011-01-02 22:10:41','2011-01-02 22:10:41'),(24,2,'Burnham-on-Crouch, Essex CM0 8JZ, UK',1,'CM0 8JZ','51.6260454','0.8238451','2011-01-02 22:10:42','2011-01-02 22:10:42'),(25,2,'16-54 Wilson Marriage Rd, Colchester, Essex CO4 0, UK',1,'CO4 0','51.8986739','0.9228287','2011-01-02 22:10:44','2011-01-02 22:10:44'),(26,2,'Ipswich, Suffolk IP1 6DD, UK',1,'IP1 6DD','52.0744388','1.1320759','2011-01-02 22:10:44','2011-01-02 22:10:44'),(27,2,'6-11 Lynfield Ln, Cambridge CB4 1, UK',1,'CB4 1','52.2158996','0.1426822','2011-01-02 22:10:46','2011-01-02 22:10:46'),(28,2,'N Hinksey Ln, North Hinksey, Oxfordshire OX2 0, UK',1,'OX2 0','51.7483718','-1.2879977','2011-01-02 22:11:01','2011-01-02 22:11:01'),(29,2,'34-40 Tower Rd, Swindon SN5 5, UK',1,'SN5 5','51.5786681','-1.8346813','2011-01-02 22:11:06','2011-01-02 22:11:06'),(30,2,'James St W, Bath, Bath and North East Somerset BA1 1, UK',1,'BA1 1','51.3801198','-2.3620464','2011-01-02 22:11:09','2011-01-02 22:11:09'),(31,2,'Wellington Ln, Norwich, Norfolk NR2 1, UK',1,'NR2 1','52.6311461','1.2852861','2011-01-02 22:11:18','2011-01-02 22:11:18'),(32,2,'17 Argyle St, King\'s Lynn, Norfolk PE30 5, UK',1,'PE30 5','52.7450320','0.4063478','2011-01-02 22:11:20','2011-01-02 22:11:20'),(33,2,'Longthorpe Pkwy, Peterborough PE3 6, UK',1,'PE3 6','52.5664818','-0.2775956','2011-01-02 22:11:21','2011-01-02 22:11:21'),(34,2,'15 Rannoch Close, Leicester LE4 0, UK',1,'LE4 0','52.6578868','-1.1536875','2011-01-02 22:11:22','2011-01-02 22:11:22'),(35,2,'Solihull, West Midlands B93 9AB, UK',1,'B93 9AB','52.3909581','-1.7677538','2011-01-02 22:11:23','2011-01-02 22:11:23'),(36,2,'85-101 Eagle St, Coventry CV1 4, UK',1,'CV1 4','52.4175383','-1.5049888','2011-01-02 22:11:24','2011-01-02 22:11:24'),(37,2,'11-15 Southdown Ave, Birmingham B18 5, UK',1,'B18 5','52.4977266','-1.9225866','2011-01-02 22:11:27','2011-01-02 22:11:27'),(38,2,'Secunda Way, Gloucester, Gloucestershire GL2 5, UK',1,'GL2 5','51.8447767','-2.2695034','2011-01-02 22:11:33','2011-01-02 22:11:33'),(39,2,'Cheltenham, Gloucestershire GL52 8LE, UK',1,'GL52 8LE','51.9458227','-2.0547142','2011-01-02 22:11:34','2011-01-02 22:11:34'),(40,2,'Lawley Dr, Lawley and Overdale, Telford and Wrekin TF4 2, UK',1,'TF4 2','52.6786822','-2.4837989','2011-01-02 22:11:40','2011-01-02 22:11:40'),(41,2,'17-19 Forest Rd, Dudley DY1 4, UK',1,'DY1 4','52.5211488','-2.0842656','2011-01-02 22:11:48','2011-01-02 22:11:48'),(42,2,'Stanhope St, West Bromwich, Sandwell DY2 9, UK',1,'DY2 9','52.4862391','-2.0683335','2011-01-02 22:11:50','2011-01-02 22:11:50'),(43,2,'11-81 Hartledon Rd, Birmingham B17 0, UK',1,'B17 0','52.4559061','-1.9611125','2011-01-02 22:11:51','2011-01-02 22:11:51'),(44,2,'Chapel Ash, Wolverhampton WV1 4, UK',1,'WV1 4','52.5846915','-2.1369271','2011-01-02 22:15:52','2011-01-02 22:15:52'),(45,2,'146 Miner St, Walsall WS2 8, UK',1,'WS2 8','52.5932407','-1.9982788','2011-01-02 22:15:54','2011-01-02 22:15:54'),(46,2,'Tamworth, Staffordshire B79 7BL, UK',1,'B79 7BL','52.6325674','-1.7016588','2011-01-02 22:15:56','2011-01-02 22:15:56'),(47,2,'111 Vernons Ln, Nuneaton, Warwickshire CV11 5, UK',1,'CV11 5','52.5269555','-1.4818249','2011-01-02 22:15:58','2011-01-02 22:15:58'),(48,2,'Upper Bath St, Northampton, Northamptonshire NN1 2, UK',1,'NN1 2','52.2393725','-0.9009520','2011-01-02 22:16:02','2011-01-02 22:16:02'),(49,2,'1-2 Wallingford Rd, Leicester LE4 5, UK',1,'LE4 5','52.6546852','-1.1318827','2011-01-02 22:16:03','2011-01-02 22:16:03'),(50,2,'51 Lodge Ln, Derby DE1 3, UK',1,'DE1 3','52.9269805','-1.4833852','2011-01-02 22:16:05','2011-01-02 22:16:05'),(51,2,'Nottingham NG1 2AU, UK',1,'NG1 2AU','52.9535287','-1.1478473','2011-01-02 22:16:06','2011-01-02 22:16:06'),(52,2,'10 Granby Ave, Mansfield, Nottinghamshire NG19 7, UK',1,'NG19 7','53.1515812','-1.1974433','2011-01-02 22:16:09','2011-01-02 22:16:09'),(53,2,'Saltergate, Chesterfield, Derbyshire S40 1, UK',1,'S40 1','53.2373665','-1.4279849','2011-01-02 22:16:10','2011-01-02 22:16:10'),(54,2,'123-129 Eaton St, Stoke-on-Trent ST1 2, UK',1,'ST1 2','53.0295147','-2.1642423','2011-01-02 22:16:13','2011-01-02 22:16:13'),(55,2,'Eldon St, Liverpool L3 6, UK',1,'L3 6','53.4175748','-2.9888374','2011-01-02 22:16:15','2011-01-02 22:16:15'),(56,2,'10-16 Marlborough Rd, Southport, Sefton PR9 0, UK',1,'PR9 0','53.6492177','-2.9934541','2011-01-02 22:16:18','2011-01-02 22:16:18'),(57,2,'Manchester, Greater Manchester M4 3AB, UK',1,'M4 3AB','53.4834596','-2.2416874','2011-01-02 22:16:19','2011-01-02 22:16:19'),(58,2,'Leeds LS3 1BW, UK',1,'LS3 1BW','53.8024195','-1.5599930','2011-01-02 22:16:25','2011-01-02 22:16:25'),(59,2,'Wakefield WF1 4EL, UK',1,'WF1 4EL','53.6786872','-1.4892968','2011-01-02 22:16:26','2011-01-02 22:16:26'),(60,2,'Lawson St, Preston, Lancashire PR1 2, UK',1,'PR1 2','53.7633070','-2.7024955','2011-01-02 22:16:33','2011-01-02 22:16:33'),(61,2,'1 Belford Rd, Harrogate, North Yorkshire HG1 1, UK',1,'HG1 1','53.9898976','-1.5381998','2011-01-02 22:16:35','2011-01-02 22:16:35'),(62,2,'20 Talbot St, Queensbury, Bradford BD7 1, UK',1,'BD7 1','53.7949207','-1.7739169','2011-01-02 22:16:36','2011-01-02 22:16:36'),(63,2,'Burdock Way, Halifax, Calderdale HX1 2, UK',1,'HX1 2','53.7210658','-1.8676088','2011-01-02 22:16:37','2011-01-02 22:16:37'),(64,2,'Newgate, Rochdale OL16 1, UK',1,'OL16 1','53.6168486','-2.1590857','2011-01-02 22:16:39','2011-01-02 22:16:39'),(65,2,'4-14 Cundey St, Bolton BL1 3, UK',1,'BL1 3','53.5876136','-2.4498330','2011-01-02 22:16:40','2011-01-02 22:16:40'),(66,2,'Park Way, Urmston, Trafford M17 1, UK',1,'M17 1','53.4672460','-2.3286845','2011-01-02 22:16:41','2011-01-02 22:16:41'),(67,2,'13-23 Swinley Ln, Pemberton, Wigan WN1 2, UK',1,'WN1 2','53.5549192','-2.6311810','2011-01-02 22:16:42','2011-01-02 22:16:42'),(68,2,'4-6 Nessgate, York YO1 9, UK',1,'YO1 9','53.9576391','-1.0821133','2011-01-02 22:16:47','2011-01-02 22:16:47'),(69,2,'2-76 Fairmont Crescent, North Lincolnshire DN16 1, UK',1,'DN16 1','53.5842642','-0.6424710','2011-01-02 22:16:49','2011-01-02 22:16:49'),(70,2,'76-84 Lime Tree Ave, Doncaster DN4 5, UK',1,'DN4 5','53.5158596','-1.1150292','2011-01-02 22:16:50','2011-01-02 22:16:50'),(71,2,'Hull, North Humberside HU1 3RQ, UK',1,'HU1 3RQ','53.7437911','-0.3406140','2011-01-02 22:16:52','2011-01-02 22:16:52'),(72,2,'1 Levington St, North East Lincolnshire DN31 3, UK',1,'DN31 3','53.5744747','-0.0660724','2011-01-02 22:16:53','2011-01-02 22:16:53'),(73,2,'Windward Way, Middlesbrough TS3 6, UK',1,'TS3 6','54.5767295','-1.2236164','2011-01-02 22:16:57','2011-01-02 22:16:57'),(74,2,'1-19 Frome Rd, Stockton-on-Tees TS20 2, UK',1,'TS20 2','54.5799892','-1.3073589','2011-01-02 22:16:57','2011-01-02 22:16:57'),(75,2,'44 Chandlers Close, Hartlepool TS24 0, UK',1,'TS24 0','54.6854750','-1.1997048','2011-01-02 22:16:59','2011-01-02 22:16:59'),(76,2,'36-37 Westbourne Rd, Sunderland SR1 3, UK',1,'SR1 3','54.9034672','-1.3949779','2011-01-02 22:17:00','2011-01-02 22:17:00'),(77,2,'A167, Newcastle Upon Tyne NE2 4, UK',1,'NE2 4','54.9833220','-1.6202307','2011-01-02 22:17:15','2011-01-02 22:17:15'),(78,2,'1-17 Punton Rd, Carlisle, Cumbria CA3 9, UK',1,'CA3 9','54.9067362','-2.9330152','2011-01-02 22:17:18','2011-01-02 22:17:18'),(79,2,'Glasgow, Glasgow City G22 9AT, UK',1,'G22 9AT','55.8861554','-4.2466074','2011-01-02 22:17:24','2011-01-02 22:17:24'),(80,2,'77 Mauchline St, Glasgow, Glasgow City G5 8, UK',1,'G5 8','55.8485988','-4.2635600','2011-01-02 22:17:24','2011-01-02 22:17:24'),(81,2,'3 Wallneuk Rd, Renfrew, Renfrewshire PA1 3, UK',1,'PA1 3','55.8491247','-4.4167908','2011-01-02 22:17:25','2011-01-02 22:17:25'),(82,2,'Edinburgh EH9 2DB, UK',1,'EH9 2DB','55.9325266','-3.1749420','2011-01-02 22:17:27','2011-01-02 22:17:27'),(83,2,'46-50 Campbell Ave, Edinburgh, City of Edinburgh EH12 6, UK',1,'EH12 6','55.9476983','-3.2465777','2011-01-02 22:17:28','2011-01-02 22:17:28'),(84,2,'1-12 Park Pl, Dunfermline, Fife KY12 7, UK',1,'KY12 7','56.0734847','-3.4496734','2011-01-02 22:17:29','2011-01-02 22:17:29'),(85,2,'Claverhouse Rd, Dundee, Dundee City DD4 9, UK',1,'DD4 9','56.4911584','-2.9665789','2011-01-02 22:17:31','2011-01-02 22:17:31'),(86,2,'24-40 Howard St, Belfast BT1 6, UK',1,'BT1 6','54.5958730','-5.9326209','2011-01-02 22:17:40','2011-01-02 22:17:40'),(87,2,'Pennyburn Pass, Londonderry, Derry BT48 0, UK',1,'BT48 0','55.0134434','-7.3172286','2011-01-02 22:17:41','2011-01-02 22:17:41'),(88,2,'A90, Aberdeen City AB22 8, UK',1,'AB22 8','57.1813088','-2.1490666','2011-01-02 22:17:47','2011-01-02 22:17:47'),(89,2,'14 Dalziel Rd, Angus DD4 0, UK',1,'DD4 0','56.5213068','-2.9484739','2011-01-02 22:17:48','2011-01-02 22:17:48'),(90,2,'1-13 Southerton Rd, Hammersmith, Greater London W6 0, UK',1,'W6 0','51.4950087','-0.2282816','2011-01-02 22:18:57','2011-01-02 22:18:57'),(91,2,'Hounslow, Greater London TW3 9SL, UK',1,'TW3 9SL','51.4752293','-0.3689578','2011-01-02 22:19:03','2011-01-02 22:19:03'),(92,2,'155-173 Ellerdine Rd, Hounslow, Greater London TW3 2, UK',1,'TW3 2','51.4622389','-0.3504122','2011-01-02 22:19:05','2011-01-02 22:19:05'),(93,2,'26-44 Tranmere Rd, Richmond, Greater London TW2 7, UK',1,'TW2 7','51.4514404','-0.3605071','2011-01-02 22:19:06','2011-01-02 22:19:06'),(94,2,'Ealing, London W13 9NL, UK',1,'W13 9NL','51.5094645','-0.3131198','2011-01-02 22:19:15','2011-01-02 22:19:15'),(95,2,'Hounslow, London W4 2BB, UK',1,'W4 2BB','51.4907867','-0.2595324','2011-01-02 22:20:03','2011-01-02 22:20:03'),(96,2,'Ealing, London W13 0DH, UK',1,'W13 0DH','51.5227828','-0.3288731','2011-01-02 22:20:12','2011-01-02 22:20:12'),(97,2,'53-61 Croham Rd, Croydon, Greater London CR2 7, UK',1,'CR2 7','51.3603387','-0.0842888','2011-01-02 22:20:27','2011-01-02 22:20:27'),(98,2,'21-26 Hillside Close, Merton, Greater London SM4 4, UK',1,'SM4 4','51.4002813','-0.2152647','2011-01-02 22:20:55','2011-01-02 22:20:55'),(99,2,'Thornton Heath, Greater London CR7 7DR, UK',1,'CR7 7DR','51.3988221','-0.1104104','2011-01-02 22:21:00','2011-01-02 22:21:00'),(100,2,'2-34 Kelsey Way, Bromley, Greater London BR3 3, UK',1,'BR3 3','51.4013863','-0.0270143','2011-01-02 22:21:03','2011-01-02 22:21:03'),(101,2,'2-52 Ticehurst Rd, Lewisham, Greater London SE23 2, UK',1,'SE23 2','51.4359265','-0.0393906','2011-01-02 22:21:04','2011-01-02 22:21:04'),(102,2,'2-46 Kellerton Rd, Lewisham, Greater London SE13 5, UK',1,'SE13 5','51.4549940','0.0013798','2011-01-02 22:21:08','2011-01-02 22:21:08'),(103,2,'15-21 Mells Crescent, Bromley, Greater London SE9 4, UK',1,'SE9 4','51.4255236','0.0493137','2011-01-02 22:21:09','2011-01-02 22:21:09'),(104,2,'83-133 Herbert Rd, Eltham, Greater London SE18 3, UK',1,'SE18 3','51.4783309','0.0668581','2011-01-02 22:21:11','2011-01-02 22:21:11'),(105,2,'17-31 Keyes Rd, Dartford, Kent DA1 5, UK',1,'DA1 5','51.4537054','0.2303763','2011-01-02 22:21:17','2011-01-02 22:21:17'),(106,2,'14-36 Jenningtree Rd, Crayford, Greater London DA8 2, UK',1,'DA8 2','51.4737307','0.1980599','2011-01-02 22:21:19','2011-01-02 22:21:19'),(107,2,'87 Springfield Gardens, Romford, Greater London RM14 3, UK',1,'RM14 3','51.5525662','0.2551529','2011-01-02 22:21:22','2011-01-02 22:21:22'),(108,2,'19-35 Acacia Gardens, Romford, Greater London RM14 1, UK',1,'RM14 1','51.5677908','0.2788790','2011-01-02 22:21:28','2011-01-02 22:21:28'),(109,2,'6-16 Settle Rd, Romford, Greater London RM3 9, UK',1,'RM3 9','51.6095480','0.2397070','2011-01-02 22:21:30','2011-01-02 22:21:30'),(110,2,'195 Clockhouse Ln, Romford, Greater London RM5 2, UK',1,'RM5 2','51.6085637','0.1656671','2011-01-02 22:21:32','2011-01-02 22:21:32'),(111,2,'32-36 Fairview Rd, Ilford, Greater London IG7 6, UK',1,'IG7 6','51.6131774','0.0982983','2011-01-02 22:21:36','2011-01-02 22:21:36'),(112,2,'1-9 Southern Dr, Loughton, Essex IG10 3, UK',1,'IG10 3','51.6376751','0.0625791','2011-01-02 22:21:39','2011-01-02 22:21:39'),(113,2,'106 Colebrook Ln, Loughton, Essex IG10 2, UK',1,'IG10 2','51.6597805','0.0846731','2011-01-02 22:21:40','2011-01-02 22:21:40'),(114,2,'West Bromwich, West Midlands B70 8PJ, UK',1,'B70 8PJ','52.5174592','-2.0021816','2011-01-02 22:22:32','2011-01-02 22:22:32'),(115,2,'33-51 Wills St, Birmingham B19 1, UK',1,'B19 1','52.5010041','-1.9124989','2011-01-02 22:22:40','2011-01-02 22:22:40'),(116,2,'79 Eyre St, Birmingham B18 7, UK',1,'B18 7','52.4841516','-1.9272857','2011-01-02 22:22:42','2011-01-02 22:22:42'),(117,2,'51-69 Arden Rd, West Bromwich, Sandwell B67 6, UK',1,'B67 6','52.4898940','-1.9702777','2011-01-02 22:22:56','2011-01-02 22:22:56');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertytypes`
--

DROP TABLE IF EXISTS `propertytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `comment` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertytypes`
--

LOCK TABLES `propertytypes` WRITE;
/*!40000 ALTER TABLE `propertytypes` DISABLE KEYS */;
INSERT INTO `propertytypes` VALUES (1,'flat',''),(2,'apartment',''),(3,'house',''),(4,'maisonette',''),(5,'studio',''),(6,'room',''),(7,'bedsit',''),(8,'other','');
/*!40000 ALTER TABLE `propertytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) CHARACTER SET latin1 NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20110101203803'),('20110101233058');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(16) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'1033864170','Art','Deineka','fighting_1r1sh@yahoo.ie',NULL,'2011-01-01 20:25:30','2011-01-01 20:25:30'),(2,'837178900','Svetlana','Kleimenova','mstemper1@gmail.com',NULL,'2011-01-02 00:06:57','2011-01-02 00:06:57');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `llfb`
--

USE `llfb`;

--
-- Final view structure for view `feedbackproperties`
--

/*!50001 DROP TABLE IF EXISTS `feedbackproperties`*/;
/*!50001 DROP VIEW IF EXISTS `feedbackproperties`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`llfb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `feedbackproperties` AS select `properties`.`id` AS `id`,ifnull(round(avg(`entries`.`rating`),0),0) AS `rating`,`properties`.`address` AS `address`,ucase(`properties`.`postcode`) AS `postcode`,`properties`.`lat` AS `lat`,`properties`.`lng` AS `lng`,`properties`.`propertytype_id` AS `propertytype_id`,`properties`.`updated_at` AS `updated_at`,`properties`.`user_id` AS `user_id` from ((`properties` left join `feedbacks` on((`feedbacks`.`property_id` = `properties`.`id`))) left join `entries` on((`entries`.`feedback_id` = `feedbacks`.`id`))) group by `properties`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `llfb`
--

USE `llfb`;

--
-- Final view structure for view `feedbackproperties`
--

/*!50001 DROP TABLE IF EXISTS `feedbackproperties`*/;
/*!50001 DROP VIEW IF EXISTS `feedbackproperties`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`llfb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `feedbackproperties` AS select `properties`.`id` AS `id`,ifnull(round(avg(`entries`.`rating`),0),0) AS `rating`,`properties`.`address` AS `address`,ucase(`properties`.`postcode`) AS `postcode`,`properties`.`lat` AS `lat`,`properties`.`lng` AS `lng`,`properties`.`propertytype_id` AS `propertytype_id`,`properties`.`updated_at` AS `updated_at`,`properties`.`user_id` AS `user_id` from ((`properties` left join `feedbacks` on((`feedbacks`.`property_id` = `properties`.`id`))) left join `entries` on((`entries`.`feedback_id` = `feedbacks`.`id`))) group by `properties`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-01-02 22:32:09
