/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : patent

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2016-08-30 11:29:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_user_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_department`;
CREATE TABLE `sys_user_department` (
  `ID` varchar(255) NOT NULL COMMENT 'guid',
  `CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `MODIFYDATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改日期',
  `CREATEUSERID` varchar(255) DEFAULT NULL COMMENT '创建人Id[sys_user.id]',
  `MODIFYUSERID` varchar(255) DEFAULT NULL COMMENT '修改人Id[sys_user.id]',
  `VERSION` varchar(255) NOT NULL DEFAULT '1.0.0' COMMENT '版本号',
  `USERID` varchar(255) NOT NULL COMMENT '用户Id[sys_user.id]',
  `DEPARTMENTID` varchar(255) NOT NULL COMMENT '部门Id[sys_department.id]',
  `ORD` int(19) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`USERID`,`DEPARTMENTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SYS_USER_DEPARTMENT';
