/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : cola

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-07-01 14:43:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '客户名',
  `spell_code` varchar(200) DEFAULT NULL COMMENT '客户名拼音码',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `reviser` bigint(64) DEFAULT NULL COMMENT '修改人',
  `revise_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted` int(2) DEFAULT '0' COMMENT '是否删除：1=删除，0=未删除',
  `group_id` varchar(64) DEFAULT NULL COMMENT '所属机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('112', '测试客户', 'cskh', '', '1', '2022-07-01 13:23:23', '1', '2022-07-01 13:29:35', '0', '1');
INSERT INTO `customer` VALUES ('113', '测试供应商', 'csgys', 'test', '1', '2022-07-01 13:23:37', '1', '2022-07-01 13:30:12', '0', '1');

-- ----------------------------
-- Table structure for customer_category
-- ----------------------------
DROP TABLE IF EXISTS `customer_category`;
CREATE TABLE `customer_category` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(64) NOT NULL COMMENT '父节点',
  `name` varchar(100) NOT NULL COMMENT '分类名称',
  `code` varchar(100) NOT NULL COMMENT '编码',
  `creator` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `reviser` bigint(64) DEFAULT NULL COMMENT '修改人',
  `revise_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted` int(11) DEFAULT '0' COMMENT '是否删除',
  `group_id` varchar(64) DEFAULT NULL COMMENT '机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_category
-- ----------------------------
INSERT INTO `customer_category` VALUES ('1', '0', '销售客户', 'SALE', '1', '2022-06-28 15:23:26', '1', '2022-06-28 15:23:26', '0', '1');
INSERT INTO `customer_category` VALUES ('2', '1', 'aa', 'aaasdf', '1', '2022-07-01 09:52:10', '1', '2022-07-01 09:52:10', '1', '1');
INSERT INTO `customer_category` VALUES ('3', '0', '采购供应商', 'BUY', '1', '2022-06-30 15:58:17', '1', '2022-06-30 15:58:17', '1', '1');
INSERT INTO `customer_category` VALUES ('4', '0', '采购供应商', 'BUY', '1', '2022-07-01 09:52:28', '1', '2022-07-01 09:52:28', '0', '1');

-- ----------------------------
-- Table structure for customer_category_detail
-- ----------------------------
DROP TABLE IF EXISTS `customer_category_detail`;
CREATE TABLE `customer_category_detail` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(64) NOT NULL COMMENT '客户',
  `category_id` bigint(64) NOT NULL COMMENT '客户分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_category_detail
-- ----------------------------
INSERT INTO `customer_category_detail` VALUES ('9', '112', '1');
INSERT INTO `customer_category_detail` VALUES ('10', '113', '4');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '物资名',
  `code` varchar(100) DEFAULT NULL COMMENT '编码',
  `spell_code` varchar(100) DEFAULT NULL COMMENT '拼音码',
  `creator` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `reviser` bigint(64) DEFAULT NULL COMMENT '修改人',
  `revise_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted` int(2) DEFAULT '0' COMMENT '是否删除：0=未删除，1=已删除',
  `group_id` varchar(64) DEFAULT NULL COMMENT '机构',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('48', '测试物资', 'TESTGOODS', 'cswz', '1', '2022-07-01 13:33:09', '1', '2022-07-01 13:33:09', '0', '1', '');
INSERT INTO `goods` VALUES ('49', '测试的物资', 'TESTOFGOODS', 'csdwz', '1', '2022-07-01 13:33:42', '1', '2022-07-01 13:33:42', '0', '1', '');

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(64) NOT NULL COMMENT '父节点',
  `name` varchar(100) NOT NULL COMMENT '分类名称',
  `code` varchar(100) NOT NULL COMMENT '编码',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `reviser` varchar(255) DEFAULT NULL COMMENT '修改人',
  `revise_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  `group_id` varchar(64) DEFAULT NULL COMMENT '所属机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_category
-- ----------------------------
INSERT INTO `goods_category` VALUES ('1', '0', '销售物资', 'SALE', '1', '2022-06-24 14:13:58', '1', '2022-06-24 14:13:58', '0', '1');
INSERT INTO `goods_category` VALUES ('2', '1', '煤炭', 'MT', '1', '2022-06-24 14:19:14', '1', '2022-07-01 09:59:18', '0', '1');
INSERT INTO `goods_category` VALUES ('3', '0', '采购物资', 'BUY', '1', '2022-06-24 14:20:53', '1', '2022-06-24 14:29:43', '0', '1');
INSERT INTO `goods_category` VALUES ('13', '1', '化工', 'HG', '1', '2022-07-01 09:59:32', '1', '2022-07-01 09:59:32', '0', '1');

-- ----------------------------
-- Table structure for goods_category_detail
-- ----------------------------
DROP TABLE IF EXISTS `goods_category_detail`;
CREATE TABLE `goods_category_detail` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(64) NOT NULL COMMENT '物资分类id',
  `goods_id` bigint(64) NOT NULL COMMENT '物资id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_category_detail
-- ----------------------------
INSERT INTO `goods_category_detail` VALUES ('43', '2', '48');
INSERT INTO `goods_category_detail` VALUES ('44', '3', '49');

-- ----------------------------
-- Table structure for goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `goods_spec`;
CREATE TABLE `goods_spec` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(64) DEFAULT NULL COMMENT '物资id',
  `name` varchar(100) NOT NULL COMMENT '规格名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `reviser` bigint(64) DEFAULT NULL COMMENT '修改人',
  `revise_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted` int(2) DEFAULT '0' COMMENT '是否删除：0=未删除，1=已删除',
  `group_id` varchar(64) DEFAULT NULL COMMENT '机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_spec
-- ----------------------------
INSERT INTO `goods_spec` VALUES ('1', null, '包', '', '1', '2022-06-22 10:27:14', '1', '2022-06-22 10:27:14', '1', '1');
INSERT INTO `goods_spec` VALUES ('2', null, '袋', '', '1', '2022-06-22 16:10:42', '1', '2022-06-22 16:10:42', '1', '1');
INSERT INTO `goods_spec` VALUES ('3', '6', '25KG/袋', '', '1', '2022-07-01 13:31:37', '1', '2022-07-01 13:31:37', '1', '1');
INSERT INTO `goods_spec` VALUES ('4', '6', 'aa', '', '1', '2022-06-24 12:31:13', '1', '2022-06-24 12:31:13', '1', '1');
INSERT INTO `goods_spec` VALUES ('5', '6', 'bb', '', '1', '2022-06-24 12:31:09', '1', '2022-06-24 12:31:09', '1', '1');
INSERT INTO `goods_spec` VALUES ('6', '6', 'bv', '', '1', '2022-06-24 12:31:11', '1', '2022-06-24 12:31:11', '1', '1');
INSERT INTO `goods_spec` VALUES ('7', '6', '100KG/袋12', '', '1', '2022-07-01 13:31:40', '1', '2022-07-01 13:31:40', '1', '1');
INSERT INTO `goods_spec` VALUES ('8', '29', 'ttt4', '', '1', '2022-06-30 15:58:53', '1', '2022-06-30 15:58:53', '1', '1');
INSERT INTO `goods_spec` VALUES ('9', '48', '100KG/袋', '', '1', '2022-07-01 13:34:14', '1', '2022-07-01 13:34:14', '0', '1');
INSERT INTO `goods_spec` VALUES ('10', '49', '50KG/桶', '', '1', '2022-07-01 13:34:34', '1', '2022-07-01 13:34:34', '0', '1');

-- ----------------------------
-- Table structure for system_data_log
-- ----------------------------
DROP TABLE IF EXISTS `system_data_log`;
CREATE TABLE `system_data_log` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `creator` bigint(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `reviser` bigint(64) DEFAULT NULL,
  `revise_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(2) DEFAULT '0' COMMENT '是否删除',
  `group_id` varchar(64) DEFAULT NULL COMMENT '机构',
  `table_name` varchar(100) DEFAULT NULL COMMENT '表名',
  `operation` varchar(10) DEFAULT NULL COMMENT '操作：更新，删除',
  `before_data` varchar(2000) DEFAULT NULL COMMENT '操作之前的数据',
  `after_data` varchar(2000) DEFAULT NULL COMMENT '操作之后的数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_data_log
-- ----------------------------
INSERT INTO `system_data_log` VALUES ('20', '1', '2022-07-01 13:25:13', '1', '2022-07-01 13:25:13', '0', '1', '客户管理', '更新', '{\"categoryName\":\"采购供应商\",\"createTime\":1656653017000,\"creator\":1,\"deleted\":0,\"groupId\":\"1\",\"id\":113,\"name\":\"测试供应商\",\"remark\":\"\",\"reviseTime\":1656653017000,\"reviser\":1,\"spellCode\":\"csgys\"}', '{\"categoryId\":\"4\",\"categoryName\":\"采购供应商\",\"createTime\":1656653017000,\"creator\":1,\"deleted\":0,\"groupId\":\"1\",\"id\":113,\"name\":\"测试供应商\",\"remark\":\"\",\"reviseTime\":1656653113271,\"reviser\":1,\"spellCode\":\"csgys\"}');
INSERT INTO `system_data_log` VALUES ('21', '1', '2022-07-01 13:29:31', '1', '2022-07-01 13:29:31', '0', '1', '客户管理', '更新', '{\"categoryName\":\"采购供应商\",\"createTime\":1656653017000,\"creator\":1,\"deleted\":0,\"groupId\":\"1\",\"id\":113,\"name\":\"测试供应商\",\"remark\":\"\",\"reviseTime\":1656653113000,\"reviser\":1,\"spellCode\":\"csgys\"}', '{\"categoryId\":\"4\",\"categoryName\":\"采购供应商\",\"createTime\":1656653017000,\"creator\":1,\"deleted\":0,\"groupId\":\"1\",\"id\":113,\"name\":\"测试供应商\",\"remark\":\"\",\"reviseTime\":1656653371415,\"reviser\":1,\"spellCode\":\"csgys\"}');
INSERT INTO `system_data_log` VALUES ('22', '1', '2022-07-01 13:29:35', '1', '2022-07-01 13:29:35', '0', '1', '客户管理', '更新', '{\"categoryName\":\"销售客户\",\"createTime\":1656653003000,\"creator\":1,\"deleted\":0,\"groupId\":\"1\",\"id\":112,\"name\":\"测试客户\",\"remark\":\"\",\"reviseTime\":1656653003000,\"reviser\":1,\"spellCode\":\"cskh\"}', '{\"categoryId\":\"1\",\"categoryName\":\"销售客户\",\"createTime\":1656653003000,\"creator\":1,\"deleted\":0,\"groupId\":\"1\",\"id\":112,\"name\":\"测试客户\",\"remark\":\"\",\"reviseTime\":1656653374599,\"reviser\":1,\"spellCode\":\"cskh\"}');
INSERT INTO `system_data_log` VALUES ('23', '1', '2022-07-01 13:30:12', '1', '2022-07-01 13:30:12', '0', '1', '客户管理', '更新', '{\"categoryName\":\"采购供应商\",\"createTime\":1656653017000,\"creator\":1,\"deleted\":0,\"groupId\":\"1\",\"id\":113,\"name\":\"测试供应商\",\"remark\":\"\",\"reviseTime\":1656653371000,\"reviser\":1,\"spellCode\":\"csgys\"}', '{\"categoryId\":\"4\",\"categoryName\":\"采购供应商\",\"createTime\":1656653017000,\"creator\":1,\"deleted\":0,\"groupId\":\"1\",\"id\":113,\"name\":\"测试供应商\",\"remark\":\"test\",\"reviseTime\":1656653411987,\"reviser\":1,\"spellCode\":\"csgys\"}');

-- ----------------------------
-- Table structure for system_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `system_data_scope`;
CREATE TABLE `system_data_scope` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(64) NOT NULL COMMENT '关联的菜单',
  `name` varchar(20) NOT NULL COMMENT '数据权限名',
  `method` varchar(400) NOT NULL COMMENT '拦截的方法',
  `scope_type` int(11) NOT NULL DEFAULT '0' COMMENT '数据权限类型：0=全部数据,1=本机构数据,2=本机构及下级机构,3=本人数据4,自定义',
  `scope_sql` varchar(400) DEFAULT NULL COMMENT '自定义SQL',
  `creator` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `reviser` bigint(64) DEFAULT NULL COMMENT '修改人',
  `revise_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted` int(11) DEFAULT NULL COMMENT '是否删除',
  `group_id` varchar(64) NOT NULL COMMENT '机构',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `role_ids` varchar(1000) DEFAULT NULL COMMENT '关联的角色',
  `no_use` int(2) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `globalized` int(11) DEFAULT '0' COMMENT '全局生效：1=是，0=否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_data_scope
-- ----------------------------
INSERT INTO `system_data_scope` VALUES ('16', '41', '角色树', 'com.matrix.cola.service.system.role.mapper.RoleMapper.selectList', '2', '', '1', '2022-06-16 16:48:25', '1', '2022-06-21 17:09:38', '0', '1', '', '', '0', '1');

-- ----------------------------
-- Table structure for system_dict
-- ----------------------------
DROP TABLE IF EXISTS `system_dict`;
CREATE TABLE `system_dict` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(64) NOT NULL COMMENT '父id',
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `code` varchar(100) NOT NULL COMMENT '字典编码',
  `dic_value` varchar(100) NOT NULL COMMENT '字典值',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `reviser` varchar(255) DEFAULT NULL COMMENT '修改人',
  `revise_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted` int(2) DEFAULT '0' COMMENT '是否删除：0=未删除，1=已删除',
  `group_id` varchar(64) DEFAULT NULL COMMENT '机构',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_DICT` (`code`,`dic_value`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_dict
-- ----------------------------
INSERT INTO `system_dict` VALUES ('4', '0', '姓别', 'sex', '-1', null, '2022-05-25 17:13:16', null, '2022-05-25 17:13:16', '0', null);
INSERT INTO `system_dict` VALUES ('5', '4', '女', 'sex', '0', null, '2022-05-25 17:13:16', null, '2022-05-25 17:13:16', '0', null);
INSERT INTO `system_dict` VALUES ('6', '4', '男', 'sex', '1', null, '2022-05-25 17:13:16', null, '2022-05-25 17:13:16', '0', null);
INSERT INTO `system_dict` VALUES ('13', '0', '是否删除', 'deleted', '-1', '1', '2022-05-25 16:58:32', '1', '2022-05-25 16:58:32', '0', '1');
INSERT INTO `system_dict` VALUES ('22', '13', '已删除', 'deleted', '1', '1', '2022-05-25 16:58:32', '1', '2022-05-25 16:58:32', '0', '1');
INSERT INTO `system_dict` VALUES ('23', '13', '未删除', 'deleted', '0', '1', '2022-05-25 16:58:32', '1', '2022-05-25 16:58:32', '0', '1');
INSERT INTO `system_dict` VALUES ('25', '0', '是否', 'whether', '-1', '1', '2022-05-25 16:59:41', '1', '2022-05-25 16:59:41', '0', '1');
INSERT INTO `system_dict` VALUES ('26', '25', '否', 'whether', '0', '1', '2022-05-25 16:59:51', '1', '2022-05-25 16:59:51', '0', '1');
INSERT INTO `system_dict` VALUES ('27', '25', '是', 'whether', '1', '1', '2022-05-25 16:59:58', '1', '2022-05-25 16:59:58', '0', '1');
INSERT INTO `system_dict` VALUES ('28', '0', '菜单类型', 'menuType', '-1', '1', '2022-05-27 11:07:15', '1', '2022-05-27 11:07:15', '0', '1');
INSERT INTO `system_dict` VALUES ('29', '28', '菜单', 'menuType', '0', '1', '2022-06-21 16:27:36', '1', '2022-06-21 16:27:36', '0', '1');
INSERT INTO `system_dict` VALUES ('30', '28', '按钮', 'menuType', '1', '1', '2022-06-21 16:27:36', '1', '2022-06-21 16:27:36', '0', '1');
INSERT INTO `system_dict` VALUES ('31', '0', '打开类型', 'openType', '-1', '1', '2022-05-27 11:07:46', '1', '2022-05-27 11:07:46', '0', '1');
INSERT INTO `system_dict` VALUES ('32', '31', '内置', 'openType', '0', '1', '2022-06-21 16:27:41', '1', '2022-06-21 16:27:41', '0', '1');
INSERT INTO `system_dict` VALUES ('33', '31', '外键', 'openType', '1', '1', '2022-06-21 16:27:41', '1', '2022-06-21 16:27:41', '0', '1');
INSERT INTO `system_dict` VALUES ('34', '0', '数据权限类型', 'scopeType', '-1', '1', '2022-06-06 12:35:43', '1', '2022-06-06 12:35:43', '0', '1');
INSERT INTO `system_dict` VALUES ('35', '34', '全部数据', 'scopeType', '0', '1', '2022-06-21 16:27:46', '1', '2022-06-21 16:27:46', '0', '1');
INSERT INTO `system_dict` VALUES ('36', '34', '本机构', 'scopeType', '1', '1', '2022-06-21 16:27:46', '1', '2022-06-21 16:27:46', '0', '1');
INSERT INTO `system_dict` VALUES ('37', '34', '本机构及下级机构', 'scopeType', '2', '1', '2022-06-21 16:27:46', '1', '2022-06-21 16:27:46', '0', '1');
INSERT INTO `system_dict` VALUES ('38', '34', '本人数据', 'scopeType', '3', '1', '2022-06-21 16:27:46', '1', '2022-06-21 16:27:46', '0', '1');
INSERT INTO `system_dict` VALUES ('39', '34', '自定义', 'scopeType', '4', '1', '2022-06-21 16:27:46', '1', '2022-06-21 16:27:46', '0', '1');
INSERT INTO `system_dict` VALUES ('40', '0', '通知类型', 'noticeType', '-1', '1', '2022-06-29 12:32:59', '1', '2022-06-29 12:32:59', '0', '1');
INSERT INTO `system_dict` VALUES ('41', '40', '通知', 'noticeType', '0', '1', '2022-06-29 12:33:11', '1', '2022-06-29 12:33:11', '0', '1');
INSERT INTO `system_dict` VALUES ('42', '40', '公告', 'noticeType', '1', '1', '2022-06-29 12:33:20', '1', '2022-06-29 12:33:20', '0', '1');
INSERT INTO `system_dict` VALUES ('43', '0', '是否关闭', 'state', '-1', '1', '2022-06-29 12:33:45', '1', '2022-06-29 12:33:45', '0', '1');
INSERT INTO `system_dict` VALUES ('44', '43', '关闭', 'state', '0', '1', '2022-06-29 12:34:00', '1', '2022-06-29 12:34:00', '0', '1');
INSERT INTO `system_dict` VALUES ('45', '43', '正常', 'state', '1', '1', '2022-06-29 12:34:11', '1', '2022-06-29 12:34:11', '0', '1');
INSERT INTO `system_dict` VALUES ('48', '0', '组织机构类型', 'groupType', '-1', null, '2022-06-30 17:14:06', null, '2022-06-30 17:14:06', '0', null);
INSERT INTO `system_dict` VALUES ('49', '48', '集团公司', 'groupType', '0', null, null, null, null, '0', null);
INSERT INTO `system_dict` VALUES ('50', '48', '分公司', 'groupType', '1', null, null, null, null, '0', null);
INSERT INTO `system_dict` VALUES ('51', '48', '部门', 'groupType', '2', null, null, null, null, '0', null);

-- ----------------------------
-- Table structure for system_error_log
-- ----------------------------
DROP TABLE IF EXISTS `system_error_log`;
CREATE TABLE `system_error_log` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  `token` varchar(400) DEFAULT NULL COMMENT '用户token',
  `method` varchar(20) DEFAULT NULL COMMENT '提交方法',
  `param` varchar(1000) DEFAULT NULL COMMENT '参数',
  `url` varchar(200) DEFAULT NULL COMMENT '请求地址',
  `title` varchar(1000) DEFAULT NULL COMMENT '错误标题',
  `message` varchar(8000) DEFAULT NULL COMMENT '错误详细信息',
  `creator` bigint(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `reviser` bigint(64) DEFAULT NULL,
  `revise_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(2) DEFAULT NULL,
  `group_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_error_log
-- ----------------------------
INSERT INTO `system_error_log` VALUES ('381', '127.0.0.1', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYmYiOjE2NTY2NDk0Nzk2MzksImxvZ2luTmFtZSI6ImFkbWluIiwiZ3JvdXBJZCI6IjEiLCJuYW1lIjoi6LaF57qn566h55CG5ZGYIiwiaWQiOiIxIiwiZXhwIjoxNjU2NjYwMjc5NjM5LCJpYXQiOjE2NTY2NDk0Nzk2Mzl9.AmgbY9PMNXZnWQHvkpsQCjSNwj_vWVtPhT1dRTkIPd8', 'POST', '{\"code\":\"TESTGOODS\",\"remark\":\"\",\"name\":\"测试物资\",\"categoryId\":\"2\"}', '/basics/goods/addGoods', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\r\n### The error may exist in com/matrix/cola/service/basics/goods/goods/mapper/GoodsMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  id,name,code,spell_code,remark,creator,create_time,reviser,revise_time,deleted,group_id  FROM goods   WHERE  deleted=0  AND (name = ?)\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\r\norg.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\r\n### The error m', 'java.lang.RuntimeException: org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\r\n### The error may exist in com/matrix/cola/service/basics/goods/goods/mapper/GoodsMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  id,name,code,spell_code,remark,creator,create_time,reviser,revise_time,deleted,group_id  FROM goods   WHERE  deleted=0  AND (name = ?)\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\r\norg.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\r\n### The error may exist in com/matrix/cola/service/basics/goods/goods/mapper/GoodsMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  id,name,code,spell_code,remark,creator,create_time,reviser,revise_time,deleted,group_id  FROM goods   WHERE  deleted=0  AND (name = ?)\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\r\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:239)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:441)\r\n	at com.sun.proxy.$Proxy86.selectList(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.selectList(SqlSessionTemplate.java:224)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.executeForMany(MybatisMapperMethod.java:166)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:77)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy$PlainMethodInvoker.invoke(MybatisMapperProxy.java:148)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\r\n	at com.sun.proxy.$Proxy126.selectList(Unknown Source)\r\n	at com.matrix.cola.service.common.service.AbstractEntityService.getList(AbstractEntityService.java:77)\r\n	at com.matrix.cola.service.common.service.AbstractEntityService.getOne(AbstractEntityService.java:45)\r\n	at com.matrix.cola.service.basics.goods.goods.service.impl.GoodsServiceImpl.validate(GoodsServiceImpl.java:102)\r\n	at com.matrix.cola.service.basics.goods.goods.service.impl.GoodsServiceImpl.validate(GoodsServiceImpl.java:36)\r\n	at com.matrix.cola.service.common.service.AbstractEntityService.insert(AbstractEntityService.java:163)\r\n	at com.matrix.cola.service.common.service.AbstractColaEntityService.insert(AbstractColaEntityService.java:71)\r\n	at com.matrix.cola.service.common.service.AbstractColaEntityService.insert(AbstractColaEntityService.java:25)\r\n	at com.matrix.cola.service.common.service.AbstractColaEntityService$$FastClassBySpringCGLIB$$d16fe3f9.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:698)\r\n	at com.matrix.cola.service.basics.goods.goods.service.impl.GoodsServiceImpl$$EnhancerBySpringCGLIB$$67da2f94.insert(<generated>)\r\n	at com.matrix.cola.api.service.basics.goods.goods.GoodsServiceDubboWrap1.invokeMethod(GoodsServiceDubboWrap1.java)\r\n	at org.apache.dubbo.rpc.proxy.javassist.JavassistProxyFactory$1.doInvoke(JavassistProxyFactory.java:71)\r\n	at org.apache.dubbo.rpc.proxy.AbstractProxyInvoker.invoke(AbstractProxyInvoker.java:99)\r\n	at org.apache.dubbo.config.invoker.DelegateProviderMetaDataInvoker.invoke(DelegateProviderMetaDataInvoker.java:55)\r\n	at org.apache.dubbo.rpc.protocol.InvokerWrapper.invoke(InvokerWrapper.java:56)\r\n	at org.apache.dubbo.rpc.filter.ClassLoaderCallbackFilter.invoke(ClassLoaderCallbackFilter.java:38)\r\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:321)\r\n	at org.apache.dubbo.rpc.protocol.dubbo.filter.TraceFilter.invoke(TraceFilter.java:78)\r\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:321)\r\n	at org.apache.dubbo.rpc.filter.TimeoutFilter.invoke(TimeoutFilter.java:46)\r\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:321)\r\n	at com.matrix.cola.service.common.filter.ServiceProviderDubboFilter.invoke(ServiceProviderDubboFilter.java:38)\r\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:321)\r\n	at org.apache.dubbo.monitor.support.MonitorFilter.invoke(MonitorFilter.java:99)\r\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:321)\r\n	at org.apache.dubbo.rpc.filter.ExceptionFilter.invoke(ExceptionFilter.java:52)\r\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:321)\r\n	at org.apache.dubbo.auth.filter.ProviderAuthFilter.invoke(ProviderAuthFilter.java:53)\r\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:321)\r\n	at org.apache.dubbo.rpc.filter.ContextFilter.invoke(ContextFilter.java:131)\r\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:321)\r\n	at org.apache.dubbo.rpc.filter.GenericFilter.invoke(GenericFilter.java:198)\r\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:321)\r\n	at org.apache.dubbo.rpc.filter.ClassLoaderFilter.invoke(ClassLoaderFilter.java:54)\r\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:321)\r\n	at org.apache.dubbo.rpc.filter.EchoFilter.invoke(EchoFilter.java:41)\r\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:321)\r\n	at org.apache.dubbo.rpc.filter.ProfilerServerFilter.invoke(ProfilerServerFilter.java:58)\r\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:321)\r\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CallbackRegistrationInvoker.invoke(FilterChainBuilder.java:193)\r\n	at org.apache.dubbo.rpc.protocol.dubbo.DubboProtocol$1.', '1', '2022-07-01 13:32:16', '1', '2022-07-01 13:32:16', '0', '1');

-- ----------------------------
-- Table structure for system_group
-- ----------------------------
DROP TABLE IF EXISTS `system_group`;
CREATE TABLE `system_group` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(64) NOT NULL COMMENT '父机构',
  `name` varchar(100) NOT NULL COMMENT '机构名称',
  `short_name` varchar(100) NOT NULL COMMENT '简称',
  `group_type` int(2) NOT NULL COMMENT '机构类型：0=集团公司，1=分公司，2=部门，3=岗位',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `area` varchar(20) DEFAULT NULL COMMENT '区',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ancestors` varchar(1000) DEFAULT NULL COMMENT '祖集列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_group
