/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : patent

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2016-08-30 11:28:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_input
-- ----------------------------
DROP TABLE IF EXISTS `sys_input`;
CREATE TABLE `sys_input` (
  `ID` varchar(255) NOT NULL COMMENT 'guid',
  `NAME` varchar(255) DEFAULT NULL COMMENT 'input名称',
  `CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `MODIFYDATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改日期',
  `CREATEUSERID` varchar(255) DEFAULT NULL COMMENT '创建人Id[sys_user.id]',
  `MODIFYUSERID` varchar(255) DEFAULT NULL COMMENT '修改人Id[sys_user.id]',
  `VERSION` varchar(255) DEFAULT '1.0.0' COMMENT '版本号',
  `STATE` int(11) DEFAULT '0' COMMENT '状态（0为正常，-1为不可用）',
  `ORD` int(19) DEFAULT '0' COMMENT '排序',
  `MEMO` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `MENUID` decimal(19,5) NOT NULL COMMENT '菜单Id',
  PRIMARY KEY (`MENUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SYS_INPUT';
