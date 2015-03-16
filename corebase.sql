/*
Navicat MySQL Data Transfer

Source Server         : hequn
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : corebase

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2015-03-15 18:05:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_business_record
-- ----------------------------
DROP TABLE IF EXISTS `t_business_record`;
CREATE TABLE `t_business_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(30) NOT NULL,
  `contract_sum` varchar(10) NOT NULL,
  `data_origin` varchar(30) DEFAULT NULL,
  `data_version` varchar(10) DEFAULT NULL,
  `contract_last` varchar(30) DEFAULT NULL,
  `data_share` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_business_record
-- ----------------------------
INSERT INTO `t_business_record` VALUES ('1', 'GFK', '233', '北京电信', '1', '14555', '1');
INSERT INTO `t_business_record` VALUES ('2', 'GFK', '233', '上海电信', '2', '2', '2');
INSERT INTO `t_business_record` VALUES ('3', '贺群', '84', '北京电信', '3', '366', '3');

-- ----------------------------
-- Table structure for t_security_businessdata
-- ----------------------------
DROP TABLE IF EXISTS `t_security_businessdata`;
CREATE TABLE `t_security_businessdata` (
  `businessdata_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `install_date` date DEFAULT NULL,
  `regulation` varchar(40) DEFAULT NULL COMMENT '规则匹配',
  `parent_id` int(11) DEFAULT NULL,
  `is_leaf` bit(1) DEFAULT b'1',
  PRIMARY KEY (`businessdata_id`),
  UNIQUE KEY `ind_name` (`name`) USING BTREE,
  KEY `ind_parent_id` (`parent_id`) USING BTREE,
  CONSTRAINT `fk_businessdata` FOREIGN KEY (`parent_id`) REFERENCES `t_security_businessdata` (`businessdata_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_businessdata
-- ----------------------------

-- ----------------------------
-- Table structure for t_security_decision_entitlement
-- ----------------------------
DROP TABLE IF EXISTS `t_security_decision_entitlement`;
CREATE TABLE `t_security_decision_entitlement` (
  `decision_entitlement_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  `usercategory_id` int(11) NOT NULL,
  `businessdata_id` int(11) NOT NULL,
  `effect` varchar(100) NOT NULL COMMENT '决策',
  `deny_reason` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`decision_entitlement_id`),
  KEY `ind_privilege_id` (`privilege_id`) USING BTREE,
  KEY `ind_usercategory_id` (`usercategory_id`) USING BTREE,
  KEY `ind_businessdata_id` (`businessdata_id`) USING BTREE,
  CONSTRAINT `fk_decision_entitlement_businessdata` FOREIGN KEY (`businessdata_id`) REFERENCES `t_security_businessdata` (`businessdata_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_decision_entitlement_usercategory` FOREIGN KEY (`usercategory_id`) REFERENCES `t_security_usercategory` (`usercategory_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_decision_entitlement
-- ----------------------------

-- ----------------------------
-- Table structure for t_security_department
-- ----------------------------
DROP TABLE IF EXISTS `t_security_department`;
CREATE TABLE `t_security_department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `level` varchar(30) NOT NULL,
  `is_leaf` bit(1) NOT NULL DEFAULT b'1',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `ind_name` (`name`) USING BTREE,
  KEY `ind_parent_id` (`parent_id`) USING BTREE,
  CONSTRAINT `fk_department_department` FOREIGN KEY (`parent_id`) REFERENCES `t_security_department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_department
-- ----------------------------
INSERT INTO `t_security_department` VALUES ('1', '电信集团公司', '1', '\0', null);
INSERT INTO `t_security_department` VALUES ('96', '北京电信', '2', '', '1');
INSERT INTO `t_security_department` VALUES ('97', '上海电信', '2', '', '1');

-- ----------------------------
-- Table structure for t_security_department_info
-- ----------------------------
DROP TABLE IF EXISTS `t_security_department_info`;
CREATE TABLE `t_security_department_info` (
  `department_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `data_version` varchar(20) NOT NULL,
  `capacity` varchar(20) NOT NULL,
  PRIMARY KEY (`department_info_id`),
  KEY `fk_depart_info` (`department_id`),
  CONSTRAINT `fk_depart_info` FOREIGN KEY (`department_id`) REFERENCES `t_security_department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_department_info
-- ----------------------------
INSERT INTO `t_security_department_info` VALUES ('1', '96', '144', '234232', '1');
INSERT INTO `t_security_department_info` VALUES ('2', '97', '72', '828', '92');

-- ----------------------------
-- Table structure for t_security_logdata
-- ----------------------------
DROP TABLE IF EXISTS `t_security_logdata`;
CREATE TABLE `t_security_logdata` (
  `id` varchar(60) NOT NULL DEFAULT '',
  `user` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `action` varchar(200) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `discription` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_logdata
-- ----------------------------
INSERT INTO `t_security_logdata` VALUES ('016d8f55-63b8-4a09-b6e9-1caba3702318', 'hequn', '127.0.0.1', '2015-03-15 17:48:54', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('01849707-5b65-48ec-aacc-5ff6255957fb', 'hequn', '127.0.0.1', '2015-03-15 17:54:54', '进入机构管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('01b8d742-daa3-4699-8bca-5cc45c91c9fd', 'hequn', '127.0.0.1', '2015-03-15 18:03:28', '进入修改记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('02b40d7e-241e-4ed7-97cc-9689577b98da', 'hequn', '127.0.0.1', '2015-03-15 12:49:11', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('0335690b-efe7-4bf4-a9d9-a28e89c1299e', 'hequn', '127.0.0.1', '2015-03-15 18:03:12', '进入日志管理', '基础平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('045b6fae-91e7-4639-b331-b07ab48b0a9e', 'hequn', '127.0.0.1', '2015-03-15 17:58:39', '进入新增机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('06837de0-1249-4dc4-a7af-5ad9c9744615', 'hequn', '127.0.0.1', '2015-03-15 17:58:37', '进入新增机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('0745b740-db04-418d-bea7-bcca1c78dd05', 'hequn', '127.0.0.1', '2015-03-15 17:47:36', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('084f1805-57ec-4077-9847-147260f9f060', 'hequn', '127.0.0.1', '2015-03-15 17:59:24', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('0a0eba78-119f-4f85-840c-867dbc637511', 'hequn', '127.0.0.1', '2015-03-15 17:33:29', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('0aa44af1-3d10-4cde-a67e-4ff7850ea38b', 'hequn', '127.0.0.1', '2015-03-15 17:40:33', '进入新增记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('0b2bba97-e496-45f9-9d98-5db1bf885cf0', 'hequn', '127.0.0.1', '2015-03-15 17:58:51', '进入修改机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('0c74698c-bdc8-4016-853e-bdb4e89de0c9', 'hequn', '127.0.0.1', '2015-03-15 17:55:00', '进入修改机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('0dab008b-11bc-4e47-8317-6c380d4b9d8c', 'hequn', '127.0.0.1', '2015-03-15 17:19:15', '进入修改记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('0f49bf65-21c3-4447-92f2-a70f117b099a', 'hequn', '127.0.0.1', '2015-03-15 17:23:45', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('0fcd3e14-7540-4412-95e0-45ea66438e15', 'hequn', '127.0.0.1', '2015-03-15 12:48:51', '进入权限管理', '基础平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('102704cc-6aad-4e92-a23f-860c69ae4eb7', 'hequn', '127.0.0.1', '2015-03-15 18:01:20', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('10410a06-2c7b-4fcb-a086-20c824937972', 'hequn', '127.0.0.1', '2015-03-15 17:34:32', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('117a2aaa-94e7-41bf-8846-00ea6aa2e7ec', 'hequn', '127.0.0.1', '2015-03-15 17:58:54', '进入修改机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('141977d2-e53d-42d3-99a4-2915a6a15ff6', 'hequn', '127.0.0.1', '2015-03-15 16:56:15', '进入权限管理', '基础平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('15510713-27d3-444c-a3ec-15152464f5e9', 'hequn', '127.0.0.1', '2015-03-15 17:22:34', '进入新增记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('15b5af88-fc74-4c0d-87d7-11aab260ed71', 'hequn', '127.0.0.1', '2015-03-15 17:42:16', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('205bceb7-0302-4071-a912-ac071d8f639b', 'hequn', '127.0.0.1', '2015-03-15 17:58:43', '进入修改机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('20f332f5-869b-4d1c-ab6c-33a91da04d7b', 'hequn', '127.0.0.1', '2015-03-15 17:19:26', '进入修改记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('225155ff-faa7-4545-b124-5fe1959cd08a', 'hequn', '127.0.0.1', '2015-03-15 17:21:41', '进入修改记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('24b00a1f-793b-46a1-8fff-0eba850252fe', 'hequn', '127.0.0.1', '2015-03-15 17:53:11', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('27f88ed6-5dc7-474f-9de3-e8e6e07a6af7', 'hequn', '127.0.0.1', '2015-03-15 17:42:19', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('2ba68c32-bb52-425e-a242-e72be48cecae', 'hequn', '127.0.0.1', '2015-03-15 12:48:48', '进入新增权限', '权限管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('35145b60-8b32-4fc7-b8a5-c9caadf742f1', 'hequn', '127.0.0.1', '2015-03-15 18:03:20', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('3516a759-f56e-4f1f-84fe-9cd0494eba22', 'hequn', '127.0.0.1', '2015-03-15 16:56:05', '进入用户管理', '基础平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('37478e9d-b1f5-4958-bb08-46826705dd3d', 'hequn', '127.0.0.1', '2015-03-15 18:03:22', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('3753414a-ad8a-489c-9b28-ac5baa62df2a', 'hequn', '127.0.0.1', '2015-03-15 17:33:37', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('38198490-aec6-4a5c-8919-60b529aefad0', 'hequn', '127.0.0.1', '2015-03-15 17:30:54', '进入新增记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('38249fe6-6a22-4a00-8fd2-3ac8ba76bf6f', 'hequn', '127.0.0.1', '2015-03-15 17:58:38', '进入修改机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('38dd2425-5fc3-4096-bd05-0e99d4c7232c', 'hequn', '127.0.0.1', '2015-03-15 17:18:40', '进入修改权限', '权限管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('39e47313-4558-4964-b997-7c041c5cfc75', 'hequn', '127.0.0.1', '2015-03-15 17:37:48', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('3a7012ce-ca4c-4d8c-80f2-dcf0fae7ecda', 'hequn', '127.0.0.1', '2015-03-15 17:58:19', '进入机构管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('3c650b96-2976-4e4a-89e8-95e9a0725a52', 'hequn', '127.0.0.1', '2015-03-15 17:42:19', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('3c8a8a5f-7eec-4874-a398-17046cdd74d9', 'hequn', '127.0.0.1', '2015-03-15 18:03:21', '进入机构管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('3cee9bda-3e58-4b43-9e8f-0771a7020914', 'hequn', '127.0.0.1', '2015-03-15 17:22:30', '进入修改记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('3e02a614-0caa-4747-a8c8-dae6134ae779', 'hequn', '127.0.0.1', '2015-03-15 17:19:18', '进入修改记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('415e21ec-1782-4118-a7d4-b509965740d8', 'hequn', '127.0.0.1', '2015-03-15 12:49:15', '进入新增记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('4878cfe1-624a-4ee8-99e2-54c64ba8368a', 'hequn', '127.0.0.1', '2015-03-15 17:51:22', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('4b3f6a7c-4ce0-47df-b243-8e20e0656c94', 'hequn', '127.0.0.1', '2015-03-15 18:03:16', '进入机构管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('4b4d6aeb-cf55-4137-8259-7e688e5fd1c5', 'hequn', '127.0.0.1', '2015-03-15 17:47:34', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('4b8f6cc7-c480-414e-b5f1-dfaaa5f9ec5c', 'hequn', '127.0.0.1', '2015-03-15 17:53:53', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('500df2d4-32d2-47b2-8ede-a5e9221fc296', 'hequn', '127.0.0.1', '2015-03-15 17:34:54', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('5051d5a0-4080-4506-93c2-1909f81192e6', 'hequn', '127.0.0.1', '2015-03-15 16:56:17', '进入日志管理', '基础平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('52f5d075-bac0-45e1-8621-2d9dcd448e38', 'hequn', '127.0.0.1', '2015-03-15 17:52:22', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('557b240c-2db9-4544-96c8-2bbeac3466c7', 'hequn', '127.0.0.1', '2015-03-15 17:23:43', '进入机构管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('576699a2-7b83-4351-8f58-a821a9264237', 'hequn', '127.0.0.1', '2015-03-15 17:19:24', '进入修改记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('578fb349-118b-41f1-9029-2d4147b2b6ad', 'hequn', '127.0.0.1', '2015-03-15 17:59:25', '进入机构管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('597d2007-7e6f-46b0-967f-750ab48ed6c4', 'hequn', '127.0.0.1', '2015-03-15 17:22:36', '进入新增记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('5efabe2e-f5bf-41dc-81a8-f08b2062cbc5', 'hequn', '127.0.0.1', '2015-03-15 17:10:06', '进入权限管理', '基础平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('5efe1a8a-203c-4266-b676-564d83731c29', 'hequn', '127.0.0.1', '2015-03-15 18:02:13', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('5f2f470e-4c48-43d8-a111-8d8701fa0983', 'hequn', '127.0.0.1', '2015-03-15 17:33:31', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('602fd2e6-daa8-4656-ac53-2aecb1a424e8', 'hequn', '127.0.0.1', '2015-03-15 17:50:15', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('62a0a5a7-e16f-493d-b92a-6cd0ec8ace86', 'hequn', '127.0.0.1', '2015-03-15 16:56:20', '进入机构管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('62fda9b8-aa5e-444a-b02e-03d4ad906acd', 'hequn', '127.0.0.1', '2015-03-15 17:30:56', '进入新增记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('631fc4c5-5741-4860-8011-795fb5e5c78e', 'hequn', '127.0.0.1', '2015-03-15 17:32:50', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('6632e98b-bf26-4c6e-8bb2-04a1a6b32be6', 'hequn', '127.0.0.1', '2015-03-15 17:44:10', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('67ad6240-9e34-4fdd-a6a2-46b27fff00c0', 'hequn', '127.0.0.1', '2015-03-15 17:43:58', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('687c4db8-675f-465b-85f7-95d075b52c0e', 'test', '127.0.0.1', '2015-03-15 17:54:03', '进入对账信息', '业务平台模块', 'test');
INSERT INTO `t_security_logdata` VALUES ('68cf279f-a253-4da2-8562-5b3b3b8f4b73', 'hequn', '127.0.0.1', '2015-03-15 17:58:56', '进入新增机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('69659953-4706-4d94-b233-1c35002ebea9', 'hequn', '127.0.0.1', '2015-03-15 17:52:47', '进入新增记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('69a02684-834b-4f5b-baf3-e2f8ab7efde3', 'hequn', '127.0.0.1', '2015-03-15 17:44:10', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('6b4d0f44-f33c-4432-9c23-ac9f4a8340af', 'hequn', '127.0.0.1', '2015-03-15 18:03:18', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('6bc13fd5-7699-4329-9da5-cdfda566dc9d', 'hequn', '127.0.0.1', '2015-03-15 17:19:30', '进入修改记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('6d6808eb-290f-4a05-8d18-68af3fc6ad9f', 'hequn', '127.0.0.1', '2015-03-15 17:19:21', '进入修改记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('6eb05890-919c-4b3b-9879-b17b93734a39', 'hequn', '127.0.0.1', '2015-03-15 17:58:30', '进入新增机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('70c5a8db-4560-43e6-ab13-805fa1045151', 'hequn', '127.0.0.1', '2015-03-15 17:36:32', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('70fb36f8-d3c4-4b65-93b6-2b90f3f303d6', 'hequn', '127.0.0.1', '2015-03-15 12:49:02', '进入删除权限', '权限管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('715fcf68-3ea5-432e-a298-91141a585996', 'hequn', '127.0.0.1', '2015-03-15 17:58:52', '进入新增机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('71a144ab-b816-4a76-91ff-89f4b88cfdcd', 'hequn', '127.0.0.1', '2015-03-15 17:33:35', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('745c0a74-ccda-47af-b18e-6103dd583350', 'hequn', '127.0.0.1', '2015-03-15 17:53:19', '进入修改记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('782cd7b1-f37d-4045-896a-977967b4c6c6', 'hequn', '127.0.0.1', '2015-03-15 17:33:33', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('7a8ade40-ef6b-45c6-9dfe-d60a7980659c', 'hequn', '127.0.0.1', '2015-03-15 17:52:23', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('8251548a-4c57-43c4-81e1-6e240166414a', 'hequn', '127.0.0.1', '2015-03-15 17:53:55', '进入机构管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('8323a71d-952c-4217-ab2f-56796588cf9f', 'hequn', '127.0.0.1', '2015-03-15 17:51:38', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('838b3b55-7ce2-44fd-9eb6-766eefba999e', 'hequn', '127.0.0.1', '2015-03-15 17:40:27', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('839c0254-41c2-483a-bb4c-0a1370e3371c', 'hequn', '127.0.0.1', '2015-03-15 17:51:25', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('858e9cc3-9d2e-4db8-8d0b-7b94fa16bf9b', 'hequn', '127.0.0.1', '2015-03-15 17:38:20', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('85c67ebc-19dc-4628-a69f-d4d54465c67c', 'hequn', '127.0.0.1', '2015-03-15 17:43:36', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('8638cbab-a6a8-4fd5-9892-1e8eec62b62e', 'hequn', '127.0.0.1', '2015-03-15 16:56:36', '进入权限管理', '基础平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('88525bc6-c16e-45c7-ad55-f00158b8a2ac', 'hequn', '127.0.0.1', '2015-03-15 12:49:20', '进入修改记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('89703d77-4250-4c1e-b4a8-e0ff180ee878', 'hequn', '127.0.0.1', '2015-03-15 18:03:19', '进入机构管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('8ccd8c18-109e-4a05-a360-a7ac77014121', 'hequn', '127.0.0.1', '2015-03-15 17:51:58', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('8e748606-b891-4360-9d53-ad29b2a4b50f', 'hequn', '127.0.0.1', '2015-03-15 16:56:12', '进入角色管理', '角色管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('905a2227-5cac-462b-96d1-efbf91e76af3', 'hequn', '127.0.0.1', '2015-03-15 17:58:27', '进入新增机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('90c37dc6-a751-4d33-8769-eafb5c3c78ba', 'hequn', '127.0.0.1', '2015-03-15 17:48:55', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('930882dc-7302-4636-be41-9c944d07f210', 'hequn', '127.0.0.1', '2015-03-15 17:50:31', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('94db5e8f-330a-4c68-acc3-88ee3d8a23dd', 'hequn', '127.0.0.1', '2015-03-15 17:39:15', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('969485f8-e8e3-44b9-81e3-086002d3f6c3', 'hequn', '127.0.0.1', '2015-03-15 17:38:51', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('9884b492-1ec4-4877-94ea-6fc20568fd77', 'hequn', '127.0.0.1', '2015-03-15 18:03:32', '进入新增记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('98eacf15-d35f-4034-9819-9e2e7db7fd53', 'hequn', '127.0.0.1', '2015-03-15 18:03:14', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('999fdcd5-15aa-479a-8a87-81c78ea41c26', 'hequn', '127.0.0.1', '2015-03-15 17:48:52', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('9a985dd2-a801-444e-8074-467ca9d530af', 'hequn', '127.0.0.1', '2015-03-15 17:58:59', '进入修改机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('9ce3dfa3-e349-457f-ba2d-cd3a60666686', 'hequn', '127.0.0.1', '2015-03-15 18:01:35', '进入修改记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('9dbc5059-f511-454c-9f8b-a0f5c6fa6d65', 'hequn', '127.0.0.1', '2015-03-15 17:21:39', '进入修改记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('9fcf2d8f-3e41-42b9-82a8-8604dc9170c7', 'hequn', '127.0.0.1', '2015-03-15 17:34:34', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('a2bc167f-d1c5-4667-9ec5-d52ba0d8b169', 'hequn', '127.0.0.1', '2015-03-15 17:58:33', '进入机构管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('a7694811-5efd-4eec-b207-229848e39c85', 'hequn', '127.0.0.1', '2015-03-15 17:18:43', '进入机构管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('a7aba699-648a-4834-ba8d-29b5bc49bc17', 'hequn', '127.0.0.1', '2015-03-15 17:49:43', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('a80c0fc8-f424-421f-8c09-e4181f7ddbd6', 'hequn', '127.0.0.1', '2015-03-15 16:56:21', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('a98bcacc-379f-4879-b299-4c7c372017be', 'hequn', '127.0.0.1', '2015-03-15 17:39:24', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('aa413677-c4e2-468c-90ef-1c21a30ac452', 'hequn', '127.0.0.1', '2015-03-15 17:46:35', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('ac8bdbad-c0dc-48aa-b6fd-296f669f0122', 'hequn', '127.0.0.1', '2015-03-15 18:02:06', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('acb01e7b-78a3-449b-ba97-0620809a3065', 'hequn', '127.0.0.1', '2015-03-15 17:14:29', '进入权限管理', '基础平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('adc151a1-8072-41b5-8e9a-cc9eadf0c7ac', 'hequn', '127.0.0.1', '2015-03-15 17:43:58', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('b5af999f-21ce-455a-a46e-20b5e46b51f4', 'hequn', '127.0.0.1', '2015-03-15 17:22:23', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('b7588816-1b2f-4a0c-9b61-1a340f7f2d15', 'hequn', '127.0.0.1', '2015-03-15 18:03:11', '进入角色管理', '角色管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('b83f89c5-d16d-4566-b6fe-a4ee33099d44', 'hequn', '127.0.0.1', '2015-03-15 17:53:42', '进入角色管理', '角色管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('b960270b-e0f4-4453-8584-3890955b9e5c', 'hequn', '127.0.0.1', '2015-03-15 17:22:20', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('b9fd7554-7d31-40c0-bf74-742817a6ddca', 'hequn', '127.0.0.1', '2015-03-15 17:37:50', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('ba88cab5-4856-45c9-9ef3-ebafa1e1f9df', 'hequn', '127.0.0.1', '2015-03-15 17:58:24', '进入机构管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('bca79660-d9c9-4255-8df7-edce70831742', 'hequn', '127.0.0.1', '2015-03-15 17:58:57', '进入修改机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('c1acfb7c-4843-4a70-9b51-f8076b28535d', 'hequn', '127.0.0.1', '2015-03-15 18:02:11', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('c46e6938-cc94-43bb-b725-e7127c2e6790', 'test', '127.0.0.1', '2015-03-15 17:54:40', '进入对账信息', '业务平台模块', 'test');
INSERT INTO `t_security_logdata` VALUES ('c4c1439d-3207-47a0-93d0-c622b246eaef', 'hequn', '127.0.0.1', '2015-03-15 17:43:34', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('c6174b2d-21dd-45dd-80ca-4eaf67809cc7', 'hequn', '127.0.0.1', '2015-03-15 17:14:27', '进入角色管理', '角色管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('c6ed8d87-75ea-4eb0-972a-76476f713f29', 'hequn', '127.0.0.1', '2015-03-15 17:55:51', '进入新增机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('c834f646-d53d-4144-ba8e-62cf0af766ed', 'hequn', '127.0.0.1', '2015-03-15 17:37:56', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('d11d1db7-01bb-4415-8819-b732061eb3c7', 'hequn', '127.0.0.1', '2015-03-15 17:42:48', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('d190bbf8-5c44-446c-944e-a82ee6f28492', 'test', '127.0.0.1', '2015-03-15 17:23:23', '进入对账信息', '业务平台模块', 'test');
INSERT INTO `t_security_logdata` VALUES ('d4a86f26-ba6f-4dfa-aac8-265730026bb9', 'hequn', '127.0.0.1', '2015-03-15 18:02:04', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('d5af43cc-c866-4047-9991-424c115e44cb', 'hequn', '127.0.0.1', '2015-03-15 17:19:12', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('d5f74b06-0a51-46b3-a94b-2779e682cf51', 'hequn', '127.0.0.1', '2015-03-15 18:02:14', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('d73a6eec-8ac7-4608-836d-88465132d05e', 'hequn', '127.0.0.1', '2015-03-15 17:42:15', '进入机构管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('d773ac70-59b1-4bfa-a6c9-ad33727cc145', 'hequn', '127.0.0.1', '2015-03-15 17:53:50', '进入日志管理', '基础平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('d7f194ae-bb26-4ede-8b69-cb5f2de185e7', 'hequn', '127.0.0.1', '2015-03-15 18:03:23', '进入机构管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('d9be372e-0ca8-41b1-9332-e2e82630a86b', 'hequn', '127.0.0.1', '2015-03-15 17:53:11', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('daa61117-5b0f-44d6-a46e-094f0fb996cf', 'hequn', '127.0.0.1', '2015-03-15 17:58:49', '进入机构管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('dc83fa70-87c9-427c-bb59-9790a5032234', 'hequn', '127.0.0.1', '2015-03-15 18:01:38', '进入新增记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('dca10b5f-cc7c-450a-99bb-7e4509d7c05b', 'hequn', '127.0.0.1', '2015-03-15 17:58:29', '进入修改机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('df2fa979-5fba-4e67-b91b-86f13d988048', 'hequn', '127.0.0.1', '2015-03-15 17:58:36', '进入修改机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('dfe26549-ddd1-4ff7-85b4-99521dbc97b5', 'hequn', '127.0.0.1', '2015-03-15 17:40:36', '进入修改记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('e0a75ef4-77bd-45a4-97ab-bc5f133e13d1', 'hequn', '127.0.0.1', '2015-03-15 17:18:32', '进入权限管理', '基础平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('e0b1092a-c3d8-4ed6-8707-41ca97707edd', 'hequn', '127.0.0.1', '2015-03-15 17:19:12', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('e11c701b-143b-414b-8f7e-0dfa11659f45', 'hequn', '127.0.0.1', '2015-03-15 17:53:49', '进入权限管理', '基础平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('e26a049c-bac5-496c-9346-47b281d2c3d7', 'hequn', '127.0.0.1', '2015-03-15 17:22:27', '进入修改记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('e3b14a49-f6c7-476f-ad35-2e78244d38e3', 'hequn', '127.0.0.1', '2015-03-15 12:49:18', '进入新增记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('e4a1d27a-c37a-4adf-9e42-e33b3fe9cd49', 'hequn', '127.0.0.1', '2015-03-15 17:21:36', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('e506b8d9-aec7-4830-85d5-8a1d13239c6d', 'hequn', '127.0.0.1', '2015-03-15 17:53:44', '进入修改角色', '角色管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('e53f0f39-5024-48f5-813b-40030b9eb4ae', 'hequn', '127.0.0.1', '2015-03-15 17:30:51', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('e60156b0-0aa9-492a-ab93-ed655dbc4a7a', 'hequn', '127.0.0.1', '2015-03-15 17:50:02', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('e855698e-f3e5-4768-a6f5-5ee86beadc06', 'hequn', '127.0.0.1', '2015-03-15 17:37:21', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('e86e0557-c325-4416-8ae8-1da5dfe7c5dd', 'hequn', '127.0.0.1', '2015-03-15 17:33:39', '进入新增记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('ea90a7d0-9f07-4b5e-8fd6-aaee6f9fa113', 'hequn', '127.0.0.1', '2015-03-15 17:51:58', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('ec6a5a47-d7e3-43f2-9c45-bdb75baf2205', 'hequn', '127.0.0.1', '2015-03-15 17:55:50', '进入新增机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('ed541b41-8f51-4e0b-bbf4-636ac9aec447', 'hequn', '127.0.0.1', '2015-03-15 17:21:43', '进入修改记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('ef73c899-38ed-43f4-90c7-caaa3c5eaa14', 'hequn', '127.0.0.1', '2015-03-15 17:58:58', '进入新增机构', '机构管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('f0711b3d-33d9-411d-bff2-6afffa1c3d28', 'hequn', '127.0.0.1', '2015-03-15 12:49:09', '进入权限管理', '基础平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('f4b85d4c-fae4-4990-8fa8-95bdbd16fd6e', 'hequn', '127.0.0.1', '2015-03-15 17:50:02', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('f5a3f0d2-3df8-4aa6-b043-e07737c9a516', 'hequn', '127.0.0.1', '2015-03-15 17:18:45', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('f9b502b7-9854-46ff-a0e0-9f365dc3f78e', 'hequn', '127.0.0.1', '2015-03-15 18:03:25', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('fa401f0f-a92d-4dcf-b9d2-08917aaa4412', 'hequn', '127.0.0.1', '2015-03-15 17:59:26', '进入客户管理', '业务平台模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('fb4f2061-af53-435b-a20b-6672cb38d9e0', 'hequn', '127.0.0.1', '2015-03-15 17:22:32', '进入修改记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('fcb068c9-4f36-4ac2-8c1f-46b3ccddc430', 'hequn', '127.0.0.1', '2015-03-15 17:52:49', '进入新增记录', '客户管理模块', '贺群');
INSERT INTO `t_security_logdata` VALUES ('fefea2cc-c7e0-45c0-9ee1-690fe8d90d80', 'hequn', '127.0.0.1', '2015-03-15 17:47:05', '进入客户管理', '业务平台模块', '贺群');

-- ----------------------------
-- Table structure for t_security_privilege
-- ----------------------------
DROP TABLE IF EXISTS `t_security_privilege`;
CREATE TABLE `t_security_privilege` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT 'NULL',
  `name` varchar(100) NOT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `level` tinyint(2) DEFAULT '0',
  `is_leaf` bit(1) DEFAULT b'1',
  `url` varchar(100) NOT NULL,
  `target` varchar(20) DEFAULT 'rightFrame',
  `order_num` int(11) DEFAULT '0',
  `display` bit(1) DEFAULT b'0',
  `type` varchar(30) DEFAULT 'NULL',
  PRIMARY KEY (`privilege_id`),
  UNIQUE KEY `ind_name` (`name`) USING BTREE,
  KEY `ind_parent_id` (`parent_id`) USING BTREE,
  CONSTRAINT `fk_privilege_privilege` FOREIGN KEY (`parent_id`) REFERENCES `t_security_privilege` (`privilege_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_privilege
-- ----------------------------
INSERT INTO `t_security_privilege` VALUES ('1', null, '基础平台', '基础平台', '', '1', '\0', '/menu/platForm', '', null, null, '1');
INSERT INTO `t_security_privilege` VALUES ('2', '388', '机构管理', '机构管理', '业务平台', '2', '\0', '/application/modules/system/system_organ_main.jsp', '', null, null, '2');
INSERT INTO `t_security_privilege` VALUES ('3', '2', '新增机构', '新增机构', '机构管理', '3', '', '/application/modules/system/system_organ_add_dialog.jsp', 'organ_add', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('4', '2', '修改机构', '修改机构', '机构管理', '3', '', '/application/modules/system/system_organ_modify_dialog.jsp', 'organ_mod', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('5', '2', '删除机构', '删除机构', '机构管理', '3', '', '/system/privilege/deleteOrgan.do', 'organ_del', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('6', '1', '用户管理', '用户管理', '基础平台', '2', '\0', '/application/modules/system/system_user_main.jsp', '', null, null, '2');
INSERT INTO `t_security_privilege` VALUES ('7', '6', '新增用户', '新增用户', '用户管理', '3', '', '/application/modules/system/system_user_add_dialog.jsp', 'user_add', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('8', '6', '修改用户', '修改用户', '用户管理', '3', '', '/application/modules/system/system_user_modify_dialog.jsp', 'user_mod', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('9', '6', '查看用户', '查看用户', '用户管理', '3', '', '/application/modules/system/system_user_check_dialog.jsp', 'user_check', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('10', '6', '删除用户', '删除用户', '用户管理', '3', '', '/system/user/deleteUser.do', 'user_del', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('11', '1', '角色管理', '角色管理', '角色管理', '2', '\0', '/application/modules/system/system_role_main.jsp', '', null, null, '2');
INSERT INTO `t_security_privilege` VALUES ('12', '11', '新增角色', '新增角色', '角色管理', '3', '', '/application/modules/system/system_role_add_dialog.jsp', 'role_add', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('13', '11', '修改角色', '修改角色', '角色管理', '3', '', '/application/modules/system/system_role_modify_dialog.jsp', 'role_mod', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('14', '11', '查看角色', '查看角色', '角色管理', '3', '', '/application/modules/system/system_role_check_dialog.jsp', 'role_check', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('15', '11', '配置权限', '配置权限', '角色管理', '3', '', '/application/modules/system/system_role_addPrivilege_dialog.jsp', 'role_set', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('16', '11', '删除角色', '删除角色', '角色管理', '3', '', '/system/role/deleteRole.do', 'role_del', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('17', '1', '权限管理', '权限管理', '基础平台', '2', '\0', '/application/modules/system/system_privilege_main.jsp', '', null, null, '2');
INSERT INTO `t_security_privilege` VALUES ('18', '17', '新增权限', '新增权限', '权限管理', '3', '', '/application/modules/system/system_privilege_add_dialog.jsp', 'privilege_add', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('19', '17', '修改权限', '修改权限', '权限管理', '3', '', '/application/modules/system/system_privilege_modify_dialog.jsp', 'privilege_mod', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('20', '17', '删除权限', '删除权限', '权限管理', '3', '', '/system/privilege/deletePrivilege.do', 'privilege_del', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('381', '6', '冻结用户', '冻结用户', '用户管理', '3', '', '/system/user/lockUser.do', 'user_lock', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('382', '6', '废弃用户', '废弃用户', '用户管理', '3', '', '/system/user/expireUser.do', 'user_expire', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('383', '6', '重置密码', '重置密码', '用户管理', '3', '', '/system/user/recoverUserPass.do', 'user_reset', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('384', '6', '启用用户', '启用用户', '用户管理', '3', '', '/system/user/recoverUser.do', 'user_restart', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('385', '6', '解冻用户', '解冻用户', '用户管理', '3', '', '/system/user/unLockUser.do', 'user_unlock', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('386', '387', '导出日志', '导出日志', '日志管理', '3', '', '/application/modules/system/system_log_export_dialog.jsp', 'log_export', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('387', '1', '日志管理', '日志管理', '基础平台', '2', '', '/application/modules/system/system_log_main.jsp', '', null, null, '2');
INSERT INTO `t_security_privilege` VALUES ('388', null, '业务平台', '业务平台', '', '1', '\0', '/menu/businessForm', '', null, null, '1');
INSERT INTO `t_security_privilege` VALUES ('389', '388', '客户管理', '客户管理', '业务平台', '2', '', '/application/modules/system/system_business_main.jsp', '', null, null, '2');
INSERT INTO `t_security_privilege` VALUES ('390', '389', '新增记录', '新增记录', '客户管理', '3', '', '/application/modules/system/system_business_add_dialog.jsp', 'business_add', null, '\0', '3');
INSERT INTO `t_security_privilege` VALUES ('393', '389', '修改记录', '修改记录', '客户管理', '3', '', '/application/modules/system/system_business_modify_dialog.jsp', 'business_mod', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('394', '389', '删除记录', '删除记录', '客户管理', '3', '', '/application/modules/system/business/deleteBusiness.do', 'business_del', null, null, '3');
INSERT INTO `t_security_privilege` VALUES ('395', '388', '对账信息', '对账信息', '业务平台', '2', '', '/application/modules/system/system_checkInfo_main.jsp', '', null, null, '2');

-- ----------------------------
-- Table structure for t_security_privilege_decisionentitlement
-- ----------------------------
DROP TABLE IF EXISTS `t_security_privilege_decisionentitlement`;
CREATE TABLE `t_security_privilege_decisionentitlement` (
  `privilege_decisionentitlement_id` int(11) NOT NULL AUTO_INCREMENT,
  `privilege_id` int(11) NOT NULL,
  `decision_entitlement_id` int(11) NOT NULL,
  PRIMARY KEY (`privilege_decisionentitlement_id`),
  KEY `ind_decision_entitlement_id` (`decision_entitlement_id`) USING BTREE,
  KEY `ind_privilege_id` (`privilege_id`) USING BTREE,
  CONSTRAINT `fk_privilege_decisionentitlement_decisionentitlement` FOREIGN KEY (`decision_entitlement_id`) REFERENCES `t_security_decision_entitlement` (`decision_entitlement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_privilege_dicisionentitlement_privilege` FOREIGN KEY (`privilege_id`) REFERENCES `t_security_privilege` (`privilege_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_privilege_decisionentitlement
-- ----------------------------

-- ----------------------------
-- Table structure for t_security_privilege_queryentitlement
-- ----------------------------
DROP TABLE IF EXISTS `t_security_privilege_queryentitlement`;
CREATE TABLE `t_security_privilege_queryentitlement` (
  `privilege_queryentitlement_id` int(11) NOT NULL AUTO_INCREMENT,
  `privilege_id` int(11) NOT NULL,
  `query_entitlement_id` int(11) NOT NULL,
  PRIMARY KEY (`privilege_queryentitlement_id`),
  KEY `ind_query_entitlement_id` (`query_entitlement_id`) USING BTREE,
  KEY `ind_privilege_id` (`privilege_id`) USING BTREE,
  CONSTRAINT `fk_privilege_queryentitlement_privilege` FOREIGN KEY (`privilege_id`) REFERENCES `t_security_privilege` (`privilege_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_privilege_queryentitlement_queryentitlement` FOREIGN KEY (`query_entitlement_id`) REFERENCES `t_security_query_entitlement` (`query_entitlement_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_privilege_queryentitlement
-- ----------------------------

-- ----------------------------
-- Table structure for t_security_query
-- ----------------------------
DROP TABLE IF EXISTS `t_security_query`;
CREATE TABLE `t_security_query` (
  `query_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `install_date` date DEFAULT NULL,
  `regulation` varchar(40) DEFAULT NULL COMMENT '规则匹配',
  `parent_id` int(11) DEFAULT NULL,
  `is_leaf` bit(1) DEFAULT b'1',
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `ind_name` (`name`) USING BTREE,
  KEY `ind_parent_id` (`parent_id`) USING BTREE,
  CONSTRAINT `fk_query_query` FOREIGN KEY (`parent_id`) REFERENCES `t_security_query` (`query_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_query
-- ----------------------------

-- ----------------------------
-- Table structure for t_security_query_entitlement
-- ----------------------------
DROP TABLE IF EXISTS `t_security_query_entitlement`;
CREATE TABLE `t_security_query_entitlement` (
  `query_entitlement_id` int(11) NOT NULL,
  `usercategory_id` int(11) DEFAULT NULL,
  `query_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`query_entitlement_id`),
  KEY `ind_usercategory_id` (`usercategory_id`) USING BTREE,
  KEY `ind_query_id` (`query_id`) USING BTREE,
  CONSTRAINT `fk_query_entitlement_query` FOREIGN KEY (`query_id`) REFERENCES `t_security_query` (`query_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_query_entitlement_usercategory` FOREIGN KEY (`usercategory_id`) REFERENCES `t_security_usercategory` (`usercategory_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_query_entitlement
-- ----------------------------

-- ----------------------------
-- Table structure for t_security_role
-- ----------------------------
DROP TABLE IF EXISTS `t_security_role`;
CREATE TABLE `t_security_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `ind_name` (`name`) USING BTREE,
  KEY `ind_parent_id` (`parent_id`) USING BTREE,
  CONSTRAINT `pk_role_role` FOREIGN KEY (`parent_id`) REFERENCES `t_security_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_role
-- ----------------------------
INSERT INTO `t_security_role` VALUES ('1', '超级管理员', '有所有权限', null);
INSERT INTO `t_security_role` VALUES ('80', '省公司角色', '省公司用户', null);

-- ----------------------------
-- Table structure for t_security_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `t_security_role_privilege`;
CREATE TABLE `t_security_role_privilege` (
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`privilege_id`),
  KEY `ind_privilege_id` (`privilege_id`) USING BTREE,
  KEY `ind_role_id` (`role_id`) USING BTREE,
  CONSTRAINT `fk_role_privilege_privilege` FOREIGN KEY (`privilege_id`) REFERENCES `t_security_privilege` (`privilege_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role_privilege_role` FOREIGN KEY (`role_id`) REFERENCES `t_security_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_role_privilege
-- ----------------------------
INSERT INTO `t_security_role_privilege` VALUES ('1', '1');
INSERT INTO `t_security_role_privilege` VALUES ('1', '2');
INSERT INTO `t_security_role_privilege` VALUES ('1', '3');
INSERT INTO `t_security_role_privilege` VALUES ('1', '4');
INSERT INTO `t_security_role_privilege` VALUES ('1', '5');
INSERT INTO `t_security_role_privilege` VALUES ('1', '6');
INSERT INTO `t_security_role_privilege` VALUES ('1', '7');
INSERT INTO `t_security_role_privilege` VALUES ('1', '8');
INSERT INTO `t_security_role_privilege` VALUES ('1', '9');
INSERT INTO `t_security_role_privilege` VALUES ('1', '10');
INSERT INTO `t_security_role_privilege` VALUES ('1', '11');
INSERT INTO `t_security_role_privilege` VALUES ('1', '12');
INSERT INTO `t_security_role_privilege` VALUES ('1', '13');
INSERT INTO `t_security_role_privilege` VALUES ('1', '14');
INSERT INTO `t_security_role_privilege` VALUES ('1', '15');
INSERT INTO `t_security_role_privilege` VALUES ('1', '16');
INSERT INTO `t_security_role_privilege` VALUES ('1', '17');
INSERT INTO `t_security_role_privilege` VALUES ('1', '18');
INSERT INTO `t_security_role_privilege` VALUES ('1', '19');
INSERT INTO `t_security_role_privilege` VALUES ('1', '20');
INSERT INTO `t_security_role_privilege` VALUES ('1', '381');
INSERT INTO `t_security_role_privilege` VALUES ('1', '382');
INSERT INTO `t_security_role_privilege` VALUES ('1', '383');
INSERT INTO `t_security_role_privilege` VALUES ('1', '384');
INSERT INTO `t_security_role_privilege` VALUES ('1', '385');
INSERT INTO `t_security_role_privilege` VALUES ('1', '386');
INSERT INTO `t_security_role_privilege` VALUES ('1', '387');
INSERT INTO `t_security_role_privilege` VALUES ('1', '388');
INSERT INTO `t_security_role_privilege` VALUES ('80', '388');
INSERT INTO `t_security_role_privilege` VALUES ('1', '389');
INSERT INTO `t_security_role_privilege` VALUES ('1', '390');
INSERT INTO `t_security_role_privilege` VALUES ('1', '393');
INSERT INTO `t_security_role_privilege` VALUES ('1', '394');
INSERT INTO `t_security_role_privilege` VALUES ('80', '395');

-- ----------------------------
-- Table structure for t_security_user
-- ----------------------------
DROP TABLE IF EXISTS `t_security_user`;
CREATE TABLE `t_security_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'normal' COMMENT '状态为“deleted”，“locked”，“expired”，"normal"等',
  `department_id` int(11) DEFAULT NULL,
  `user_name` varchar(30) NOT NULL DEFAULT '请修改显示名',
  PRIMARY KEY (`user_id`),
  KEY `ind_department_id` (`department_id`) USING BTREE,
  KEY `user_name` (`user_name`),
  KEY `login_name` (`login_name`),
  CONSTRAINT `fk_user_department` FOREIGN KEY (`department_id`) REFERENCES `t_security_department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of t_security_user
-- ----------------------------
INSERT INTO `t_security_user` VALUES ('1', 'hequn', '5b142fb2f33cbadcaafd97cb706fa2df', '正常态', '1', '贺群');
INSERT INTO `t_security_user` VALUES ('225', 'test', 'dafc94d4d74d1c574e376d3e81e06b9a', '正常态', '96', 'test');

-- ----------------------------
-- Table structure for t_security_usercategory
-- ----------------------------
DROP TABLE IF EXISTS `t_security_usercategory`;
CREATE TABLE `t_security_usercategory` (
  `usercategory_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `install_date` date DEFAULT NULL,
  `regulation` varchar(40) DEFAULT NULL COMMENT '规则匹配',
  `parent_id` int(11) DEFAULT NULL,
  `is_leaf` bit(1) DEFAULT b'1',
  PRIMARY KEY (`usercategory_id`),
  UNIQUE KEY `ind_name` (`name`) USING BTREE,
  KEY `ind_parent_id` (`parent_id`) USING BTREE,
  CONSTRAINT `fk_usercategory_usercategory` FOREIGN KEY (`parent_id`) REFERENCES `t_security_usercategory` (`usercategory_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_usercategory
-- ----------------------------

-- ----------------------------
-- Table structure for t_security_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_security_user_info`;
CREATE TABLE `t_security_user_info` (
  `user_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telephone` varchar(11) NOT NULL,
  `permit_num` varchar(15) NOT NULL,
  `birthday` date DEFAULT NULL,
  `hireday` date DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `sex` bit(1) DEFAULT NULL,
  `contact_num` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_info_id`),
  KEY `ind_user_id` (`user_id`) USING BTREE,
  KEY `permit_num` (`permit_num`),
  CONSTRAINT `fk_user_info_user` FOREIGN KEY (`user_id`) REFERENCES `t_security_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 COMMENT='用户信息表，用于记录额外信息';

-- ----------------------------
-- Records of t_security_user_info
-- ----------------------------
INSERT INTO `t_security_user_info` VALUES ('1', '1', 'hequn1987@126.com', '18001393913', '20121', '1987-12-18', '2013-11-27', 'admin', '', '010-6666666');
INSERT INTO `t_security_user_info` VALUES ('195', '225', '', '', '20122', null, null, 'prouser', '', '');

-- ----------------------------
-- Table structure for t_security_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_security_user_role`;
CREATE TABLE `t_security_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `ind_role_id` (`role_id`) USING BTREE,
  KEY `ind_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `fk_user_role_role` FOREIGN KEY (`role_id`) REFERENCES `t_security_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_user` FOREIGN KEY (`user_id`) REFERENCES `t_security_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_user_role
-- ----------------------------
INSERT INTO `t_security_user_role` VALUES ('1', '1');
INSERT INTO `t_security_user_role` VALUES ('225', '80');

-- ----------------------------
-- View structure for v_user_info
-- ----------------------------
DROP VIEW IF EXISTS `v_user_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER  VIEW `v_user_info` AS select `su`.`user_id` AS `user_id`,`su`.`login_name` AS `login_name`,`su`.`status` AS `status`,`sd`.`name` AS `department_name`,`su`.`user_name` AS `user_name`,`sui`.`permit_num` AS `permit_num`,`sd`.`department_id` AS `department_id`,`sui`.`type` AS `type` from ((`t_security_user` `su` join `t_security_user_info` `sui`) join `t_security_department` `sd`) where ((`su`.`user_id` = `sui`.`user_id`) and (`su`.`department_id` = `sd`.`department_id`)) ;
