/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : patent

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2016-08-12 16:22:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `common`
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

-- ----------------------------
-- Records of common
-- ----------------------------
INSERT INTO `common` VALUES ('0f5fae0a-78e6-4e31-95da-1ddee82f4ad4', '1', '2', '3', '4', '5', '0', '1', '0', null);
INSERT INTO `common` VALUES ('11', '高科技', '高科技', '我的', '专利权维持', '111', '0', '0', '0', null);
INSERT INTO `common` VALUES ('16c50e7f-9957-49b0-bc49-1823e0da7523', '22222', '1111', '', '', '', '0', '0', '1', '2015-01-01');
INSERT INTO `common` VALUES ('250abfe1-5d5c-43f4-85e8-20994081d386', '1', '2', '3', '4', '5', '6', '0', '0', null);
INSERT INTO `common` VALUES ('33b7e7e1-788d-4ca0-a592-0543f560ca73', '222', '', '1111', '', '', '0', '0', '0', '111');
