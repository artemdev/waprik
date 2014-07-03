-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: waprik_production
-- ------------------------------------------------------
-- Server version	5.5.31-0+wheezy1-log

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
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `hashed_password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'Art',NULL,NULL,'37e2ad802009d9c7aab4d20159fb2d4f5bb746a2','506435d7dd39564571185bd03c20cab7ba64109e',NULL,'2014-01-07 10:19:19','2014-01-07 10:19:49');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `for_videos` tinyint(1) DEFAULT NULL,
  `for_serials` tinyint(1) DEFAULT NULL,
  `for_news` tinyint(1) DEFAULT NULL,
  `for_music` tinyint(1) DEFAULT NULL,
  `categorable_id` int(11) DEFAULT NULL,
  `categorable_type` varchar(255) DEFAULT NULL,
  `for_pictures` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Юмор / Приколы','2014-01-07 10:32:07','2014-03-01 18:19:20',1,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Вдохновение / Мотивация','2014-01-08 22:06:16','2014-03-01 18:19:33',1,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Таланты / Невероятное','2014-01-10 20:52:28','2014-03-01 18:19:44',1,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Розыгрыши и пранки','2014-02-07 09:13:26','2014-03-01 18:20:14',1,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Клипы','2014-02-26 13:23:52','2014-02-26 13:28:53',1,0,0,NULL,NULL,NULL,NULL),(7,'фантастика','2014-03-01 17:24:08','2014-03-01 17:24:21',0,1,0,NULL,NULL,NULL,NULL),(8,'история','2014-03-01 17:48:23','2014-03-01 17:48:23',0,1,0,NULL,NULL,NULL,NULL),(9,'комедия','2014-03-02 21:05:17','2014-03-02 21:05:17',0,1,0,NULL,NULL,NULL,NULL),(10,'криминал','2014-03-06 13:21:02','2014-03-06 13:21:02',0,1,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_music`
--

