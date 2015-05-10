-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: photo_album
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `album_comments`
--

DROP TABLE IF EXISTS `album_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(300) NOT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_album_comment_album_idx` (`album_id`),
  KEY `fk_album_comment_user_idx` (`user_id`),
  CONSTRAINT `fk_album_comment_album` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_album_comment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_comments`
--

LOCK TABLES `album_comments` WRITE;
/*!40000 ALTER TABLE `album_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,NULL,1,NULL,'2015-05-08 12:18:14',NULL),(2,'Road trip',1,NULL,'2015-05-09 00:43:08',NULL),(3,'Some images',1,NULL,'2015-05-09 00:43:08',NULL),(4,'other album',1,NULL,'2015-05-09 00:43:08',NULL),(5,'dummy album #1 ',1,NULL,'2015-05-09 00:43:08',NULL),(6,'dummy album #2',1,NULL,'2015-05-09 00:43:08',NULL),(7,'dummy album #3',1,NULL,'2015-05-09 00:43:08',NULL),(8,'dummy album #4',1,NULL,'2015-05-09 00:43:08',NULL),(9,'dummy album #5',1,NULL,'2015-05-09 00:43:08',NULL),(10,'dummy album #6',1,NULL,'2015-05-09 00:43:08',NULL),(11,'dummy album #7',1,NULL,'2015-05-09 00:43:08',NULL),(12,'dummy album #8',1,NULL,'2015-05-09 00:43:08',NULL),(13,'dummy album #9',1,NULL,'2015-05-09 00:43:08',NULL),(14,'dummy album #10',1,NULL,'2015-05-09 00:43:08',NULL),(15,'dummy album #11',1,NULL,'2015-05-09 00:43:08',NULL),(16,'dummy album #12',1,NULL,'2015-05-09 00:43:08',NULL),(17,'dummy album #141',1,NULL,'2015-05-09 00:43:08',NULL),(18,'Nov album',1,NULL,'2015-05-10 14:24:54',NULL),(19,'Nov album',1,NULL,'2015-05-10 14:25:19',NULL),(20,'Nov album',1,NULL,'2015-05-10 14:26:23',NULL),(21,'New album',1,NULL,'2015-05-10 16:21:37',NULL),(22,'New album',1,NULL,'2015-05-10 16:21:37',NULL),(23,'New album',1,NULL,'2015-05-10 16:21:37',NULL),(24,'Test album',1,NULL,'2015-05-10 16:23:10',NULL),(25,'Test album',1,NULL,'2015-05-10 16:23:10',NULL),(26,'Test album',1,NULL,'2015-05-10 16:23:10',NULL),(27,'Test album',1,NULL,'2015-05-10 16:23:52',NULL),(28,'Test album',1,NULL,'2015-05-10 16:23:52',NULL),(29,'Test album',1,NULL,'2015-05-10 16:23:52',NULL),(30,'Test album',1,NULL,'2015-05-10 16:24:47',NULL),(31,'Test album',1,NULL,'2015-05-10 16:24:47',NULL),(32,'Test album',1,NULL,'2015-05-10 16:24:47',NULL);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_comments`
--

DROP TABLE IF EXISTS `photo_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(300) NOT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_photo_comment_photo_idx` (`photo_id`),
  KEY `fk_photo_comment_user_idx` (`user_id`),
  CONSTRAINT `fk_photo_comment_photo` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_photo_comment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_comments`
--

LOCK TABLES `photo_comments` WRITE;
/*!40000 ALTER TABLE `photo_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `photo_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `image_path` varchar(300) NOT NULL,
  `user_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `is_admin` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ivan','$2y$10$iZHW47uaobg5NHeMXE70o.hAx2wLAcAHKBA7ccv9WISSqwRYw5t/6','\0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-10 16:30:24
