/*
 Navicat Premium Data Transfer

 Source Server         : TencentServer
 Source Server Type    : MariaDB
 Source Server Version : 100148
 Source Host           : localhost:3306
 Source Schema         : saidbyu

 Target Server Type    : MariaDB
 Target Server Version : 100148
 File Encoding         : 65001

 Date: 06/07/2022 12:01:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_password` char(1) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES (12345, '@');
COMMIT;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `area_id` int(11) NOT NULL,
  `area_name` varchar(255) DEFAULT NULL,
  `area_avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `user_id` char(1) NOT NULL,
  `tie_id` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `comment_on_id` int(10) unsigned zerofill DEFAULT NULL,
  `comment_content` longtext,
  `comment_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tie_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`,`tie_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES (1, 0000000001, '666', '2022-07-05 16:48:44', 2, 1);
COMMIT;

-- ----------------------------
-- Table structure for tie
-- ----------------------------
DROP TABLE IF EXISTS `tie`;
CREATE TABLE `tie` (
  `tie_id` int(11) NOT NULL,
  `tie_title` varchar(255) DEFAULT NULL,
  `tie_png` varchar(255) DEFAULT NULL,
  `tie_content` longtext,
  `author_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `liked_num` int(11) DEFAULT NULL,
  `comment_num` int(11) DEFAULT NULL,
  `write_time` datetime DEFAULT NULL,
  `looked_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`tie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_avatar` varchar(255) DEFAULT NULL,
  `user_gender` varchar(4) DEFAULT NULL,
  `user_create_time` datetime DEFAULT NULL,
  `user_mail` varchar(255) DEFAULT NULL,
  `user_status` int(11) NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'lmsb', NULL, NULL, NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for user_follow_area
-- ----------------------------
DROP TABLE IF EXISTS `user_follow_area`;
CREATE TABLE `user_follow_area` (
  `user_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `area_level` int(11) NOT NULL,
  `area_exp` int(11) NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for user_follow_user
-- ----------------------------
DROP TABLE IF EXISTS `user_follow_user`;
CREATE TABLE `user_follow_user` (
  `user_id` int(11) NOT NULL,
  `followed_user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
