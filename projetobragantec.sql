CREATE DATABASE  IF NOT EXISTS `db_sistema` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_sistema`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_sistema
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Autor',6,'add_autor'),(22,'Can change Autor',6,'change_autor'),(23,'Can delete Autor',6,'delete_autor'),(24,'Can view Autor',6,'view_autor'),(25,'Can add Projeto',7,'add_projeto'),(26,'Can change Projeto',7,'change_projeto'),(27,'Can delete Projeto',7,'delete_projeto'),(28,'Can view Projeto',7,'view_projeto'),(29,'Can add Usuário',8,'add_user'),(30,'Can change Usuário',8,'change_user'),(31,'Can delete Usuário',8,'delete_user'),(32,'Can view Usuário',8,'view_user'),(33,'Can add source',9,'add_source'),(34,'Can change source',9,'change_source'),(35,'Can delete source',9,'delete_source'),(36,'Can view source',9,'view_source'),(37,'Can add thumbnail',10,'add_thumbnail'),(38,'Can change thumbnail',10,'change_thumbnail'),(39,'Can delete thumbnail',10,'delete_thumbnail'),(40,'Can view thumbnail',10,'view_thumbnail'),(41,'Can add thumbnail dimensions',11,'add_thumbnaildimensions'),(42,'Can change thumbnail dimensions',11,'change_thumbnaildimensions'),(43,'Can delete thumbnail dimensions',11,'delete_thumbnaildimensions'),(44,'Can view thumbnail dimensions',11,'view_thumbnaildimensions'),(45,'Can add Orientador',12,'add_orientador'),(46,'Can change Orientador',12,'change_orientador'),(47,'Can delete Orientador',12,'delete_orientador'),(48,'Can view Orientador',12,'view_orientador'),(49,'Can add Avaliador',13,'add_avaliador'),(50,'Can change Avaliador',13,'change_avaliador'),(51,'Can delete Avaliador',13,'delete_avaliador'),(52,'Can view Avaliador',13,'view_avaliador'),(53,'Can add Diretor',14,'add_diretor'),(54,'Can change Diretor',14,'change_diretor'),(55,'Can delete Diretor',14,'delete_diretor'),(56,'Can view Diretor',14,'view_diretor'),(57,'Can add Evento',15,'add_evento'),(58,'Can change Evento',15,'change_evento'),(59,'Can delete Evento',15,'delete_evento'),(60,'Can view Evento',15,'view_evento');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_sistema_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_sistema_user_id` FOREIGN KEY (`user_id`) REFERENCES `sistema_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(9,'easy_thumbnails','source'),(10,'easy_thumbnails','thumbnail'),(11,'easy_thumbnails','thumbnaildimensions'),(5,'sessions','session'),(6,'sistema','autor'),(13,'sistema','avaliador'),(14,'sistema','diretor'),(15,'sistema','evento'),(12,'sistema','orientador'),(7,'sistema','projeto'),(8,'sistema','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-14 22:58:22.608543'),(2,'contenttypes','0002_remove_content_type_name','2019-11-14 22:58:24.060604'),(3,'auth','0001_initial','2019-11-14 22:58:26.120524'),(4,'auth','0002_alter_permission_name_max_length','2019-11-14 22:58:30.560750'),(5,'auth','0003_alter_user_email_max_length','2019-11-14 22:58:30.873074'),(6,'auth','0004_alter_user_username_opts','2019-11-14 22:58:31.044937'),(7,'auth','0005_alter_user_last_login_null','2019-11-14 22:58:31.118033'),(8,'auth','0006_require_contenttypes_0002','2019-11-14 22:58:31.164945'),(9,'auth','0007_alter_validators_add_error_messages','2019-11-14 22:58:31.227417'),(10,'auth','0008_alter_user_username_max_length','2019-11-14 22:58:31.305484'),(11,'auth','0009_alter_user_last_name_max_length','2019-11-14 22:58:31.405054'),(12,'auth','0010_alter_group_name_max_length','2019-11-14 22:58:32.288678'),(13,'auth','0011_update_proxy_permissions','2019-11-14 22:58:32.354996'),(14,'sistema','0001_initial','2019-11-14 22:58:37.980473'),(15,'admin','0001_initial','2019-11-14 22:58:42.698830'),(16,'admin','0002_logentry_remove_auto_add','2019-11-14 22:58:45.697318'),(17,'admin','0003_logentry_add_action_flag_choices','2019-11-14 22:58:45.775466'),(18,'easy_thumbnails','0001_initial','2019-11-14 22:58:47.903531'),(19,'easy_thumbnails','0002_thumbnaildimensions','2019-11-14 22:58:52.804338'),(20,'sessions','0001_initial','2019-11-14 22:58:54.931371'),(21,'sistema','0002_auto_20191117_1500','2019-11-17 18:00:59.390766'),(22,'sistema','0003_auto_20191119_1454','2019-11-19 17:54:39.155198'),(23,'sistema','0004_auto_20191119_1934','2019-11-19 22:34:48.931556'),(24,'sistema','0005_auto_20191119_2013','2019-11-19 23:13:23.626375'),(25,'sistema','0006_autor_user','2019-11-21 13:03:05.459971'),(26,'sistema','0007_remove_autor_user','2019-11-21 14:22:42.524868'),(27,'sistema','0008_auto_20191121_2125','2019-11-22 00:25:18.839704'),(28,'sistema','0009_auto_20191126_2209','2019-11-27 01:09:18.517053'),(29,'sistema','0010_auto_20191126_2226','2019-11-27 01:27:07.501841'),(30,'sistema','0011_auto_20191127_1455','2019-11-27 17:55:56.000713'),(31,'sistema','0012_projeto_user','2019-11-27 18:02:02.569542'),(32,'sistema','0013_remove_projeto_user','2019-11-27 18:03:28.955923'),(33,'sistema','0014_projeto_user','2019-11-27 18:16:41.776843'),(34,'sistema','0015_projeto_alteracoes','2019-11-27 19:09:39.151828'),(35,'sistema','0016_projeto_status','2019-11-27 19:39:48.541838'),(36,'sistema','0017_auto_20191128_0848','2019-11-28 11:48:19.238532'),(37,'sistema','0018_auto_20191128_1018','2019-11-28 13:18:23.034495'),(38,'sistema','0019_auto_20191128_1019','2019-11-28 13:19:10.750633'),(39,'sistema','0020_auto_20191128_1025','2019-11-28 13:25:27.356123'),(40,'sistema','0021_auto_20191128_1445','2019-11-28 17:45:49.805967'),(41,'sistema','0022_auto_20191128_1456','2019-11-28 17:56:43.179028'),(42,'sistema','0023_auto_20191203_1827','2019-12-03 21:27:26.262157'),(43,'sistema','0024_avaliador','2019-12-04 00:36:28.740705'),(44,'sistema','0025_auto_20191204_1855','2019-12-04 21:55:55.119250'),(45,'sistema','0026_evento','2019-12-05 01:55:00.113703');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('e7adrpf3cv4b53jlz24bctmjbcisxih3','Y2Q4OTlmYzFhOTVlYzJlMzhlNmVlNmU1NWQ4MjFhOGZhMmQzZDllYjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwY2ViZDMwMjBjMDk5ZGE3NjNhODRjZWQ3YWRmYmU0ZWM1YWRlNjhlIn0=','2019-12-19 18:56:20.425883');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easy_thumbnails_source`
--

