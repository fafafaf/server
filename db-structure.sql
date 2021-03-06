-- MySQL dump 10.13  Distrib 5.5.29, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: faf_lobby
-- ------------------------------------------------------
-- Server version	5.5.29-0ubuntu0.12.04.1-log

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
-- Table structure for table `AI_names`
--

DROP TABLE IF EXISTS `AI_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AI_names` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key : ID .\nUnsigned car pas de valeurs negative.\nMEDIUMINT : 16 millions d''entrÃ©es maxi, meilleures perfs que INT\nSMALLINT : 65.000 entrÃ©es, ce qui peut etre largement suffisant.\nDoit etre contraint a l''id de la table info_clients.',
  `login` varchar(60) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL COMMENT 'login du clientMinimum 5 caracteres, VARCHAR peut fragmenter la DB, mais pas d''autres moyens ici.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=16777215 DEFAULT CHARSET=latin1 COMMENT='login';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AI_rating`
--

DROP TABLE IF EXISTS `AI_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AI_rating` (
  `id` mediumint(8) unsigned NOT NULL,
  `mean` float DEFAULT NULL,
  `deviation` float DEFAULT NULL,
  `numGames` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `AI_rating_ibfk_1` FOREIGN KEY (`id`) REFERENCES `AI_names` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avatars`
--

DROP TABLE IF EXISTS `avatars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avatars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` mediumint(8) unsigned NOT NULL,
  `idAvatar` int(10) unsigned NOT NULL,
  `selected` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idUser` (`idUser`,`idAvatar`),
  KEY `friendCnst` (`idAvatar`),
  CONSTRAINT `avatars_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `login` (`id`),
  CONSTRAINT `avatars_ibfk_2` FOREIGN KEY (`idAvatar`) REFERENCES `avatars_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1652 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avatars_list`
--

DROP TABLE IF EXISTS `avatars_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avatars_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `tooltip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`,`tooltip`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bet`
--

DROP TABLE IF EXISTS `bet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bet` (
  `userid` mediumint(8) unsigned NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coop_leaderboard`
--

DROP TABLE IF EXISTS `coop_leaderboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coop_leaderboard` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `mission` smallint(6) unsigned NOT NULL,
  `gameuid` bigint(20) unsigned NOT NULL,
  `secondary` tinyint(3) unsigned NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gameuid` (`gameuid`)
) ENGINE=InnoDB AUTO_INCREMENT=19725 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coop_map`
--

DROP TABLE IF EXISTS `coop_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coop_map` (
  `type` tinyint(3) unsigned NOT NULL,
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `description` longtext,
  `version` decimal(4,0) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Combo` (`name`,`version`),
  KEY `filename` (`filename`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `featured_mods_owners`
--

DROP TABLE IF EXISTS `featured_mods_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featured_mods_owners` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL,
  `moduid` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `moduid` (`moduid`),
  CONSTRAINT `featured_mods_owners_ibfk_1` FOREIGN KEY (`moduid`) REFERENCES `game_featuredMods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `featured_mods_owners_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `foes`
--

DROP TABLE IF EXISTS `foes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` mediumint(8) unsigned NOT NULL,
  `idFoe` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique_pair` (`idUser`,`idFoe`) USING BTREE,
  KEY `friendCnst` (`idFoe`),
  CONSTRAINT `foes_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foes_ibfk_2` FOREIGN KEY (`idFoe`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13044 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` mediumint(8) unsigned NOT NULL,
  `idFriend` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique_pair` (`idUser`,`idFriend`) USING BTREE,
  KEY `friendCnst` (`idFriend`),
  CONSTRAINT `friendCnst` FOREIGN KEY (`idFriend`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userCnst` FOREIGN KEY (`idUser`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=160250 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_featuredMods`
--

DROP TABLE IF EXISTS `game_featuredMods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_featuredMods` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `gamemod` varchar(50) DEFAULT NULL,
  `description` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_min_rating`
--

DROP TABLE IF EXISTS `game_min_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_min_rating` (
  `id` bigint(20) unsigned NOT NULL,
  `minRating` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `game_min_rating_ibfk_1` FOREIGN KEY (`id`) REFERENCES `game_stats_bak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_player_stats`
--

DROP TABLE IF EXISTS `game_player_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_player_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gameId` bigint(20) unsigned NOT NULL,
  `playerId` mediumint(8) unsigned NOT NULL,
  `AI` tinyint(1) NOT NULL,
  `faction` tinyint(3) unsigned NOT NULL,
  `color` tinyint(4) NOT NULL,
  `team` tinyint(3) NOT NULL,
  `place` tinyint(3) unsigned NOT NULL,
  `mean` float unsigned NOT NULL,
  `deviation` float unsigned NOT NULL,
  `after_mean` float DEFAULT NULL,
  `after_deviation` float DEFAULT NULL,
  `score` tinyint(3) NOT NULL,
  `scoreTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `playerId` (`playerId`),
  KEY `gameIdIdx` (`gameId`)
) ENGINE=InnoDB AUTO_INCREMENT=4752559 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_player_stats_bak`
--

DROP TABLE IF EXISTS `game_player_stats_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_player_stats_bak` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gameId` bigint(20) unsigned NOT NULL,
  `playerId` mediumint(8) unsigned NOT NULL,
  `AI` tinyint(1) NOT NULL,
  `faction` tinyint(3) unsigned NOT NULL,
  `color` tinyint(4) NOT NULL,
  `team` tinyint(3) NOT NULL,
  `place` tinyint(3) unsigned NOT NULL,
  `mean` float unsigned NOT NULL,
  `deviation` float unsigned NOT NULL,
  `after_mean` float DEFAULT NULL,
  `after_deviation` float DEFAULT NULL,
  `score` tinyint(3) NOT NULL,
  `scoreTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `playerId` (`playerId`),
  KEY `gameIdIdx` (`gameId`),
  CONSTRAINT `game_player_stats_bak_ibfk_1` FOREIGN KEY (`gameId`) REFERENCES `game_stats_bak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `game_player_stats_bak_ibfk_2` FOREIGN KEY (`playerId`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3461180 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_replays`
--

DROP TABLE IF EXISTS `game_replays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_replays` (
  `UID` bigint(20) unsigned NOT NULL,
  `file` longblob NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_replays_old`
--

DROP TABLE IF EXISTS `game_replays_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_replays_old` (
  `UID` bigint(20) unsigned NOT NULL,
  `file` longblob NOT NULL,
  PRIMARY KEY (`UID`),
  CONSTRAINT `game_replays_old_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `game_stats_bak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_stats`
--

DROP TABLE IF EXISTS `game_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `startTime` timestamp NULL DEFAULT NULL,
  `EndTime` timestamp NULL DEFAULT NULL,
  `gameType` enum('0','1','2','3') DEFAULT '0',
  `gameMod` tinyint(3) unsigned DEFAULT NULL,
  `host` mediumint(8) unsigned DEFAULT NULL,
  `mapId` mediumint(8) unsigned DEFAULT NULL COMMENT 'map id',
  `gameName` tinytext,
  PRIMARY KEY (`id`),
  KEY `startTime` (`startTime`)
) ENGINE=InnoDB AUTO_INCREMENT=2654528 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_stats_bak`
--

DROP TABLE IF EXISTS `game_stats_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_stats_bak` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `startTime` timestamp NULL DEFAULT NULL,
  `EndTime` timestamp NULL DEFAULT NULL,
  `gameType` enum('0','1','2','3') DEFAULT '0',
  `gameMod` tinyint(3) unsigned DEFAULT NULL,
  `host` mediumint(8) unsigned DEFAULT NULL,
  `mapId` mediumint(8) unsigned DEFAULT NULL COMMENT 'map id',
  `gameName` tinytext,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `gameMod` (`gameMod`),
  KEY `host` (`host`),
  KEY `mapId` (`mapId`),
  KEY `startTime` (`startTime`),
  KEY `endTime` (`EndTime`),
  CONSTRAINT `game_stats_bak_ibfk_1` FOREIGN KEY (`mapId`) REFERENCES `table_map` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `game_stats_bak_ibfk_4` FOREIGN KEY (`gameMod`) REFERENCES `game_featuredMods` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `game_stats_bak_ibfk_5` FOREIGN KEY (`host`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=1996403 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  add_new_rating AFTER UPDATE ON `game_stats_bak` FOR EACH ROW
BEGIN
INSERT INTO game_min_rating (id, minRating)
VALUES (
NEW.id, 
(
SELECT MIN( mean -3 * deviation ) 
FROM game_player_stats
WHERE game_player_stats.gameId = NEW.id
GROUP BY game_player_stats.gameId
)
)
ON DUPLICATE KEY UPDATE `minRating` =
(
SELECT MIN( mean -3 * deviation ) 
FROM game_player_stats
WHERE game_player_stats.gameId = NEW.id
GROUP BY game_player_stats.gameId
);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `global_rating`
--

DROP TABLE IF EXISTS `global_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_rating` (
  `id` mediumint(8) unsigned NOT NULL,
  `mean` float DEFAULT NULL,
  `deviation` float DEFAULT NULL,
  `numGames` smallint(4) unsigned NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `IdCnst` FOREIGN KEY (`id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_constraint` FOREIGN KEY (`id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ladder1v1_rating`
--

DROP TABLE IF EXISTS `ladder1v1_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ladder1v1_rating` (
  `id` mediumint(8) unsigned NOT NULL,
  `mean` float DEFAULT NULL,
  `deviation` float DEFAULT NULL,
  `numGames` smallint(4) unsigned NOT NULL DEFAULT '0',
  `winGames` smallint(4) unsigned NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `ladder1v1_rating_ibfk_1` FOREIGN KEY (`id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ladder_division`
--

DROP TABLE IF EXISTS `ladder_division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ladder_division` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `league` tinyint(3) unsigned NOT NULL,
  `limit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ladder_divisions`
--

DROP TABLE IF EXISTS `ladder_divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ladder_divisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ladder_map`
--

DROP TABLE IF EXISTS `ladder_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ladder_map` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `idmap` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idmap` (`idmap`),
  CONSTRAINT `ladder_map_ibfk_1` FOREIGN KEY (`idmap`) REFERENCES `table_map` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ladder_map_selection`
--

DROP TABLE IF EXISTS `ladder_map_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ladder_map_selection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` mediumint(8) unsigned NOT NULL,
  `idMap` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique_pair` (`idUser`,`idMap`) USING BTREE,
  KEY `friendCnst` (`idMap`)
) ENGINE=InnoDB AUTO_INCREMENT=136915 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ladder_season_1`
--

DROP TABLE IF EXISTS `ladder_season_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ladder_season_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` mediumint(8) unsigned NOT NULL,
  `league` tinyint(1) unsigned NOT NULL,
  `division` smallint(5) unsigned NOT NULL,
  `score` smallint(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idUser` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=3424 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ladder_season_2`
--

DROP TABLE IF EXISTS `ladder_season_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ladder_season_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` mediumint(8) unsigned NOT NULL,
  `league` tinyint(1) unsigned NOT NULL,
  `division` smallint(5) unsigned NOT NULL,
  `score` smallint(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idUser` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=5085 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ladder_season_3`
--

DROP TABLE IF EXISTS `ladder_season_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ladder_season_3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` mediumint(8) unsigned NOT NULL,
  `league` tinyint(1) unsigned NOT NULL,
  `division` smallint(5) unsigned NOT NULL,
  `score` smallint(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idUser` (`idUser`),
  KEY `league` (`league`),
  KEY `division` (`division`)
) ENGINE=InnoDB AUTO_INCREMENT=8065 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ladder_season_3_safe`
--

DROP TABLE IF EXISTS `ladder_season_3_safe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ladder_season_3_safe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` mediumint(8) unsigned NOT NULL,
  `league` tinyint(1) unsigned NOT NULL,
  `division` smallint(5) unsigned NOT NULL,
  `score` smallint(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idUser` (`idUser`),
  KEY `league` (`league`),
  KEY `division` (`division`)
) ENGINE=InnoDB AUTO_INCREMENT=2884 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ladder_season_4`
--

DROP TABLE IF EXISTS `ladder_season_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ladder_season_4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` mediumint(8) unsigned NOT NULL,
  `league` tinyint(1) unsigned NOT NULL,
  `division` smallint(5) unsigned NOT NULL,
  `score` smallint(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idUser` (`idUser`),
  KEY `league` (`league`),
  KEY `division` (`division`)
) ENGINE=InnoDB AUTO_INCREMENT=5958 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ladder_season_5`
--

DROP TABLE IF EXISTS `ladder_season_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ladder_season_5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` mediumint(8) unsigned NOT NULL,
  `league` tinyint(1) unsigned NOT NULL,
  `score` float unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idUser` (`idUser`),
  KEY `league` (`league`)
) ENGINE=InnoDB AUTO_INCREMENT=17512 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lobby_admin`
--

DROP TABLE IF EXISTS `lobby_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lobby_admin` (
  `user_id` int(11) NOT NULL,
  `group` tinyint(4) NOT NULL COMMENT '0 - no privileges; 1 - moderator, can delete/edit comments and approve broken maps reports; 2 - admin, same as moderator plus can add global bans',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lobby_ban`
