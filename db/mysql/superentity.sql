/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : patent

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2016-08-30 11:21:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for superentity
-- ----------------------------
DROP TABLE IF EXISTS `superentity`;
CREATE TABLE `superentity` (
  `ID` varchar(255) NOT NULL COMMENT 'guid',
  `CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `MODIFYDATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改日期',
  `CREATEUSERID` varchar(255) DEFAULT NULL COMMENT '创建人Id[sys_user.id]',
  `MODIFYUSERID` varchar(255) DEFAULT NULL COMMENT '修改人Id[sys_user.id]',
  `VERSION` varchar(255) DEFAULT '1.0.0' COMMENT '版本号',
  `ORD` int(11) DEFAULT '0' COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SUPERENTITY';
