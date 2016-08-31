/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : patent

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2016-08-30 11:21:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` varchar(40) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `relative` varchar(4000) DEFAULT NULL,
  `memo` varchar(4000) DEFAULT NULL,
  `files` varchar(4000) DEFAULT NULL,
  `detailurl` varchar(255) DEFAULT NULL,
  `detailcontent` text,
  `ord` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