DROP TABLE IF EXISTS `easy_thumbnails_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easy_thumbnails_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_hash` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `easy_thumbnails_source_storage_hash_name_481ce32d_uniq` (`storage_hash`,`name`),
  KEY `easy_thumbnails_source_storage_hash_946cbcc9` (`storage_hash`),
  KEY `easy_thumbnails_source_name_5fe0edc6` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_source`
--

LOCK TABLES `easy_thumbnails_source` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `easy_thumbnails_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easy_thumbnails_thumbnail`
--

DROP TABLE IF EXISTS `easy_thumbnails_thumbnail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easy_thumbnails_thumbnail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_hash` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `easy_thumbnails_thumbnai_storage_hash_name_source_fb375270_uniq` (`storage_hash`,`name`,`source_id`),
  KEY `easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum` (`source_id`),
  KEY `easy_thumbnails_thumbnail_storage_hash_f1435f49` (`storage_hash`),
  KEY `easy_thumbnails_thumbnail_name_b5882c31` (`name`),
  CONSTRAINT `easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum` FOREIGN KEY (`source_id`) REFERENCES `easy_thumbnails_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_thumbnail`
--

LOCK TABLES `easy_thumbnails_thumbnail` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnail` DISABLE KEYS */;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easy_thumbnails_thumbnaildimensions`
--

DROP TABLE IF EXISTS `easy_thumbnails_thumbnaildimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easy_thumbnails_thumbnaildimensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbnail_id` int(11) NOT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `thumbnail_id` (`thumbnail_id`),
  CONSTRAINT `easy_thumbnails_thum_thumbnail_id_c3a0c549_fk_easy_thum` FOREIGN KEY (`thumbnail_id`) REFERENCES `easy_thumbnails_thumbnail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_thumbnaildimensions`
--

LOCK TABLES `easy_thumbnails_thumbnaildimensions` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnaildimensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnaildimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema_autor`
--