-- ----------------------------
INSERT INTO `system_group` VALUES ('1', '0', '集团公司', '集团公司', '0', null, '山东省', '济南市', '历下区', '', '1,38,39');
INSERT INTO `system_group` VALUES ('38', '1', '分公司1', '分公司1', '1', '', '河北省', '秦皇岛市', '北戴河区', '', '38');
INSERT INTO `system_group` VALUES ('39', '1', '分公司2', '分公司2', '1', 'test', '山西省', '长治市', '屯留区', '', '39');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '菜单名称',
  `code` varchar(100) NOT NULL COMMENT '菜单编码',
  `parent_id` bigint(64) NOT NULL COMMENT '父菜单',
  `url` varchar(200) NOT NULL COMMENT '菜单url',
  `component` varchar(100) DEFAULT NULL COMMENT '组件',
  `menu_type` int(2) DEFAULT '0' COMMENT '菜单类型：0=菜单，1=按钮',
  `open_type` int(2) DEFAULT '0' COMMENT '打开方式：0=页面内，1=新窗口',
  `auth` varchar(40) DEFAULT NULL COMMENT '权限编码',
  `icon` varchar(64) DEFAULT NULL COMMENT '图标',
  `hidden` int(2) DEFAULT '0' COMMENT '不可见：0=可见，1=不可见',
  `orders` int(2) DEFAULT '0' COMMENT '菜单顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('1', '基础信息管理', 'basics', '0', '/basics', 'Layout', '0', '0', null, 'el-icon-refrigerator', '0', '1');
INSERT INTO `system_menu` VALUES ('2', '系统后台管理', 'system', '0', '/system', 'Layout', '0', '0', null, 'el-icon-setting', '0', '100');
INSERT INTO `system_menu` VALUES ('3', '客户及供应商', 'basicsCustomer', '1', '/basics/customer', 'SubLayout', '0', '0', null, 'el-icon-suitcase-1', '0', '1');
INSERT INTO `system_menu` VALUES ('4', '物资相关', 'basicsGoods', '1', '/basics/goods', 'SubLayout', '0', '0', null, 'el-icon-box', '0', '2');
INSERT INTO `system_menu` VALUES ('5', '用户管理', 'systemUser', '2', '/system/user', 'system_user', '0', '0', null, 'peoples', '0', '9');
INSERT INTO `system_menu` VALUES ('7', '菜单管理', 'systemMenu', '2', '/system/menu', 'system_menu', '0', '0', null, 'el-icon-menu', '0', '8');
INSERT INTO `system_menu` VALUES ('8', '字典管理', 'systemDict', '2', '/system/dict', 'system_dict', '0', '0', null, 'user', '0', '7');
INSERT INTO `system_menu` VALUES ('14', '机构管理', 'systemGroup', '2', '/system/group', 'system_group', '0', '0', null, 'tree', '0', '10');
INSERT INTO `system_menu` VALUES ('36', '系统运维管理', 'operation', '0', '/operation', 'Layout', '0', '0', null, 'el-icon-suitcase-1', '0', '99');
INSERT INTO `system_menu` VALUES ('37', '服务监控', 'operationMonitor', '36', '/operation/monitor', 'operation_monitor', '0', '0', null, 'el-icon-s-opportunity', '0', '10');
INSERT INTO `system_menu` VALUES ('38', '错误日志', 'operationErrorLog', '36', '/operation/errorLog', 'operation_errorLog', '0', '0', null, 'bug', '0', '0');
INSERT INTO `system_menu` VALUES ('39', '系统权限管理', 'permission', '0', '/permission', 'Layout', '0', '0', null, 'el-icon-lock', '0', '98');
INSERT INTO `system_menu` VALUES ('40', '数据权限', 'permissionDataScope', '39', '/permission/dataScope', 'permission_dataScope', '0', '0', null, 'el-icon-aim', '0', '1');
INSERT INTO `system_menu` VALUES ('41', '角色管理', 'permissionRole', '39', '/permission/role', 'permission_role', '0', '0', null, 'peoples', '0', '0');
INSERT INTO `system_menu` VALUES ('47', '物资管理', 'basicsGoodsIndex', '4', '/basics/goods/index', 'basics_goods_index', '0', '0', null, 'el-icon-s-goods', '0', '1');
INSERT INTO `system_menu` VALUES ('48', '物资规格', 'basicsGoodsSpec', '4', '/basics/goods/spec', 'basics_goods_spec', '0', '0', null, 'el-icon-s-open', '0', '3');
INSERT INTO `system_menu` VALUES ('49', '物资分类', 'basicsGoodsCategory', '4', '/basics/goods/category', 'basics_goods_category', '0', '0', null, 'list', '0', '2');
INSERT INTO `system_menu` VALUES ('51', '客户及供应商管理', 'customer', '3', '/basics/customer/index', 'basics_customer_index', '0', '0', null, 'el-icon-goblet-square', '0', '0');
INSERT INTO `system_menu` VALUES ('52', '客户分类', 'customerCategory', '3', '/basics/customer/category', 'basics_customer_category', '0', '0', null, 'el-icon-attract', '0', '0');
INSERT INTO `system_menu` VALUES ('53', '通知公告', 'systemNotice', '2', '/system/notice', 'system_notice', '0', '0', null, 'el-icon-chat-line-round', '0', '1');
INSERT INTO `system_menu` VALUES ('55', '系统日志', 'operationDataLog', '36', '/operation/dataLog', 'operation_dataLog', '0', '0', null, 'el-icon-brush', '0', '0');

