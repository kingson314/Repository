/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : patent

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2016-08-15 12:47:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` varchar(40) NOT NULL,
  `name` varchar(255) default NULL,
  `level` varchar(255) default NULL,
  `relative` varchar(4000) default NULL,
  `memo` varchar(4000) default NULL,
  `files` varchar(4000) default NULL,
  `detailurl` varchar(255) default NULL,
  `detailcontent` text,
  `ord` int(11) default NULL,
  `state` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('3b42b03f-295c-4790-8e01-d3d4778a6210', '22', '', '', '', '', '', null, '0', '1');
INSERT INTO `project` VALUES ('7e4f2cbf-f82f-45c1-9582-547f620a58f0', '横琴国际知识产权交易中心简介', '', '', '横琴国际知识产权交易中心简介', '7e4f2cbf-f82f-45c1-9582-547f620a58f0_0.jpg,7e4f2cbf-f82f-45c1-9582-547f620a58f0_1.jpg,7e4f2cbf-f82f-45c1-9582-547f620a58f0_2.jpg,7e4f2cbf-f82f-45c1-9582-547f620a58f0_3.jpg', '7e4f2cbf-f82f-45c1-9582-547f620a58f0.jsp', '<p style=\";text-align:center;line-height:150%\"><span style=\";font-family:黑体;line-height:150%;font-size:29px\">横琴国际知识产权交易中心简介</span></p><p style=\"line-height: 150%;\"><strong style=\"line-height: 150%;\"><span style=\"font-family: 仿宋_GB2312;line-height: 150%;font-size: 21px;background: rgb(255, 255, 255)\">&nbsp;</span></strong></p><p style=\"text-align:center\"><img src=\"/Repository/ueditor/image/20160814/1471151027513099981.png\" title=\"1471151027513099981.png\" alt=\"\"/></p><p style=\"text-align:center\"><br/></p><p style=\"text-indent:43px;line-height:37px\"><span style=\";font-family:仿宋_GB2312;font-size:21px\">横琴国际知识产权交易中心有限公司（简称“横琴知交中心”）于2014年12月经广东省人民政府批准成立，由珠海金融投资控股集团有限公司、横琴金融投资有限公司、横琴发展有限责任公司强强联合投资组建而成，注册资本1亿元人民币。横琴知交中心承担国家知识产权运营横琴金融与国际特色试点平台（简称“国家横琴平台”）的建设运行任务，是国家“1+2+20+N”的知识产权运营体系的重要组成部分。</span></p><p style=\"text-indent:43px;line-height:37px\"><span style=\";font-family:仿宋_GB2312;font-size:21px\">国家横琴平台七弦琴知识产权资产与服务交易网以“人，资，网，政，产、知、研”为战略方针，以“加速知识产权资产和服务的交易与配置、为中国实体经济插上知识产权的翅膀”为第一个战略发展期的使命，充分发挥人才优势，调动资本的力量，运用互联网思维和工具，借助政策资源，全面打通产业界、知识产权界、研发界，积极</span><span style=\";font-family:仿宋_GB2312;font-size:21px\">建设中国脑力劳动者互联网家园，</span><span style=\";font-family:仿宋_GB2312;font-size:21px\">着力打造一个集聚创新人才、创新资源、创新要素的生态系统，提供以知识产权金融创新、知识产权跨境交易为特色的全方位、一站式、高品质的知识产权资产交易和服务交易服务。</span><span style=\";font-family:仿宋_GB2312;font-size:21px\">国家横琴平台的发展愿景是成为具有国际影响力、国内一流的生态型知识产权交易平台，致力于建设成为全球知识产权资产集散地、知识产权金融创新策源地、知识产权服务资源整合者、企业知识产权高级管家、知识产权人才摇篮与高端智库。</span></p><p style=\"text-indent:43px;line-height:40px\"><span style=\";font-family:仿宋_GB2312;font-size:21px\">国家横琴平台七弦琴知识产权交易网的8个主要产品：知识产权资产交易（专利、商标、版权）；知识产权服务交易（代理、诉讼、分析、咨询、培训）；知识产权创业项目交易（以知识产权为核心的创业项目）；知识产权运营服务（受托、收购、专利池、标准化）；创业辅导及投融资服务；研发服务；设计服务；特种有形商品交易。10大会员体系：个人（1-7星级、1-7弦级）；企业（1-7星级），高校（1-7星级），院所（1-7星级）；产业协会（1-7弦级），服务机构（1-7弦级），运营机构（1-7弦级），投资机构（1-7弦级），研发机构（1-7弦级），设计机构（1-7弦级）。</span></p><p style=\"text-indent:43px;line-height:40px\"><span style=\";font-family:仿宋_GB2312;font-size:21px\">国家横琴平台旗下拥有“七弦琴”知识产权资产与服务交易网、“七弦琴”知识产权高端服务、“七弦琴”专利投资、“七弦琴”专利、商标、外观设计、版权交易、“七弦琴·智财通宝”知识产权融资及股权众筹、“七弦琴”核心专利产品或专利技术认证、“七弦琴”知识产权经济、行政管理与金融创新研究、“七弦琴”与全球高品质知识产权服务机构的联营服务等产品体系。</span></p><p style=\"text-indent:43px\"><span style=\";font-family:仿宋_GB2312;font-size:21px\">横琴知交中心下设平台部，交易部，金融创新部，国际运营部，业务发展与会员部，研究培训部，流程管理与客户服务部，合规法务部，审计监察部，财务管理部，董事会办公室，综合管理部等12个部门。已经初步搭建了一个专业化、国际化、年轻化、多元化的团队，逐步形成了自己的企业文化。公司内部治理的5个原则：战略、开明、协作、执行力、学习。员工考核的4个标准：配合度、出活、省心、启发。文化建设的7个要素：人品、章法、执行力、心态、能力、使命、品味。能力建设的7个维度：思想力、表达力、执行力、沟通力、学习力、交际力、信念力。（2016年4月）</span></p><p><br/></p>', '0', '0');
INSERT INTO `project` VALUES ('c6651135-e4bd-41c5-98b0-1a5af04fe613', 'LED', '', '', '', 'c6651135-e4bd-41c5-98b0-1a5af04fe613_0.jpg,c6651135-e4bd-41c5-98b0-1a5af04fe613_1.jpg', 'c6651135-e4bd-41c5-98b0-1a5af04fe613.jsp', null, '0', '1');
INSERT INTO `project` VALUES ('fed51889-d879-467f-80f6-4926d2f5a28b', '1', '2', '3', '7', 'fed51889-d879-467f-80f6-4926d2f5a28b_0.jpg,fed51889-d879-467f-80f6-4926d2f5a28b_1.jpg', 'fed51889-d879-467f-80f6-4926d2f5a28b.jsp', null, '0', '1');