DROP TABLE IF EXISTS `sistema_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistema_autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `curso` varchar(100) NOT NULL,
  `serie` varchar(100) NOT NULL,
  `instituicao` varchar(100) NOT NULL,
  `dt_nasc` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `sistema_autor_user_id_b0f9c47b_fk_sistema_user_id` (`user_id`),
  CONSTRAINT `sistema_autor_user_id_b0f9c47b_fk_sistema_user_id` FOREIGN KEY (`user_id`) REFERENCES `sistema_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema_autor`
--

LOCK TABLES `sistema_autor` WRITE;
/*!40000 ALTER TABLE `sistema_autor` DISABLE KEYS */;
INSERT INTO `sistema_autor` VALUES (74,'oi@oi','oi','info','3','ifsp','2001-07-16',4),(75,'lemayara16@gmail.com','Letícia','Informática','3 ano ','IFSP','2001-07-16',1),(76,'nbo@kj','bojb','info','3','ifsp','2001-07-16',5),(85,'djsidj@ji.com','oi','info','2','ifsp','2001-07-16',13),(86,'ojd@jn.com','oi','info','3','ifso','2001-07-16',13),(87,'oidbsi@ni.com','j','oi','oi','oi','2001-07-16',13);
/*!40000 ALTER TABLE `sistema_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema_avaliador`
--

DROP TABLE IF EXISTS `sistema_avaliador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistema_avaliador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `link_curriculo` varchar(100) NOT NULL,
  `titulacao` varchar(100) NOT NULL,
  `area` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sistema_avaliador_user_id_826e3b2d_fk_sistema_user_id` (`user_id`),
  CONSTRAINT `sistema_avaliador_user_id_826e3b2d_fk_sistema_user_id` FOREIGN KEY (`user_id`) REFERENCES `sistema_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema_avaliador`
--

LOCK TABLES `sistema_avaliador` WRITE;
/*!40000 ALTER TABLE `sistema_avaliador` DISABLE KEYS */;
INSERT INTO `sistema_avaliador` VALUES (1,'oi','http://bra.ifsp.edu.br/dojofest/','oi','CHL',6);
/*!40000 ALTER TABLE `sistema_avaliador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema_diretor`
--

DROP TABLE IF EXISTS `sistema_diretor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistema_diretor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `area` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sistema_diretor_user_id_5b89331c_fk_sistema_user_id` (`user_id`),
  CONSTRAINT `sistema_diretor_user_id_5b89331c_fk_sistema_user_id` FOREIGN KEY (`user_id`) REFERENCES `sistema_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema_diretor`
--

LOCK TABLES `sistema_diretor` WRITE;
/*!40000 ALTER TABLE `sistema_diretor` DISABLE KEYS */;
INSERT INTO `sistema_diretor` VALUES (1,'OI','CHL',12);
/*!40000 ALTER TABLE `sistema_diretor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema_evento`
--

DROP TABLE IF EXISTS `sistema_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistema_evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema_evento`
--

LOCK TABLES `sistema_evento` WRITE;
/*!40000 ALTER TABLE `sistema_evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `sistema_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema_orientador`
--

