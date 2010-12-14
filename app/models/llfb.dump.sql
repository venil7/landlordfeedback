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
  `entry_id` int(11) DEFAULT NULL,
  `feedback_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `text` varchar(400) NOT NULL,
  `abuse` int(11) NOT NULL DEFAULT '0' COMMENT 'increases with every abuse report',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,NULL,NULL,NULL,2,'some text',2,'2010-11-28 13:19:34'),(2,NULL,NULL,NULL,2,'some text',6,'2010-11-28 13:20:34'),(6,NULL,NULL,17,2,'some comments',0,'2010-11-28 22:36:44'),(4,NULL,NULL,NULL,2,'some text',7,'0000-00-00 00:00:00'),(5,NULL,NULL,NULL,2,'ASDAFWCFW',1,'0000-00-00 00:00:00'),(7,NULL,NULL,17,2,'some comments',0,'2010-11-28 22:37:19'),(8,NULL,NULL,17,2,'some comments',0,'2010-11-28 22:37:45'),(9,NULL,21,NULL,2,'some text',0,'2010-11-28 22:46:56'),(10,NULL,21,NULL,2,'some text',0,'2010-11-28 22:47:12'),(11,NULL,NULL,17,2,'sss',0,'2010-11-28 22:47:32'),(12,NULL,NULL,17,2,'another comment',0,'2010-11-28 22:56:21'),(13,NULL,NULL,17,2,'@@comm',0,'2010-11-28 22:58:15'),(14,NULL,23,NULL,2,'sssssssssssss',0,'2010-11-28 23:01:38'),(15,NULL,23,NULL,2,'xxxxxxxxxxxxxxxxxxx',0,'2010-11-28 23:01:49'),(16,NULL,18,NULL,2,'my latest comment',0,'2010-12-04 15:28:51'),(17,NULL,NULL,15,2,'qwerty comment!!',0,'2010-12-04 15:36:10'),(18,NULL,14,NULL,3,'Some comments by svetlana ;))',0,'2010-12-12 10:12:31'),(19,NULL,14,NULL,2,'Some comments by Art ;)',0,'2010-12-12 10:16:00'),(20,NULL,14,NULL,2,'another one',0,'2010-12-12 10:17:37');
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (1,1,1,2,'very baad apartment',1,'2010-10-17 22:04:44'),(2,3,1,2,'very bad landlord',1,'2010-10-17 22:05:28'),(9,4,15,2,'neigbours are very good',0,'2010-10-24 02:02:47'),(8,2,15,2,'shittiest agency ever',0,'2010-10-24 01:20:14'),(7,2,15,2,'agency just suxx',3,'2010-10-24 00:21:33'),(10,3,15,2,'area is so-so',3,'2010-10-24 02:03:59'),(11,2,8,2,'suxx',1,'2010-10-25 20:50:46'),(12,3,8,2,'<a href=\'http://google.com\'>click me </a>',3,'2010-10-25 20:55:01'),(13,1,16,2,'<a href=\'#\'>sss</a>',3,'2010-10-25 21:03:40'),(14,2,13,2,'some text',3,'2010-10-25 21:23:51'),(15,1,17,2,'Very decent landlord',5,'2010-10-31 10:15:20'),(16,2,17,2,'Agency, is so so, but it didnt matter',3,'2010-10-31 10:15:48'),(17,4,17,2,'neighbours are fine',4,'2010-10-31 10:16:02'),(18,3,17,2,'are is good',5,'2010-10-31 10:16:16'),(19,2,18,2,'agency suxx',2,'2010-11-20 18:56:16'),(20,3,18,2,'rea is all right',3,'2010-11-20 20:45:10'),(21,3,21,2,'area is allriigh',3,'2010-11-28 12:31:11'),(22,2,22,2,'agency suxx',2,'2010-11-28 20:23:25'),(23,3,23,2,'qaqaqasdsds',5,'2010-11-28 23:01:14'),(24,1,23,2,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',5,'2010-11-28 23:02:03'),(25,1,25,2,'its all right',3,'2010-12-14 15:08:17');
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,'Ladnlord Feedback','Anything you have to say about landlord..'),(2,'Agency','Anything you want to say about agency'),(3,'Area','Anything you want to say about area'),(4,'Neighbours','Anything about neighbours ');
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
  `landlord` varchar(50) CHARACTER SET latin1 NOT NULL,
  `agency` varchar(50) CHARACTER SET latin1 NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (15,11,2,12,'2010-10-31','some name','some agency','2010-11-01 19:47:01'),(8,15,2,12,'2010-10-31','aaaaaaaaaaa','sssssssssss','2010-11-01 19:47:01'),(14,15,2,1,'2010-10-31','aaaa','fffff','2010-11-01 19:47:01'),(13,15,2,1,'2010-10-31','landlord','agency','2010-11-01 19:47:01'),(16,15,2,12,'2010-10-31','<a >xxx</a>','<a >xxx</a>','2010-11-01 19:47:01'),(17,16,2,6,'2009-10-01','John Smith','Northfiels','2010-11-01 19:47:01'),(18,17,2,6,'2010-12-12','aaaaaaa','','2010-11-20 15:06:49'),(19,17,2,6,'1982-03-22','aaaaaaa','','2010-11-20 15:08:15'),(20,17,2,6,'2010-12-12','some fucker','','2010-11-20 15:35:02'),(21,17,2,48,'2010-12-12','','bad agency','2010-11-20 15:52:23'),(22,16,2,12,'1982-03-22','some fucker','agency 1','2010-11-28 20:21:04'),(23,17,2,6,'2010-12-12','ssssssss','xxxxxxxxxxxxxxx','2010-11-28 22:58:27'),(24,22,2,18,'2010-12-31','David Smith','Easter Estates, PLC','2010-12-14 14:53:16'),(25,14,2,18,'2010-12-07','David Smith','Central London Estates, Ltd','2010-12-14 15:00:35');
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
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,14,'2010-12-12 16:07:22','2010-12-12 16:07:22','ubuntu-gold-sur-bois.jpg','image/jpeg',139913,'2010-12-12 16:07:22'),(2,14,'2010-12-12 16:07:51','2010-12-12 16:07:51','ubuntu-gold-sur-bois.jpg','image/jpeg',139913,'2010-12-12 16:07:51'),(3,14,'2010-12-12 16:08:10','2010-12-12 16:08:10','scorched-sydney.jpg','image/jpeg',48202,'2010-12-12 16:08:09'),(4,14,'2010-12-12 16:09:15','2010-12-12 16:09:15','Ubu_Icon2.png','image/png',78871,'2010-12-12 16:09:15'),(5,14,'2010-12-12 16:11:54','2010-12-12 16:11:54','Ubu_Icon2.png','image/png',78871,'2010-12-12 16:11:54'),(6,14,'2010-12-12 16:17:35','2010-12-12 16:17:35','scorched-sydney.jpg','image/jpeg',48202,'2010-12-12 16:17:35'),(7,24,'2010-12-14 14:58:46','2010-12-14 14:58:46','man swimming by slum.jpg','image/jpeg',54933,'2010-12-14 14:58:45'),(8,25,'2010-12-14 15:08:33','2010-12-14 15:08:33','man swimming by slum.jpg','image/jpeg',54933,'2010-12-14 15:08:32');
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Welcome to Landlord Feedback','landlordfeedback@gmail.com','Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?','2010-12-06 20:22:00','2010-12-06 20:22:00');
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
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (12,1,'some address',2,'w110rl','51.5128532','-0.2064232','2010-11-01 19:47:34'),(15,5,'Not far from ealing common',2,'w57xy','51.5133102','-0.3015194','2010-11-01 19:47:34'),(14,2,'wimbledon',2,'sw190rl','51.4255246','-0.2079919','2010-11-01 19:47:34'),(11,3,'sme adderss',2,'w130rl','51.5112045','-0.3291383','2010-11-01 19:47:34'),(16,2,'3 northfields avenue',2,'w133rl','51.5132486','-0.3222908','2010-11-01 19:47:34'),(17,3,'9 Northfields road',2,'w139rt','51.5034118','-0.3168871','2010-11-01 20:51:09'),(18,4,'closer to center',2,'w40rl','51.4884455','-0.2644328','2010-11-04 22:29:24'),(19,1,'Hammersmith, London W12 0RL, UK',2,'w120rl','51.5121634','-0.2397666','2010-11-18 21:47:44'),(20,1,'Hammersmith, London W12 0RG, UK',2,'w120rg','51.5152502','-0.2387253','2010-11-19 13:42:54'),(21,2,'Lambeth, London SW12 0AA, UK',2,'sw120aa','51.4482630','-0.1424348','2010-11-19 13:47:22'),(22,1,'London E12, UK',2,'e12 0rl','51.5531202','0.0499553','2010-11-19 16:31:08'),(23,1,'1-19 Greenham Close, Lambeth, Greater London SE1 7, UK',2,'SE175UU','51.4994080','-0.1109391','2010-11-20 12:47:33'),(24,1,'Wolverhampton, West Midlands WV1 4SA, UK',2,'wv14sa','52.5867040','-2.1415773','2010-11-21 13:43:26'),(25,3,'Wolverhampton WV2, UK',2,'WV24SA','52.5771935','-2.1178501','2010-11-21 13:49:15'),(26,1,'5-9 Bridge St, Westminster, London SW1A 2, UK',2,'SW1A2BB','51.5008793','-0.1246457','2010-11-22 22:29:33'),(27,1,'N Circular Rd, Ealing, Greater London W5 1, UK',2,'W514RL','51.5315164','-0.2937811','2010-11-23 22:07:48'),(28,1,'14 Eccleston Rd, Ealing, Greater London W7 3, UK',2,'W30RL','51.5107310','-0.3283969','2010-12-14 01:20:12');
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertytypes`
--

