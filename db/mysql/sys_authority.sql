/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : patent

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2016-08-30 11:28:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_authority
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority`;
CREATE TABLE `sys_authority` (
  `ID` varchar(255) NOT NULL COMMENT 'guid',
  `CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `MODIFYDATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改日期',
  `CREATEUSERID` varchar(255) DEFAULT NULL COMMENT '创建人Id[sys_user.id]',
  `MODIFYUSERID` varchar(255) DEFAULT NULL COMMENT '修改人Id[sys_user.id]',
  `VERSION` varchar(255) DEFAULT '1.0.0' COMMENT '版本号',
  `ROLEID` decimal(19,5) NOT NULL COMMENT '角色Id[sys_role.roleId]',
  `MENUID` decimal(19,5) NOT NULL COMMENT '按钮Id[sys_menu.menuId]',
  `INPUTID` varchar(255) NOT NULL COMMENT '元素Id[sys_input.inputId]',
  `ORD` int(19) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`ROLEID`,`INPUTID`,`MENUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SYS_AUTHORITY';