--

DROP TABLE IF EXISTS `lobby_ban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lobby_ban` (
  `idUser` mediumint(8) unsigned DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  UNIQUE KEY `idUser` (`idUser`),
  CONSTRAINT `lobby_ban_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `password` char(64) NOT NULL,
  `email` char(64) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `ip` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `uniqueId` varchar(45) DEFAULT NULL,
  `session` int(10) unsigned NOT NULL,
  `validated` tinyint(1) NOT NULL,
  `steamid` bigint(20) unsigned DEFAULT NULL,
  `steamchecked` tinyint(1) NOT NULL,
  `ladderCancelled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_login` (`login`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `uniqueId` (`uniqueId`),
  UNIQUE KEY `steamid` (`steamid`)
) ENGINE=InnoDB AUTO_INCREMENT=114914 DEFAULT CHARSET=latin1 COMMENT='login';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matchmaker_ban`
--

DROP TABLE IF EXISTS `matchmaker_ban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchmaker_ban` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `name_history`
--

DROP TABLE IF EXISTS `name_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `name_history` (
  `change_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` mediumint(8) unsigned NOT NULL,
  `previous_name` varchar(20) NOT NULL,
  PRIMARY KEY (`change_time`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `name_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nomads_beta`
--

DROP TABLE IF EXISTS `nomads_beta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomads_beta` (
  `idUser` mediumint(8) unsigned DEFAULT NULL,
  UNIQUE KEY `idUser` (`idUser`),
  CONSTRAINT `nomads_beta_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patchs_table`
--

DROP TABLE IF EXISTS `patchs_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patchs_table` (
  `idpatchs_table` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fromMd5` varchar(45) DEFAULT NULL,
  `toMd5` varchar(45) DEFAULT NULL,
  `patchFile` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idpatchs_table`)
) ENGINE=InnoDB AUTO_INCREMENT=689 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoveryemails_enc`
--

DROP TABLE IF EXISTS `recoveryemails_enc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recoveryemails_enc` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `UserID` mediumint(8) unsigned NOT NULL,
  `Key` varchar(32) NOT NULL,
  `expDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `recoveryemails_enc_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21516 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `replay_comment`
--

DROP TABLE IF EXISTS `replay_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replay_comment` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `replay_id` bigint(20) unsigned NOT NULL,
  `text` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `replay_id` (`replay_id`),
  CONSTRAINT `replay_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `replay_comment_ibfk_2` FOREIGN KEY (`replay_id`) REFERENCES `submitted_replays` (`game_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `replay_review`
--

DROP TABLE IF EXISTS `replay_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replay_review` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `submitted_replay_id` bigint(20) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `submitted_replay_id` (`submitted_replay_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `replay_review_ibfk_1` FOREIGN KEY (`submitted_replay_id`) REFERENCES `submitted_replays` (`game_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `replay_review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `replay_vault`
--

DROP TABLE IF EXISTS `replay_vault`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replay_vault` (
  `id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `gameName` tinytext,
  `filename` varchar(200) DEFAULT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `EndTime` timestamp NULL DEFAULT NULL,
  `gamemod` varchar(50) DEFAULT NULL,
  `playerId` mediumint(8) unsigned NOT NULL,
  `mapId` mediumint(8) unsigned DEFAULT NULL COMMENT 'map id',
  `rating` double NOT NULL DEFAULT '0',
  `gamemodid` tinyint(3) unsigned DEFAULT NULL,
  UNIQUE KEY `id_2` (`id`,`playerId`),
  KEY `id` (`id`),
  KEY `startTime` (`startTime`),
  KEY `playerId` (`playerId`),
  KEY `rating` (`rating`),
  KEY `mapId` (`mapId`),
  KEY `gamemod` (`gamemod`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `search_player`
--

DROP TABLE IF EXISTS `search_player`;
/*!50001 DROP VIEW IF EXISTS `search_player`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `search_player` (
  `id` tinyint NOT NULL,
  `playerid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `smurf_table`
--

DROP TABLE IF EXISTS `smurf_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smurf_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `origId` mediumint(8) unsigned NOT NULL,
  `smurfId` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `origId_2` (`origId`,`smurfId`),
  KEY `origId` (`origId`),
  KEY `smurfId` (`smurfId`),
  CONSTRAINT `smurf_table_ibfk_1` FOREIGN KEY (`origId`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `smurf_table_ibfk_2` FOREIGN KEY (`smurfId`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6843 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `steam_link_request`
--

DROP TABLE IF EXISTS `steam_link_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `steam_link_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL,
  `Key` varchar(32) NOT NULL,
  `expDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `steam_uniqueid`
--

DROP TABLE IF EXISTS `steam_uniqueid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `steam_uniqueid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniqueid` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB AUTO_INCREMENT=197049 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `submitted_replays`
--

DROP TABLE IF EXISTS `submitted_replays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submitted_replays` (
  `game_id` bigint(20) unsigned NOT NULL,
  `featured_by` mediumint(8) unsigned DEFAULT NULL,
  `experted_by` mediumint(8) unsigned DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `votes` int(10) unsigned NOT NULL DEFAULT '0',
  `voters` text,
  `reserved_by` smallint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  KEY `featured_by` (`featured_by`),
  KEY `experted_by` (`experted_by`),
  KEY `reserved_by` (`reserved_by`),
  CONSTRAINT `submitted_replays_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game_stats_bak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `submitted_replays_ibfk_2` FOREIGN KEY (`featured_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `submitted_replays_ibfk_3` FOREIGN KEY (`experted_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `swiss_tournaments`
--

DROP TABLE IF EXISTS `swiss_tournaments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swiss_tournaments` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `host` mediumint(8) unsigned DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `minplayers` smallint(6) DEFAULT NULL,
  `maxplayers` smallint(6) DEFAULT NULL,
  `minrating` int(11) DEFAULT NULL,
  `maxrating` int(11) DEFAULT NULL,
  `tourney_date` datetime DEFAULT NULL,
  `tourney_state` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `host` (`host`),
  CONSTRAINT `swiss_tournaments_ibfk_1` FOREIGN KEY (`host`) REFERENCES `login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `swiss_tournaments_players`
--

DROP TABLE IF EXISTS `swiss_tournaments_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swiss_tournaments_players` (
  `id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `idtourney` mediumint(8) unsigned NOT NULL,
  `iduser` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idtourney` (`idtourney`,`iduser`),
  KEY `tournament` (`idtourney`),
  KEY `iduser` (`iduser`),
  CONSTRAINT `swiss_tournaments_players_ibfk_3` FOREIGN KEY (`idtourney`) REFERENCES `swiss_tournaments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `swiss_tournaments_players_ibfk_4` FOREIGN KEY (`iduser`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=597 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `table_map`
--

DROP TABLE IF EXISTS `table_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_map` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `description` longtext,
  `max_players` decimal(2,0) DEFAULT NULL,
  `map_type` varchar(15) DEFAULT NULL,
  `battle_type` varchar(15) DEFAULT NULL,
  `map_sizeX` decimal(4,0) DEFAULT NULL,
  `map_sizeY` decimal(4,0) DEFAULT NULL,
  `version` decimal(4,0) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `mapuid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Combo` (`name`,`version`),
  KEY `filename` (`filename`),
  KEY `mapuid` (`mapuid`)
) ENGINE=InnoDB AUTO_INCREMENT=5255 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `table_map_broken`
--

DROP TABLE IF EXISTS `table_map_broken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_map_broken` (
  `broken_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` mediumint(8) unsigned NOT NULL,
  `description` text NOT NULL,
  `user_id` mediumint(8) unsigned DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`broken_id`),
  KEY `map_id` (`map_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `table_map_broken_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `table_map` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `table_map_broken_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=497 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `table_map_comments`
--

DROP TABLE IF EXISTS `table_map_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_map_comments` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` mediumint(8) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `comment_text` text NOT NULL,
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `map_id` (`map_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `table_map_comments_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `table_map` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `table_map_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1831 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `table_map_features`
--

DROP TABLE IF EXISTS `table_map_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_map_features` (
  `map_id` mediumint(8) unsigned NOT NULL,
  `rating` float NOT NULL DEFAULT '0',
  `voters` text NOT NULL,
  `downloads` int(11) NOT NULL DEFAULT '0',
  `times_played` int(11) NOT NULL DEFAULT '0',
  `num_draws` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`map_id`),
  CONSTRAINT `table_map_features_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `table_map` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `table_map_unranked`
--

DROP TABLE IF EXISTS `table_map_unranked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_map_unranked` (
  `id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `table_map_uploaders`
--

DROP TABLE IF EXISTS `table_map_uploaders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_map_uploaders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mapid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mapid` (`mapid`),
  KEY `userid` (`userid`),
  CONSTRAINT `table_map_uploaders_ibfk_1` FOREIGN KEY (`mapid`) REFERENCES `table_map` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `table_map_uploaders_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1237 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `table_mod`
--

DROP TABLE IF EXISTS `table_mod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_mod` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL,
  `version` smallint(5) unsigned NOT NULL,
  `author` varchar(100) NOT NULL,
  `ui` tinyint(4) NOT NULL,
  `big` tinyint(3) unsigned NOT NULL,
  `small` tinyint(3) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `likes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `played` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `likers` longblob NOT NULL,
  `ranked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=509 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `file` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test2`
--

DROP TABLE IF EXISTS `test2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test2` (
  `id` int(11) NOT NULL,
  `test` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_game_replays`
--

DROP TABLE IF EXISTS `test_game_replays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_game_replays` (
  `UID` bigint(20) unsigned NOT NULL,
  `file` longblob NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tutorial_sections`
--

DROP TABLE IF EXISTS `tutorial_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorial_sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `section` varchar(45) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tutorials`
--

DROP TABLE IF EXISTS `tutorials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `section` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(45) NOT NULL,
  `map` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sectionIdx` (`section`),
  CONSTRAINT `tutorials_ibfk_1` FOREIGN KEY (`section`) REFERENCES `tutorial_sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uniqueid`
--

DROP TABLE IF EXISTS `uniqueid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uniqueid` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `mem_SerialNumber` varchar(255) NOT NULL,
  `deviceID` varchar(255) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `processorId` varchar(255) NOT NULL,
  `SMBIOSBIOSVersion` varchar(255) NOT NULL,
  `serialNumber` varchar(255) NOT NULL,
  `volumeSerialNumber` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `uniqueid_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=172442 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(45) DEFAULT NULL,
  `md5` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_balancetesting`
--

DROP TABLE IF EXISTS `updates_balancetesting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_balancetesting` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_balancetesting_files`
--

DROP TABLE IF EXISTS `updates_balancetesting_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_balancetesting_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  `obselete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_blackops`
--

DROP TABLE IF EXISTS `updates_blackops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_blackops` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_blackops_files`
--

DROP TABLE IF EXISTS `updates_blackops_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_blackops_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  `obselete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_civilians`
--

DROP TABLE IF EXISTS `updates_civilians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_civilians` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_civilians_files`
--

DROP TABLE IF EXISTS `updates_civilians_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_civilians_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  `obselete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_claustrophobia`
--

DROP TABLE IF EXISTS `updates_claustrophobia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_claustrophobia` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_claustrophobia_files`
--

DROP TABLE IF EXISTS `updates_claustrophobia_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_claustrophobia_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  `obselete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_coop`
--

DROP TABLE IF EXISTS `updates_coop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_coop` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_coop_files`
--

DROP TABLE IF EXISTS `updates_coop_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_coop_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  `obselete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_diamond`
--

DROP TABLE IF EXISTS `updates_diamond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_diamond` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_diamond_files`
--

DROP TABLE IF EXISTS `updates_diamond_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_diamond_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  `obselete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_engyredesign`
--

DROP TABLE IF EXISTS `updates_engyredesign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_engyredesign` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_engyredesign_files`
--

DROP TABLE IF EXISTS `updates_engyredesign_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_engyredesign_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_faf`
--

DROP TABLE IF EXISTS `updates_faf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_faf` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_faf_files`
--

DROP TABLE IF EXISTS `updates_faf_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_faf_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  `obselete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_gw`
--

DROP TABLE IF EXISTS `updates_gw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_gw` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_gw_files`
--

DROP TABLE IF EXISTS `updates_gw_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_gw_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  `obselete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_koth`
--

DROP TABLE IF EXISTS `updates_koth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_koth` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_koth_files`
--

DROP TABLE IF EXISTS `updates_koth_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_koth_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  `obselete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_labwars`
--

DROP TABLE IF EXISTS `updates_labwars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_labwars` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_labwars_files`
--

DROP TABLE IF EXISTS `updates_labwars_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_labwars_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  `obselete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_matchmaker`
--

DROP TABLE IF EXISTS `updates_matchmaker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_matchmaker` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_matchmaker_files`
--

DROP TABLE IF EXISTS `updates_matchmaker_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_matchmaker_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  `obselete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_murderparty`
--

DROP TABLE IF EXISTS `updates_murderparty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_murderparty` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_murderparty_files`
--

DROP TABLE IF EXISTS `updates_murderparty_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_murderparty_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  `obselete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_nomads`
--

DROP TABLE IF EXISTS `updates_nomads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_nomads` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_nomads_files`
--

DROP TABLE IF EXISTS `updates_nomads_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_nomads_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  `obselete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_phantomx`
--

DROP TABLE IF EXISTS `updates_phantomx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_phantomx` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_phantomx_files`
--

DROP TABLE IF EXISTS `updates_phantomx_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_phantomx_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  `obselete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_supremeDestruction`
--

DROP TABLE IF EXISTS `updates_supremeDestruction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_supremeDestruction` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_supremeDestruction_files`
--

DROP TABLE IF EXISTS `updates_supremeDestruction_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_supremeDestruction_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  `obselete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_vanilla`
--

DROP TABLE IF EXISTS `updates_vanilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_vanilla` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_vanilla_files`
--

DROP TABLE IF EXISTS `updates_vanilla_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_vanilla_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  `obselete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_wyvern`
--

DROP TABLE IF EXISTS `updates_wyvern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_wyvern` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_wyvern_files`
--

DROP TABLE IF EXISTS `updates_wyvern_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_wyvern_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_xtremewars`
--

DROP TABLE IF EXISTS `updates_xtremewars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_xtremewars` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_xtremewars_files`
--

DROP TABLE IF EXISTS `updates_xtremewars_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_xtremewars_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` smallint(5) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `md5` varchar(45) NOT NULL,
  `obselete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_added_replays`
--

DROP TABLE IF EXISTS `user_added_replays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_added_replays` (
  `user_id` mediumint(8) unsigned NOT NULL,
  `game_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`game_id`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `user_added_replays_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_added_replays_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `game_stats_bak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `id` mediumint(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `module` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `validate_account`
--

DROP TABLE IF EXISTS `validate_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `validate_account` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `UserID` mediumint(8) unsigned NOT NULL,
  `Key` varchar(32) NOT NULL,
  `expDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `validate_account_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82095 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vault_admin`
--

DROP TABLE IF EXISTS `vault_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vault_admin` (
  `user_id` int(11) NOT NULL,
  `group` tinyint(4) NOT NULL COMMENT '0 - no privileges; 1 - moderator, can delete/edit comments and approve broken maps reports; 2 - admin, same as moderator plus can delete maps from vault',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `version_lobby`
--

DROP TABLE IF EXISTS `version_lobby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version_lobby` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(100) DEFAULT NULL,
  `version` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `view_global_rating`
--

DROP TABLE IF EXISTS `view_global_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_global_rating` (
  `id` mediumint(8) unsigned NOT NULL,
  `mean` float DEFAULT NULL,
  `deviation` float DEFAULT NULL,
  `numGames` smallint(4) unsigned NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `search_player`
--

/*!50001 DROP TABLE IF EXISTS `search_player`*/;
/*!50001 DROP VIEW IF EXISTS `search_player`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `search_player` AS select `game_player_stats`.`gameId` AS `id`,`game_player_stats`.`playerId` AS `playerid` from (`game_player_stats` left join `game_replays` on((`game_replays`.`UID` = `game_player_stats`.`gameId`))) where (`game_replays`.`file` is not null) */;
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

-- Dump completed on 2014-10-01 14:46:57