DROP TABLE IF EXISTS `sistema_orientador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistema_orientador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `instituicao` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `sistema_orientador_user_id_3d7322bd_fk_sistema_user_id` (`user_id`),
  CONSTRAINT `sistema_orientador_user_id_3d7322bd_fk_sistema_user_id` FOREIGN KEY (`user_id`) REFERENCES `sistema_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema_orientador`
--

LOCK TABLES `sistema_orientador` WRITE;
/*!40000 ALTER TABLE `sistema_orientador` DISABLE KEYS */;
INSERT INTO `sistema_orientador` VALUES (1,'lemayara16@gmail.com','Letícia Fernandes ','IFSP ',1),(2,'oi@h','oi','ifsp',4),(3,'lb@J','oi','ifsp',5);
/*!40000 ALTER TABLE `sistema_orientador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema_projeto`
--

DROP TABLE IF EXISTS `sistema_projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistema_projeto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `resumo` varchar(200) NOT NULL,
  `area` varchar(100) NOT NULL,
  `palavras_chave` varchar(30) NOT NULL,
  `introducao` varchar(500) NOT NULL,
  `objetivos` varchar(500) NOT NULL,
  `material` varchar(500) NOT NULL,
  `metodologia` varchar(500) NOT NULL,
  `resultados` varchar(500) NOT NULL,
  `referencias_bibliograficas` varchar(500) NOT NULL,
  `plano_pesquisa` varchar(100) NOT NULL,
  `link_video` varchar(100) NOT NULL,
  `email_autor_1` varchar(100) DEFAULT NULL,
  `email_autor_2` varchar(100) DEFAULT NULL,
  `email_autor_3` varchar(100) DEFAULT NULL,
  `email_orientador_1` varchar(100) DEFAULT NULL,
  `email_orientador_2` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `alteracoes` varchar(500) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sistema_projeto_user_id_c1439e7d_fk_sistema_user_id` (`user_id`),
  CONSTRAINT `sistema_projeto_user_id_c1439e7d_fk_sistema_user_id` FOREIGN KEY (`user_id`) REFERENCES `sistema_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema_projeto`
--

LOCK TABLES `sistema_projeto` WRITE;
/*!40000 ALTER TABLE `sistema_projeto` DISABLE KEYS */;
INSERT INTO `sistema_projeto` VALUES (3,'oi','oi','I','oi','oi','oi','oi','oi','oi','oi','','oi','lemayara16@gmail.com','lele@gmail.com','','lemayara16@gmail.com','',1,'ghfgh','A'),(4,'oi','oi','CHL','oi','oi','oi','oi','oi','oi','oi','','oi','oi@oi.com','','','oi@h.com','',4,'cvdfgdg','A'),(5,'teste','teste','CHL','teste','teste','teste','teste','teste','teste','teste','','https://www.reportlab.com/docs/reportlab-userguide.pdf','nbo@kj','','','lb@J','',5,NULL,'Aguardando Avaliação');
/*!40000 ALTER TABLE `sistema_projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema_user`
--

DROP TABLE IF EXISTS `sistema_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistema_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `is_avaliador` tinyint(1) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_diretor` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema_user`
--