-- ----------------------------
-- Table structure for system_notice
-- ----------------------------
DROP TABLE IF EXISTS `system_notice`;
CREATE TABLE `system_notice` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL COMMENT '标题',
  `notice_type` int(2) NOT NULL COMMENT '通知类型：0=通知，1=公告',
  `state` int(2) DEFAULT '1' COMMENT '状态：0=关闭，1=正常',
  `notice_date` varchar(20) NOT NULL COMMENT '公告日期',
  `content` mediumtext,
  `creator` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `reviser` bigint(64) DEFAULT NULL COMMENT '修改人',
  `revise_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '是否删除',
  `group_id` varchar(64) DEFAULT NULL COMMENT '机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_notice
-- ----------------------------
INSERT INTO `system_notice` VALUES ('4', 'asdfd', '0', '1', '2022-06-16', 'asdfas', '1', '2022-06-29 15:07:51', '1', '2022-06-29 15:07:51', '1', '1');
INSERT INTO `system_notice` VALUES ('5', '这是一个通知', '1', '1', '2022-06-08', '<p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAD2CAYAAADlEnrIAAAACXBIWXMAAAsTAAALEwEAmpwYAAAKTWlDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAHjanVN3WJP3Fj7f92UPVkLY8LGXbIEAIiOsCMgQWaIQkgBhhBASQMWFiApWFBURnEhVxILVCkidiOKgKLhnQYqIWotVXDjuH9yntX167+3t+9f7vOec5/zOec8PgBESJpHmomoAOVKFPDrYH49PSMTJvYACFUjgBCAQ5svCZwXFAADwA3l4fnSwP/wBr28AAgBw1S4kEsfh/4O6UCZXACCRAOAiEucLAZBSAMguVMgUAMgYALBTs2QKAJQAAGx5fEIiAKoNAOz0ST4FANipk9wXANiiHKkIAI0BAJkoRyQCQLsAYFWBUiwCwMIAoKxAIi4EwK4BgFm2MkcCgL0FAHaOWJAPQGAAgJlCLMwAIDgCAEMeE80DIEwDoDDSv+CpX3CFuEgBAMDLlc2XS9IzFLiV0Bp38vDg4iHiwmyxQmEXKRBmCeQinJebIxNI5wNMzgwAABr50cH+OD+Q5+bk4eZm52zv9MWi/mvwbyI+IfHf/ryMAgQAEE7P79pf5eXWA3DHAbB1v2upWwDaVgBo3/ldM9sJoFoK0Hr5i3k4/EAenqFQyDwdHAoLC+0lYqG9MOOLPv8z4W/gi372/EAe/tt68ABxmkCZrcCjg/1xYW52rlKO58sEQjFu9+cj/seFf/2OKdHiNLFcLBWK8ViJuFAiTcd5uVKRRCHJleIS6X8y8R+W/QmTdw0ArIZPwE62B7XLbMB+7gECiw5Y0nYAQH7zLYwaC5EAEGc0Mnn3AACTv/mPQCsBAM2XpOMAALzoGFyolBdMxggAAESggSqwQQcMwRSswA6cwR28wBcCYQZEQAwkwDwQQgbkgBwKoRiWQRlUwDrYBLWwAxqgEZrhELTBMTgN5+ASXIHrcBcGYBiewhi8hgkEQcgIE2EhOogRYo7YIs4IF5mOBCJhSDSSgKQg6YgUUSLFyHKkAqlCapFdSCPyLXIUOY1cQPqQ28ggMor8irxHMZSBslED1AJ1QLmoHxqKxqBz0XQ0D12AlqJr0Rq0Hj2AtqKn0UvodXQAfYqOY4DRMQ5mjNlhXIyHRWCJWBomxxZj5Vg1Vo81Yx1YN3YVG8CeYe8IJAKLgBPsCF6EEMJsgpCQR1hMWEOoJewjtBK6CFcJg4Qxwicik6hPtCV6EvnEeGI6sZBYRqwm7iEeIZ4lXicOE1+TSCQOyZLkTgohJZAySQtJa0jbSC2kU6Q+0hBpnEwm65Btyd7kCLKArCCXkbeQD5BPkvvJw+S3FDrFiOJMCaIkUqSUEko1ZT/lBKWfMkKZoKpRzame1AiqiDqfWkltoHZQL1OHqRM0dZolzZsWQ8ukLaPV0JppZ2n3aC/pdLoJ3YMeRZfQl9Jr6Afp5+mD9HcMDYYNg8dIYigZaxl7GacYtxkvmUymBdOXmchUMNcyG5lnmA+Yb1VYKvYqfBWRyhKVOpVWlX6V56pUVXNVP9V5qgtUq1UPq15WfaZGVbNQ46kJ1Bar1akdVbupNq7OUndSj1DPUV+jvl/9gvpjDbKGhUaghkijVGO3xhmNIRbGMmXxWELWclYD6yxrmE1iW7L57Ex2Bfsbdi97TFNDc6pmrGaRZp3mcc0BDsax4PA52ZxKziHODc57LQMtPy2x1mqtZq1+rTfaetq+2mLtcu0W7eva73VwnUCdLJ31Om0693UJuja6UbqFutt1z+o+02PreekJ9cr1Dund0Uf1bfSj9Rfq79bv0R83MDQINpAZbDE4Y/DMkGPoa5hpuNHwhOGoEctoupHEaKPRSaMnuCbuh2fjNXgXPmasbxxirDTeZdxrPGFiaTLbpMSkxeS+Kc2Ua5pmutG003TMzMgs3KzYrMnsjjnVnGueYb7ZvNv8jYWlRZzFSos2i8eW2pZ8ywWWTZb3rJhWPlZ5VvVW16xJ1lzrLOtt1ldsUBtXmwybOpvLtqitm63Edptt3xTiFI8p0in1U27aMez87ArsmuwG7Tn2YfYl9m32zx3MHBId1jt0O3xydHXMdmxwvOuk4TTDqcSpw+lXZxtnoXOd8zUXpkuQyxKXdpcXU22niqdun3rLleUa7rrStdP1o5u7m9yt2W3U3cw9xX2r+00umxvJXcM970H08PdY4nHM452nm6fC85DnL152Xlle+70eT7OcJp7WMG3I28Rb4L3Le2A6Pj1l+s7pAz7GPgKfep+Hvqa+It89viN+1n6Zfgf8nvs7+sv9j/i/4XnyFvFOBWABwQHlAb2BGoGzA2sDHwSZBKUHNQWNBbsGLww+FUIMCQ1ZH3KTb8AX8hv5YzPcZyya0RXKCJ0VWhv6MMwmTB7WEY6GzwjfEH5vpvlM6cy2CIjgR2yIuB9pGZkX+X0UKSoyqi7qUbRTdHF09yzWrORZ+2e9jvGPqYy5O9tqtnJ2Z6xqbFJsY+ybuIC4qriBeIf4RfGXEnQTJAntieTE2MQ9ieNzAudsmjOc5JpUlnRjruXcorkX5unOy553PFk1WZB8OIWYEpeyP+WDIEJQLxhP5aduTR0T8oSbhU9FvqKNolGxt7hKPJLmnVaV9jjdO31D+miGT0Z1xjMJT1IreZEZkrkj801WRNberM/ZcdktOZSclJyjUg1plrQr1zC3KLdPZisrkw3keeZtyhuTh8r35CP5c/PbFWyFTNGjtFKuUA4WTC+oK3hbGFt4uEi9SFrUM99m/ur5IwuCFny9kLBQuLCz2Lh4WfHgIr9FuxYji1MXdy4xXVK6ZHhp8NJ9y2jLspb9UOJYUlXyannc8o5Sg9KlpUMrglc0lamUycturvRauWMVYZVkVe9ql9VbVn8qF5VfrHCsqK74sEa45uJXTl/VfPV5bdra3kq3yu3rSOuk626s91m/r0q9akHV0IbwDa0b8Y3lG19tSt50oXpq9Y7NtM3KzQM1YTXtW8y2rNvyoTaj9nqdf13LVv2tq7e+2Sba1r/dd3vzDoMdFTve75TsvLUreFdrvUV99W7S7oLdjxpiG7q/5n7duEd3T8Wej3ulewf2Re/ranRvbNyvv7+yCW1SNo0eSDpw5ZuAb9qb7Zp3tXBaKg7CQeXBJ9+mfHvjUOihzsPcw83fmX+39QjrSHkr0jq/dawto22gPaG97+iMo50dXh1Hvrf/fu8x42N1xzWPV56gnSg98fnkgpPjp2Snnp1OPz3Umdx590z8mWtdUV29Z0PPnj8XdO5Mt1/3yfPe549d8Lxw9CL3Ytslt0utPa49R35w/eFIr1tv62X3y+1XPK509E3rO9Hv03/6asDVc9f41y5dn3m978bsG7duJt0cuCW69fh29u0XdwruTNxdeo94r/y+2v3qB/oP6n+0/rFlwG3g+GDAYM/DWQ/vDgmHnv6U/9OH4dJHzEfVI0YjjY+dHx8bDRq98mTOk+GnsqcTz8p+Vv9563Or59/94vtLz1j82PAL+YvPv655qfNy76uprzrHI8cfvM55PfGm/K3O233vuO+638e9H5ko/ED+UPPR+mPHp9BP9z7nfP78L/eE8/sl0p8zAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAKqESURBVHja7P1ncFxZliYIfle891zDoTVAgCRArTVDa5ERGVnZXaqrq7tnampnbdd298/u/liztf43f3ZszcZ21nbGRnRXV/VUZVVWZoaOYEiKoNYaFAChpcO1P3Xv3R/X3UEGFUACJBiBa4ZkJOlwf/7ePfec851zvo8opbC0ltbS+mktunQLltbSWjLspbW0ltaSYS+tpbW0lgx7aS2tpbVk2EtraS2tJcNeWktrybCX1tJaWkuGvbSW1tJaMuyltbSW1pJhL62ltbSWDHtpLa0lw15aS2tp/eQWn82Lbva8sgguVcJ1XLiuByiAMopAgGNsLItz58chhI/Ojghqa8IghGFsIotMxkFdbRSNDZUwLQuGYQAA8vksEokkrl5LYHraw8oV1ehsr0C+4CCbK0AIgZ5reZy/mIOUCvW1+jZ5PiAVYDAgGKTI5iTGxn3U1RpYvSqIcJiCEorKyiDi8TCi0SBGx/I4c3YElEh0d1eAQiGX81FbE4NhGrh8dRyOLbB+fROiEY7hkQQuXExgeMRDd1dVZPOmmpVSuLumpnIvp7NudzbrtQhf0skpPzA25hnTKcEKBahCQZJ8XsF1gOmUxOSkRCarQClACGBZBI0NFM1NDKEQQShEEQ4RFQwSUApEwlRUVHC/uTlQiMcNO5MR7sSEK/J5H56vQAlAKQFlBASAUoAQCoQClklRWWmittqkkQinQigyNmaT0TFHUIpUba01WlcXGY5ErDHb9lwpxFgkYvSfPpu99MmnEwP5vOeu6rbQ2GCgsTGAhvowausiqKqK4PLVDD7+pA+VcRPvv9eOxoYIbFvB9314rgelFAiloJQiEgkgYBn4w0eD+Pt/uIlAwMeGDWHEYhQVFRwVMY662hDi8RB6+3I4d34KtTUGNm2sQl1dJSjhyOezuH59EucvphGNBLBrZz2qqwMoFPxFZbibd556fMNeWgu3lCoankkRCrG6UIi2RiK0NhggRmLaDZ87n27LZLz1k5OF9QXbby/YIih8iVRKIJHwkc5K2AUQx5HwfABKHz7BIEE4QhGwgFCIIBqhqK+nqKulCAYJgkGKYADEsrRhh4KUh8OEx+MqEAoKEEhQArgehVIKjAKeBxRsgFH9npZFYRgAIQScA6GgAOMKCgqBoERFBSAlClKKqqmEXTs+7iXSad+zbZEIBHjnzT67LZeTY4QQF4DijAjLInYoSLPhMBsPhdiIaVKHFA+VQIAhGGSAUsSjihEIAqUoYQyMURkMMhEMcGmatHxvlzz20npqixACSonFGNnJGHk/GGS7DJNGrlzJWF/0J3l/vzAnEyKglOJSAkop+J6C6wGer4DiBmYUCIcJGpso2ps5Wls54hUETY0MdbUUVVUUkTCBFSAwTQLGAINrozEMgDNAQUIIBUApRgkYZzAMwDQJJiYlbvULQAEN9QRNDQyxOIEQBNmMQsH2kMtLeB5QXa0QiwK2DTOVduuHhpya/n4hRkd9NZ1UkhD4tqM825aiuopKECIIgUMpGWOM9DNGDnBGvqaUXNf3CGAMYIxEKEOICmJRSjgUDMqgGCMeY6TAGLEJIamlUPxn7i0B7S2jEW5xw29ljLX5ArFwiMYMg5hCKG4YRL+SaG9ocSAY0BvasgiCQeJHItSJRGiBEpqKxVgyFuPDkQgfTqYYKCVQ8u7PDEd5XV2tsXFgIL/qxMnJWGIaW4eGszsnJuymqYSPW/0ubt3ykc3d+/qjUYpl9QzVVRTxCoKqKoaqKoLmZoa6Goa6OoZwGKiuoohFtadmDOCcgDKAQIEQgBICQgGgeFh4CoyCmAYBMwhMA6ABAt9X6O2VOHfeRzoj0dLMsXWzge5ujoYminxWIp1R8HxAKQIKAscFS6fBohFhRCMKLc0UmayC7wOOA7gug+MChYLE+UsOzl7wuyixpyoqMy2tzaHVCt41QpTIZDz65b7xcDyeCjEGS0lpOLZgjquY6wK+ID5n3DUM5p6/kMzYtsrHYlRxToRlERUK0UI0QnOxGBuIxdhAIEDHCPnpenX+8/aU+k/Xk1a+INbmC/K5bE6+IIRsKtiy1fdVVEpYvq8kAOIXc2yiAO4q5biKeJ6C4yi7UJBpSjFJCQYtS/YahjhGqfjBdeUtKXWO+qPPjNOC2AtF/u3YuPPO2bMZnDjtkpFRSV1X6g0344zvuOZohKKzg6NrJcf6dRwrlnO0NGtDrowThMMEUt79Pe/+7uRHhxyBwQGDz/y9FICrgAABfE+H46fPePj+oAPDIHjlRQu/fC+AV162ELAo4nEKKe40mIZ6hpUrjJn3lIDvA5NTEiMjPq70+Oi55qP3lo+bN201MCiqADzf1sL3dq3ksrGJqUzGw8FDg8wwCerrGWJRCkaBfEEhmZTIZhUKBYVSRBMKEhUKcSWE8jxPSduWiXxBjuZy8rBhyEOuK39QCsP3ujdLhv0swf+UwrI4DIOAEKMpn2Nrqyr5atfx63quZwInTuYbx8e9jlTaW66kqshkPSufFwAUbt0S5c0oJOC52rNlMhK5vEQ45AUPHHIrQ0HaYhhkWSyaW11Xn17XUG++HIvJSSWFamg2E9XVfDJkETU5pSpu9maaLl11N/b3F3Zcv1Hgt/pdDA7d3300NDC0tzF0r+RoaWFY3qENubmJobqaIl5BEQ4TsADRtQ4JoBimS1n6UeXD4seeqvT/b9/ot7/G94FolGD1KgPPPyeRzSn8cMTFR5/aGB0TmJySePVlCytWGfALqvxZKIFuFKAMACMlLBTBEFBRwRGvpFjWzrBxo4HBAUGu3/Bw46ZH0mlBr/b4uHyVIZXWgGB1NRAKcmzbHMD6dQY8H5icEJicEpiYkMjlFWybQAgK2wbOnHXMfB5wPUQJIU3xinxlXa25uqpKvhqJqFRDg5GpruK3qiqN/b7P+11XYwpLhv2MLCF0SCt8hULB7szmvL/I59VrI6Oi6dyFHE6dcTA0qENEQOeera0c9XUEAAUpeiyhgGxWIpGUyGQklAQmJwWuXXchJRiAagDV4TC6mpso1qw20LHMRCBoTHPu9cUiVI2Pe3XfH0g3fPFVmt/qV3d419IqhcyWCTS3MGzbYmHTRo7dO0wsa2eor6VQRSsUQr+H6yoo5/E25b32tFKAKxXCYYLuLo6KCm2IjAGffWFj39cOkikFzgmqKiksS+fsvii/w+3vdkfUUBGjqIxTrF1tgFsEnq0wPCJw8rSLc+c9HDrk4vIVH6mUBvCkpPA8hspKAxs3WKipZgCAXE4iMS0xnVQYGxUYHBbo6RG40iOQSAgMj/hIJpXh+/muSBhda9ca2LzJQkO99Pr6ndMFxw5bBv8nzxM+o9QF4BSPxyXDXoyLMQYhBJyMjYGhAnr7HBB4PBoVW0+fKTR9fyCPkVEP4+N37midJyps22rhuT0WIhGCfF7npIWCQiarkMlIOA4wPiEwNCTQ2+fjVr/AdFIhlwN6rkmMTzi4fEXg+ElRGQhkLdMgKBREcGDQIYND9zZqAIhEKDZvNLBti4FVqzi6VhqorqKoq6OIRgioQcremBACUoQBFsrZqJLnF0BtDcXWzQbeet1CIiHxwxEX5y94+OwLG00NFDu2mwjHGURaFq/v/qlQCfFmxY4KwwTqaim2bTHRsYxh/VoT/f0+zp73cOGih0tXfBw45CIxrXC1x8Nrr1jYs9tEZR1DZS1FclKhtoaio4Nj3VqJyUkT6ZTA0LDA4LBET4+H4WGBvlsC/QMFfPOdZ1TGc2tWr079Fzu2Bfds3hjKNzSa31+5Rn8j5bO773/yhs05BSEq6Lr5+OBgInryZIZks3JXNMaWHz3m48pVD4AGw4JBgkBAA0vxCopV3Qwvv2ThV+8HAYvOeBsFwFNwCgoFGxgbE+gfELja4+HyVYGrVz3c7PWRSiskUxLJpI+rPT4AhB50raZJEIkQtDQzrFtr4KUXTDy/x8LyTgYjSgFfwbO1h87nnmy4SAggBOD7CuEQQVMzw1tvBgBC4DjAydMuvv3eQUMtRVMzQ2UDK6ZA9z9sSoajUXgAtipHK63NDG2dDJs3ExSyEmfPefjhiIN93zg4c87DmbMuens9XLvuYXgkiC2bTHSt5IhEgHgl08+IFy9cKWSTEqOjCmfPu7hyxceRYy6u9vgYHnFx7boTuXots2Nw0NiRTlejod7stG2Vq6km5yklKUKQBeDdD69YjJH7T9awS54iEGCoqODtlsl/WVtjvFBXa1i9fXbziVOO1T+gd1YkRLBunYHODo6ODoZohCAc1qWhlmaGfF4hRCSk0HCTAqAkdHOGBdTXU8RiBJ2dDLt3KUxOCVy96uPSFR+HfnBx4ZI3q2uur6PYs8vEKy8FsHYdR1uLvhYFQBbzViGe7kYiBHBcHbk0t3E8/5zChYservZ4SCQkzpz3MDAgsLJLpymckxnDncOz83wFKvXdpgxYuZKjuppi7VoDZ856+PpbB8dOuPjkMwc3bkq88pKPf/nrIHbtNACTQOSVzpvKBzxBbS3Bju0m1q42sGePhaFhgevXPZy94OHYcQeHDnu4dSuB5ma+de0a/D/XrYmcCgXZp4zRHwBMEhBFKbknDiGlgpIKsoR6Lhn2fINkBAanJBplbY6D9v6BbPTadXv3dCL/y+s37HU91wVGRyXyBYX2NoaOZQwrOg1s3Gigo52hvZ0jGiEwTMBztRf1PIVc9s7TeiaM1GFzRQVALKItXwCbNghcu+GjvZXhxCmGM+d8jI0J5PLqrly6tpaitZnjhedN7N1t4YXnTFQ3aY/n5xR8XyO+iwXB9X393UOVBKu6DLz1egD9/QJffmXjwkUfx4676FzG0NzMEQhqTz/XsF9jHap8n6urKaqbGFZ2caxZbaC9naOxkWH/AQc9PT4SCY15jI0HsGeXiXgFhWUSuF6xUkmBcIigopIBBsEqAF5WYXTMxMnTHigh+OiTAnquu+i57la7Lq9uqHfXWFa2sq0t7BBCP5dSopDz7wDXdA+CTvk4ZzAZAyEUT7uU9pMxbKX0D2MEpkWilXH+q6kp/MXJU4mKw0ftcF+fH5+YEMhkBRrrKXZss7B7l4nNmwy0tjBUV1IYJik2bOgHpkL6v0ttmff6PEL0ae37AHFn8txwmGDdGgP1dRR795j47AsHH39m48LFO713ZQXFc3ssvPlaAM/tNRCL6Xqzk5bl8Lf0OYutTOjnJXwf2LKJ4803LFy46KJ/UOLMOQ+bNpqor2egBi2H2I/zXG1bgTgKSgEVMYI337DQvZJjxzYDv/uDjf0HXPz9PxZw44ZAOq3wwXsBhGIUVCioIjbgSQVfoIxHCAHUN1Ds2GZgdNTCyKjA0eMupABOnvLheWmrUPBfswK43NgQ+9z1BBKJHNwiKkiIgsEoDJMiHA7AtEIIhgIwuKH3z1O0bP5TMepAgFrxCrZxOul09PZlOsfGnfevXctvPXUmi7Pn9IOorCTYttXA7p0mtm+1sHWLgY5lDMEKqj2tryBdXau+PcTStdEHo8i3/7tOAQi4RRCvJujsYAiHKGpqKD761Ma58x6kUGhu5tizy8B7vwhi2xYTTe0U8DRy7ziLz6Dv8tyu/rO1k2P3LgsbN9oYm9Bo9rnzHvbuNkDmaYeV8nFCgFCIgocJKqsZ6uooggGCykqKQz84OHzUhS+AbEbitVcDWLmSgxuAXTwUbi/rMQqYQd2Z9+rLFqQEOjs4jp9w0XPNx6kzDqutEZWrVkW3rFjB1oCQqwXbE47rFwFLCWEwSEURCJoABThnMIwlw54/9Juii1DyV9du5N748KPpqnMXHGt8XMJxFBgDlrVzvP2mhVdeCWDrJgPhEEEwoBs58kk5r6GTUrr05Hmq/J6rV3G0tjEELI0Au67Czh0m3nsngF27TShBkE+qe3rGRYtjlC6XEdRUU2zdYuLadYGhId166jhqQQ7x2+9tTTXDO28HsHmLid/+luM//0MBh486mE4KuD7wb2pDqIwTUKJrV7cfxEIBhbR+n/Z2jl/9kmDTBgMftTD8/qMChoZ8JJLAxKRs9Hz5FiGwOac3hWTFFIGAMQrGKAgpVSkUpJRP3bDZv//3//6hL5qe+o+LwS9DCAEhZDnkDocNAKLZdgq/6r9l/8nxk+4b3x/Itp84lbdGRxUTAlixguO1Vyy883YA774dwOaNJppaOUJhAoOTe3rc+S+5AcEwRbiCIhokaGig2LTJxJ5dJjasMxCpYmBAuYb+rC3DJIAATINgfELiwgUPFTGCF56zUFtLIbz5P6SU0ilSIEAQiVHU11BEY7rzLZGQuH5DYHhEQPg6P29s5aC4O98vRUWB4qBMTbHZp6mRwTQJppMK/f0iMDLqNjAm2hrrWZhQjDiOsvWzJWCMwLIMBAImTNMEY0wb+gKuWOVf/vQ8NiEgSoEXCr6VzfqvOY76v529UFjz+ZcuUqmZ4mPXCo6337bw6w9CWNXNUFvHYOcV8uknW6AUAshn9WcuW8bQ0REsb3Qpgfz0M1wwBeAVFAwObFhvYMc2A99+ayOTVRgdk+hIKfAibjFXEO1heb5SKPcWMAZsXG9g5QqO2hqKv/m7Ak6ecvEf/iaPYBBobOQIWPo67tVum8+qInoObNxgYN1ajs4Ojt/9wcZ3+3NVPdeyu1LJih3v/6JiMwgcQvA5IfAXBQT+rBt2yavGK03qunLTzd7kaz8cnnrr3PlC15mz3h1GDWhEu6OdY+1qjqoqCjACxu7MtZ64dzMIuFn8PkKHlSWU+VldwlfgBlBVwdC5jKOhXiP64xMS09MStbUUlM697DXXvWGZenLttVcsBAMU/wsDTp3x8Jvf2jBNinfestC6nMPNSPgebm+VvwPPsCw9d759m4lIhKKqEth/wMa+r7L0Zq/Y+O474f/jjm1WWyrl/41tI7Nk2I8d0hLm+wjmct6avluFX+8/OPGvPvlssvniJY163r5CIT0s0NjAEA4TOI6Csu/f6fWklusquC6eqVx6Nrk2owA1gPp6hlWrOCanFMbGBCYmBWprKRjTAyQLZdRCAAVbe++OlQZamzmkVCAkjwuXfPz9b/KoqSaorqcgAqD8zj1TRvp93YQDAPUNDPWtDI31FDVVHP/Tf8jim+8y0XgcbzQ20BbLxKhp0m8IQQqLrP30mcixtXdViEZZiCi19fyF6T//6OOxX+w/mG29cUNQ17n7d+rrKHbvMLFhnYmmJlYuWS2pBi/MohTgJpBMSIyMSrgOEAgSNNQztLUxGAZ5YhhCaTitrpaiuoriRq+Pa9cFFAgq4xT1tQyRSgq/iJTft+UVep4mEiaoq2UIBAhyOYUzZ11cv+lHVnSay1evspjj4jilhgoGl3LsuT0oTkAItTIZe3tPT/pPvtg3+ctPP5tuHB798euAqkqKlhaGXTsMvPicieZmCiFUEeRYMsCFPHyVq5t11q834HlAOq1DcQDFee8ncx2lZp7mTo5fxAjGJiR++zsbp065iISBqgqK9XGjfCDd77B3HF12DMcI1mziCEdCiFdQ/Pf/QwZnzhSCHe18VzhCzeoqo6+ighwBMLbksefgqUMhg1gWbbx8aepPP/1s6E8PHMxWDw5KJn4U/FRWUbz+agB/8adhvPWGhdWrDdTWUBgGeeADXECQDz/Ved97fl9KdO4KgskpidExifp63fduGGTBQvH7bu4icNnaonneTp72MDwisbyTo6mBwuAEhkHum56Vnp8UgPT02GpVJUUkRJBOKxw97mB4RIY2bQx2Lu8MZTyfneXMBOfPiMcmT2l3UkpACUE+76yamMx+8N33E+9+sS/ZeLP3ToS1IkbQ3W1g61YD774ZxK4dJqrri3VFT5+8SyH4kwDR9DBNawtDfR3D1R7/qZbwSj0MHd0GXhPA5cseTpzy8N1+B6EQ8NKLAYRjD8/9yy20MT22agZCcF2Fsxcy+P5ArmLlCuOFUNgabWsLnA2H6HUhkH3qqdFiD8FNk2FkJLPr0KHBvzp0ONF9q//OcoVpEqxezfHHvw7ir/9dGC++YMKyADurUMiqp2bUUmq0eCGR4MUWikupBzbCIYKKmGZyMUzy1A7V8qhpQaEiRvEv/iiIF54zcfGSh/0HXd23P4v0rOTX7CJLS0srw66dFrZutqCkwm9/n8JnX2RW+b56JxSi7TPR5lO0ndm8KJ/LzXfQplvyaIlvi5QrD7cHB4zSKBjruHY9+8LHn053nrvg3YEoNzUy7Nxu4qUXTbz1RgArlnPQIIGXkfDF0wm9SwMM+bwe2WQMqK1hCAVvJx746Ro3pbrsVFenGV+qKknxkHt611Vif9m6zURiWuLCRR+joxLnz3vgnKMiSsEZ0cSQD8MRFGBYmr7ZNAmkAiYnJQ4fTS3fsCHwK4OzyXhFRS9jJO/7cpEbdj6/QIZA7ns6AkDAorXBIH2jr6+w/vgJ4WWzKBNnxeMMe3Zb+NN/GcT2bQZaWxnsgi5pPbUck5T4vBRSaYnePgHT1BxlsSiFkD+PlEBB9+WvXM5RXaXBS997moat+dWDIYKVKwy89KKFW7cEzpx1EQoCO7ab4FyTazw4NdSHhJORmE7KO9LB4aFC6KuvR7fEIoGdz+2JfWMY9LrnLfJeccuy5tGjKSglYDsuCnkPuawP2xYQQm96z1MQxVnq2hqmmhqNbXbBXpHNSl4yihXLOV55ycKrL1t4bo+JmhoKwmYM62kBVqXPVVLXVKemJCxrZmP9XJZUQCSic+1ggJRTk6cZSZROnKZGildftvD9AQdXrvpoafKxfZsBQsms34dbujd+5XKGi5cYxicEJiZBjhyxydpV+ZXbtxa2cc6yjuOPLmrDDodD8+ahpRSQ0oXreXAcH4npApJJD66raXTyOQkhQQyThJIpumZ8nK0aHbUrtIHoctbrr1j48z8LYvUqA9XVFI6t4NgAFgkKrYrhX76gIIoE/viZoONKAVIoWCZBdTUFY0TTLz/Fayod+IWcQihEsGG9gYkpib5bPrI5hWRSgdKZefcHMb4QAjCDoKlJk2L09Qsc+kHTLo+OAomE4L7v1QghI5739PKPp1THJneZgvbkGoBhDKirZX81Mirf+/yLQsfFSx5sW6Gjg+PN1/VAx9o1BqIRUqa6XXS2U5r0EUVO8Z+RYSulW2cZI2UyisW0KAca6ii6V3JQSnDjpoCQuqmp1MX2oCUchXCIYttWE1d6fBw95gJQqK4iqK62rkcika+DQXqrYOvZW7VYDXs+x8+0AauyB6dUj75xrk/EUIjUu57aNjWl/qtzF7y1n+8rQEmgslKHUH/+JyFsWGegIk7hubLcjLCY6sVClloTAcPAz3JpllXMa1/+wzzqrNIECXgOUFvNsHWLicFBibEJiXicoqF+ljm7o2CaQFc3x7atJpYvd5A56xbZdoRh217UMEyDUubpue0nH7Esms6zUmtfVSX90/5B/18f/MHuuHDJ00Ydp3j9NQtvvWZhVRdHJEzgOuqp5tMPBmtKwx23kTSQn5dhzydIqNVKit1rxdRGPiK1WElMMBolWNbO4fsC4xNiTjiALKL/1CRobmLYutnArX4fw6MSV3qSL4yNWiEhwv+tEIH93DTAGH/is9mLxrADAdLquWrr4JD/r86cdbceOebAthXiFRQvv2Thj38dxAt79XyvkpoRY7EZdSnkLHFcZ7IShsF+ts0xj/u9tciAJkkQAnA9rajCmC4/y0f4jNJBG7CAcJiiYAOEKgQCulFlNm3H5Y+UQEsLxVtvWOi75ePzLx2cPJ1t+uRzvL93d825lSvNK4wiKaVyn/R0J10sDz8SoW8RSv5fh486aw4c0kYdChNs3mTgjdctbNtiorKawrZVmSVzsS1KdDNGNqc0uV62xPShfnYeez6iN0a1cAM3dGUhk5bI5TT76f246GYTyuvym46mKmLa60YiFJ6vWWBn855SAp4tEY1QbN1qYPs2ExUxgr4+gd99WJDXbsj1kQjfZVk0/jMCz2ZkZkIh0ix8ure31/3zc+e95WfOuUilJSgFNm0w8atfBvH6GwG0NjNQA3DtxcsFVvLY2axEqkjmYFlPbgDip7Isi0AKBdsBbl7xcPGKh54egWxWIRQEOpYxrFltYMVyjkBAU01JNTcDn5hSSGc8VFRoqSQpFdw5UDmVKh+BANAS59i1w8SJ3Sa++c7FxUsuPfhDcuuG9aFUS0tlXygcHPc8WWb/0eyrd1InKTW/zuqpGTYp3mDDwPNS4r85etxp/PpbG56nYBTLCc/tNvHqSybaOjictNSiK1i8gxWlzrNCQcG2FYIBgooKXfKBXDLYuQBvhQIwOCSw7ysHv/uwgBOnPFACVFQQbNxg4Jfva9pmw2QwuO4dmE1Yrg9fgokpgStXPDQ1K8RiBgIWirpusw/vSy2r8ID2NoY3Xg1gZESztJ49m2r89nv2wquvWL9bvTp8bqYLTZUN+c69M7+b+qkYtlJAMEirGWWvHz0m/t2+r/PLTp91y+R3DfUU774VwAfvB9CxjIMzwHvKzSez25H6j6mExHgRaY0W2xWxNITy8M3ItafO5xXOnPXwz78v4MuvHaRSEm0tDO3tWoRwWTvDsjYGy9StyHP11roUB7gucPq0i5ERH9u3mlixmkM5QCE/+9RJSp3/t7dxvPYqcLXHx7UbPq5ek+yLfelljQ1T/7a5iRiFAvkQhDmmoZthtAIrAWUMlFJQSucVi3kahk0IAZUCW9MZ8X8+ftLe9fsPc0opRYoeHJs2Gnj/3QB27zRhOwp2Si56Kt4SYiElMD4uMTxSNOyIZg9Zmi6bnae2baB/QODQYRef77MxPCLw0nMWXn01gPXrONrbNHdZMEDAjbs5zB7mUEq5eXUVRWsLw7kLHn444kL4eryTMT3DMNvnJaUG9SIRPfm1d4+Js+c9HDnm4sxZH8dXJX7Z2OBXRiJWb2Vl5DSjEBQMvi/BKC3+MDA+v8j5EzVsKRVMkwYqKsx1J05k3/rNP6e69x8sQClFSjd+1w4LH7wfxKpuDlgExFXzSoK30B6bEoWphMTIqMCqbo5wSHuH2YaKTwSUYtprURN3yNoqR8H11BMXKSC3aYen0xLffW/jxEkHa9dwfPB+ENu2GFi/zkBlJUUsqr20UrpfYO57UIfD1dUUa1YZ2H/IxfWbDr76xkFdLcOmTQbqGhncvIQ3S3ZVpfTzNQyCTZsM/OKdIMYnJG7c9PH1d3kYJl37y/fMf1dXy8P5Ar7XMwM/oVCccwoh/MapKffdo8czb/7Tb1PR6Wm/+G9AYyPD228G8M6bAcTjBF7u6XOUzWnTeEAqLTE8LDA5KWBZQFXVTPPNYgD3dD++Lsk5roLn6b8zDU3la5rkidNIlbxuKiUxPKIFDkNBgrffCuDVVwKoqiTgFoVb1C+T6vEONyGAUIQgGCZYs5rj6HGGM2c9EFIA48BLdVrUby7kHI6rQKAFB95+i6C3z8fIqFb1/PIrO97R4fxxc7NvW5Z5yzDooJTKv/O61JP32PNxmlBKEI2aGB52q48em9j13f6p9lxWlD+/qpJi+zYD69dx1DfoWnVpMGSxL1psnCjkFMbGNe1uIa9r8PW1FIQWReefdkBB9WhiNqtw46aPCxc99N7yIQTByuUM27eZWNXNEYwQwEdZZ2yhPTelGiEeGBTovSWwfDnHjm0m1q3jiFfozi3pFje+uh2CeoxD2NfI9Ooujpeet/A3f5vH19/aWLuWY9MmA0GLFHnaZrcHS5cWChK0NFHs3G7i6jUfh484GBhw2T/9droqGDC2vPN2dGd1tZkdHi5MLuTenpVh+49Jg0EIgRRgvi+X991KvffJp5Nbjh3Ph0tva1kE27aa+PUHQWxYZ4BbgFfArGuKTx/00aHYQL/E6TNaf9kwgJoqikglhZuXiyKd4AxwXGB8UuLcBQ+Hj7g4e95DPq/Q0szQc13g+b0m1q3laKhjmiRBqkcKeecaHnsekM1q69i43kB3lxZ10Oymat73gucCCgorVnK87gHffGtj3zce9n3tYEUnx/ZtBppbOfzs7KzvdiOtqKB4/nkLmaxENiNx+qyH4ycLNBZNrKuvC/+LzVtjHmPka4PR1FM1bMdxHu9EZhTC97nt2P/qVt/0X9646cZzOY1mEgLU1+pJmZdfsFBVReHm1TNj1Br0IVAEGBoWOH/JQyarUBmnCIUJwPDU5V7KB2yx3js1JTE2JrR4YJDALiicPuPhxEkPZ855+PUHAbz5moXOLgPKmyHlX6jc2vMkbFshFiXo6GCor9VSSEoCnlyYakhJny0Q1eSXq1cZOHzMxanTLr7Yx7B8OUNzB5lzSmLb2sO3dWgxxnPnPfRc95HLKVy4lK/4w4eDL4E2pHZsr+sLBvi5XFb5C7E1ZkVmODT4/4VUcs4/QgoopUgoRKuyWW/H8ROJ//2nn0+vOXPOY6WzoqGeYc9uE+++FcDmTSa4oYXUn6VlFjXAvtxn4w8fFpDOAps3mnjheQtty7gW+lsUObamAM7ltGdsqNeywStWcFTEtDBhMqnHGE0LqKvSRJDmAtEbzXSC6WYPyyKIxxkqYhSmdVudeCGfXZjApASJaY2NXLmqjXDNao5lyxiU0N1vcg4oOaD50WJhHc6n08DQkMB0UrKxMSeklF9TVclDsaiRCIXMQW5wqDm2Jsbif/E0c2wCQkBDIbpqdBS/OHDQqfnugItCYeYuNTRQrF9rIBQiGB2TiEZIuTy02PPr8m2RCrm8ws1eHz3XBBqbKLq7OGJRCgi1KPJr7Rn1SOzyToa2Flbsm1YglGAqoeeTP/nExplzHn447KK6imLLZhNtraxcr51vlL504FgWQSAw0ybqe0+m9K9s3fa7vJNj+1YTl6/4Rf0xH+vW+GhpZggFKfxZcteV9oSbVSAg2LvHwnRSYWDQx+kzHiYTwJGjmcZoZPgvLINObtkSvsA4zdjz7MwWFBXnjEAIKaam8huvXU+9c+lyviGXu/MGJRISJ894qKzUzRxGK0M0SiEXOY1QaebYsICpCYlTZ1wcO+4ik5XY3mRg0yaOykoC6S2eA0pKPSUVCVPwOHRDDSMACOpbFNpaKSwDaG1lGB2TuHzVR001RXWVHq+dS814rgdkSd+r9BlP6p75vk4zulZwbNtm4ot9Ni5d8fHtfgcrlnPU1TIQi8xZ41t4+jvVNTPs3WViZCQIzwUuXPLQc00aUOl4ODj2y4o4d9vba/5zJBK5JYQsyzaXnMGjouWz89iPeHaaBkXeV7ynJ7X6+IlEVzLl3uX6+wcEphIOaqspNm3kkJIt2Aaa781ItE3g+g0fX+xzcOmKD0qBlSs4Vq7giEYIhL94DLuo9PojmaGZi6OE4MXnLWzZbOLrbx1cu+5jKiExlZCoiFEEg2TBDLt0WD5pkLH0eVVVFMvaGVpbGC5d8XHuvIfTZz08/5yFukfo9S+2hEMUFGpqKN5/N4BMRmFyUmJ0XODaDYX9hxKbamrQypg5urIr/L/6vkSp9fRxMZkFIVrQDe0EwSBt8X22+eIlb8N33xfI+MTdu8I0geYmis5OhpYWrbMlxOIOwylFmWh+alLi2AkPX37lYGJSorqaorNDh7qmqVskn4WSXWmaigcJKi2tEx2LUhCqMD2tEAwAwSDBYuiNJeTeaPSjRjEAwEIEdXUUy9o5QiEX2azC1R4fo2MCrctYOWWYa1olBBAtdqW99KKJkVGBfd84GBkROH9BEsZSNdwY/TcKbiSVFv9RCqQjEYZw2IBhMJimAUbZnEE8PruN/GjjSVLJ1emM928uX/a6rly991G/vJPj3bcDePklC8va9eXk889G/+XoqMDpsz6++c7B+QseKAW6uwx0LOOIxCiUr+fGn4WllKZHFpmiEHybnnoaGPThunqDLpYo6nb8ZT7R8nCIYOVKjtYWLXYwMOjj2nUPncs4YjECznGXoOJD76mvcQ0rSLBxvQHh67Hjjz+1kcspHDrsIRIZfzGTS3UQoD8aZV/XVlv52tqADIUsRCJBGIY558rKrAzbNOfGUsoYhVIK2Wy+ub8/uWd8olB9v9euXMHx+isBdK/kxc2zuA2hxONFCHDtuo9/+l0Bx47rp11fx7C6m6O+TiPMzwIAeD9AixACy1KoqaZwXZSbNZ4Wf1mJhKYErjm2gleknjKMeUDthR5CaW1h6FjG0dvnI5FQ6OsVGB0TiEb5I2u/KQX4LlBdTbF9u4mRMYmJCYmjx13kcgonT7nI5kTLnl3W/6Wjw1zGmfrvHtcOZmnY5pzeNBBgVAhlXr4y3fn1t9ONtwbsu15jGASNDRS7d5rYvs1EZR1FPrX4+0cNA/qB3/Lw8ac2PvvcxuSUTtS6uzn27jbR3MQgPTw7Pe73WCXy/FiMFMGcp3tIldiB83mFfEFBCgXTJOB8fly2chU4B1Z0Mqxfa+DYCQfptMT5ix42bjSxYjkHeUSoWUotNxQKEdQ1c7zyslXuWf/hiIfJKYXUMZ/WVJsvNTWhtqmB3QgG+VFK6USJM22ulalZnb9aqXL2P5bFDNNkrVeu+nWffV5Ab+/dBltVSbB7l4m1q7km/FvkUjil+XEa0DXPDz+28fFndplQAQBamhnWrzNQU0vh+wpCPrsjXTPRBimSTj5dtlHOdD15elrixg0fk1MlCVwyL2SWQiowStDUxNHaRhEKUdiOQm+vxPiY1GQZj3GIEFLkwcsrNDUzvP6KhZdfCKC9lYESLVZw+KiDb74tdCiJ/0dNNXv3cUDkWZ1ByeTcJH48j7UIod5Lp+3tjisRiZAyAUHJiy1bxvHm6wFs3GSCMV0eWNSeOkDg2goDN318/a2Djz+zce26X4xoCOrrKTasN7BihW6wKBR+GqofpSmvp60trpTe/COjEtdv+FixwsDKiEbqGUU59Sm9tlQymm2k4fu6PFVbT9G5jKOhjmJwUKD3lo9bAz4KtkLkMb+/Zq5VCMcJOro43nk7gGxW4aPPbFy67GF8XOCHI06otbmwy7SMRHNzuCcUoleEQGJBDHt0ZG7vaxi0Uyn1Xm21u+WVFy2MTQqMjurSVqk5pbWVYd06Aw3NDH5BNwks5o3NgwR2TuHgIRcfflLA4OBMnF1dRbFru4XulRyWSeYFrV2MefdTiZRKbadC95JPJSSSKU3wH62gegdLHXuSEmgvFZgP+L7udZ/N5Us5wzxaVUlRX88AeMhkJSYmBTIZiZpqOiOtKx/9uzg5BUhg1WqOX30QxMiYxI0bHhwXSKUEfvPbNFyPrvur/zL819Eo/Y/JJL6d6zOYlWEbnM35CxBC8uvXVRytqQmljp5Ir0ok0m2yOLPa2sywcb2hS0IBAr+weMczS9zYubTCpSse9n1t48gRB8nUzJ3u6GB46w0LG9Yb4PzZzq0XXQpUFBzIphVGRgQmJrVzyBcUxscEJqckRkb03wlfEx+GwwTxCorGRobqKlrU3NLRonwIOQqheoijo50hGiHIZBXGxyWmpyWaGlQ5LXussN/TbxKqpNiwjuOdtyyMjfs4fNRDOi0xOSWw/2C2bfly6+0XX+DXamsiJwkhGcfx1Ww/f1aGXVcfn+u1DwL4KF5purX1Pq70+H+eTiXbHEchHqfYusXA2tVcAyL+4nZthkHgugq9133sP+jgzDkP6czMNTMKdK/k2LbVQEszg+sqELJElzKfhs0YQT6vySumpyXyBYWhIQm74OLyVQ/nz3uYmJAoFIBQCGhoZOhawbF7p4mNG01EwmSGzOFhkYnSuXxjI0NjA0PmupYBSqUkCkUeu8cusRV/388p+ALYs8tAIhnE8IjE+Qvaww2PuOqffz9RbVnm+vfeDa83TXrOcZABZtdJMDuPbRpzfRjDUPgKEBvtQv7N8XG7cXpaX040QrB+nYHV3QZMk0B4i9sIKAdEATh9xsXHn9i4ft0vRxfhkP4uu3eYaG3h4CF9CCyWMLwEeHFGQBl0CyklM5CpAuApeC5mPXf8tEBLIRQyWYWbvQIXL/s4c9YD58DIqMDgkEAmo7+HaQIVcYqLFz2cO+9hy2YPO3eY2LieIxQi5Zn0+35XqSsftTUUVVX6RuVyCqm0gm0DoSDmjUq6lNe3tnNs36pwdLOL0TGBREIim1XkwkWPnT+f2rl9SyBfUxv874VkJ6EIZpNczMqw5yrezjlNKSA10J/+5YmTE//FhYtpls7O5KPLOzmamnTr6NPUTX54OgE4BYWhYYGjx10cPubBdWfIB1pbGN55K1CWYVWLrBmlNLhROmz0j7yjuYMUe8DpIh6RLeXOtg303RI49IN7334H1wOyOYGhIYGTpz0cPupicDAIggC6Vhqor3vIF5WaJbeqShs2IVpccXpakyxWV5VKT2oenk/xPZgu/b6w18LwsMCx4y5SaYVCAbjak1127Dj50w0bq07U1cXOKAUpZlFumZVhMza3Oodp6mmg/kE/fPREjt3s9YthK0FjA0NLM0MkTuHk5KLNRw2uvdzAgL7Rly77dxi1npLi2LPLRGe3ASafLgBIUOQyMwmIoTcLHIXEtMToiAaAJiYlpqcVkkkJIRUiYYJV3QbWreWob2Dw3BkkefEYtSYXLNgKE5MCiWkxpyamgUGBL/bZ8IXCn/0xUF9nFaOZe7eHSqGrHM2NFI31DIZBkMlIjI8LZLMShLB5L/tJTyEW1fPb/QM+rvT4SKW1YfRc8/HpF7lgRWXFts4Odsx2xHXPk8l5MWzXnVstyjBUUAi16maf23nsuIvxCT1BU1VFsXw5R00NBTUeHV18UmEsAXClR0u3lEpb+uDSD37bFk0lFK0gyE+rWZPfLQRqjGItNG9L2AXNnDk2JtA/KHDzhsDgoMDAkMDYmMTYuNYjj8cpdmw3MT5uYsdOEzVVDKHQInsmxUEbX+gmj0dxBNdu+MjkJGprKOrqKOrrOKIxwL3HqKQSOhSvq6WoqSEwDB2KJxKy3Oo838/YtRUMA+hexbFzu4HvDzKMjgr4PjA5pXDoB1dt3eJs27PL+wUl9B844/Nj2NPT6VldYCnEk5J3MMrem5xwtg4Ny7IxtLQwtLVqdgwtnbu4w3AhdYnu5CkPE5Mzuz0Q0Ln1urUcljUjBvA0jNqyCKihn2Q2ITEwIHDqjIdr131cvuxjdFwglVLI5/XGtG3N8iGVwsSUxHRS4tIlD2MTEh+8H0C8gpdHGRfF81EKkJrsoSJGEQo+mrtMJhW+/MpBfT3FB+9RVJYjlDuny1TRm3Oj2NVW6qGXM4w/8/2YS5JFMAhq6zhWdxu4cUNgeERCCAXHVWR0NNMxOGS92NBQ+U0gELg8L4Y9ey+nEcNCwWvPZHJvj4wUukt1a9PUgwXt7QymCWAR59aMAfmCxNi4xOWrHq7d9CFuQ+8rYhTbt5nYuMGAYQDSVk/0+jQopocCMhmJxLTCVELgxg0fly77OHrcw5UeD7duPdi9eZ5CLidwq1+AUKCyUm/m2hoKzkk59Xjqdi2BUICgvpYhFns0w7ZthaPHXdTUaNrhqgZN0M/YnRFKqZ4dClGEw9pjozhOulBpY/kuC6CmmmLnDhM3bvgYn3D1Zyrg2vVc5PQZc+3e3RV1jY0mf5gFzcqwa2urZnWBjBFQSjE1lQwPjaSaE0m7/P6UEMRiWvKGcwKIxWvYBieYnJC4ctXHwMDdOV00StDWytHcyKCIRpSf1GJMRz/gBPCAGzc1uf6Row7OnvMwMSWRTuk671zD1Y8+tlFdxfDWGwHwwOIw7BI3mWkRxCqIRqUfY/X0aES9rZ2jtlobr+PcqaHFGBANE0SjBFaA6KqBp2ZAZLIwB5jwFMIhPeK5bBnDwR9mPu/WgMKlK55Yu1oFGxsRBTD92IYdmuXdNAwK06To70+HLl8pVA0NzRArMAbUVms6XsPQucyiza1NgskpiWPHPVzt0RrdJaMPWATtbQxtbQyhKgonLeHLhT9sKAUYJygUFEZHBfpu+ejtEzh3wcfZcy7Onb8zXZjrGh2V2H/QRXe3gS2bTNQ30XkRmp8X45Za/K62liIep2UijoelC5xrbfW6OobKSlIGbxWA1LREdRW9K32Ssnh4BigqixJNqZQWD1jICo4EIFwgEiHo6jbQ3W2gspIhXxBQAMbHFc5f8MyXnnfXLHedMQBfPrZhi1nGIIzpvDk5LaybN3wxMaHuuMmxGEVFTHtsIRdn2yUhmlk0mVS42uOhhBGUIpKaGoplbRyxyG3J1gJ/j9LHMKp1wc6ccfHRpzYO/uBiaEgUyQAf/yKSSYmeaz56rnmwAgaiEVJ8/k87FFewTIKqOEUsRhEIULieRDRMMZ2U9zXqpkaGDWsN7Nqt06ZwUD8z19UjmvQefO9aBogAXIfjoSBBLkcg5IzHXhAoRemysmESmGGCpgaGhnqG4REJpTRoODYmzFTa3pIv5MW8GLbvzQ4VZ5QGlSEaJqe8FVd7fD6dvPNGRyIE4TBZtFpWJQ/gO8DouMDVHh/JpLwjDG5q0tS0sejCC+2VrscTwNS4xNCwj7PnfVzr8XH9hm6j/DGH3OMsXwDHjrtob2MIhQi2bzfLG+5p59iWpWvLsRhBZZygsdHA5k0G7IJWEMkV9OFmGBoDaahnaG6iWN7B0b2KY1k7Q8AkcFyFyYSCUazd3/fQKurImeaTI9eUJW0xQ0cny9o5bvT6SCa1w8zlhJXO2BvSaeOhPd6z5BW3Z7kRaYwzuiOVdteOjUt2+3nAmGag4LzEvbX4LLtETu/ltZrH5KS8A1ihVFP2tjQzmBYBvIX9FrrHWTeYjIwKHD/h4fxFD46ja+gb1nFcu+bj1BkPUwk5L2WqRELixEkXu3aY2LljodzT3I2bMSAUImWjXbeW4603AqitZvB9LYJg2wrBINBYz9DUyFBVSWBapMz1JqT21PW15A7q4wd9bslDl/jtFvoglxKgvp7dbmmhqKmmZefCKJjr+HXZrJOeF8P2ZuuxGY14nHY5rmjPFyT98SZl7OnO9M7GsHN5YHxMYGRUNyTc8R0IUFdH0dLMYAUI5BPiZvN9rS65YjlHdTWFaWggMhwmGB0R2LjBw/6DLk6c8h45JK+rpVixgoNR3fbrugr5nCobxmLItRnT97+9jaFQ0EMha1cZaF/OMT0pUShojx2LUkQiBKzID6I83NFGWoqEHpZiFAfFZrCX4o1QC3qI6fJeOKS70eLx2wneQKWUkFJE5sWwCwV3lhdFQwBtc12/Dj8icSjdyMVcu6aMwHEkBoZ8jIwI+OLujVVVSVBbS2GaC9/IUebdJrp3uaWFIxgELJOAmxpxsW2FDesN1NQwEEpw86aHVErBFwoPU2ZiTB8YVZUEu3ZZ2L3ThGEQ5HMSdXXaeEDmJk63kACaUkBbK8PatRwHDrrY95WmCO7eYKCBau7vUsjsugrqMbm6SRHX4IzofvsnEL2UBlECln4u4TC546BxXIl8XvB5MexMdnZ3yPWJ5fm00Xb8uPqRtIGQCrJUCywPn6lFZdiEak81MamQmL5bs4pQ3ZwSCmqEdaFle0qz4JZFYJpFfi+zSCwg9e0zTYKmJob33rXQ2spw9pyHw0ecIsPmg0+ecIhgxw4Te3aZ2LPbQnMjhWFqyZ9SWXKmx/zpPp+SQGNbM8WGdQa++cbBqTM+bvYKOHkFrrQB+vPAClv6fc4IggECK1Ds0XiCqYdl6fHRUJDcYUPT0wKjo15wngx7dh7b8YjpuqTSLvjmj63W84BsTiGXkzBNBmsxDh0w3bY4PCwwNiHu8siRCEW8Qtc+n4Q0bmmDGUZJ/0vXU29vSSdEHzarNhhYsZxj/VoDbS0Up8/6OHvew9SUgO3M6HOXGnBqaxhWrmB47VULz++10N1laNroInGB56Jcx14MUVYp2qtvZFi/VhMDHj+pFUvWrTWwqoujppZCzKOckmEA8QqKgq3A+JPDG0rRre/r3vXb70Fy2sfoKALzBJ7JWV4QAQEhegRQ3emxfSCdUUinFaJRVe5SW1ShOdHg2dSUnvv9cSmkKq7BjEiUQAryxNRKbv+MH39eCTX2i1rizU0Ub7wWwM4dCv2DesppYlLCcfSQimURVEQpmpsZ2lop2toY4hUUnqcVJ4g/856LSRSxFDUYQYraWoXODo5o1MPxEx46ljloaWaobaEgjigfYI/3YVp3KxolyGR0aawkAqAWehMCKNgayMxk72yecRyJfF7ReTFs1521YRNCCPXv0bHhC2A6KZGYlqirZ4sTRCvWOMfHJaam7kSZCdF1+FiMggcJRAHw/Se7sR+UfzqOzgejUYp4DQMYsKmgMDEpkUgUDdvX9eBYlKKmhiJSoWv2ooBFNUf+QISa6shp2xYTFy76OHzUxWdf2Ni62UBdMwOVmDcWG8aLbCxx3RgTKPpJtUCRGrmtL2JoRI+dDg2Lu4BU150nw55tHZMxQAoQKe8+1pTSYXgmWyz0L1J03Pf1QH8uJ+/Y6KxIVkApbiPXWlzgnyyCRsRT5dJJKEhg1tOyxyuF4oQAdm7mdc8KR5t09P5Z1c2xe5eJ8xc93Ljp49gJF53LGdpbOaJRcofw45wPkdv+ixCFcISgrpYiGqGQSoEqsmDPkEBBKmB4SOD4KRcjo/KOC5stIyud9QfO4gcPqPX5PjA8rMcHPRcAJ4sm1CunBFIzqabTCo6Duzx2qbVzMa9SGF3SFw8EdO03HtfEAfE4RThMy1xui11O6a595OrrXbmK47k9Jjo6GKaTEp99YePLfTamp6WeR5+HlFgUlVw4ByorKcIhrWKnFnqsVQG5rMTEpLyrX1+p2Un6zmqbck5n9WNwqgyDCsboXXdVCGBoWOLWgIBtLy6PXTJs5epOLtuWd4W/pbLHoujYmK13kxozsB0F21YoFPSfrqueOYOeSen0RUfiFB0dmtw/GCQ4f9HDN9856L3lw8uXWkMfdT/o1lPfBzIZBd9TCFp6dFTn2GohbRpKAdwgiITJff99XkLxgDW7O2RaBIEAJYZx9+s9Tw8aXL/hI52eQVsXA4BW6vDK5zXjSDJ59wVFY7p+HQyU7i6W1lOKSEqRU3UVxZ7dJi5f9XHwkINjJzx89EkBsRjBhnUmeIAgn5aPDKb5vgaxQiHdEBQMPJnvJ2RxBvweOIGSgJIPzwVmZdjB4OzGti2LyECA2qZJVZEXisx4D4VsTqF/QDN5rE9pcGox0PWWBM/yBYV0RiFzj/7rigqKhnqKUEgns2rJsJ9adAUAKq/HK7duMdB3y0Jvn4+hIYFPP7fR3MSwrI2jMsjuBKXmGvEUcYlAgOjhkyBZsOd+O195iV7Z+TGHXrF/3bIeToM7K1dsmmxWP5bJvIBFk5wT534+bXJK4MpVD7du+Zql0Vg8m0ZK3LdNNGAShEO0zKqxZNdPd7meJh3sWMmxdbOB9jbtfG7cFPjhiIdzFzwkp2SxsWdulq2UAoQGsoJFjKKigiJgkQVt1qGUwPOAdFoinZJ3GTYtVj2qq9lDXeGsXHEkMju1zYBFcsEgvREMFkY5Q8u9Do7ktMTRYy46l3G88jJDRTUF7MVhJrc3cfx4MVYcYKFLYfjiyLX1Ro9EKbq7OPbuMnH9hofxcYkTpzx89LENzoDt20wYHJgta18ZbylWFiqieposGtF1beEsXLTGmK5qTE3pEuWPJXsJIYhVMNTWcWdeDDsWC8/qwoIBmguG6LVQMD9IKWm612tyOYVz5z1s3ezj5ZctjUo9ZTqV8sNUmgvsXg9uyZYXZ0gOH6iIEbzwnIlr13189EkBw8MCn31pY8UKjs2bTJgmZj/IUtwLUihQpgkegkFt1GQBe+ZLobgvFLJ5zcr648/KZhUoIQgF2fzQD4fDs0MNAgGaDATY8aoqc21TE9+azwv8mODUcYG+foHTZz30XPcRjdMyGPK0c+0SaHFfj06WDGqxAWleQSESodi1y0T/gMDlqx6u9vi4fMXHvq8drFzBsXGDgepqCt97+GAMLUYDrqP3YzRabEriT+CwYpo7fXDYx9j4bQ1SRLe2trcZaGkJ5isrrRvzkmPPto6tFMlLiZ6KCnp5xXIm4pX3f89b/T5OnnQx0OeDADCNp2c1BDM13fvl2JTonyXbXmwhua4zx2soVq7U5a9IVD+lY8ddfPxJAQODPmhAj7s+zOOWVEdKvQzhCEE4vPDttYQAYAS2rTA4JDA2LiCLpT1GgfVrOX71fgSrV4f6qiqDZ+fFY49PzI5+mDEiOKfZYNAd37bV8kdHXYyP3/uI7L0l8OHHNqorKRrqgwiEn/4mKQm8L61nZ5U4yrhJsKqL4xfvBjA2IXDgoIuhYYHPv3TQ0spR38hRXaHJCX1PT+6RewJYusyVTEs4DhCN6I6zJ2LYFMhkJK5e9dE/oCmvqGaPVe1t/MyqLuNMbbVxIWAZ1+fFsEeGp2fv+gCYJlh3l5U7c9aLHzuRvedLMxmJo8ddbNxo4PnnLMSi7OkN9JNiFq30IIRaqmU9U7m2EICblaisZHh+r4VLlz2cOecjk5YYHJb4fr8eEnluj4mWZWxmfJjcKzLV/GZ2sXU1GCQIBPQL5QLm16U57GRKYWBAg2dC6hp6YwMXhkH+YTol/pd4pfA4l968GHYoPDtUvFQGqqrig5zT7+rrxctA9p4gmhC6IeTIURdruh288bqJ9mUcqvj3T7zddIG5o5fWwubawtN98Z3LGPbusnDpssAPhx0kpiWOHvMQDBYQDhFU11Awoskq3AdIMvm+Bs1CIVZmM5ULtDdKiq6JMYGbN30MDvrlfVhfR7G6m9NwWA2l02JitpTQszLspsbKOV1oJMJ6fV99WF2dq66rY03j4/e/Izdu+PjDxwXU1BC0NPPygMKTPvWlQrn18l7h+Gxb+ZbWUzJuoEyM0d3F8d67AaRSEgcOOZiYFDh4yEFbK0NzE0N7m+ZDu1cNrPScpdTeOh4nqKrUUJRcIFJHzoHpaYUrV7VCaGJ6ZgM2N3GsXmXagAz7/uwdz6wMm86RE0ZKklAKh7pW8BdffN7AoR8khkfufVOmEhLHT7hY3qG7hVau5IhECVznyWlhEao3xXRSYioh7y2up55A8//SeugBfMfQ0Y8ixZL3bmtneImauNrj4fJVD5OTEiOjEp9/6SAcoviXvw6gupYWeczuNBadY2s9bNsB6ut1x9lCpIi3t1OPT0h8852D7/Y7SKVnNlosZsq1a2NjnCKdKwCBAIUQcn4Me65fyHWVA6WGVnUHz0sRT05OJcMjo7Zxr/eRUn+p7w+4qKykePftILZsNso3+Ul4SVIkoE+nFVKpewu/LRaKoJ+bIf/4GZSiqR8/B1LESQgBQjGCrhUcL79gou+WwA+Hte70xUseKCWoq9Mz6fE4RSh0p2GX2jptW4vSW4aWpyp58/lcmhVXD5pcv+Fj/0EXl6745b1vGAQN9eZgS1P460iE9idTWpVm3gw7EDDniEXpJ1JZaZxQ0vz7hgbvNaXsFQ/6nZu9Pj77wkFDPUPHMoZojMCytPzKE2HzKHpkPZtM7rHJlO46W1oLvijVNMGcAzBIsSirAB8Qro7kfP82skc6ww3HLKIlhJnCK68EAKJLSJ9+Lor7zMNv/gkIhyje/0UQPETLRCKlg5tSgmBQe/RYbOFaSTknsG0tpHjxso+hkRmDjUaBrhUUy9rJKV/I/8lxyQ1ZFC2YDbg7K8M2jUdr6A6HzYsNDdbfbN2Srr94Mb2i55qvRzbvsTJZhWMnXdTXa2mVbdtMdCxj5eaVhfSUJbXDcFhLurB70LG7nqaIWgLXFs47MwqgGBpns7ql0i5SOuVyCtmsRDqjFUM1ldOMYVOqKXsjUYJoVE/hNTUxbFxvYOsWA2fPeRifkMjlFPYfdFEZ1/rXO3eZCFgAZYDvoZz+xWIEpkGKwnxkQRhmSqF4Ll8M/W+zjbZW03vrjWhm08bIt5TSo75PwBi75958ZMOe6zcqvTqfl46U8ureXaGhbKYC//N/SGFgwHvgLx456mperjhFeysFIaRM5L+Qhs0YUFVFUF1dVFj80bJthUxa0wuBEhCyFJPPy71XpT58Ah7Su93LKgyPSPT3a8WTsQmB/n6hhe8Tep789g6yUv9+abyyoZ6hsYFh4wYD8ThBQwPDtq0GjhzzMDamT+aLl3x8+HEB4Qiwd48FYhJ4SY2vCKlgmgSWOTP5txBL16kJ6uoompspArcVnxobA9M7d9Yd6u4KXc7n5Zyvg8/FUOe6XFdKKWWiudH4etuWYMuFS/mXXNePT07eX8B8YlLi628dVFZQWCawZrWB+jpafpALcY9LQ/nRKEEsSu55KqYzmj+sUFi8tE7P2ioZtBBaDni6X2J4RGJwSKDnmo+BAR83egXGJySGhsUdcksPWvEKivo6htNnPDQ2UhCqPf/te6f3lo9Pv5BoaKLo7OCobdDRoe/rDR+JEFgmKeMvC7Gk1IdSPE5RV+SqD4ep6ugwvFdfrjizYkXs7ysrzQtCzJ0gfUE7YEt58dS0+NZxxMiu7Wad54o9337vlskW7rVyOYmPP7dhBQiiMYL6euPJNK+o+7M75XMKyXSRqoYsLgbPZ9lTswCBm1YYGhI4+IOL7w856LkmMDIs4LpF7yxmQuTZPP9sTsIeUBgdE3osWOkxz9t50KQERkYVzp33cf6Sh00GQTym2Vop0WG9ZaKs7LlgG66ISXGmo8DGBu7/6z+rTLz8YvSk8MWh6WlvUj5CZ8wsDZs88sMjhIKxQKqhvvJoW1v87zhLG319ExvPX3DM+12v6wIjIwKf77MRCGjuqbVrdA9wPrdwls2YZqa8l9F6PmA7Sw0s87GXGQesIEEmJXHriodTZ1ycOevh9BkPZy94mJ5+PEvyfV2ysh8wDqwU4LgKp854+PobHSHWbTUhBMCZBuIMQ88HLHQlhBLANIBgEIiEzcltW6u+61oZ/2psXA4JQUApWxjDJo8IB5cMOxIOIRoJGRUx47epZJBvWJ+rGx5x2hPJB2sO9/f7+Iff2DBNgupqhuVhVgZL5vMU1ddJQBkBY/d2x5RqcGfJU89PFAcC9N0S+OhjBx99UsCFy1psUAj1ROmyRkcFfjjiYssmE9u36oESbpQAuYWPWjTPkB4RNQ2AMT7tC+u475s3CPE4gEciueZP4uYxxsAZ9Rgzxtrawoc++GXd7oItox9/mq4SDxCRc11gYMjHvq9tVMYpfvF2ACtXMjBGkMvNf9sppeS+D3Opjj0/OEYwTJBMSJw77+PDTwrY95WD02e8B7Z3LuTK53XHV29RrjYY0mXWOw6hhY3EdWRAgUIeUBBh23Y7HcduzufdkUcF7p6IYUsp4UqJ6ZREIEgGnttT/cX0tFd9/Yaz+8JFJ/IwhciLl3z8vcwjGgEaG0OIxeaXulgp7UF4Ecy513tLqcsungdALhn4o3pqRQgGBiV+/2EB//i7Anp7xSMrhM7XSiYVhoYFRsckmpq0NrjvPzleO8MgIIQgkwUKtlc7MZF5fXJK3Ewk/LNKwX2U93yy+K5uAkn4At+t6g58+Zd/UZXevu2h+mLI5xWu9vg4flIP0aczqihITubtwgh0zy5juGcjipQ6gvA8BRSbBJbC8jlsXq7D7MkJiQuXPPxw1MWtW0/fqIGiJlZKYnJKwHE0SSJ9gs+21CLLGIHrisB0wmkcHctXT0wU6MREAff6WRQe+/Yv4PvKz2T9vqoq9vlbr8fWpFPeuwMDbu3klCAPAjuyxQaW9lYOzgk2bjDA2PyAWUqXphEIANEwuUPh8PbXZDIK6bSEU0RXF5322CJe3CTI5BSuX/Nx5JiLy1d8zHZSaaEXpRoYTWfVU0kJbpcvEkLRbNaLJKdJJJWS5FH3F533K1SlTU9AKQWlFKz4JyUzxSTbUb3ZnPz/rF9r/e4v/yJGVnQ+vLutr0/g628d3Ljpg9GZVsLHTxWKErkh3T9cEb13jpVKS6RSuguqpLSx5LVneahzAt8Hent9XLvul0UZFsvS6im3hd9P4rmWS7hECyv6qgQeUkZhMQbCWLFa86Of+fHYs9y9hJSmYBSEEJCypH+lih1kDEpJMAb4BeRyOXmqro793XN7gk1jY96OqYSoT0zfTbtaWpmMwvFTHg4ddrF2jYHmJopwRHNZPQ5KLostpTygO5disXszZuTzEumMRC6vqW8NrmWql9YsFiupweguMt9bXJdnmkAwQMEZnjhzZVkyV84cMEIo8jh5/qw8dsnzPuyHFI8YqRQcx0UuV0A2m0U6k0Uml0PBdiClBGMEpsHAOUEmI88mk/7/fc1q4+s3Xw+hrvbBx5HrSpw67eL7/Q4mpxR4SHeKzUtITIqtjcb9owEhVVFcXZUPsqU124BON5w4joJYRCciITPtqIZBnmj1QzOizmitKaUlpnI54ebzUuXzEvf6ebIe+7ZakRACnudBCAGhJDhnME0DBUcgkcghn7NBiIAvaToYstLr1vL/X1UllVMJsdt25HLP0/3Zzo9aAX0fuHDRw2dfOmhvY2jrYGXeq/mobZumZqYMhQjy+bufrudpEE1KLDEb/lSAPQOoqqSoq2UIBMgT471jFHAVMJ2SmJgQKBQUDIPKaMzIVlVZGULlI7ep83k/fm4LyymlunFdAYxqtZBEwsG160lk03nU1gZQXRNERdxEJOgeUNK7snWz8d9JJZfnMhJDwxIjowLZH3WbpTMKFy96uHDRx/r1PuIVFMEgvWPi55FBHq77xaMRCtsWd4BzSmnDfmKjpD8pd633RChItaIKWzwtfKGQniisqqSwLHJnrr2QgCIjUEpibEzg1oBAOiNRETOcxsbQ+LKOYCI65S8Sw54F+iiERC7nIZP1EIuZYIxZ4bC5nhHRFA6Tqh3bjZauLgYlFU6e9rDvaweXL3sQt9WOhQAGhgQ+/UJTKr35RgDRGgI/pTTLyWMYHGMaFQ9Y5J6D/qmUQiIhUV/Lluaz5wRkaA9VU0vQ0EAxMEiA3NNHxTkHamspamspIhFSZild0DHh0hYNEnCb4Gafj3PnPaRSQHMTz1VVha7V10X7CPHEM2HYpSF202SwLFac7JHrbdv/UyXE25Ri9crlDLW1BqJRiuZmF1NT+kSbStw5Cy2Ewg9HXNRUM3R3GWhu47pF7zFnt0kxz9bI450C97JInzQ5KeF2qHIevlTymsXydbtmS7Mm0rh4iSAx/fQvKxqhWNbGUFtDwTieSPPR7f6iUFC4etXHlasaTayp4elw2DpvWcHeQICJxVHumoOBc06rAgH2X09NOf/Xy5dTvygUCmtamilpbGSkopKCBik6Oxj27jbR3cXvynu09jNw7oKHr791cPmSB0KAYIT+OCt4BMMuDoPc47qzOY2M+8W57KU1S7v2FTgnWNHJsKqblyl9n/aqqaZYvcpAXR0rWx1d4JkAg+sBk3xG4foNgeMnXQwMCNTWAN1dPBmN8IOU8V7D4L5pctzrZ1F57GLdl1OKsBB4tVCQ/6eC7a/2PRfhsIGGBhOUEth5BcOQiIQJdu00cemKh7PnPGQyd0uOj4xqnabKOMEv3wuiZRkth/2PbNz3GQBQSjfKpNMKnr8Ens3NsPWB2dTEsarLQFsrQ98tTbP7NCOe1laOTRsNNNQz+N6dCPVC2QClWurq6lUP+76xceacB8cF1qzmWL/WSFAqLiaT9nSh4D/y5zwRwy6VhoJBjljMqI9F+V8PDPivjozmO1cup9i7x0RbGyvL7CilT/hwmKJjBcGqLgMNDQzpzN1fNJ9XuHLFx4FDLlatNlBVTWEaOuR/lM4mQrRhk3sMZiulPy+T0Y0ES4QLc4vSCNHz142NmrLoRq+PgX7xVAUPmxop1q42UFtDdSnO1c1HAUvjLfN16OgotZjmmYCTUTh81MXvP7QxPCxhWQSruoNoa6NqOplCLp+D798fnl+zcREYtmFQACo0NpavGxzKvzc47P51Pi8aQkGFzuUMmzaaoBaQT6lyTqsJ2wEzyLB6tYGdOwykUhJj4/KukDyZkjhyzEVjkyae27DOQDT6GPnvfX5HSmB6WmJiUsu/LHnsuRu2kpoE/9WXLYxNSHyRtTE19eSL2pwDlZUUq7oYOpcxRCIE4+MCk8VraWxgiEbxUBG/2TqLUreYbSuM9AmcOevhk89tnDylZzyWLze9tWsrxpctixwbG/PcQsF/rKiBL/TDBICKmIlszl9x5uzkXx0+knzjRq9TvWYVxbtvB7BqvQnPUyDi7pshhAJ1FBrqKfbssnDjhsDY+L2HXcYnJD7+zEZDHUPnMo6KCgpK1R2UtbM1aiVntLJ/HHlMJ/WwwO3RwBKANvv94NkK4QjBzh2GVl094z0Vw45GKNas5uhYxrWel1BIpRX6bglQgnL563FLXyVPbYYopKswNSnw9TcO/vkPBZw8rQEzzoCWZp5uqK/4+4b66v9sGO6U7z1ePXVBDduyKHxfRsYn7PWXL2d//cW+qT/r78/VtLVb2LHDxJZNJoKVDPlpAeXf/T2EACAVGhsoXnjewvnzHk6d9mDfo+XUcRRu3hD45HMbVVUMr7xoYtkyBkp1Q8lsH45UOv9xvbt/R0qdY4+NSWSycqmf9BGW8BRMA4hUaWC0t08fkjd6/SfaytnYSPHKSxbWrzPAuSb8cBwtOs9okYrpMVKtElGDaWgpoalRgUtXfJw54+IPH9v4dr9Tdjhr1hh47eXoeGtr+CvLCl2qiJmQjykUxhfqZFYKCAUpcjnSef5C6t/u25f44NhJp2L5chN/8i9CeOX1ABQANyvKXu9eoa8iCuEoRXsrQWcHR309Qf/A/U/Rc+c9/O3f5xEMAq2tweKsq7ojgnigYUuFgq2Kh4e6ZwSSzmgaW1VsiFny2HPLcqQERF7ntx+8H0AyJTA8KlDIP7mb2NjAsHWLifZ2rnEdqdFqXqyGPKqzLO2H0hgmAgSFtMTZ8z5+/2EB3x9w0Nvn37Fftm8N46UXK8Yr4zSdzXrwffnYzKh8IYzasigIOJuayj53/kLyT373h+l3z53P17W2crz7dgC7dlqorGZw0gK+++BcVUrN+RyOEaxdw7Fzu4WC7WB8/N7uMpPRQn9Vcd1osnunieY2BlGcpX5YWO55QCKhp7ju99p0WmFyUiGT0pQ2lrHkvOe6R3xf57hbN1MkEgFkswoHD2np2wXNrQ2grYXjuT0W1q42EKuiyKclSHFsNxgk5aGgR8mjzSL7iutonevRUYHjJz2cOOnhwEEHN/tmkvZ4HOhaYWDdWv5dTTX7W8Mgvb6vit56kRl28aRigGq/fDXzR5/tm/h3PxwpGOEwxQfvh/BnfxxENErgZcU9pUzv9X6+qwXRWls5du80cbNXYHz8/sQSwlc4eNAFFIHBCerr2QNPwNs9biYrMTkpkM3KBxi/wlRCIpGUqIxT0AABxJLLnothi5KoOyPYsskAJQRKAv/8YWFBJ79qayheednCc3tMxKIzz41xbZSmqcdL8QhRmJTaHj0PGBuXOH7cxTffO/huv4vhYYFsTt6x11Z1GXjnrVC2vp79bWJa/m1VlfJCofmh4JoHMsPSlBOBYVAYBkMqmV55/frU/27fV5Nvf/tdPhAIELz+agB7d5tobufw8nJOaKMotvi1tjJs32rg+/0OTpx68MZJJCUOH3VhWZp6dttWEx2dDEoUaY7cGb1jzjUVTnZa81ePjcsH3ljHBRLTEtNJiViULlhr6e0qKFL+NA2cMaChgWG7QeG4CqYFHPrBQ2+fP++fF7AINq438dZrFjZvNRGyZlBvxggo0RhKoaDLXg8DRykFTJOABglgK0xOSVy+7OPKNR/nL3g4c8bDlR4PvX13RiGcAx3twEsvVl18/bX634VCbB+lhmOaZnG8mT4Zw5YPEAYuiZgBAAGlhEjzZm/q9W+/H/3rA4fSoelp4JfvBfCXfx5C10oOVawTzuXCS0BCrIJg2TKGZcsYApY2sAe9z+SUwKefF5DJ6pzYMCyEQxTB4J0i5ozpwZJbt3ycO+eVSx4POpkdpzR5tnDjm6WQdUZT6qc1eKLppnSraTxO8MrLFqoqKcKhAv7wscL0tJxV+jSbAzISIehaYeC1ly1s22Kgup6ikJTwigbM6Ew5M51RKOQfjoZLqVtCqaMwMipw5aqPI0dd/HDExekzd8rh3n5Qdy6j8pWXQt4Lz9d9vHJl8/+bECQKBb8cVc7HfpqVYdt24QE3jUAICc91IaVXSaj6r48em/jlJ5/lQv0DQGcHx97dJrZsMRCN0EdqsC+/ngGRCEV3l4E1a7RMai73YO7oXB44cdJDoZDH4LDA9q0Gtm42UVPHtOBbsSXfG5c4fNTDdwfcWSlOlOiIF8pTl0J+x9HNOlooDuV54Z+a56YEiEUJ1qwx8Od/StDYxHDkiIsjR10kU/Kx3391N8cH7wfx7jsB1NQyKO9OQFVHXUTf86KE0I9lk0uHayBQVAjxges39QDHD0ddXL7sYWBQYHhYR3P3uo62VuDllypG336r4aNVXZUfAUjoScEZkpJ5wRJm8yLHcR6wwSl836e+l68YGc68fqOv8H/Y93Wm8fxFH9VVmjL4+b0WquoZ4Cjk8o9OAqg8HTZv2mTi9VcFcjmJqz0PD9kmpyS+P+Bo9o5bJhIJhZUrOWprKISvyZ1PnvLwxVcOTp32HqoTZhpARYwiFiPzNgf+40NDSk3FlEgoWCZQUaEV636KCLwQgADAlK4fv/CCifZ23Y8QCROcOadr3XYxSprt/bZMLdK3opPjvXcD+OCXAazaYMDNSBSyP7qJRUFAr1j28ryZLsjSfi0RehQKwNSUj5ERiQM/uPj+gIMDhx7sEIIBgvZl3HtudyD59lt1n27ZUv8/hkPWuVzeu+Mz5g0knI/T1jBIsCpu/PLaNfKvPvq4UHW6WHjfvMnA669ZWNbOIG0FKR6P2dNz9e+vWsXw3ISJEyfdWRl2aQ0OCXzxlYMrPQItLQzVlRSggF1QuNXv49Ll2RHsWSZQVaX50Sglj11z/PFiTD/oREKir1+itZmisZGAcfKTLqtpNFpBeATVVRQvvWCivo7i8mUPJ095uHDJw+Wr/gMVPm5fjY0Me3aZeOlFE8/vtdDUVNyH97I/SkCJKiuIuJ5myymR+gNAIEoAAQz0S3z9nYv9BxwcP+lhfFwg9ZCooquL4s3X48ldO2v+Y3dX/J+lVNdsx/dLh/W8o/+zCw3J/UJGYlmMFwqiu7fP/eWhw4XXDv7gwHWBlhaG116xsHuniapKioL9+DuyBHTEaxk2bzTw0gsWem8JDAz4mu/7oSmFQv+AQP+A0LK5IQrKdP/3XNQ8LYugspKiIkYhxPx57FL903G0jOzQsMToqEBDPUUwSH6yINqdaLlGzC0TaF3O0drCsHEdR3cXx7kLBs6cc9F3S2gPbuthHFlEtku62pEIQXMTx+ZNBl7Ya2LnThO1zQzKVsjfL2KkpT2iAbR8XsL1dLrFLR2W51O6kebgIRd/+MjGocMOsln1wMirsYGjqYkWlneS62tWB7/ZsL76P1RVBS4mEpomjHO2IPfy0amRNGhEo1FWMTkp133+ZbL1k89T8DyJmhqK5/daWLvGKI/nzauncRSCQYIXnzcxNCzwD/8k56z3JCWQL8hi6+rcLZAxzYAxn2wbGlwhSCa14uTUpNQSv1RzqEuhfjZVNd8HVEZCSiAUptiy2UB3F8dLL5gYHJLo7fPR36855gsF/QyCQSAWpVi5gqOry0BrC0NlJUEwqKV5xYMixmIfu+No4y/Y+rCnFoER0p6657yPjz528Pm+As5f8O8Q+bvXikSAt94IYc1qc+D6zdx/MzHhH8nl/LFIRN7XrJ6oYct7CGxRSuD7SkxPe3uvXEn++tvv0519xRLFiuUc774VwKZNBgxj/oXsXBcIhgi2bDGRTCmMjEocPORgKjE3457rdZVQzeoqiniMglsE3jwqRmiPA0xMSJw77yExJVFXr3m4fm7zJiUaqhJYFa3QYGeHBNalJEZGOUZGBLI5lHnxLEvzwre1MTQ3cbAQAXwFz9Ekig8zJFXcE64LOLaCFDotsnMKQ/0Cn31u47e/K+Dsefe+e8c0gOZmjvp6S6zqNntffD54MxqVXw0Okt8VbGX7Qs176vbIhi3uYdicURRs3+jrS7966sz0ayOjblm2e8Vyjg3rORoaGFxbgdL5/SKl5oZgiGBVF8c7b1pIpQUOHnLnZRrnQYYdDlM0NVJUxCnAS3RP82XYBJQBU9MSPdd9WCbBmmqKcIhAyDtLdD+HVQIKPa8kdD+DZNfWMFRVUpSatEp0Q5TqmrTtKNDbkO9ZeUeiXyyEKiuUcAaMjEjsP+Bi31c2Ll72HvgcamoI9uyy8MLzVUPLl4c/9Vz7H3tvZs47jnLpExzznV0ofhvuX7pJkQhvs23sOH4iv/vb73KhsTGJQICgcxnD1k0GWpoYeJDAvQdY8bha16WWP0J0Lv/66wHk8gqODZw55z00RHocUKu+jqK9nSEawcKMbSpgYlLg+k2BrhUcTU0cFRUE8mcuCFguSxUZboJBAmr86AEUO79KMrpzxSM8Vx+qY2MSiemSlye42uPjnz8s4MQp756c97Eo0NVlorUlqAKWf6gyTo801BsD7a3W8eER97DnyyeOjcxZH7tklARqUzYn/83Zc37bxUv6qltb9BTWhvWGrgveB2F+3A1aOskLOd3c0NHJ8OrLFvJ5Pbxx5qy3IEbAGEFbK0NHB0cwoMO8+cyvpVSwbY2GT0xIdK8kqK2lCIcJlFRLgya3AWy+r4DCg2GguewlneIpTExKDI8KJFNaGCKd1mqcPxxx71mbjlcQrF3L8fYbMWfL5uiNnmu5/3TmbO5/HBn10dioqyyUkifeWDTLzjN12+amkFKhfyDXcuZsZlffLTte+rfaGoqd202sW2PAMEgZaS4RBBpm6WRUZRT7cWp4t2/05cs53v+FnhgzDODsOa23PN8pQHsbw5pVBiIRCjmPbJYas5DIZoHJCYmpKVlkkdH9y7a9ZNWAbmSRCjpCcxQMrhllDfPx6LAAwBcK+YJCLi8hBZBOSyRTCjf7BBK34TeMAau6KVavCmFVd/RqY2Pg45XLzf54hUxcv6EOzTtYvHCGPfPflkkMRyjr3MVs11ffTNWMT3jlyZaOZRxr1xioa2HIpySEP3Mi2rZCJqsNWilNbGeZZFY6RA86bX0f8NIKoRDB+s0mGNN1ZsMgOHNWh07zkXdTqonvurs4ulZwhMNk3oYVSvcvlwPGJwRGxgSSSalDQSzxl/84HZI+kEgoJBICsShBdTUD44+vCCOknkuQUof700mFvls+btz0QYkeFIlGqFqxnOdfeD6c3bUjnF+3rvIPhhn5b13HHx8dnUYyKR4rgniihq2UKmtwWQHeSih7fmBAbjlxwkMyqWAYupG/s4OhMk4AqoN30wQoI4AChoYkTp1xMTYuUVdL0bmMoamJFckY5qfGbRCF9jaOt98MIBalqK+1ceAHDxMTj49umSbB8k6Ozg6OqhoKJfQU2XyczIToeqnjKIyPS4yPC2SLh+C9uNd+1h6bEiilVU9HxwSEoIhECUKSPl6PtVI63ZEaPS9FSf0DAj09PqQC2lsYPngvRtasrv6irS34+4BlZwsFcYNxNb4YvPScDZsV3ar2kHLl9LT7r3t7nfWjY/qbVMQI1qwysH6dgXBY31zOdbE/MS3Q1ydw+YqPG30+OAOCQaN8pM3HyUaIzo9cFwhHCNZtMFBXS1FTTRGPO/jmexuppEIq/WggBmPA2jUcb78VwOpVBrhF4Be0/tTtipuPxWdOdTtjKiWRTEnk8wqplEQiIREIsHKY+XPPs2kxwhsfF+jtFWAMaGpmj9+WeRs7qRRAJqvQ3y9w5aoL11VoamTYud0ce+Wl4Nl162r+JmCF/tDXN4apaQeUCRAsfG163g3bNDUtMKUE6VS2+saN1NqpqUKk9O+GQdDextDepkMigMCIUCQGBY4ec/GP/2Tj2g0fGzdxvPmahXVrDbS3spJe9ryFs4CuP1Kq9be2bTPR0MCwfDnHgYMODhxyHjg0cr8VCVPs2mnhrTcCaG6i8AoK/m34QelHzgPZvCpyrvm+wvS0wuiYRDxOEI7QcofVz3mVRmQT0xLDIwLNzQwGI4/srcvgmQB8odt2XU9hYMDH6ChwtcdDSwvD9m0B1FWrDycn3f8hMeX2V9dYkEphsXYYzMqwDYPDMBhhjASuXPFbfjicbrh5cwaZisUoVq/iWNltIBojcPISo0MCX+xz8MlnBZw956O2lmJVF8e2LSYaGxlCYc0fPt8czn4xr7cs6MOmnaGhnmFZG0NTI8WVHh8jIwKptA7n7pd/l0b9Wls4dmw38d47AWxYb4ARjRfIYlmlBBAahj7gONPgzlwjAyl1+FddrXvQFYBrN3x8f8BBJGxh3QYG6al5b/Z59pJs/WympiUGhyW6M3Je6vv6MC1L2SrXI35VFXdXr+behnWR0Reej/ZIIf82nVYnQQw4joAQctHiH7MeAmEMJmdoHhuXDWfPe2JwWJVhr8o4RUsTQ20jA6cKA70C333v4D/9XQ7HT3rYvt3AX/6rEHbtMNHSzCAVYOcXRtiu9H6uqzEBQGszvfWmhVXdDJcv+zh20sXFSz6uXPExMiruuTFiMYoVKxjeeTOAN14LoHslh+cqCKrflVLA83V47/sKoRBFLAqYJgXk3GqoJUaRUJCgpYWhsYGDEODWLR/f7XewZjXHuk2qHIb+vF22HrW1bSBV5J5zPQmltAgkIY+Ge0ildeUcR4ISIivj3N69MzL2/N7AWENjxRdV1ZF9nLELnidgcAbbdp5IB9mCGnYikUEkwhsDFn1jdMze1XPNJ66r73HA0puxuZmBcyCTUNh/wMHf/yaP4yc9xKIEz+/VYWxjPQM3dLjs+wubj9ze0BAJE9AQRVUVRXMTQ2sbw9bNAjdv+hgelZhKCOTzM2hoOKy/U2cHw+6dunxnBQjswp0Gy5j2srmcQjIpMMb1IVdXwxCNkXK9dTYhuhC6dbKhgWFZO0dtLcX4uMSJUy4++pShukrT5cZrGPxiH/PPMt9WGk8ZGxfo7xeYmNTDII/qJG6ffbdt7bVdV5GJSZ8BZLCrK/jPDQ2Rrz0/dIkxruWhXR/5vL2ob9OsDDuZzMJzaYthkremE4VN2ZwipY1dU0PR1soQi1H4eYmLFz3s+8bBdwcchMMUf/RBEK+9bKG5UXvqfE49UZBBKcB2FIirDSEcpti80cTGDQp2QTcgJJISmbSCJ3QIr0soFBVRikBAc2CJe+TmAUtzqhXyCqOjOryfCEtAAcEQh1KzM+oSKGYYgGFStLYyrOrimJx0MT0t8fkXDiyT4M//OIjde9mi9hQL6qgBwFfIZnX1YGREYDop4Tp4LMMulWNzOZ1i2Y6ivX128Oo1e7q62v04FPb7CfEI50oJIcrI+TNv2JWVUQjhhcfHMyvHJwvBEuDFKEFLM0N3F0NDA8XYqMBHnxTw3fcObBvYuoXjF28HsX6dAWoA0sGCDJXPNoelVI9cGiYATlGhFOrrgIKtmx2E0CyWAYvAChCA6e4y+z4zvKSI/ldVUgjJgEGtxLn/gIv4BR/tbQydHRzxSgKYBLKgylQ/9zL20r3p7mJ4840ARsclenp8DAz6+PIrG66rkEwrbFjP0dzMIH09M+x5T+++PjHDLiZWwtd0ROm0RCYjiynXY6DsVL9zNqeQmJblpiYpCOkfsH3hJ6Y8ERSbNsYQDpsoFDwoqSAERyDA4HqqrHDyzBl2Y2M1HRlNBfpuTYWHR5wywwelQFsrQ1srg/CBM2c9fPqZjVv9AtFiCL5zh4maagI7p57q5rt9oEB3vd0ZOdyu/iglipxXD6ZdKpb2EY8TVMQ5AgFNfn/imodzFxVWruBwHIW2Vj2w4IsH85aVRkDbWhnefD2AgUGBwQEBx1G4dt3H2JjugPr1r4J44TkToSJ/25OMgJ62xy7YColp7V2V0vV/xkgp9X7k981mte55oaANNV7BkM/77OTpVCwcCaeXtVcBADIZF0oq5HIuslkfKOb0i00rnc/uVGPRbJZEe655xsCAvCN/bahniEUprvb4OHjYQ1+fRgrXrjWwqksPMBCuvdViXbTYUHM75eycyBaLut/VVRRdKzkCFsGlKx4uXfZx/ISL2lqG9Ws51q0x0N3NEaos7oKi0okSpVJZaVNRdK8keP8XQQgfOPSDi0tXPKTSCocOu0hMSwwNCbz4ooV1azhCIVIm1vupGnnJeLM5PXufy0lQCoSCBKHQo3edlcukjm4n9Tw9fxCJUFRXMVBCMDWZw4ED/bAsBtcVRXDWQzpdQH19CLW1FJEIQypJy87jaVcvZmXYruuumZx0Oy5c9PjIyMzd4xyorqaQEjh42ME33zpIpRWamhhe2Guhu4sDUFD+4t0wpaGCx1mlkcJgkKBjGUdbq+7ASyYdHLzm4fpNgb5bPvpuCfQPcrS1ccQrKCxT99BzXpKE0W7HNAlME9ixVc+zSwmMTWhvPTIqMDIqMDkpkUxLFAoBrOrmqIjR8ub+KYJqpBgl3rolcPK0i4lJCUoJsjmJVEqippqCMADe3N8X0HzyJY9tmgQVFQwtzSbiMQnHdXHx4ugdjLQKJaouhkSiAKUocjlfM/OEKSyL3Av3W1yG7Tj25lTaWTU0LMzbNa2CQYJYjMATChcv+7ja40NBoa6OYlW3gaZGdgc5/E996Zq89rptbRz/8te6dn/2vIcjx138p/8tD/YPwPJOjlXdBtau5qivo6ivo4hVUIRD2jhLtXFuELQ0MmzawHHjpoEz5z0ki0wxN3p9/OafCkilFP7ogyA2bTAQryQQvgaCfipeu0RuwTggPaDnuo9vvptRgum7JXD9hkBnBwcNUFBXzKniQoodfZmM1u3K5SU4pwiFCGJRbfWWBwhB7qKa1umoj97eKQwNEdi2B84lWls4qqs5OGdgjJYFJoWvnphxz8qw8/nCrkzGWT+dFObt3kABuNmr0eAzZ1ykilIp7W0cq1dx1NbTnzRH170AutJmrKqiqG3R3XgtrQxCAYWCg8tXPIyOSZy/4ON4O0NTA0VTE0M8ThGNasOmVN/cUJjAdYCBQVGm6C2tXE6h55oPx7Hh+wqOE8SeXSYsi/ykPDeluvFnbEzi4iUPX3xp4+gxF/mCZhm80qMNvbGRYkeMgherC7Me/Ck2vExOSvQP+ijYQGWcIBAoUir5WrLqXnCe7pwUmJzMQkoFxigMA4jFGJTyMTVlo8RCGg5TRKMMJqdgjIJz/cMWiMN6lrziXrvviUbGZl5PiCYB/PZ7B4ZBMDCo41nTAOpqKaqrCKwghZ2VPyvjLoX3rqvAiyWYVV0clfEQXnnRwpFjLg4fdnH8pIv9B30YhiZVNC2tzFhSaSzllVLqcl02K+9JIDE6JvC7P9gIBQmaGhja2ikiYT1Y86x3qZXICalBcOWqj7/73wr45nsHuZJ4nwJGRwUOH3HQ1ERRVU2xspMjFCbwM7MEaykBpQrpjMLYuB7XZHcAnOSBz5lSAstid0QYQgATE3kkEjaE0J1x1dUMDfUGgkEGw6CQgoEbrDyH8VQMO5Wy2/J5rwpKkTsNHrh8xS+juYzp0k9jA9X61MbcgaifnHFzoKqaoqqeobtLs262tegmmXPnPEwldD02mXq0m+Q4CqNjAp9/aaOqkuKddwLYtFGzpz4iULxowm8rSDA5LnHlqo9/+McCPv60gPEJ7SWqqyg41xpZl674MD+1YRkE7/0igLVrNR8AgAeyzxICKKGjn5FRgZERHRlBodx0lJmjYyKEQCkJ3/chpSrPWAAE6ZSLS5cTCAUNCCFBKQN9RL6kV9+aB8NOJt1ILucTKWcM+165cyBAUF9HEa+goM/qrprnDSoEivKw+vBraaaofSeAF57X2tBXrvg4dtzFtZs+bvb6yOYUctm537hrNwQ+/sxGRyfDmtW8XIJR8tm8byVvee26j7/9z3l8+KmNiUn9ZRoaGDas4wgGCY4c9TA2LnDxoodQgKCugaGqiqKulsEwcF9a6pI9+QWFqYTCxIREJqPvu5AKqZTA+DhFNifn6Jh+vPHVbXaUw83evBYgvOu7PgXDnk56wWxOkB9/wR///1CIoL2do6lR54pL2rJ33idKgWCQIlpJUNOoh1PaWnXr6tiExPCwQDqjlTzzec2SyXkxZxS6FXdwWKDvlsDwj+RmXVfh0mWtHdXdxdHexlERp/CcZ6f1lFE9v28Egakxif2HbPzDbwr46BPtqcMhgq1bTDy318TmTQakDzQ1OvjqGwfXrvv44YgLyggyGYk3XrWwuttAKEYAT9e/b78PJYPK5xXGxwUmp0TZM0upNdAnEz7J5x///pVKqUL48D1RngpbSChtVoadyUpSsB8ekgQsgsZGhpoaPZK5JC17N7hWKCjgtly5uYmhpVnPW7sukMtJpNKa27rUu17yPIWCwumzHg4edvHDDw6GR+QdyiWuq3DqtIflnR5iUYrqOgbffYZ6ym+bqz973sN/+rs8fvcHG9msRLyCYsc2E7/+VQBvvG5hWQdHalqiqZnCsoCPP0GRzN+BbSswAlBCsHw5A2N3K6iUCBtSac3hnkrdqa7JGAHnRHI+b3JaYIzoIaHFgopnc4IXbPnQb8iZVmEIhR69E+jnFKZTqu8ZM/STsBRBNEpQVTXTJloC06QEfE+DMKtWG2hvYfj0CxtXrvpl5kzHUbhy1ceFix727jGART4NVurcM03A4ATgwGS/wDffO/j73xSw/6BW2liz2sCrL5l4bq+FXTtNtC1jAGeoqKPYFdZNIY2NHN98axdF5l0kpyVOnvHwxmsWtm0xsbyTgzEUqYVLlQeC6YRE3y3/Dk4zK0DR3maptWvMXDot5bOIEc2y3KW4O4uQjjHttU3z5wuazSU8L8nZwJ3Z6iXShpJ+1+1hvBUAVq7kWLnWQG2lbpfzvAIuX/HL5a3JKYlr131MTirI23rIF+OzoGSm8SSVlpiY1Jrmf/O3eXz1jQPLIti+1cQv3gngg/cDWLOagwcJ0lNK92wrhYoKiq1bTKxYwdGxjKG93cGXXzkYGBLIfOUU5Y51iF8V106ntFelAEbGBC5e9sv5u8aKKDqWBfwN60PZREKoZ7GqM7vOM0eR2ShelIcsDFJEB5cMeD5y8zvCeaFAJdDezvDeO0GMjQncuOFrrfDia8bHBcbGJbJpCQpdRvMXYVoUDBAgQOCkJXquC/z2nwv48BMbN296aG1heOWlAN54zUJ3t+6L4GEKuApDQwLffGcjMS3x4osWdu/Q5B2vv2Jh5XKOndtNXLrs4WavQDan8OU+BwODAps2Gti43kBVJQEsCuppsfqeHv8OFRlGiYyEuRuPm64Q/k/YsF0dBj5sa3BDy72Gw9qbyCXw7JGM+UEHohAKxFGIxih27TBx/qKJ/Qdc9A34ZdbUVFphZERgakKiqoqCBTT4tphSEEqBfF4iNQacPuPi+wMuPvrYxs0+H8s7OT54P4B33gpi9y5TCwMIhbEBHxcuaoDw409tjE8IDA4L5HMKK5ZzdLRzbNrOsGGdgVsDPk6f8XDuvI+hYYFsRqPejqO7x3wHmJ6UuH5Ds5De3iOgFIQvlO150vU8+dM1bF+oWdHPmCZBvELniZTMn4j30rqHJ1cKhAJ1dQwruziSaT0yWgLpUkkt7RqPE80UuwiuuaRNZph6jHW4x8O+rx384z8XcOqMh0iY4k//OIiXX7Tw3G4TtTUM1CQAA8ZHJfYfdPHJpwUcOqyla10X+PhTBxMTEi+9YOH5vSaamjjqaihaWzgiEd3abBd58AJBgqpKioBFkUpIXOvx0dsrkM7cabm+LzGddMTYGJHT0z/hULzIA/XwN+O65BWwFkBhc2ndZSiEaJGGFct5Ma+WxY0JDI/oYZHmZqaHIzDjKUkR2Sw914V+TpTqQ7/UtNPf72NgUODgDy4OH3Fws1egqZFh7x4T/+JXQezdbcKKafK4kQEfQ0MCBw+7OHBQa1JPTs1sxuFhgc++0Mop12/4aKhnWLGcY1k7R3cXw5pNxS4pH3DyuhXQDBGMXPPw3X4HZ855d7WfGgZxDYMPmoYxYppU/GQNuxyDP2QDkNsOAbbEz7Wgq8QYYpkEFTGi89Xi8nyF8UmFyYTmYyt1C5VkenVzxoxxP5HQ2yJQrsJ0UuLAIRe//6iAU6d9hELAc3tMvPNWAOvWctTXM1hBArgS6bTEiVMePvvcxnf7HYyNybu8q04VdRnwylUfnBO0tlLs2m7h178K4rm9uqeiJLVrWQCY7lg7dtJDb9/dOUo0wgv1deHrLc3R3mDQ936yhs2Ybh6YzUO8nWd7aS2gx5aAKvK51dcxRCPktjxcy9Ok0xJCAqCAwXWTRrqYazKm2zIr4hSsKJvjzkPNu/T8TZOAcgBSc6Vfv+7h7AUXFy76OHfew+CQQGcnw5aNBt54I4C9u0xEaxgAhelRgROnXFy+6mP/ARdHj7sYHBQPPORyOVWmlrZtiTXdBvwi4FuKbgJBAs8Bxgd8HD/p4vRZD5nbDorStVfEWDYasc5GIsHzjus7zyIV1SzphzWt7kP1hZdC7ydn2MX/sQKaweVOBhgF11Moj9gWy12jYxJXenwMDgqYJsGqbo7ulQYiYZR11eYl/y9eA3yCXFbhZq/AN9/pMtTlq5rgcu9uXcbasslEfQOD6yjAkZickjhyzMXv/1DAocMubt4UEHM0rK6VBrZsNjTPniwJ7AKEaSXTY8ddHDvhYWpK3JUyhIJAPE4LjJEbniD9UhElf6p1bNOCbqKYhWHLoo4zXbK9Bc6xVfnQDQQIDON28EerRk5Pz+RQY+MSX31j47MvHCSTEowRNDRQbNpoYv0ajs2bDDQ0MNAAgXK0PrT/ANHBkncr6VEzA4Ch5ZycjK6l91zzceq0h6s9PgaHBAgh2LndxLYtBjasN7B7p4l4vSbjyKQkTpz0cOiwg+OnPJw65eJW/6NB+c3NDJs2GmhsphqwCxIwD3BthXMXPPzuQxvHT7h3iUcwBtTVAS0t1A+F2AghTDImn8kIdFaGHQgQaZqEPewLej6QL+iSAg+RpZD8CSxCcFc05fvA5KQmDlBSh8NDIwIHDuky0e3r2AkPz+02kckobN5koKlJk2Nw/vBDvNRk4ziaH44xgkRS97wfOeri2HEXR497SKUlWpsp3nw9iLffDGDXdrMM6BWSAmNjAhcu+Pj4Mxuf7bMxOCgeKffXc/AMa1Yb6FrJUVFJkc/oAZzJKU1X/PW3Dr75zsHQ8N2HBmcEy9o5OjsMxzBkPp/34Xk+frKdZ8EA9U2DMvKQQUC3CI6k0xKhICtT/SythVu02KVG6Y/IGAsK6ayeBVa+zrkz6bufRX+/j+88heERge6VHNu2mli/zsDKFQwVNez+oZcC4Ckkp/UQRc91Dzf7JE6f8XDjhoeRUQnOtRrLurUW1q42sHmTgdWrDJgV+k1T4wInT7n4br+DE6c8XLnqPbJRa9CLYMc2A5s2cN1LASCblUhngJOnHHx/wMW33zsYHZP3PRna2wNob+O+beflwKALIeRP17CjEeYHA9J6qMf2gFRS8z6ruiUQ7UksxnRn2e1ViNJI7fS0RGJaormRIRigiMXutlIhNEPLwKDA4SMuLlz28PxeC1s2Gujo4IhFtT63ui1/9jxN/JdOKwwPS/T3+zh11sXlKz6uXRfI5yUa6hm2bDHw7lsBvPySiRWdHNwkcArAcJ+HfFbh+CkP335vY9/XLvpuPR4xHudAdzfH229a2FyUU56e1JjCufM+vvnWxoGDLiYT9z81wmEqO5ZFssuWRc9PT/v5QsHV2lw/1VA8HKbCsshDKVZLG0rL7qrHkzVdhCHvYgIJZ3rICTi/d9qTKobFa7o1wUNd3YMfYL6gcO68j5ERif0HHDQ3cTQ2UlRX6ZKRVIDvKaRSChNTAqOjEmNjEtNJiamEnv5b1sawYYNuFlm9ysCK5RwVMQ2+5tIS/YMSR4+7OHtOD2sMDOr3edwViRCsX2tg+1YTze0cxJPouyWw/4CLTz63ce6cp+mUHuTAwsSrrAwfqK+r+sw0/UnbEc+sgvGsDLuigrvhsI+HkT2UhM1+isJxpUaOxVLOKxl2IEAQj1PEIvSuYY/JSYlz5z1sWGugvl6rjtbWUiQS8r7PKJmUSCYlrl0HAA91dbpbizF9D1xXq4Ampm+bhrK0cETHMoaXXrCwZ7eJ7VsNRCoowAm8rIJUes783HkPH39q4/uDDiYnHt+gKQXaWhh27NAo++puA4EggePpfwsEiGaDNQDu3r+1trmR4+WXo4mO9vBXlhX6LhYVmWDw2e2JnqXHNlzL8h4qGaqgNaNLm+an4K9LxuL7ClIQMP5wYOlJGnYwSFBdRVBZRcE4Kcv7AkAmp4UGBocE6hsYWpp0V9YF2yuzhTzkUzA9DWQyohy2/1gzbOUKju1bDTy/19KKqys4olEdRaQSGn0vIee2DQwMCdy46WNqcn6MJhqm2L7NxB//ixBeeN6EYQJukc5oxXKOYJCiuYnisy9sHDjkou/WvS17964g/uiXlZOtbUZfJutlhFDiWZZSml2OHTWHg0EvSghCeMCUr+MC4xMCieniw6c/HcPO5xUKBYVwmCASJk9d+aFkXMwkqKigqK6miEUIppMzhpdMShw77mLbVhMbNnBs2sjx5usWpqc1j9hs1oxyysxB0lBPUVvDsGKFLpOtX8uxdbOJmmYGgGBq2MetWz58XyEep6itZYDUv7uik+GVlyws72QYHZNIpRSmpjTRQX6WohKGoZtr2to4Nq038PZbFp7ba6K6kcFJS/iuZjANRwi6VjJUVwUQi2q6pMPHdFOKUkAwQBEIMERjbOqlF6PnOzusj02LnvU8pYmC1U/csENB46Zl8QilpONBhm3bCiOjskgzY2jtq2ccFS+RHORyCtNJ7bUtk8IwSTk8fbonj2byjEUpqqoIsjlSZlXJ5xWu3RC4eNnD5JSF9jaGl563cOq0P2vDvn01NFB0d3Hs3GZi7VoD69cZaGlmCFgokwdODvs4fFgPZtTVUZgmKacylZUUr7xkYctmA9MJhavXNRf92bMurt/wcatfIpl6+A1taWHYuM7ACy/oYZE1qw1QChSSstyQA5RkmrSqx5bNBuKVFCtXcgwNKSkEaE01R21tMBmtME9ZJv7n8Qnvs3hc5MPhYur1DO/bWYbiweuhkFtpmqQVgHX/0x2YnhYzYd5PwGOXcIVUSmFwSCCf1+F4ZSUrq3QsBmS8plrnuVNTqmzYJbmZU6c9fPWNgz/6ZRA7tpv4sz+RsB2J69cF+vr8uyb3GNM82FWVBPEKisYGDbytWKFVTlZ1cbS2MjS2c5R6zscHBA4fsXH8lIfBQR/NTQyrug1UVWs/4Evtaa0QRayaoq0FaGj8/7P3Xc1xHWmWJ/PackAVqmAIDxCgt6JI0EmUoUTKdKvV09O9MxMxuxG7j7v7G+Zx3zd21kTsTo/bbS/vJYoSjSh6igY0AGFIeFcoe02afcgqgGgBFERSIgtERpQYQd26rJs3v/xMnu8cDe1tOjZv0DE0InD7NsfwqEA2I5DJSmTSEh6TMHTFFRcKElRXU7S06FjZomH1KgOtLRqsMgqWVYJ6d9Y/ZoQYbYJEnIJzCcHN6XgFuZrJiKu2jeGqKm0qHre6M1n2uecitVRajRdl2JZlXQsGjcpoVNs+MLiwhgrnCq+bzxfaPJdAkl3shHJcVTDKOwSmRRAMUYTD9y60/sBGgUChqpKiuVnHzR6OqeTcS27eZHj7XQfVVRpe3G/hxf0WdB349DMXR48ByWmBvKMaSixLqbsk4hTNTYpsccM6A60rNTQ26AXpYFWE8jMCjqPOyE+c9PHm23lcu8HQ2KDhia2K1aSqRkMuI2akf3N35PaRMMGaVTrWrVGsqqmUIj7IZFSVfWREIJuXCNhKdzwRp6iv05FIUJhmkYEGyBUKeX9e1JwRYvQksjmJbE5ASpqORMzzjIl/zef9k5NT3CWUQQgBjdIlc0S7SOSZcTwWNcoa67Wf3roFpNLzX+d5EuPjSjTN97GksClKXUNiclLl2XW1qpHibrDLH6VaX6gF1dZoaGvVcfLUt3Vlp6YETp72ULdCQyym6IZ++oqN1mYdu3eayrDzErqu4KnhsKojxGIUsXKKFSsoEgkKPXRHFpZSRbAL3yjhwdNnfVy9ztDaouGpPSY6dpkIhwnEAswtqqCmimrUAEAJbFsqyShfQy4nkMlIeEw1sARsMiO7o9nKYrk3K4B3N4OUUuXcBBKWpVHTtC3b0oTnMVcSdTTLmAAtMP/QghTLki+epVJOl6Gz7lXtutfXR9B5fX4vxRiQTKozzkxmVozvUeXc+j5FqkhEebKREQZCgLWr9RlY5MMcxV7imloNa1brSMQ1AHPzZ8aBkRGBjz9zQQstjHt3W9i6xcDWzQZ8v8C9VmgDpSYBiARY4YjLl3AcwE8zCA5MTAn09XGcPefhyDEPhw67yDsSjY06Xnjexk9fsdGyxoAzLeAsUBArtvf6vgQcVYGf7QxTsjrxOJnzHoSQ8JmE+2cIusV6WXVcSWzDMGsDAauREHEu7/i5vOODEgFK6QzZv4LMLnHDvnR5GL7HUVdLUVdn4OoNb0FD9ZlCJOVyAsKffVmlOkfFXbu8jCIWpUilJbJ5JfwGg4AQ+Wj8vgqKxgYNicTChY3BQY6PPnFmZHi3bTOxcZ0Bs4zMUxBRzCUUEn5OYmxU4HoXQ38/w8XLPrpvctwe4BgY4Mg7EomEhl+8HsDPX7PVb/DvP0UpONoC6k3O2WjvJZ0q4NuplCLIhbQJEaQo0WPoFJpGwBhDLpcr+U7FRRn25GQWkQhFY5OZrl3BcAet5rwvY2pK5UfNjQKmRWYqy6Vp2OrPWAVFIq4hnZFIJlW6Ifgs4cHDWgjF32cGCFbUaFi1SkdVlYbJSf4tZhDHlcogBx309XHsuszQsd1EVTVFooLOnDlzrjboTEbVS4aGBIaHOS5d8dHVzXHpiodUai43+s9+GsBf/yqAzdsN+GmJfOb70+F/m+/tAU6qVNENY5JoOnQCqSkhPQJdN2Y2ECEEfJ/Pbm5L2bBrVwQRClHXMMikHfCKHFALPnU2qxgqUimJyipS0s0gMwivIEE4QuB5CtE1Ni6QT0tA4J5F1x+shStd55UtOtas1nH+gphjfHNqIa7E5U4fA4Mch7/0kIirTaGsjMK21XFZKi0xMS6QzggkkxLZrEA6o4QMMndIEIXDBC8dsPBXvwqgsUEDHAVSepTednHj9XwJxokMaZQZhsbvVEctxgZSLo2G40UZdk1NBMEgHdM1fF1e7tZZNm1yHbGgYU9OCVy/wbBmtY6qagpawjRJM0AQiyAUpAjYBPmcQnStWsmwoo4iYiu524dq156Cdj6x1UBPr4m+foZUii/4TKmURCrF0X9LXRMKEkQiSrDd9yUyWVnYGBY20cYGBTb55V8EsKvDACSB+wgqjxBShMMCuRwXuuY7ukE8uYRpdBd3jh0MIBjSRjWNHI9EMqvLy0jjqLPw9emMRG8/w/iEmGnGL/khVd9zRZwgEAT6+hiudzHEKw1oBgXch7uama+q9CtbNGzcYCAep+jrWzxo33ElPF/MeDch5F1TjFCQYP/zFv7t34SwepVeQKc9mtK9xeKa7wOZLBeM5R2ieS6kFI+3YYdDCAS0KU0jJ2uqre1tK7WXc1mOTHb+66emOC5dZui/VeitXQpngwWBvPY2HX19HDe6GeJxD9u2GSBGIYx7iI/KuUoJwlGKdWt07N1lYWxUzOiWL+b7fJGiAu1tOvbuNvGL14PY/qSBQJDAc+UjW0cpqp6m0hJTU9yNRtmYacmp0hTveYCGbRgmNKp5lJLBmhpzcMM6k4+O+LTr5vzzkstJ9PYxDA4y5HIStj3bVliy1fGCR1zdrqOnh+Obi4ry507J24e5f82IvHMgEad47lkTI6McH3zozsvseS9DowTVVQQHX7Twq18EsG6tCSmVCuij3NFHqOLGT04LpNLUi8e1sWDAmPR98Xh7bEo1ABRSElFTY+U2bwr4l6+4RtdNf8FFNj0tMDDIMTwiYNukoHgoS9awOVMV1JXNOpqbGNIZietd6sinsbVAJ6RBsYI+1JAciJYTdOy0MDIicfMmx5lz/n2DLYIBorq49lo4eMDChnUGystJgRbpEX95hZQin5dwXTBd11OBgJHVNPF4e2zOGaSkIIQgFjVSq1ZFbtbU5NcS+Jq8iwcZGBS4ds1HJEJQU6NBitI99uIF3HFFgqK+VkNZhGBiQuDsBR+1KygaGnToNgF/iLl2kZBfNwhqKih2dZjo62PI5SW6b7LvbYTFdstolGDdWh1/+fMAXj5oo6VFh5OXM1zdj/wohOLZrIDj6MyyrEwkYuecPF+ysfiiDNt1HQAqnA4EyM1EPHIoFk1ZEpn2u31veITj2nWlxdTQoIEzogjsSzEUL5xXw1RQy8YGDWNjDF9/7aKpgaK5SYcWIA+9iFZkioUv0dhA8Rev2zBN4L0PXJw9530vyfJQiGDDegN7dimh+Y7tJmqqtZm8tZR0t4uheCZDfF23piOhYIoStmRVqBYpyjcLSLFtozsQCLxRW2vX19WS9pFR+S0gRHEMDXGcPutj00YDmzYbSwZgX15OsWObidu3BU6d8VBfp+GpPRYC0Ydf/i8e7eQyEpEwwRMdJmyLwLYpQmGCzk4fjquYRRmbRa4piqUCnNNUrCkbN+rYs9vC/ucstK3UYZdReGmBbEaWxLucqfD7QCat+r5zDjxdN8dDITvDhY/H2rC1O2RApKAZQHxTW6sNrl+rw/N9jI3N/72ppETndYaRUQEUPB65I+cptSElIH3VbbRxg4HT53x8c0kV0YZHBBKVEgSzms8Pe/gMMPJAQ4OOn75K0NKs4cw5D1c6GTqvMUxMCGQyKuSOhFVHV0uzolBat9bAurUGamooqqsoKAFETs5GLiUwKFVoM9eRSKcV2IZzyQil07qpC00Xj7dhO453RxGJMcblZFODNrSzI8QGhjL62BhbwNNL9Paqpv6eXo7KStVu92MIwf1gubarhAc3bzGx5YKHDz8Grlxl+OKoh3CQoLVVB9EkXOfh/1bGFaVTJEKxdhNBU6OGVe06Lnf6uNKpRPzSGTlj2JUJitYWHe3tOlav0pGoUZA67qrWx7wvSyrq0ijgCWBsTB37+b5EOEx909RShqHDMPjjbdjT05lvhTexKM21t4Uny8q8qj/vJprjNXyJrm6GCxd9PPmEgbo6bYYIoBQH4wq6WV1L0Nam2D/7biki+tZmDavWGoAGyPzDN4JidOQ4AqSAjCs2inRsN+F5mJHA0TRFhGBbBJatFFPdzKws78xxWgkNdRIjMDCoeN9Mg6CqUue2pfmUUhiGBvE4G3YwGJgNRwsLZkWNfUZI7/fNjflXzp3PNatFMp9hAxcu+mg66qKxQUP9Sg20hJlMhVBAFdMmaGvVsXO7idExB1+dcLF2tY4d203EKyn0Al3vo+ARiv3KmgZEoxQVlQD0BayUq8KbV+hzLmWPRgwCKYCubo7Oawy6riFgc9nXNykymTxcl5Xss9U1PgDDrqmp/HYBKWqezORyTmvrRHPtCjQPDgGOM38Bo7+f4eIlH2PjYkmQLxSrztGohp07LVy5xnD6jIdz5z2cPedh6xYT1ZUUXCxcWPyxi0hFA+dcFry3vGstYam4LS6UIEJvr8Cqdh2ALzs7hwkhpKSfc//BB2DYtm3OU5gw3VCId27dEpjs6rZw6LAHx5HzLhKfAV0FkbZtwwYCFoFpqL8vxSElwH2JygTB3t0mzp7zcOq0h3Pnfbz9noNYlKK2yQJ1FYb7UYPUPk6qqL4P9PUz9PVzbNxgY0WN4U5N+cL3OQhdulI1+uIm59sWmM0BUnK6ZrU9trOjjF28lNTGxvwFZ2oqKXHhGx8b1hlYu1ZHTRUF47Jkq+O+rxoh2ts0bN2iY2Wrhu6bHJ9+5mLzRgPbnlAyM4Quyws/jAhFSgAFLbnBIUWJbds6GhsCyWjU4pwv7Zfyvc+xZ43dh5TCTSTCnzc1xlbGK3K7Ab9yoXvk8hInT3toW6mjuVkDbALiyhJmVlGaWYapmiJ2bDcxNuagr5/h0GEXa1cb2LxZR0WVBi+rOOCWtcx+pKIZJeBCIp2SGBwSGB7lyOcltyw9F42aSUk442zZsOc17MLOyCi1jyTikbL1awNNN27kKiem5hLMzxZwJDqv+jh+wsPODgP1LfoMPWwpw0wJA1qadRzYb6Ovj+P4CQ/Hv/KwoiYP2w5gR4F+ly577h/PsHWlMNp/m+PcBR9jYxy2pbmhkNkVKQvc8Dlz2bJhLxCOqv8Ix5GpUIh07d5teaNjJj4+5CmCunk8nBBATy/D5SsMLa0c8aiiu3Xd0pxkXkglaqo17Nhu4MgxHcdPeBga5jhy1MX6tTra2g1EQgrN9SiSECxJwzbVUVdfH8ep0x4mJyUSCS1fXmZ/Ew6Hzvk+yy4bNlCgY53fvl1XIBTSbnVsj309Ns6azpyfjGfS/oL3vX1bnflWV1Hse8pCuJwAbmlOXnGzCkUo2lbq6Nhu4utTSk724mUfH33iojKhYfuTBhobSxBjXar5tQByWYmLl3ycPO3B94GWJiNXEbNOW1bgYiDg55cNG4CuaXedScs002UR6081VTwUi6V+1tfnVyy0gLNZgRMn1Znvzh1m4Ty1tCdZFhbJ6lUGnn3awnRK4tYtjqPHXVRUENTWUjQ26SBEzjT9L48HPyhVBxCuIzE6xtHd42NoiMMOAA0Nmh+J0H5KybSuUw6IZcOmdzkWkBLQNC1nGNbx+rpQ3a6OwP7xcbdiYGD+ifMZMDQkcOKkhx3bTQTDBEFbIZ98vzQnkTG1Na1dZ+DlvI2efo7BQY7xCYFPDzmoTGiwLIK2lTrKygly2WWX/YMsZl2F4Lduc3x9yseFCz4cR6K1RUNzk8ay2dzU1asTzHVFSYsBAEDLqgdg2N8VOjImRTrDWHkUI/v2BjJDw1kMDbl39Uz9/RyHDruoqKDYvs2AYZJ5c/OSMOzC0UksQbF+vYFN6w2cPu1jeESJuv/xrTwiEYK//ZsgyuL6w5cFWqq5tUZATGBgkOPE1x56+jgoJWhuNBGvIHxoKGkMDU0rGGmJz/+zLz4Aw/5uhAWB5wtRXmZde2Jr9f/t6ha/OHNmdPPAICcLVbwHBjk++cxF7QoN7St1VJcwfVKx40k3gOpKin1PmejpY/jwYxdTUwJdXQzvf+QiFqV4+aCNxgYNVFMKnsW8cHncR14NhRfgHPAzEp2dDF8ecTE+LqBRgoZ6C22tgeT0NPPTaa7me4nP+aIMmyxCDFoKwDTtoXAo+H9aWz1rw7rpVelMLphMzn+940pcv+HjzDkfOzsY7ICOgK1mu9Ry0BkWzKw66tu00cDBFy3c6OI4fUYdFV7p9PGb3yuN6L943UZZlC4b9AOcf10nyGQEBoYELl720dWtZHoMg4iKCivT2BDudSplNu+Ix2JO9Ad5MykJA7ShVe3Bqy8djE5PTPHgyVPuguE958DZsx7eeU9DKBjAkzsMoFDRLMXBuSqOVddq2LrJxJPblKTs8KhAMilw7oKHxPuK8GDfXgvV9Rqkp0j4l438Xhedyq31EMFEn8DHn7j48oiLdIFkMhikPBYLXEwkyr/IO2I8n1827HsoIgnkBEMiTm/v7IicuHQ599y581455wtT0/bf4nj/AwctTRrWrNIQCNKSBa3MKEtQpeO87ykTgwMcx054BVIDiWPHXUgo1NrLMQu6TpbBK/cxaJFA0pG4fJXhg48cXLzEQKCq5I31OovF7FOGFfySSz4u5LJh3xHqLM6dqOsoGCOdgsv/2tJCsGun9npnJ8PY+Pzf8ZmiKj5+wsOa1Tq2bDEQr6TwHUXUUIqejHkSoRDFnj2K27u7R7GVAMD4hMCJEx5qqigSlRSb1usoi2tgOQHXW863Fx8dKsO1IwS5pMTVSz6OHvNw7ZoPv3D8WFdLsGmTQaqr9R5A66MUjq6TZcOe9UR80YZNqITryjGf0c/Xrw23aJr2jOumw2PjrrHQ9/KOxNenPMRiBLoB7Nltzby4UvRknqM4yBtaDDy9V+DyFR+jowKTUwKcK5LHTz93YVoEvm9jVwcBheqXFmLZaBczinppzAdu9jC8976Dzw67GB6ZXautLQae3GanouVyOJnM5TiX4HzZY9/hVRcPDSOEgBCBSCSAqqpAVzjsfnriJN8NuHV3+97gEMfhLzysajewdrWBSITAMNQRWMmGqUyispLiwIs2hkYE3v/ARfGcZWCA4+NPHJSXEdRUUTQ26ghFCJzsdwu5P+6emhDF9OL5EpMTAue+8XHosIsbN9gcLERFhYmGOnNSCMe7datIXLg0cp51m79j4/u7v/u777zJ6ND/gJRiUR/OOQgFDENHvCLg2rY+lcm4rSMj+dbp1MLEA4xBETEACIcoKiooKuIUnJVw/ikA0ySordXguUDfLYHplCjIuaqwPJuVoISgvJyiKkEhhcobl3PuhT01paqDa2hI4MhRD39808GRoy7S6dlJM03gmX3Rnn1PV3xgGNqRXI4P3aGRXfKf1vb//OMVz5THViLlnAtMp/wJ12XHO560D2Yzkef/6V9SuNnL7vrdE197iEQIGhoomldqStSPoOS4qaRURIKaBkRjFOvW6diz20A6zdHTOxsuXr3G8Na7DipiFHW1FOVlFJZJsNT7he85xNQJCADHkbh5k+H9Dxwc/sJFLjc7X5QClQmKRMI+XVZW9oam0xum6T9e87SYiwzTvsfFTXzD0EZXr0m8LaURu97F96cy0xWTk/PnklICyWmBo8c8NDdpKC+jaG3VECmnSki9BIErmqaAK+vXGvj5axLJpMDIiINcXj1MNitx+qyHsojqdNv3tImWZl1RNZPlnLu4LnRdGTUAjI5xnDmj2Go++9zF5OTcSaqqJNjVYaK93eoyTOuEphEnGNSWDfvPh2UF7+8fMYzPKxL68K5dqeqRkfS+U6cFUumFr59OCXzwkYNolOKvfhlAJE5LMjQlRIXcIisRjSpm0M5rHOfO+7h+g80YreDAkWMegkGCqiqKRFxTG4K+bNjFeaQUoERickri8hUff3gzj7ffc5BOfXuCGht07N0dRHOjnvI85lFKwNjjNZGLyrHT0/8XhNB7+BAQQqHpOtN0OlxdqZUxJqpu3fISo2N8wS3U94HJKQHPlQgEKKoSGmLlFFaAwPdKjwpXCsCyCawwgUmVOOHIiMDEHZ6GMWBqSiCXU0yiDfUaAhEC5j3eRm2agBWmEL5E3y2Ojz9x8Yc38vjyiIeRETHvxrdje+T2a69WfdrQWPYWY/SmWIIcw4nqf3//Hvv+9MElnLwHAmm2NMU+3NXBy65fd+OjY5PNE5O4azHt8hWGN992EA5RvHTAQkUVndnBS8vlKEkduEDbSg2vvxbA4KDA9S42JxIZHRN4+10HZeUq315j6TM54+PquTkHqCvR08tx5JiH3/4+j0OH3XlrEJQCsSjQ3By6kqiM/YNtW2cdx38s521RHjuV/Jf7XtmEQOgaSWtUkHgFVqXSoun6DVe7Gy7cyUskU4qyOB6nqExQRCIUmkZmjjVKynNLIBSiCAYJshmJiSmB6aQCphSH50k4joQUQGWlhvpmDbpRmpHKvcwPIQUvbRMYYYpMUuDMWQ9vvOXgvQ8dnL/gI5ub3wPHYgTPPGXhuWeipxoayn6t69qY6y7N5vfK6v9w/x77QeRIUkiZSjHPssjlHTvKPx6f8BM3b7obrnQ6gbwjF/D1wPi4wJdHXQSCqvtrZ4eJcEjBTouLoVQWbTEsDwYJdu82kcpIeK7E2fP+HNmjq9d8/PYPEqEwQXW1hkSczoBXlvIxWBF04nlKX93zJE6d9vHhJw4+/MhBTx+/aw7e3mb6Lx+IpbZuCV+QEsOuK+/G/rNcPHuQgzE56TPxbnOTHvrVLyPr3nxL4viJuwtdjYxyfPqZg2CAIBbVsGE9QaiMgrkSrltasFPfl5AAmlYa2LtHpRvXbnCk03Pz7f5bCrBTX6vj2X0malt0iIIm9VLy2hJKY0vXCfSQerCpYY4z53ycOePjy6MubnT7GBgSd3UckTDQ1hq4tbKt+h+rq2JvpdKQhBAYhrZs2D+G52ZM+tkc7yqLkDd27bTXDA85z3b3uHXTSQlnAYCb5wG9fRwffOTANAlyeQvbt5kwTQKjoPZQKp7MZ2oegmVKTP7gixaGhjlOnvYwPj67eJ0CzFYvVMdfLlfn28VK+VLw3JTO1g+yWQl3SmBwkOPyFUXhfOy4h2s3vjtHjoSJ3PGk6T2zr+JsbW3FP5lWqFfPO0s+dblvwyb3OTukeCgLMtPfnsuL3lSa/ZfKKkw9vdf4TydP++jru/tqvT3A8dY7Oeg6EK+gWLlSwTDdnEK0lYpmMwCwvJLc3b3TxPiEwMAgn2PYAJBOC5w666OhwUVTo4bVqwzE4oXnFaW9aKUEDB3QAgTMQWFzc/HlEQ/nL/jo6eVITi+uYhgO6/z55ypH9+6puGqayGWzPoqK9o8rgm9RxbOpiV8vGlI6/0dCCA4hOYptc0IQH0Qbq66y3caG4LqRUR7s7vYC8q5hPDA5KTGdkvAZYNsElYUzX8MgJaUKKQp48IoVGsI2kEoBtwb4HFhk0ZOlUhJSECQSFLUrNPXdEm711KginMi7wECBi/2jT118+JGLTz93cfUaQyazON2zlmYDB14oGzt4IP5mW1vZO56n3eScsKWCCV9oRCv+9v49NucP6DBVApRqsG0K0zIQjUmEQlpPOs3/+cxZ9tfHj2V2JlPffZsbXQy//1MeABCv0NDSpCEcxSMhgPe9i2mORLSc4sX9FkbGOP74Rn6GMqk4+vo5Pv7MQXOLhraVOkJBwDRpyRLyUQrAJhjv5/jssIu333Vx5pwiR3CcxT+TrhHsfy6EX/y8rC8Uwp/GxvzTuq57y8CeRXrsibH/DSnl/X+IBKEElFLougbT1BGJWDnb1ocJ8db4vvvEyAhf8DhjrucWSKWU3KttU1QnaEFyhyjWUFkqoTmBZRJUr1C64f23OCYmxZxNinP1vJ4HRMIUNdUaopUa2A+sM07Ig6MGK7bhBsIETg7ous7wznsO3nnPxZFjHiYKz7dYg1xRo2Hv7gCeeyZ0aN3a4D8Ron1IiJk1DENSSmdC8WWP/QPm2H/utSUkVG8sMD0tfSFE34b1gSueFx3uv8VrRsdzi7rVxcs+sjmlixUOEaxq11AeLS0Qi++rRpGyGMXG9QaeecpEMilwo4vN4X4TAvjyiItoOUVdHcWKFUq0XfuBwCtCFFlvCChRof/9zGnxu8QgGB5lePs9B7//Yx7XrvtzGjgWO7ZstvDqK8GBWIz+/fAIeysS0bltY3l8H4+dnPx1AR76A3zUOaPUND+byzojo6NO4+Skn3Dd7w6tpQQmkxLT0xL5nIRtEVRVagiXF3u5H33PXfRkukEQsIB4TMP4hDLsO4ErqltMgXYMgyARp6iu0mBHKPyCuOGDeM7iPRwHyOUkHFeCC0DXFL3vvQ7DUJHU9LTAseMe/vRmHqfP+Mjnv59R19VqeP7ZILZuNj+prtb/p2nSDy1Lz1iWDtu2oOsGlj32ohlUfriERXUwCWQz4huf4erWzYF1mYxoP/ylS/MOnymoFzudvvW+JHD5io/UtFAhPCF48gkD0XI6871H+R0XlUGcjEAkTLCzw0TvLYar1xhOn/W/pWs2OMTx3vsOomUUiThFfVh/oBGKpqkNZGJCYmycw7QI4hUUtqW42e6VQdYwgelpifPnPXz0sYML3/iL1mwrspAaBpE7OwLuT14JjnAu/mFqSvw/SiWi0WUPfU+G7To/nLgWJQQSElJIVMSCXk1VsMf37dGvTo7GAW7qBhAJKRmgTFadac83Boc5Pj3kIu9ITEzYeOZpBeoAA/IZ8chXkIt1MGIQbNpg4Kc/CSCbkzh/Ye45bt6R6Oll+Oqki40bdATLCMqCBJQSeA8g5zZNFXoPD3Ncvc5QW+gRFxL3tFHOXK8T5PMSJ076+PxLd04DzGKimo3rTTy9N0LWrNHf16j4XS4nj0pJlgkp7sewfe+HbzEihKAsYtu1NebZqST9tLU5+cL4uFsTDhO0tdr5FTVG9mavZ39z0QnPF6JzrrivJiYExscFcnmBA8/biFVQ6PrsAnuUF4LPAC4lWpp1/PRVgpERjps9DLnc3KOfXF7i7DkPb71LYVrArg4L4fCDiR6kBLI5gSvXfJy/4CMUshAMqlD8njbugpd3MwK9vRxfn/LQ28sXuckA5eUU9SuM9CsHyycOHii7LgT79eXO7DuZjEpJlimk7sOw76bd9SANW0p4eUeeMk1oGzfqWzI5WuM6wNbN4RvPPZs4efRYckNPz9DOqeTC90lnBE6d9uA4ig/rhRdsbN1qABLgTML3CrrWj+CCkIXfaNsEdbUanthiYMeTJs6e8zE5NdfDjY9LfPyZh5ZmHVs2mYhE7k9JhdIZZCCmkgLdNxl6ejme3isRj1MQ3BviTdMIGJMYGhK4ep1hdGzxnroyDjy1N4DdOxNn1q8LvCslP5lM8avLZvuADNvzfrQOGTExKcYo4Se2bwt2SeltuHrVJXV1ga5dHVX/Gi23nhoYyq05eixTPjDIyfz1AMUldvhLD5OTAhNTqrjW1KChuobC0ABNV4vtUfPexYhCYZ8JOjpMTKcE8nmJ4ye8Ob/X9ST6+xkOf+lh3VodHTssVCUohJTfW9yQEMVzDiJxpZPh6HEP164zmKbiYgtECFhOwruHDkhNB+ACPX0MZy94GB39bsMOhYCmBh0dO8JdB16oOL1pY/Qz25bv9t9KD2ez4oHWFB5rw87mfjwB61yeQEppNjYEbk1OstytW34olxepTI6e37ChHP/mL6teyGbEEwOD6dB3WUnXTYaJ3+TQ18/w0gEbLz5vobpKA7UJePrRpFoiRLVuSgk0NGp4+ikLFy8znLsw/7HQtRs+3vvARSymYUW9BY19Pz52QgoEgSYBOHD6jI/f/C4P35d4eq+FykoK8HtPYYhGQIjE2JhAXz9flMpLazPw0oGQs2dP/T+vbi//V993UxOT+aQQwGParPXDGLYdCPx4XksAhkEzZeXGh5ksbbp9O/taRQWNAtQPhbRza1cH/vHll8pzrif3XbyUt+/kkZ5zHyg4ZjbL8eHHLqanJcbHBDZt0rFpo4mKGIVtKyPg/NHKvYu/J1RO0daq44XnLPT3c3x1wsVUcu4PHRhQRcNV7To2rNNRFvnuRpHiEZuhE1AqISTQ281w8ZKP3/w+j+MnPBzYb+GZpy3U12ng7D7IJAs59uAQR3e3j3RmYY8dDAJNjRoOvBD75iev1nzS3Fz5B8vQusfGPXj+MkfUAzfsioroj+y1SNo09c8rKlhizZrgnljMiFMqm0dG/c5Umv9+146IHS0z6n77h7H2jz7OWM531PYyGYHDX7ro7vaxa6eJn/9MYu9uC/GEBinlI3kkRgjAsqpotn2bgbFxG0NDHFNJ/1upx+0BhvPfePjmkoF1a3UkEhqYLxc8mip6c1rQJE+nBb444uK3f8jh0GEPpqmEBbc9YaCsjIL58nuDYGYiBiHheipvHx8XcO9Sua+vA154Psj276//zepVK/6b77P8VDIPxgTocuz94A3bMIwf+3cJQqhTXh44vao98YZlW5OEwgV0EQqHU5bpfdzWJunPXks8H4mYe0+dTsWv3WB39YCcS9zo5sg5HjJZ4EYXx64OE6tX6YhXUBCNwPfE985Pf8jBmPKsDY06OnZIXLzkY3RcYGiYoyjOUgSufP216t0uL6OortchBb5FH1TM34MhAsEVI+z5Cz7OnvfwwYcujn/lQUqJPTtVW2yiUgMk7gkZNjP3PpBOS0xMKAjwQhuoZQFbN5f3vvxS7bGNG+KfBINmKp0SPyiG4rE3bP4QdG2FENB1fayyMvYvmkZdQsiYYRiEECInx6duuK4Y2rM7OlxTE9DCEdnhesn40LCknnd37zswwPH2iINz53309nK89qqNdeuUl3vUvPZMkwcFVlRreHafheERFX0UtcCKo7uH49BhF5s3Gti0wZg5d77zmWaq5gIYG1Nys2+87eCjTxx0d6uN8ak9Jn75iwA2rNfB7kOFpfhvuY6iXJ6elmALLCPLBNpX6rKjI3Fy8+ba/xUMWDdSKRe+zx8snHnZsB+VcJQkNY1eoJRKAHlCSAEuSAAgIyWO1dfb7OCBqsvhoP7KqbPJDWfP+khnvssTKiHAjz5xMDzMsXOniWf2WVizWke4gkI6ck7u/bDXFveBSIRg5y4TwyMKbvrnhg0Avf0M57/xsWmTjvo6HeEyAt9VYTQhQDBCAEkweFsRGXxySHnpolFXVVLs3GFi7x4L9Q1a4fnlfRt2KiXu2tjTUK/jpQMhsnmT3aNp9DwXJDUbZUgIoRRmGOPwPAbH9ZHPcxgGhecRMMbBOV/yMNIlY9hSSsYZn9a0ouyNesmEqMU6NeUPRsqsN7dsil6KR3V3xQqqGfp0/ekzXqTYHLLwvYGumwxdNxmudzNMTQs885SFLZsNmIZCYD0qkFTXkaAUqGvSsXuXiUuXfYyMfLsLLJWSOHHSQ2MjxcEXCKJxHcybrST7LjA6ojz77/6YxxdHvBlKpoYGDU/vMfH8czZWturQbSCXkvexKas/szmJsXHxrVbU4jWUAuvXBfIvvhi/2NYaOJfNspRpzpa+KaXQdA2GYcCygFBIwPcpNCqg6wThsAHbNmEYxmPLb1Zyhr24NEFKx+H9sXjwN7t21p2oqAj9u1XtE7/84KMUenoXtzC7byqa484rDPufs7B3t4n16w1outIWyuXlo9FMwoHqKooXnrcwOMTx/odzueJ8psj0T57U0LHdBHS1KwWCBKBATzfHZ4dcvPOeg5OnvDk8a+vX6nj9NRvbthoqb7/PE04FFQYyWYnRMYHMPIZNNSBWBjQ2hk6vqEn893AkdCyVVh5YgYglDEMH1QIwTQvhsEBZOYfvCTAmQQiBaRLYtgZd16DregHoJLDUiRaWtGGrBgqJrMfdcCTQ2dpa3hmNEt22cpXZLFupaaw6lWLWVJLf1XvnchJXrvjo7GQYGuaKzD8p0FSvo6aGKr2oAirrYXlvKQE/p0gZntprYWBA4EonQ1//rMKkFEpo4dwFH51XGdauMaAX2E0nxjgOf+HiN7/L4cRJ1e4KKCDM6tU6Xn0pgH1PWUjUachNiQfybgAgn1c59nxdXGVhgg3rNaxfH7oSiZT9QdNMnxIXUghIlYpBNzTo0Ge6ASklBZScMn0hii2ms33/gHzsc3N9KTyE6vyScF2G8QnveCYrbj27r/z1HU/qf/vV11PNnxxKY2RkUaE/LncyDA1nca3Lx/PPWnhxv42mlTpAAZGS4PzhGTbjErpOEEtQrGrXsGmjgelpMaNSWhzJaYFLVxg2b2JYs8pALidx7ryPzw87OHPeR96Zvb62VsMvXg9g//OWYmXJP6AqtAKyQaJwpj6PB43FCLZusdDWYghCQNQpAF1wkyi+IyUzLAu9/XfWQchysW0pGfbsC5fI5cWE78uJlibDrakOi1hMWxMIGqu7u9w1PX35wPCIQD6/8H3SaYF0GpiYcjAxITCVlNjdYaKtTUe0HDBNDiF8cCYgfmT3LYWiA9INgjWrfbz6EkMyKfD5F3PrAFNJgRMnXLSv1FBTo2FgkOONtxx8cdRDMjkLyWyoB146wHDgBYbVa1w4WQHPfVA1BWVggnMwxiDnEZyPllO5cYOVr68XU/l8Uvi+/lBOYJYNuwRGccOfmGA3QyHx96vbY8HqqsjB4eHkfzx8dGzD54fz6Or+7vvkcxJffe3h1m2Oy5d9/OQVG8/sMxAt59AoBycPAa5WEPmTWSBeIfHUHopLV4ATJ4HcHaQznidxvYvhwiUfWzYbuHiZ4bPDLoaGZ40mHAL2Pwu8+pKOqioB4ftqo3pQj6ROLiAFLxBZfvvGuqG5kTK7j2pieHJqijzqvfPLhv0IDMalC2AsFjNRVq69p+uSrluzYrNEQ7Ai4TcODvS1DQ0N1y3kIThXkNRr1xmmpyUmpwRu3a7EtifWY+OmtYjFEwCh4J4PzlnBQ/04q5IQIBwgWFkOPLm9Dxu+uoDOzn6k00rC1PeB0VGBL4/44MxB/y2OG3cAeGKxGHZsX4WXX1mP7R1VCAYJqA4Y5MHVEEhB8lYzR0G06yDkGoDRP7sq0Ts+ue7Nnr6yr0bHckJKieVAenGjY8/d////HwA68CZBwj75JAAAAABJRU5ErkJggg==\" /></p>\n<p style=\"text-align: center;\"><span style=\"color: #ff0000;\"><strong>Cola-Admin</strong></span></p>', '1', '2022-06-29 13:44:08', '1', '2022-07-01 13:37:00', '0', '1');
INSERT INTO `system_notice` VALUES ('6', 'asdfasdfas', '1', '0', '2022-06-16', '<p>asdfasdfasf</p>', '1', '2022-06-30 16:08:51', '1', '2022-06-30 16:08:51', '1', '1');
INSERT INTO `system_notice` VALUES ('7', 'asdfsfas', '1', '0', '2022-07-14', '<p>adsfsadfsdf</p>', '1', '2022-07-01 11:13:46', '1', '2022-07-01 11:13:46', '1', '1');

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '角色名',
  `code` varchar(100) NOT NULL COMMENT '角色编码',
  `parent_id` bigint(64) NOT NULL COMMENT '父角色',
  `creator` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `reviser` bigint(64) DEFAULT NULL COMMENT '修改人',
  `revise_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted` int(2) DEFAULT '0' COMMENT '是否删除：0=未删除，1=已删除',
  `group_id` varchar(64) DEFAULT NULL COMMENT '机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES ('1', '超级管理员', 'administrator', '0', '1', '2022-05-31 17:23:12', '1', '2022-05-31 17:23:12', '0', '1');
INSERT INTO `system_role` VALUES ('11', '用户', 'user', '0', '1', '2022-06-01 19:00:25', '1', '2022-06-09 16:52:01', '0', '1');
INSERT INTO `system_role` VALUES ('20', '管理员', 'admin', '0', '1', '2022-06-09 16:52:17', '1', '2022-06-09 16:52:17', '0', '1');

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(64) NOT NULL COMMENT '角色id',
  `menu_id` bigint(64) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
INSERT INTO `system_role_menu` VALUES ('26', '11', '1');
INSERT INTO `system_role_menu` VALUES ('27', '11', '3');
INSERT INTO `system_role_menu` VALUES ('28', '11', '4');
INSERT INTO `system_role_menu` VALUES ('29', '11', '2');
INSERT INTO `system_role_menu` VALUES ('30', '11', '5');
INSERT INTO `system_role_menu` VALUES ('31', '11', '6');
INSERT INTO `system_role_menu` VALUES ('32', '11', '7');
INSERT INTO `system_role_menu` VALUES ('33', '11', '8');
INSERT INTO `system_role_menu` VALUES ('34', '11', '14');
INSERT INTO `system_role_menu` VALUES ('35', '11', '15');

-- ----------------------------
-- Table structure for system_role_user
-- ----------------------------
DROP TABLE IF EXISTS `system_role_user`;
CREATE TABLE `system_role_user` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(64) NOT NULL COMMENT '角色',
  `user_id` bigint(64) NOT NULL COMMENT '用户',
  PRIMARY KEY (`id`),
  KEY `PK_SYSTEM_ROLE_USER_USERID` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_role_user
-- ----------------------------
INSERT INTO `system_role_user` VALUES ('1', '1', '1');
INSERT INTO `system_role_user` VALUES ('4', '11', '2');
INSERT INTO `system_role_user` VALUES ('5', '20', '2');

-- ----------------------------
-- Table structure for system_serial_no
-- ----------------------------
DROP TABLE IF EXISTS `system_serial_no`;
CREATE TABLE `system_serial_no` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `creator` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `reviser` bigint(64) DEFAULT NULL,
  `revise_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(2) DEFAULT '0',
  `group_id` varchar(64) DEFAULT NULL,
  `table_name` varchar(64) NOT NULL COMMENT '表名',
  `max_serial` varchar(40) NOT NULL,
  `serial_date` varchar(20) DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_serial_no
