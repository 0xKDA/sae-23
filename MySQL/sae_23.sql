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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$eXv6ONDs9Sgun5FjGumzu1$ijb6rXR3lmGG/L6CqZXflfipp4RVPnaqShmpBnNNh2M=','2023-06-13 00:19:20.047255',1,'admin','','','admin@notike.tld',1,1,'2023-06-13 00:18:56.810679');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-06-13 00:19:33.928786','1','Eleves',1,'[{\"added\": {}}]',3,1),(2,'2023-06-13 00:19:44.919633','2','Professeurs',1,'[{\"added\": {}}]',3,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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

-- Dump completed on 2023-06-13  2:22:19
