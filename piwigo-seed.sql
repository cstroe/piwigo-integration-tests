-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: 172.17.0.2    Database: piwigo
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `piwigo_caddie`
--

DROP TABLE IF EXISTS `piwigo_caddie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_caddie` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `element_id` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_caddie`
--

LOCK TABLES `piwigo_caddie` WRITE;
/*!40000 ALTER TABLE `piwigo_caddie` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_caddie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_categories`
--

DROP TABLE IF EXISTS `piwigo_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_categories` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `id_uppercat` smallint(5) unsigned DEFAULT NULL,
  `comment` text,
  `dir` varchar(255) DEFAULT NULL,
  `rank` smallint(5) unsigned DEFAULT NULL,
  `status` enum('public','private') NOT NULL DEFAULT 'public',
  `site_id` tinyint(4) unsigned DEFAULT NULL,
  `visible` enum('true','false') NOT NULL DEFAULT 'true',
  `representative_picture_id` mediumint(8) unsigned DEFAULT NULL,
  `uppercats` varchar(255) NOT NULL DEFAULT '',
  `commentable` enum('true','false') NOT NULL DEFAULT 'true',
  `global_rank` varchar(255) DEFAULT NULL,
  `image_order` varchar(128) DEFAULT NULL,
  `permalink` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_i3` (`permalink`),
  KEY `categories_i2` (`id_uppercat`),
  KEY `lastmodified` (`lastmodified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_categories`
--

LOCK TABLES `piwigo_categories` WRITE;
/*!40000 ALTER TABLE `piwigo_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_comments`
--

DROP TABLE IF EXISTS `piwigo_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `author` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `author_id` mediumint(8) unsigned DEFAULT NULL,
  `anonymous_id` varchar(45) NOT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `content` longtext,
  `validated` enum('true','false') NOT NULL DEFAULT 'false',
  `validation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_i2` (`validation_date`),
  KEY `comments_i1` (`image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_comments`
--

LOCK TABLES `piwigo_comments` WRITE;
/*!40000 ALTER TABLE `piwigo_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_config`
--

DROP TABLE IF EXISTS `piwigo_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_config` (
  `param` varchar(40) NOT NULL DEFAULT '',
  `value` text,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`param`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='configuration table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_config`
--

LOCK TABLES `piwigo_config` WRITE;
/*!40000 ALTER TABLE `piwigo_config` DISABLE KEYS */;
INSERT INTO `piwigo_config` VALUES ('activate_comments','true','Global parameter for usage of comments system'),('nb_comment_page','10','number of comments to display on each page'),('log','true','keep an history of visits on your website'),('comments_validation','false','administrators validate users comments before becoming visible'),('comments_forall','false','even guest not registered can post comments'),('comments_order','ASC','comments order on picture page and cie'),('comments_author_mandatory','false','Comment author is mandatory'),('comments_email_mandatory','false','Comment email is mandatory'),('comments_enable_website','true','Enable \"website\" field on add comment form'),('user_can_delete_comment','false','administrators can allow user delete their own comments'),('user_can_edit_comment','false','administrators can allow user edit their own comments'),('email_admin_on_comment_edition','false','Send an email to the administrators when a comment is modified'),('email_admin_on_comment_deletion','false','Send an email to the administrators when a comment is deleted'),('gallery_locked','false','Lock your gallery temporary for non admin users'),('gallery_title','Just another Piwigo gallery','Title at top of each page and for RSS feed'),('rate','false','Rating pictures feature is enabled'),('rate_anonymous','true','Rating pictures feature is also enabled for visitors'),('page_banner','<h1>%gallery_title%</h1>\n\n<p>Welcome to my photo gallery</p>','html displayed on the top each page of your gallery'),('history_admin','false','keep a history of administrator visits on your website'),('history_guest','true','keep a history of guest visits on your website'),('allow_user_registration','true','allow visitors to register?'),('allow_user_customization','true','allow users to customize their gallery?'),('nb_categories_page','12','Param for categories pagination'),('nbm_send_html_mail','true','Send mail on HTML format for notification by mail'),('nbm_send_mail_as','','Send mail as param value for notification by mail'),('nbm_send_detailed_content','true','Send detailed content for notification by mail'),('nbm_complementary_mail_content','','Complementary mail content for notification by mail'),('nbm_send_recent_post_dates','true','Send recent post by dates for notification by mail'),('email_admin_on_new_user','false','Send an email to theadministrators when a user registers'),('email_admin_on_comment','false','Send an email to the administrators when a valid comment is entered'),('email_admin_on_comment_validation','true','Send an email to the administrators when a comment requires validation'),('obligatory_user_mail_address','false','Mail address is obligatory for users'),('c13y_ignore',NULL,'List of ignored anomalies'),('extents_for_templates','a:0:{}','Actived template-extension(s)'),('blk_menubar','','Menubar options'),('menubar_filter_icon','false','Display filter icon'),('index_sort_order_input','true','Display image order selection list'),('index_flat_icon','false','Display flat icon'),('index_posted_date_icon','true','Display calendar by posted date'),('index_created_date_icon','true','Display calendar by creation date icon'),('index_slideshow_icon','true','Display slideshow icon'),('index_new_icon','true','Display new icons next albums and pictures'),('picture_metadata_icon','true','Display metadata icon on picture page'),('picture_slideshow_icon','true','Display slideshow icon on picture page'),('picture_favorite_icon','true','Display favorite icon on picture page'),('picture_download_icon','true','Display download icon on picture page'),('picture_navigation_icons','true','Display navigation icons on picture page'),('picture_navigation_thumb','true','Display navigation thumbnails on picture page'),('picture_menu','false','Show menubar on picture page'),('picture_informations','a:11:{s:6:\"author\";b:1;s:10:\"created_on\";b:1;s:9:\"posted_on\";b:1;s:10:\"dimensions\";b:0;s:4:\"file\";b:0;s:8:\"filesize\";b:0;s:4:\"tags\";b:1;s:10:\"categories\";b:1;s:6:\"visits\";b:1;s:12:\"rating_score\";b:1;s:13:\"privacy_level\";b:1;}','Information displayed on picture page'),('week_starts_on','monday','Monday may not be the first day of the week'),('updates_ignored','a:3:{s:7:\"plugins\";a:0:{}s:6:\"themes\";a:0:{}s:9:\"languages\";a:0:{}}','Extensions ignored for update'),('order_by','ORDER BY date_available DESC, file ASC, id ASC','default photo order'),('order_by_inside_category','ORDER BY date_available DESC, file ASC, id ASC','default photo order inside category'),('original_resize','false',NULL),('original_resize_maxwidth','2016',NULL),('original_resize_maxheight','2016',NULL),('original_resize_quality','95',NULL),('mobile_theme','smartpocket',NULL),('mail_theme','clear',NULL),('picture_sizes_icon','true',NULL),('index_sizes_icon','true',NULL),('index_edit_icon','true',NULL),('index_caddie_icon','true',NULL),('picture_edit_icon','true',NULL),('picture_caddie_icon','true',NULL),('picture_representative_icon','true',NULL),('secret_key','b2752154f5ff53fce06460b764cb7089','a secret key specific to the gallery for internal use'),('piwigo_db_version','2.9',NULL),('smartpocket','a:2:{s:4:\"loop\";b:1;s:8:\"autohide\";i:5000;}',NULL);
/*!40000 ALTER TABLE `piwigo_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_favorites`
--

DROP TABLE IF EXISTS `piwigo_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_favorites` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `image_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_favorites`
--

LOCK TABLES `piwigo_favorites` WRITE;
/*!40000 ALTER TABLE `piwigo_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_group_access`
--

DROP TABLE IF EXISTS `piwigo_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_group_access` (
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_group_access`
--

LOCK TABLES `piwigo_group_access` WRITE;
/*!40000 ALTER TABLE `piwigo_group_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_groups`
--

DROP TABLE IF EXISTS `piwigo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_groups` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `is_default` enum('true','false') NOT NULL DEFAULT 'false',
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_ui1` (`name`),
  KEY `lastmodified` (`lastmodified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_groups`
--

LOCK TABLES `piwigo_groups` WRITE;
/*!40000 ALTER TABLE `piwigo_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_history`
--

DROP TABLE IF EXISTS `piwigo_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '1970-01-01',
  `time` time NOT NULL DEFAULT '00:00:00',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `IP` varchar(15) NOT NULL DEFAULT '',
  `section` enum('categories','tags','search','list','favorites','most_visited','best_rated','recent_pics','recent_cats') DEFAULT NULL,
  `category_id` smallint(5) DEFAULT NULL,
  `tag_ids` varchar(50) DEFAULT NULL,
  `image_id` mediumint(8) DEFAULT NULL,
  `image_type` enum('picture','high','other') DEFAULT NULL,
  `format_id` int(11) unsigned DEFAULT NULL,
  `auth_key_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_history`
--

LOCK TABLES `piwigo_history` WRITE;
/*!40000 ALTER TABLE `piwigo_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_history_summary`
--

DROP TABLE IF EXISTS `piwigo_history_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_history_summary` (
  `year` smallint(4) NOT NULL DEFAULT '0',
  `month` tinyint(2) DEFAULT NULL,
  `day` tinyint(2) DEFAULT NULL,
  `hour` tinyint(2) DEFAULT NULL,
  `nb_pages` int(11) DEFAULT NULL,
  `history_id_from` int(10) unsigned DEFAULT NULL,
  `history_id_to` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `history_summary_ymdh` (`year`,`month`,`day`,`hour`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_history_summary`
--

LOCK TABLES `piwigo_history_summary` WRITE;
/*!40000 ALTER TABLE `piwigo_history_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_history_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_image_category`
--

DROP TABLE IF EXISTS `piwigo_image_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_image_category` (
  `image_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `category_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rank` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`image_id`,`category_id`),
  KEY `image_category_i1` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_image_category`
--

LOCK TABLES `piwigo_image_category` WRITE;
/*!40000 ALTER TABLE `piwigo_image_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_image_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_image_format`
--

DROP TABLE IF EXISTS `piwigo_image_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_image_format` (
  `format_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ext` varchar(255) NOT NULL,
  `filesize` mediumint(9) unsigned DEFAULT NULL,
  PRIMARY KEY (`format_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_image_format`
--

LOCK TABLES `piwigo_image_format` WRITE;
/*!40000 ALTER TABLE `piwigo_image_format` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_image_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_image_tag`
--

DROP TABLE IF EXISTS `piwigo_image_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_image_tag` (
  `image_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tag_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`image_id`,`tag_id`),
  KEY `image_tag_i1` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_image_tag`
--

LOCK TABLES `piwigo_image_tag` WRITE;
/*!40000 ALTER TABLE `piwigo_image_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_image_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_images`
--

DROP TABLE IF EXISTS `piwigo_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_images` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_available` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `date_creation` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `author` varchar(255) DEFAULT NULL,
  `hit` int(10) unsigned NOT NULL DEFAULT '0',
  `filesize` mediumint(9) unsigned DEFAULT NULL,
  `width` smallint(9) unsigned DEFAULT NULL,
  `height` smallint(9) unsigned DEFAULT NULL,
  `coi` char(4) DEFAULT NULL COMMENT 'center of interest',
  `representative_ext` varchar(4) DEFAULT NULL,
  `date_metadata_update` date DEFAULT NULL,
  `rating_score` float(5,2) unsigned DEFAULT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `storage_category_id` smallint(5) unsigned DEFAULT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `md5sum` char(32) DEFAULT NULL,
  `added_by` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rotation` tinyint(3) unsigned DEFAULT NULL,
  `latitude` double(8,6) DEFAULT NULL,
  `longitude` double(9,6) DEFAULT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `images_i2` (`date_available`),
  KEY `images_i3` (`rating_score`),
  KEY `images_i4` (`hit`),
  KEY `images_i5` (`date_creation`),
  KEY `images_i1` (`storage_category_id`),
  KEY `images_i6` (`latitude`),
  KEY `lastmodified` (`lastmodified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_images`
--

LOCK TABLES `piwigo_images` WRITE;
/*!40000 ALTER TABLE `piwigo_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_languages`
--

DROP TABLE IF EXISTS `piwigo_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_languages` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `version` varchar(64) NOT NULL DEFAULT '0',
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_languages`
--

LOCK TABLES `piwigo_languages` WRITE;
/*!40000 ALTER TABLE `piwigo_languages` DISABLE KEYS */;
INSERT INTO `piwigo_languages` VALUES ('af_ZA','auto','Afrikaans [ZA]'),('es_AR','auto','Argentina [AR]'),('az_AZ','auto','Azərbaycanca [AZ]'),('id_ID','auto','Bahasa Indonesia [ID]'),('pt_BR','auto','Brasil [BR]'),('br_FR','auto','Brezhoneg [FR]'),('ca_ES','auto','Català [CA]'),('da_DK','auto','Dansk [DK]'),('de_DE','auto','Deutsch [DE]'),('dv_MV','auto','Dhivehi [MV]'),('en_GB','auto','English [GB]'),('en_UK','auto','English [UK]'),('en_US','auto','English [US]'),('es_ES','auto','Español [ES]'),('eo_EO','auto','Esperanto [EO]'),('et_EE','auto','Estonian [EE]'),('eu_ES','auto','Euskara [ES]'),('fi_FI','auto','Finnish [FI]'),('fr_FR','auto','Français [FR]'),('fr_CA','auto','Français [QC]'),('ga_IE','auto','Gaeilge [IE]'),('gl_ES','auto','Galego [ES]'),('hr_HR','auto','Hrvatski [HR]'),('it_IT','auto','Italiano [IT]'),('lv_LV','auto','Latviešu [LV]'),('lt_LT','auto','Lietuviu [LT]'),('lb_LU','auto','Lëtzebuergesch [LU]'),('hu_HU','auto','Magyar [HU]'),('ms_MY','auto','Malay [MY]'),('es_MX','auto','México [MX]'),('nl_NL','auto','Nederlands [NL]'),('nb_NO','auto','Norsk bokmål [NO]'),('nn_NO','auto','Norwegian nynorsk [NO]'),('pl_PL','auto','Polski [PL]'),('pt_PT','auto','Português [PT]'),('ro_RO','auto','Română [RO]'),('sk_SK','auto','Slovensky [SK]'),('sl_SI','auto','Slovenšcina [SI]'),('sh_RS','auto','Srpski [SR]'),('sv_SE','auto','Svenska [SE]'),('vi_VN','auto','Tiếng Việt [VN]'),('tr_TR','auto','Türkçe [TR]'),('wo_SN','auto','Wolof [SN]'),('is_IS','auto','Íslenska [IS]'),('cs_CZ','auto','Česky [CZ]'),('el_GR','auto','Ελληνικά [GR]'),('bg_BG','auto','Български [BG]'),('mk_MK','auto','Македонски [MK]'),('mn_MN','auto','Монгол [MN]'),('ru_RU','auto','Русский [RU]'),('sr_RS','auto','Српски [SR]'),('uk_UA','auto','Українська [UA]'),('he_IL','auto','עברית [IL]'),('ar_EG','auto','العربية (مصر) [EG]'),('ar_SA','auto','العربية [AR]'),('ar_MA','auto','العربية [MA]'),('fa_IR','auto','پارسی [IR]'),('kok_IN','auto','कोंकणी [IN]'),('bn_IN','auto','বাংলা[IN]'),('gu_IN','auto','ગુજરાતી[IN]'),('ta_IN','auto','தமிழ் [IN]'),('kn_IN','auto','ಕನ್ನಡ [IN]'),('th_TH','auto','ภาษาไทย [TH]'),('ka_GE','auto','ქართული [GE]'),('km_KH','auto','ខ្មែរ [KH]'),('zh_TW','auto','中文 (繁體) [TW]'),('zh_HK','auto','中文 (香港) [HK]'),('ja_JP','auto','日本語 [JP]'),('zh_CN','auto','简体中文 [CN]'),('ko_KR','auto','한국어 [KR]');
/*!40000 ALTER TABLE `piwigo_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_old_permalinks`
--

DROP TABLE IF EXISTS `piwigo_old_permalinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_old_permalinks` (
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `permalink` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_deleted` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `last_hit` datetime DEFAULT NULL,
  `hit` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`permalink`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_old_permalinks`
--

LOCK TABLES `piwigo_old_permalinks` WRITE;
/*!40000 ALTER TABLE `piwigo_old_permalinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_old_permalinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_plugins`
--

DROP TABLE IF EXISTS `piwigo_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_plugins` (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `state` enum('inactive','active') NOT NULL DEFAULT 'inactive',
  `version` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_plugins`
--

LOCK TABLES `piwigo_plugins` WRITE;
/*!40000 ALTER TABLE `piwigo_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_rate`
--

DROP TABLE IF EXISTS `piwigo_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_rate` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `element_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `anonymous_id` varchar(45) NOT NULL DEFAULT '',
  `rate` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '1970-01-01',
  PRIMARY KEY (`element_id`,`user_id`,`anonymous_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_rate`
--

LOCK TABLES `piwigo_rate` WRITE;
/*!40000 ALTER TABLE `piwigo_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_search`
--

DROP TABLE IF EXISTS `piwigo_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_search` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `last_seen` date DEFAULT NULL,
  `rules` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_search`
--

LOCK TABLES `piwigo_search` WRITE;
/*!40000 ALTER TABLE `piwigo_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_sessions`
--

DROP TABLE IF EXISTS `piwigo_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_sessions` (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `data` mediumtext NOT NULL,
  `expiration` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `piwigo_sites`
--

DROP TABLE IF EXISTS `piwigo_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_sites` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `galleries_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sites_ui1` (`galleries_url`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_sites`
--

LOCK TABLES `piwigo_sites` WRITE;
/*!40000 ALTER TABLE `piwigo_sites` DISABLE KEYS */;
INSERT INTO `piwigo_sites` VALUES (1,'./galleries/');
/*!40000 ALTER TABLE `piwigo_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_tags`
--

DROP TABLE IF EXISTS `piwigo_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_tags` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `url_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tags_i1` (`url_name`),
  KEY `lastmodified` (`lastmodified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_tags`
--

LOCK TABLES `piwigo_tags` WRITE;
/*!40000 ALTER TABLE `piwigo_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_themes`
--

DROP TABLE IF EXISTS `piwigo_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_themes` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `version` varchar(64) NOT NULL DEFAULT '0',
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_themes`
--

LOCK TABLES `piwigo_themes` WRITE;
/*!40000 ALTER TABLE `piwigo_themes` DISABLE KEYS */;
INSERT INTO `piwigo_themes` VALUES ('elegant','auto','elegant'),('smartpocket','auto','Smart Pocket');
/*!40000 ALTER TABLE `piwigo_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_upgrade`
--

DROP TABLE IF EXISTS `piwigo_upgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_upgrade` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `applied` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_upgrade`
--

LOCK TABLES `piwigo_upgrade` WRITE;
/*!40000 ALTER TABLE `piwigo_upgrade` DISABLE KEYS */;
INSERT INTO `piwigo_upgrade` VALUES ('61','2017-09-14 11:20:30','upgrade included in installation'),('62','2017-09-14 11:20:30','upgrade included in installation'),('63','2017-09-14 11:20:30','upgrade included in installation'),('64','2017-09-14 11:20:30','upgrade included in installation'),('65','2017-09-14 11:20:30','upgrade included in installation'),('66','2017-09-14 11:20:30','upgrade included in installation'),('67','2017-09-14 11:20:30','upgrade included in installation'),('68','2017-09-14 11:20:30','upgrade included in installation'),('69','2017-09-14 11:20:30','upgrade included in installation'),('70','2017-09-14 11:20:30','upgrade included in installation'),('71','2017-09-14 11:20:30','upgrade included in installation'),('72','2017-09-14 11:20:30','upgrade included in installation'),('73','2017-09-14 11:20:30','upgrade included in installation'),('74','2017-09-14 11:20:30','upgrade included in installation'),('75','2017-09-14 11:20:30','upgrade included in installation'),('76','2017-09-14 11:20:30','upgrade included in installation'),('77','2017-09-14 11:20:30','upgrade included in installation'),('78','2017-09-14 11:20:30','upgrade included in installation'),('79','2017-09-14 11:20:30','upgrade included in installation'),('80','2017-09-14 11:20:30','upgrade included in installation'),('81','2017-09-14 11:20:30','upgrade included in installation'),('82','2017-09-14 11:20:30','upgrade included in installation'),('83','2017-09-14 11:20:30','upgrade included in installation'),('84','2017-09-14 11:20:30','upgrade included in installation'),('85','2017-09-14 11:20:30','upgrade included in installation'),('86','2017-09-14 11:20:30','upgrade included in installation'),('87','2017-09-14 11:20:30','upgrade included in installation'),('88','2017-09-14 11:20:30','upgrade included in installation'),('89','2017-09-14 11:20:30','upgrade included in installation'),('90','2017-09-14 11:20:30','upgrade included in installation'),('91','2017-09-14 11:20:30','upgrade included in installation'),('92','2017-09-14 11:20:30','upgrade included in installation'),('93','2017-09-14 11:20:30','upgrade included in installation'),('94','2017-09-14 11:20:30','upgrade included in installation'),('95','2017-09-14 11:20:30','upgrade included in installation'),('96','2017-09-14 11:20:30','upgrade included in installation'),('97','2017-09-14 11:20:30','upgrade included in installation'),('98','2017-09-14 11:20:30','upgrade included in installation'),('99','2017-09-14 11:20:30','upgrade included in installation'),('100','2017-09-14 11:20:30','upgrade included in installation'),('101','2017-09-14 11:20:30','upgrade included in installation'),('102','2017-09-14 11:20:30','upgrade included in installation'),('103','2017-09-14 11:20:30','upgrade included in installation'),('104','2017-09-14 11:20:30','upgrade included in installation'),('105','2017-09-14 11:20:30','upgrade included in installation'),('106','2017-09-14 11:20:30','upgrade included in installation'),('107','2017-09-14 11:20:30','upgrade included in installation'),('108','2017-09-14 11:20:30','upgrade included in installation'),('109','2017-09-14 11:20:30','upgrade included in installation'),('110','2017-09-14 11:20:30','upgrade included in installation'),('111','2017-09-14 11:20:30','upgrade included in installation'),('112','2017-09-14 11:20:30','upgrade included in installation'),('113','2017-09-14 11:20:30','upgrade included in installation'),('114','2017-09-14 11:20:30','upgrade included in installation'),('115','2017-09-14 11:20:30','upgrade included in installation'),('116','2017-09-14 11:20:30','upgrade included in installation'),('117','2017-09-14 11:20:30','upgrade included in installation'),('118','2017-09-14 11:20:30','upgrade included in installation'),('119','2017-09-14 11:20:30','upgrade included in installation'),('120','2017-09-14 11:20:30','upgrade included in installation'),('121','2017-09-14 11:20:30','upgrade included in installation'),('122','2017-09-14 11:20:30','upgrade included in installation'),('123','2017-09-14 11:20:30','upgrade included in installation'),('124','2017-09-14 11:20:30','upgrade included in installation'),('125','2017-09-14 11:20:30','upgrade included in installation'),('126','2017-09-14 11:20:30','upgrade included in installation'),('127','2017-09-14 11:20:30','upgrade included in installation'),('128','2017-09-14 11:20:30','upgrade included in installation'),('129','2017-09-14 11:20:30','upgrade included in installation'),('130','2017-09-14 11:20:30','upgrade included in installation'),('131','2017-09-14 11:20:30','upgrade included in installation'),('132','2017-09-14 11:20:30','upgrade included in installation'),('133','2017-09-14 11:20:30','upgrade included in installation'),('134','2017-09-14 11:20:30','upgrade included in installation'),('135','2017-09-14 11:20:30','upgrade included in installation'),('136','2017-09-14 11:20:30','upgrade included in installation'),('137','2017-09-14 11:20:30','upgrade included in installation'),('138','2017-09-14 11:20:30','upgrade included in installation'),('139','2017-09-14 11:20:30','upgrade included in installation'),('140','2017-09-14 11:20:30','upgrade included in installation'),('141','2017-09-14 11:20:30','upgrade included in installation'),('142','2017-09-14 11:20:30','upgrade included in installation'),('143','2017-09-14 11:20:30','upgrade included in installation'),('144','2017-09-14 11:20:30','upgrade included in installation'),('145','2017-09-14 11:20:30','upgrade included in installation'),('146','2017-09-14 11:20:30','upgrade included in installation'),('147','2017-09-14 11:20:30','upgrade included in installation'),('148','2017-09-14 11:20:30','upgrade included in installation'),('149','2017-09-14 11:20:30','upgrade included in installation'),('150','2017-09-14 11:20:30','upgrade included in installation'),('151','2017-09-14 11:20:30','upgrade included in installation'),('152','2017-09-14 11:20:30','upgrade included in installation');
/*!40000 ALTER TABLE `piwigo_upgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_user_access`
--

DROP TABLE IF EXISTS `piwigo_user_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_user_access` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_user_access`
--

LOCK TABLES `piwigo_user_access` WRITE;
/*!40000 ALTER TABLE `piwigo_user_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_user_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_user_auth_keys`
--

DROP TABLE IF EXISTS `piwigo_user_auth_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_user_auth_keys` (
  `auth_key_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `auth_key` varchar(255) NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `created_on` datetime NOT NULL,
  `duration` int(11) unsigned DEFAULT NULL,
  `expired_on` datetime NOT NULL,
  PRIMARY KEY (`auth_key_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_user_auth_keys`
--

LOCK TABLES `piwigo_user_auth_keys` WRITE;
/*!40000 ALTER TABLE `piwigo_user_auth_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_user_auth_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_user_cache`
--

DROP TABLE IF EXISTS `piwigo_user_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_user_cache` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `need_update` enum('true','false') NOT NULL DEFAULT 'true',
  `cache_update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `forbidden_categories` mediumtext,
  `nb_total_images` mediumint(8) unsigned DEFAULT NULL,
  `last_photo_date` datetime DEFAULT NULL,
  `nb_available_tags` int(5) DEFAULT NULL,
  `nb_available_comments` int(5) DEFAULT NULL,
  `image_access_type` enum('NOT IN','IN') NOT NULL DEFAULT 'NOT IN',
  `image_access_list` mediumtext,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `piwigo_user_cache_categories`
--

DROP TABLE IF EXISTS `piwigo_user_cache_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_user_cache_categories` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `date_last` datetime DEFAULT NULL,
  `max_date_last` datetime DEFAULT NULL,
  `nb_images` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `count_images` mediumint(8) unsigned DEFAULT '0',
  `nb_categories` mediumint(8) unsigned DEFAULT '0',
  `count_categories` mediumint(8) unsigned DEFAULT '0',
  `user_representative_picture_id` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_user_cache_categories`
--

LOCK TABLES `piwigo_user_cache_categories` WRITE;
/*!40000 ALTER TABLE `piwigo_user_cache_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_user_cache_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_user_feed`
--

DROP TABLE IF EXISTS `piwigo_user_feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_user_feed` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `last_check` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_user_feed`
--

LOCK TABLES `piwigo_user_feed` WRITE;
/*!40000 ALTER TABLE `piwigo_user_feed` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_user_feed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_user_group`
--

DROP TABLE IF EXISTS `piwigo_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_user_group` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_user_group`
--

LOCK TABLES `piwigo_user_group` WRITE;
/*!40000 ALTER TABLE `piwigo_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_user_infos`
--

DROP TABLE IF EXISTS `piwigo_user_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_user_infos` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `nb_image_page` smallint(3) unsigned NOT NULL DEFAULT '15',
  `status` enum('webmaster','admin','normal','generic','guest') NOT NULL DEFAULT 'guest',
  `language` varchar(50) NOT NULL DEFAULT 'en_UK',
  `expand` enum('true','false') NOT NULL DEFAULT 'false',
  `show_nb_comments` enum('true','false') NOT NULL DEFAULT 'false',
  `show_nb_hits` enum('true','false') NOT NULL DEFAULT 'false',
  `recent_period` tinyint(3) unsigned NOT NULL DEFAULT '7',
  `theme` varchar(255) NOT NULL DEFAULT 'elegant',
  `registration_date` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `enabled_high` enum('true','false') NOT NULL DEFAULT 'true',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `activation_key` varchar(255) DEFAULT NULL,
  `activation_key_expire` datetime DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `last_visit_from_history` enum('true','false') NOT NULL DEFAULT 'false',
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `lastmodified` (`lastmodified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_user_infos`
--

LOCK TABLES `piwigo_user_infos` WRITE;
/*!40000 ALTER TABLE `piwigo_user_infos` DISABLE KEYS */;
INSERT INTO `piwigo_user_infos` VALUES (1,15,'webmaster','en_US','false','false','false',7,'elegant','2017-09-14 11:20:30','true',8,NULL,NULL,NULL,'false','2017-09-14 11:20:30'),(2,15,'guest','en_US','false','false','false',7,'elegant','2017-09-14 11:20:30','true',0,NULL,NULL,NULL,'false','2017-09-14 11:20:30');
/*!40000 ALTER TABLE `piwigo_user_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_user_mail_notification`
--

DROP TABLE IF EXISTS `piwigo_user_mail_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_user_mail_notification` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `check_key` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `enabled` enum('true','false') NOT NULL DEFAULT 'false',
  `last_send` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_mail_notification_ui1` (`check_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_user_mail_notification`
--

LOCK TABLES `piwigo_user_mail_notification` WRITE;
/*!40000 ALTER TABLE `piwigo_user_mail_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `piwigo_user_mail_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_users`
--

DROP TABLE IF EXISTS `piwigo_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_users` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(255) DEFAULT NULL,
  `mail_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_ui1` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_users`
--

LOCK TABLES `piwigo_users` WRITE;
/*!40000 ALTER TABLE `piwigo_users` DISABLE KEYS */;
INSERT INTO `piwigo_users` VALUES (1,'testadmin','5f4dcc3b5aa765d61d8327deb882cf99','no-reply@example.com'),(2,'guest',NULL,NULL);
/*!40000 ALTER TABLE `piwigo_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-14  6:22:21