LOCK TABLES `propertytypes` WRITE;
/*!40000 ALTER TABLE `propertytypes` DISABLE KEYS */;
INSERT INTO `propertytypes` VALUES (1,'flat',''),(2,'apartment',''),(3,'house',''),(4,'mansion',''),(5,'studio',''),(6,'room','');
/*!40000 ALTER TABLE `propertytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20101204101103'),('20101204103647'),('20101204131924'),('20101204185032'),('20101204185434'),('20101204185823'),('20101206195354');
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'1234','art','deineka','a@one.lv',NULL,'2010-12-04 14:38:57','2010-12-04 14:38:57'),(2,'1033864170','Art','Deineka','fighting_1r1sh@yahoo.ie',NULL,'2010-12-04 15:00:21','2010-12-04 15:00:21'),(3,'837178900','Svetlana','Kleimenova','mstemper1@gmail.com',NULL,'2010-12-04 15:03:10','2010-12-04 15:03:10'),(4,'6789','test',NULL,NULL,NULL,'2010-12-04 15:32:00','2010-12-04 15:32:00');
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
  `entry_id` int(11) DEFAULT NULL,
  `feedback_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `text` varchar(400) NOT NULL,
  `abuse` int(11) NOT NULL DEFAULT '0' COMMENT 'increases with every abuse report',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,NULL,NULL,NULL,2,'some text',2,'2010-11-28 13:19:34'),(2,NULL,NULL,NULL,2,'some text',6,'2010-11-28 13:20:34'),(6,NULL,NULL,17,2,'some comments',0,'2010-11-28 22:36:44'),(4,NULL,NULL,NULL,2,'some text',7,'0000-00-00 00:00:00'),(5,NULL,NULL,NULL,2,'ASDAFWCFW',1,'0000-00-00 00:00:00'),(7,NULL,NULL,17,2,'some comments',0,'2010-11-28 22:37:19'),(8,NULL,NULL,17,2,'some comments',0,'2010-11-28 22:37:45'),(9,NULL,21,NULL,2,'some text',0,'2010-11-28 22:46:56'),(10,NULL,21,NULL,2,'some text',0,'2010-11-28 22:47:12'),(11,NULL,NULL,17,2,'sss',0,'2010-11-28 22:47:32'),(12,NULL,NULL,17,2,'another comment',0,'2010-11-28 22:56:21'),(13,NULL,NULL,17,2,'@@comm',0,'2010-11-28 22:58:15'),(14,NULL,23,NULL,2,'sssssssssssss',0,'2010-11-28 23:01:38'),(15,NULL,23,NULL,2,'xxxxxxxxxxxxxxxxxxx',0,'2010-11-28 23:01:49'),(16,NULL,18,NULL,2,'my latest comment',0,'2010-12-04 15:28:51'),(17,NULL,NULL,15,2,'qwerty comment!!',0,'2010-12-04 15:36:10'),(18,NULL,14,NULL,3,'Some comments by svetlana ;))',0,'2010-12-12 10:12:31'),(19,NULL,14,NULL,2,'Some comments by Art ;)',0,'2010-12-12 10:16:00'),(20,NULL,14,NULL,2,'another one',0,'2010-12-12 10:17:37');
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (1,1,1,2,'very baad apartment',1,'2010-10-17 22:04:44'),(2,3,1,2,'very bad landlord',1,'2010-10-17 22:05:28'),(9,4,15,2,'neigbours are very good',0,'2010-10-24 02:02:47'),(8,2,15,2,'shittiest agency ever',0,'2010-10-24 01:20:14'),(7,2,15,2,'agency just suxx',3,'2010-10-24 00:21:33'),(10,3,15,2,'area is so-so',3,'2010-10-24 02:03:59'),(11,2,8,2,'suxx',1,'2010-10-25 20:50:46'),(12,3,8,2,'<a href=\'http://google.com\'>click me </a>',3,'2010-10-25 20:55:01'),(13,1,16,2,'<a href=\'#\'>sss</a>',3,'2010-10-25 21:03:40'),(14,2,13,2,'some text',3,'2010-10-25 21:23:51'),(15,1,17,2,'Very decent landlord',5,'2010-10-31 10:15:20'),(16,2,17,2,'Agency, is so so, but it didnt matter',3,'2010-10-31 10:15:48'),(17,4,17,2,'neighbours are fine',4,'2010-10-31 10:16:02'),(18,3,17,2,'are is good',5,'2010-10-31 10:16:16'),(19,2,18,2,'agency suxx',2,'2010-11-20 18:56:16'),(20,3,18,2,'rea is all right',3,'2010-11-20 20:45:10'),(21,3,21,2,'area is allriigh',3,'2010-11-28 12:31:11'),(22,2,22,2,'agency suxx',2,'2010-11-28 20:23:25'),(23,3,23,2,'qaqaqasdsds',5,'2010-11-28 23:01:14'),(24,1,23,2,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',5,'2010-11-28 23:02:03'),(25,1,25,2,'its all right',3,'2010-12-14 15:08:17');
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,'Ladnlord Feedback','Anything you have to say about landlord..'),(2,'Agency','Anything you want to say about agency'),(3,'Area','Anything you want to say about area'),(4,'Neighbours','Anything about neighbours ');
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
  `landlord` varchar(50) CHARACTER SET latin1 NOT NULL,
  `agency` varchar(50) CHARACTER SET latin1 NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (15,11,2,12,'2010-10-31','some name','some agency','2010-11-01 19:47:01'),(8,15,2,12,'2010-10-31','aaaaaaaaaaa','sssssssssss','2010-11-01 19:47:01'),(14,15,2,1,'2010-10-31','aaaa','fffff','2010-11-01 19:47:01'),(13,15,2,1,'2010-10-31','landlord','agency','2010-11-01 19:47:01'),(16,15,2,12,'2010-10-31','<a >xxx</a>','<a >xxx</a>','2010-11-01 19:47:01'),(17,16,2,6,'2009-10-01','John Smith','Northfiels','2010-11-01 19:47:01'),(18,17,2,6,'2010-12-12','aaaaaaa','','2010-11-20 15:06:49'),(19,17,2,6,'1982-03-22','aaaaaaa','','2010-11-20 15:08:15'),(20,17,2,6,'2010-12-12','some fucker','','2010-11-20 15:35:02'),(21,17,2,48,'2010-12-12','','bad agency','2010-11-20 15:52:23'),(22,16,2,12,'1982-03-22','some fucker','agency 1','2010-11-28 20:21:04'),(23,17,2,6,'2010-12-12','ssssssss','xxxxxxxxxxxxxxx','2010-11-28 22:58:27'),(24,22,2,18,'2010-12-31','David Smith','Easter Estates, PLC','2010-12-14 14:53:16'),(25,14,2,18,'2010-12-07','David Smith','Central London Estates, Ltd','2010-12-14 15:00:35');
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
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,14,'2010-12-12 16:07:22','2010-12-12 16:07:22','ubuntu-gold-sur-bois.jpg','image/jpeg',139913,'2010-12-12 16:07:22'),(2,14,'2010-12-12 16:07:51','2010-12-12 16:07:51','ubuntu-gold-sur-bois.jpg','image/jpeg',139913,'2010-12-12 16:07:51'),(3,14,'2010-12-12 16:08:10','2010-12-12 16:08:10','scorched-sydney.jpg','image/jpeg',48202,'2010-12-12 16:08:09'),(4,14,'2010-12-12 16:09:15','2010-12-12 16:09:15','Ubu_Icon2.png','image/png',78871,'2010-12-12 16:09:15'),(5,14,'2010-12-12 16:11:54','2010-12-12 16:11:54','Ubu_Icon2.png','image/png',78871,'2010-12-12 16:11:54'),(6,14,'2010-12-12 16:17:35','2010-12-12 16:17:35','scorched-sydney.jpg','image/jpeg',48202,'2010-12-12 16:17:35'),(7,24,'2010-12-14 14:58:46','2010-12-14 14:58:46','man swimming by slum.jpg','image/jpeg',54933,'2010-12-14 14:58:45'),(8,25,'2010-12-14 15:08:33','2010-12-14 15:08:33','man swimming by slum.jpg','image/jpeg',54933,'2010-12-14 15:08:32');
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Welcome to Landlord Feedback','landlordfeedback@gmail.com','Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?','2010-12-06 20:22:00','2010-12-06 20:22:00');
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
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (12,1,'some address',2,'w110rl','51.5128532','-0.2064232','2010-11-01 19:47:34'),(15,5,'Not far from ealing common',2,'w57xy','51.5133102','-0.3015194','2010-11-01 19:47:34'),(14,2,'wimbledon',2,'sw190rl','51.4255246','-0.2079919','2010-11-01 19:47:34'),(11,3,'sme adderss',2,'w130rl','51.5112045','-0.3291383','2010-11-01 19:47:34'),(16,2,'3 northfields avenue',2,'w133rl','51.5132486','-0.3222908','2010-11-01 19:47:34'),(17,3,'9 Northfields road',2,'w139rt','51.5034118','-0.3168871','2010-11-01 20:51:09'),(18,4,'closer to center',2,'w40rl','51.4884455','-0.2644328','2010-11-04 22:29:24'),(19,1,'Hammersmith, London W12 0RL, UK',2,'w120rl','51.5121634','-0.2397666','2010-11-18 21:47:44'),(20,1,'Hammersmith, London W12 0RG, UK',2,'w120rg','51.5152502','-0.2387253','2010-11-19 13:42:54'),(21,2,'Lambeth, London SW12 0AA, UK',2,'sw120aa','51.4482630','-0.1424348','2010-11-19 13:47:22'),(22,1,'London E12, UK',2,'e12 0rl','51.5531202','0.0499553','2010-11-19 16:31:08'),(23,1,'1-19 Greenham Close, Lambeth, Greater London SE1 7, UK',2,'SE175UU','51.4994080','-0.1109391','2010-11-20 12:47:33'),(24,1,'Wolverhampton, West Midlands WV1 4SA, UK',2,'wv14sa','52.5867040','-2.1415773','2010-11-21 13:43:26'),(25,3,'Wolverhampton WV2, UK',2,'WV24SA','52.5771935','-2.1178501','2010-11-21 13:49:15'),(26,1,'5-9 Bridge St, Westminster, London SW1A 2, UK',2,'SW1A2BB','51.5008793','-0.1246457','2010-11-22 22:29:33'),(27,1,'N Circular Rd, Ealing, Greater London W5 1, UK',2,'W514RL','51.5315164','-0.2937811','2010-11-23 22:07:48'),(28,1,'14 Eccleston Rd, Ealing, Greater London W7 3, UK',2,'W30RL','51.5107310','-0.3283969','2010-12-14 01:20:12');
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertytypes`
--

LOCK TABLES `propertytypes` WRITE;
/*!40000 ALTER TABLE `propertytypes` DISABLE KEYS */;
INSERT INTO `propertytypes` VALUES (1,'flat',''),(2,'apartment',''),(3,'house',''),(4,'mansion',''),(5,'studio',''),(6,'room','');
/*!40000 ALTER TABLE `propertytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20101204101103'),('20101204103647'),('20101204131924'),('20101204185032'),('20101204185434'),('20101204185823'),('20101206195354');
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'1234','art','deineka','a@one.lv',NULL,'2010-12-04 14:38:57','2010-12-04 14:38:57'),(2,'1033864170','Art','Deineka','fighting_1r1sh@yahoo.ie',NULL,'2010-12-04 15:00:21','2010-12-04 15:00:21'),(3,'837178900','Svetlana','Kleimenova','mstemper1@gmail.com',NULL,'2010-12-04 15:03:10','2010-12-04 15:03:10'),(4,'6789','test',NULL,NULL,NULL,'2010-12-04 15:32:00','2010-12-04 15:32:00');
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

-- Dump completed on 2010-12-14 21:09:53
