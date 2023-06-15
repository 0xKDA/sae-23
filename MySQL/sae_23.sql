-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: sae_23
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `sae_23`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sae_23` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sae_23`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Eleves'),(2,'Professeurs');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,32),(2,1,36),(3,1,40),(4,1,44),(5,1,48),(6,1,52),(7,1,56),(8,1,24),(9,1,28),(10,2,21),(11,2,22),(12,2,23),(13,2,24),(14,2,25),(15,2,26),(16,2,27),(17,2,28),(18,2,29),(19,2,30),(20,2,31),(21,2,32),(22,2,33),(23,2,34),(24,2,35),(25,2,36),(26,2,37),(27,2,38),(28,2,39),(29,2,40),(30,2,41),(31,2,42),(32,2,43),(33,2,44),(34,2,45),(35,2,46),(36,2,47),(37,2,48),(38,2,49),(39,2,50),(40,2,51),(41,2,52),(42,2,53),(43,2,54),(44,2,55),(45,2,56);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add enseignants',7,'add_enseignants'),(26,'Can change enseignants',7,'change_enseignants'),(27,'Can delete enseignants',7,'delete_enseignants'),(28,'Can view enseignants',7,'view_enseignants'),(29,'Can add etudiants',8,'add_etudiants'),(30,'Can change etudiants',8,'change_etudiants'),(31,'Can delete etudiants',8,'delete_etudiants'),(32,'Can view etudiants',8,'view_etudiants'),(33,'Can add ressources',9,'add_ressources'),(34,'Can change ressources',9,'change_ressources'),(35,'Can delete ressources',9,'delete_ressources'),(36,'Can view ressources',9,'view_ressources'),(37,'Can add ue',10,'add_ue'),(38,'Can change ue',10,'change_ue'),(39,'Can delete ue',10,'delete_ue'),(40,'Can view ue',10,'view_ue'),(41,'Can add examens',11,'add_examens'),(42,'Can change examens',11,'change_examens'),(43,'Can delete examens',11,'delete_examens'),(44,'Can view examens',11,'view_examens'),(45,'Can add notes',12,'add_notes'),(46,'Can change notes',12,'change_notes'),(47,'Can delete notes',12,'delete_notes'),(48,'Can view notes',12,'view_notes'),(49,'Can add enseignements',13,'add_enseignements'),(50,'Can change enseignements',13,'change_enseignements'),(51,'Can delete enseignements',13,'delete_enseignements'),(52,'Can view enseignements',13,'view_enseignements'),(53,'Can add curriculum',14,'add_curriculum'),(54,'Can change curriculum',14,'change_curriculum'),(55,'Can delete curriculum',14,'delete_curriculum'),(56,'Can view curriculum',14,'view_curriculum');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$eXv6ONDs9Sgun5FjGumzu1$ijb6rXR3lmGG/L6CqZXflfipp4RVPnaqShmpBnNNh2M=','2023-06-15 17:29:25.940311',1,'admin','','','admin@notike.tld',1,1,'2023-06-13 00:18:56.810679');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curriculum` (
  `id_curriculum` int NOT NULL AUTO_INCREMENT,
  `code_ressource` varchar(10) NOT NULL,
  `code_ue` varchar(10) NOT NULL,
  PRIMARY KEY (`id_curriculum`),
  UNIQUE KEY `curriculum_code_ressource_code_ue_f09ad3b9_uniq` (`code_ressource`,`code_ue`),
  KEY `curriculum_code_ue_aef2a401_fk_ue_code_ue` (`code_ue`),
  CONSTRAINT `curriculum_code_ressource_95d9e968_fk_ressources_code_ressource` FOREIGN KEY (`code_ressource`) REFERENCES `ressources` (`code_ressource`),
  CONSTRAINT `curriculum_code_ue_aef2a401_fk_ue_code_ue` FOREIGN KEY (`code_ue`) REFERENCES `ue` (`code_ue`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--
-- ORDER BY:  `id_curriculum`

/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-06-13 00:19:33.928786','1','Eleves',1,'[{\"added\": {}}]',3,1),(2,'2023-06-13 00:19:44.919633','2','Professeurs',1,'[{\"added\": {}}]',3,1),(3,'2023-06-13 14:10:21.151999','1','Eleves',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(4,'2023-06-13 14:10:37.927196','2','Professeurs',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(5,'2023-06-13 18:06:50.017693','6','testetu',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(6,'2023-06-13 18:08:21.160068','8','profess',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(7,'2023-06-13 18:16:21.227500','6','testetu',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(8,'2023-06-13 18:17:01.583997','6','testetu',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(9,'2023-06-13 18:22:33.296015','6','testetu',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(10,'2023-06-13 18:24:49.240035','7','enseignant',3,'',4,1),(11,'2023-06-13 18:25:09.905851','3','prof',3,'',4,1),(12,'2023-06-13 18:33:47.488199','8','profess',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(13,'2023-06-13 22:04:19.526758','5','popop',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(14,'2023-06-13 22:05:12.534713','5','popop',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(15,'2023-06-13 22:05:33.696033','5','popop',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(16,'2023-06-14 20:35:26.248622','12','aedaz',3,'',4,1),(17,'2023-06-14 20:35:34.319036','2','etudiant',3,'',4,1),(18,'2023-06-14 20:35:37.638267','9','HEY',3,'',4,1),(19,'2023-06-14 20:35:40.909385','18','iii',3,'',4,1),(20,'2023-06-14 20:35:43.824873','17','juzj',3,'',4,1),(21,'2023-06-14 20:35:47.311751','16','laol',3,'',4,1),(22,'2023-06-14 20:35:50.027847','20','pmazjko',3,'',4,1),(23,'2023-06-14 20:35:54.341061','5','popop',3,'',4,1),(24,'2023-06-14 20:35:57.371621','19','popopo',3,'',4,1),(25,'2023-06-14 20:36:00.757315','10','ppp',3,'',4,1),(26,'2023-06-14 20:36:03.706034','8','profess',3,'',4,1),(27,'2023-06-14 20:36:06.426098','13','rtrtrt',3,'',4,1),(28,'2023-06-14 20:36:08.990417','6','testetu',3,'',4,1),(29,'2023-06-14 20:36:11.806704','15','tttt',3,'',4,1),(30,'2023-06-14 20:36:14.717727','11','YIKES',3,'',4,1),(31,'2023-06-14 20:36:18.518574','14','zazaza',3,'',4,1),(32,'2023-06-15 16:14:35.803232','25','zaea',3,'',4,1),(33,'2023-06-15 16:14:38.813946','28','username',3,'',4,1),(34,'2023-06-15 16:14:41.741827','23','signal',3,'',4,1),(35,'2023-06-15 16:14:44.487181','27','professeur',3,'',4,1),(36,'2023-06-15 16:14:47.495910','24','oiazhjgeoui',3,'',4,1),(37,'2023-06-15 16:14:50.743215','26','hthth',3,'',4,1),(38,'2023-06-15 16:14:54.297543','22','etudianttest',3,'',4,1),(39,'2023-06-15 16:14:57.412416','29','etudiant',3,'',4,1),(40,'2023-06-15 16:15:02.328757','21','eleve',3,'',4,1),(41,'2023-06-15 16:17:28.849805','31','professeur',1,'[{\"added\": {}}]',4,1),(42,'2023-06-15 16:17:49.382175','31','professeur',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(43,'2023-06-15 17:29:38.807515','30','etudiant',3,'',4,1),(44,'2023-06-15 17:29:42.911410','31','professeur',3,'',4,1),(45,'2023-06-15 17:29:48.393189','9','Curriculum object (9)',3,'',14,1),(46,'2023-06-15 17:29:55.731493','8','Examens object (8)',3,'',11,1),(47,'2023-06-15 17:30:00.845242','R101','R101',3,'',9,1),(48,'2023-06-15 17:30:04.419409','UE1','UE1',3,'',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'general','enseignants'),(8,'general','etudiants'),(9,'general','ressources'),(10,'general','ue'),(11,'general','examens'),(12,'general','notes'),(13,'general','enseignements'),(14,'general','curriculum');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-06-13 00:17:27.536265'),(2,'auth','0001_initial','2023-06-13 00:17:27.990104'),(3,'admin','0001_initial','2023-06-13 00:17:28.092280'),(4,'admin','0002_logentry_remove_auto_add','2023-06-13 00:17:28.104185'),(5,'admin','0003_logentry_add_action_flag_choices','2023-06-13 00:17:28.115096'),(6,'contenttypes','0002_remove_content_type_name','2023-06-13 00:17:28.169656'),(7,'auth','0002_alter_permission_name_max_length','2023-06-13 00:17:28.206856'),(8,'auth','0003_alter_user_email_max_length','2023-06-13 00:17:28.229176'),(9,'auth','0004_alter_user_username_opts','2023-06-13 00:17:28.237608'),(10,'auth','0005_alter_user_last_login_null','2023-06-13 00:17:28.282247'),(11,'auth','0006_require_contenttypes_0002','2023-06-13 00:17:28.287704'),(12,'auth','0007_alter_validators_add_error_messages','2023-06-13 00:17:28.298119'),(13,'auth','0008_alter_user_username_max_length','2023-06-13 00:17:28.350695'),(14,'auth','0009_alter_user_last_name_max_length','2023-06-13 00:17:28.390375'),(15,'auth','0010_alter_group_name_max_length','2023-06-13 00:17:28.417655'),(16,'auth','0011_update_proxy_permissions','2023-06-13 00:17:28.426584'),(17,'auth','0012_alter_user_first_name_max_length','2023-06-13 00:17:28.464776'),(18,'general','0001_initial','2023-06-13 00:17:28.914646'),(19,'sessions','0001_initial','2023-06-13 00:17:28.940935');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--
-- ORDER BY:  `session_key`

/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('l0gkjm7sduq4ew5ll8zsy621nctf3vb6','.eJxVjEEOwiAQRe_C2hAqBWZcuvcMhGFAqgaS0q6MdzckXej2v_f-W_iwb8XvPa1-YXERkzj9bhTiM9UB-BHqvcnY6rYuJIciD9rlrXF6XQ_376CEXkatwViD7BQQO8Jgpjiz0pkp65wZouJMCHNMzmog7Ww8M9hkDKJBEp8v-Rs4YA:1q8sPi:l2YxYoMhldiYvRvYKRL6ssLvC5g8BtUPuY7USEy2AVM','2023-06-27 01:01:38.691100'),('ulsmm0g6e9p1g7kfhw5prvh4a94493tg','.eJxVjDEOwyAQBP9CHSHD2QekTO83oDvAwUkEkrGrKH-PLblIim12ZvctPG1r9ltLi5-juAptxOW3ZArPVA4SH1TuVYZa1mVmeSjypE2ONabX7XT_DjK1vK8HJrITho5JAWI0jlRAMqAtKQ3gAIih79hNPVoHqJTbMwRtbIoaxecL_oY3EQ:1q9YNc:UOlAzPztSGxWqLcAeMQGvUfiuoh96zeqAuTz14iVVZg','2023-06-28 21:50:16.274795');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

--
-- Table structure for table `enseignants`
--

DROP TABLE IF EXISTS `enseignants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enseignants` (
  `id_enseignant` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `utilisateur_id` int NOT NULL,
  PRIMARY KEY (`id_enseignant`),
  UNIQUE KEY `utilisateur_id` (`utilisateur_id`),
  CONSTRAINT `enseignants_utilisateur_id_f3596e34_fk_auth_user_id` FOREIGN KEY (`utilisateur_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enseignants`
--
-- ORDER BY:  `id_enseignant`

/*!40000 ALTER TABLE `enseignants` DISABLE KEYS */;
/*!40000 ALTER TABLE `enseignants` ENABLE KEYS */;

--
-- Table structure for table `enseignements`
--

DROP TABLE IF EXISTS `enseignements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enseignements` (
  `id_enseignement` int NOT NULL AUTO_INCREMENT,
  `code_ressource` varchar(10) NOT NULL,
  `id_enseignant` int NOT NULL,
  PRIMARY KEY (`id_enseignement`),
  UNIQUE KEY `enseignements_id_enseignant_code_ressource_a531109b_uniq` (`id_enseignant`,`code_ressource`),
  KEY `enseignements_code_ressource_125f8733_fk_ressource` (`code_ressource`),
  CONSTRAINT `enseignements_code_ressource_125f8733_fk_ressource` FOREIGN KEY (`code_ressource`) REFERENCES `ressources` (`code_ressource`),
  CONSTRAINT `enseignements_id_enseignant_52d38e1e_fk_enseignan` FOREIGN KEY (`id_enseignant`) REFERENCES `enseignants` (`id_enseignant`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enseignements`
--
-- ORDER BY:  `id_enseignement`

/*!40000 ALTER TABLE `enseignements` DISABLE KEYS */;
/*!40000 ALTER TABLE `enseignements` ENABLE KEYS */;

--
-- Table structure for table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etudiants` (
  `id_etudiant` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `groupe` varchar(10) DEFAULT NULL,
  `photo` longtext,
  `email` varchar(255) NOT NULL,
  `utilisateur_id` int NOT NULL,
  PRIMARY KEY (`id_etudiant`),
  UNIQUE KEY `utilisateur_id` (`utilisateur_id`),
  CONSTRAINT `etudiants_utilisateur_id_fda0fd73_fk_auth_user_id` FOREIGN KEY (`utilisateur_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiants`
--
-- ORDER BY:  `id_etudiant`

/*!40000 ALTER TABLE `etudiants` DISABLE KEYS */;
/*!40000 ALTER TABLE `etudiants` ENABLE KEYS */;

--
-- Table structure for table `examens`
--

DROP TABLE IF EXISTS `examens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examens` (
  `id_examen` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `coefficient` int NOT NULL,
  `code_ressource` varchar(10) NOT NULL,
  PRIMARY KEY (`id_examen`),
  KEY `examens_code_ressource_4b9a727a_fk_ressources_code_ressource` (`code_ressource`),
  CONSTRAINT `examens_code_ressource_4b9a727a_fk_ressources_code_ressource` FOREIGN KEY (`code_ressource`) REFERENCES `ressources` (`code_ressource`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examens`
--
-- ORDER BY:  `id_examen`

/*!40000 ALTER TABLE `examens` DISABLE KEYS */;
/*!40000 ALTER TABLE `examens` ENABLE KEYS */;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id_note` int NOT NULL AUTO_INCREMENT,
  `note` decimal(4,2) NOT NULL,
  `appreciation` longtext,
  `id_etudiant` int NOT NULL,
  `id_examen` int NOT NULL,
  PRIMARY KEY (`id_note`),
  UNIQUE KEY `notes_id_etudiant_id_examen_94dde548_uniq` (`id_etudiant`,`id_examen`),
  KEY `notes_id_examen_e7e2f7b6_fk_examens_id_examen` (`id_examen`),
  CONSTRAINT `notes_id_etudiant_ac1a5fef_fk_etudiants_id_etudiant` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiants` (`id_etudiant`),
  CONSTRAINT `notes_id_examen_e7e2f7b6_fk_examens_id_examen` FOREIGN KEY (`id_examen`) REFERENCES `examens` (`id_examen`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--
-- ORDER BY:  `id_note`

/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;

--
-- Table structure for table `ressources`
--

DROP TABLE IF EXISTS `ressources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ressources` (
  `code_ressource` varchar(10) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `descriptif` longtext,
  `coefficient` int NOT NULL,
  PRIMARY KEY (`code_ressource`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ressources`
--
-- ORDER BY:  `code_ressource`

/*!40000 ALTER TABLE `ressources` DISABLE KEYS */;
/*!40000 ALTER TABLE `ressources` ENABLE KEYS */;

--
-- Table structure for table `ue`
--

DROP TABLE IF EXISTS `ue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ue` (
  `code_ue` varchar(10) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `semestre` int NOT NULL,
  `credits_ects` int NOT NULL,
  PRIMARY KEY (`code_ue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ue`
--
-- ORDER BY:  `code_ue`

/*!40000 ALTER TABLE `ue` DISABLE KEYS */;
/*!40000 ALTER TABLE `ue` ENABLE KEYS */;

--
-- Dumping events for database 'sae_23'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-15 19:48:06
