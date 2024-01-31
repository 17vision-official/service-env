-- MySQL dump 10.13  Distrib 5.7.40, for Linux (x86_64)
--
-- Host: localhost    Database: fast_php_server
-- ------------------------------------------------------
-- Server version	5.7.40-0ubuntu0.18.04.1

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
-- Table structure for table `failed_jobs`
--

CREATE DATABASE IF NOT EXISTS fast_php_server CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `fast_activity`
--

DROP TABLE IF EXISTS `fast_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fast_activity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `activity_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动代码',
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动主题',
  `people_count` int(11) NOT NULL DEFAULT '0' COMMENT '活动人数',
  `time_start` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `time_end` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `space_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '空间类型 1标准 2个性化 3专属',
  `visibility` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动可见性 open公开 privacy隐私',
  `is_password` tinyint(1) DEFAULT '0' COMMENT '是否需要密码 1是0否',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码值',
  `desc` text COLLATE utf8mb4_unicode_ci COMMENT '活动描述',
  `share_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分享码',
  `user_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建用户',
  `team_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织代码',
  `file_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件代码',
  PRIMARY KEY (`id`),
  KEY `fast_activity_activity_code_index` (`activity_code`),
  KEY `fast_activity_theme_index` (`theme`),
  KEY `fast_activity_people_count_index` (`people_count`),
  KEY `fast_activity_time_start_index` (`time_start`),
  KEY `fast_activity_time_end_index` (`time_end`),
  KEY `fast_activity_space_type_index` (`space_type`),
  KEY `fast_activity_visibility_index` (`visibility`),
  KEY `fast_activity_is_password_index` (`is_password`),
  KEY `fast_activity_share_code_index` (`share_code`),
  KEY `fast_activity_user_code_index` (`user_code`),
  KEY `fast_activity_team_code_index` (`team_code`),
  KEY `fast_activity_file_code_index` (`file_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fast_activity`
--

LOCK TABLES `fast_activity` WRITE;
/*!40000 ALTER TABLE `fast_activity` DISABLE KEYS */;
INSERT INTO `fast_activity` VALUES (1,'2023-01-09 08:14:28','2023-01-09 08:14:28','11bcd797-472e-4aa4-a13f-63ad1c3415cc','测试活动',3,'2023-01-09 16:00:00','2023-01-14 16:00:00','1','open',1,'111',NULL,NULL,'73179af0-7190-4b10-88a6-9105591415f8','e9e1aa3c-e611-454e-8773-f6ab0f0b84c7','2f1042dc-c29f-4a1c-a31d-96a3cdfe0b0f');
/*!40000 ALTER TABLE `fast_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fast_file_user`
--

DROP TABLE IF EXISTS `fast_file_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fast_file_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `file_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件代码',
  `user_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户代码',
  `source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件来源',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件使用类型',
  PRIMARY KEY (`id`),
  KEY `fast_file_user_file_code_index` (`file_code`),
  KEY `fast_file_user_user_code_index` (`user_code`),
  KEY `fast_file_user_source_index` (`source`),
  KEY `fast_file_user_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fast_file_user`
--

LOCK TABLES `fast_file_user` WRITE;
/*!40000 ALTER TABLE `fast_file_user` DISABLE KEYS */;
INSERT INTO `fast_file_user` VALUES (1,'2023-01-09 08:08:41','2023-01-09 08:08:41','2f1042dc-c29f-4a1c-a31d-96a3cdfe0b0f','73179af0-7190-4b10-88a6-9105591415f8','CreateTeamComponent',NULL);
/*!40000 ALTER TABLE `fast_file_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fast_template_case`
--

DROP TABLE IF EXISTS `fast_template_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fast_template_case` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `case_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '案例代码',
  `case_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '案例名称',
  `form_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板代码',
  `type_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型代码',
  `user_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户代码',
  `desc` text COLLATE utf8mb4_unicode_ci COMMENT '案例描述',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间时间',
  `is_perpetual` tinyint(1) DEFAULT NULL COMMENT '是否是长期活动 1是 0否',
  `enter_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '进入权限 open 公开 shut私有',
  `enter_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '进入口令',
  `invitation_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邀请码',
  `is_publish` tinyint(1) DEFAULT NULL COMMENT '是否已发布',
  `is_close` tinyint(1) DEFAULT NULL COMMENT '是否已关闭',
  PRIMARY KEY (`id`),
  KEY `fast_template_case_case_code_index` (`case_code`),
  KEY `fast_template_case_case_name_index` (`case_name`),
  KEY `fast_template_case_form_code_index` (`form_code`),
  KEY `fast_template_case_type_code_index` (`type_code`),
  KEY `fast_template_case_user_code_index` (`user_code`),
  KEY `fast_template_case_start_time_index` (`start_time`),
  KEY `fast_template_case_end_time_index` (`end_time`),
  KEY `fast_template_case_is_perpetual_index` (`is_perpetual`),
  KEY `fast_template_case_enter_type_index` (`enter_type`),
  KEY `fast_template_case_enter_key_index` (`enter_key`),
  KEY `fast_template_case_invitation_code_index` (`invitation_code`),
  KEY `fast_template_case_is_publish_index` (`is_publish`),
  KEY `fast_template_case_is_close_index` (`is_close`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fast_template_case`
--

