-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: nishino
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.20.04.1

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,1,'Category 1','category-1','2023-04-14 08:19:04','2023-04-14 08:19:04'),(2,NULL,1,'Category 2','category-2','2023-04-14 08:19:04','2023-04-14 08:19:04');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(22,4,'id','number','ID',1,0,0,0,0,0,NULL,1),(23,4,'parent_id','select_dropdown','Parent',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(24,4,'order','text','Order',1,1,1,1,1,1,'{\"default\":1}',3),(25,4,'name','text','Name',1,1,1,1,1,1,NULL,4),(26,4,'slug','text','Slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(27,4,'created_at','timestamp','Created At',0,0,1,0,0,0,NULL,6),(28,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(29,5,'id','number','ID',1,0,0,0,0,0,NULL,1),(30,5,'author_id','text','Author',1,0,1,1,0,1,NULL,2),(31,5,'category_id','text','Category',1,0,1,1,1,0,NULL,3),(32,5,'title','text','Title',1,1,1,1,1,1,NULL,4),(33,5,'excerpt','text_area','Excerpt',1,0,1,1,1,1,NULL,5),(34,5,'body','rich_text_box','Body',1,0,1,1,1,1,NULL,6),(35,5,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(36,5,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}',8),(37,5,'meta_description','text_area','Meta Description',1,0,1,1,1,1,NULL,9),(38,5,'meta_keywords','text_area','Meta Keywords',1,0,1,1,1,1,NULL,10),(39,5,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(40,5,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,12),(41,5,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,13),(42,5,'seo_title','text','SEO Title',0,1,1,1,1,1,NULL,14),(43,5,'featured','checkbox','Featured',1,1,1,1,1,1,NULL,15),(44,6,'id','number','ID',1,0,0,0,0,0,NULL,1),(45,6,'author_id','text','Author',1,0,0,0,0,0,NULL,2),(46,6,'title','text','Title',1,1,1,1,1,1,NULL,3),(47,6,'excerpt','text_area','Excerpt',1,0,1,1,1,1,NULL,4),(48,6,'body','rich_text_box','Body',1,0,1,1,1,1,NULL,5),(49,6,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}',6),(50,6,'meta_description','text','Meta Description',1,0,1,1,1,1,NULL,7),(51,6,'meta_keywords','text','Meta Keywords',1,0,1,1,1,1,NULL,8),(52,6,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(53,6,'created_at','timestamp','Created At',1,1,1,0,0,0,NULL,10),(54,6,'updated_at','timestamp','Updated At',1,0,0,0,0,0,NULL,11),(55,6,'image','image','Page Image',0,1,1,1,1,1,NULL,12),(56,8,'id','text','Id',1,0,0,0,0,0,'{}',1),(57,8,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',3),(58,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(59,8,'name','text','Name',1,1,1,1,1,1,'{}',5),(60,8,'whatsapp','text','Whatsapp',0,1,1,1,1,1,'{}',6),(61,8,'origin','text','Origin',0,0,1,1,1,1,'{}',7),(62,8,'email','text','Email',1,0,1,1,1,1,'{}',8),(63,8,'orcamento','text','Orcamento',0,0,1,1,1,1,'{}',9),(66,8,'funnel_id','text','Funnel Id',1,1,1,1,1,1,'{}',2),(67,8,'proximo_contato','text','Proximo Contato',0,0,1,1,1,1,'{}',12),(68,8,'address','text','Address',0,0,1,1,1,1,'{}',11),(69,8,'body','text','Body',0,0,1,1,1,1,'{}',12),(70,8,'cta','text','Cta',0,0,1,1,1,1,'{}',13),(71,9,'id','text','Id',1,0,0,0,0,0,'{}',1),(72,9,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',2),(73,9,'updated_at','timestamp','Updated At',0,0,1,0,0,1,'{}',3),(74,9,'nome','text','Nome',1,1,1,1,1,1,'{}',4),(75,9,'slug','text','Slug',1,0,1,1,1,1,'{}',5),(76,9,'descricao_pt','text_area','Descricao Pt',1,0,1,1,1,1,'{}',6),(77,9,'descricao_en','text_area','Descricao En',1,0,1,1,1,1,'{}',7),(78,9,'descricao_es','text_area','Descricao Es',1,0,1,1,1,1,'{}',8),(79,9,'cliente','text','Cliente',1,1,1,1,1,1,'{}',9),(80,9,'data','text','Data',1,0,1,1,1,1,'{}',10),(81,9,'cover','image','Cover',1,0,1,1,1,1,'{}',11),(82,9,'site','text','Site',0,0,1,1,1,1,'{}',12),(83,9,'estoria_pt','rich_text_box','Estoria Pt',1,0,1,1,1,1,'{}',13),(84,9,'estoria_en','rich_text_box','Estoria En',1,0,1,1,1,1,'{}',14),(85,9,'estoria_es','rich_text_box','Estoria Es',1,0,1,1,1,1,'{}',15),(86,9,'chips','text','Chips',1,0,1,1,1,1,'{}',16),(87,9,'galeria','multiple_images','Galeria',1,0,1,1,1,1,'{}',17);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2023-04-14 08:18:52','2023-04-14 08:18:52'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2023-04-14 08:18:52','2023-04-14 08:18:52'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2023-04-14 08:18:52','2023-04-14 08:18:52'),(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,NULL,'2023-04-14 08:19:04','2023-04-14 08:19:04'),(5,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy','','',1,0,NULL,'2023-04-14 08:19:04','2023-04-14 08:19:04'),(6,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,NULL,'2023-04-14 08:19:04','2023-04-14 08:19:04'),(8,'leads','leads','Lead','Leads','voyager-paper-plane','App\\Models\\Lead',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2023-06-08 00:01:51','2023-11-10 10:55:25'),(9,'projects','projects','Projeto','Projetos','voyager-folder','App\\Models\\Project',NULL,NULL,NULL,1,0,'{\"order_column\":\"id\",\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2023-11-10 11:37:32','2023-11-10 11:41:28');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funnels`
--

DROP TABLE IF EXISTS `funnels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funnels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funnels`
--

LOCK TABLES `funnels` WRITE;
/*!40000 ALTER TABLE `funnels` DISABLE KEYS */;
INSERT INTO `funnels` VALUES (1,'2023-06-25 18:12:34','2023-06-25 18:12:34','default','#000000','default');
/*!40000 ALTER TABLE `funnels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_history`
--

DROP TABLE IF EXISTS `lead_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lead_id` bigint unsigned DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_history_lead_id_foreign` (`lead_id`),
  CONSTRAINT `lead_history_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_history`
--

LOCK TABLES `lead_history` WRITE;
/*!40000 ALTER TABLE `lead_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `whatsapp` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orcamento` varchar(220) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `funnel_id` bigint unsigned NOT NULL DEFAULT '1',
  `proximo_contato` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `cta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leads_funnel_id_foreign` (`funnel_id`),
  CONSTRAINT `leads_funnel_id_foreign` FOREIGN KEY (`funnel_id`) REFERENCES `funnels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2023-04-14 08:18:52','2023-04-14 08:18:52','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,5,'2023-04-14 08:18:52','2023-11-10 11:38:00','voyager.media.index',NULL),(3,1,'Users','','_self','voyager-person',NULL,5,2,'2023-04-14 08:18:52','2023-11-10 11:38:06','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,5,3,'2023-04-14 08:18:52','2023-11-10 11:38:06','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,8,'2023-04-14 08:18:52','2023-11-10 11:38:00',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,4,'2023-04-14 08:18:52','2023-11-10 11:38:06','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,5,'2023-04-14 08:18:52','2023-11-10 11:38:06','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,6,'2023-04-14 08:18:52','2023-11-10 11:38:06','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,7,'2023-04-14 08:18:52','2023-11-10 11:38:06','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,5,1,'2023-04-14 08:18:52','2023-11-10 11:38:06','voyager.settings.index',NULL),(11,1,'Categories','','_self','voyager-categories',NULL,NULL,7,'2023-04-14 08:19:04','2023-11-10 11:38:00','voyager.categories.index',NULL),(12,1,'Posts','','_self','voyager-news',NULL,NULL,3,'2023-04-14 08:19:04','2023-11-10 10:54:05','voyager.posts.index',NULL),(13,1,'Pages','','_self','voyager-file-text',NULL,NULL,6,'2023-04-14 08:19:05','2023-11-10 11:38:00','voyager.pages.index',NULL),(14,1,'Leads','','_self','voyager-paper-plane','#ae00ff',NULL,2,'2023-06-08 00:01:51','2023-11-10 11:32:41','voyager.leads.index','null'),(15,1,'Projetos','','_self','voyager-folder',NULL,NULL,4,'2023-11-10 11:37:32','2023-11-10 11:37:52','voyager.projects.index',NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2023-04-14 08:18:52','2023-04-14 08:18:52');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_01_01_000000_create_pages_table',1),(6,'2016_01_01_000000_create_posts_table',1),(7,'2016_02_15_204651_create_categories_table',1),(8,'2016_05_19_173453_create_menu_table',1),(9,'2016_10_21_190000_create_roles_table',1),(10,'2016_10_21_190000_create_settings_table',1),(11,'2016_11_30_135954_create_permission_table',1),(12,'2016_11_30_141208_create_permission_role_table',1),(13,'2016_12_26_201236_data_types__add__server_side',1),(14,'2017_01_13_000000_add_route_to_menu_items_table',1),(15,'2017_01_14_005015_create_translations_table',1),(16,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(17,'2017_03_06_000000_add_controller_to_data_types_table',1),(18,'2017_04_11_000000_alter_post_nullable_fields_table',1),(19,'2017_04_21_000000_add_order_to_data_rows_table',1),(20,'2017_07_05_210000_add_policyname_to_data_types_table',1),(21,'2017_08_05_000000_add_group_to_settings_table',1),(22,'2017_11_26_013050_add_user_role_relationship',1),(23,'2017_11_26_015000_create_user_roles_table',1),(24,'2018_03_11_000000_add_user_settings',1),(25,'2018_03_14_000000_add_details_to_data_types_table',1),(26,'2018_03_16_000000_make_settings_value_nullable',1),(27,'2019_08_19_000000_create_failed_jobs_table',1),(28,'2019_12_14_000001_create_personal_access_tokens_table',1),(29,'2023_03_31_181002_create_leads_table',1),(30,'2023_03_31_181823_create_funnels_table',1),(31,'2023_03_31_181957_add_field_to_leads',1),(32,'2023_03_31_182307_create_lead_history_table',1),(33,'2023_04_14_012754_aumentar_tamanho_leads_table',1),(34,'2023_10_27_145732_ajustar_leads_table',2),(35,'2023_10_27_151256_create_projects_table',2),(36,'2023_11_10_044719_add_body_column_to_leads_table',2),(37,'2023_11_17_213623_change_proximo_contato',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,'Hello World','Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.','<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','pages/page1.jpg','hello-world','Yar Meta Description','Keyword1, Keyword2','ACTIVE','2023-04-14 08:19:05','2023-04-14 08:19:05');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2023-04-14 08:18:52','2023-04-14 08:18:52'),(2,'browse_bread',NULL,'2023-04-14 08:18:52','2023-04-14 08:18:52'),(3,'browse_database',NULL,'2023-04-14 08:18:52','2023-04-14 08:18:52'),(4,'browse_media',NULL,'2023-04-14 08:18:52','2023-04-14 08:18:52'),(5,'browse_compass',NULL,'2023-04-14 08:18:52','2023-04-14 08:18:52'),(6,'browse_menus','menus','2023-04-14 08:18:52','2023-04-14 08:18:52'),(7,'read_menus','menus','2023-04-14 08:18:52','2023-04-14 08:18:52'),(8,'edit_menus','menus','2023-04-14 08:18:52','2023-04-14 08:18:52'),(9,'add_menus','menus','2023-04-14 08:18:52','2023-04-14 08:18:52'),(10,'delete_menus','menus','2023-04-14 08:18:52','2023-04-14 08:18:52'),(11,'browse_roles','roles','2023-04-14 08:18:52','2023-04-14 08:18:52'),(12,'read_roles','roles','2023-04-14 08:18:52','2023-04-14 08:18:52'),(13,'edit_roles','roles','2023-04-14 08:18:52','2023-04-14 08:18:52'),(14,'add_roles','roles','2023-04-14 08:18:52','2023-04-14 08:18:52'),(15,'delete_roles','roles','2023-04-14 08:18:52','2023-04-14 08:18:52'),(16,'browse_users','users','2023-04-14 08:18:52','2023-04-14 08:18:52'),(17,'read_users','users','2023-04-14 08:18:52','2023-04-14 08:18:52'),(18,'edit_users','users','2023-04-14 08:18:52','2023-04-14 08:18:52'),(19,'add_users','users','2023-04-14 08:18:52','2023-04-14 08:18:52'),(20,'delete_users','users','2023-04-14 08:18:52','2023-04-14 08:18:52'),(21,'browse_settings','settings','2023-04-14 08:18:52','2023-04-14 08:18:52'),(22,'read_settings','settings','2023-04-14 08:18:52','2023-04-14 08:18:52'),(23,'edit_settings','settings','2023-04-14 08:18:52','2023-04-14 08:18:52'),(24,'add_settings','settings','2023-04-14 08:18:52','2023-04-14 08:18:52'),(25,'delete_settings','settings','2023-04-14 08:18:52','2023-04-14 08:18:52'),(26,'browse_categories','categories','2023-04-14 08:19:04','2023-04-14 08:19:04'),(27,'read_categories','categories','2023-04-14 08:19:04','2023-04-14 08:19:04'),(28,'edit_categories','categories','2023-04-14 08:19:04','2023-04-14 08:19:04'),(29,'add_categories','categories','2023-04-14 08:19:04','2023-04-14 08:19:04'),(30,'delete_categories','categories','2023-04-14 08:19:04','2023-04-14 08:19:04'),(31,'browse_posts','posts','2023-04-14 08:19:04','2023-04-14 08:19:04'),(32,'read_posts','posts','2023-04-14 08:19:04','2023-04-14 08:19:04'),(33,'edit_posts','posts','2023-04-14 08:19:04','2023-04-14 08:19:04'),(34,'add_posts','posts','2023-04-14 08:19:04','2023-04-14 08:19:04'),(35,'delete_posts','posts','2023-04-14 08:19:04','2023-04-14 08:19:04'),(36,'browse_pages','pages','2023-04-14 08:19:05','2023-04-14 08:19:05'),(37,'read_pages','pages','2023-04-14 08:19:05','2023-04-14 08:19:05'),(38,'edit_pages','pages','2023-04-14 08:19:05','2023-04-14 08:19:05'),(39,'add_pages','pages','2023-04-14 08:19:05','2023-04-14 08:19:05'),(40,'delete_pages','pages','2023-04-14 08:19:05','2023-04-14 08:19:05'),(41,'browse_leads','leads','2023-06-08 00:01:51','2023-06-08 00:01:51'),(42,'read_leads','leads','2023-06-08 00:01:51','2023-06-08 00:01:51'),(43,'edit_leads','leads','2023-06-08 00:01:51','2023-06-08 00:01:51'),(44,'add_leads','leads','2023-06-08 00:01:51','2023-06-08 00:01:51'),(45,'delete_leads','leads','2023-06-08 00:01:51','2023-06-08 00:01:51'),(46,'browse_projects','projects','2023-11-10 11:37:32','2023-11-10 11:37:32'),(47,'read_projects','projects','2023-11-10 11:37:32','2023-11-10 11:37:32'),(48,'edit_projects','projects','2023-11-10 11:37:32','2023-11-10 11:37:32'),(49,'add_projects','projects','2023-11-10 11:37:32','2023-11-10 11:37:32'),(50,'delete_projects','projects','2023-11-10 11:37:32','2023-11-10 11:37:32');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (5,1,1,'Desbloqueando o Algoritmo do Twitter',NULL,'Fábio Akita descreve a diferença entre projetos \"artesanais\" e as soluções adotadas nas gigantes','<p><iframe title=\"YouTube video player\" src=\"https://www.youtube.com/embed/uIflMYQnp8A\" width=\"560\" height=\"315\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen=\"allowfullscreen\"></iframe></p>','posts/April2023/7QOjeYfq7Q3WUo9mrMBu.png','desbloqueando-o-algoritmo-do-twitter',NULL,NULL,'PUBLISHED',0,'2023-04-17 09:18:50','2023-04-17 09:18:50'),(6,1,1,'Injeção de Dependência com Diego Antunes',NULL,'Usando classes abstratas em Flutter e os benefícios da injeção de dependência','<p><iframe title=\"YouTube video player\" src=\"https://www.youtube.com/embed/lCKvjVhtHTw\" width=\"560\" height=\"315\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen=\"allowfullscreen\"></iframe></p>','posts/April2023/JTC8dWgb7cHaTHcP8YGT.png','injecao-de-dependencia-com-diego-antunes',NULL,NULL,'PUBLISHED',0,'2023-04-17 09:20:39','2023-04-17 09:22:45'),(7,1,1,'StatQuest: Histograms',NULL,'StatQuest is a great educational channel for Statistics!','<p><iframe title=\"YouTube video player\" src=\"https://www.youtube.com/embed/qBigTkBLU6g\" width=\"560\" height=\"315\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen=\"allowfullscreen\"></iframe></p>','posts/April2023/YMHGwub7dEtNWNAvAV5F.png','statquest-histograms',NULL,NULL,'PUBLISHED',0,'2023-04-21 23:34:00','2023-04-21 23:34:00'),(8,1,1,'Integrando Firebase com VUEX',NULL,'Excelente tutorial que encontrei em minhas pesquisas','<p><iframe title=\"YouTube video player\" src=\"https://www.youtube.com/embed/qtslO8kXJnU\" width=\"560\" height=\"315\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen=\"allowfullscreen\"></iframe></p>','posts/June2023/CBBV0vqf7rM0B6NAyxmX.png','integrando-firebase-com-vuex',NULL,NULL,'PUBLISHED',0,'2023-06-25 18:53:32','2023-06-25 18:53:32');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao_pt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao_es` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estoria_pt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `estoria_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `estoria_es` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `chips` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galeria` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'2023-11-10 12:03:24','2023-11-20 11:08:03','Diário Corumbaense','diarionline','O Diário Corumbaense circula na cidade de Corumbá, no Mato Grosso do Sul. Foi fundado em 2009 e é o jornal mais antigo da região. O jornal cobre notícias de Corumbá, Ladário e da região do Pantanal.','Diário Corumbaense circulates in the city of Corumbá, in Mato Grosso do Sul. It was founded in 2009 and is the oldest newspaper in the region. The newspaper covers news from Corumbá, Ladário and the Pantanal region.','Diário Corumbaense circula en la ciudad de Corumbá, en Mato Grosso do Sul. Fue fundado en 2009 y es el periódico más antiguo de la región. El periódico cubre noticias de Corumbá, Ladário y la región del Pantanal.','Rosana Nunes','2008 - NOW','projects/November2023/xHJEmHgEW8qA9gbwUGFc.jpg','https://diarionline.com.br','<div class=\"logo-gutter ng-tns-c3627721678-17 ng-star-inserted\">\r\n<div class=\"resize-observable\">O Di&aacute;rio Corumbaense &eacute; um jornal di&aacute;rio publicado em Corumb&aacute;, Brasil. &Eacute; o jornal mais antigo do estado de Mato Grosso do Sul e tem publica&ccedil;&atilde;o cont&iacute;nua desde 2009. O jornal cobre not&iacute;cias locais de Corumb&aacute; e arredores, incluindo Lad&aacute;rio e regi&atilde;o do Pantanal. Tamb&eacute;m possui se&ccedil;&otilde;es de not&iacute;cias, esportes e entretenimento nacionais e internacionais. O Di&aacute;rio Corumbaense est&aacute; dispon&iacute;vel impresso e online.</div>\r\n</div>','<div class=\"logo-gutter ng-tns-c3627721678-17 ng-star-inserted\">\r\n<div class=\"resize-observable\">The Di&aacute;rio Corumbaense is a daily newspaper published in Corumb&aacute;, Brazil. It is the oldest newspaper in the state of Mato Grosso do Sul, and it has been published continuously since 2009. The newspaper covers local news from Corumb&aacute; and the surrounding area, including Lad&aacute;rio and the Pantanal region. It also has sections on national and international news, sports, and entertainment. The Di&aacute;rio Corumbaense is available in print and online.</div>\r\n</div>','<p>El Di&aacute;rio Corumbaense es un diario publicado en Corumb&aacute;, Brasil. Es el peri&oacute;dico m&aacute;s antiguo del estado de Mato Grosso do Sul y se publica de forma ininterrumpida desde 2009. El peri&oacute;dico cubre noticias locales de Corumb&aacute; y sus alrededores, incluidos Lad&aacute;rio y la regi&oacute;n del Pantanal. Tambi&eacute;n cuenta con secciones de noticias, deportes y entretenimiento nacionales e internacionales. El Di&aacute;rio Corumbaense est&aacute; disponible en versi&oacute;n impresa y en l&iacute;nea.</p>','PHP, SCSS, 200k+ Visitors, Main Developer','[\"projects\\/November2023\\/R6crDp7ybHzD3WbXzUKx.png\",\"projects\\/November2023\\/L007Z5bxkldHvLF9RUGv.png\",\"projects\\/November2023\\/f4Zu6vSPNeCsJI5qaCw0.jpg\",\"projects\\/November2023\\/CcLrfPdybxKfU3DXfz6G.jpeg\"]'),(2,'2023-11-10 12:10:09','2023-11-10 13:54:34','VitrineVirtual','vitrinevirtual','Portal de cobertura fotográfica na região de Corumba MS','Photographic coverage portal in the Corumba MS region','Portal de cobertura fotográfica en la región Corumbá MS','VitrineVirtual','2006-NOW','projects/November2023/JPbGBHUpddPOSQgW4aQ8.jpg','https://vitrinevirtual.com','<p dir=\"ltr\">Nosso website surgiu em Corumb&aacute; em 2006 e nosso portal &eacute; focado em cobertura fotogr&aacute;fica nas cidades de Campo Grande, Corumb&aacute;, Lad&aacute;rio e Porto Suarez (BO). Sempre estivemos presentes nos melhores eventos da regi&atilde;o.</p>','<p>Our website was created in Corumb&aacute; in 2006 and our portal is focused on photographic coverage in the cities of Campo Grande, Corumb&aacute;, Lad&aacute;rio and Porto Suarez (BO). We have always been present at the best events in the region.</p>','<p>Nuestro sitio web fue creado en Corumb&aacute; en 2006 y nuestro portal est&aacute; enfocado a la cobertura fotogr&aacute;fica en las ciudades de Campo Grande, Corumb&aacute;, Lad&aacute;rio y Porto Suarez (BO). Siempre hemos estado presentes en los mejores eventos de la regi&oacute;n.</p>','Laravel, Digital Ocean,  Main Developer','[\"projects\\/November2023\\/DTO6V05d2o8W00OzInKt.png\",\"projects\\/November2023\\/bK1ZuFHaY665XIxi6HGJ.jpg\",\"projects\\/November2023\\/aUiT9AzL1Twcjjx1AzJX.jpg\"]'),(3,'2023-11-10 13:03:40','2023-11-20 11:02:29','Domicílio Digital','domiciliodigital','Subprojeto do SIG Gestão Municipal desenvolvido em parceria com a  WV Engenharia Perícias e Avaliações LTDA.','Subproject of the Municipal Management GIS developed in partnership with WV Engenharia Perícias e Avaliações LTDA.','Subproyecto del SIG de Gestión Municipal desarrollado en colaboración con WV Engenharia Perícias e Avaliações LTDA.','WV Engenharia Perícias e Avaliações LTDA.','2018-NOW','projects/November2023/Xael8tbbzIvcsv4l2gx0.jpg','https://domiciliodigital.com.br','<p>O maior desafio desse projeto foi o login com tokens Certisign</p>','<p>The biggest challenge of this project was logging in with Certisign tokens</p>','<p>El mayor desaf&iacute;o de este proyecto fue iniciar sesi&oacute;n con tokens Certisign.</p>','Laravel, Partnership,  Login with Certisign Token','[\"projects\\/November2023\\/41GqxIzgYwan6JF3wKry.png\",\"projects\\/November2023\\/hfcrn5mZlWAJxu8v4qE6.png\"]'),(4,'2023-11-10 13:22:06','2023-11-20 11:00:58','Show de Prêmios Pantanal','showdepremios','Desenvolvimento de Página Web, Aplicativo de Logística e Consultoria','Web Page Development, Logistics Application and Consulting','Desarrollo de Página Web, Aplicación Logística y Consultoría','Galo de Ouro LTDA','2019-NOW','projects/November2023/a52abzNJYbBnhaSl57Pn.jpg','https://showdepremiospantanal.com.br','<p>Atendemos crian&ccedil;as e adolescente na faixa et&aacute;ria 6 a 18 anos aonde desenvolvemos atividades de futebol, tendo como objetivo principal os valores da educa&ccedil;&atilde;o sendo que todos estejam estudando.</p>','<p>em inglesWe serve children and teenagers aged 6 to 18 years old, where we develop football activities, with the main objective being the values of education, ensuring that everyone is studying.</p>','<p>Atendemos a ni&ntilde;os y adolescentes de 6 a 18 a&ntilde;os, donde desarrollamos actividades futbol&iacute;sticas, teniendo como objetivo principal la educaci&oacute;n en valores, logrando que todos estudien.</p>','Laravel, Cordova, Firebase, Consulting','[\"projects\\/November2023\\/0r2W43Ley2YMrDnRfVDy.jpg\",\"projects\\/November2023\\/AbkoSR2KOuTHCHGqjBsH.png\"]'),(5,'2023-11-10 13:46:52','2023-11-20 11:12:01','CaimanSYS','caimansys','CaimanSYS é um aplicativo para coleta de biodados em campo da Caimasul, fazenda produtora de Carne Caiman.','CaimanSYS is an app for in-field biodata collection for Caimasul, a farm that produces Caiman Meat.','CaimanSYS es una aplicación para la recolección de biodatos en campo de Caimasul, finca productora de Carne de Caimán.','Caimasul','2015-NOW','projects/November2023/JQfcpIPiWIA7a2kyxk6H.jpg','https://caimasul.com','<p>Este sistema coleta dados em campo e os sincroniza quando os apps est&atilde;o online</p>','<p>This system collects data in the field and synchronizes it when the apps are online</p>','<p>Este sistema recopila datos en el campo y los sincroniza cuando las aplicaciones est&aacute;n en l&iacute;nea</p>','Cordova, Onsen Framework, Firebase, GPS','[\"projects\\/November2023\\/8s9ZMXZd2D0UegyWpwzu.jpeg\",\"projects\\/November2023\\/YbhLj1ue1zUFSmF5C6gk.jpg\"]'),(6,'2023-11-10 14:12:15','2023-11-20 11:09:52','Coester','coester','Provedora de soluções integradas para automação de válvulas e sistemas de automação para os mais diversos segmentos da indústria, como Saneamento, Óleo&Gás, Mineração, Siderurgia, entre outros.','Provider of integrated solutions for valve automation and automation systems for the most diverse industry segments, such as Sanitation, Oil&Gas, Mining, Steel, among others.','Proveedor de soluciones integradas para automatización de válvulas y sistemas de automatización para los más diversos segmentos de la industria, como Saneamiento, Oil&Gas, Minería, Siderurgia, entre otros.','Ezoom','2022','projects/November2023/L7KgJaoLS00HZrbIbdyy.jpeg','https://coester.com.br','<p>Eu trabalhei neste projeto como Lider de equipe</p>','<p>I worked on this project as Team Leader</p>','<p>Trabaj&eacute; en este proyecto como l&iacute;der de equipo.</p>','Project Leader, Laravel, Strapi CMS','[\"projects\\/November2023\\/sXFCvOfvyuaeIp2MEunK.jpeg\",\"projects\\/November2023\\/SgADtc7zX4P4zfmh0H4z.png\"]');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2023-04-14 08:18:52','2023-04-14 08:18:52'),(2,'user','Normal User','2023-04-14 08:18:52','2023-04-14 08:18:52');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Site Title','','text',1,'Site'),(2,'site.description','Site Description','Site Description','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID','','','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','Voyager','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)','','','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'data_types','display_name_singular',5,'pt','Post','2023-04-14 08:19:05','2023-04-14 08:19:05'),(2,'data_types','display_name_singular',6,'pt','Página','2023-04-14 08:19:05','2023-04-14 08:19:05'),(3,'data_types','display_name_singular',1,'pt','Utilizador','2023-04-14 08:19:05','2023-04-14 08:19:05'),(4,'data_types','display_name_singular',4,'pt','Categoria','2023-04-14 08:19:05','2023-04-14 08:19:05'),(5,'data_types','display_name_singular',2,'pt','Menu','2023-04-14 08:19:05','2023-04-14 08:19:05'),(6,'data_types','display_name_singular',3,'pt','Função','2023-04-14 08:19:05','2023-04-14 08:19:05'),(7,'data_types','display_name_plural',5,'pt','Posts','2023-04-14 08:19:05','2023-04-14 08:19:05'),(8,'data_types','display_name_plural',6,'pt','Páginas','2023-04-14 08:19:05','2023-04-14 08:19:05'),(9,'data_types','display_name_plural',1,'pt','Utilizadores','2023-04-14 08:19:05','2023-04-14 08:19:05'),(10,'data_types','display_name_plural',4,'pt','Categorias','2023-04-14 08:19:05','2023-04-14 08:19:05'),(11,'data_types','display_name_plural',2,'pt','Menus','2023-04-14 08:19:05','2023-04-14 08:19:05'),(12,'data_types','display_name_plural',3,'pt','Funções','2023-04-14 08:19:05','2023-04-14 08:19:05'),(13,'categories','slug',1,'pt','categoria-1','2023-04-14 08:19:05','2023-04-14 08:19:05'),(14,'categories','name',1,'pt','Categoria 1','2023-04-14 08:19:05','2023-04-14 08:19:05'),(15,'categories','slug',2,'pt','categoria-2','2023-04-14 08:19:05','2023-04-14 08:19:05'),(16,'categories','name',2,'pt','Categoria 2','2023-04-14 08:19:05','2023-04-14 08:19:05'),(17,'pages','title',1,'pt','Olá Mundo','2023-04-14 08:19:05','2023-04-14 08:19:05'),(18,'pages','slug',1,'pt','ola-mundo','2023-04-14 08:19:05','2023-04-14 08:19:05'),(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2023-04-14 08:19:05','2023-04-14 08:19:05'),(20,'menu_items','title',1,'pt','Painel de Controle','2023-04-14 08:19:05','2023-04-14 08:19:05'),(21,'menu_items','title',2,'pt','Media','2023-04-14 08:19:05','2023-04-14 08:19:05'),(22,'menu_items','title',12,'pt','Publicações','2023-04-14 08:19:05','2023-04-14 08:19:05'),(23,'menu_items','title',3,'pt','Utilizadores','2023-04-14 08:19:05','2023-04-14 08:19:05'),(24,'menu_items','title',11,'pt','Categorias','2023-04-14 08:19:05','2023-04-14 08:19:05'),(25,'menu_items','title',13,'pt','Páginas','2023-04-14 08:19:05','2023-04-14 08:19:05'),(26,'menu_items','title',4,'pt','Funções','2023-04-14 08:19:05','2023-04-14 08:19:05'),(27,'menu_items','title',5,'pt','Ferramentas','2023-04-14 08:19:05','2023-04-14 08:19:05'),(28,'menu_items','title',6,'pt','Menus','2023-04-14 08:19:05','2023-04-14 08:19:05'),(29,'menu_items','title',7,'pt','Base de dados','2023-04-14 08:19:05','2023-04-14 08:19:05'),(30,'menu_items','title',10,'pt','Configurações','2023-04-14 08:19:05','2023-04-14 08:19:05');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Nishino','rodrigo.nsh@gmail.com','users/default.png',NULL,'$2y$10$NR2R6EvkgJ4bmeeZAZMeceQV2AH9XnjYvCzo9ez2SrHj7fIZHIulm','v3iepAKZS0PSKLiwSyVujPlf4Gg5uQVeeRsO91jGZ25L7pSeNj74NyCfqEoV',NULL,'2023-04-14 08:19:04','2023-06-07 23:59:50');
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

-- Dump completed on 2023-11-25  9:46:10
