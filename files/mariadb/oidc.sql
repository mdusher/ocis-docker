-- MariaDB dump 10.19  Distrib 10.6.3-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: simplesaml
-- ------------------------------------------------------
-- Server version	10.6.3-MariaDB-1:10.6.3+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `simplesaml`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `simplesaml` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `simplesaml`;

--
-- Table structure for table `oidc_access_token`
--

DROP TABLE IF EXISTS `oidc_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oidc_access_token` (
  `id` varchar(255) NOT NULL,
  `scopes` text DEFAULT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `is_revoked` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_43C1650EA76ED395` (`user_id`),
  KEY `FK_43C1650E19EB6921` (`client_id`),
  CONSTRAINT `FK_43C1650E19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oidc_client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_43C1650EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `oidc_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oidc_access_token`
--

LOCK TABLES `oidc_access_token` WRITE;
/*!40000 ALTER TABLE `oidc_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oidc_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oidc_auth_code`
--

DROP TABLE IF EXISTS `oidc_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oidc_auth_code` (
  `id` varchar(255) NOT NULL,
  `scopes` text DEFAULT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `is_revoked` tinyint(1) NOT NULL DEFAULT 0,
  `redirect_uri` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_97D32CA7A76ED395` (`user_id`),
  KEY `FK_97D32CA719EB6921` (`client_id`),
  CONSTRAINT `FK_97D32CA719EB6921` FOREIGN KEY (`client_id`) REFERENCES `oidc_client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_97D32CA7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `oidc_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oidc_auth_code`
--

LOCK TABLES `oidc_auth_code` WRITE;
/*!40000 ALTER TABLE `oidc_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oidc_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oidc_client`
--

DROP TABLE IF EXISTS `oidc_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oidc_client` (
  `id` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `auth_source` varchar(255) DEFAULT NULL,
  `redirect_uri` text NOT NULL,
  `scopes` text NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `is_confidential` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oidc_client`
--

LOCK TABLES `oidc_client` WRITE;
/*!40000 ALTER TABLE `oidc_client` DISABLE KEYS */;
INSERT INTO `oidc_client` VALUES ('_54c87bb0c90994d96c30ceb30787531fdfeecd5656','_832c1ecb5ce12fece34366b4102c55310e2d5b9bd6','ownCloud Android app','ownCloud Android app','devidp','[\"oc:\\/\\/android.owncloud.com\"]','[\"openid\",\"profile\",\"email\"]',1,1),('_f07aff6b3ab0614f0ce4c290d1a3392f31b7985402','_96e5999189fdde6c759a5772c0bfebb3ec209e1025','web','owncloud web for ocis','devidp','[\"https:\\/\\/ocis.owncloud.test\\/*\"]','[\"openid\",\"profile\",\"email\"]',1,1);
/*!40000 ALTER TABLE `oidc_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oidc_migration_versions`
--

DROP TABLE IF EXISTS `oidc_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oidc_migration_versions` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oidc_migration_versions`
--

LOCK TABLES `oidc_migration_versions` WRITE;
/*!40000 ALTER TABLE `oidc_migration_versions` DISABLE KEYS */;
INSERT INTO `oidc_migration_versions` VALUES ('20180305180300'),('20180425203400'),('20200517071100');
/*!40000 ALTER TABLE `oidc_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oidc_refresh_token`
--

DROP TABLE IF EXISTS `oidc_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oidc_refresh_token` (
  `id` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `access_token_id` varchar(255) NOT NULL,
  `is_revoked` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_636B86402CCB2688` (`access_token_id`),
  CONSTRAINT `FK_636B86402CCB2688` FOREIGN KEY (`access_token_id`) REFERENCES `oidc_access_token` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oidc_refresh_token`
--

LOCK TABLES `oidc_refresh_token` WRITE;
/*!40000 ALTER TABLE `oidc_refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oidc_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oidc_user`
--

DROP TABLE IF EXISTS `oidc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oidc_user` (
  `id` varchar(255) NOT NULL,
  `claims` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oidc_user`
--

LOCK TABLES `oidc_user` WRITE;
/*!40000 ALTER TABLE `oidc_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `oidc_user` ENABLE KEYS */;
UNLOCK TABLES;