DROP TABLE IF EXISTS `categories_music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_music` (
  `music_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  KEY `index_categories_music_on_music_id_and_category_id` (`music_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_music`
--

LOCK TABLES `categories_music` WRITE;
/*!40000 ALTER TABLE `categories_music` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_news`
--

DROP TABLE IF EXISTS `categories_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_news` (
  `category_id` int(11) DEFAULT NULL,
  `news_id` int(11) DEFAULT NULL,
  KEY `index_categories_news_on_news_id_and_category_id` (`news_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_news`
--

LOCK TABLES `categories_news` WRITE;
/*!40000 ALTER TABLE `categories_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_serials`
--

DROP TABLE IF EXISTS `categories_serials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_serials` (
  `category_id` int(11) DEFAULT NULL,
  `serial_id` int(11) DEFAULT NULL,
  KEY `index_categories_serials_on_category_id_and_serial_id` (`category_id`,`serial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_serials`
--

LOCK TABLES `categories_serials` WRITE;
/*!40000 ALTER TABLE `categories_serials` DISABLE KEYS */;
INSERT INTO `categories_serials` VALUES (7,2),(7,2),(7,2),(7,2),(7,2),(7,2),(7,2),(7,6),(7,8),(7,8),(7,11),(7,11),(7,11),(8,3),(9,5),(9,5),(10,6),(10,6);
/*!40000 ALTER TABLE `categories_serials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_videos`
--

DROP TABLE IF EXISTS `categories_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_videos` (
  `category_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  KEY `index_categories_videos_on_video_id_and_category_id` (`video_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_videos`
--

LOCK TABLES `categories_videos` WRITE;
/*!40000 ALTER TABLE `categories_videos` DISABLE KEYS */;
INSERT INTO `categories_videos` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(2,18),(2,19),(2,20),(2,21),(2,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(4,29),(4,30),(4,31),(3,32),(3,33),(1,34),(1,35),(1,36),(1,37),(6,38),(6,39),(6,40),(6,41),(6,42),(6,43),(6,44),(6,45),(6,46),(6,47),(6,48),(6,49),(6,50),(6,51),(1,52),(1,53),(3,54),(3,55),(1,56),(1,57),(1,58),(1,59),(6,60),(6,61),(6,62),(6,64),(6,65),(6,66);
/*!40000 ALTER TABLE `categories_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `hit` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `with_videos` tinyint(1) DEFAULT '0',
  `with_music` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` VALUES (1,'приколы с животными (коты)',0,'2014-01-07 12:40:24','2014-01-07 12:40:24',1,0),(2,'приколы с животными (собаки)',0,'2014-01-07 12:42:35','2014-01-07 12:42:35',1,0),(3,'смешные рекламы',0,'2014-01-07 12:48:31','2014-01-07 12:48:31',1,0),(4,'подборки приколов',0,'2014-01-08 10:08:47','2014-01-08 10:08:47',1,0),(5,'сильные речи',0,'2014-01-08 22:16:44','2014-01-08 22:16:44',1,0),(6,'футбол',0,'2014-01-10 21:00:37','2014-01-10 21:00:37',1,0),(7,'экстрим',0,'2014-02-07 09:11:59','2014-02-07 09:11:59',1,0),(8,'фокусы',0,'2014-02-08 16:48:23','2014-02-08 16:48:23',1,0),(9,'коты',0,'2014-02-08 16:50:04','2014-02-08 16:50:04',1,0),(10,'приколы со знаменитостями',0,'2014-02-08 16:54:00','2014-02-08 16:54:00',1,0),(11,'рэп',0,'2014-02-27 10:40:22','2014-02-27 10:40:22',1,0),(12,'сексуальные клипы',0,'2014-02-28 09:11:42','2014-02-28 09:11:42',1,0),(13,'хиты 2014 (СНГ)',0,'2014-02-28 09:16:40','2014-02-28 09:16:40',1,0),(14,'хиты 2014 (зарубежные)',0,'2014-02-28 09:17:08','2014-02-28 09:17:08',1,0);
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections_music`
--

DROP TABLE IF EXISTS `collections_music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections_music` (
  `music_id` int(11) DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  KEY `index_collections_music_on_music_id_and_collection_id` (`music_id`,`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections_music`
--

LOCK TABLES `collections_music` WRITE;
/*!40000 ALTER TABLE `collections_music` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections_music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections_videos`
--

DROP TABLE IF EXISTS `collections_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections_videos` (
  `video_id` int(11) DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  KEY `index_collections_videos_on_video_id_and_collection_id` (`video_id`,`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections_videos`
--

LOCK TABLES `collections_videos` WRITE;
/*!40000 ALTER TABLE `collections_videos` DISABLE KEYS */;
INSERT INTO `collections_videos` VALUES (1,1),(2,2),(3,1),(5,2),(6,3),(9,2),(10,4),(11,4),(13,3),(15,1),(17,3),(18,5),(19,5),(20,5),(22,5),(26,6),(28,7),(33,8),(34,9),(35,9),(36,10),(37,10),(49,14),(52,11),(64,12),(65,13),(66,13);
/*!40000 ALTER TABLE `collections_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_feedbacks_on_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `music` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hit` tinyint(1) DEFAULT NULL,
  `downloads` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `link_orig` varchar(255) DEFAULT NULL,
  `link_128` varchar(255) DEFAULT NULL,
  `link_64` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (4,'Всем привет! Сегодня добавлены такие классные видео: <br />\r\n<b>Таланты / Невероятное</b> <a href=\"http://t.waprik.ru/video/show/32?category_id=3\">Парень творит чудеса на бильярдном столе</a>,  <a href=\"http://t.waprik.ru/video/show/31?category_id=3\">Крутой танец в стиле locking на America\'s Got Talent</a>,  <a href=\"http://t.waprik.ru/video/show/30?category_id=3\">Нереальное владение телом под DubStep</a>,  <a href=\"http://t.waprik.ru/video/show/28?category_id=3\">Невероятные мгновения из экстримальной жизни</a> <br />\r\n<b>Розыгрыши и пранки</b> <a href=\"http://t.waprik.ru/video/show/29?category_id=4\">Случайный человек руководит целым оркестром!</a> <br />\r\nОтличного всем настроения и побольше хороших людей вокруг!','video',NULL,'2014-02-07 12:16:57','2014-02-07 12:18:24',NULL),(5,'Привет! Сегодня подымаем настроение такими видео: <br />\r\n<b>Приколы</b> <a href=\"http://t.waprik.ru/video/show/34?category_id=1\">Друг, который вечно спит </a>,  <a href=\"http://t.waprik.ru/video/show/37?category_id=1\">Как снимали хоббита :)</a>,  <a href=\"http://t.waprik.ru/video/show/36?category_id=1\">Интересный вопрос путину</a>,  <a href=\"http://t.waprik.ru/video/show/35?category_id=1\">Енот украл корм </a><br />\r\n<b>Таланты</b>: <a href=\"http://t.waprik.ru/video/show/33?category_id=3\">Отличные фокусы :)</a><br />\r\nПриятного всем вечера :)','video',NULL,'2014-02-08 17:00:06','2014-02-08 17:16:42',NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `downloads` int(11) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `erotic` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pictures_on_author_id` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` VALUES (3,'9YP0GriSbOM.jpg',7189,NULL,NULL,'2014-03-14 08:18:13','2014-07-03 11:19:26',1),(6,'Dx1sFhVNy6A.jpg',2902,NULL,NULL,'2014-03-14 08:18:31','2014-07-03 10:21:43',1),(7,'Ey9Tevi7nGs.jpg',5574,NULL,NULL,'2014-03-14 08:18:37','2014-07-03 11:17:52',1),(10,'lupWbOjifak.jpg',4452,NULL,NULL,'2014-03-14 08:18:59','2014-07-03 11:11:34',1),(13,'Rxz-eqBgNqw.jpg',4015,NULL,NULL,'2014-03-14 08:31:17','2014-07-03 11:15:55',1),(14,'XmOoHr13JJE.jpg',2586,NULL,NULL,'2014-03-14 08:31:37','2014-07-03 10:19:33',1),(15,'8tSC7akvlkU.jpg',2027,NULL,NULL,'2014-03-14 08:38:34','2014-07-03 10:19:08',1),(16,'9keqA7ZU1lk.jpg',2553,NULL,NULL,'2014-03-14 08:38:45','2014-07-03 11:07:12',1),(21,'m7LdMMZ-fCI.jpg',1898,NULL,NULL,'2014-03-14 08:46:38','2014-07-03 06:13:39',1),(22,'BbWhMp9WJyc.jpg',4694,NULL,NULL,'2014-03-14 08:47:44','2014-07-03 06:13:25',1),(23,'4FOZdcn9gGM.jpg',3641,NULL,NULL,'2014-03-14 08:48:51','2014-07-03 10:57:41',1),(24,'HjVesCnaLh4.jpg',2833,NULL,NULL,'2014-03-14 08:52:07','2014-07-03 06:12:48',1),(26,'WuxkepJ5prs.jpg',2657,NULL,NULL,'2014-03-15 06:27:52','2014-07-03 10:46:59',1),(29,'JvS5YDmr-DY.jpg',5055,NULL,NULL,'2014-03-15 09:45:10','2014-07-03 10:47:17',1),(30,'qLbr4tKszSk.jpg',3755,NULL,NULL,'2014-03-15 09:58:03','2014-07-03 10:15:58',1),(32,'D_ruPRRoVls.jpg',5663,NULL,NULL,'2014-03-15 09:58:26','2014-07-03 11:24:38',1),(34,'1_3Zv_NCjoM.jpg',2867,NULL,NULL,'2014-03-15 09:58:50','2014-07-03 11:01:58',1),(36,'KdkjJO1ouwo.jpg',5188,NULL,NULL,'2014-03-16 11:35:40','2014-07-03 10:46:17',1),(37,'JADoBv4uczQ.jpg',4015,NULL,NULL,'2014-03-16 11:35:46','2014-07-03 11:18:46',1),(39,'_2kXT3g-1yI.jpg',2916,NULL,NULL,'2014-03-16 11:36:02','2014-07-03 10:23:45',1),(41,'j_kLSsNLF8E.jpg',3292,NULL,NULL,'2014-03-17 11:05:43','2014-07-03 10:56:14',1),(42,'qssY-GGLyTA.jpg',5126,NULL,NULL,'2014-03-17 11:05:51','2014-07-03 05:29:04',1),(43,'u0TqNasLTsc.jpg',4162,NULL,NULL,'2014-03-17 11:05:57','2014-07-03 09:07:26',1),(46,'4moaCqICr7Y.jpg',4897,NULL,NULL,'2014-03-24 14:39:48','2014-07-03 10:54:29',1),(47,'Mr7wPtJ-kEs.jpg',4111,NULL,NULL,'2014-03-24 14:39:55','2014-07-03 09:59:08',1),(48,'th1YGVZ3JFw.jpg',3586,NULL,NULL,'2014-03-24 14:40:06','2014-07-03 10:58:14',1),(49,'X5Yk5c4mrXY.jpg',4344,NULL,NULL,'2014-03-24 14:40:13','2014-07-03 10:45:40',1),(50,'image.jpg',3499,NULL,NULL,'2014-03-26 06:44:02','2014-07-03 10:45:24',1),(51,'image.jpg',3973,NULL,NULL,'2014-03-31 19:02:19','2014-07-03 10:52:09',1),(52,'6ellqyNC-d0.jpg',6905,NULL,NULL,'2014-04-04 09:38:33','2014-07-03 10:51:06',1),(53,'20INhdHhcZw.jpg',1756,NULL,NULL,'2014-04-20 16:16:13','2014-07-03 10:44:13',1),(54,'D3IuqZ_1rlE.jpg',1841,NULL,NULL,'2014-04-20 16:16:20','2014-07-03 10:43:55',1),(55,'Hy4x-PAKmTQ.jpg',1636,NULL,NULL,'2014-04-20 16:16:28','2014-07-03 10:43:41',1),(56,'IW1bjDMSfnk.jpg',1498,NULL,NULL,'2014-04-20 16:16:35','2014-07-03 11:03:31',1),(57,'oQcFWozn9sw.jpg',2924,NULL,NULL,'2014-04-20 16:16:48','2014-07-03 10:57:12',1),(58,'ZJC0oLhopUQ.jpg',1036,NULL,NULL,'2014-04-20 16:16:56','2014-07-03 10:20:06',1),(59,'T5irFum-DmQ.jpg',1743,NULL,NULL,'2014-04-20 16:17:03','2014-07-03 11:03:16',1),(61,'image.jpg',3408,NULL,NULL,'2014-04-21 11:26:04','2014-07-03 11:03:07',1),(64,'image.jpg',2992,NULL,NULL,'2014-04-24 17:53:52','2014-07-03 10:56:13',1),(66,'image.jpg',4144,NULL,NULL,'2014-04-24 17:54:24','2014-07-03 10:56:53',1),(67,'image.jpg',9347,NULL,NULL,'2014-04-24 17:54:38','2014-07-03 10:58:05',1),(68,'image.jpg',4431,NULL,NULL,'2014-04-24 17:54:52','2014-07-03 11:19:32',1),(69,'image.jpg',5115,NULL,NULL,'2014-04-24 17:55:04','2014-07-03 10:43:06',1),(71,'image.jpg',4614,NULL,NULL,'2014-04-24 17:55:36','2014-07-03 11:15:39',1),(73,'image.jpg',4281,NULL,NULL,'2014-04-24 17:55:58','2014-07-03 11:20:15',1),(74,'image.jpg',7282,NULL,NULL,'2014-04-24 18:58:39','2014-07-03 10:47:09',1),(76,'image.jpg',5843,NULL,NULL,'2014-04-28 10:54:37','2014-07-03 11:20:41',1);
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20130913203253'),('20130913203330'),('20130913203855'),('20131021203957'),('20131026165946'),('20131027201554'),('20131102131238'),('20131102155227'),('20131107173641'),('20131115062916'),('20131212133533'),('20131216195845'),('20131216200414'),('20131227220409'),('20140109091557'),('20140207094713'),('20140218171113'),('20140218171303'),('20140219090655'),('20140219092059'),('20140220114946'),('20140220120058'),('20140222111756'),('20140225095355'),('20140225101415'),('20140302161816'),('20140302162537'),('20140313190201'),('20140313190408'),('20140313191613'),('20140313225336'),('20140314075813');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serials`
--

DROP TABLE IF EXISTS `serials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `season` int(11) DEFAULT NULL,
  `updating` tinyint(1) DEFAULT '1',
  `name` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `hit` tinyint(1) DEFAULT NULL,
  `years` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serials`
--

LOCK TABLES `serials` WRITE;
/*!40000 ALTER TABLE `serials` DISABLE KEYS */;
INSERT INTO `serials` VALUES (1,'Джереми, Ричард и Джеймс с неподражаемым юмором рассказывают о самых значимых и интересных новинках автомобильного мира.',21,1,'Топ Гир / Top Gear','cover.jpg',0,'2014','2014-02-26 13:19:13','2014-03-02 21:43:22'),(2,'Сериал рассказывает о приключениях братьев Сэма и Дина Винчестеров, которые путешествуют по Соединённым Штатам на чёрном автомобиле Chevrolet Impala 1967 года, расследуют паранормальные явления, многие из которых основаны на американских городских легенда',9,1,'Сверхъестественное','cover.jpg',1,'2013-2014','2014-03-01 17:25:49','2014-03-01 17:25:49'),(3,'Сериал рассказывает об отряде викингов Рагнара. Он восстал, чтобы стать королём племён викингов. Норвежская легенда гласит, что он был прямым потомком Одина, бога войны и воинов.',2,1,'Викинги','cover.jpg',1,'2013-2014','2014-03-01 17:48:34','2014-03-01 17:49:27'),(5,'Два блестящих физика, Леонард и Шелдон, «великие умы», которые понимают, как «работает вселенная». Но их гениальность ничуть не помогает им общаться с людьми, особенно с женщинами. Всё начинает меняться, когда напротив них поселяется красавица Пенни.\r\n\r\nК',7,1,'Теория большого взрыва','cover.jpg',1,'2013-2014','2014-03-02 21:27:09','2014-03-02 21:27:09'),(6,'Главные герои — два детектива. В 2012 году в штате Луизиана повторно открывается дело о серийном убийстве в 1995 году. Детективы познакомились 17 лет назад, когда началось расследование, и с тех пор вместе охотились за киллером. Повествование будет вестис',1,1,'Настоящий детектив / True Detective','cover.jpg',0,'2014','2014-03-06 13:27:34','2014-03-09 12:51:22'),(7,'«Во все времена еда была рядом с людьми. Она искушает, вдохновляет, восхищает, отвращает. Но человек не может без еды, а значит тот, кто создает еду, может управлять миром…». Так думал Максим Лавров, когда шел осуществлять свою мечту — устраиваться поваро',3,1,'Кухня','cover.jpg',1,'2014','2014-03-06 13:37:27','2014-03-06 13:37:27'),(8,'Научно-фантастический проект, герои которого являются прототипом следующего «этапа эволюции человека». Свои способности к телепатии, телекинезу или телепортации, им приходится развивать в подростковом возрасте.',1,0,'Люди будущего / The Tomorrow People','cover.jpg',0,'2013','2014-03-14 09:09:35','2014-03-14 09:14:34'),(10,'\"Универ. Новая общага\" - продолжение сериала \"Универ\". Оставленным на второй год пятикурсникам Антону и Кузе привалило счастье. Их старая общага идет под снос, и в новом корпусе их селят в блок с тремя девушками - Кристиной, Машей и Яной. В роли аспиранта',6,1,'Универ. Новая общага','cover.jpg',1,'2014','2014-03-24 21:01:38','2014-03-24 21:01:38'),(11,'«Игра престолов» новый сериал HBO, основанный на бестселлерах Джорджа Р.Р. Мартина. В мире, где лето и зимы длятся десятилетиями, на кону корона Вестероса. Предательство, похоть, интриги и сверхъестественные силы сотрясают все четыре стороны Королевства',4,1,'Игра престолов','cover.jpg',1,'2014','2014-04-08 08:16:13','2014-04-08 08:21:28'),(12,'Это история о столкновении двух времен: «лихих» 90-х и «стабильных» десятых. Главный герой Фома всю жизнь был «правой рукой» влиятельного человека с полукриминальным прошлым. Когда «хозяин» выгнал его на пенсию, Фома решил любым способом вернуться обратно',1,1,'Физрук','cover.jpg',1,'2014','2014-04-08 10:24:03','2014-04-08 10:24:03');
/*!40000 ALTER TABLE `serials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `release_date` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `mp4_640` varchar(255) DEFAULT NULL,
  `dl_mp4_640` int(11) DEFAULT '0',
  `mp4_320` varchar(255) DEFAULT NULL,
  `dl_mp4_320` int(11) DEFAULT '0',
  `low_3gp` varchar(255) DEFAULT NULL,
  `dl_low_3gp` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_series_on_serial_id` (`serial_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,1,'','',1,'Top_Gir_/_Top_Gear_mp4_640.mp4',6,'Top_Gir_/_Top_Gear_mp4_320.mp4',2,'Top_Gir_/_Top_Gear_low_3gp.3gp',1,'2014-02-26 13:19:46','2014-05-13 18:31:30'),(2,1,'','',2,'Top_Gir_/_Top_Gear_mp4_640.mp4',2,'Top_Gir_/_Top_Gear_mp4_320.mp4',2,'Top_Gir_/_Top_Gear_low_3gp.3gp',1,'2014-02-26 13:20:56','2014-05-13 18:16:21'),(3,1,'','',3,'Top_Gir_/_Top_Gear_mp4_640.mp4',2,'Top_Gir_/_Top_Gear_mp4_320.mp4',2,'Top_Gir_/_Top_Gear_low_3gp.3gp',2,'2014-02-26 13:21:45','2014-05-13 18:21:34'),(4,2,'','',1,NULL,0,'Sverh\'estestvennoe_mp4_320.mp4',705,'Sverh\'estestvennoe_low_3gp.3gp',613,'2014-03-01 17:38:14','2014-07-03 02:22:39'),(5,2,'','',2,NULL,0,'Sverh\'estestvennoe_mp4_320.mp4',649,'Sverh\'estestvennoe_low_3gp.3gp',359,'2014-03-01 17:38:39','2014-07-03 00:06:06'),(6,2,'','',3,NULL,0,'Sverh\'estestvennoe_mp4_320.mp4',503,'Sverh\'estestvennoe_low_3gp.3gp',181,'2014-03-01 17:39:04','2014-07-03 04:08:03'),(7,2,'','',4,NULL,0,'Sverh\'estestvennoe_mp4_320.mp4',224,'Sverh\'estestvennoe_low_3gp.3gp',300,'2014-03-01 17:39:42','2014-06-30 18:37:43'),(8,2,'','',5,NULL,0,'Sverh\'estestvennoe_mp4_320.mp4',289,'Sverh\'estestvennoe_low_3gp.3gp',296,'2014-03-01 17:39:55','2014-07-02 13:58:46'),(9,2,'','',6,NULL,0,'Sverh\'estestvennoe_mp4_320.mp4',137,'Sverh\'estestvennoe_low_3gp.3gp',302,'2014-03-01 17:40:20','2014-07-01 10:51:59'),(10,2,'','',7,NULL,0,'Sverh\'estestvennoe_mp4_320.mp4',121,'Sverh\'estestvennoe_low_3gp.3gp',319,'2014-03-01 17:40:45','2014-07-01 20:18:45'),(11,2,'','',8,'Sverh\'estestvennoe_mp4_640.mp4',119,'Sverh\'estestvennoe_mp4_320.mp4',85,'Sverh\'estestvennoe_low_3gp.3gp',519,'2014-03-01 17:41:10','2014-07-01 13:03:32'),(12,2,'','',9,'Sverh\'estestvennoe_mp4_640.mp4',97,'Sverh\'estestvennoe_mp4_320.mp4',70,'Sverh\'estestvennoe_low_3gp.3gp',506,'2014-03-01 17:41:42','2014-07-02 09:56:23'),(13,2,'','',10,'Sverh\'estestvennoe_mp4_640.mp4',129,'Sverh\'estestvennoe_mp4_320.mp4',102,'Sverh\'estestvennoe_low_3gp.3gp',528,'2014-03-01 17:42:09','2014-07-02 10:39:23'),(14,2,'','',11,'Sverh\'estestvennoe_mp4_640.mp4',119,'Sverh\'estestvennoe_mp4_320.mp4',100,'Sverh\'estestvennoe_low_3gp.3gp',514,'2014-03-01 17:42:47','2014-07-03 10:16:22'),(15,2,'','',12,'Sverh\'estestvennoe_mp4_640.mp4',103,'Sverh\'estestvennoe_mp4_320.mp4',111,'Sverh\'estestvennoe_low_3gp.3gp',454,'2014-03-01 17:43:07','2014-07-01 21:05:16'),(16,2,'','',12,'Sverh\'estestvennoe_mp4_640.mp4',90,'Sverh\'estestvennoe_mp4_320.mp4',104,'Sverh\'estestvennoe_low_3gp.3gp',453,'2014-03-01 17:43:38','2014-06-30 18:52:40'),(17,2,'','',14,'Sverh\'estestvennoe_mp4_640.mp4',196,'Sverh\'estestvennoe_mp4_320.mp4',205,'Sverh\'estestvennoe_low_3gp.3gp',567,'2014-03-01 17:44:01','2014-07-02 13:08:56'),(18,3,'','',1,'Vikingi_mp4_640.mp4',416,'Vikingi_mp4_320.mp4',354,'Vikingi_low_3gp.3gp',591,'2014-03-01 17:49:06','2014-07-01 23:06:17'),(19,5,'','',1,NULL,0,'Teoriya_bolshogo_vzryv_mp4_320.mp4',209,'Teoriya_bolshogo_vzryv_low_3gp.3gp',200,'2014-03-02 21:33:42','2014-07-02 21:58:11'),(20,5,'','',2,NULL,0,'Teoriya_bolshogo_vzryv_mp4_320.mp4',114,'Teoriya_bolshogo_vzryv_low_3gp.3gp',80,'2014-03-02 21:36:36','2014-07-02 21:58:17'),(21,5,'','',3,NULL,0,'Teoriya_bolshogo_vzryv_mp4_320.mp4',74,'Teoriya_bolshogo_vzryv_low_3gp.3gp',55,'2014-03-02 21:36:53','2014-07-02 21:58:21'),(22,5,'','',4,NULL,0,'Teoriya_bolshogo_vzryv_mp4_320.mp4',65,'Teoriya_bolshogo_vzryv_low_3gp.3gp',47,'2014-03-02 21:37:12','2014-07-02 21:58:29'),(23,5,'','',5,NULL,0,'Teoriya_bolshogo_vzryv_mp4_320.mp4',63,'Teoriya_bolshogo_vzryv_low_3gp.3gp',51,'2014-03-02 21:37:28','2014-07-02 21:58:33'),(24,5,'','',6,NULL,0,'Teoriya_bolshogo_vzryv_mp4_320.mp4',51,'Teoriya_bolshogo_vzryv_low_3gp.3gp',32,'2014-03-02 21:37:42','2014-07-01 22:04:45'),(25,5,'','',7,'Teoriya_bolshogo_vzryv_mp4_640.mp4',44,'Teoriya_bolshogo_vzryv_mp4_320.mp4',35,'Teoriya_bolshogo_vzryv_low_3gp.3gp',35,'2014-03-02 21:38:14','2014-07-01 13:36:28'),(26,5,'','',8,'Teoriya_bolshogo_vzryv_mp4_640.mp4',46,'Teoriya_bolshogo_vzryv_mp4_320.mp4',31,'Teoriya_bolshogo_vzryv_low_3gp.3gp',32,'2014-03-02 21:38:37','2014-07-01 13:37:05'),(27,5,'','',9,'Teoriya_bolshogo_vzryv_mp4_640.mp4',53,'Teoriya_bolshogo_vzryv_mp4_320.mp4',30,'Teoriya_bolshogo_vzryv_low_3gp.3gp',31,'2014-03-02 21:39:00','2014-07-01 13:38:25'),(28,5,'','',10,'Teoriya_bolshogo_vzryv_mp4_640.mp4',45,'Teoriya_bolshogo_vzryv_mp4_320.mp4',38,'Teoriya_bolshogo_vzryv_low_3gp.3gp',31,'2014-03-02 21:39:21','2014-07-01 13:39:02'),(29,5,'','',11,'Teoriya_bolshogo_vzryv_mp4_640.mp4',43,'Teoriya_bolshogo_vzryv_mp4_320.mp4',33,'Teoriya_bolshogo_vzryv_low_3gp.3gp',29,'2014-03-02 21:39:39','2014-07-02 15:37:07'),(30,5,'','',12,'Teoriya_bolshogo_vzryv_mp4_640.mp4',49,'Teoriya_bolshogo_vzryv_mp4_320.mp4',29,'Teoriya_bolshogo_vzryv_low_3gp.3gp',31,'2014-03-02 21:39:59','2014-06-21 08:51:15'),(31,5,'','',13,'Teoriya_bolshogo_vzryv_mp4_640.mp4',47,'Teoriya_bolshogo_vzryv_mp4_320.mp4',35,'Teoriya_bolshogo_vzryv_low_3gp.3gp',39,'2014-03-02 21:40:16','2014-06-11 07:19:50'),(32,5,'','',14,'Teoriya_bolshogo_vzryv_mp4_640.mp4',59,'Teoriya_bolshogo_vzryv_mp4_320.mp4',37,'Teoriya_bolshogo_vzryv_low_3gp.3gp',58,'2014-03-02 21:40:33','2014-06-26 13:49:13'),(33,5,'','',15,'Teoriya_bolshogo_vzryv_mp4_640.mp4',85,'Teoriya_bolshogo_vzryv_mp4_320.mp4',67,'Teoriya_bolshogo_vzryv_low_3gp.3gp',105,'2014-03-02 21:40:48','2014-06-28 09:40:18'),(34,5,'','',16,'Teoriya_bolshogo_vzryv_mp4_640.mp4',112,'Teoriya_bolshogo_vzryv_mp4_320.mp4',142,'Teoriya_bolshogo_vzryv_low_3gp.3gp',200,'2014-03-05 09:13:28','2014-07-03 09:25:43'),(35,6,'','',1,'Nastoyaschiy_detektiv_/__mp4_640.mp4',78,'Nastoyaschiy_detektiv_/__mp4_320.mp4',40,'Nastoyaschiy_detektiv_/__low_3gp.3gp',47,'2014-03-06 13:28:12','2014-07-03 06:44:08'),(36,6,'','',2,'Nastoyaschiy_detektiv_/__mp4_640.mp4',41,'Nastoyaschiy_detektiv_/__mp4_320.mp4',29,'Nastoyaschiy_detektiv_/__low_3gp.3gp',24,'2014-03-06 13:31:17','2014-07-03 08:27:38'),(37,6,'','',3,'Nastoyaschiy_detektiv_/__mp4_640.mp4',46,'Nastoyaschiy_detektiv_/__mp4_320.mp4',27,'Nastoyaschiy_detektiv_/__low_3gp.3gp',17,'2014-03-06 13:31:41','2014-07-01 17:06:36'),(38,6,'','',4,'Nastoyaschiy_detektiv_/__mp4_640.mp4',40,'Nastoyaschiy_detektiv_/__mp4_320.mp4',25,'Nastoyaschiy_detektiv_/__low_3gp.3gp',14,'2014-03-06 13:32:04','2014-07-02 08:07:50'),(39,6,'','',5,'Nastoyaschiy_detektiv_/__mp4_640.mp4',40,'Nastoyaschiy_detektiv_/__mp4_320.mp4',25,'Nastoyaschiy_detektiv_/__low_3gp.3gp',15,'2014-03-06 13:32:34','2014-07-02 08:15:18'),(40,6,'','',6,'Nastoyaschiy_detektiv_/__mp4_640.mp4',38,'Nastoyaschiy_detektiv_/__mp4_320.mp4',26,'Nastoyaschiy_detektiv_/__low_3gp.3gp',17,'2014-03-06 13:32:51','2014-06-21 12:57:39'),(41,6,'','',7,'Nastoyaschiy_detektiv_/__mp4_640.mp4',54,'Nastoyaschiy_detektiv_/__mp4_320.mp4',31,'Nastoyaschiy_detektiv_/__low_3gp.3gp',46,'2014-03-06 13:33:09','2014-07-01 05:41:54'),(42,7,'','',2,'Kuhnya_mp4_640.mp4',687,'Kuhnya_mp4_320.mp4',487,'Kuhnya_low_3gp.3gp',807,'2014-03-06 13:37:51','2014-07-03 10:42:50'),(43,7,'','',3,'Kuhnya_mp4_640.mp4',617,'Kuhnya_mp4_320.mp4',393,'Kuhnya_low_3gp.3gp',723,'2014-03-06 13:38:08','2014-07-03 10:43:08'),(45,7,'','',1,'Kuhnya_mp4_640.mp4',960,'Kuhnya_mp4_320.mp4',809,'Kuhnya_low_3gp.3gp',1277,'2014-03-06 13:48:19','2014-07-03 10:42:38'),(46,7,'','',4,'Kuhnya_mp4_640.mp4',568,'Kuhnya_mp4_320.mp4',385,'Kuhnya_low_3gp.3gp',676,'2014-03-06 21:26:02','2014-07-03 08:33:39'),(47,7,'','',5,'Kuhnya_mp4_640.mp4',674,'Kuhnya_mp4_320.mp4',521,'Kuhnya_low_3gp.3gp',941,'2014-03-06 21:26:32','2014-07-03 09:13:31'),(48,2,'','',15,'Sverh\'estestvennoe_mp4_640.mp4',271,'Sverh\'estestvennoe_mp4_320.mp4',356,'Sverh\'estestvennoe_low_3gp.3gp',620,'2014-03-06 21:27:01','2014-07-01 22:59:25'),(49,3,'','',2,'Vikingi_mp4_640.mp4',183,'Vikingi_mp4_320.mp4',182,'Vikingi_low_3gp.3gp',346,'2014-03-08 21:16:51','2014-07-01 19:54:14'),(50,7,'','',6,'Kuhnya_mp4_640.mp4',556,'Kuhnya_mp4_320.mp4',363,'Kuhnya_low_3gp.3gp',619,'2014-03-12 18:01:01','2014-07-03 10:02:18'),(51,7,'','',7,'Kuhnya_mp4_640.mp4',613,'Kuhnya_mp4_320.mp4',357,'Kuhnya_low_3gp.3gp',710,'2014-03-13 20:42:28','2014-07-02 21:02:16'),(52,8,'','',1,'Lyudi_buduschego/_The_To_mp4_640.mp4',161,'Lyudi_buduschego/_The_To_mp4_320.mp4',92,'Lyudi_buduschego/_The_To_low_3gp.3gp',133,'2014-03-14 09:10:23','2014-07-02 19:59:52'),(53,8,'','',2,'Lyudi_buduschego/_The_To_mp4_640.mp4',128,'Lyudi_buduschego/_The_To_mp4_320.mp4',57,'Lyudi_buduschego/_The_To_low_3gp.3gp',106,'2014-03-14 09:10:42','2014-07-02 09:38:57'),(54,8,'','',3,'Lyudi_buduschego/_The_To_mp4_640.mp4',124,'Lyudi_buduschego/_The_To_mp4_320.mp4',54,'Lyudi_buduschego/_The_To_low_3gp.3gp',75,'2014-03-14 09:10:54','2014-07-02 19:16:38'),(55,8,'','',4,'Lyudi_buduschego/_The_To_mp4_640.mp4',123,'Lyudi_buduschego/_The_To_mp4_320.mp4',49,'Lyudi_buduschego/_The_To_low_3gp.3gp',70,'2014-03-14 09:11:08','2014-07-02 13:09:44'),(56,8,'','',5,'Lyudi_buduschego/_The_To_mp4_640.mp4',113,'Lyudi_buduschego/_The_To_mp4_320.mp4',52,'Lyudi_buduschego/_The_To_low_3gp.3gp',69,'2014-03-14 09:11:22','2014-07-02 09:54:44'),(57,8,'','',6,'Lyudi_buduschego/_The_To_mp4_640.mp4',118,'Lyudi_buduschego/_The_To_mp4_320.mp4',61,'Lyudi_buduschego/_The_To_low_3gp.3gp',66,'2014-03-14 09:11:34','2014-07-02 09:54:49'),(58,8,'','',7,'Lyudi_buduschego/_The_To_mp4_640.mp4',163,'Lyudi_buduschego/_The_To_mp4_320.mp4',46,'Lyudi_buduschego/_The_To_low_3gp.3gp',59,'2014-03-14 09:11:45','2014-07-02 09:54:55'),(59,8,'','',8,'Lyudi_buduschego/_The_To_mp4_640.mp4',42,'Lyudi_buduschego/_The_To_mp4_320.mp4',39,'Lyudi_buduschego/_The_To_low_3gp.3gp',48,'2014-03-14 09:11:58','2014-07-02 09:55:00'),(60,8,'','',9,'Lyudi_buduschego/_The_To_mp4_640.mp4',108,'Lyudi_buduschego/_The_To_mp4_320.mp4',41,'Lyudi_buduschego/_The_To_low_3gp.3gp',50,'2014-03-14 09:12:15','2014-07-02 10:32:12'),(61,8,'','',10,'Lyudi_buduschego/_The_To_mp4_640.mp4',111,'Lyudi_buduschego/_The_To_mp4_320.mp4',36,'Lyudi_buduschego/_The_To_low_3gp.3gp',46,'2014-03-14 09:12:28','2014-07-02 10:32:17'),(62,8,'','',11,'Lyudi_buduschego/_The_To_mp4_640.mp4',128,'Lyudi_buduschego/_The_To_mp4_320.mp4',41,'Lyudi_buduschego/_The_To_low_3gp.3gp',56,'2014-03-14 09:12:41','2014-07-02 10:32:21'),(63,8,'','',12,'Lyudi_buduschego/_The_To_mp4_640.mp4',47,'Lyudi_buduschego/_The_To_mp4_320.mp4',37,'Lyudi_buduschego/_The_To_low_3gp.3gp',57,'2014-03-14 09:12:53','2014-07-02 10:32:27'),(64,8,'','',13,'Lyudi_buduschego/_The_To_mp4_640.mp4',39,'Lyudi_buduschego/_The_To_mp4_320.mp4',41,'Lyudi_buduschego/_The_To_low_3gp.3gp',50,'2014-03-14 09:13:03','2014-07-02 10:32:32'),(65,8,'','',14,'Lyudi_buduschego/_The_To_mp4_640.mp4',52,'Lyudi_buduschego/_The_To_mp4_320.mp4',57,'Lyudi_buduschego/_The_To_low_3gp.3gp',78,'2014-03-14 09:13:14','2014-07-02 10:32:36'),(66,8,'','',15,'Lyudi_buduschego/_The_To_mp4_640.mp4',74,'Lyudi_buduschego/_The_To_mp4_320.mp4',66,'Lyudi_buduschego/_The_To_low_3gp.3gp',153,'2014-03-14 09:13:24','2014-07-02 10:32:45'),(67,7,'','',8,'Kuhnya_mp4_640.mp4',759,'Kuhnya_mp4_320.mp4',659,'Kuhnya_low_3gp.3gp',682,'2014-03-15 06:36:13','2014-07-02 23:31:55'),(68,3,'','',3,'Vikingi_mp4_640.mp4',100,'Vikingi_mp4_320.mp4',110,'Vikingi_low_3gp.3gp',106,'2014-03-16 20:03:44','2014-07-02 08:33:19'),(69,7,'','',9,'Kuhnya_mp4_640.mp4',537,'Kuhnya_mp4_320.mp4',631,'Kuhnya_low_3gp.3gp',530,'2014-03-18 10:55:12','2014-07-02 21:02:39'),(70,7,'','',10,'Kuhnya_mp4_640.mp4',510,'Kuhnya_mp4_320.mp4',356,'Kuhnya_low_3gp.3gp',625,'2014-03-18 22:20:35','2014-07-02 21:02:48'),(71,7,'','',11,'Kuhnya_mp4_640.mp4',727,'Kuhnya_mp4_320.mp4',386,'Kuhnya_low_3gp.3gp',619,'2014-03-19 17:39:23','2014-07-02 11:27:47'),(72,7,'','',12,'Kuhnya_mp4_640.mp4',583,'Kuhnya_mp4_320.mp4',398,'Kuhnya_low_3gp.3gp',599,'2014-03-21 20:36:31','2014-07-02 11:30:25'),(73,2,'','',16,'Sverh\'estestvennoe_mp4_640.mp4',207,'Sverh\'estestvennoe_mp4_320.mp4',247,'Sverh\'estestvennoe_low_3gp.3gp',491,'2014-03-21 20:39:42','2014-07-02 09:57:42'),(74,10,'','',1,'Univer._Novaya_obschaga_mp4_640.mp4',801,'Univer._Novaya_obschaga_mp4_320.mp4',448,'Univer._Novaya_obschaga_low_3gp.3gp',693,'2014-03-24 21:01:57','2014-07-03 10:27:01'),(75,10,'','',2,'Univer._Novaya_obschaga_mp4_640.mp4',548,'Univer._Novaya_obschaga_mp4_320.mp4',308,'Univer._Novaya_obschaga_low_3gp.3gp',418,'2014-03-24 21:02:06','2014-07-03 08:59:50'),(76,10,'','',3,'Univer._Novaya_obschaga_mp4_640.mp4',557,'Univer._Novaya_obschaga_mp4_320.mp4',287,'Univer._Novaya_obschaga_low_3gp.3gp',404,'2014-03-24 21:02:16','2014-07-03 10:29:46'),(77,10,'','',4,'Univer._Novaya_obschaga_mp4_640.mp4',601,'Univer._Novaya_obschaga_mp4_320.mp4',320,'Univer._Novaya_obschaga_low_3gp.3gp',449,'2014-03-24 21:03:10','2014-07-03 09:00:21'),(78,10,'','',5,'Univer._Novaya_obschaga_mp4_640.mp4',801,'Univer._Novaya_obschaga_mp4_320.mp4',579,'Univer._Novaya_obschaga_low_3gp.3gp',784,'2014-03-24 21:04:07','2014-07-03 09:00:39'),(79,7,'','',13,'Kuhnya_mp4_640.mp4',553,'Kuhnya_mp4_320.mp4',354,'Kuhnya_low_3gp.3gp',505,'2014-03-25 19:42:37','2014-07-02 17:03:46'),(80,7,'','',14,'Kuhnya_mp4_640.mp4',439,'Kuhnya_mp4_320.mp4',261,'Kuhnya_low_3gp.3gp',536,'2014-03-27 19:44:22','2014-07-03 07:18:32'),(81,7,'','',15,'Kuhnya_mp4_640.mp4',490,'Kuhnya_mp4_320.mp4',301,'Kuhnya_low_3gp.3gp',563,'2014-03-27 19:44:45','2014-07-03 10:12:58'),(82,7,'','',16,'Kuhnya_mp4_640.mp4',818,'Kuhnya_mp4_320.mp4',361,'Kuhnya_low_3gp.3gp',610,'2014-03-29 05:56:31','2014-07-03 10:58:37'),(83,7,'','',17,'Kuhnya_mp4_640.mp4',721,'Kuhnya_mp4_320.mp4',277,'Kuhnya_low_3gp.3gp',436,'2014-04-02 07:52:52','2014-07-03 11:07:01'),(84,7,'','',18,'Kuhnya_mp4_640.mp4',690,'Kuhnya_mp4_320.mp4',314,'Kuhnya_low_3gp.3gp',562,'2014-04-02 07:53:03','2014-07-03 11:07:06'),(85,7,'','',19,NULL,0,'Kuhnya_mp4_320.mp4',618,'Kuhnya_low_3gp.3gp',525,'2014-04-03 11:35:35','2014-07-03 09:20:44'),(86,7,'','',20,'Kuhnya_mp4_640.mp4',598,'Kuhnya_mp4_320.mp4',462,'Kuhnya_low_3gp.3gp',835,'2014-04-04 15:59:41','2014-07-03 09:27:31'),(87,3,'','',4,'Vikingi_mp4_640.mp4',38,'Vikingi_mp4_320.mp4',32,'Vikingi_low_3gp.3gp',37,'2014-04-06 17:28:20','2014-07-01 19:54:44'),(88,3,'','',5,'Vikingi_mp4_640.mp4',40,'Vikingi_mp4_320.mp4',30,'Vikingi_low_3gp.3gp',40,'2014-04-06 17:28:37','2014-07-01 19:54:53'),(89,3,'','',6,'Vikingi_mp4_640.mp4',51,'Vikingi_mp4_320.mp4',28,'Vikingi_low_3gp.3gp',53,'2014-04-06 17:28:53','2014-07-01 19:55:04'),(90,11,'','',1,'Igra_prestolov_mp4_640.mp4',1096,'Igra_prestolov_mp4_320.mp4',306,'Igra_prestolov_low_3gp.3gp',417,'2014-04-08 08:16:36','2014-07-03 09:53:15'),(91,12,'','',1,'Fizruk_mp4_640.mp4',2438,'Fizruk_mp4_320.mp4',2951,'Fizruk_low_3gp.3gp',3427,'2014-04-08 10:24:19','2014-07-03 11:12:53'),(92,12,'','',2,'Fizruk_mp4_640.mp4',1909,'Fizruk_mp4_320.mp4',1896,'Fizruk_low_3gp.3gp',2429,'2014-04-09 19:05:06','2014-07-03 10:35:21'),(93,12,'','',3,'Fizruk_mp4_640.mp4',1711,'Fizruk_mp4_320.mp4',1693,'Fizruk_low_3gp.3gp',2185,'2014-04-09 19:05:38','2014-07-03 10:35:39'),(94,12,'','',4,'Fizruk_mp4_640.mp4',1786,'Fizruk_mp4_320.mp4',1915,'Fizruk_low_3gp.3gp',2509,'2014-04-10 16:33:38','2014-07-03 07:10:38'),(95,12,'','',5,NULL,0,'Fizruk_mp4_320.mp4',3512,'Fizruk_low_3gp.3gp',2172,'2014-04-14 18:34:06','2014-07-03 07:25:53'),(96,12,'','',6,'Fizruk_mp4_640.mp4',1581,'Fizruk_mp4_320.mp4',1789,'Fizruk_low_3gp.3gp',2106,'2014-04-15 17:30:31','2014-07-03 09:17:45'),(97,11,'','',2,'Igra_prestolov_mp4_640.mp4',164,'Igra_prestolov_mp4_320.mp4',156,'Igra_prestolov_low_3gp.3gp',176,'2014-04-16 08:42:18','2014-07-03 09:18:11'),(98,12,'','',7,'Fizruk_mp4_640.mp4',1652,'Fizruk_mp4_320.mp4',1843,'Fizruk_low_3gp.3gp',2149,'2014-04-16 09:23:19','2014-07-03 11:12:35'),(99,12,'','',8,'Fizruk_mp4_640.mp4',1795,'Fizruk_mp4_320.mp4',2080,'Fizruk_low_3gp.3gp',2450,'2014-04-17 20:00:03','2014-07-03 11:12:42'),(100,2,'','',17,'Sverh\'estestvennoe_mp4_640.mp4',89,'Sverh\'estestvennoe_mp4_320.mp4',91,'Sverh\'estestvennoe_low_3gp.3gp',298,'2014-04-17 20:01:00','2014-07-02 09:57:12'),(101,2,'','',18,'Sverh\'estestvennoe_mp4_640.mp4',134,'Sverh\'estestvennoe_mp4_320.mp4',396,'Sverh\'estestvennoe_low_3gp.3gp',410,'2014-04-17 20:01:38','2014-07-02 08:14:07'),(102,12,'','',9,'Fizruk_mp4_640.mp4',1488,'Fizruk_mp4_320.mp4',1577,'Fizruk_low_3gp.3gp',1827,'2014-04-22 09:25:48','2014-07-03 11:12:48'),(103,11,'','',3,'Igra_prestolov_mp4_640.mp4',155,'Igra_prestolov_mp4_320.mp4',122,'Igra_prestolov_low_3gp.3gp',130,'2014-04-22 19:09:05','2014-07-02 18:45:03'),(104,3,'','',7,'Vikingi_mp4_640.mp4',35,'Vikingi_mp4_320.mp4',23,'Vikingi_low_3gp.3gp',27,'2014-04-22 19:10:04','2014-07-02 17:48:42'),(105,3,'','',8,'Vikingi_mp4_640.mp4',40,'Vikingi_mp4_320.mp4',33,'Vikingi_low_3gp.3gp',48,'2014-04-22 19:10:32','2014-07-03 09:29:21'),(106,12,'','',10,'Fizruk_mp4_640.mp4',1512,'Fizruk_mp4_320.mp4',1635,'Fizruk_low_3gp.3gp',2075,'2014-04-23 12:26:05','2014-07-03 11:12:53'),(107,12,'','',11,'Fizruk_mp4_640.mp4',1860,'Fizruk_mp4_320.mp4',1598,'Fizruk_low_3gp.3gp',2076,'2014-04-23 12:55:30','2014-07-03 11:12:59'),(108,12,'','',12,'Fizruk_mp4_640.mp4',1931,'Fizruk_mp4_320.mp4',1665,'Fizruk_low_3gp.3gp',2324,'2014-04-24 12:23:18','2014-07-03 11:13:05'),(109,12,'','',13,'Fizruk_mp4_640.mp4',1635,'Fizruk_mp4_320.mp4',1843,'Fizruk_low_3gp.3gp',2267,'2014-04-28 17:28:28','2014-07-03 10:22:28'),(110,11,'','',4,'Igra_prestolov_mp4_640.mp4',157,'Igra_prestolov_mp4_320.mp4',106,'Igra_prestolov_low_3gp.3gp',147,'2014-04-28 17:29:06','2014-07-02 19:24:11'),(111,12,'','',14,'Fizruk_mp4_640.mp4',1866,'Fizruk_mp4_320.mp4',1727,'Fizruk_low_3gp.3gp',2214,'2014-04-30 19:27:30','2014-07-03 10:40:19'),(112,12,'','',15,'Fizruk_mp4_640.mp4',1495,'Fizruk_mp4_320.mp4',1958,'Fizruk_low_3gp.3gp',1873,'2014-05-06 09:51:55','2014-07-03 10:22:39'),(113,12,'','',16,'Fizruk_mp4_640.mp4',1280,'Fizruk_mp4_320.mp4',2314,'Fizruk_low_3gp.3gp',1658,'2014-05-07 08:11:54','2014-07-03 10:24:38'),(114,12,'','',17,'Fizruk_mp4_640.mp4',1809,'Fizruk_mp4_320.mp4',2483,'Fizruk_low_3gp.3gp',2016,'2014-05-07 16:13:59','2014-07-03 10:26:09'),(115,12,'','',18,'Fizruk_mp4_640.mp4',1586,'Fizruk_mp4_320.mp4',1863,'Fizruk_low_3gp.3gp',1955,'2014-05-12 14:42:31','2014-07-03 10:26:12'),(116,12,'','',19,'Fizruk_mp4_640.mp4',1409,'Fizruk_mp4_320.mp4',2563,'Fizruk_low_3gp.3gp',2002,'2014-05-13 20:15:32','2014-07-03 10:26:15'),(117,12,'','',20,'Fizruk_mp4_640.mp4',1497,'Fizruk_mp4_320.mp4',3931,'Fizruk_low_3gp.3gp',2681,'2014-05-14 15:31:19','2014-07-03 10:26:20'),(118,11,'','',5,'Igra_prestolov_mp4_640.mp4',121,'Igra_prestolov_mp4_320.mp4',77,'Igra_prestolov_low_3gp.3gp',116,'2014-05-17 07:49:38','2014-07-02 20:25:40'),(119,2,'','',19,'Sverh\'estestvennoe_mp4_640.mp4',60,'Sverh\'estestvennoe_mp4_320.mp4',60,'Sverh\'estestvennoe_low_3gp.3gp',228,'2014-05-17 07:50:06','2014-07-02 08:18:38'),(120,2,'','',20,'Sverh\'estestvennoe_mp4_640.mp4',81,'Sverh\'estestvennoe_mp4_320.mp4',92,'Sverh\'estestvennoe_low_3gp.3gp',312,'2014-05-17 07:50:18','2014-07-02 08:17:57');
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soul_operas`
--

DROP TABLE IF EXISTS `soul_operas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soul_operas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soul_operas`
--

LOCK TABLES `soul_operas` WRITE;
/*!40000 ALTER TABLE `soul_operas` DISABLE KEYS */;
/*!40000 ALTER TABLE `soul_operas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `screen` varchar(255) DEFAULT NULL,
  `low_3gp` varchar(255) DEFAULT NULL,
  `mp4_320` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `downloads` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `source_video` varchar(255) DEFAULT NULL,
  `mp4_640` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_videos_on_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (1,1,'Мартышка дразнит кота :)','snapshot20131216200936.jpg','Glupaya_martyshka_low_3gp.3gp','Glupaya_martyshka_mp4_320.mp4','Глупая мартышка','',1743,'2014-01-07 12:40:23','2014-07-03 05:55:09',NULL,'Glupaya_martyshka_mp4_640.mp4'),(2,1,'Собака очень полюбила карусель :)','snapshot20131216201047.jpg','Korgi_razvlekaetsya_low_3gp.3gp','Korgi_razvlekaetsya_mp4_320.mp4','Корги развлекается','',386,'2014-01-07 12:42:35','2014-06-30 06:43:27',NULL,'Korgi_razvlekaetsya_mp4_640.mp4'),(3,1,'Кот послушно выполняет команды хозяйки','snapshot20131216201110.jpg','Kotya_pora_spat_low_3gp.3gp','Kotya_pora_spat_mp4_320.mp4','Котя, пора спать','',949,'2014-01-07 12:44:15','2014-07-03 04:19:06',NULL,'Kotya_pora_spat_mp4_640.mp4'),(4,1,'Пожилая женщина соперничает в танце с молодой красавицей :)','snapshot20131216201217.jpg','Kto_goryachee_low_3gp.3gp','Kto_goryachee_mp4_320.mp4','Кто горячее','',1709,'2014-01-07 12:45:43','2014-07-03 07:35:44',NULL,'Kto_goryachee_mp4_640.mp4'),(5,1,'Собачка очень хочет петь!','snapshot20131216201308.jpg','Ne_golos_a_pesnya_low_3gp.3gp','Ne_golos_a_pesnya_mp4_320.mp4','Не голос, а песня','',628,'2014-01-07 12:47:13','2014-07-03 06:50:18',NULL,'Ne_golos_a_pesnya_mp4_640.mp4'),(6,1,'В порыве страсти девушка немного ошиблась :P','snapshot20131216201417.jpg','Ne_ta_makaronina_low_3gp.3gp','Ne_ta_makaronina_mp4_320.mp4','Не та макаронина','',1037,'2014-01-07 12:48:31','2014-07-03 01:05:49',NULL,'Ne_ta_makaronina_mp4_640.mp4'),(7,1,'Подымаем бревно по-русски!','snapshot20131216201452.jpg','Russkaya_smekalka_low_3gp.3gp','Russkaya_smekalka_mp4_320.mp4','Русская смекалка','',826,'2014-01-07 12:49:36','2014-07-02 20:40:00',NULL,'Russkaya_smekalka_mp4_640.mp4'),(8,1,'Маленькая зверушка пугает огромных страусов :)','snapshot20131216201525.jpg','Strausy_ispugalis_low_3gp.3gp','Strausy_ispugalis_mp4_320.mp4','Страусы испугались','',894,'2014-01-07 12:51:05','2014-07-03 06:43:26',NULL,'Strausy_ispugalis_mp4_640.mp4'),(9,1,'Собака начала танцевать при виде хозяина :)','snapshot20131216201548.jpg','Takogo_vy_eschyo_ne_vide_low_3gp.3gp','Takogo_vy_eschyo_ne_vide_mp4_320.mp4','Такого вы ещё не видели! Танец собаки','',1366,'2014-01-07 12:53:08','2014-07-03 11:25:34',NULL,'Takogo_vy_eschyo_ne_vide_mp4_640.mp4'),(10,1,'Подборка разных смешных видео','snapshot20140108113704.jpg','Podborka_prikolov_za__low_3gp.3gp','Podborka_prikolov_za__mp4_320.mp4','Подборка приколов за февраль 2013','',1276,'2014-01-08 10:08:47','2014-07-03 11:23:07',NULL,'Podborka_prikolov_za__mp4_640.mp4'),(11,1,'Классных приколы в одном из которых участвует группа LMFAO!','snapshot20140108113838.jpg','Podborka_prikolov_za__low_3gp.3gp','Podborka_prikolov_za__mp4_320.mp4','Подборка приколов за ноябрь 2013','',3222,'2014-01-08 10:12:40','2014-07-03 11:21:58',NULL,'Podborka_prikolov_za__mp4_640.mp4'),(12,1,'Парень из машины неожиданно погладил несколько попок :)','snapshot20140108113901.jpg','Pogladil_popki_low_3gp.3gp','Pogladil_popki_mp4_320.mp4','Погладил попки','',1547,'2014-01-08 10:14:06','2014-07-03 02:20:04',NULL,'Pogladil_popki_mp4_640.mp4'),(13,1,'Оригинальная и довольно смешная реклама','snapshot20140108113953.jpg','Vsyo_horosho_low_3gp.3gp','Vsyo_horosho_mp4_320.mp4','Всё хорошо','',1306,'2014-01-08 10:15:49','2014-07-02 19:26:42',NULL,'Vsyo_horosho_mp4_640.mp4'),(14,1,'девушка отомстила за то, что ей по попе попали мячом :)','snapshot20140108114135.jpg','Kak_popast_v_vorota_low_3gp.3gp','Kak_popast_v_vorota_mp4_320.mp4','Как попасть в ворота','',4384,'2014-01-08 10:17:22','2014-07-03 09:11:44',NULL,'Kak_popast_v_vorota_mp4_640.mp4'),(15,1,'Кота неудачно подразнили телефоном','snapshot20140108114215.jpg','Kot_po_telefonu_skaza_low_3gp.3gp','Kot_po_telefonu_skaza_mp4_320.mp4','Кот по телефону сказал что-то не то','',1703,'2014-01-08 10:18:36','2014-07-03 10:06:04',NULL,'Kot_po_telefonu_skaza_mp4_640.mp4'),(16,1,'Парень шикарно владеет кинжалами','snapshot20140108114253.jpg','Razvlecheniya_posle_nov_low_3gp.3gp','Razvlecheniya_posle_nov_mp4_320.mp4','Развлечения после нового года','',2061,'2014-01-08 10:19:29','2014-07-03 08:04:05',NULL,'Razvlecheniya_posle_nov_mp4_640.mp4'),(17,1,'Девушке никак не удается соблазнить своего парня. Для него рыбалка это все :)','snapshot20140108114335.jpg','Rybalka_—_eto_svyatoe_low_3gp.3gp','Rybalka_—_eto_svyatoe_mp4_320.mp4','Рыбалка — это святое','',5439,'2014-01-08 10:21:06','2014-07-03 07:45:41',NULL,'Rybalka_—_eto_svyatoe_mp4_640.mp4'),(18,2,'Майк Тайсон расказывает о своей жизни. У него безусловно есть чему поучиться','snapshot20140108235948.jpg','Zolotye_slova_Mayka_T_low_3gp.3gp','Zolotye_slova_Mayka_T_mp4_320.mp4','Золотые слова Майка Тайсона','',1616,'2014-01-08 22:08:02','2014-07-03 08:53:31',NULL,NULL),(19,2,'Стив Джобс расказывает три истории из своей жизни, которые наполнены глубочайшим смыслом. Эту речь должен послушать каждый','snapshot20140109000308.jpg','Legendarnaya_rech_Stiv_low_3gp.3gp','Legendarnaya_rech_Stiv_mp4_320.mp4','Легендарная речь Стива Джобса','',438,'2014-01-08 22:11:23','2014-07-03 06:34:02',NULL,NULL),(20,2,'Отрывок из фильма \"каждое воскресенье\". Аль Пачино мотивирует футбольную команду перед игрой. Речь действительно очень сильная, рекомендую всем','snapshot20140109000504.jpg','Velikaya_rech_Al_Pachi_low_3gp.3gp','Velikaya_rech_Al_Pachi_mp4_320.mp4','Великая речь Аль Пачино','',458,'2014-01-08 22:16:44','2014-07-01 16:50:59',NULL,NULL),(21,2,'Чемпион сурдлимпийских игр (спортивные соревнования людей с нарушениями слуха) рассказывает об уроках, которые он извлек из жизни','snapshot20140109000536.jpg','Sila_voli_low_3gp.3gp','Sila_voli_mp4_320.mp4','Сила воли','',455,'2014-01-08 22:23:57','2014-07-03 05:49:22',NULL,NULL),(22,2,'Непревзойденная финальная речь Аль Пачино из крутейшего фильма «Запах женщины»','snapshot20140109004305.jpg','Otryvok_iz_k-f_Zapah__low_3gp.3gp','Otryvok_iz_k-f_Zapah__mp4_320.mp4','Отрывок из к-ф \"Запах женщины\" (финал)','',632,'2014-01-08 22:46:21','2014-07-01 18:49:57',NULL,NULL),(23,3,'Лучшее из фильма Best Of - Now or Never. Потрясающий ролик об экстриме!','snapshot20140110224343.jpg','Vot_kak_deystvitelno_low_3gp.3gp','Vot_kak_deystvitelno_mp4_320.mp4','Вот как действительно стоит жить!','',1968,'2014-01-10 20:55:13','2014-07-02 21:50:12',NULL,'Vot_kak_deystvitelno_mp4_640.mp4'),(24,3,'Атлеты показывают крутые трюки. Подбрасывают девушек и удерживают их на одной руке','snapshot20140110224636.jpg','Potryasayuschee_masterstv_low_3gp.3gp','Potryasayuschee_masterstv_mp4_320.mp4','Потрясающее мастерство атлетов','',1768,'2014-01-10 20:57:36','2014-07-03 08:11:38',NULL,'Potryasayuschee_masterstv_mp4_640.mp4'),(25,3,'Крутые трюки с подручными предметами','snapshot20140110224807.jpg','Milliony_let_trenirov_low_3gp.3gp','Milliony_let_trenirov_mp4_320.mp4','Миллионы лет тренировок','',2158,'2014-01-10 20:58:48','2014-07-03 07:43:04',NULL,'Milliony_let_trenirov_mp4_640.mp4'),(26,3,'Дэвид Бэкхем попадает мячом в урны :) Потрясающая точность','snapshot20140110224948.jpg','Neveroyatnyy_tryuk_ot_D_low_3gp.3gp','Neveroyatnyy_tryuk_ot_D_mp4_320.mp4','Невероятный трюк от Дэвида Бэкхема','',2006,'2014-01-10 21:00:37','2014-07-03 07:31:45',NULL,'Neveroyatnyy_tryuk_ot_D_mp4_640.mp4'),(27,3,'Продавец показывает фокусы с мороженным :)','snapshot20140110225111.jpg','Odin_iz_luchshih_prodav_low_3gp.3gp','Odin_iz_luchshih_prodav_mp4_320.mp4','Один из лучших продавцов мороженого в Турции','',2039,'2014-01-10 21:01:53','2014-07-03 09:20:51',NULL,NULL),(28,3,'Клип о риске и экстриме! Вдохновляемся :)','snapshot20140207104934.jpg','Neveroyatnye_mgnoveniya_low_3gp.3gp','Neveroyatnye_mgnoveniya_mp4_320.mp4','Невероятные мгновения из экстримальной жизни','',2924,'2014-02-07 09:11:59','2014-07-03 07:50:57',NULL,'Neveroyatnye_mgnoveniya_mp4_640.mp4'),(29,4,'Вот так каждый прохожий смог попробовать себя в роли дирижера :) Получилось очень весело','snapshot20140207105204.jpg','Sluchaynyy_chelovek_ruk_low_3gp.3gp','Sluchaynyy_chelovek_ruk_mp4_320.mp4','Случайный человек руководит целым оркестром!','',844,'2014-02-07 09:14:56','2014-07-03 04:02:36',NULL,'Sluchaynyy_chelovek_ruk_mp4_640.mp4'),(30,3,'Танец в стиле popping! У парня крутая пластика','snapshot20140207105307.jpg','Nerealnoe_vladenie_t_low_3gp.3gp','Nerealnoe_vladenie_t_mp4_320.mp4','Нереальное владение телом под DubStep','',2104,'2014-02-07 09:17:45','2014-07-03 11:04:13',NULL,'Nerealnoe_vladenie_t_mp4_640.mp4'),(31,3,'Парень просто шокировал судей :)','snapshot20140207105330.jpg','Krutoy_tanets_v_stile__low_3gp.3gp','Krutoy_tanets_v_stile__mp4_320.mp4','Крутой танец в стиле locking на America\'s Got Talent','',2323,'2014-02-07 09:20:52','2014-07-03 01:58:47',NULL,'Krutoy_tanets_v_stile__mp4_640.mp4'),(32,3,'Сексуальная девушка помогает парню показывать мастерство на бильярдном столе','snapshot20140207105448.jpg','Paren_tvorit_chudesa__low_3gp.3gp','Paren_tvorit_chudesa__mp4_320.mp4','Парень творит чудеса на бильярдном столе','',5695,'2014-02-07 09:23:51','2014-07-03 11:13:00',NULL,'Paren_tvorit_chudesa__mp4_640.mp4'),(33,3,'Парень крушит стереотипы о повседневных предметах :)','snapshot20140208184558.jpg','Otlichnye_fokusy_:)_low_3gp.3gp','Otlichnye_fokusy_:)_mp4_320.mp4','Отличные фокусы :)','',3681,'2014-02-08 16:48:23','2014-07-03 10:37:23',NULL,'Otlichnye_fokusy_:)_mp4_640.mp4'),(34,1,'Этого котенка ничто не разбудит :)','snapshot20140208184756.jpg','Drug_kotoryy_vechno_s_low_3gp.3gp','Drug_kotoryy_vechno_s_mp4_320.mp4','Друг, который вечно спит','',1204,'2014-02-08 16:50:04','2014-07-03 11:18:50',NULL,'Drug_kotoryy_vechno_s_mp4_640.mp4'),(35,1,'Отличный вор растет :)','snapshot20140208184740.jpg','Enot_ukral_korm__low_3gp.3gp','Enot_ukral_korm__mp4_320.mp4','Енот украл корм ','',1141,'2014-02-08 16:51:29','2014-07-02 16:58:56',NULL,'Enot_ukral_korm__mp4_640.mp4'),(36,1,'Вопрос путину о новых именах гаишников :)','snapshot20140208184723.jpg','Interesnyy_vopros_put_low_3gp.3gp','Interesnyy_vopros_put_mp4_320.mp4','Интересный вопрос путину','',1734,'2014-02-08 16:54:00','2014-07-03 04:50:13',NULL,'Interesnyy_vopros_put_mp4_640.mp4'),(37,1,'Без комментариев :)','snapshot20140208184701.jpg','Kak_snimali_hobita_:)_low_3gp.3gp','Kak_snimali_hobita_:)_mp4_320.mp4','Как снимали хоббита :)','',1713,'2014-02-08 16:56:48','2014-07-03 07:31:23',NULL,'Kak_snimali_hobita_:)_mp4_640.mp4'),(38,6,'Очередной шедевр от Avicii','screen.jpg','Avicii_-_Addicted_To__low_3gp.3gp','Avicii_-_Addicted_To__mp4_320.mp4','Avicii - Addicted To You','Avicii',1612,'2014-02-26 13:28:02','2014-07-03 11:20:34',NULL,'Avicii_-_Addicted_To__mp4_640.mp4'),(39,6,'','screen.jpg','Disclosure_-_F_For_Yo_low_3gp.3gp','Disclosure_-_F_For_Yo_mp4_320.mp4','Disclosure - F For You ft. Mary J. Blige','Disclosure',327,'2014-02-26 14:01:04','2014-07-02 19:28:38',NULL,'Disclosure_-_F_For_Yo_mp4_640.mp4'),(40,6,'','screen.jpg','Ellie_Goulding_-_Good_low_3gp.3gp','Ellie_Goulding_-_Good_mp4_320.mp4','Ellie Goulding - Goodness Gracious','Ellie Goulding',1265,'2014-02-26 14:02:49','2014-07-03 05:03:38',NULL,'Ellie_Goulding_-_Good_mp4_640.mp4'),(41,6,'','screen.jpg','Eminem_-_The_Monster__low_3gp.3gp','Eminem_-_The_Monster__mp4_320.mp4','Eminem - The Monster (Explicit) ft. Rihanna','Eminem',1780,'2014-02-26 14:06:22','2014-07-03 11:16:33',NULL,'Eminem_-_The_Monster__mp4_640.mp4'),(42,6,'','screen.jpg',NULL,'Enrique_Iglesias_-_I\'_mp4_320.mp4','Enrique Iglesias - I\'m A Freak ft. Pitbull','Enrique Iglesias',2302,'2014-02-26 14:08:10','2014-07-03 08:07:40',NULL,'Enrique_Iglesias_-_I\'_mp4_640.mp4'),(43,6,'','screen.jpg','Kids_Again_(Official__low_3gp.3gp','Kids_Again_(Official__mp4_320.mp4','Kids Again (Official Video)','Example',781,'2014-02-26 14:09:46','2014-07-03 10:59:29',NULL,'Kids_Again_(Official__mp4_640.mp4'),(44,6,'','screen.jpg','Foster_The_People_-_C_low_3gp.3gp','Foster_The_People_-_C_mp4_320.mp4','Foster The People - Coming of Age','Foster The People',432,'2014-02-26 14:13:11','2014-07-02 20:15:06',NULL,'Foster_The_People_-_C_mp4_640.mp4'),(45,6,'','screen.jpg','Foxes_-_Let_Go_For_To_low_3gp.3gp','Foxes_-_Let_Go_For_To_mp4_320.mp4','Foxes - Let Go For Tonight (Official Video)','Foxes',959,'2014-02-26 14:15:19','2014-07-02 17:19:17',NULL,'Foxes_-_Let_Go_For_To_mp4_640.mp4'),(46,6,'','screen.jpg','Jennifer_Hudson_-_I_C_low_3gp.3gp','Jennifer_Hudson_-_I_C_mp4_320.mp4','Jennifer Hudson - I Can\'t Describe (The Way I Feel) ft. T.I','Jennifer Hudson',1099,'2014-02-26 14:17:00','2014-07-03 08:46:28',NULL,'Jennifer_Hudson_-_I_C_mp4_640.mp4'),(47,6,'','screen.jpg','Jennifer_Lopez_-_Same_low_3gp.3gp','Jennifer_Lopez_-_Same_mp4_320.mp4','Jennifer Lopez - Same Girl','Jennifer Lopez',1850,'2014-02-26 14:19:16','2014-07-03 07:22:13',NULL,'Jennifer_Lopez_-_Same_mp4_640.mp4'),(48,6,'','screen.jpg','Justin_Bieber_-_Confi_low_3gp.3gp','Justin_Bieber_-_Confi_mp4_320.mp4','Justin Bieber - Confident ft. Chance The Rapper','Justin Bieber',1377,'2014-02-26 14:22:30','2014-07-03 03:59:44',NULL,'Justin_Bieber_-_Confi_mp4_640.mp4'),(49,6,'','screen.jpg','Katy_Perry_-_Dark_Hor_low_3gp.3gp','Katy_Perry_-_Dark_Hor_mp4_320.mp4','Katy Perry - Dark Horse (feat. Juicy J) (Official) ft. Juicy J','Katy Perry',2147,'2014-02-26 14:24:20','2014-07-03 11:14:47',NULL,'Katy_Perry_-_Dark_Hor_mp4_640.mp4'),(50,6,'','screen.jpg','Kid_Ink_-_Iz_U_Down_f_low_3gp.3gp','Kid_Ink_-_Iz_U_Down_f_mp4_320.mp4','Kid Ink - Iz U Down ft. Tyga','Kid Ink',861,'2014-02-26 14:26:41','2014-07-03 08:34:54',NULL,'Kid_Ink_-_Iz_U_Down_f_mp4_640.mp4'),(51,6,'','screen.jpg','Krewella_-_Human_low_3gp.3gp','Krewella_-_Human_mp4_320.mp4','Krewella - Human','Krewella',686,'2014-02-26 14:30:26','2014-07-02 20:17:40',NULL,'Krewella_-_Human_mp4_640.mp4'),(52,1,'Девочка круто зачитала','screen.jpg','Vot_eto_rep!_low_3gp.3gp','Vot_eto_rep!_mp4_320.mp4','Вот это рэп!','',1604,'2014-02-27 10:40:22','2014-07-03 11:16:05',NULL,'Vot_eto_rep!_mp4_640.mp4'),(53,1,'Парень наяривает музычку на детской игрушке :)','screen.jpg','Glavnoe_stremitsya_a_low_3gp.3gp','Glavnoe_stremitsya_a_mp4_320.mp4','Главное стремиться, а возможность найдется','',1013,'2014-02-27 10:52:20','2014-07-02 23:17:02',NULL,NULL),(54,3,'Девушка строит невероятную фигуру','screen.jpg','Neveroyatnaya_sposobnos_low_3gp.3gp','Neveroyatnaya_sposobnos_mp4_320.mp4','Невероятная способность к концентрации-Miyoko Shida','',1728,'2014-02-27 10:54:05','2014-07-03 08:45:14',NULL,'Neveroyatnaya_sposobnos_mp4_640.mp4'),(55,3,'У парня отличная пластика :)','screen.jpg','ofigennyy_elektro_tan_low_3gp.3gp','ofigennyy_elektro_tan_mp4_320.mp4','офигенный электро танец','',3082,'2014-02-27 10:54:53','2014-07-03 11:08:17',NULL,NULL),(56,1,'','screen.jpg','Aktyor_u_kotorogo_eschyo_low_3gp.3gp','Aktyor_u_kotorogo_eschyo_mp4_320.mp4','Актёр, у которого ещё нет Оскара','',2533,'2014-02-27 10:55:50','2014-07-03 10:58:31',NULL,NULL),(57,1,'','screen.jpg','Kruchu_-_verchu_kota_z_low_3gp.3gp','Kruchu_-_verchu_kota_z_mp4_320.mp4','Кручу - верчу, кота запутать хочу!','',2689,'2014-02-27 10:56:11','2014-07-03 10:55:52',NULL,'Kruchu_-_verchu_kota_z_mp4_640.mp4'),(58,1,'','screen.jpg','Leopard_murlychet._Kak_low_3gp.3gp','Leopard_murlychet._Kak_mp4_320.mp4','Леопард мурлычет. Какой же он все-таки классный!','',2123,'2014-02-27 10:56:34','2014-07-03 06:42:17',NULL,'Leopard_murlychet._Kak_mp4_640.mp4'),(59,1,'','screen.jpg','Lisitsa_kak_domashniy_p_low_3gp.3gp','Lisitsa_kak_domashniy_p_mp4_320.mp4','Лисица как домашний питомец','',1595,'2014-02-27 10:56:52','2014-07-03 10:15:34',NULL,NULL),(60,6,'','screen.jpg','2CELLOS_-_Thunderstru_low_3gp.3gp','2CELLOS_-_Thunderstru_mp4_320.mp4','2CELLOS - Thunderstruck [OFFICIA]','2CELLOS',426,'2014-02-28 09:05:02','2014-07-02 19:16:09',NULL,'2CELLOS_-_Thunderstru_mp4_640.mp4'),(61,6,'','screen.jpg','Beyonce_-_Partition_(_low_3gp.3gp','Beyonce_-_Partition_(_mp4_320.mp4','Beyonce - Partition (Explicit Video)','Beyonce',3434,'2014-02-28 09:10:15','2014-07-03 09:38:20',NULL,'Beyonce_-_Partition_(_mp4_640.mp4'),(62,6,'','screen.jpg','Miley_Cyrus_-_We_Can\'_low_3gp.3gp','Miley_Cyrus_-_We_Can\'_mp4_320.mp4','Miley Cyrus - We Can\'t Stop','',4252,'2014-02-28 09:10:54','2014-07-03 10:52:44',NULL,'Miley_Cyrus_-_We_Can\'_mp4_640.mp4'),(64,6,'','screen.jpg','Miley_Cyrus_-_Wreckin_low_3gp.3gp','Miley_Cyrus_-_Wreckin_mp4_320.mp4','Miley Cyrus - Wrecking Ball','Miley Cyrus',6135,'2014-02-28 09:14:00','2014-07-03 11:13:04',NULL,'Miley_Cyrus_-_Wreckin_mp4_640.mp4'),(65,6,'','screen.jpg','BandEros_-_Vse_V_Seti_low_3gp.3gp','BandEros_-_Vse_V_Seti_mp4_320.mp4','БандЭрос - Все В Сети','БАНД\'ЭРОС',4255,'2014-02-28 09:14:26','2014-07-03 10:46:02',NULL,'BandEros_-_Vse_V_Seti_mp4_640.mp4'),(66,6,'','screen.jpg','Vera_Brezhneva_-_Dobro_low_3gp.3gp','Vera_Brezhneva_-_Dobro_mp4_320.mp4','Вера Брежнева - Доброе утро','Вера Брежнева',5681,'2014-02-28 09:15:26','2014-07-03 11:11:36',NULL,'Vera_Brezhneva_-_Dobro_mp4_640.mp4');
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-03 15:26:49
