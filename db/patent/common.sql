/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : patent

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2016-08-15 12:47:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `common`
-- ----------------------------
DROP TABLE IF EXISTS `common`;
CREATE TABLE `common` (
  `id` varchar(40) NOT NULL,
  `domain` varchar(255) default NULL,
  `num` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `ord` int(11) default NULL,
  `state` int(11) default NULL,
  `rectype` int(11) default NULL,
  `pdate` varchar(40) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common
-- ----------------------------
INSERT INTO `common` VALUES ('0786ad2e-316e-4427-890b-a06ed06cf9f6', '保健用品', '201510151204X', '一种能够对全身任意部位进行按摩的按摩衣', '授权未办登', '发明', '0', '0', '1', '2016.10.13');
INSERT INTO `common` VALUES ('08dd511a-8ce0-4e0d-93b5-dc6a7907b375', '中药提取物', '200810050054.3', '卷柏降血脂有效部位及其提取方法和应用以及穗花衫双黄酮的提取方法', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('0f5fae0a-78e6-4e31-95da-1ddee82f4ad4', '1', '2', '3', '4', '5', '0', '1', '0', null);
INSERT INTO `common` VALUES ('11', '高科技', '高科技', '我的', '专利权维持', '111', '0', '1', '0', null);
INSERT INTO `common` VALUES ('16c50e7f-9957-49b0-bc49-1823e0da7523', '22222', '1111', '', '', '', '0', '1', '1', '2015-01-01');
INSERT INTO `common` VALUES ('250abfe1-5d5c-43f4-85e8-20994081d386', '1', '2', '3', '4', '5', '6', '1', '0', null);
INSERT INTO `common` VALUES ('33b7e7e1-788d-4ca0-a592-0543f560ca73', '222', '', '1111', '', '', '0', '1', '0', '111');
INSERT INTO `common` VALUES ('35b1ee60-ff3e-4689-bcd9-d54152e683b4', '小家电', '2013100850529', '带吹风的吸尘器', '授权未办登', '发明', '0', '0', '1', '2016.10.17');
INSERT INTO `common` VALUES ('3b31ec77-776f-4bb2-b5c3-0761d82a1fa3', '日用保健', '2014102889301 ', '柏木药枕', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('6739dbc6-7440-448d-8973-8decdad41551', '保健用品', '2015101506922', '一种按摩套件', '授权未办登', '发明', '0', '0', '1', '2016.9.21');
INSERT INTO `common` VALUES ('a5f8c44d-8360-4432-92b9-329225cb91fd', '中药提取物', '201110322947.0', '帽蕊木有效部位及其提取方法和在制备保肝护肝药物方面的应用 ', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('ae7a25aa-c52c-4d74-904c-bcce08b69797', '中药提取物', '200910064058.1', '卷柏提取物及其提取方法和应用', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('b9ce812a-193e-48e1-912f-2e5f4da02319', '日用保健', '2014102889265', '一种仿决明子婴幼儿枕', '下证/有权', '发明', '0', '0', '0', '');