-- ----------------------------
INSERT INTO `system_serial_no` VALUES ('2', null, '2022-04-08 09:44:41', null, '2022-04-12 09:37:11', '0', '10001', 'CUSTOMER', '1094', '20220412');
INSERT INTO `system_serial_no` VALUES ('3', null, '2022-04-08 09:37:56', null, '2022-04-08 09:37:56', '0', '10002', 'CUSTOMER', '0001', '20220408');

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `login_name` varchar(100) NOT NULL COMMENT '登陆名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `ids` varchar(18) DEFAULT NULL COMMENT '身份证',
  `creator` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `reviser` bigint(64) DEFAULT NULL COMMENT '修改人',
  `revise_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted` int(2) DEFAULT '0' COMMENT '是否删除：0=未删除，1=已删除',
  `no_use` int(2) DEFAULT '0' COMMENT '禁用：0=未禁用，1=已禁用',
  `group_id` varchar(1000) DEFAULT NULL COMMENT '所属机构',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `UK_LOGINNAME` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('1', '超级管理员', 'admin', '040bd08a4290267535cd247b8ba2eca129d9fe9f', '13111111111', '370103198810148854', '1', '2022-06-16 15:48:21', '1', '2022-06-24 11:32:06', '0', '0', '1', null);
INSERT INTO `system_user` VALUES ('2', '测试1', 'test1', '10470c3b4b1fed12c3baac014be15fac67c6e815', '', '', '1', '2022-06-02 13:48:59', '1', '2022-06-09 17:52:43', '0', '0', '38,1', '');
INSERT INTO `system_user` VALUES ('3', '测试2', 'test2', '10470c3b4b1fed12c3baac014be15fac67c6e815', '', '', '1', '2022-06-02 17:51:20', '1', '2022-06-02 17:51:20', '0', '0', '1', '');
INSERT INTO `system_user` VALUES ('4', 'test', 'est', '10470c3b4b1fed12c3baac014be15fac67c6e815', '', '', '1', '2022-06-29 15:03:27', '1', '2022-06-29 15:03:27', '1', '0', '1,38', '');
INSERT INTO `system_user` VALUES ('5', '测试3', '测试3', '10470c3b4b1fed12c3baac014be15fac67c6e815', '', '', '1', '2022-06-06 16:40:20', '1', '2022-07-01 09:22:03', '0', '0', '38', '');
INSERT INTO `system_user` VALUES ('6', '测试4', '测试4', '10470c3b4b1fed12c3baac014be15fac67c6e815', '', '', '1', '2022-06-24 16:11:28', '1', '2022-07-01 09:21:01', '0', '0', '39', '');
INSERT INTO `system_user` VALUES ('7', '测试5', '测试5', '10470c3b4b1fed12c3baac014be15fac67c6e815', '', '', '1', '2022-07-01 09:21:18', '1', '2022-07-01 09:21:18', '0', '0', '38', '');