LOCK TABLES `sistema_user` WRITE;
/*!40000 ALTER TABLE `sistema_user` DISABLE KEYS */;
INSERT INTO `sistema_user` VALUES (1,'pbkdf2_sha256$150000$S52xj3jV1FTF$H7EvdF320/2q3b4uYkW1FTCdnmvrNQF75kE/FioLE0I=','2019-12-05 13:04:19.055740',0,'leticia','lemayara16@gmail.com','',1,0,'2019-11-20 00:29:59.022115','',0,'',0),(3,'pbkdf2_sha256$150000$2f2BBiWp4H1c$V37ZPVxOjo+jivGXAVlmBKX5ildJHUyMQ8E8azTRQlU=','2019-12-05 18:56:20.189836',1,'admin','admin@admin.com','',1,1,'2019-11-27 19:00:55.329388','',0,'',0),(4,'pbkdf2_sha256$150000$9CK3uA1PKx1n$eZxlj19ZpCbU7upBO7i05ZW3kAWwsK5sO7rvbJOtdsc=','2019-11-28 13:22:29.609193',0,'lele','lele@gmail.com','',1,0,'2019-11-28 13:22:28.995085','',0,'',0),(5,'pbkdf2_sha256$150000$H09wDKIcW0Mw$TmSuPRCo7iw2X1HJ0KIrbDx2KEpz/ZXSnujDvsj088M=','2019-12-01 16:20:08.573794',0,'teste','teste@email.com','',1,0,'2019-12-01 16:20:06.895991','',0,'',0),(6,'pbkdf2_sha256$150000$Ct6JBWAd9zEP$U8kgvUD76Rdzb1HUZ4wvYjIgmlG0M0tZzokkZ9+YO7A=','2019-12-04 02:00:37.922387',0,'avaliador','avaliador@hotmail.com','',1,0,'2019-12-03 21:33:29.154523','',1,'',0),(7,'pbkdf2_sha256$150000$XzCZYB1heBVp$B/JImZ5RnqOzOQHuSZUso9nY5kdTDshqRplMMm5xMGY=','2019-12-04 00:40:38.529618',0,'le_sfernandes','legle@gmail.com','',1,0,'2019-12-04 00:40:38.162534','',0,'',0),(12,'pbkdf2_sha256$150000$UuwsSmJHVnFt$8e+LCI2zT6Wa5AmhBQxs9L+ZtdeoBPeiwQN47Cno6wc=','2019-12-05 16:03:03.437804',0,'diretor','dr@hu.com','',1,0,'2019-12-05 15:58:39.400927','',0,'',1),(13,'pbkdf2_sha256$150000$FXlgro4UadLC$1tAKRCGNvz+hmLEH+i0LsY6ysEVUqy5g8XBm3NdE96A=','2019-12-05 16:49:46.529726',0,'oi','oi@oi.com','',1,0,'2019-12-05 16:49:46.214240','',0,'',0);
/*!40000 ALTER TABLE `sistema_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema_user_groups`
--

DROP TABLE IF EXISTS `sistema_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistema_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sistema_user_groups_user_id_group_id_81b1b2b2_uniq` (`user_id`,`group_id`),
  KEY `sistema_user_groups_group_id_0093a4f9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `sistema_user_groups_group_id_0093a4f9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `sistema_user_groups_user_id_b517c2bd_fk_sistema_user_id` FOREIGN KEY (`user_id`) REFERENCES `sistema_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema_user_groups`
--

LOCK TABLES `sistema_user_groups` WRITE;
/*!40000 ALTER TABLE `sistema_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `sistema_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema_user_user_permissions`
--

DROP TABLE IF EXISTS `sistema_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistema_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sistema_user_user_permis_user_id_permission_id_6eb9ab0d_uniq` (`user_id`,`permission_id`),
  KEY `sistema_user_user_pe_permission_id_f535808e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `sistema_user_user_pe_permission_id_f535808e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `sistema_user_user_pe_user_id_0454dc76_fk_sistema_u` FOREIGN KEY (`user_id`) REFERENCES `sistema_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema_user_user_permissions`
--

LOCK TABLES `sistema_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `sistema_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sistema_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_sistema'
--

--
-- Dumping routines for database 'db_sistema'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-11 12:31:10
