/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : patent

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2016-08-30 11:20:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for common
-- ----------------------------
DROP TABLE IF EXISTS `common`;
CREATE TABLE `common` (
  `id` varchar(40) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `ord` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `rectype` int(11) DEFAULT NULL,
  `pdate` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