LOCK TABLES `fast_template_case` WRITE;
/*!40000 ALTER TABLE `fast_template_case` DISABLE KEYS */;
/*!40000 ALTER TABLE `fast_template_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fast_template_form`
--

DROP TABLE IF EXISTS `fast_template_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fast_template_form` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `form_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板代码',
  `form_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '模板名称',
  `type_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型代码',
  `scene_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '基础场景代码',
  `user_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户代码',
  `desc` text COLLATE utf8mb4_unicode_ci COMMENT '模板描述',
  `case_data` longtext COLLATE utf8mb4_unicode_ci COMMENT '案例插槽数据',
  `is_public` tinyint(1) DEFAULT NULL COMMENT '是否公共模板',
  `person_count` int(11) DEFAULT NULL COMMENT '场景人数',
  `img` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fast_template_form`
--

LOCK TABLES `fast_template_form` WRITE;
/*!40000 ALTER TABLE `fast_template_form` DISABLE KEYS */;
INSERT INTO `fast_template_form` VALUES (1,NULL,NULL,'56fa3ff6-10cb-4db6-86e7-826d1bd9d29f','标准模板1','9d48d4ed-69a0-4bb9-ae5e-c31b3148a007','fe21794f-aeb6-4ac0-b81f-1d128cf77df3','admin','标准模板1',NULL,1,55,'http://47.102.216.114:8084/storage/jpg/4e4cd9b6-51d5-410e-bbf1-f6919a6c6733/cropped.jpg'),(2,NULL,NULL,'553a7a18-d0c1-420c-8150-ec2f8dd82413','标准模板2','9d48d4ed-69a0-4bb9-ae5e-c31b3148a007','57111b66-caa7-4221-9324-8e1536af414d','admin','标准模板2',NULL,1,25,'http://47.102.216.114:8084/storage/jpg/4e4cd9b6-51d5-410e-bbf1-f6919a6c6733/cropped.jpg'),(3,NULL,NULL,'a6e8f095-c54e-40d6-bd28-bbc409d9cc7e','标准模板3','a9b4e1d1-1ac9-413b-abbc-f08c3f979f5d','fe21794f-aeb6-4ac0-b81f-1d128cf77df3','admin','标准模板3',NULL,1,35,'http://47.102.216.114:8084/storage/jpg/4e4cd9b6-51d5-410e-bbf1-f6919a6c6733/cropped.jpg'),(4,NULL,NULL,'9f20cf87-c7bd-4a7d-b97d-b65e0c3ec115','标准模板4','b0ebbaa2-3524-42e2-8722-b5d1b39c7b9d','57111b66-caa7-4221-9324-8e1536af414d','admin','标准模板4',NULL,1,55,'http://47.102.216.114:8084/storage/jpg/4e4cd9b6-51d5-410e-bbf1-f6919a6c6733/cropped.jpg'),(5,NULL,NULL,'5d760622-128f-48b1-a59c-3d9f3b0a6657','标准模板5','5bcda3be-d630-4c05-9830-46c63af31972','fe21794f-aeb6-4ac0-b81f-1d128cf77df3','admin','标准模板5',NULL,1,55,'http://47.102.216.114:8084/storage/jpg/4e4cd9b6-51d5-410e-bbf1-f6919a6c6733/cropped.jpg');
/*!40000 ALTER TABLE `fast_template_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fast_template_scene`
--

DROP TABLE IF EXISTS `fast_template_scene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fast_template_scene` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `scene_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '基础场景代码',
  `scene_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '基础场景名称',
  `scene_area` double(9,2) DEFAULT NULL COMMENT '场景面积',
  `slot_count` int(11) DEFAULT NULL COMMENT '插槽数量',
  `person_count` int(11) DEFAULT NULL COMMENT '场景人数',
  PRIMARY KEY (`id`),
  KEY `fast_template_scene_scene_code_index` (`scene_code`),
  KEY `fast_template_scene_scene_name_index` (`scene_name`),
  KEY `fast_template_scene_scene_area_index` (`scene_area`),
  KEY `fast_template_scene_slot_count_index` (`slot_count`),
  KEY `fast_template_scene_person_count_index` (`person_count`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fast_template_scene`
--

LOCK TABLES `fast_template_scene` WRITE;
/*!40000 ALTER TABLE `fast_template_scene` DISABLE KEYS */;
INSERT INTO `fast_template_scene` VALUES (1,NULL,NULL,'fe21794f-aeb6-4ac0-b81f-1d128cf77df3','一号场景',800.25,25,50),(2,NULL,NULL,'57111b66-caa7-4221-9324-8e1536af414d','二号场景',1500.00,45,100);
/*!40000 ALTER TABLE `fast_template_scene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fast_template_type`
--

DROP TABLE IF EXISTS `fast_template_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fast_template_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型代码',
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型名称',
  `sort` int(11) DEFAULT NULL COMMENT '类型排序',
  PRIMARY KEY (`id`),
  KEY `fast_template_type_type_code_index` (`type_code`),
  KEY `fast_template_type_type_name_index` (`type_name`),
  KEY `fast_template_type_sort_index` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fast_template_type`
--

LOCK TABLES `fast_template_type` WRITE;
/*!40000 ALTER TABLE `fast_template_type` DISABLE KEYS */;
INSERT INTO `fast_template_type` VALUES (1,NULL,NULL,'9d48d4ed-69a0-4bb9-ae5e-c31b3148a007','会议',1),(2,NULL,NULL,'a9b4e1d1-1ac9-413b-abbc-f08c3f979f5d','发布会',2),(3,NULL,NULL,'b0ebbaa2-3524-42e2-8722-b5d1b39c7b9d','展厅',3),(4,NULL,NULL,'5bcda3be-d630-4c05-9830-46c63af31972','主题馆',4);
/*!40000 ALTER TABLE `fast_template_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fast_user`
--

DROP TABLE IF EXISTS `fast_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fast_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户代码',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fast_user_user_code_unique` (`user_code`),
  KEY `fast_user_name_index` (`name`),
  KEY `fast_user_phone_index` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fast_user`
--

LOCK TABLES `fast_user` WRITE;
/*!40000 ALTER TABLE `fast_user` DISABLE KEYS */;
INSERT INTO `fast_user` VALUES (1,'2023-01-09 08:04:04','2023-01-09 08:04:04','73179af0-7190-4b10-88a6-9105591415f8','18501653192','18501653192','202cb962ac59075b964b07152d234b70','昵称1'),(2,'2023-01-09 08:15:30','2023-01-09 08:15:30','850d090a-1b20-4bec-af0b-9bb231a231b5','1234','1234','202cb962ac59075b964b07152d234b70','昵称1'),(3,'2023-03-01 08:10:49','2023-03-01 08:10:49','e968ed67-24c3-44c6-8baf-661b0af7a2a3','123','123','202cb962ac59075b964b07152d234b70','昵称1'),(4,'2023-03-13 02:31:31','2023-03-13 02:31:31','7b174a3a-7bcb-4248-b659-bc26a77d79c9','456','456','c6b83b23fe1ce27c3f575bbe0d8caf7a','昵称1'),(5,'2023-03-14 07:07:04','2023-03-14 07:07:04','2dc0602b-b631-4af9-920c-f28f38e643bc','789','789','c6b83b23fe1ce27c3f575bbe0d8caf7a','啊啊啊'),(6,'2023-03-24 05:32:42','2023-03-24 05:32:42','2ff976f7-632a-48a5-8b06-4d40e734a737','012','012','c6b83b23fe1ce27c3f575bbe0d8caf7a','WAWAWA'),(7,'2023-04-04 09:58:20','2023-04-04 09:58:20','bb6bba5a-2752-473d-b4ec-f25ee6cf4a14','12334564564','12334564564','9098da28455943deb9b9c4c97488eac9','dgfsdrfg'),(8,'2023-04-04 10:04:17','2023-04-04 10:04:17','8ae62b74-95d4-4315-a0c2-fc9a7acbb786','111','111','253f0881582cea0acfcba45120872a0e','111'),(9,'2023-04-04 10:23:41','2023-04-04 10:23:41','059177ec-a9e1-4fe2-875c-2732d861229b','1','1','b19ccd2da0bb254c472339c6395c9360','1'),(10,'2023-04-04 10:36:50','2023-04-04 10:36:50','9a790bb5-d22e-49d4-aea8-aa3543c39b30','2','2','8c2bc266a52b72e64042b757ea7563c2','2'),(11,'2023-04-07 07:52:00','2023-04-07 07:52:00','f1752e1a-a6af-4bc6-a4bd-93533836f9c3','11','11','fcbe1292daeac408166d3a6eb0819255','11'),(12,'2023-04-11 08:56:12','2023-04-11 08:56:12','57a5e6ab-cf3e-4b11-b328-86ae909bb5b7','18438009142','18438009142','285c96f7702357c07f9b5daee2660e79','Lzx'),(13,'2023-04-26 04:16:28','2023-04-26 04:16:28','c119d0e0-c85c-4c07-9010-5ac9d2f66675','3','3','d3271c22f8523e722ad8401e67ce929e','3'),(14,'2023-04-26 05:30:13','2023-04-26 05:30:13','01f3c23a-053e-4732-8beb-3f4ab19d7a7e','4','4','0dddeacacb9ff8694b13710d23ed2d50','4'),(15,'2023-05-29 09:50:09','2023-05-29 09:50:09','5c0e6e60-174b-4ceb-bbfd-c233b5b03e53','13482830559','13482830559','285c96f7702357c07f9b5daee2660e79','子秋'),(16,'2023-05-29 10:04:20','2023-05-29 10:04:20','9c2ea2f4-ad66-4fca-9e6e-b991141b1825','13585561487','13585561487','285c96f7702357c07f9b5daee2660e79','RAY'),(17,'2023-05-29 10:04:57','2023-05-29 10:04:57','daf168d8-1df5-4a18-ac10-48741b668f62','18861216558','18861216558','285c96f7702357c07f9b5daee2660e79','董于璇'),(18,'2023-05-29 10:05:15','2023-05-29 10:05:15','4604dfe8-aa55-4da1-a983-091c67d3189a','13816232524','13816232524','5f6be03cd17ca97d398d47e12ed78c5e','Simon'),(19,'2023-05-29 10:05:50','2023-05-29 10:05:50','62a175a9-9752-4ef0-9449-cd40eb1a2d96','13774447730','13774447730','285c96f7702357c07f9b5daee2660e79','donjqin'),(20,'2023-05-29 10:05:50','2023-05-29 10:05:50','719f59ef-b57b-4f99-9a0c-9824d4ad85de','123456','123456','285c96f7702357c07f9b5daee2660e79','123456'),(21,'2023-05-29 10:06:12','2023-05-29 10:06:12','481ee4ed-58e0-46d2-81af-401cd95ced04','13196815966','13196815966','285c96f7702357c07f9b5daee2660e79','董嘉庆'),(22,'2023-05-29 10:06:18','2023-05-29 10:06:18','865d5393-4d67-4a08-b0b2-032227edefe2','18501653193','18501653193','285c96f7702357c07f9b5daee2660e79','重装算算'),(23,'2023-05-29 10:07:00','2023-05-29 10:07:00','aaa80dc9-1fc5-439f-a19f-d1b022870fae','18516382820','18516382820','c0d51e16a81c366ac7693055b0c13ef8','Jojo'),(24,'2023-05-29 10:08:00','2023-05-29 10:08:00','768fbcb5-53c2-4edd-8e74-a2e334c5421f','15936328912','15936328912','285c96f7702357c07f9b5daee2660e79','CHD'),(25,'2023-05-29 10:14:46','2023-05-29 10:14:46','98d5ab9d-3f08-4127-bb7d-bd3a5de697e7','22','22','bbb28f26d4f7f785502dc3859f9bd70d','22'),(26,'2023-07-05 02:32:37','2023-07-05 02:32:37','6c914d3a-1a03-4a60-b85e-9bfd5ba8ca14','11122','11122','7b404f55dd8aac140dd6e8b58600dd7b','11122'),(27,'2023-10-11 11:31:11','2023-10-11 11:31:11','381e03c7-e15a-4998-bb23-002371c95316','1001','1001','6552f5e85a9dee6a5ef87460acb17c15','Lzx6'),(28,'2023-10-11 15:36:29','2023-10-11 15:36:29','95cdfc5d-f59e-4d54-89c7-25720f517dbb','222','222','fad6ead94d68178299f52e4f343286b3','222'),(29,'2023-10-14 09:22:58','2023-10-14 09:22:58','7cad1b86-e7a7-4460-a257-5ffadb9ac22d','1002','1002','6552f5e85a9dee6a5ef87460acb17c15','1002'),(30,'2023-10-14 09:26:17','2023-10-14 09:26:17','492a63a1-b07d-458d-ba03-311b67b9951f','2001','2001','231c02d085786db87a98decdb1f1c028','2001'),(31,'2023-10-14 09:27:52','2023-10-14 09:27:52','bb36e472-e67b-4469-9ff5-1b5f08f0fcd4','2002','2002','231c02d085786db87a98decdb1f1c028','2002'),(32,'2023-10-14 09:27:56','2023-10-14 09:27:56','cadb717b-fc77-4930-bbc8-9dedb96eb707','2003','2003','231c02d085786db87a98decdb1f1c028','2003'),(33,'2023-10-14 09:28:00','2023-10-14 09:28:00','595464da-1061-41dc-bf51-8ed90279e05a','2004','2004','231c02d085786db87a98decdb1f1c028','2004'),(34,'2023-10-14 09:28:03','2023-10-14 09:28:03','2fe3ea57-8786-4a02-a0b0-132ea99bb2ac','2005','2005','231c02d085786db87a98decdb1f1c028','2005'),(35,'2023-10-14 09:28:08','2023-10-14 09:28:08','09f66c89-6cc5-4616-a7e4-69e7c596cfe4','2006','2006','231c02d085786db87a98decdb1f1c028','2006'),(36,'2023-10-14 09:28:11','2023-10-14 09:28:11','80ae328a-bb77-435c-a390-fa76dfa28e7f','2007','2007','231c02d085786db87a98decdb1f1c028','2007'),(37,'2023-10-14 09:28:16','2023-10-14 09:28:16','7153a4a4-89c0-4197-a82b-420985aef0e1','2008','2008','231c02d085786db87a98decdb1f1c028','2008'),(38,'2023-10-14 09:28:20','2023-10-14 09:28:20','28dd9e22-7f2c-4d88-80ed-bb4ff000d9ac','2009','2009','231c02d085786db87a98decdb1f1c028','2009'),(39,'2023-10-14 09:28:27','2023-10-14 09:28:27','1797806c-e822-40ce-9148-315b0e881ae6','20010','20010','231c02d085786db87a98decdb1f1c028','20010'),(40,'2023-10-14 09:28:31','2023-10-14 09:28:31','3136ca5d-1a81-4a57-a3c9-0b58496a6077','20011','20011','231c02d085786db87a98decdb1f1c028','20011'),(41,'2023-10-14 09:28:33','2023-10-14 09:28:33','e2265d6d-07d3-45a0-96c1-1799f0b3595a','20012','20012','231c02d085786db87a98decdb1f1c028','20012'),(42,'2023-10-14 09:28:36','2023-10-14 09:28:36','c369fa7a-68dc-4538-a542-7c2dee8d1cef','20013','20013','231c02d085786db87a98decdb1f1c028','20013'),(43,'2023-10-14 09:28:39','2023-10-14 09:28:39','960b717e-a629-470d-8fc5-8e2ee757582c','20014','20014','231c02d085786db87a98decdb1f1c028','20014'),(44,'2023-10-14 09:28:44','2023-10-14 09:28:44','70ccea4d-4872-44c2-a096-782eba1d09e5','20015','20015','231c02d085786db87a98decdb1f1c028','20015'),(45,'2023-10-14 09:28:48','2023-10-14 09:28:48','dc57522c-3080-4a67-8ea3-aed41f2d067e','20016','20016','231c02d085786db87a98decdb1f1c028','20016'),(46,'2023-10-14 09:28:53','2023-10-14 09:28:53','4dedd1b8-ab15-442b-82ab-587cb7f3c5a4','20017','20017','231c02d085786db87a98decdb1f1c028','20017'),(47,'2023-10-14 09:28:57','2023-10-14 09:28:57','bff6e5a5-160d-4f0d-a54b-23ae7067a30d','20018','20018','231c02d085786db87a98decdb1f1c028','20018'),(48,'2023-10-14 09:29:02','2023-10-14 09:29:02','5dbfdf45-8a72-4fb3-89f2-2948ae540dd2','20019','20019','231c02d085786db87a98decdb1f1c028','20019'),(49,'2023-10-14 09:29:07','2023-10-14 09:29:07','497416fa-c37c-458c-9388-d69101fa60eb','20020','20020','231c02d085786db87a98decdb1f1c028','20020'),(50,'2023-10-15 08:29:35','2023-10-15 08:29:35','0e4010cd-e24d-49f5-8f10-38ef3f464588','test01','test01','6beaf1b7e9c197700cdd10d3dbcdce8c','test01'),(51,'2023-10-15 08:30:13','2023-10-15 08:30:13','98f5b749-422c-4bd1-a3a5-27f1d04d35bb','test02','test02','6beaf1b7e9c197700cdd10d3dbcdce8c','test02'),(52,'2023-10-20 07:01:50','2023-10-20 07:01:50','fc02f1f5-1544-4a3c-98da-783becf23e8a','d1001','d1001','6beaf1b7e9c197700cdd10d3dbcdce8c','d1001'),(53,'2023-10-20 07:02:30','2023-10-20 07:02:30','4e3f1199-f3a2-4a66-9730-3a50c04d6ace','d1002','d1002','6beaf1b7e9c197700cdd10d3dbcdce8c','d1002'),(54,'2023-10-20 07:07:48','2023-10-20 07:07:48','7d88fea8-b75f-47cf-9e8b-b990a89c21e9','d2001','d2001','231c02d085786db87a98decdb1f1c028','d2001'),(55,'2023-10-20 07:07:50','2023-10-20 07:07:50','6f2ee476-0bc1-44ff-b28b-c95dff438136','d2002','d2002','231c02d085786db87a98decdb1f1c028','d2002'),(56,'2023-10-20 07:07:52','2023-10-20 07:07:52','00a174be-6eae-4eb6-925f-f59db0cc2a44','d2003','d2003','231c02d085786db87a98decdb1f1c028','d2003'),(57,'2023-10-20 07:07:54','2023-10-20 07:07:54','459313e7-5d93-4b27-80f9-1bba058d4634','d2004','d2004','231c02d085786db87a98decdb1f1c028','d2004'),(58,'2023-10-20 07:07:56','2023-10-20 07:07:56','923214b9-6772-4d04-8e9f-02a8c89254e7','d2005','d2005','231c02d085786db87a98decdb1f1c028','d2005'),(59,'2023-10-20 07:07:58','2023-10-20 07:07:58','ef6bff26-45aa-41b1-bcfb-6ad4a4a37959','d2006','d2006','231c02d085786db87a98decdb1f1c028','d2006'),(60,'2023-10-20 07:08:00','2023-10-20 07:08:00','e16b6903-4c27-4bcf-8f3f-955730054abe','d2007','d2007','231c02d085786db87a98decdb1f1c028','d2007'),(61,'2023-10-20 07:08:02','2023-10-20 07:08:02','4b228f7b-ceca-46db-94cb-0dd138776b47','d2008','d2008','231c02d085786db87a98decdb1f1c028','d2008'),(62,'2023-10-20 07:08:04','2023-10-20 07:08:04','aab5cc5f-3027-45f6-867d-b6a0c4af1880','d2009','d2009','231c02d085786db87a98decdb1f1c028','d2009'),(63,'2023-10-20 07:08:06','2023-10-20 07:08:06','29165dcc-2e2a-43c9-8223-f705eec14ab0','d20010','d20010','231c02d085786db87a98decdb1f1c028','d20010'),(64,'2023-10-20 07:08:08','2023-10-20 07:08:08','8e586b1f-bc40-48a9-9f16-2469ab39571b','d20011','d20011','231c02d085786db87a98decdb1f1c028','d20011'),(65,'2023-10-20 07:08:10','2023-10-20 07:08:10','01ea29d4-8204-44b8-98fe-344d59fe76f2','d20012','d20012','231c02d085786db87a98decdb1f1c028','d20012'),(66,'2023-10-20 07:08:12','2023-10-20 07:08:12','e2d3b131-914e-4f8a-8071-c2abd2542def','d20013','d20013','231c02d085786db87a98decdb1f1c028','d20013'),(67,'2023-10-20 07:08:14','2023-10-20 07:08:14','dcefd1b0-c61d-4853-87cd-59f019c441e6','d20014','d20014','231c02d085786db87a98decdb1f1c028','d20014'),(68,'2023-10-20 07:08:16','2023-10-20 07:08:16','554e8ec7-e3db-40cf-94da-a2df39a15362','d20015','d20015','231c02d085786db87a98decdb1f1c028','d20015'),(69,'2023-10-20 07:08:18','2023-10-20 07:08:18','12ae051c-b370-4891-8044-91dc17f9b48e','d20016','d20016','231c02d085786db87a98decdb1f1c028','d20016'),(70,'2023-10-20 07:08:20','2023-10-20 07:08:20','ebb935c1-bf9b-435d-a0be-04ec87c748a9','d20017','d20017','231c02d085786db87a98decdb1f1c028','d20017'),(71,'2023-10-20 07:08:22','2023-10-20 07:08:22','4b379487-272d-4c66-9966-a92803dd0584','d20018','d20018','231c02d085786db87a98decdb1f1c028','d20018'),(72,'2023-10-20 07:08:24','2023-10-20 07:08:24','5137993c-4831-4951-b113-06047d92aa7c','d20019','d20019','231c02d085786db87a98decdb1f1c028','d20019'),(73,'2023-10-20 07:08:26','2023-10-20 07:08:26','12f94662-7026-496f-9089-dc953641e137','d20020','d20020','231c02d085786db87a98decdb1f1c028','d20020'),(74,'2023-10-20 10:37:31','2023-10-20 10:37:31','7a0715c4-ae74-4f7d-9005-bd25d51a924a','5','5','3b1b88b54ffa87fa17c1a944e8961714','5'),(75,'2023-10-20 10:37:33','2023-10-20 10:37:33','2b375def-495b-4ef0-aca7-958b9f5c8141','6','6','783d5c6774c0f971e15865f2b2f03ede','6'),(76,'2023-10-20 10:37:35','2023-10-20 10:37:35','b9fcd9dc-4cde-4dfd-9c6e-862fd66438d8','7','7','add9a8beeac498a34f65061934514d1e','7'),(77,'2023-10-20 10:37:37','2023-10-20 10:37:37','2153ce49-b7f8-4abc-9141-5890dfb7a5ae','8','8','85751b3426ccfdb163f4fd4de4e89314','8'),(78,'2023-10-20 10:37:39','2023-10-20 10:37:39','99c767ea-3a4a-43c2-8c21-1319cba8b3a4','9','9','5f56b78416da8a766dc53e5001fd935e','9'),(79,'2023-10-20 10:37:41','2023-10-20 10:37:41','fb30808b-a04c-4628-a0f0-b73e7b539d5e','10','10','2c4faea147596e407ae2af5fefbe2734','10'),(80,'2023-10-20 10:37:45','2023-10-20 10:37:45','57cea72f-162b-42b3-bf1a-f7d02ff11906','12','12','f90950ea44ff0f804c687dfc2a7ecf10','12'),(81,'2023-10-20 10:37:47','2023-10-20 10:37:47','2dbd28dd-35b8-4193-9208-56b7b93431e6','13','13','c66343d2a6f352637e323333c82c3476','13'),(82,'2023-10-20 10:37:49','2023-10-20 10:37:49','3ef9a2f3-de9d-45aa-bc21-7de73e0836c0','14','14','f6eaf438e3fa702f60a337e3e4db76b4','14'),(83,'2023-10-20 10:37:51','2023-10-20 10:37:51','11377d90-efa8-4f56-8550-aabfdbb99fa3','15','15','5862b439256cb153563e1b68e870aded','15'),(84,'2023-10-20 10:37:53','2023-10-20 10:37:53','29fdb269-0c3c-4506-b32c-583a3ab6cfc8','16','16','60472bba8c0463a0cfd31e770477168e','16'),(85,'2023-10-20 10:37:55','2023-10-20 10:37:55','44b1723c-6b06-49dc-b63f-4c9569206205','17','17','04563d7d1c6978f18efe4be446ad0319','17'),(86,'2023-10-20 10:37:57','2023-10-20 10:37:57','781fe36c-6fe2-4397-a899-de8f8c9f0e57','18','18','60a15248d14a769ea447ed5c6ae05b45','18'),(87,'2023-10-20 10:37:59','2023-10-20 10:37:59','870308b0-ba71-440b-8c7f-e18e7e3ebcaa','19','19','4cc586e13d488c1e53fc06818aec74b6','19'),(88,'2023-10-20 10:38:01','2023-10-20 10:38:01','ddece9c8-0e95-4b21-8523-d7ac2da221e4','20','20','dc32735b8227585eab86eb5345811596','20'),(89,'2023-10-20 10:38:03','2023-10-20 10:38:03','96516d95-2b12-4e3f-9600-400e769c72a2','21','21','f694cfd09453319c61e2df604bb07240','21'),(90,'2023-10-20 10:38:07','2023-10-20 10:38:07','7c482c94-48b1-4ef7-87aa-5e9ef97c32f1','23','23','0faaa7d538fcfe2a8f1e58115540564f','23'),(91,'2023-10-20 10:38:09','2023-10-20 10:38:09','009b10aa-0281-4853-88a7-0e1429729f62','24','24','d6a0bbbc3efb0117a1c1fe7977b57d26','24'),(92,'2023-10-20 10:38:11','2023-10-20 10:38:11','7719c5b6-a943-4080-887d-f166eb8734a0','25','25','9c5119f7d301958f2c91b959e48d6d25','25'),(93,'2023-10-20 10:38:13','2023-10-20 10:38:13','5a6ddbdf-796a-405f-bb26-bcf70b602023','26','26','eb8b72ef4fdf85baa35bc30f284ad8c5','26'),(94,'2023-10-20 10:38:15','2023-10-20 10:38:15','5e39a34c-8ac7-49ba-948b-873c87947768','27','27','ec3b14a6485e27946489fa17d6745b6c','27'),(95,'2023-10-20 10:38:17','2023-10-20 10:38:17','b5a3f42e-3f27-40f6-8c95-46c93dd7c708','28','28','527e40c2364b14a748215d0f115a4fcb','28'),(96,'2023-10-20 10:38:19','2023-10-20 10:38:19','4852ef39-28b2-410c-b5b0-f35c63787249','29','29','5a9509caa1346688e4fcedc63fca21cc','29'),(97,'2023-10-20 10:38:21','2023-10-20 10:38:21','9eb2067b-9c99-4771-9e52-e7fe99a5d7cf','30','30','c99a71a08c1aabc08b2eccab365ad819','30'),(98,'2023-10-20 10:38:23','2023-10-20 10:38:23','e1e9aa0b-29f1-4637-86f2-ba607ee98ea2','31','31','e036010abc00ccb6123217e4d0d85f68','31'),(99,'2023-10-20 10:40:31','2023-10-20 10:40:31','25be431e-e069-4430-8d98-1c55e8670151','32','32','02a0ff0ddaaeef62c5ee5c6715461188','32'),(100,'2023-10-20 10:40:33','2023-10-20 10:40:33','5b348ee2-8777-4b12-84f8-a278b106491c','33','33','9f8c401fc276e5300690014db5a4a310','33'),(101,'2023-10-20 10:40:35','2023-10-20 10:40:35','624a6243-e5ee-46d3-ab63-f35dca7f6989','34','34','b6f639d454a2ff470861fe2b4bde30f1','34'),(102,'2023-10-20 10:40:37','2023-10-20 10:40:37','66c73cba-b70f-4356-b311-aa8a463e954a','35','35','11221c3c0a127400bcf6b0af1e73623e','35'),(103,'2023-10-31 09:48:51','2023-10-31 09:48:51','aed7580c-feb6-43e4-b433-cf88d5c77b3b','1003','1003','6beaf1b7e9c197700cdd10d3dbcdce8c','1003'),(104,'2023-10-31 09:48:53','2023-10-31 09:48:53','64976cd7-d7ff-472d-a953-647703cf1742','1004','1004','6beaf1b7e9c197700cdd10d3dbcdce8c','1004'),(105,'2023-10-31 09:48:55','2023-10-31 09:48:55','4a2e32cd-25d1-4169-bd3f-6ba2ac1df921','1005','1005','6beaf1b7e9c197700cdd10d3dbcdce8c','1005'),(106,'2023-10-31 09:48:57','2023-10-31 09:48:57','c614ff89-b142-4a0d-a6f7-6d2dc2069c71','ycsj1','ycsj1','6beaf1b7e9c197700cdd10d3dbcdce8c','ycsj1'),(107,'2023-10-31 09:48:59','2023-10-31 09:48:59','7150e936-12cf-46d2-a165-93e6a7ce1ae5','ycsj2','ycsj2','6beaf1b7e9c197700cdd10d3dbcdce8c','ycsj2'),(108,'2023-10-31 09:49:04','2023-10-31 09:49:04','8b3a28a7-e3d4-4a99-94e1-5fe734352b08','20021','20021','231c02d085786db87a98decdb1f1c028','20021'),(109,'2023-10-31 09:49:06','2023-10-31 09:49:06','474d7e26-979e-4de0-8c38-975024ea6fdc','20022','20022','231c02d085786db87a98decdb1f1c028','20022'),(110,'2023-10-31 09:49:08','2023-10-31 09:49:08','4176d190-8068-487a-8f59-903b041e96b8','20023','20023','231c02d085786db87a98decdb1f1c028','20023'),(111,'2023-10-31 09:49:10','2023-10-31 09:49:10','d9a09fd1-9d73-4e90-9e28-42e862514ff0','20024','20024','231c02d085786db87a98decdb1f1c028','20024'),(112,'2023-10-31 09:49:12','2023-10-31 09:49:12','d6d8f336-66f5-4f76-bbc4-067cd62a2cc1','20025','20025','231c02d085786db87a98decdb1f1c028','20025'),(113,'2023-10-31 09:49:14','2023-10-31 09:49:14','0522affc-e230-431d-a2f3-9582defa6106','20026','20026','231c02d085786db87a98decdb1f1c028','20026'),(114,'2023-10-31 09:49:16','2023-10-31 09:49:16','ce7c01a8-8dc6-4eac-94d6-36e20a2bfb1a','20027','20027','231c02d085786db87a98decdb1f1c028','20027'),(115,'2023-10-31 09:49:18','2023-10-31 09:49:18','fe99403e-524e-4949-86e3-a6ff22810f0e','20028','20028','231c02d085786db87a98decdb1f1c028','20028'),(116,'2023-10-31 09:49:20','2023-10-31 09:49:20','335b1d70-88f2-45f5-9057-3bcd377bce2b','20029','20029','231c02d085786db87a98decdb1f1c028','20029'),(117,'2023-10-31 09:49:22','2023-10-31 09:49:22','1730d52c-7737-44d7-bbb3-ffc166fff4f0','20030','20030','231c02d085786db87a98decdb1f1c028','20030'),(118,'2023-10-31 09:51:08','2023-10-31 09:51:08','f0b6b198-abb5-4b77-9682-23063faafee1','20031','20031','231c02d085786db87a98decdb1f1c028','20031'),(119,'2023-10-31 09:51:10','2023-10-31 09:51:10','f557a01f-74e9-4f38-acf7-2f7f11dd28b5','20032','20032','231c02d085786db87a98decdb1f1c028','20032'),(120,'2023-10-31 09:51:12','2023-10-31 09:51:12','0b411d5e-ed5a-4edd-90f4-4f3c60d1a790','20033','20033','231c02d085786db87a98decdb1f1c028','20033'),(121,'2023-10-31 09:51:14','2023-10-31 09:51:14','b90a464f-6bad-4a2d-b92b-630f19af9923','20034','20034','231c02d085786db87a98decdb1f1c028','20034'),(122,'2023-10-31 09:51:16','2023-10-31 09:51:16','bcd35988-649d-40f6-8875-031313c18e31','20035','20035','231c02d085786db87a98decdb1f1c028','20035'),(123,'2023-10-31 09:51:18','2023-10-31 09:51:18','13659118-5efc-482a-a6a3-4deef899c189','20036','20036','231c02d085786db87a98decdb1f1c028','20036'),(124,'2023-10-31 09:51:20','2023-10-31 09:51:20','a776e63a-523a-43fa-be7e-797ad70ce7a3','20037','20037','231c02d085786db87a98decdb1f1c028','20037'),(125,'2023-10-31 09:51:22','2023-10-31 09:51:22','e2edd276-6f36-45bb-971e-cc4d35705656','20038','20038','231c02d085786db87a98decdb1f1c028','20038'),(126,'2023-10-31 09:51:24','2023-10-31 09:51:24','78656cee-6e45-4aa5-ba5b-d5ac8e1d7acd','20039','20039','231c02d085786db87a98decdb1f1c028','20039'),(127,'2023-10-31 09:51:26','2023-10-31 09:51:26','4755dfe9-88da-41e3-8306-fe84ca0623db','20040','20040','231c02d085786db87a98decdb1f1c028','20040'),(128,'2023-10-31 09:51:28','2023-10-31 09:51:28','5c3eb870-0873-4d94-9604-7f05bfc5cc46','20041','20041','231c02d085786db87a98decdb1f1c028','20041'),(129,'2023-10-31 09:51:30','2023-10-31 09:51:30','e53384d0-6e08-482a-92d2-fc991371329f','20042','20042','231c02d085786db87a98decdb1f1c028','20042'),(130,'2023-10-31 09:51:32','2023-10-31 09:51:32','0c51016a-4d56-49ed-8986-7a98920bbc99','20043','20043','231c02d085786db87a98decdb1f1c028','20043'),(131,'2023-10-31 09:51:34','2023-10-31 09:51:34','ddbe65af-e54d-4864-be1a-6d2f9c29096c','20044','20044','231c02d085786db87a98decdb1f1c028','20044'),(132,'2023-10-31 09:51:36','2023-10-31 09:51:36','2775b7af-3d24-40ab-93d4-75b1a599fe7e','20045','20045','231c02d085786db87a98decdb1f1c028','20045'),(133,'2023-10-31 09:51:38','2023-10-31 09:51:38','e22437e4-646d-4c95-9fed-d899891b4d0d','20046','20046','231c02d085786db87a98decdb1f1c028','20046'),(134,'2023-10-31 09:51:40','2023-10-31 09:51:40','8f1d52d3-57e5-4315-819d-eb3d909b00cf','20047','20047','231c02d085786db87a98decdb1f1c028','20047'),(135,'2023-10-31 09:51:42','2023-10-31 09:51:42','a1e4788d-c81a-4761-93f9-0e62d4328f24','20048','20048','231c02d085786db87a98decdb1f1c028','20048'),(136,'2023-10-31 09:51:44','2023-10-31 09:51:44','00aae3fd-0314-4138-bd48-ebf80cdbd6b0','20049','20049','231c02d085786db87a98decdb1f1c028','20049'),(137,'2023-10-31 09:51:46','2023-10-31 09:51:46','e8b8976f-952b-4faa-a88c-0b9afe124fee','20050','20050','231c02d085786db87a98decdb1f1c028','20050');
/*!40000 ALTER TABLE `fast_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fast_user_data`
--

DROP TABLE IF EXISTS `fast_user_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fast_user_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户代码',
  `sex` int(11) NOT NULL COMMENT '性别 1男 2女',
  `avatar` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fast_user_data_user_code_index` (`user_code`),
  KEY `fast_user_data_sex_index` (`sex`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fast_user_data`
--

LOCK TABLES `fast_user_data` WRITE;
/*!40000 ALTER TABLE `fast_user_data` DISABLE KEYS */;
INSERT INTO `fast_user_data` VALUES (1,'2023-06-25 07:51:34','2023-06-25 07:51:34','850d090a-1b20-4bec-af0b-9bb231a231b5',1,'{\"Width\":\"1280\",\"Height\":\"720\"}'),(2,'2023-06-26 10:47:25','2023-09-07 07:51:13','059177ec-a9e1-4fe2-875c-2732d861229b',2,'{\"IsWoman\":true,\"Hair\":\"tf_0\",\"SY\":\"sy_2\",\"Shou\":\"shou_2\",\"KZ\":\"kz_2\",\"XZ\":\"xz_2\",\"LBZS\":\"yj_0\",\"HZ\":\"hz_0\"}'),(3,'2023-06-27 09:19:22','2023-09-01 06:43:13','9a790bb5-d22e-49d4-aea8-aa3543c39b30',1,'{\"IsWoman\":false,\"Hair\":\"tf_0\",\"SY\":\"sy_1\",\"Shou\":\"shou_1\",\"KZ\":\"kz_1\",\"XZ\":\"xz_1\",\"LBZS\":\"yj_0\",\"HZ\":\"hz_0\"}'),(4,'2023-08-31 08:13:41','2023-08-31 08:13:41','01f3c23a-053e-4732-8beb-3f4ab19d7a7e',2,'{\"IsWoman\":true,\"Hair\":\"tf_0\",\"SY\":\"sy_2\",\"Shou\":\"shou_2\",\"KZ\":\"kz_2\",\"XZ\":\"xz_2\",\"LBZS\":\"yj_0\",\"HZ\":\"hz_0\"}'),(5,'2023-08-31 08:16:01','2023-08-31 08:16:01','9c2ea2f4-ad66-4fca-9e6e-b991141b1825',1,'{\"IsWoman\":false,\"Hair\":\"mz_1\",\"SY\":\"sy_3\",\"Shou\":\"shou_3\",\"KZ\":\"kz_3\",\"XZ\":\"xz_3\",\"LBZS\":\"yj_0\",\"HZ\":\"hz_0\"}'),(6,'2023-08-31 08:17:16','2023-09-01 07:37:44','c119d0e0-c85c-4c07-9010-5ac9d2f66675',1,'{\"IsWoman\":false,\"Hair\":\"mz_5\",\"SY\":\"sy_0\",\"Shou\":\"shou_0\",\"KZ\":\"kz_0\",\"XZ\":\"xz_0\",\"LBZS\":\"yj_3\",\"HZ\":\"hz_6\"}');
/*!40000 ALTER TABLE `fast_user_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fast_user_team_info`
--

DROP TABLE IF EXISTS `fast_user_team_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fast_user_team_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `team_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组织代码',
  `team_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组织名称',
  `file_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'logo',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `fast_user_team_info_team_code_index` (`team_code`),
  KEY `fast_user_team_info_team_name_index` (`team_name`),
  KEY `fast_user_team_info_file_code_index` (`file_code`),
  KEY `fast_user_team_info_email_index` (`email`),
  KEY `fast_user_team_info_desc_index` (`desc`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fast_user_team_info`
--

LOCK TABLES `fast_user_team_info` WRITE;
/*!40000 ALTER TABLE `fast_user_team_info` DISABLE KEYS */;
INSERT INTO `fast_user_team_info` VALUES (1,'2023-01-09 08:09:33','2023-01-09 08:09:33','e9e1aa3c-e611-454e-8773-f6ab0f0b84c7','测试组织','2f1042dc-c29f-4a1c-a31d-96a3cdfe0b0f','1','1'),(2,'2023-06-25 10:12:11','2023-06-25 10:12:11','eeaba6a3-5f8d-4fae-9e91-36c85064a4fc','11123333','e5ce68ba-f9ec-418b-8cf1-ee307c3d4e05',NULL,NULL);
/*!40000 ALTER TABLE `fast_user_team_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fast_user_team_people`
--

DROP TABLE IF EXISTS `fast_user_team_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fast_user_team_people` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `team_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组织代码',
  `user_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户代码',
  `rank` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户身份 admin管理员 normal通常',
  PRIMARY KEY (`id`),
  KEY `fast_user_team_people_team_code_index` (`team_code`),
  KEY `fast_user_team_people_user_code_index` (`user_code`),
  KEY `fast_user_team_people_rank_index` (`rank`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fast_user_team_people`
--

LOCK TABLES `fast_user_team_people` WRITE;
/*!40000 ALTER TABLE `fast_user_team_people` DISABLE KEYS */;
INSERT INTO `fast_user_team_people` VALUES (1,'2023-01-09 08:09:33','2023-01-09 08:09:33','e9e1aa3c-e611-454e-8773-f6ab0f0b84c7','73179af0-7190-4b10-88a6-9105591415f8','admin'),(2,'2023-06-25 10:12:11','2023-06-25 10:12:11','eeaba6a3-5f8d-4fae-9e91-36c85064a4fc','73179af0-7190-4b10-88a6-9105591415f8','admin');
/*!40000 ALTER TABLE `fast_user_team_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fast_verification`
--

DROP TABLE IF EXISTS `fast_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fast_verification` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ver_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '验证码代码',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号码',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '验证码',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '验证码类型',
  `deadline` datetime NOT NULL COMMENT '截止时间',
  PRIMARY KEY (`id`),
  KEY `fast_verification_ver_code_index` (`ver_code`),
  KEY `fast_verification_phone_index` (`phone`),
  KEY `fast_verification_code_index` (`code`),
  KEY `fast_verification_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fast_verification`
--

LOCK TABLES `fast_verification` WRITE;
/*!40000 ALTER TABLE `fast_verification` DISABLE KEYS */;
INSERT INTO `fast_verification` VALUES (5,'2023-06-26 08:12:03','2023-06-26 08:12:03','6f688886-f0ea-4511-a414-9001b8d729c9','18501653192','9336','1','2023-06-26 16:17:03');
/*!40000 ALTER TABLE `fast_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2022_11_03_090621_create_service_file_table',1),(6,'2022_12_19_013826_create_fast_user_table',1),(7,'2023_01_04_081549_create_fast_verification_table',1),(8,'2023_01_06_102518_create_fast_file_user_table',1),(9,'2023_01_06_143023_create_fast_user_team_info_table',1),(10,'2023_01_06_143624_create_fast_user_team_people_table',1),(11,'2023_01_09_110720_create_fast_activity_table',1),(12,'2023_06_25_150107_create_fast_user_data_table',2),(13,'2023_06_25_183627_create_fast_template_type_table',3),(14,'2023_06_26_133817_create_fast_template_scene_table',3),(17,'2023_06_26_140729_create_fast_template_case_table',4),(18,'2023_06_26_161320_create_fast_template_form_table',4),(19,'2023_06_26_182412_create_service_user_file_table',5),(20,'2023_07_04_052456_create_orchid_general_storage_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orchid_general_storage`
--

DROP TABLE IF EXISTS `orchid_general_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orchid_general_storage` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '键',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '值',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orchid_general_storage_key_code_index` (`key_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orchid_general_storage`
--

LOCK TABLES `orchid_general_storage` WRITE;
/*!40000 ALTER TABLE `orchid_general_storage` DISABLE KEYS */;
INSERT INTO `orchid_general_storage` VALUES (1,'9001','{\"file_type\":[\"xlsx\",\"xls\"]}','2023-07-31 05:12:19','2023-07-31 05:12:19'),(2,'id','|','2023-07-31 05:37:03','2023-07-31 05:37:03');
/*!40000 ALTER TABLE `orchid_general_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
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
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
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
-- Table structure for table `service_file`
--

DROP TABLE IF EXISTS `service_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `file_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件代码',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件名',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'url',
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '存储路径',
  `ext_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件后缀名',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `service_file_file_code_index` (`file_code`),
  KEY `service_file_name_index` (`name`),
  KEY `service_file_url_index` (`url`),
  KEY `service_file_ext_name_index` (`ext_name`),
  KEY `service_file_desc_index` (`desc`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_file`
--

LOCK TABLES `service_file` WRITE;
/*!40000 ALTER TABLE `service_file` DISABLE KEYS */;
INSERT INTO `service_file` VALUES (1,'2023-01-09 08:05:10','2023-01-09 08:05:10','4e4cd9b6-51d5-410e-bbf1-f6919a6c6733','cropped','/storage/jpg/4e4cd9b6-51d5-410e-bbf1-f6919a6c6733/cropped.jpg','/data/PHP/fast_php_server/public/storage/jpg/4e4cd9b6-51d5-410e-bbf1-f6919a6c6733/cropped.jpg','jpg',NULL),(2,'2023-01-09 08:05:54','2023-01-09 08:05:54','e66f5fd0-c0b4-4686-8b81-b7bc66f4e674','cropped','/storage/jpg/e66f5fd0-c0b4-4686-8b81-b7bc66f4e674/cropped.jpg','/data/PHP/fast_php_server/public/storage/jpg/e66f5fd0-c0b4-4686-8b81-b7bc66f4e674/cropped.jpg','jpg',NULL),(3,'2023-01-09 08:06:25','2023-01-09 08:06:25','097e81c9-bd6e-4d29-85f8-9c08d39c0a4c','cropped','/storage/jpg/097e81c9-bd6e-4d29-85f8-9c08d39c0a4c/cropped.jpg','/data/PHP/fast_php_server/public/storage/jpg/097e81c9-bd6e-4d29-85f8-9c08d39c0a4c/cropped.jpg','jpg',NULL),(4,'2023-01-09 08:08:41','2023-01-09 08:08:41','2f1042dc-c29f-4a1c-a31d-96a3cdfe0b0f','cropped','/storage/jpg/2f1042dc-c29f-4a1c-a31d-96a3cdfe0b0f/cropped.jpg','/data/PHP/fast_php_server/public/storage/jpg/2f1042dc-c29f-4a1c-a31d-96a3cdfe0b0f/cropped.jpg','jpg',NULL);
/*!40000 ALTER TABLE `service_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_user_file`
--

DROP TABLE IF EXISTS `service_user_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_user_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户代码',
  `file_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件代码',
  `file_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型  图片picture 视频video 音频audio',
  `is_folder` tinyint(1) NOT NULL COMMENT '是否是文件夹 1是0否',
  `tier_first` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第一层级 代码',
  `tier_secondly` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第二层级 代码',
  `folder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件夹名称',
  `preview` longtext COLLATE utf8mb4_unicode_ci COMMENT '预览图',
  PRIMARY KEY (`id`),
  KEY `service_user_file_user_code_index` (`user_code`),
  KEY `service_user_file_file_code_index` (`file_code`),
  KEY `service_user_file_file_type_index` (`file_type`),
  KEY `service_user_file_is_folder_index` (`is_folder`),
  KEY `service_user_file_tier_first_index` (`tier_first`),
  KEY `service_user_file_tier_secondly_index` (`tier_secondly`),
  KEY `service_user_file_folder_name_index` (`folder_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_user_file`
--

LOCK TABLES `service_user_file` WRITE;
/*!40000 ALTER TABLE `service_user_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_user_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2024-01-11 18:21:40
