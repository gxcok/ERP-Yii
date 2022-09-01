/*
Navicat MySQL Data Transfer

Source Server         : localhost-mysql
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : erp_yii

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2022-09-01 17:59:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '管理员账号',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '管理员邮箱',
  `department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '【部门】职位 eg:【财务部】会计',
  `face` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '管理员头像',
  `role` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '管理员角色',
  `status` tinyint(1) NOT NULL DEFAULT '10' COMMENT '状态',
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_time` int(11) unsigned DEFAULT NULL COMMENT '上一次登录时间',
  `last_ip` char(15) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '上一次登录的IP',
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '地址信息',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `created_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建用户',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `updated_id` int(11) NOT NULL DEFAULT '0' COMMENT '修改用户',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员信息表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'super', '管理员', '13666666666', 'super@admin.com', '软件管理员', '/uploads/avatars/5d25467854686.jpg', 'admin', '10', '78uw8I44JFmYIZVkCIMi-k-AldsdXv7C', '$2y$13$X1OkdkvULYjOlKClZTpKRORtSKiDxRwmY2OCUklAsaWd2tpghU5ZW', 'PNZEJmcRs1w99f0mDbfeTbfJXPRIyMXh_1662021659', '1662024466', '127.0.0.1', '湖南省,岳阳市,岳阳县', '1528516726', '1', '1662024466', '1');
INSERT INTO `admin` VALUES ('34', 'zhangsan', '张三', '13512345678', 'zhangsan@163.com', '【技术部】测试员', '', 'admin', '10', 'MjkQSEgtbkduW2gtjyxiQgZiaDLeJP1s', '$2y$13$gGr8BU3ru4Zy5Xqw/4GU7.v21DKg6vq/Ha1uchYfE6jff3K.OBTLi', 'TXOYpmdXVdZJcebV1RbgLukxtmIsiCnN_1662021829', null, '', '', '1662021829', '1', '1662021829', '1');
INSERT INTO `admin` VALUES ('35', 'lisi', '李四', '15212345678', 'lisilisi@163.com', '【市场部】材料员', '', 'admin', '10', 'M3QBOFHmrZeFqGDDPgZHvCY_h734RAkr', '$2y$13$tUXGdxeT6gexTFvVBC1NfuHeLMss.Ym/sRtfrytnSF4/Drir5Vspq', '0t74ezkcrqMHxen8tmIxzC4J80YNRXYQ_1662021963', null, '', '', '1662021963', '1', '1662021963', '1');
INSERT INTO `admin` VALUES ('36', 'wangzong', '王主管', '15112345678', 'wangzong@163.com', '【项目部】主管', '', 'admin', '10', 'vXVWseEJ7w_w2vyGwRoGkkVpANLyBCAt', '$2y$13$gH3lM1ybI13qNcW9LdkVee4d/pC6kWEh3RqXe8gXfwcb3cqj68AWi', '0v15uQHMmlTcQOXJWu1dXnKxFSqct3O9_1662022025', null, '', '', '1662022025', '1', '1662022126', '1');
INSERT INTO `admin` VALUES ('37', 'zhuzong', '朱总', '13412345678', 'zhuzong@163.com', '【项目部】总经理', '', 'admin', '10', '--D2da7z6tWwmgg-zpbmvmM_cwGIIvNs', '$2y$13$bqXV2lhE6roshZQ5ogK2Bu3OSTmHj.XiCtGQR/dBsDCFMCNQZyplC', '5rTzEfBOsiC1T9eSaIJ0SsUiNuRwTMEX_1662022112', null, '', '', '1662022112', '1', '1662022112', '1');
INSERT INTO `admin` VALUES ('38', 'wangwu', '王五', '16212345678', 'wangwu@163.com', '【市场部】材料员', '', 'admin', '10', 'oXCrxXxtWgw82mHOnMDyJKgc98DOgzY3', '$2y$13$2HC0.lh/DJ4P31WwGgPcqe3wYmpXBuO9w/57KAd7yVo5oT0D3tyl2', 'qcMAQAZwjUwEGLuewfdJUXJ1xDtS3iem_1662022500', null, '', '', '1662022500', '1', '1662022500', '1');
INSERT INTO `admin` VALUES ('39', 'zhaoliu', '赵六', '15812345678', 'zhaoliu@163.com', '【预算科】科长', '', 'admin', '10', '-HHo6whjqIawacXU4N369cZvKlgWZ2zN', '$2y$13$uzync.nWO7uVUuMj9MkY..XGZRoJot9uJLLCmreFf0HoPYNEG0NlG', 'KUNMn5ko3L7VMqhpJ59fzSH7ZE1r3FR4_1662022574', null, '', '', '1662022574', '1', '1662022574', '1');
INSERT INTO `admin` VALUES ('40', 'shunqi', '孙七', '12212345678', 'shunqi@163.com', '【项目部】编辑', '', 'admin', '10', '0TsiTdHTh8lG_Tjd1YP-JUGLDp2dHxbK', '$2y$13$Qd0iiwkJgShr3ZsXU2WLne3p/PuIZgWhzp4zKTNbzCuNGQod/nhYO', 'QV9LYfRxp-HR2OoURr4NH1YdjLSyvyuA_1662023269', '1662024034', '127.0.0.1', '', '1662023269', '1', '1662024034', '40');

-- ----------------------------
-- Table structure for admin_operate_logs
-- ----------------------------
DROP TABLE IF EXISTS `admin_operate_logs`;
CREATE TABLE `admin_operate_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作管理员ID',
  `admin_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '操作管理员名称',
  `action` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '方法',
  `index` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '数据标识',
  `request` text COLLATE utf8_unicode_ci NOT NULL COMMENT '请求参数',
  `response` text COLLATE utf8_unicode_ci NOT NULL COMMENT '响应数据',
  `ip` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '请求IP',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `admin_name` (`admin_name`) USING BTREE COMMENT '管理员'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员操作日志记录信息表';

-- ----------------------------
-- Records of admin_operate_logs
-- ----------------------------

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('admin', '1', '1529222658');
INSERT INTO `auth_assignment` VALUES ('admin', '10', '1567586114');
INSERT INTO `auth_assignment` VALUES ('admin', '11', '1567586234');
INSERT INTO `auth_assignment` VALUES ('admin', '12', '1567587456');
INSERT INTO `auth_assignment` VALUES ('admin', '13', '1567587548');
INSERT INTO `auth_assignment` VALUES ('admin', '14', '1567587654');
INSERT INTO `auth_assignment` VALUES ('admin', '15', '1567587733');
INSERT INTO `auth_assignment` VALUES ('admin', '16', '1567587853');
INSERT INTO `auth_assignment` VALUES ('admin', '17', '1569547588');
INSERT INTO `auth_assignment` VALUES ('admin', '18', '1574814331');
INSERT INTO `auth_assignment` VALUES ('admin', '19', '1574814556');
INSERT INTO `auth_assignment` VALUES ('admin', '20', '1574816510');
INSERT INTO `auth_assignment` VALUES ('admin', '21', '1574816710');
INSERT INTO `auth_assignment` VALUES ('admin', '22', '1603092352');
INSERT INTO `auth_assignment` VALUES ('admin', '23', '1603092590');
INSERT INTO `auth_assignment` VALUES ('admin', '25', '1605751530');
INSERT INTO `auth_assignment` VALUES ('admin', '26', '1605752490');
INSERT INTO `auth_assignment` VALUES ('admin', '28', '1627874454');
INSERT INTO `auth_assignment` VALUES ('admin', '29', '1635749991');
INSERT INTO `auth_assignment` VALUES ('admin', '30', '1638501345');
INSERT INTO `auth_assignment` VALUES ('admin', '31', '1638842208');
INSERT INTO `auth_assignment` VALUES ('admin', '32', '1640670098');
INSERT INTO `auth_assignment` VALUES ('admin', '33', '1658301996');
INSERT INTO `auth_assignment` VALUES ('admin', '34', '1662021829');
INSERT INTO `auth_assignment` VALUES ('admin', '35', '1662021963');
INSERT INTO `auth_assignment` VALUES ('admin', '36', '1662022025');
INSERT INTO `auth_assignment` VALUES ('admin', '37', '1662022112');
INSERT INTO `auth_assignment` VALUES ('admin', '38', '1662022500');
INSERT INTO `auth_assignment` VALUES ('admin', '39', '1662022574');
INSERT INTO `auth_assignment` VALUES ('admin', '40', '1662023269');
INSERT INTO `auth_assignment` VALUES ('admin', '9', '1567585891');
INSERT INTO `auth_assignment` VALUES ('administrator', '1', '1528516729');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/agreement/select', '2', '合同拟订-选择数据', null, null, null, null);
INSERT INTO `auth_item` VALUES ('/plan/select', '2', '材料计划-选择数据', null, null, null, null);
INSERT INTO `auth_item` VALUES ('admin', '1', '管理员', null, null, '1528516729', '1560196617');
INSERT INTO `auth_item` VALUES ('admin/admin-log/delete', '2', '操作日志-删除数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/admin-log/delete-all', '2', '操作日志-批量删除', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/admin-log/export', '2', '操作日志-导出数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/admin-log/index', '2', '操作日志-显示页面', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/admin-log/search', '2', '操作日志-搜索数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/admin/address', '2', '管理员信息信息-查询地址', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/admin/create', '2', '管理员信息-添加数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/admin/delete', '2', '管理员信息-删除数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/admin/delete-all', '2', '管理员信息-批量删除', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/admin/editable', '2', '管理员信息-行内编辑', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/admin/export', '2', '管理员信息-导出数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/admin/index', '2', '管理员信息-显示数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/admin/search', '2', '管理员信息-搜索数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/admin/update', '2', '管理员信息-修改数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/admin/upload', '2', '管理员信息-上传头像', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/admin/view', '2', '管理员信息-显示详情', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/auth-assignment/create', '2', '角色分配-添加数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/auth-assignment/delete', '2', '角色分配-删除数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/auth-assignment/export', '2', '角色分配-导出数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/auth-assignment/index', '2', '角色分配-显示页面', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/auth-assignment/search', '2', '角色分配-搜索数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/auth-rule/create', '2', '规则管理-添加数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/auth-rule/delete', '2', '规则管理-删除数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/auth-rule/delete-all', '2', '规则管理-批量删除', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/auth-rule/export', '2', '规则管理-导出数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/auth-rule/index', '2', '规则管理-显示数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/auth-rule/search', '2', '规则管理-搜索数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/auth-rule/update', '2', '规则管理-修改数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/authority/create', '2', '权限信息-添加数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/authority/delete', '2', '权限信息-删除数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/authority/delete-all', '2', '权限信息-批量删除', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/authority/export', '2', '权限信息-导出数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/authority/index', '2', '权限信息-显示页面', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/authority/search', '2', '权限信息-搜索数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/authority/update', '2', '权限信息-修改数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/menu/create', '2', '导航栏目-添加数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/menu/delete', '2', '导航栏目-删除数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/menu/delete-all', '2', '导航栏目-批量删除', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/menu/export', '2', '导航栏目-导出数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/menu/index', '2', '导航栏目-显示页面', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/menu/search', '2', '导航栏目-搜索数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/menu/update', '2', '导航栏目-修改数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/module/create', '2', '模块生成-生成预览表单', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/module/index', '2', '模块生成-显示页面', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/module/produce', '2', '模块生成-生成文件', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/module/update', '2', '模块生成-生成预览文件', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/role/create', '2', '角色信息-添加数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/role/delete', '2', '角色信息-删除数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/role/edit', '2', '角色信息-分配权限', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/role/export', '2', '角色信息-导出数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/role/index', '2', '角色信息-显示页面', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/role/search', '2', '角色信息-搜索数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/role/update', '2', '角色信息-修改数据', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('admin/role/view', '2', '角色权限-查看详情', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('administrator', '1', '超级管理员', null, null, '1528516729', '1528516729');
INSERT INTO `auth_item` VALUES ('agreement/create', '2', '合同拟订-添加数据', null, null, '1559541051', '1559541051');
INSERT INTO `auth_item` VALUES ('agreement/delete', '2', '合同拟订-删除数据', null, null, '1559541051', '1559541051');
INSERT INTO `auth_item` VALUES ('agreement/delete-all', '2', '合同拟订-批量删除', null, null, '1559541051', '1559541051');
INSERT INTO `auth_item` VALUES ('agreement/export', '2', '合同拟订-导出数据', null, null, '1559541051', '1559541051');
INSERT INTO `auth_item` VALUES ('agreement/index', '2', '合同拟订-显示数据', null, null, '1559541051', '1559541051');
INSERT INTO `auth_item` VALUES ('agreement/leaseupdate', '2', '合同-更新租赁数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('agreement/search', '2', '合同拟订-搜索数据', null, null, '1559541051', '1559541051');
INSERT INTO `auth_item` VALUES ('agreement/select', '2', '合同拟订-选择数据', null, null, null, null);
INSERT INTO `auth_item` VALUES ('agreement/storageselect', '2', '合同-入库选择数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('agreement/update', '2', '合同拟订-修改数据', null, null, '1559541051', '1559541051');
INSERT INTO `auth_item` VALUES ('agreement/view', '2', '合同拟订-查看数据', null, null, '1528516795', '1528516795');
INSERT INTO `auth_item` VALUES ('ajax/getdata', '2', '实时获取数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('approval-agreement/create', '2', '合同审批-添加数据', null, null, '1559541283', '1559541283');
INSERT INTO `auth_item` VALUES ('approval-agreement/export', '2', '合同审批-导出数据', null, null, '1559541283', '1559541283');
INSERT INTO `auth_item` VALUES ('approval-agreement/index', '2', '合同审批-显示数据', null, null, '1559541283', '1559541283');
INSERT INTO `auth_item` VALUES ('approval-agreement/search', '2', '合同审批-搜索数据', null, null, '1559541283', '1559541283');
INSERT INTO `auth_item` VALUES ('approval-agreement/update', '2', '合同审批-修改数据', null, null, '1559541283', '1559541283');
INSERT INTO `auth_item` VALUES ('approval-agreement/view', '2', '合同审批-查看数据', null, null, '1528516795', '1528516795');
INSERT INTO `auth_item` VALUES ('approval-group/create', '2', '工程审批组授权-添加数据', null, null, '1559787075', '1559787075');
INSERT INTO `auth_item` VALUES ('approval-group/delete', '2', '工程审批组授权-删除数据', null, null, '1559787075', '1559787075');
INSERT INTO `auth_item` VALUES ('approval-group/delete-all', '2', '工程审批组授权-批量删除', null, null, '1559787075', '1559787075');
INSERT INTO `auth_item` VALUES ('approval-group/export', '2', '工程审批组授权-导出数据', null, null, '1559787075', '1559787075');
INSERT INTO `auth_item` VALUES ('approval-group/index', '2', '工程审批组授权-显示数据', null, null, '1559787075', '1559787075');
INSERT INTO `auth_item` VALUES ('approval-group/search', '2', '工程审批组授权-搜索数据', null, null, '1559787075', '1559787075');
INSERT INTO `auth_item` VALUES ('approval-group/update', '2', '工程审批组授权-修改数据', null, null, '1559787075', '1559787075');
INSERT INTO `auth_item` VALUES ('approval-pay/create', '2', '结算审批-添加数据', null, null, '1559541952', '1559541952');
INSERT INTO `auth_item` VALUES ('approval-pay/export', '2', '结算审批-导出数据', null, null, '1559541952', '1559541952');
INSERT INTO `auth_item` VALUES ('approval-pay/index', '2', '结算审批-显示数据', null, null, '1559541952', '1559541952');
INSERT INTO `auth_item` VALUES ('approval-pay/search', '2', '结算审批-搜索数据', null, null, '1559541952', '1559541952');
INSERT INTO `auth_item` VALUES ('approval-pay/update', '2', '结算审批-修改数据', null, null, '1559541952', '1559541952');
INSERT INTO `auth_item` VALUES ('approval-pay/view', '2', '结算审批-查看数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('approval-plan/create', '2', '计划审批-添加数据', null, null, '1559541196', '1559541196');
INSERT INTO `auth_item` VALUES ('approval-plan/export', '2', '计划审批-导出数据', null, null, '1559541196', '1559541196');
INSERT INTO `auth_item` VALUES ('approval-plan/index', '2', '计划审批-显示数据', null, null, '1559541196', '1559541196');
INSERT INTO `auth_item` VALUES ('approval-plan/search', '2', '计划审批-搜索数据', null, null, '1559541196', '1559541196');
INSERT INTO `auth_item` VALUES ('approval-plan/update', '2', '计划审批-修改数据', null, null, '1559541196', '1559541196');
INSERT INTO `auth_item` VALUES ('approval-plan/view', '2', '计划审批-查看数据', null, null, '1528516795', '1528516795');
INSERT INTO `auth_item` VALUES ('approval-pre-plan/create', '2', '意向单审批-添加数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('approval-pre-plan/export', '2', '意向单审批-导出数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('approval-pre-plan/index', '2', '意向单审批-显示数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('approval-pre-plan/search', '2', '意向单审批-搜索数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('approval-pre-plan/update', '2', '意向单审批-修改数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('approval-pre-plan/view', '2', '意向单审批-查看数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('approval-storage/create', '2', '入库审批-添加数据', null, null, '1559541878', '1559541878');
INSERT INTO `auth_item` VALUES ('approval-storage/export', '2', '入库审批-导出数据', null, null, '1559541878', '1559541878');
INSERT INTO `auth_item` VALUES ('approval-storage/index', '2', '入库审批-显示数据', null, null, '1559541878', '1559541878');
INSERT INTO `auth_item` VALUES ('approval-storage/search', '2', '入库审批-搜索数据', null, null, '1559541878', '1559541878');
INSERT INTO `auth_item` VALUES ('approval-storage/update', '2', '入库审批-修改数据', null, null, '1559541878', '1559541878');
INSERT INTO `auth_item` VALUES ('approval-storage/view', '2', '入库审批-查看数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('cart/delete', '2', '材料采购-删除数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('cart/update', '2', '材料采购-修改数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('category-material/create', '2', '材料字典-添加数据', null, null, '1559535294', '1559535294');
INSERT INTO `auth_item` VALUES ('category-material/delete', '2', '材料字典-删除数据', null, null, '1559535294', '1559535294');
INSERT INTO `auth_item` VALUES ('category-material/index', '2', '材料字典-显示数据', null, null, '1559535294', '1559535294');
INSERT INTO `auth_item` VALUES ('category-material/search', '2', '材料字典-搜索数据', null, null, '1559535294', '1559535294');
INSERT INTO `auth_item` VALUES ('category-material/update', '2', '材料字典-修改数据', null, null, '1559535294', '1559535294');
INSERT INTO `auth_item` VALUES ('category-material/view', '2', '材料字典-查看数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('category/create', '2', '材料分类-添加数据', null, null, '1559535294', '1559535294');
INSERT INTO `auth_item` VALUES ('category/delete', '2', '材料分类-删除数据', null, null, '1559535294', '1559535294');
INSERT INTO `auth_item` VALUES ('category/export', '2', '材料分类-导出数据', null, null, null, null);
INSERT INTO `auth_item` VALUES ('category/index', '2', '材料分类-显示数据', null, null, '1559535294', '1559535294');
INSERT INTO `auth_item` VALUES ('category/search', '2', '材料分类-搜索数据', null, null, '1559535294', '1559535294');
INSERT INTO `auth_item` VALUES ('category/storageselect', '2', '分类-入库选择数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('category/update', '2', '材料分类-修改数据', null, null, '1559535294', '1559535294');
INSERT INTO `auth_item` VALUES ('checkout-material/export', '2', '材料出库-导出数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('checkout-material/index', '2', '材料出库-显示数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('checkout-material/search', '2', '材料出库-搜索数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('checkout-material/update', '2', '材料出库-修改数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('checkout-material/view', '2', '材料出库-查看数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('items/create', '2', '工程用户对应权限-添加数据', null, null, '1559788020', '1559788020');
INSERT INTO `auth_item` VALUES ('items/delete', '2', '工程用户对应权限-删除数据', null, null, '1559788020', '1559788020');
INSERT INTO `auth_item` VALUES ('items/delete-all', '2', '工程用户对应权限-批量删除', null, null, '1559788020', '1559788020');
INSERT INTO `auth_item` VALUES ('items/export', '2', '工程用户对应权限-导出数据', null, null, '1559788020', '1559788020');
INSERT INTO `auth_item` VALUES ('items/index', '2', '工程用户对应权限-显示数据', null, null, '1559788020', '1559788020');
INSERT INTO `auth_item` VALUES ('items/search', '2', '工程用户对应权限-搜索数据', null, null, '1559788020', '1559788020');
INSERT INTO `auth_item` VALUES ('items/update', '2', '工程用户对应权限-修改数据', null, null, '1559788020', '1559788020');
INSERT INTO `auth_item` VALUES ('material/create', '2', '材料库-添加数据', null, null, '1559520761', '1559520761');
INSERT INTO `auth_item` VALUES ('material/delete', '2', '材料库-删除数据', null, null, '1559520761', '1559520761');
INSERT INTO `auth_item` VALUES ('material/delete-all', '2', '材料库-批量删除', null, null, '1559520761', '1559520761');
INSERT INTO `auth_item` VALUES ('material/export', '2', '材料库-导出数据', null, null, '1559520761', '1559520761');
INSERT INTO `auth_item` VALUES ('material/index', '2', '材料库-显示数据', null, null, '1559520761', '1559520761');
INSERT INTO `auth_item` VALUES ('material/search', '2', '材料库-搜索数据', null, null, '1559520761', '1559520761');
INSERT INTO `auth_item` VALUES ('material/select', '2', '材料库-选择数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('material/update', '2', '材料库-修改数据', null, null, '1559520761', '1559520761');
INSERT INTO `auth_item` VALUES ('material/view', '2', '材料库-显示数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('pay/create', '2', '财务结算-添加数据', null, null, '1559541923', '1559541923');
INSERT INTO `auth_item` VALUES ('pay/delete', '2', '入库结算-删除数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('pay/export', '2', '财务结算-导出数据', null, null, '1559541923', '1559541923');
INSERT INTO `auth_item` VALUES ('pay/index', '2', '财务结算-显示数据', null, null, '1559541923', '1559541923');
INSERT INTO `auth_item` VALUES ('pay/search', '2', '财务结算-搜索数据', null, null, '1559541923', '1559541923');
INSERT INTO `auth_item` VALUES ('pay/update', '2', '财务结算-修改数据', null, null, '1559541923', '1559541923');
INSERT INTO `auth_item` VALUES ('pay/view', '2', '财务结算-查看数据', null, null, '1528516795', '1528516795');
INSERT INTO `auth_item` VALUES ('plan/create', '2', '材料计划-添加数据', null, null, '1559541001', '1559541001');
INSERT INTO `auth_item` VALUES ('plan/delete', '2', '材料计划-删除数据', null, null, '1559541001', '1559541001');
INSERT INTO `auth_item` VALUES ('plan/delete-all', '2', '材料计划-批量删除', null, null, '1559541001', '1559541001');
INSERT INTO `auth_item` VALUES ('plan/export', '2', '材料计划-导出数据', null, null, '1559541001', '1559541001');
INSERT INTO `auth_item` VALUES ('plan/index', '2', '材料计划-显示数据', null, null, '1559541001', '1559541001');
INSERT INTO `auth_item` VALUES ('plan/search', '2', '材料计划-搜索数据', null, null, '1559541001', '1559541001');
INSERT INTO `auth_item` VALUES ('plan/select', '2', '材料计划-选择数据', null, null, null, null);
INSERT INTO `auth_item` VALUES ('plan/update', '2', '材料计划-修改数据', null, null, '1559541001', '1559541001');
INSERT INTO `auth_item` VALUES ('plan/view', '2', '材料计划-查看数据', null, null, '1559599926', '1559599926');
INSERT INTO `auth_item` VALUES ('pre-cart/delete', '2', '意向单采购-删除数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('pre-cart/update', '2', '意向单采购-修改数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('pre-plan/create', '2', '意向单-添加数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('pre-plan/delete', '2', '意向单-删除数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('pre-plan/delete-all', '2', '意向单-批量删除', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('pre-plan/export', '2', '意向单-导出数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('pre-plan/index', '2', '意向单-显示数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('pre-plan/search', '2', '意向单-搜索数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('pre-plan/select', '2', '意向单-选择数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('pre-plan/update', '2', '意向单-修改数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('pre-plan/view', '2', '意向单-查看数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('project-grant/loaditems', '2', '加载工程授权', null, null, '1528516795', '1528516795');
INSERT INTO `auth_item` VALUES ('project-grant/save', '2', '保存工程授权', null, null, '1528516795', '1528516795');
INSERT INTO `auth_item` VALUES ('project-grant/update', '2', '更新工程授权', null, null, '1528516795', '1528516795');
INSERT INTO `auth_item` VALUES ('project-grant/view', '2', '查看工程授权', null, null, '1528516795', '1528516795');
INSERT INTO `auth_item` VALUES ('project/create', '2', '工程管理-添加数据', null, null, '1559488580', '1559488580');
INSERT INTO `auth_item` VALUES ('project/delete', '2', '工程管理-删除数据', null, null, '1559488580', '1559488580');
INSERT INTO `auth_item` VALUES ('project/delete-all', '2', '工程管理-批量删除', null, null, '1559488580', '1559488580');
INSERT INTO `auth_item` VALUES ('project/export', '2', '工程管理-导出数据', null, null, '1559488580', '1559488580');
INSERT INTO `auth_item` VALUES ('project/index', '2', '工程管理-显示数据', null, null, '1559488580', '1559488580');
INSERT INTO `auth_item` VALUES ('project/search', '2', '工程管理-搜索数据', null, null, '1559488580', '1559488580');
INSERT INTO `auth_item` VALUES ('project/update', '2', '工程管理-修改数据', null, null, '1559488580', '1559488580');
INSERT INTO `auth_item` VALUES ('project/view', '2', '工程管理-查看数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('site/export', '2', '网站-数据导出', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('site/helpdoc', '2', '网站-帮助文档', null, null, null, null);
INSERT INTO `auth_item` VALUES ('storage-lease/create', '2', '租赁入库-添加数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-lease/delete', '2', '租赁入库-删除数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-lease/export', '2', '租赁入库-导出数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-lease/index', '2', '租赁入库-显示数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-lease/search', '2', '租赁入库-搜索数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-lease/update', '2', '租赁入库-修改数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-lease/view', '2', '租赁入库-查看数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-material/create', '2', '材料入库-添加数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-material/delete', '2', '材料入库-删除数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-material/export', '2', '材料入库-导出数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-material/index', '2', '材料入库-显示数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-material/search', '2', '材料入库-搜索数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-material/update', '2', '材料入库-修改数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-material/view', '2', '材料入库-查看数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-ticket/create', '2', '小票入库-添加数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-ticket/delete', '2', '小票入库-删除数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-ticket/export', '2', '小票入库-导出数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-ticket/index', '2', '小票入库-显示数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-ticket/search', '2', '小票入库-搜索数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-ticket/update', '2', '小票入库-修改数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage-ticket/view', '2', '小票入库-查看数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage/export', '2', '入库材料查询导出', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('storage/search', '2', '入库材料查询', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('supplier/create', '2', '供应商-添加数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('supplier/delete', '2', '供应商-删除数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('supplier/delete-all', '2', '供应商-批量删除', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('supplier/export', '2', '供应商-导出数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('supplier/index', '2', '供应商-显示数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('supplier/search', '2', '供应商-搜索数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('supplier/storageselect', '2', '供应商-入库选择数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('supplier/update', '2', '供应商-修改数据', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('system-grant/save', '2', '保存系统赋权', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('system-grant/update', '2', '更新系统赋权', null, null, '1559538985', '1559538985');
INSERT INTO `auth_item` VALUES ('system-grant/view', '2', '查看系统赋权', null, null, '1559538985', '1559538985');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('admin', '/agreement/select');
INSERT INTO `auth_item_child` VALUES ('administrator', '/agreement/select');
INSERT INTO `auth_item_child` VALUES ('admin', '/plan/select');
INSERT INTO `auth_item_child` VALUES ('administrator', '/plan/select');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/admin-log/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/admin-log/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/admin-log/delete-all');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/admin-log/delete-all');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/admin-log/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/admin-log/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/admin-log/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/admin-log/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/admin-log/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/admin-log/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/admin/address');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/admin/address');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/admin/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/admin/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/admin/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/admin/delete-all');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/admin/editable');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/admin/editable');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/admin/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/admin/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/admin/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/admin/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/admin/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/admin/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/admin/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/admin/upload');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/admin/upload');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/admin/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/admin/view');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/auth-assignment/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/auth-assignment/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/auth-assignment/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/auth-assignment/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/auth-assignment/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/auth-assignment/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/auth-assignment/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/auth-assignment/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/auth-assignment/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/auth-assignment/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/auth-rule/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/auth-rule/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/auth-rule/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/auth-rule/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/auth-rule/delete-all');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/auth-rule/delete-all');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/auth-rule/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/auth-rule/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/auth-rule/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/auth-rule/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/auth-rule/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/auth-rule/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/auth-rule/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/auth-rule/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/authority/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/authority/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/authority/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/authority/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/authority/delete-all');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/authority/delete-all');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/authority/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/authority/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/authority/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/authority/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/authority/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/authority/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/authority/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/authority/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/menu/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/menu/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/menu/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/menu/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/menu/delete-all');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/menu/delete-all');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/menu/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/menu/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/menu/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/menu/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/menu/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/menu/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/menu/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/menu/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/module/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/module/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/module/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/module/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/module/produce');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/module/produce');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/module/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/module/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/role/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/role/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/role/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/role/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/role/edit');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/role/edit');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/role/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/role/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/role/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/role/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/role/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/role/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/role/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/role/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'admin/role/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'admin/role/view');
INSERT INTO `auth_item_child` VALUES ('admin', 'agreement/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'agreement/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'agreement/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'agreement/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'agreement/delete-all');
INSERT INTO `auth_item_child` VALUES ('administrator', 'agreement/delete-all');
INSERT INTO `auth_item_child` VALUES ('admin', 'agreement/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'agreement/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'agreement/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'agreement/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'agreement/leaseupdate');
INSERT INTO `auth_item_child` VALUES ('administrator', 'agreement/leaseupdate');
INSERT INTO `auth_item_child` VALUES ('admin', 'agreement/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'agreement/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'agreement/select');
INSERT INTO `auth_item_child` VALUES ('administrator', 'agreement/select');
INSERT INTO `auth_item_child` VALUES ('admin', 'agreement/storageselect');
INSERT INTO `auth_item_child` VALUES ('administrator', 'agreement/storageselect');
INSERT INTO `auth_item_child` VALUES ('admin', 'agreement/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'agreement/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'agreement/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'agreement/view');
INSERT INTO `auth_item_child` VALUES ('admin', 'ajax/getdata');
INSERT INTO `auth_item_child` VALUES ('administrator', 'ajax/getdata');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-agreement/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-agreement/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-agreement/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-agreement/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-agreement/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-agreement/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-agreement/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-agreement/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-agreement/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-agreement/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-agreement/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-agreement/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-group/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-group/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-group/delete-all');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-group/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-group/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-group/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-group/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-pay/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-pay/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-pay/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-pay/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-pay/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-pay/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-pay/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-pay/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-pay/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-pay/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-pay/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-pay/view');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-plan/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-plan/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-plan/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-plan/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-plan/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-plan/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-plan/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-plan/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-plan/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-plan/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-plan/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-plan/view');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-pre-plan/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-pre-plan/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-pre-plan/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-pre-plan/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-pre-plan/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-pre-plan/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-pre-plan/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-pre-plan/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-pre-plan/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-pre-plan/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-pre-plan/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-pre-plan/view');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-storage/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-storage/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-storage/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-storage/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-storage/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-storage/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-storage/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-storage/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-storage/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-storage/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'approval-storage/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'approval-storage/view');
INSERT INTO `auth_item_child` VALUES ('admin', 'cart/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'cart/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'cart/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'cart/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'category-material/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'category-material/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'category-material/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'category-material/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'category-material/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'category-material/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'category-material/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'category-material/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'category-material/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'category-material/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'category-material/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'category-material/view');
INSERT INTO `auth_item_child` VALUES ('admin', 'category/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'category/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'category/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'category/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'category/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'category/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'category/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'category/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'category/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'category/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'category/storageselect');
INSERT INTO `auth_item_child` VALUES ('administrator', 'category/storageselect');
INSERT INTO `auth_item_child` VALUES ('admin', 'category/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'category/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'checkout-material/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'checkout-material/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'checkout-material/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'checkout-material/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'checkout-material/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'checkout-material/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'checkout-material/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'checkout-material/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'checkout-material/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'checkout-material/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'items/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'items/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'items/delete-all');
INSERT INTO `auth_item_child` VALUES ('administrator', 'items/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'items/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'items/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'items/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'material/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'material/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'material/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'material/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'material/delete-all');
INSERT INTO `auth_item_child` VALUES ('administrator', 'material/delete-all');
INSERT INTO `auth_item_child` VALUES ('admin', 'material/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'material/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'material/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'material/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'material/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'material/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'material/select');
INSERT INTO `auth_item_child` VALUES ('administrator', 'material/select');
INSERT INTO `auth_item_child` VALUES ('admin', 'material/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'material/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'material/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'material/view');
INSERT INTO `auth_item_child` VALUES ('admin', 'pay/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pay/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'pay/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pay/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'pay/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pay/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'pay/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pay/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'pay/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pay/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'pay/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pay/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'pay/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pay/view');
INSERT INTO `auth_item_child` VALUES ('admin', 'plan/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'plan/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'plan/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'plan/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'plan/delete-all');
INSERT INTO `auth_item_child` VALUES ('administrator', 'plan/delete-all');
INSERT INTO `auth_item_child` VALUES ('admin', 'plan/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'plan/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'plan/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'plan/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'plan/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'plan/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'plan/select');
INSERT INTO `auth_item_child` VALUES ('administrator', 'plan/select');
INSERT INTO `auth_item_child` VALUES ('admin', 'plan/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'plan/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'plan/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'plan/view');
INSERT INTO `auth_item_child` VALUES ('admin', 'pre-cart/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pre-cart/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'pre-cart/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pre-cart/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'pre-plan/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pre-plan/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'pre-plan/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pre-plan/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'pre-plan/delete-all');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pre-plan/delete-all');
INSERT INTO `auth_item_child` VALUES ('admin', 'pre-plan/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pre-plan/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'pre-plan/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pre-plan/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'pre-plan/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pre-plan/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'pre-plan/select');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pre-plan/select');
INSERT INTO `auth_item_child` VALUES ('admin', 'pre-plan/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pre-plan/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'pre-plan/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'pre-plan/view');
INSERT INTO `auth_item_child` VALUES ('admin', 'project-grant/loaditems');
INSERT INTO `auth_item_child` VALUES ('administrator', 'project-grant/loaditems');
INSERT INTO `auth_item_child` VALUES ('admin', 'project-grant/save');
INSERT INTO `auth_item_child` VALUES ('administrator', 'project-grant/save');
INSERT INTO `auth_item_child` VALUES ('admin', 'project-grant/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'project-grant/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'project-grant/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'project-grant/view');
INSERT INTO `auth_item_child` VALUES ('admin', 'project/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'project/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'project/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'project/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'project/delete-all');
INSERT INTO `auth_item_child` VALUES ('administrator', 'project/delete-all');
INSERT INTO `auth_item_child` VALUES ('admin', 'project/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'project/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'project/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'project/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'project/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'project/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'project/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'project/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'project/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'project/view');
INSERT INTO `auth_item_child` VALUES ('admin', 'site/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'site/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'site/helpdoc');
INSERT INTO `auth_item_child` VALUES ('administrator', 'site/helpdoc');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-lease/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-lease/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-lease/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-lease/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-lease/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-lease/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-lease/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-lease/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-lease/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-lease/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-lease/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-lease/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-lease/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-lease/view');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-material/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-material/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-material/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-material/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-material/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-material/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-material/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-material/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-material/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-material/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-material/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-material/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-material/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-material/view');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-ticket/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-ticket/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-ticket/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-ticket/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-ticket/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-ticket/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-ticket/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-ticket/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-ticket/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-ticket/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-ticket/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-ticket/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage-ticket/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage-ticket/view');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'storage/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'storage/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'supplier/create');
INSERT INTO `auth_item_child` VALUES ('administrator', 'supplier/create');
INSERT INTO `auth_item_child` VALUES ('admin', 'supplier/delete');
INSERT INTO `auth_item_child` VALUES ('administrator', 'supplier/delete');
INSERT INTO `auth_item_child` VALUES ('admin', 'supplier/delete-all');
INSERT INTO `auth_item_child` VALUES ('administrator', 'supplier/delete-all');
INSERT INTO `auth_item_child` VALUES ('admin', 'supplier/export');
INSERT INTO `auth_item_child` VALUES ('administrator', 'supplier/export');
INSERT INTO `auth_item_child` VALUES ('admin', 'supplier/index');
INSERT INTO `auth_item_child` VALUES ('administrator', 'supplier/index');
INSERT INTO `auth_item_child` VALUES ('admin', 'supplier/search');
INSERT INTO `auth_item_child` VALUES ('administrator', 'supplier/search');
INSERT INTO `auth_item_child` VALUES ('admin', 'supplier/storageselect');
INSERT INTO `auth_item_child` VALUES ('administrator', 'supplier/storageselect');
INSERT INTO `auth_item_child` VALUES ('admin', 'supplier/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'supplier/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'system-grant/save');
INSERT INTO `auth_item_child` VALUES ('administrator', 'system-grant/save');
INSERT INTO `auth_item_child` VALUES ('admin', 'system-grant/update');
INSERT INTO `auth_item_child` VALUES ('administrator', 'system-grant/update');
INSERT INTO `auth_item_child` VALUES ('admin', 'system-grant/view');
INSERT INTO `auth_item_child` VALUES ('administrator', 'system-grant/view');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('admin', 0x4F3A32393A226A696E78696E675C61646D696E5C72756C65735C41646D696E52756C65223A333A7B733A343A226E616D65223B733A353A2261646D696E223B733A393A22637265617465644174223B693A313532363732333535343B733A393A22757064617465644174223B693A313532363732333535343B7D, '1528516729', '1528516729');
INSERT INTO `auth_rule` VALUES ('admin-delete', 0x4F3A33353A226A696E78696E675C61646D696E5C72756C65735C41646D696E44656C65746552756C65223A333A7B733A343A226E616D65223B733A31323A2261646D696E2D64656C657465223B733A393A22637265617465644174223B693A313532363732333537333B733A393A22757064617465644174223B693A313532363732333537333B7D, '1528516729', '1528516729');
INSERT INTO `auth_rule` VALUES ('auth-assignment', 0x4F3A33383A226A696E78696E675C61646D696E5C72756C65735C4175746841737369676E6D656E7452756C65223A333A7B733A343A226E616D65223B733A31353A22617574682D61737369676E6D656E74223B733A393A22637265617465644174223B693A313532363732333630363B733A393A22757064617465644174223B693A313532363732333630363B7D, '1528516729', '1528516729');

-- ----------------------------
-- Table structure for dtoa_agreement
-- ----------------------------
DROP TABLE IF EXISTS `dtoa_agreement`;
CREATE TABLE `dtoa_agreement` (
  `h_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '合同ID',
  `g_id` int(10) unsigned NOT NULL COMMENT '工程ID',
  `s_id` int(10) unsigned NOT NULL COMMENT '供应商ID',
  `h_no` char(20) NOT NULL COMMENT '合同编号',
  `h_name` varchar(255) NOT NULL COMMENT '合同名',
  `h_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '合同类型 1买卖合同 2租赁合同',
  `h_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '合同状态 0筹备 1未审批',
  `next_admin_id` int(10) unsigned NOT NULL COMMENT '下个审批人ID',
  `approval_time` datetime DEFAULT NULL COMMENT '审批通过时间',
  `need_date` date DEFAULT NULL COMMENT '生效日期',
  `total_price` decimal(12,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '总金额',
  `h_info` text COMMENT '合同备注',
  `creator_id` int(10) unsigned DEFAULT NULL COMMENT '创建者ID',
  `creator` varchar(50) NOT NULL COMMENT '创建者',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`h_id`),
  KEY `g_id` (`g_id`),
  KEY `s_id` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同表';

-- ----------------------------
-- Records of dtoa_agreement
-- ----------------------------

-- ----------------------------
-- Table structure for dtoa_approval
-- ----------------------------
DROP TABLE IF EXISTS `dtoa_approval`;
CREATE TABLE `dtoa_approval` (
  `a_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '审批ID',
  `g_id` int(10) unsigned NOT NULL COMMENT '工程ID',
  `table_index` tinyint(1) unsigned NOT NULL COMMENT '审批对象:1-计划 2-合同 3-入库 4-结算',
  `target_id` int(10) unsigned NOT NULL COMMENT '审批对象ID 计划ID/合同ID等',
  `approver_id` int(10) unsigned NOT NULL COMMENT '审批人ID',
  `approver` varchar(100) NOT NULL COMMENT '审批人',
  `a_status` tinyint(1) unsigned NOT NULL COMMENT '审批状态 1通过 0拒绝',
  `a_info` varchar(255) DEFAULT NULL COMMENT '审批备注',
  `created_at` timestamp NOT NULL COMMENT '审批时间',
  PRIMARY KEY (`a_id`),
  KEY `g_id` (`g_id`),
  KEY `user_id` (`approver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4602 DEFAULT CHARSET=utf8 COMMENT='审批记录表';

-- ----------------------------
-- Records of dtoa_approval
-- ----------------------------
INSERT INTO `dtoa_approval` VALUES ('4601', '2', '1', '1', '40', '孙七', '1', 'ok', '2022-09-01 17:19:45');

-- ----------------------------
-- Table structure for dtoa_approval_group
-- ----------------------------
DROP TABLE IF EXISTS `dtoa_approval_group`;
CREATE TABLE `dtoa_approval_group` (
  `q_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `g_id` int(10) unsigned NOT NULL COMMENT '工程ID',
  `item_id` int(10) unsigned NOT NULL COMMENT '权限ID DtoaProject::PROJECT_APPROVAL_ITEMS',
  `uid_arr` text COMMENT '审批权限用户数组 [用户ID,用户ID]',
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='工程审批组分配表';

-- ----------------------------
-- Records of dtoa_approval_group
-- ----------------------------
INSERT INTO `dtoa_approval_group` VALUES ('1', '0', '1', '[[34],[37,36]]');
INSERT INTO `dtoa_approval_group` VALUES ('2', '0', '2', '[[34,37,35,36,39],[35]]');
INSERT INTO `dtoa_approval_group` VALUES ('3', '1', '11', '[[38,34,40,35],[40]]');
INSERT INTO `dtoa_approval_group` VALUES ('4', '1', '12', '[[35],[40]]');
INSERT INTO `dtoa_approval_group` VALUES ('5', '1', '1', '[[35],[40]]');
INSERT INTO `dtoa_approval_group` VALUES ('6', '1', '2', '[[38,35,40],[40]]');
INSERT INTO `dtoa_approval_group` VALUES ('7', '1', '3', '[[35],[40]]');
INSERT INTO `dtoa_approval_group` VALUES ('8', '1', '4', '[[40],[36,39,37]]');
INSERT INTO `dtoa_approval_group` VALUES ('9', '1', '5', '[[35],[40]]');
INSERT INTO `dtoa_approval_group` VALUES ('10', '1', '6', '[[40],[36,37]]');
INSERT INTO `dtoa_approval_group` VALUES ('11', '1', '13', '[[40],[39,37]]');
INSERT INTO `dtoa_approval_group` VALUES ('12', '1', '14', '[[40],[36]]');
INSERT INTO `dtoa_approval_group` VALUES ('13', '1', '9', '[[40],[36]]');
INSERT INTO `dtoa_approval_group` VALUES ('14', '1', '10', '[[40],[36]]');
INSERT INTO `dtoa_approval_group` VALUES ('15', '1', '7', '[[40],[40]]');
INSERT INTO `dtoa_approval_group` VALUES ('16', '1', '8', '[[40],[36,39,37]]');
INSERT INTO `dtoa_approval_group` VALUES ('17', '2', '11', '[[38,34,40,35],[40]]');
INSERT INTO `dtoa_approval_group` VALUES ('18', '2', '12', '[[35],[40]]');
INSERT INTO `dtoa_approval_group` VALUES ('19', '2', '1', '[[35],[40]]');
INSERT INTO `dtoa_approval_group` VALUES ('20', '2', '2', '[[38,35,40],[40]]');
INSERT INTO `dtoa_approval_group` VALUES ('21', '2', '3', '[[35],[40]]');
INSERT INTO `dtoa_approval_group` VALUES ('22', '2', '4', '[[40],[36,39,37]]');
INSERT INTO `dtoa_approval_group` VALUES ('23', '2', '5', '[[35],[40]]');
INSERT INTO `dtoa_approval_group` VALUES ('24', '2', '6', '[[40],[36,37]]');
INSERT INTO `dtoa_approval_group` VALUES ('25', '2', '13', '[[40],[39,37]]');
INSERT INTO `dtoa_approval_group` VALUES ('26', '2', '14', '[[40],[36]]');
INSERT INTO `dtoa_approval_group` VALUES ('27', '2', '9', '[[40],[36]]');
INSERT INTO `dtoa_approval_group` VALUES ('28', '2', '10', '[[40],[36]]');
INSERT INTO `dtoa_approval_group` VALUES ('29', '2', '7', '[[40],[40]]');
INSERT INTO `dtoa_approval_group` VALUES ('30', '2', '8', '[[40],[36,39,37]]');

-- ----------------------------
-- Table structure for dtoa_cart
-- ----------------------------
DROP TABLE IF EXISTS `dtoa_cart`;
CREATE TABLE `dtoa_cart` (
  `jc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '采购ID',
  `j_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '计划ID',
  `h_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '合同ID',
  `c_id` int(10) unsigned NOT NULL COMMENT '材料ID',
  `j_num` decimal(12,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '材料采购数量 0不限制 合同材料可能会限制数量',
  `surplus_num` decimal(12,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '材料剩余未入库数量',
  `j_price` decimal(12,3) unsigned NOT NULL COMMENT '材料采购单价',
  `lease_time` decimal(12,3) unsigned DEFAULT '0.000' COMMENT '租赁时间',
  `lease_time_unit` varchar(20) NOT NULL DEFAULT '' COMMENT '租赁时间单位',
  `surplus_time` decimal(10,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '剩余未入库租赁时间',
  `one_price` decimal(12,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '材料采购价格',
  `jc_info` varchar(255) NOT NULL COMMENT '材料采购备注',
  `c_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '材料入库状态 0-未入库 1-已入库',
  `creator_id` int(10) unsigned NOT NULL COMMENT '创建者ID',
  `creator` varchar(255) NOT NULL COMMENT '创建者',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`jc_id`),
  KEY `j_id` (`j_id`),
  KEY `c_id` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='材料采购表';

-- ----------------------------
-- Records of dtoa_cart
-- ----------------------------
INSERT INTO `dtoa_cart` VALUES ('1', '1', '0', '193', '100.000', '100.000', '0.100', '0.000', '', '0.000', '10.000', '', '0', '1', '管理员', '2022-09-01 17:17:48', null);
INSERT INTO `dtoa_cart` VALUES ('2', '1', '0', '328', '1000.000', '1000.000', '0.150', '0.000', '', '0.000', '150.000', '', '0', '1', '管理员', '2022-09-01 17:17:48', null);
INSERT INTO `dtoa_cart` VALUES ('3', '1', '0', '585', '50.000', '50.000', '600.000', '0.000', '', '0.000', '30000.000', '', '0', '1', '管理员', '2022-09-01 17:17:48', null);
INSERT INTO `dtoa_cart` VALUES ('4', '1', '0', '587', '600.000', '600.000', '20.000', '0.000', '', '0.000', '12000.000', '', '0', '1', '管理员', '2022-09-01 17:17:48', null);
INSERT INTO `dtoa_cart` VALUES ('5', '1', '0', '588', '8000.000', '8000.000', '0.001', '0.000', '', '0.000', '8.000', '', '0', '1', '管理员', '2022-09-01 17:17:48', null);
INSERT INTO `dtoa_cart` VALUES ('6', '1', '0', '589', '1.000', '1.000', '8000.000', '0.000', '', '0.000', '8000.000', '', '0', '1', '管理员', '2022-09-01 17:17:48', null);

-- ----------------------------
-- Table structure for dtoa_category
-- ----------------------------
DROP TABLE IF EXISTS `dtoa_category`;
CREATE TABLE `dtoa_category` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `cate_no` int(20) unsigned NOT NULL COMMENT '材料分类编码',
  `cname` varchar(255) NOT NULL COMMENT '分类名',
  `cate_type` varchar(255) NOT NULL COMMENT '分类类型:消耗材料、商砼、周转材料',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8 COMMENT='材料库材料分类表';

-- ----------------------------
-- Records of dtoa_category
-- ----------------------------
INSERT INTO `dtoa_category` VALUES ('1', '0', '1', '一般消耗材料', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('2', '1', '101', '钢材', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('3', '1', '102', '木材', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('4', '1', '103', '水泥', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('5', '1', '104', '地材', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('6', '1', '105', '建材', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('7', '1', '106', '门窗', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('8', '1', '107', '五金制品', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('9', '0', '2', '商砼混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('10', '9', '201', '普通混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('12', '9', '203', '抗渗混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('13', '0', '3', '周转材料', '周转材料');
INSERT INTO `dtoa_category` VALUES ('30', '9', '204', '泵送混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('31', '9', '205', '泵送抗渗混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('36', '1', '108', '油漆及化工', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('37', '1', '109', '橡塑制品', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('38', '1', '110', '电气材料', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('39', '1', '111', '水暖器材', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('41', '1', '112', '低值易耗品', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('44', '13', '301', '机械设备', '周转材料');
INSERT INTO `dtoa_category` VALUES ('45', '13', '302', '安全设施', '周转材料');
INSERT INTO `dtoa_category` VALUES ('46', '45', '30201', '安全设备', '周转材料');
INSERT INTO `dtoa_category` VALUES ('47', '45', '30202', '文明施工', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('48', '2', '10101', '管材', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('49', '2', '10102', '型材', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('50', '2', '10103', '板材', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('51', '2', '10104', '钢筋', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('52', '48', '1010101', '镀锌焊接钢管', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('53', '48', '1010102', '焊接钢管', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('54', '48', '1010103', '无缝管', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('55', '49', '1010201', '槽钢', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('57', '49', '1010202', 'H型钢', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('58', '49', '1010203', '扁钢', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('59', '38', '11001', '管线敷设', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('65', '9', '206', '细石混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('66', '9', '207', '冬施混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('67', '9', '208', '冬施泵送混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('68', '9', '209', '冬施泵送抗渗混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('69', '9', '210', '无粉煤灰混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('70', '0', '4', '分包项目', '专业分包');
INSERT INTO `dtoa_category` VALUES ('71', '70', '401', '卫生间隔板', '专业分包');
INSERT INTO `dtoa_category` VALUES ('72', '70', '402', '防水', '专业分包');
INSERT INTO `dtoa_category` VALUES ('73', '70', '403', '土方', '专业分包');
INSERT INTO `dtoa_category` VALUES ('74', '0', '5', '机械设备租赁', '租赁');
INSERT INTO `dtoa_category` VALUES ('75', '74', '501', '机械租赁', '租赁');
INSERT INTO `dtoa_category` VALUES ('76', '74', '502', '设备租赁', '租赁');
INSERT INTO `dtoa_category` VALUES ('77', '0', '6', '施工管理费', '施工管理');
INSERT INTO `dtoa_category` VALUES ('78', '77', '601', '试验费', '施工管理');
INSERT INTO `dtoa_category` VALUES ('79', '77', '602', '水费', '施工管理');
INSERT INTO `dtoa_category` VALUES ('80', '77', '603', '电费', '施工管理');
INSERT INTO `dtoa_category` VALUES ('81', '75', '50101', '挖掘机', '租赁');
INSERT INTO `dtoa_category` VALUES ('82', '75', '50102', '铲车', '租赁');
INSERT INTO `dtoa_category` VALUES ('83', '75', '50103', '推土机', '租赁');
INSERT INTO `dtoa_category` VALUES ('84', '75', '50104', '运输车', '租赁');
INSERT INTO `dtoa_category` VALUES ('85', '75', '50105', '吊车', '租赁');
INSERT INTO `dtoa_category` VALUES ('86', '75', '50106', '压路机', '租赁');
INSERT INTO `dtoa_category` VALUES ('88', '1', '113', '办公用品', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('90', '8', '10701', '五金材料', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('91', '38', '11002', '电气辅材', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('92', '39', '11101', '镀锌管件', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('93', '39', '11102', '控水主材', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('94', '39', '11103', '镀锌衬塑管件', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('95', '51', '1010401', '螺纹', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('96', '51', '1010402', '线材', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('97', '3', '10201', '板材', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('98', '3', '10202', '木方', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('99', '5', '10401', '砂子', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('100', '5', '10402', '石子', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('101', '5', '10403', '砌块砖等', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('102', '5', '10404', '级配砂石', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('103', '5', '10405', '砂浆', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('104', '48', '1010104', '镀锌衬塑管', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('105', '38', '11003', '电箱', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('106', '39', '11104', '水表', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('107', '39', '11105', 'PPR管材管件', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('108', '39', '11106', '水暖设备（消耗）', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('109', '39', '11107', '球墨管材管件', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('110', '38', '11004', '线槽桥架', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('111', '39', '11108', '电熔管材管件', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('112', '38', '11005', '灯具', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('113', '38', '11006', 'PVC线管材件', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('114', '38', '11007', '电线电缆', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('115', '38', '11008', '电气设备安装材料', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('116', '36', '10801', '油漆水漆', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('117', '36', '10802', '化工产品', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('118', '8', '10702', '五金工具', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('119', '8', '10703', '焊接冲压管件', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('120', '8', '10704', '五金设备配件', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('121', '8', '10705', '金属构件', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('122', '39', '11109', '水暖辅材', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('123', '37', '10901', '橡塑制品', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('125', '6', '10501', '瓷砖', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('127', '6', '10502', '石材', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('128', '37', '10902', '保温材料', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('129', '39', '11110', 'PVC管材管件', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('130', '39', '11111', '铝塑管材管件', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('131', '39', '11112', '不锈钢给水材料', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('132', '39', '11113', '散热器', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('133', '5', '10406', '砼构件', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('134', '6', '10503', '小型材料', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('135', '49', '1010204', '角钢', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('136', '50', '1010301', '加工铁板', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('137', '48', '1010105', '方管', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('138', '9', '211', '无粉煤灰冬施混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('139', '9', '212', '冬施细石混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('140', '75', '50107', '汽车泵', '租赁');
INSERT INTO `dtoa_category` VALUES ('141', '75', '50108', '破碎机', '租赁');
INSERT INTO `dtoa_category` VALUES ('142', '39', '11114', '卫浴安装', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('143', '51', '1010403', '圆钢', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('144', '70', '404', '扶手栏杆', '专业分包');
INSERT INTO `dtoa_category` VALUES ('145', '44', '30101', '设备维修', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('146', '44', '30102', '机械设备', '周转材料');
INSERT INTO `dtoa_category` VALUES ('147', '39', '11115', '沟槽管件', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('148', '7', '10601', '木门', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('149', '39', '11116', '消防管材管件（消耗）', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('150', '9', '213', '冬施抗渗混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('151', '9', '214', '无粉煤灰泵送混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('152', '39', '11117', 'PE管材管件', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('153', '7', '10602', '防火门', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('154', '50', '1010302', '板材', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('155', '13', '303', '临建设备', '周转材料');
INSERT INTO `dtoa_category` VALUES ('156', '155', '30301', '临建周转设备', '周转材料');
INSERT INTO `dtoa_category` VALUES ('158', '70', '405', '玻璃幕墙', '专业分包');
INSERT INTO `dtoa_category` VALUES ('159', '6', '10504', '其他建材', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('160', '7', '10603', '窗及制品', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('161', '9', '215', '泵送细石混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('162', '1', '114', '有色金属', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('163', '162', '11401', '铜', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('164', '9', '216', '抗渗膨胀混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('165', '9', '217', '轻集料混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('167', '75', '50109', '其他', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('168', '70', '406', '地板', '专业分包');
INSERT INTO `dtoa_category` VALUES ('169', '9', '218', '冬施抗渗膨胀混凝土', '商砼');
INSERT INTO `dtoa_category` VALUES ('170', '7', '10604', '其他门', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('171', '49', '1010205', '其他', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('172', '6', '10505', '瓦', '消耗材料');
INSERT INTO `dtoa_category` VALUES ('173', '9', '219', '砂浆', '商砼');
INSERT INTO `dtoa_category` VALUES ('174', '70', '407', '其他', '专业分包');

-- ----------------------------
-- Table structure for dtoa_items
-- ----------------------------
DROP TABLE IF EXISTS `dtoa_items`;
CREATE TABLE `dtoa_items` (
  `i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `g_id` int(10) unsigned NOT NULL COMMENT '工程ID',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `item_arr` varchar(255) NOT NULL DEFAULT '' COMMENT '权限数组 [权限ID,权限ID]',
  PRIMARY KEY (`i_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='工程用户对应权限表';

-- ----------------------------
-- Records of dtoa_items
-- ----------------------------
INSERT INTO `dtoa_items` VALUES ('1', '0', '34', '[[1,2]]');
INSERT INTO `dtoa_items` VALUES ('2', '0', '35', '[[2],[2]]');
INSERT INTO `dtoa_items` VALUES ('3', '0', '36', '{\"1\":[1],\"0\":[2]}');
INSERT INTO `dtoa_items` VALUES ('4', '0', '37', '{\"1\":[1],\"0\":[2]}');
INSERT INTO `dtoa_items` VALUES ('5', '0', '39', '[[2]]');
INSERT INTO `dtoa_items` VALUES ('6', '1', '34', '[[11]]');
INSERT INTO `dtoa_items` VALUES ('7', '1', '35', '[[11,12,1,2,3,5]]');
INSERT INTO `dtoa_items` VALUES ('8', '1', '36', '{\"1\":[4,6,14,9,10,8]}');
INSERT INTO `dtoa_items` VALUES ('9', '1', '37', '{\"1\":[4,6,13,8]}');
INSERT INTO `dtoa_items` VALUES ('10', '1', '38', '[[11,2]]');
INSERT INTO `dtoa_items` VALUES ('11', '1', '39', '{\"1\":[4,13,8]}');
INSERT INTO `dtoa_items` VALUES ('12', '1', '40', '[[11,2,4,6,13,14,9,10,7,8],[11,12,1,2,3,5,7]]');
INSERT INTO `dtoa_items` VALUES ('13', '2', '34', '[[11]]');
INSERT INTO `dtoa_items` VALUES ('14', '2', '35', '[[11,12,1,2,3,5]]');
INSERT INTO `dtoa_items` VALUES ('15', '2', '36', '{\"1\":[4,6,14,9,10,8]}');
INSERT INTO `dtoa_items` VALUES ('16', '2', '37', '{\"1\":[4,6,13,8]}');
INSERT INTO `dtoa_items` VALUES ('17', '2', '38', '[[11,2]]');
INSERT INTO `dtoa_items` VALUES ('18', '2', '39', '{\"1\":[4,13,8]}');
INSERT INTO `dtoa_items` VALUES ('19', '2', '40', '[[11,2,4,6,13,14,9,10,7,8],[11,12,1,2,3,5,7]]');

-- ----------------------------
-- Table structure for dtoa_material
-- ----------------------------
DROP TABLE IF EXISTS `dtoa_material`;
CREATE TABLE `dtoa_material` (
  `c_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '材料ID',
  `c_no` int(20) unsigned NOT NULL COMMENT '材料编号',
  `c_name` varchar(255) NOT NULL COMMENT '材料名',
  `cid` int(10) unsigned NOT NULL COMMENT '材料分类ID 对应dtoa_category表',
  `cate_no` int(20) unsigned NOT NULL COMMENT '材料分类编码',
  `cate_name` varchar(255) NOT NULL COMMENT '材料分类名',
  `num` varchar(100) NOT NULL DEFAULT '个' COMMENT '单位',
  `size` varchar(255) DEFAULT NULL COMMENT '规格型号',
  `quality` varchar(255) DEFAULT NULL COMMENT '材质',
  `c_info` varchar(255) DEFAULT NULL COMMENT '材料备注',
  `creator_id` int(10) unsigned NOT NULL COMMENT '创建者ID',
  `creator` varchar(50) NOT NULL COMMENT '创建者',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2971 DEFAULT CHARSET=utf8 COMMENT='材料表';

-- ----------------------------
-- Records of dtoa_material
-- ----------------------------
INSERT INTO `dtoa_material` VALUES ('18', '201001', '混凝土', '10', '201', '普通混凝土', 'm³', 'C25', '', '', '1', 'super', '2019-09-06 09:58:30', '2019-09-06 09:58:30');
INSERT INTO `dtoa_material` VALUES ('19', '201002', '混凝土', '10', '201', '普通混凝土', 'm³', 'C20', '', '', '1', 'super', '2019-09-06 09:58:44', '2019-09-06 09:58:44');
INSERT INTO `dtoa_material` VALUES ('82', '201003', '混凝土', '10', '201', '普通混凝土', 'm³', 'C30', '', '', '1', '管理员', '2019-07-29 08:44:51', null);
INSERT INTO `dtoa_material` VALUES ('83', '204001', '泵送混凝土', '30', '204', '泵送混凝土', 'm³', 'C30', '', '', '1', '管理员', '2019-07-29 08:47:09', null);
INSERT INTO `dtoa_material` VALUES ('84', '203001', '抗渗混凝土', '12', '203', '抗渗混凝土', 'm³', 'C30P6', '', '', '1', '管理员', '2019-07-29 08:47:40', '2020-07-28 10:47:39');
INSERT INTO `dtoa_material` VALUES ('85', '205001', '泵送抗渗混凝土', '31', '205', '泵送抗渗混凝土', 'm³', 'C30P6', '', '', '1', '管理员', '2019-07-29 08:48:28', '2020-07-28 10:47:28');
INSERT INTO `dtoa_material` VALUES ('87', '11001001', 'JDG镀彩管', '59', '11001', '管线敷设', '米', 'Φ20国标', '金属', '', '1', '管理员', '2019-10-11 16:13:23', '2020-10-19 16:13:54');
INSERT INTO `dtoa_material` VALUES ('88', '11001002', 'JDG镀彩管', '59', '11001', '管线敷设', '米', 'Φ20非标', '金属', '', '1', '管理员', '2019-10-11 16:13:23', '2019-10-11 16:13:23');
INSERT INTO `dtoa_material` VALUES ('90', '201004', '混凝土', '10', '201', '普通混凝土', 'm³', 'C10', '', '', '1', '管理员', '2019-09-06 09:55:12', null);
INSERT INTO `dtoa_material` VALUES ('91', '201005', '混凝土', '10', '201', '普通混凝土', 'm³', 'C15', '', '', '1', '管理员', '2019-09-06 09:58:44', null);
INSERT INTO `dtoa_material` VALUES ('92', '201006', '混凝土', '10', '201', '普通混凝土', 'm³', 'C35', '', '', '1', '管理员', '2019-09-06 09:59:02', null);
INSERT INTO `dtoa_material` VALUES ('93', '203002', '抗渗混凝土', '12', '203', '抗渗混凝土', 'm³', 'C25P6', '', '', '1', '管理员', '2019-09-06 09:59:33', '2020-07-28 10:47:44');
INSERT INTO `dtoa_material` VALUES ('94', '203003', '抗渗混凝土', '12', '203', '抗渗混凝土', 'm³', 'C20P6', '', '', '1', '管理员', '2019-09-06 10:00:20', '2020-07-28 10:47:49');
INSERT INTO `dtoa_material` VALUES ('95', '203004', '抗渗混凝土', '12', '203', '抗渗混凝土', 'm³', 'C35P6', '', '', '1', '管理员', '2019-09-06 10:00:45', '2020-07-28 10:47:53');
INSERT INTO `dtoa_material` VALUES ('96', '204002', '泵送混凝土', '30', '204', '泵送混凝土', 'm³', 'C25', '', '', '1', '管理员', '2019-09-06 10:01:32', null);
INSERT INTO `dtoa_material` VALUES ('97', '204003', '泵送混凝土', '30', '204', '泵送混凝土', 'm³', 'C20', '', '', '1', '管理员', '2019-09-06 10:02:02', null);
INSERT INTO `dtoa_material` VALUES ('98', '204004', '泵送混凝土', '30', '204', '泵送混凝土', 'm³', 'C35', '', '', '1', '管理员', '2019-09-06 10:02:21', null);
INSERT INTO `dtoa_material` VALUES ('99', '205002', '泵送抗渗混凝土', '31', '205', '泵送抗渗混凝土', 'm³', 'C35P6', '', '', '1', '管理员', '2019-09-06 10:02:44', '2020-07-28 10:47:21');
INSERT INTO `dtoa_material` VALUES ('100', '205003', '泵送抗渗混凝土', '31', '205', '泵送抗渗混凝土', 'm³', 'C25P6', '', '', '1', '管理员', '2019-09-06 10:03:16', '2020-07-28 10:47:14');
INSERT INTO `dtoa_material` VALUES ('101', '205004', '泵送抗渗混凝土', '31', '205', '泵送抗渗混凝土', 'm³', 'C20P6', '', '', '1', '管理员', '2019-09-06 10:03:41', '2020-07-28 10:47:08');
INSERT INTO `dtoa_material` VALUES ('102', '206001', '细石混凝土', '65', '206', '细石混凝土', 'm³', 'C15', '', '', '1', '管理员', '2019-09-06 10:04:25', null);
INSERT INTO `dtoa_material` VALUES ('103', '206002', '细石混凝土', '65', '206', '细石混凝土', 'm³', 'C20', '', '', '1', '管理员', '2019-09-06 10:04:50', null);
INSERT INTO `dtoa_material` VALUES ('104', '206003', '细石混凝土', '65', '206', '细石混凝土', 'm³', 'C25', '', '', '1', '管理员', '2019-09-06 10:05:07', null);
INSERT INTO `dtoa_material` VALUES ('105', '206004', '细石混凝土', '65', '206', '细石混凝土', 'm³', 'C30', '', '', '1', '管理员', '2019-09-06 10:05:26', null);
INSERT INTO `dtoa_material` VALUES ('106', '206005', '细石混凝土', '65', '206', '细石混凝土', 'm³', 'C35', '', '', '1', '管理员', '2019-09-06 10:05:48', null);
INSERT INTO `dtoa_material` VALUES ('107', '207001', '冬施混凝土', '66', '207', '冬施混凝土', 'm³', 'C10', '', '', '1', '管理员', '2019-09-06 10:06:33', null);
INSERT INTO `dtoa_material` VALUES ('108', '207002', '冬施混凝土', '66', '207', '冬施混凝土', 'm³', 'C15', '', '', '1', '管理员', '2019-09-06 10:06:57', null);
INSERT INTO `dtoa_material` VALUES ('109', '207003', '冬施混凝土', '66', '207', '冬施混凝土', 'm³', 'C20', '', '', '1', '管理员', '2019-09-06 10:07:15', null);
INSERT INTO `dtoa_material` VALUES ('110', '207004', '冬施混凝土', '66', '207', '冬施混凝土', 'm³', 'C25', '', '', '1', '管理员', '2019-09-06 10:07:33', null);
INSERT INTO `dtoa_material` VALUES ('111', '207005', '冬施混凝土', '66', '207', '冬施混凝土', 'm³', 'C30', '', '', '1', '管理员', '2019-09-06 10:07:54', null);
INSERT INTO `dtoa_material` VALUES ('112', '208001', '冬施泵送混凝土', '67', '208', '冬施泵送混凝土', 'm³', 'C15', '', '', '1', '管理员', '2019-09-06 10:08:44', null);
INSERT INTO `dtoa_material` VALUES ('113', '208002', '冬施泵送混凝土', '67', '208', '冬施泵送混凝土', 'm³', 'C20', '', '', '1', '管理员', '2019-09-06 10:09:08', null);
INSERT INTO `dtoa_material` VALUES ('114', '208003', '冬施泵送混凝土', '67', '208', '冬施泵送混凝土', 'm³', 'C25', '', '', '1', '管理员', '2019-09-06 10:09:28', null);
INSERT INTO `dtoa_material` VALUES ('115', '208004', '冬施泵送混凝土', '67', '208', '冬施泵送混凝土', 'm³', 'C30', '', '', '1', '管理员', '2019-09-06 10:09:46', null);
INSERT INTO `dtoa_material` VALUES ('116', '209001', '冬施泵送抗渗混凝土', '68', '209', '冬施泵送抗渗混凝土', 'm³', 'C15P6', '', '', '1', '管理员', '2019-09-06 10:10:23', '2020-07-28 10:59:28');
INSERT INTO `dtoa_material` VALUES ('117', '209002', '冬施泵送抗渗混凝土', '68', '209', '冬施泵送抗渗混凝土', 'm³', 'C20P6', '', '', '1', '管理员', '2019-09-06 10:10:50', '2020-07-28 10:59:22');
INSERT INTO `dtoa_material` VALUES ('118', '209003', '冬施泵送抗渗混凝土', '68', '209', '冬施泵送抗渗混凝土', 'm³', 'C25P6', '', '', '1', '管理员', '2019-09-06 10:11:16', '2020-07-28 10:59:14');
INSERT INTO `dtoa_material` VALUES ('119', '209004', '冬施泵送抗渗混凝土', '68', '209', '冬施泵送抗渗混凝土', 'm³', 'C30P6', '', '', '1', '管理员', '2019-09-06 10:11:39', '2020-07-28 10:59:07');
INSERT INTO `dtoa_material` VALUES ('120', '210001', '无粉煤灰混凝土', '69', '210', '无粉煤灰混凝土', 'm³', 'C10', '', '', '1', '管理员', '2019-09-06 10:12:35', null);
INSERT INTO `dtoa_material` VALUES ('121', '210002', '无粉煤灰混凝土', '69', '210', '无粉煤灰混凝土', 'm³', 'C15', '', '', '1', '管理员', '2019-09-06 10:13:02', null);
INSERT INTO `dtoa_material` VALUES ('122', '210003', '无粉煤灰混凝土', '69', '210', '无粉煤灰混凝土', 'm³', 'C20', '', '', '1', '管理员', '2019-09-06 10:13:22', null);
INSERT INTO `dtoa_material` VALUES ('123', '210004', '无粉煤灰混凝土', '69', '210', '无粉煤灰混凝土', 'm³', 'C25', '', '', '1', '管理员', '2019-09-06 10:13:59', null);
INSERT INTO `dtoa_material` VALUES ('124', '30202001', '绿防尘网', '47', '30202', '文明施工', '卷', '三针型8*25米', '', '', '1', '管理员', '2019-10-11 15:46:42', '2019-12-12 14:05:56');
INSERT INTO `dtoa_material` VALUES ('125', '11001003', '包塑软管', '59', '11001', '管线敷设', '米', 'Φ20', '金属包塑', '', '1', '管理员', '2019-10-11 16:13:23', '2019-12-04 16:52:07');
INSERT INTO `dtoa_material` VALUES ('126', '11001004', '铁方盒', '59', '11001', '管线敷设', '个', '86H60', '金属', '', '1', '管理员', '2019-10-11 16:13:23', null);
INSERT INTO `dtoa_material` VALUES ('127', '10701001', '一体钉', '90', '10701', '五金材料', '个', 'M6', '金属', '自爆吊顶钉', '1', '管理员', '2019-10-11 16:18:35', null);
INSERT INTO `dtoa_material` VALUES ('128', '11002001', 'TD长筒铜鼻子', '91', '11002', '电气辅材', '个', '185mm²', '金属铜', '', '1', '管理员', '2019-10-11 16:23:11', null);
INSERT INTO `dtoa_material` VALUES ('129', '11002002', 'TD长筒铜鼻子', '91', '11002', '电气辅材', '个', '95mm²', '金属铜', '', '1', '管理员', '2019-10-11 16:24:58', null);
INSERT INTO `dtoa_material` VALUES ('130', '11001005', 'JDG盒接', '59', '11001', '管线敷设', '个', 'Φ20', '金属', '', '1', '管理员', '2019-10-11 16:25:33', null);
INSERT INTO `dtoa_material` VALUES ('131', '11101001', '镀锌补芯', '92', '11101', '镀锌管件', '个', 'DN65*15', '热镀锌', '', '1', '管理员', '2019-10-11 16:28:22', null);
INSERT INTO `dtoa_material` VALUES ('132', '11102001', '镀铬水嘴', '93', '11102', '控水主材', '个', 'DN15', '金属', '水龙头', '1', '管理员', '2019-10-11 16:31:19', null);
INSERT INTO `dtoa_material` VALUES ('133', '11002003', '透明漏电', '91', '11002', '电气辅材', '块', '380V63A', '', '', '1', '管理员', '2019-11-27 15:14:06', '2019-11-27 15:15:52');
INSERT INTO `dtoa_material` VALUES ('134', '11002004', '透明空开', '91', '11002', '电气辅材', '块', '380V100A', '', '', '1', '管理员', '2019-11-27 15:15:52', null);
INSERT INTO `dtoa_material` VALUES ('135', '11102002', '丝扣法兰盘', '93', '11102', '控水主材', '片', 'DN65', '', '', '1', '管理员', '2019-11-27 15:16:24', null);
INSERT INTO `dtoa_material` VALUES ('136', '11102003', '丝扣法兰盘', '93', '11102', '控水主材', '片', 'DN50', '', '', '1', '管理员', '2019-11-27 15:17:32', null);
INSERT INTO `dtoa_material` VALUES ('137', '11102004', '法兰垫', '93', '11102', '控水主材', '个', 'DN65', '', '', '1', '管理员', '2019-11-27 15:17:55', null);
INSERT INTO `dtoa_material` VALUES ('138', '11102005', '法兰垫', '93', '11102', '控水主材', '个', 'DN50', '', '', '1', '管理员', '2019-11-27 15:18:58', null);
INSERT INTO `dtoa_material` VALUES ('139', '11101002', '镀锌丝堵', '92', '11101', '镀锌管件', '个', 'DN40', '热镀锌', '', '1', '管理员', '2019-11-27 15:19:41', '2019-11-27 15:21:04');
INSERT INTO `dtoa_material` VALUES ('140', '11101003', '镀锌丝堵', '92', '11101', '镀锌管件', '个', 'DN25', '热镀锌', '', '1', '管理员', '2019-11-27 15:20:15', null);
INSERT INTO `dtoa_material` VALUES ('141', '30202002', '黑防尘网', '47', '30202', '文明施工', '卷', '三针型8*30米', '', '', '1', '管理员', '2019-11-28 08:42:51', '2019-12-12 14:05:56');
INSERT INTO `dtoa_material` VALUES ('142', '11001006', 'JDG直接', '59', '11001', '管线敷设', '个', 'Φ20', '金属', '', '1', '管理员', '2019-11-28 08:43:27', null);
INSERT INTO `dtoa_material` VALUES ('143', '11003001', '套装电箱', '105', '11003', '电箱', '台', '小型', '', '', '1', '管理员', '2019-11-28 08:45:25', null);
INSERT INTO `dtoa_material` VALUES ('144', '10701002', '马鞍卡', '90', '10701', '五金材料', '个', '20', '金属', '', '1', '管理员', '2019-11-28 08:46:13', null);
INSERT INTO `dtoa_material` VALUES ('145', '10701003', '塑料涨塞', '90', '10701', '五金材料', '个', '8', '塑料', '', '1', '管理员', '2019-11-28 08:47:18', null);
INSERT INTO `dtoa_material` VALUES ('146', '10701004', '膨胀螺栓', '90', '10701', '五金材料', '个', '8*80', '金属', '', '1', '管理员', '2019-11-28 08:48:01', null);
INSERT INTO `dtoa_material` VALUES ('147', '11104001', 'IC卡水表', '106', '11104', '水表', '块', 'DN15', '', '', '1', '管理员', '2019-11-28 08:49:00', null);
INSERT INTO `dtoa_material` VALUES ('148', '11102006', 'PPR双活接球阀', '93', '11102', '控水主材', '个', 'DN20', 'PPR/铜', '', '1', '管理员', '2019-11-28 08:50:00', null);
INSERT INTO `dtoa_material` VALUES ('149', '11106001', '污水泵（工程）', '108', '11106', '水暖设备（消耗）', '台', '4KW', '', '', '1', '管理员', '2019-11-28 08:56:49', null);
INSERT INTO `dtoa_material` VALUES ('150', '11106002', '耦合器', '108', '11106', '水暖设备（消耗）', '台', '', '', '', '1', '管理员', '2019-11-28 08:57:24', null);
INSERT INTO `dtoa_material` VALUES ('151', '11107001', '球墨井盖', '109', '11107', '球墨管材管件', '套', '700轻型', '球墨铸铁', '', '1', '管理员', '2019-11-28 08:58:16', null);
INSERT INTO `dtoa_material` VALUES ('152', '10701005', '钻尾钉', '90', '10701', '五金材料', '盒', '5.5*180', '', '', '1', '管理员', '2019-11-28 08:59:09', '2019-11-28 10:42:18');
INSERT INTO `dtoa_material` VALUES ('153', '11002005', '焊锡膏', '91', '11002', '电气辅材', '盒', '', '', '', '1', '管理员', '2019-11-28 09:00:32', null);
INSERT INTO `dtoa_material` VALUES ('154', '11002006', '焊锡条', '91', '11002', '电气辅材', '根', '99.9', '', '', '1', '管理员', '2019-11-28 09:00:57', null);
INSERT INTO `dtoa_material` VALUES ('155', '11002007', '塑料胶布', '91', '11002', '电气辅材', '卷', '', '', '', '1', '管理员', '2019-11-28 09:01:17', null);
INSERT INTO `dtoa_material` VALUES ('156', '11002008', '黑布胶布', '91', '11002', '电气辅材', '卷', '', '', '', '1', '管理员', '2019-11-28 09:01:39', null);
INSERT INTO `dtoa_material` VALUES ('157', '10701006', '铁开孔器', '90', '10701', '五金材料', '个', 'Φ22', '', '', '1', '管理员', '2019-11-28 09:02:03', null);
INSERT INTO `dtoa_material` VALUES ('158', '10701007', '铁开孔器', '90', '10701', '五金材料', '个', 'Φ28', '', '', '1', '管理员', '2019-11-28 09:02:47', null);
INSERT INTO `dtoa_material` VALUES ('159', '10701008', '膨胀螺栓', '90', '10701', '五金材料', '个', '10*95', '金属', '', '1', '管理员', '2019-11-28 09:03:11', null);
INSERT INTO `dtoa_material` VALUES ('160', '10701009', '砂轮切割片', '90', '10701', '五金材料', '盒', 'Φ75', '树脂砂轮', '', '1', '管理员', '2019-11-28 09:03:44', null);
INSERT INTO `dtoa_material` VALUES ('161', '10701010', '麻花钻头', '90', '10701', '五金材料', '支', 'M10', '', '', '1', '管理员', '2019-11-28 09:04:37', null);
INSERT INTO `dtoa_material` VALUES ('162', '10701011', '铁开孔器', '90', '10701', '五金材料', '个', 'Φ38', '', '', '1', '管理员', '2019-11-28 09:05:56', null);
INSERT INTO `dtoa_material` VALUES ('163', '10701012', '铁开孔器', '90', '10701', '五金材料', '个', 'Φ42', '', '', '1', '管理员', '2019-11-28 09:06:28', null);
INSERT INTO `dtoa_material` VALUES ('164', '10701013', '焊条', '90', '10701', '五金材料', '箱', '3.2', '', '', '1', '管理员', '2019-11-28 09:06:44', null);
INSERT INTO `dtoa_material` VALUES ('165', '11004001', '镀锌线槽桥架', '110', '11004', '线槽桥架', '米', '150*100*1.5', '', '', '1', '管理员', '2019-11-28 09:07:43', null);
INSERT INTO `dtoa_material` VALUES ('166', '11004002', '桥架托臂', '110', '11004', '线槽桥架', '个', '200', '', '', '1', '管理员', '2019-11-28 09:08:19', null);
INSERT INTO `dtoa_material` VALUES ('167', '11101004', '镀锌变径管箍', '92', '11101', '镀锌管件', '个', 'DN20*15', '热镀锌', '', '1', '管理员', '2019-11-28 09:09:11', null);
INSERT INTO `dtoa_material` VALUES ('168', '11101005', '镀锌对丝', '92', '11101', '镀锌管件', '个', 'DN15', '热镀锌', '', '1', '管理员', '2019-11-28 09:09:53', null);
INSERT INTO `dtoa_material` VALUES ('169', '10701014', '铁开孔器', '90', '10701', '五金材料', '个', 'Φ35', '', '', '1', '管理员', '2019-11-28 09:10:22', null);
INSERT INTO `dtoa_material` VALUES ('170', '10701015', '铁开孔器', '90', '10701', '五金材料', '个', 'Φ25', '', '', '1', '管理员', '2019-11-28 09:10:52', null);
INSERT INTO `dtoa_material` VALUES ('171', '11108001', '电熔管箍', '111', '11108', '电熔管材管件', '个', 'DN110', '', '', '1', '管理员', '2019-11-28 09:12:08', null);
INSERT INTO `dtoa_material` VALUES ('172', '11108002', '电熔机', '111', '11108', '电熔管材管件', '台', '', '', '', '1', '管理员', '2019-11-28 09:12:42', null);
INSERT INTO `dtoa_material` VALUES ('173', '11005001', '防爆安全出口灯', '112', '11005', '灯具', '个', '', '', '', '1', '管理员', '2019-11-28 09:13:30', null);
INSERT INTO `dtoa_material` VALUES ('174', '11005002', 'LED投光灯', '112', '11005', '灯具', '个', '200W', '', '', '1', '管理员', '2019-11-28 09:14:11', null);
INSERT INTO `dtoa_material` VALUES ('175', '11006001', 'PVC管', '113', '11006', 'PVC线管材件', '米', 'Φ25', '', '', '1', '管理员', '2019-11-28 09:15:14', null);
INSERT INTO `dtoa_material` VALUES ('176', '11006002', 'PVC直接', '113', '11006', 'PVC线管材件', '个', 'Φ25', '', '', '1', '管理员', '2019-11-28 09:17:31', null);
INSERT INTO `dtoa_material` VALUES ('177', '11001007', '防爆挠性连接管', '59', '11001', '管线敷设', '根', 'DN25*1000', '', '', '1', '管理员', '2019-11-28 10:37:25', '2019-12-19 15:27:32');
INSERT INTO `dtoa_material` VALUES ('178', '11001008', '防爆挠性连接管', '59', '11001', '管线敷设', '根', 'DN20*500', '', '', '1', '管理员', '2019-11-28 10:38:33', '2019-12-19 15:27:23');
INSERT INTO `dtoa_material` VALUES ('179', '11101006', '镀锌补芯', '92', '11101', '镀锌管件', '个', 'DN20', '热镀锌', '', '1', '管理员', '2019-11-28 10:40:42', '2019-11-28 11:27:03');
INSERT INTO `dtoa_material` VALUES ('180', '11001009', '防爆挠性连接管', '59', '11001', '管线敷设', '根', 'DN20*1000', '', '', '1', '管理员', '2019-11-28 10:42:19', '2019-12-19 15:27:44');
INSERT INTO `dtoa_material` VALUES ('181', '11107002', '铸铁哈夫直接', '109', '11107', '球墨管材管件', '个', 'DN200', '', '', '1', '管理员', '2019-11-28 10:45:45', null);
INSERT INTO `dtoa_material` VALUES ('182', '11107003', '铸铁哈夫直接', '109', '11107', '球墨管材管件', '个', 'DN150', '', '', '1', '管理员', '2019-11-28 11:00:19', null);
INSERT INTO `dtoa_material` VALUES ('183', '11107004', '铸铁直式哈夫', '109', '11107', '球墨管材管件', '个', 'DN100*200', '', '', '1', '管理员', '2019-11-28 11:02:33', null);
INSERT INTO `dtoa_material` VALUES ('184', '11006003', 'PVC三通盒', '113', '11006', 'PVC线管材件', '个', 'Φ25', '', '', '1', '管理员', '2019-11-28 11:03:13', null);
INSERT INTO `dtoa_material` VALUES ('185', '11006004', 'PVC角通盒', '113', '11006', 'PVC线管材件', '个', 'Φ25', '', '', '1', '管理员', '2019-11-28 11:04:00', '2019-11-28 11:04:38');
INSERT INTO `dtoa_material` VALUES ('186', '11006005', 'PVC卡子', '113', '11006', 'PVC线管材件', '个', 'Φ25', '', '', '1', '管理员', '2019-11-28 11:04:39', null);
INSERT INTO `dtoa_material` VALUES ('187', '11007001', 'BV塑铜线', '114', '11007', '电线电缆', '米', 'BV2.5', '', '', '1', '管理员', '2019-11-28 11:05:38', null);
INSERT INTO `dtoa_material` VALUES ('188', '10701016', '电锤钻头', '90', '10701', '五金材料', '支', '8*160', '', '', '1', '管理员', '2019-11-28 11:06:14', null);
INSERT INTO `dtoa_material` VALUES ('189', '10701017', '电锤钻头', '90', '10701', '五金材料', '支', '12*160', '', '', '1', '管理员', '2019-11-28 11:07:45', null);
INSERT INTO `dtoa_material` VALUES ('190', '10701018', '电锤钻头', '90', '10701', '五金材料', '支', '20*500', '', '', '1', '管理员', '2019-11-28 11:08:05', null);
INSERT INTO `dtoa_material` VALUES ('191', '11001010', '防爆三通盒', '59', '11001', '管线敷设', '个', 'DN20', '金属', '', '1', '管理员', '2019-11-28 11:08:33', '2019-11-28 11:10:14');
INSERT INTO `dtoa_material` VALUES ('192', '11001011', '防爆角通盒', '59', '11001', '管线敷设', '个', 'DN20', '金属', '', '1', '管理员', '2019-11-28 11:09:17', '2019-11-28 11:10:20');
INSERT INTO `dtoa_material` VALUES ('193', '1010101001', '镀锌焊接钢管', '52', '1010101', '镀锌焊接钢管', '米', 'DN20', '', '', '1', '管理员', '2019-11-28 11:10:21', null);
INSERT INTO `dtoa_material` VALUES ('194', '11008001', '双联单控防爆开关', '115', '11008', '电气设备安装材料', '个', '', '金属', '', '1', '管理员', '2019-11-28 11:25:39', '2019-11-29 11:19:14');
INSERT INTO `dtoa_material` VALUES ('195', '11101007', '镀锌对丝', '92', '11101', '镀锌管件', '个', 'DN20', '热镀锌', '', '1', '管理员', '2019-11-28 11:26:05', null);
INSERT INTO `dtoa_material` VALUES ('196', '11101008', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN20', '热镀锌', '', '1', '管理员', '2019-11-28 11:27:04', null);
INSERT INTO `dtoa_material` VALUES ('197', '11007002', 'RVV护套线', '114', '11007', '电线电缆', '米', 'RVV3*2.5', '铜', '', '1', '管理员', '2019-11-28 11:27:35', '2019-12-25 16:27:24');
INSERT INTO `dtoa_material` VALUES ('198', '11005003', '防爆投光灯', '112', '11005', '灯具', '个', '100W', '', '', '1', '管理员', '2019-11-28 11:28:24', null);
INSERT INTO `dtoa_material` VALUES ('199', '11002009', '防火泥', '91', '11002', '电气辅材', '块', '', '', '', '1', '管理员', '2019-11-28 11:30:29', null);
INSERT INTO `dtoa_material` VALUES ('200', '11008002', '轴流风机（工程）', '115', '11008', '电气设备安装材料', '个', 'Φ500/220V', '', '', '1', '管理员', '2019-11-28 14:22:45', '2019-11-28 14:29:49');
INSERT INTO `dtoa_material` VALUES ('201', '10701019', '马路切割片', '90', '10701', '五金材料', '片', 'Φ500', '', '', '1', '管理员', '2019-11-28 14:26:06', null);
INSERT INTO `dtoa_material` VALUES ('202', '112001', '透明胶带', '41', '112', '低值易耗品', '卷', '5.5cm*200米', '', '', '1', '管理员', '2019-11-28 14:29:49', '2019-12-02 15:05:38');
INSERT INTO `dtoa_material` VALUES ('203', '10701020', '火烧丝', '90', '10701', '五金材料', '捆', '22#350mm', '', '', '1', '管理员', '2019-11-28 14:34:12', '2019-12-27 09:14:56');
INSERT INTO `dtoa_material` VALUES ('204', '11107005', '球墨井盖', '109', '11107', '球墨管材管件', '套', '700重型80T', '球墨铸铁', '', '1', '管理员', '2019-11-28 14:35:11', '2019-11-28 14:38:31');
INSERT INTO `dtoa_material` VALUES ('205', '10802001', '108胶', '117', '10802', '化工产品', '桶', '20KG', '', '', '1', '管理员', '2019-11-28 14:36:34', null);
INSERT INTO `dtoa_material` VALUES ('206', '10802002', '发泡胶', '117', '10802', '化工产品', '支', '', '', '', '1', '管理员', '2019-11-28 14:37:34', null);
INSERT INTO `dtoa_material` VALUES ('207', '10703001', '焊接冲压弯头', '119', '10703', '焊接冲压管件', '个', 'Φ159*90°', '熟铁', '', '1', '管理员', '2019-11-28 14:41:49', null);
INSERT INTO `dtoa_material` VALUES ('208', '11102007', '铸钢法兰闸阀', '93', '11102', '控水主材', '个', 'DN150', '铸钢', '', '1', '管理员', '2019-11-28 14:42:52', null);
INSERT INTO `dtoa_material` VALUES ('209', '11102008', '法兰盘', '93', '11102', '控水主材', '片', 'DN150', '', '', '1', '管理员', '2019-11-28 14:43:47', null);
INSERT INTO `dtoa_material` VALUES ('210', '11102009', '法兰螺栓', '93', '11102', '控水主材', '套', '16*70', '', '', '1', '管理员', '2019-11-28 15:07:02', null);
INSERT INTO `dtoa_material` VALUES ('211', '11102010', '金属法兰垫', '93', '11102', '控水主材', '个', 'DN150', '', '', '1', '管理员', '2019-11-28 15:07:58', null);
INSERT INTO `dtoa_material` VALUES ('212', '10701021', '角磨片', '90', '10701', '五金材料', '片', '100', '', '', '1', '管理员', '2019-11-28 15:08:31', null);
INSERT INTO `dtoa_material` VALUES ('213', '10701022', '焊条', '90', '10701', '五金材料', '箱', '2.5', '', '', '1', '管理员', '2019-11-28 15:09:19', null);
INSERT INTO `dtoa_material` VALUES ('214', '10701023', '电锤钻头', '90', '10701', '五金材料', '支', '25*500', '', '', '1', '管理员', '2019-11-28 15:10:17', null);
INSERT INTO `dtoa_material` VALUES ('215', '10802003', '植筋胶', '117', '10802', '化工产品', '组', '4KG', '', '', '1', '管理员', '2019-11-28 15:10:54', '2021-01-27 15:55:13');
INSERT INTO `dtoa_material` VALUES ('216', '11102011', '法兰盲板', '93', '11102', '控水主材', '片', 'DN150', '', '', '1', '管理员', '2019-11-28 15:11:26', null);
INSERT INTO `dtoa_material` VALUES ('217', '11102012', '焊接补偿器', '93', '11102', '控水主材', '个', 'DN150', '', '', '1', '管理员', '2019-11-28 15:12:28', null);
INSERT INTO `dtoa_material` VALUES ('218', '11102013', '法兰螺栓', '93', '11102', '控水主材', '套', '18*80', '', '', '1', '管理员', '2019-11-28 15:13:20', null);
INSERT INTO `dtoa_material` VALUES ('219', '11102014', '法兰螺栓', '93', '11102', '控水主材', '套', '20*100', '', '', '1', '管理员', '2019-11-28 15:13:51', null);
INSERT INTO `dtoa_material` VALUES ('220', '11102015', '铸钢截止阀', '93', '11102', '控水主材', '个', 'DN40', '', '', '1', '管理员', '2019-11-28 15:14:14', null);
INSERT INTO `dtoa_material` VALUES ('221', '11102016', '铸钢疏水阀', '93', '11102', '控水主材', '个', 'DN40', '', '', '1', '管理员', '2019-11-28 15:14:41', null);
INSERT INTO `dtoa_material` VALUES ('222', '11102017', '法兰盘', '93', '11102', '控水主材', '片', 'DN40', '', '', '1', '管理员', '2019-11-28 15:15:05', '2019-11-28 15:16:34');
INSERT INTO `dtoa_material` VALUES ('223', '11102018', '金属法兰垫', '93', '11102', '控水主材', '个', 'DN40', '', '', '1', '管理员', '2019-11-28 15:15:43', null);
INSERT INTO `dtoa_material` VALUES ('224', '10703002', '焊接冲压弯头', '119', '10703', '焊接冲压管件', '个', 'DN40', '熟铁', '', '1', '管理员', '2019-11-28 15:16:35', null);
INSERT INTO `dtoa_material` VALUES ('225', '11104002', '压力表', '106', '11104', '水表', '块', '1.6MPa', '', '', '1', '管理员', '2019-11-29 09:00:13', '2019-12-03 13:32:52');
INSERT INTO `dtoa_material` VALUES ('226', '11005004', '灯带', '112', '11005', '灯具', '米', '', '', '', '1', '管理员', '2019-11-29 09:12:54', null);
INSERT INTO `dtoa_material` VALUES ('227', '11002010', '灯带插头', '91', '11002', '电气辅材', '个', '', '', '', '1', '管理员', '2019-11-29 09:21:06', null);
INSERT INTO `dtoa_material` VALUES ('228', '11001012', '防爆挠性连接管', '59', '11001', '管线敷设', '根', 'DN20*2000', '', '', '1', '管理员', '2019-11-29 09:23:17', '2019-12-19 15:27:55');
INSERT INTO `dtoa_material` VALUES ('229', '11101009', '镀锌补芯', '92', '11101', '镀锌管件', '个', 'DN40*20', '热镀锌', '', '1', '管理员', '2019-11-29 09:24:15', null);
INSERT INTO `dtoa_material` VALUES ('230', '11101010', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN32*20', '热镀锌', '', '1', '管理员', '2019-11-29 09:25:05', '2021-12-14 09:43:24');
INSERT INTO `dtoa_material` VALUES ('231', '10801001', '铁红防锈漆', '116', '10801', '油漆水漆', '桶', '18KG', '', '', '1', '管理员', '2019-11-29 09:26:12', null);
INSERT INTO `dtoa_material` VALUES ('232', '10801002', '黄漆', '116', '10801', '油漆水漆', '桶', '18KG', '', '', '1', '管理员', '2019-11-29 09:32:27', null);
INSERT INTO `dtoa_material` VALUES ('233', '10801003', '稀料', '116', '10801', '油漆水漆', '桶', '10KG', '', '', '1', '管理员', '2019-11-29 09:34:02', null);
INSERT INTO `dtoa_material` VALUES ('234', '10701024', '膨胀螺栓', '90', '10701', '五金材料', '个', '14*200', '金属', '', '1', '管理员', '2019-11-29 09:34:40', null);
INSERT INTO `dtoa_material` VALUES ('235', '10801004', '大红漆', '116', '10801', '油漆水漆', '桶', '18KG', '', '', '1', '管理员', '2019-11-29 09:35:46', null);
INSERT INTO `dtoa_material` VALUES ('236', '10801005', '白漆', '116', '10801', '油漆水漆', '桶', '18KG', '', '', '1', '管理员', '2019-11-29 09:38:09', null);
INSERT INTO `dtoa_material` VALUES ('237', '112002', '竹扫把', '41', '112', '低值易耗品', '把', '大号', '', '', '1', '管理员', '2019-11-29 09:42:11', null);
INSERT INTO `dtoa_material` VALUES ('238', '10704001', '维修65电镐', '120', '10704', '五金设备配件', '把', '', '', '', '1', '管理员', '2019-11-29 09:44:16', '2019-11-29 09:45:10');
INSERT INTO `dtoa_material` VALUES ('239', '10704002', '维修水泵', '120', '10704', '五金设备配件', '台', '', '', '', '1', '管理员', '2019-11-29 09:45:40', null);
INSERT INTO `dtoa_material` VALUES ('240', '10704003', '门轴', '120', '10704', '五金设备配件', '个', '', '', '', '1', '管理员', '2019-11-29 09:46:02', null);
INSERT INTO `dtoa_material` VALUES ('241', '10701025', '膨胀螺栓', '90', '10701', '五金材料', '个', '10*200', '金属', '', '1', '管理员', '2019-11-29 09:46:26', '2019-12-24 09:52:05');
INSERT INTO `dtoa_material` VALUES ('242', '10701026', '大挂锁', '90', '10701', '五金材料', '把', '50', '', '', '1', '管理员', '2019-11-29 09:47:21', '2021-01-20 16:43:25');
INSERT INTO `dtoa_material` VALUES ('243', '30202003', '标识牌', '47', '30202', '文明施工', '个', '', '', '', '1', '管理员', '2019-11-29 09:47:54', '2019-12-12 14:05:56');
INSERT INTO `dtoa_material` VALUES ('244', '1010301011', '埋铁', '136', '1010301', '加工铁板', '块', '300*300*10mm', '', '', '1', '管理员', '2019-11-29 10:50:34', '2021-01-29 14:21:53');
INSERT INTO `dtoa_material` VALUES ('245', '11107006', '防盗球墨井盖', '109', '11107', '球墨管材管件', '套', '700重型80T', '球墨铸铁', '', '1', '管理员', '2019-11-29 10:51:48', null);
INSERT INTO `dtoa_material` VALUES ('246', '11107007', '防盗球墨井盖', '109', '11107', '球墨管材管件', '套', '700轻型', '球墨铸铁', '', '1', '管理员', '2019-11-29 10:53:34', null);
INSERT INTO `dtoa_material` VALUES ('247', '11107008', '球墨井盖', '109', '11107', '球墨管材管件', '套', '700中型40T', '球墨铸铁', '', '1', '管理员', '2019-11-29 10:54:22', null);
INSERT INTO `dtoa_material` VALUES ('248', '11102019', '洗衣机水嘴', '93', '11102', '控水主材', '个', 'DN15', '', '', '1', '管理员', '2019-11-29 10:55:16', null);
INSERT INTO `dtoa_material` VALUES ('249', '11105001', 'PPR内丝弯头', '107', '11105', 'PPR管材管件', '个', '20*1/2', 'PPR', '', '1', '管理员', '2019-11-29 10:55:57', null);
INSERT INTO `dtoa_material` VALUES ('250', '11105002', 'PPR冷水管', '107', '11105', 'PPR管材管件', '米', '20', 'PPR', '', '1', '管理员', '2019-11-29 10:56:49', null);
INSERT INTO `dtoa_material` VALUES ('251', '11105003', 'PPR三通', '107', '11105', 'PPR管材管件', '个', '20', 'PPR', '', '1', '管理员', '2019-11-29 10:57:26', null);
INSERT INTO `dtoa_material` VALUES ('252', '11105004', 'PPR弯头', '107', '11105', 'PPR管材管件', '个', '20*90°', 'PPR', '', '1', '管理员', '2019-11-29 10:57:51', '2019-12-04 08:55:03');
INSERT INTO `dtoa_material` VALUES ('253', '11109001', '生料带', '122', '11109', '水暖辅材', '盘', '', '', '', '1', '管理员', '2019-11-29 10:58:52', null);
INSERT INTO `dtoa_material` VALUES ('254', '11105005', 'PPR座卡', '107', '11105', 'PPR管材管件', '个', '20', 'PPR', '', '1', '管理员', '2019-11-29 10:59:17', null);
INSERT INTO `dtoa_material` VALUES ('255', '11109002', '洗衣机下水管', '122', '11109', '水暖辅材', '套', '', '塑料', '', '1', '管理员', '2019-11-29 10:59:50', null);
INSERT INTO `dtoa_material` VALUES ('256', '30201001', '干粉灭火器', '46', '30201', '安全设备', '个', '5KG', '', '', '1', '管理员', '2019-11-29 11:00:27', '2020-12-24 11:30:15');
INSERT INTO `dtoa_material` VALUES ('257', '30201002', '消防锹', '46', '30201', '安全设备', '把', '', '', '', '1', '管理员', '2019-11-29 11:01:08', '2019-12-12 14:52:16');
INSERT INTO `dtoa_material` VALUES ('258', '30201003', '消防斧', '46', '30201', '安全设备', '把', '', '', '', '1', '管理员', '2019-11-29 11:01:29', null);
INSERT INTO `dtoa_material` VALUES ('259', '112003', '洁厕灵', '41', '112', '低值易耗品', '瓶', '', '', '', '1', '管理员', '2019-11-29 11:01:47', null);
INSERT INTO `dtoa_material` VALUES ('260', '10702001', '方锹', '118', '10702', '五金工具', '把', '', '', '', '1', '管理员', '2019-11-29 11:02:12', null);
INSERT INTO `dtoa_material` VALUES ('261', '112004', '墩布', '41', '112', '低值易耗品', '把', '', '', '', '1', '管理员', '2019-11-29 11:03:01', null);
INSERT INTO `dtoa_material` VALUES ('262', '30201004', '灭火器检修', '46', '30201', '安全设备', '个', '', '', '', '1', '管理员', '2019-11-29 11:03:40', null);
INSERT INTO `dtoa_material` VALUES ('263', '10702002', '钢卷尺', '118', '10702', '五金工具', '把', '50M', '', '', '1', '管理员', '2019-11-29 11:04:17', null);
INSERT INTO `dtoa_material` VALUES ('264', '10702003', '盒尺', '118', '10702', '五金工具', '把', '5M', '', '', '1', '管理员', '2019-11-29 11:04:57', null);
INSERT INTO `dtoa_material` VALUES ('265', '11005005', '低压灯泡', '112', '11005', '灯具', '个', '36V', '', '', '1', '管理员', '2019-11-29 11:05:20', null);
INSERT INTO `dtoa_material` VALUES ('266', '10901001', '塑料布', '123', '10901', '橡塑制品', 'KG', '', '', '', '1', '管理员', '2019-11-29 11:06:47', '2021-10-22 08:21:42');
INSERT INTO `dtoa_material` VALUES ('267', '10901002', '塑料管', '123', '10901', '橡塑制品', '米', '25', '', '', '1', '管理员', '2019-11-29 11:07:14', '2021-10-22 08:21:42');
INSERT INTO `dtoa_material` VALUES ('268', '11006006', 'PVC线槽', '113', '11006', 'PVC线管材件', '米', '20*30', '', '', '1', '管理员', '2019-11-29 11:07:41', null);
INSERT INTO `dtoa_material` VALUES ('269', '11008003', '单联开关', '115', '11008', '电气设备安装材料', '个', '10A', '', '', '1', '管理员', '2019-11-29 11:08:58', '2022-01-18 11:09:13');
INSERT INTO `dtoa_material` VALUES ('270', '11008004', '双联开关', '115', '11008', '电气设备安装材料', '个', '', '', '', '1', '管理员', '2019-11-29 11:09:22', null);
INSERT INTO `dtoa_material` VALUES ('271', '11102020', '法兰止回阀', '93', '11102', '控水主材', '个', 'DN50', '铸铁', '', '1', '管理员', '2019-11-29 11:09:35', null);
INSERT INTO `dtoa_material` VALUES ('272', '11102021', '法兰螺栓', '93', '11102', '控水主材', '套', '16*50', '', '', '1', '管理员', '2019-11-29 11:10:49', null);
INSERT INTO `dtoa_material` VALUES ('273', '10701027', '镀锌铁丝网', '90', '10701', '五金材料', '平米', '', '', '', '1', '管理员', '2019-11-29 11:11:48', null);
INSERT INTO `dtoa_material` VALUES ('274', '11102022', '水位控制开关', '93', '11102', '控水主材', '个', '', '', '', '1', '管理员', '2019-11-29 11:12:47', null);
INSERT INTO `dtoa_material` VALUES ('275', '11102023', '铜闸阀', '93', '11102', '控水主材', '个', 'DN20', '铜', '', '1', '管理员', '2019-11-29 11:13:19', '2019-12-03 13:30:34');
INSERT INTO `dtoa_material` VALUES ('276', '11102024', '八字阀', '93', '11102', '控水主材', '个', 'DN20', '', '', '1', '管理员', '2019-11-29 11:13:55', null);
INSERT INTO `dtoa_material` VALUES ('277', '10901003', '彩条布', '123', '10901', '橡塑制品', '捆', '6M*50M', '', '', '1', '管理员', '2019-11-29 11:14:21', '2021-10-22 08:21:42');
INSERT INTO `dtoa_material` VALUES ('278', '30202004', '警戒带', '47', '30202', '文明施工', '盘', '', '尼龙', '', '1', '管理员', '2019-11-29 11:15:25', '2019-12-12 14:05:56');
INSERT INTO `dtoa_material` VALUES ('279', '11005006', '双管防爆灯', '112', '11005', '灯具', '套', '', '', '', '1', '管理员', '2019-11-29 11:16:39', null);
INSERT INTO `dtoa_material` VALUES ('280', '11005007', '双头防爆应急灯', '112', '11005', '灯具', '套', '', '', '', '1', '管理员', '2019-11-29 11:17:31', null);
INSERT INTO `dtoa_material` VALUES ('281', '11008005', '单联防爆开关', '115', '11008', '电气设备安装材料', '个', '', '金属', '', '1', '管理员', '2019-11-29 11:18:00', '2019-11-29 11:19:05');
INSERT INTO `dtoa_material` VALUES ('282', '11001013', '防爆挠性连接管', '59', '11001', '管线敷设', '根', 'DN20*300', '', '', '1', '管理员', '2019-11-29 11:19:15', '2019-12-19 15:28:25');
INSERT INTO `dtoa_material` VALUES ('283', '11107009', 'W型管不锈钢卡箍', '109', '11107', '球墨管材管件', '个', 'DN100', '', '', '1', '管理员', '2019-11-29 11:20:45', '2019-12-03 13:47:00');
INSERT INTO `dtoa_material` VALUES ('284', '11107010', 'W型管不锈钢卡箍', '109', '11107', '球墨管材管件', '个', 'DN75', '', '', '1', '管理员', '2019-11-29 11:22:01', '2019-12-03 13:47:12');
INSERT INTO `dtoa_material` VALUES ('285', '11107011', 'W型管不锈钢卡箍', '109', '11107', '球墨管材管件', '个', 'DN50', '', '', '1', '管理员', '2019-11-29 11:22:21', '2019-12-03 13:47:30');
INSERT INTO `dtoa_material` VALUES ('286', '11101011', '吊环卡', '92', '11101', '镀锌管件', '个', 'DN100', '热镀锌', '', '1', '管理员', '2019-11-29 11:22:40', null);
INSERT INTO `dtoa_material` VALUES ('287', '11101012', '吊环卡', '92', '11101', '镀锌管件', '个', 'DN75', '热镀锌', '', '1', '管理员', '2019-11-29 11:23:24', null);
INSERT INTO `dtoa_material` VALUES ('288', '11101013', '吊环卡', '92', '11101', '镀锌管件', '个', 'DN50', '热镀锌', '', '1', '管理员', '2019-11-29 11:23:49', null);
INSERT INTO `dtoa_material` VALUES ('289', '11105006', 'PPR内丝直接', '107', '11105', 'PPR管材管件', '个', '25*1/2', 'PPR', '', '1', '管理员', '2019-11-29 11:24:16', null);
INSERT INTO `dtoa_material` VALUES ('290', '11101014', '镀锌弯头', '92', '11101', '镀锌管件', '个', 'DN25*20', '热镀锌', '', '1', '管理员', '2019-11-29 11:24:57', null);
INSERT INTO `dtoa_material` VALUES ('291', '11101015', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN40*20', '热镀锌', '', '1', '管理员', '2019-11-29 11:25:52', '2021-12-14 09:44:52');
INSERT INTO `dtoa_material` VALUES ('292', '11107012', 'W型铸铁检查口', '109', '11107', '球墨管材管件', '个', 'DN100', '球墨铸铁', '', '1', '管理员', '2019-11-29 11:26:44', '2019-12-03 13:39:01');
INSERT INTO `dtoa_material` VALUES ('293', '11107013', 'W型铸铁弯头', '109', '11107', '球墨管材管件', '个', 'DN100双45°', '球墨铸铁', '', '1', '管理员', '2019-11-29 11:27:37', '2019-12-03 13:38:36');
INSERT INTO `dtoa_material` VALUES ('294', '11107014', 'W型铸铁弯头', '109', '11107', '球墨管材管件', '个', 'DN100*90°', '球墨铸铁', '', '1', '管理员', '2019-11-29 11:28:37', '2019-12-03 13:39:17');
INSERT INTO `dtoa_material` VALUES ('295', '11107015', 'W型铸铁清扫口', '109', '11107', '球墨管材管件', '个', 'DN100', '球墨铸铁', '', '1', '管理员', '2019-11-29 11:29:11', '2019-12-03 13:39:53');
INSERT INTO `dtoa_material` VALUES ('296', '11107016', 'W型铸铁清扫口', '109', '11107', '球墨管材管件', '个', 'DN75', '球墨铸铁', '', '1', '管理员', '2019-11-29 11:29:42', '2019-12-03 13:40:06');
INSERT INTO `dtoa_material` VALUES ('297', '11107017', 'W型铸铁P型反水弯', '109', '11107', '球墨管材管件', '个', 'DN50', '球墨铸铁', '', '1', '管理员', '2019-11-29 11:30:13', '2019-12-03 13:40:18');
INSERT INTO `dtoa_material` VALUES ('298', '11107018', 'W型铸铁S型反水弯', '109', '11107', '球墨管材管件', '个', 'DN50', '球墨铸铁', '', '1', '管理员', '2019-11-29 11:31:14', '2019-12-03 13:40:56');
INSERT INTO `dtoa_material` VALUES ('299', '11107019', 'W型铸铁T型三通', '109', '11107', '球墨管材管件', '个', 'DN100', '球墨铸铁', '', '1', '管理员', '2019-11-29 11:31:48', '2019-12-03 13:41:43');
INSERT INTO `dtoa_material` VALUES ('300', '11107020', 'W型铸铁T型三通', '109', '11107', '球墨管材管件', '个', 'DN100*50', '球墨铸铁', '', '1', '管理员', '2019-11-29 13:59:05', '2019-12-03 13:41:56');
INSERT INTO `dtoa_material` VALUES ('301', '11107021', 'W型铸铁T型三通', '109', '11107', '球墨管材管件', '个', 'DN50', '球墨铸铁', '', '1', '管理员', '2019-11-29 13:59:58', '2019-12-03 13:42:08');
INSERT INTO `dtoa_material` VALUES ('302', '11107022', 'W型铸铁Y型三通', '109', '11107', '球墨管材管件', '个', 'DN75', '球墨铸铁', '', '1', '管理员', '2019-11-29 14:00:45', '2019-12-03 13:42:40');
INSERT INTO `dtoa_material` VALUES ('303', '11107023', 'W型铸铁顺水三通', '109', '11107', '球墨管材管件', '个', 'DN100*50', '球墨铸铁', '', '1', '管理员', '2019-11-30 08:48:31', '2022-04-18 09:53:45');
INSERT INTO `dtoa_material` VALUES ('304', '11107024', 'W型铸铁顺水三通', '109', '11107', '球墨管材管件', '个', 'DN75', '球墨铸铁', '', '1', '管理员', '2019-11-30 09:05:17', '2019-12-03 13:43:03');
INSERT INTO `dtoa_material` VALUES ('305', '11107025', 'W型铸铁顺水三通', '109', '11107', '球墨管材管件', '个', 'DN50', '球墨铸铁', '', '1', '管理员', '2019-11-30 09:05:42', '2019-12-03 13:43:14');
INSERT INTO `dtoa_material` VALUES ('306', '11107026', 'W型铸铁弯头', '109', '11107', '球墨管材管件', '个', 'DN75*90°', '球墨铸铁', '', '1', '管理员', '2019-11-30 09:06:03', '2019-12-03 13:43:26');
INSERT INTO `dtoa_material` VALUES ('307', '11107027', 'W型铸铁弯头', '109', '11107', '球墨管材管件', '个', 'DN75*45°', '球墨铸铁', '', '1', '管理员', '2019-11-30 09:10:00', '2019-12-03 13:43:36');
INSERT INTO `dtoa_material` VALUES ('308', '11107028', 'W型铸铁弯头', '109', '11107', '球墨管材管件', '个', 'DN50*45°', '球墨铸铁', '', '1', '管理员', '2019-11-30 09:13:09', '2019-12-03 13:43:47');
INSERT INTO `dtoa_material` VALUES ('309', '11107029', 'W型铸铁大小头', '109', '11107', '球墨管材管件', '个', 'DN100*75', '球墨铸铁', '', '1', '管理员', '2019-11-30 09:13:47', '2019-12-03 13:43:57');
INSERT INTO `dtoa_material` VALUES ('310', '11107030', 'W型铸铁大小头', '109', '11107', '球墨管材管件', '个', 'DN75*50', '球墨铸铁', '', '1', '管理员', '2019-11-30 09:14:23', '2019-12-03 13:44:08');
INSERT INTO `dtoa_material` VALUES ('311', '11107031', 'W型铸铁顺水三通', '109', '11107', '球墨管材管件', '个', 'DN100*75', '球墨铸铁', '', '1', '管理员', '2019-11-30 09:15:09', '2019-12-03 13:44:24');
INSERT INTO `dtoa_material` VALUES ('312', '11107032', 'W型铸铁盲堵', '109', '11107', '球墨管材管件', '个', 'DN100', '球墨铸铁', '', '1', '管理员', '2019-11-30 09:54:09', '2019-12-03 13:44:35');
INSERT INTO `dtoa_material` VALUES ('313', '11107033', 'W型铸铁地漏', '109', '11107', '球墨管材管件', '个', 'DN50', '球墨铸铁', '', '1', '管理员', '2019-11-30 10:01:12', '2019-12-03 13:44:44');
INSERT INTO `dtoa_material` VALUES ('314', '11107034', 'W型铸铁弯头', '109', '11107', '球墨管材管件', '个', 'DN75双45°', '球墨铸铁', '', '1', '管理员', '2019-11-30 10:10:45', '2019-12-03 13:45:06');
INSERT INTO `dtoa_material` VALUES ('315', '10403001', '页岩砖', '101', '10403', '砌块砖等', '块', '235*115*53', '', '', '1', '管理员', '2019-11-30 10:12:16', null);
INSERT INTO `dtoa_material` VALUES ('316', '103001', 'PO42.5袋装水泥', '4', '103', '水泥', '吨', 'PO42.5', '', '', '1', '管理员', '2019-11-30 10:46:05', null);
INSERT INTO `dtoa_material` VALUES ('317', '103002', 'PO32.5袋装水泥', '4', '103', '水泥', '吨', 'PO32.5', '', '', '1', '管理员', '2019-11-30 10:46:56', null);
INSERT INTO `dtoa_material` VALUES ('318', '10501001', '全瓷地砖', '125', '10501', '瓷砖', '㎡', '600*600', '玻化砖', '', '1', '管理员', '2019-11-30 10:50:44', null);
INSERT INTO `dtoa_material` VALUES ('319', '10501002', '白条外墙砖', '125', '10501', '瓷砖', '箱', '60*240*60片', '釉面砖', '', '1', '管理员', '2019-11-30 10:51:24', null);
INSERT INTO `dtoa_material` VALUES ('320', '10501003', '卫生间墙砖', '125', '10501', '瓷砖', '㎡', '300*600', '釉面砖', '', '1', '管理员', '2019-11-30 10:52:19', null);
INSERT INTO `dtoa_material` VALUES ('321', '10501004', '卫生间地砖', '125', '10501', '瓷砖', '㎡', '300*300', '全瓷砖', '', '1', '管理员', '2019-11-30 10:53:28', null);
INSERT INTO `dtoa_material` VALUES ('322', '10501005', '全瓷地砖', '125', '10501', '瓷砖', '㎡', '800*800', '玻化砖', '', '1', '管理员', '2019-11-30 10:54:16', null);
INSERT INTO `dtoa_material` VALUES ('323', '10501006', '踢脚线', '125', '10501', '瓷砖', '块', '800*100', '全瓷砖', '', '1', '管理员', '2019-11-30 10:57:07', null);
INSERT INTO `dtoa_material` VALUES ('324', '10501007', '踢脚线', '125', '10501', '瓷砖', '块', '600*100', '全瓷砖', '', '1', '管理员', '2019-11-30 10:58:31', null);
INSERT INTO `dtoa_material` VALUES ('325', '10501008', '全瓷墙砖', '125', '10501', '瓷砖', '块', '400*800', '玻化砖', '', '1', '管理员', '2019-11-30 10:59:49', null);
INSERT INTO `dtoa_material` VALUES ('326', '10902001', '橡塑保温管', '128', '10902', '保温材料', '米', '150', '橡塑海绵', '', '1', '管理员', '2019-12-02 10:26:19', '2019-12-04 08:20:03');
INSERT INTO `dtoa_material` VALUES ('327', '11107035', 'W型铸铁地漏', '109', '11107', '球墨管材管件', '个', 'DN75', '球墨铸铁', '', '1', '管理员', '2019-12-02 10:26:51', '2019-12-03 13:45:19');
INSERT INTO `dtoa_material` VALUES ('328', '1010101002', '镀锌焊接钢管', '52', '1010101', '镀锌焊接钢管', '米', 'DN25', '', '', '1', '管理员', '2019-12-02 10:29:18', null);
INSERT INTO `dtoa_material` VALUES ('329', '11107036', 'W型铸铁S型反水弯', '109', '11107', '球墨管材管件', '个', 'DN75', '球墨铸铁', '', '1', '管理员', '2019-12-02 13:57:14', '2019-12-03 13:45:32');
INSERT INTO `dtoa_material` VALUES ('330', '11103001', '镀锌衬塑弯头', '94', '11103', '镀锌衬塑管件', '个', 'DN32*90°', '镀锌衬塑', '', '1', '管理员', '2019-12-02 13:59:00', '2019-12-02 14:01:05');
INSERT INTO `dtoa_material` VALUES ('331', '11103002', '镀锌衬塑弯头', '94', '11103', '镀锌衬塑管件', '个', 'DN32*15', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:00:07', null);
INSERT INTO `dtoa_material` VALUES ('332', '11103003', '镀锌衬塑弯头', '94', '11103', '镀锌衬塑管件', '个', 'DN32*25', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:01:06', null);
INSERT INTO `dtoa_material` VALUES ('333', '11103004', '镀锌衬塑弯头', '94', '11103', '镀锌衬塑管件', '个', 'DN32*20', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:03:14', null);
INSERT INTO `dtoa_material` VALUES ('334', '11103005', '镀锌衬塑弯头', '94', '11103', '镀锌衬塑管件', '个', 'DN20*90°', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:03:57', null);
INSERT INTO `dtoa_material` VALUES ('335', '11103006', '镀锌衬塑弯头', '94', '11103', '镀锌衬塑管件', '个', 'DN20*15', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:04:41', null);
INSERT INTO `dtoa_material` VALUES ('336', '11103007', '镀锌衬塑弯头', '94', '11103', '镀锌衬塑管件', '个', 'DN15*90°', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:05:18', '2019-12-02 14:06:02');
INSERT INTO `dtoa_material` VALUES ('337', '11103008', '镀锌衬塑三通', '94', '11103', '镀锌衬塑管件', '个', 'DN32*25', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:06:03', null);
INSERT INTO `dtoa_material` VALUES ('338', '11103009', '镀锌衬塑三通', '94', '11103', '镀锌衬塑管件', '个', 'DN40*32', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:06:38', null);
INSERT INTO `dtoa_material` VALUES ('339', '11103010', '镀锌衬塑三通', '94', '11103', '镀锌衬塑管件', '个', 'DN20*15', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:07:14', null);
INSERT INTO `dtoa_material` VALUES ('340', '11103011', '镀锌衬塑三通', '94', '11103', '镀锌衬塑管件', '个', 'DN32*15', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:07:48', null);
INSERT INTO `dtoa_material` VALUES ('341', '11103012', '镀锌衬塑油任', '94', '11103', '镀锌衬塑管件', '个', 'DN32', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:08:30', null);
INSERT INTO `dtoa_material` VALUES ('342', '11103013', '镀锌衬塑对丝', '94', '11103', '镀锌衬塑管件', '个', 'DN32', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:09:15', null);
INSERT INTO `dtoa_material` VALUES ('343', '11103014', '镀锌衬塑对丝', '94', '11103', '镀锌衬塑管件', '个', 'DN20', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:09:52', null);
INSERT INTO `dtoa_material` VALUES ('344', '11103015', '镀锌衬塑对丝', '94', '11103', '镀锌衬塑管件', '个', 'DN15', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:10:22', null);
INSERT INTO `dtoa_material` VALUES ('345', '11109003', '充气皮堵', '122', '11109', '水暖辅材', '个', '100', '橡胶', '', '1', '管理员', '2019-12-02 14:10:52', null);
INSERT INTO `dtoa_material` VALUES ('346', '11109004', '胀栓抱箍', '122', '11109', '水暖辅材', '个', 'DN20', '铁', '', '1', '管理员', '2019-12-02 14:11:59', '2019-12-03 08:22:14');
INSERT INTO `dtoa_material` VALUES ('347', '11109005', '胀栓抱箍', '122', '11109', '水暖辅材', '个', 'DN15', '铁', '', '1', '管理员', '2019-12-02 14:13:30', '2019-12-03 08:22:00');
INSERT INTO `dtoa_material` VALUES ('348', '11109006', 'U型卡', '122', '11109', '水暖辅材', '套', 'DN32', '铁', '', '1', '管理员', '2019-12-02 14:13:54', null);
INSERT INTO `dtoa_material` VALUES ('349', '11103016', '镀锌衬塑管箍', '94', '11103', '镀锌衬塑管件', '个', 'DN25', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:14:55', null);
INSERT INTO `dtoa_material` VALUES ('350', '11103017', '镀锌衬塑管箍', '94', '11103', '镀锌衬塑管件', '个', 'DN32', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:15:46', null);
INSERT INTO `dtoa_material` VALUES ('351', '11103018', '镀锌衬塑管箍', '94', '11103', '镀锌衬塑管件', '个', 'DN32*25', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:16:18', null);
INSERT INTO `dtoa_material` VALUES ('352', '11103019', '镀锌衬塑管箍', '94', '11103', '镀锌衬塑管件', '个', 'DN32*20', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:16:55', null);
INSERT INTO `dtoa_material` VALUES ('353', '11103020', '镀锌衬塑管箍', '94', '11103', '镀锌衬塑管件', '个', 'DN20*15', '镀锌衬塑', '', '1', '管理员', '2019-12-02 14:17:20', null);
INSERT INTO `dtoa_material` VALUES ('354', '11110001', 'PVC斜三通', '129', '11110', 'PVC管材管件', '个', 'Φ200*160', 'PVC', '', '1', '管理员', '2019-12-02 14:18:32', '2019-12-02 14:26:00');
INSERT INTO `dtoa_material` VALUES ('355', '11110002', 'PVC斜三通', '129', '11110', 'PVC管材管件', '个', 'Φ160', 'PVC', '', '1', '管理员', '2019-12-02 14:26:01', null);
INSERT INTO `dtoa_material` VALUES ('356', '11110003', 'PVC斜三通', '129', '11110', 'PVC管材管件', '个', 'Φ75', 'PVC', '', '1', '管理员', '2019-12-02 14:26:35', null);
INSERT INTO `dtoa_material` VALUES ('357', '11110004', 'PVC斜三通', '129', '11110', 'PVC管材管件', '个', 'Φ160*75', 'PVC', '', '1', '管理员', '2019-12-02 14:27:14', null);
INSERT INTO `dtoa_material` VALUES ('358', '11110005', 'PVC斜三通', '129', '11110', 'PVC管材管件', '个', 'Φ160*110', 'PVC', '', '1', '管理员', '2019-12-02 14:28:50', null);
INSERT INTO `dtoa_material` VALUES ('359', '11110006', 'PVC斜三通', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '1', '管理员', '2019-12-02 14:29:27', null);
INSERT INTO `dtoa_material` VALUES ('360', '11110007', 'PVC斜三通', '129', '11110', 'PVC管材管件', '个', 'Φ110*75', 'PVC', '', '1', '管理员', '2019-12-02 14:29:57', null);
INSERT INTO `dtoa_material` VALUES ('361', '11110008', 'PVC管箍', '129', '11110', 'PVC管材管件', '个', 'Φ200*160', 'PVC', '', '1', '管理员', '2019-12-02 14:31:27', null);
INSERT INTO `dtoa_material` VALUES ('362', '11110009', 'PVC管箍', '129', '11110', 'PVC管材管件', '个', 'Φ160*110', 'PVC', '', '1', '管理员', '2019-12-02 14:32:03', null);
INSERT INTO `dtoa_material` VALUES ('363', '11110010', 'PVC管箍', '129', '11110', 'PVC管材管件', '个', 'Φ110*75', 'PVC', '', '1', '管理员', '2019-12-02 14:33:16', null);
INSERT INTO `dtoa_material` VALUES ('364', '11110011', 'PVC弯头', '129', '11110', 'PVC管材管件', '个', 'Φ160*45°', 'PVC', '', '1', '管理员', '2019-12-02 14:33:42', null);
INSERT INTO `dtoa_material` VALUES ('365', '11110012', 'PVC弯头', '129', '11110', 'PVC管材管件', '个', 'Φ110*45°', 'PVC', '', '1', '管理员', '2019-12-02 14:34:13', null);
INSERT INTO `dtoa_material` VALUES ('366', '11110013', 'PVC弯头', '129', '11110', 'PVC管材管件', '个', 'Φ75*45°', 'PVC', '', '1', '管理员', '2019-12-02 14:34:53', null);
INSERT INTO `dtoa_material` VALUES ('367', '11110014', 'PVC地漏清扫口', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '1', '管理员', '2019-12-02 14:35:29', null);
INSERT INTO `dtoa_material` VALUES ('368', '11110015', 'PVC地漏', '129', '11110', 'PVC管材管件', '个', 'Φ160', 'PVC', '', '1', '管理员', '2019-12-02 14:38:53', null);
INSERT INTO `dtoa_material` VALUES ('369', '11110016', 'PVC地漏', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '1', '管理员', '2019-12-02 14:39:34', null);
INSERT INTO `dtoa_material` VALUES ('370', '11110017', 'PVC地漏', '129', '11110', 'PVC管材管件', '个', 'Φ75', 'PVC', '', '1', '管理员', '2019-12-02 14:39:59', null);
INSERT INTO `dtoa_material` VALUES ('371', '11110018', 'PVC管箍', '129', '11110', 'PVC管材管件', '个', 'Φ200', 'PVC', '', '1', '管理员', '2019-12-02 14:40:20', null);
INSERT INTO `dtoa_material` VALUES ('372', '11110019', 'PVC管箍', '129', '11110', 'PVC管材管件', '个', 'Φ160', 'PVC', '', '1', '管理员', '2019-12-02 14:40:58', null);
INSERT INTO `dtoa_material` VALUES ('373', '11110020', 'PVC管箍', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '1', '管理员', '2019-12-02 14:41:32', null);
INSERT INTO `dtoa_material` VALUES ('374', '11110021', 'PVC排水管', '129', '11110', 'PVC管材管件', '米', 'Φ200', 'PVC', '', '1', '管理员', '2019-12-02 14:41:58', null);
INSERT INTO `dtoa_material` VALUES ('375', '11110022', 'PVC排水管', '129', '11110', 'PVC管材管件', '米', 'Φ160', 'PVC', '', '1', '管理员', '2019-12-02 14:43:10', null);
INSERT INTO `dtoa_material` VALUES ('376', '11110023', 'PVC排水管', '129', '11110', 'PVC管材管件', '米', 'Φ110', 'PVC', '', '1', '管理员', '2019-12-02 14:43:31', null);
INSERT INTO `dtoa_material` VALUES ('377', '11110024', 'PVC排水管', '129', '11110', 'PVC管材管件', '米', 'Φ75', 'PVC', '', '1', '管理员', '2019-12-02 14:43:57', null);
INSERT INTO `dtoa_material` VALUES ('378', '11110025', 'PVC排水管', '129', '11110', 'PVC管材管件', '米', 'Φ50', 'PVC', '', '1', '管理员', '2019-12-02 14:44:17', null);
INSERT INTO `dtoa_material` VALUES ('379', '11110026', 'PVC胶', '129', '11110', 'PVC管材管件', '桶', '500g', '', '', '1', '管理员', '2019-12-02 14:44:43', '2019-12-02 14:53:24');
INSERT INTO `dtoa_material` VALUES ('380', '11105007', 'PPR外丝活接', '107', '11105', 'PPR管材管件', '个', '32*1寸', 'PPR', '', '1', '管理员', '2019-12-02 14:47:27', null);
INSERT INTO `dtoa_material` VALUES ('381', '11105008', 'PPR外丝活接', '107', '11105', 'PPR管材管件', '个', '25*3/4', 'PPR', '', '1', '管理员', '2019-12-02 14:49:35', null);
INSERT INTO `dtoa_material` VALUES ('382', '11105009', 'PPR内丝直接', '107', '11105', 'PPR管材管件', '个', '32*1寸', 'PPR', '', '1', '管理员', '2019-12-02 14:50:15', null);
INSERT INTO `dtoa_material` VALUES ('383', '11105010', 'PPR内丝直接', '107', '11105', 'PPR管材管件', '个', '25*3/4', 'PPR', '', '1', '管理员', '2019-12-02 14:53:25', null);
INSERT INTO `dtoa_material` VALUES ('384', '11105011', 'PPR弯头', '107', '11105', 'PPR管材管件', '个', '32*90°', 'PPR', '', '1', '管理员', '2019-12-02 14:54:59', null);
INSERT INTO `dtoa_material` VALUES ('385', '11105012', 'PPR弯头', '107', '11105', 'PPR管材管件', '个', '25*90°', 'PPR', '', '1', '管理员', '2019-12-02 14:55:43', null);
INSERT INTO `dtoa_material` VALUES ('386', '11105013', 'PPR管箍', '107', '11105', 'PPR管材管件', '个', '32', 'PPR', '', '1', '管理员', '2019-12-02 14:56:17', null);
INSERT INTO `dtoa_material` VALUES ('387', '11105014', 'PPR热水管', '107', '11105', 'PPR管材管件', '米', '32', 'PPR', '', '1', '管理员', '2019-12-02 14:56:42', null);
INSERT INTO `dtoa_material` VALUES ('388', '11105015', 'PPR热水管', '107', '11105', 'PPR管材管件', '米', '25', 'PPR', '', '1', '管理员', '2019-12-02 14:57:11', null);
INSERT INTO `dtoa_material` VALUES ('389', '11111001', '铝塑管外丝直接', '130', '11111', '铝塑管材管件', '个', '25*3/4', '铜', '', '1', '管理员', '2019-12-02 14:58:28', '2019-12-02 15:04:19');
INSERT INTO `dtoa_material` VALUES ('390', '11111002', '铝塑管外丝直接', '130', '11111', '铝塑管材管件', '个', '20*1/2', '铜', '', '1', '管理员', '2019-12-02 14:59:24', '2019-12-02 15:04:13');
INSERT INTO `dtoa_material` VALUES ('391', '11111003', '铝塑管', '130', '11111', '铝塑管材管件', '米', '25', '', '', '1', '管理员', '2019-12-02 14:59:55', null);
INSERT INTO `dtoa_material` VALUES ('392', '11101016', '镀锌变径管箍', '92', '11101', '镀锌管件', '个', 'DN80*15', '热镀锌', '', '1', '管理员', '2019-12-03 08:09:49', '2019-12-03 09:38:20');
INSERT INTO `dtoa_material` VALUES ('393', '11101017', '镀锌对丝', '92', '11101', '镀锌管件', '个', 'DN80*15', '热镀锌', '', '1', '管理员', '2019-12-03 08:18:26', null);
INSERT INTO `dtoa_material` VALUES ('394', '11101018', '镀锌丝堵', '92', '11101', '镀锌管件', '个', 'DN50', '热镀锌', '', '1', '管理员', '2019-12-03 08:19:10', null);
INSERT INTO `dtoa_material` VALUES ('395', '11101019', '镀锌丝堵', '92', '11101', '镀锌管件', '个', 'DN32', '热镀锌', '', '1', '管理员', '2019-12-03 08:19:41', null);
INSERT INTO `dtoa_material` VALUES ('396', '11102025', '八字阀', '93', '11102', '控水主材', '个', 'DN15', '', '', '1', '管理员', '2019-12-03 08:20:03', null);
INSERT INTO `dtoa_material` VALUES ('397', '11109007', '胀栓抱箍', '122', '11109', '水暖辅材', '个', 'DN25', '铁', '', '1', '管理员', '2019-12-03 08:22:14', null);
INSERT INTO `dtoa_material` VALUES ('398', '11109008', '铝箔玻璃棉保温管', '122', '11109', '水暖辅材', '米', 'DN65*5', '', '', '1', '管理员', '2019-12-03 08:23:02', null);
INSERT INTO `dtoa_material` VALUES ('399', '11109009', '铝箔玻璃棉保温管', '122', '11109', '水暖辅材', '米', 'DN50*5', '', '', '1', '管理员', '2019-12-03 08:37:48', null);
INSERT INTO `dtoa_material` VALUES ('400', '11109010', '铝箔玻璃棉保温管', '122', '11109', '水暖辅材', '米', 'DN40*5', '', '', '1', '管理员', '2019-12-03 08:38:20', null);
INSERT INTO `dtoa_material` VALUES ('401', '11109011', '铝箔玻璃棉保温管', '122', '11109', '水暖辅材', '米', 'DN32*5', '', '', '1', '管理员', '2019-12-03 08:38:50', null);
INSERT INTO `dtoa_material` VALUES ('402', '11109012', '铝箔玻璃棉保温管', '122', '11109', '水暖辅材', '米', 'DN25*5', '', '', '1', '管理员', '2019-12-03 08:39:17', null);
INSERT INTO `dtoa_material` VALUES ('403', '10701028', '拉爆', '90', '10701', '五金材料', '个', '8', '', '', '1', '管理员', '2019-12-03 08:39:45', null);
INSERT INTO `dtoa_material` VALUES ('404', '11112001', '不锈钢给水管', '131', '11112', '不锈钢给水材料', '米', 'DN20', '304', '', '1', '管理员', '2019-12-03 08:41:36', null);
INSERT INTO `dtoa_material` VALUES ('405', '11112002', '双卡压外丝三通', '131', '11112', '不锈钢给水材料', '个', 'DN20*15', '304', '', '1', '管理员', '2019-12-03 08:42:18', null);
INSERT INTO `dtoa_material` VALUES ('406', '11112003', '卡压管箍', '131', '11112', '不锈钢给水材料', '个', 'DN20', '304', '', '1', '管理员', '2019-12-03 08:46:12', null);
INSERT INTO `dtoa_material` VALUES ('407', '11112004', '卡压弯头', '131', '11112', '不锈钢给水材料', '个', 'DN20', '304', '', '1', '管理员', '2019-12-03 08:46:48', null);
INSERT INTO `dtoa_material` VALUES ('408', '11102026', '不锈钢内丝球阀', '93', '11102', '控水主材', '个', 'DN20', '304', '', '1', '管理员', '2019-12-03 08:47:16', null);
INSERT INTO `dtoa_material` VALUES ('409', '11102027', '不锈钢内外丝球阀', '93', '11102', '控水主材', '个', 'DN15', '304', '', '1', '管理员', '2019-12-03 08:47:59', null);
INSERT INTO `dtoa_material` VALUES ('410', '11112005', '卡压活接', '131', '11112', '不锈钢给水材料', '个', 'DN20', '304', '', '1', '管理员', '2019-12-03 08:48:32', null);
INSERT INTO `dtoa_material` VALUES ('411', '11112006', '卡压三通', '131', '11112', '不锈钢给水材料', '个', 'DN20', '304', '', '1', '管理员', '2019-12-03 08:49:00', null);
INSERT INTO `dtoa_material` VALUES ('412', '11112007', '卡压外丝管箍', '131', '11112', '不锈钢给水材料', '个', 'DN20', '304', '', '1', '管理员', '2019-12-03 08:49:31', null);
INSERT INTO `dtoa_material` VALUES ('413', '11102028', '自动排气阀', '93', '11102', '控水主材', '个', 'DN20', '304', '', '1', '管理员', '2019-12-03 08:50:20', null);
INSERT INTO `dtoa_material` VALUES ('414', '11109013', '不锈钢立管卡', '122', '11109', '水暖辅材', '个', 'DN20', '304', '', '1', '管理员', '2019-12-03 08:53:29', null);
INSERT INTO `dtoa_material` VALUES ('415', '11112008', '卡压钳', '131', '11112', '不锈钢给水材料', '把', '', '', '', '1', '管理员', '2019-12-03 08:56:35', null);
INSERT INTO `dtoa_material` VALUES ('416', '10701029', '通丝', '90', '10701', '五金材料', '米', 'M8', '铁', '', '1', '管理员', '2019-12-03 08:57:09', null);
INSERT INTO `dtoa_material` VALUES ('417', '11101020', '镀锌弯头', '92', '11101', '镀锌管件', '个', 'DN20', '热镀锌', '', '1', '管理员', '2019-12-03 08:57:51', null);
INSERT INTO `dtoa_material` VALUES ('418', '11101021', '镀锌弯头', '92', '11101', '镀锌管件', '个', 'DN20*15', '热镀锌', '', '1', '管理员', '2019-12-03 09:01:31', null);
INSERT INTO `dtoa_material` VALUES ('419', '11101022', '镀锌中大四通', '92', '11101', '镀锌管件', '个', 'DN25*15', '热镀锌', '', '1', '管理员', '2019-12-03 09:02:03', null);
INSERT INTO `dtoa_material` VALUES ('420', '11101023', '镀锌中大三通', '92', '11101', '镀锌管件', '个', 'DN20*15', '热镀锌', '', '1', '管理员', '2019-12-03 09:02:42', null);
INSERT INTO `dtoa_material` VALUES ('421', '11113001', '铸铁暖气片', '132', '11113', '散热器', '片', '760型', '铸铁', '', '1', '管理员', '2019-12-03 09:08:21', null);
INSERT INTO `dtoa_material` VALUES ('422', '10406001', '道牙路沿石', '133', '10406', '砼构件', '块', '500*300*120', '砼预制', '', '1', '管理员', '2019-12-03 09:12:25', '2020-11-26 10:26:04');
INSERT INTO `dtoa_material` VALUES ('423', '11110027', 'PVC球阀', '129', '11110', 'PVC管材管件', '个', '25*20', 'PVC', '', '1', '管理员', '2019-12-03 09:13:27', null);
INSERT INTO `dtoa_material` VALUES ('424', '11107037', '铸铁抱箍', '109', '11107', '球墨管材管件', '个', '100', '', '', '1', '管理员', '2019-12-03 09:15:41', null);
INSERT INTO `dtoa_material` VALUES ('425', '11110028', 'PVC地漏', '129', '11110', 'PVC管材管件', '个', '50', 'PVC', '', '1', '管理员', '2019-12-03 09:22:15', null);
INSERT INTO `dtoa_material` VALUES ('426', '11110029', 'P型反水弯', '129', '11110', 'PVC管材管件', '个', 'Φ50', 'PVC', '', '1', '管理员', '2019-12-03 09:22:43', null);
INSERT INTO `dtoa_material` VALUES ('427', '11109014', '坐便密封圈', '122', '11109', '水暖辅材', '个', '40', '', '', '1', '管理员', '2019-12-03 09:23:39', null);
INSERT INTO `dtoa_material` VALUES ('428', '10802004', '玻璃胶', '117', '10802', '化工产品', '支', '', '', '', '1', '管理员', '2019-12-03 09:24:12', null);
INSERT INTO `dtoa_material` VALUES ('429', '10503001', '堵漏灵', '134', '10503', '小型材料', '袋', '5KG', '', '', '1', '管理员', '2019-12-03 09:29:33', null);
INSERT INTO `dtoa_material` VALUES ('430', '10704004', '热熔机头', '120', '10704', '五金设备配件', '个', '20', '', '', '1', '管理员', '2019-12-03 09:30:09', null);
INSERT INTO `dtoa_material` VALUES ('431', '10704005', '热熔机头', '120', '10704', '五金设备配件', '个', '25', '', '', '1', '管理员', '2019-12-03 09:31:05', null);
INSERT INTO `dtoa_material` VALUES ('432', '11110030', 'PVC补芯', '129', '11110', 'PVC管材管件', '个', 'Φ110*75', 'PVC', '', '1', '管理员', '2019-12-03 09:31:19', null);
INSERT INTO `dtoa_material` VALUES ('433', '11110031', 'PVC管堵', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '1', '管理员', '2019-12-03 09:32:06', null);
INSERT INTO `dtoa_material` VALUES ('434', '11101024', '镀锌过桥弯', '92', '11101', '镀锌管件', '个', 'DN20', '热镀锌', '', '1', '管理员', '2019-12-03 09:32:29', null);
INSERT INTO `dtoa_material` VALUES ('435', '11109015', '双管卡子', '122', '11109', '水暖辅材', '个', 'DN20', '', '', '1', '管理员', '2019-12-03 09:35:04', null);
INSERT INTO `dtoa_material` VALUES ('436', '11101025', '镀锌变径管箍', '92', '11101', '镀锌管件', '个', 'DN25*20', '热镀锌', '', '1', '管理员', '2019-12-03 09:38:21', null);
INSERT INTO `dtoa_material` VALUES ('437', '11102029', '铜闸阀', '93', '11102', '控水主材', '个', 'DN15', '铜', '', '1', '管理员', '2019-12-03 09:39:16', null);
INSERT INTO `dtoa_material` VALUES ('438', '11102030', '自动排气阀', '93', '11102', '控水主材', '个', 'DN20', '铜', '', '1', '管理员', '2019-12-03 13:29:12', null);
INSERT INTO `dtoa_material` VALUES ('439', '11111004', '铝塑外丝弯头', '130', '11111', '铝塑管材管件', '个', '25*3/4', '铜', '', '1', '管理员', '2019-12-03 13:30:34', null);
INSERT INTO `dtoa_material` VALUES ('440', '11107038', 'W型铸铁盲堵', '109', '11107', '球墨管材管件', '个', 'DN75', '球墨铸铁', '', '1', '管理员', '2019-12-03 13:47:31', null);
INSERT INTO `dtoa_material` VALUES ('441', '11111005', '铝塑管', '130', '11111', '铝塑管材管件', '米', '20', '', '', '1', '管理员', '2019-12-03 13:48:38', null);
INSERT INTO `dtoa_material` VALUES ('442', '11105016', 'PPR外丝活接', '107', '11105', 'PPR管材管件', '个', '20*1/2', 'PPR', '', '1', '管理员', '2019-12-03 13:49:22', null);
INSERT INTO `dtoa_material` VALUES ('443', '10902002', '橡塑保温管', '128', '10902', '保温材料', '米', '100*3', '橡塑海绵', '', '1', '管理员', '2019-12-04 08:15:57', '2019-12-04 08:19:55');
INSERT INTO `dtoa_material` VALUES ('444', '10902003', '橡塑保温管', '128', '10902', '保温材料', '米', '80*3', '橡塑海绵', '', '1', '管理员', '2019-12-04 08:17:45', '2019-12-04 08:20:23');
INSERT INTO `dtoa_material` VALUES ('445', '10902004', '橡塑保温管', '128', '10902', '保温材料', '米', '65*3', '橡塑海绵', '', '1', '管理员', '2019-12-04 08:18:06', '2019-12-04 08:20:34');
INSERT INTO `dtoa_material` VALUES ('446', '10902005', '橡塑保温管', '128', '10902', '保温材料', '米', '50*3', '橡塑海绵', '', '1', '管理员', '2019-12-04 08:18:28', '2019-12-04 08:20:40');
INSERT INTO `dtoa_material` VALUES ('447', '10902006', '橡塑保温管', '128', '10902', '保温材料', '米', '32*3', '橡塑海绵', '', '1', '管理员', '2019-12-04 08:18:54', '2019-12-04 08:20:48');
INSERT INTO `dtoa_material` VALUES ('448', '10902007', '橡塑保温管', '128', '10902', '保温材料', '米', '40*3', '橡塑海绵', '', '1', '管理员', '2019-12-04 08:19:15', null);
INSERT INTO `dtoa_material` VALUES ('449', '10902008', '保温管包扎带', '128', '10902', '保温材料', '卷', '10cm', '白塑料布', '', '1', '管理员', '2019-12-04 08:20:48', '2019-12-16 15:14:59');
INSERT INTO `dtoa_material` VALUES ('450', '11102031', '手动跑风', '93', '11102', '控水主材', '个', 'M10*1', '铜', '', '1', '管理员', '2019-12-04 08:25:42', null);
INSERT INTO `dtoa_material` VALUES ('451', '11113002', '反扣炉堵', '132', '11113', '散热器', '个', 'DN20', '', '', '1', '管理员', '2019-12-04 08:39:28', null);
INSERT INTO `dtoa_material` VALUES ('452', '11113003', '反扣炉堵带排气孔', '132', '11113', '散热器', '个', 'DN20', '', '', '1', '管理员', '2019-12-04 08:40:28', null);
INSERT INTO `dtoa_material` VALUES ('453', '11103021', '镀锌衬塑三通', '94', '11103', '镀锌衬塑管件', '个', 'DN25*15', '镀锌衬塑', '', '1', '管理员', '2019-12-04 08:42:13', null);
INSERT INTO `dtoa_material` VALUES ('454', '11103022', '镀锌衬塑弯头', '94', '11103', '镀锌衬塑管件', '个', 'DN25*15', '镀锌衬塑', '', '1', '管理员', '2019-12-04 08:44:30', null);
INSERT INTO `dtoa_material` VALUES ('455', '11105017', 'PPR冷水管', '107', '11105', 'PPR管材管件', '米', '50', 'PPR', '', '1', '管理员', '2019-12-04 08:45:17', null);
INSERT INTO `dtoa_material` VALUES ('456', '11105018', 'PPR弯头', '107', '11105', 'PPR管材管件', '个', '50*90°', 'PPR', '', '1', '管理员', '2019-12-04 08:47:14', '2019-12-04 08:54:41');
INSERT INTO `dtoa_material` VALUES ('457', '11105019', 'PPR管箍', '107', '11105', 'PPR管材管件', '个', '50', 'PPR', '', '1', '管理员', '2019-12-04 08:49:18', null);
INSERT INTO `dtoa_material` VALUES ('458', '11105020', 'PPR外丝活接', '107', '11105', 'PPR管材管件', '个', '50*1”1/2', 'PPR', '', '1', '管理员', '2019-12-04 08:50:19', null);
INSERT INTO `dtoa_material` VALUES ('459', '11105021', 'PPR冷水管', '107', '11105', 'PPR管材管件', '米', '32', 'PPR', '', '1', '管理员', '2019-12-04 08:52:04', null);
INSERT INTO `dtoa_material` VALUES ('460', '11105022', 'PPR冷水管', '107', '11105', 'PPR管材管件', '米', '25', 'PPR', '', '1', '管理员', '2019-12-04 08:52:51', null);
INSERT INTO `dtoa_material` VALUES ('462', '11105023', 'PPR外丝直接', '107', '11105', 'PPR管材管件', '个', '20*1/2', 'PPR', '', '1', '管理员', '2019-12-04 08:55:03', null);
INSERT INTO `dtoa_material` VALUES ('463', '11105024', 'PPR三通', '107', '11105', 'PPR管材管件', '个', '25*20', 'PPR', '', '1', '管理员', '2019-12-04 08:56:32', null);
INSERT INTO `dtoa_material` VALUES ('464', '11105025', 'PPR管箍', '107', '11105', 'PPR管材管件', '个', '25', 'PPR', '', '1', '管理员', '2019-12-04 08:57:20', null);
INSERT INTO `dtoa_material` VALUES ('466', '11110032', 'PVC胶', '129', '11110', 'PVC管材管件', '桶', '1KG', '', '', '1', '管理员', '2019-12-04 08:58:52', null);
INSERT INTO `dtoa_material` VALUES ('467', '11103023', '镀锌衬塑弯头', '94', '11103', '镀锌衬塑管件', '个', 'DN25*90°', '镀锌衬塑', '', '1', '管理员', '2019-12-04 09:00:14', null);
INSERT INTO `dtoa_material` VALUES ('468', '11103024', '镀锌衬塑油任', '94', '11103', '镀锌衬塑管件', '个', 'DN25', '镀锌衬塑', '', '1', '管理员', '2019-12-04 09:01:09', null);
INSERT INTO `dtoa_material` VALUES ('469', '11102032', '铜闸阀', '93', '11102', '控水主材', '个', 'DN25', '铜', '', '1', '管理员', '2019-12-04 09:02:11', null);
INSERT INTO `dtoa_material` VALUES ('470', '11109016', '压力表弯', '122', '11109', '水暖辅材', '根', 'DN15', '不锈钢', '', '1', '管理员', '2019-12-04 09:03:29', null);
INSERT INTO `dtoa_material` VALUES ('471', '11109017', '蹲便橡胶堵', '122', '11109', '水暖辅材', '个', 'Φ25', '橡胶', '蹲便与冲水管连接', '1', '管理员', '2019-12-04 09:06:03', null);
INSERT INTO `dtoa_material` VALUES ('472', '10902009', '铝箔岩棉保温板', '128', '10902', '保温材料', '张', '600*1200*50mm', '岩棉', '', '1', '管理员', '2019-12-04 09:21:25', null);
INSERT INTO `dtoa_material` VALUES ('473', '11112009', '不锈钢对丝', '131', '11112', '不锈钢给水材料', '个', 'DN15', '304', '', '1', '管理员', '2019-12-04 09:23:30', null);
INSERT INTO `dtoa_material` VALUES ('474', '11105026', 'PPR内丝活接', '107', '11105', 'PPR管材管件', '个', '32*1/2', 'PPR', '', '1', '管理员', '2019-12-04 09:30:51', null);
INSERT INTO `dtoa_material` VALUES ('475', '11105027', 'PPR内丝活接', '107', '11105', 'PPR管材管件', '个', '25*3/4', 'PPR', '', '1', '管理员', '2019-12-04 09:31:49', null);
INSERT INTO `dtoa_material` VALUES ('476', '10902010', '挤塑板', '128', '10902', '保温材料', '方', '10cm', '', '', '1', '管理员', '2019-12-04 09:32:22', null);
INSERT INTO `dtoa_material` VALUES ('477', '10902011', '挤塑板', '128', '10902', '保温材料', '方', '5cm', '', '', '1', '管理员', '2019-12-04 09:34:47', null);
INSERT INTO `dtoa_material` VALUES ('478', '11101027', '镀锌补芯', '92', '11101', '镀锌管件', '个', 'DN50*32', '热镀锌', '', '1', '管理员', '2019-12-04 09:35:10', null);
INSERT INTO `dtoa_material` VALUES ('479', '11105028', 'PPR外丝活接', '107', '11105', 'PPR管材管件', '个', '40*1\'1/4', 'PPR', '', '1', '管理员', '2019-12-04 09:36:05', null);
INSERT INTO `dtoa_material` VALUES ('480', '11105029', 'PPR弯头', '107', '11105', 'PPR管材管件', '个', '40*90°', 'PPR', '', '1', '管理员', '2019-12-04 09:37:44', null);
INSERT INTO `dtoa_material` VALUES ('481', '11105030', 'PPR三通', '107', '11105', 'PPR管材管件', '个', '40*32', 'PPR', '', '1', '管理员', '2019-12-04 09:38:26', null);
INSERT INTO `dtoa_material` VALUES ('482', '11105031', 'PPR弯头', '107', '11105', 'PPR管材管件', '个', '40*32', 'PPR', '', '1', '管理员', '2019-12-04 09:38:52', null);
INSERT INTO `dtoa_material` VALUES ('483', '11105032', 'PPR外丝直接', '107', '11105', 'PPR管材管件', '个', '32*1寸', 'PPR', '', '1', '管理员', '2019-12-04 09:39:39', null);
INSERT INTO `dtoa_material` VALUES ('484', '11105033', 'PPR冷水管', '107', '11105', 'PPR管材管件', '米', '40', 'PPR', '', '1', '管理员', '2019-12-04 09:40:34', null);
INSERT INTO `dtoa_material` VALUES ('485', '11109018', '不锈钢卡子', '122', '11109', '水暖辅材', '个', '40', '', '', '1', '管理员', '2019-12-04 09:42:03', null);
INSERT INTO `dtoa_material` VALUES ('486', '11109019', '钢丝软管', '122', '11109', '水暖辅材', '根', '15*600', '', '', '1', '管理员', '2019-12-04 09:43:08', null);
INSERT INTO `dtoa_material` VALUES ('487', '11109020', '钢丝软管', '122', '11109', '水暖辅材', '根', '15*800', '', '', '1', '管理员', '2019-12-04 09:46:59', null);
INSERT INTO `dtoa_material` VALUES ('488', '11109021', '钢丝软管', '122', '11109', '水暖辅材', '根', '15*1000', '', '', '1', '管理员', '2019-12-04 09:47:14', null);
INSERT INTO `dtoa_material` VALUES ('489', '11109022', '钢丝软管', '122', '11109', '水暖辅材', '根', '15*500', '', '', '1', '管理员', '2019-12-04 09:47:33', null);
INSERT INTO `dtoa_material` VALUES ('490', '11105034', 'PPR内丝三通', '107', '11105', 'PPR管材管件', '个', '20*1/2', 'PPR', '', '1', '管理员', '2019-12-04 09:48:25', null);
INSERT INTO `dtoa_material` VALUES ('491', '11105035', 'PPR管箍', '107', '11105', 'PPR管材管件', '个', '20', 'PPR', '', '1', '管理员', '2019-12-04 09:50:35', null);
INSERT INTO `dtoa_material` VALUES ('492', '11105036', 'PPR管帽', '107', '11105', 'PPR管材管件', '个', '20', 'PPR', '', '1', '管理员', '2019-12-04 09:51:21', null);
INSERT INTO `dtoa_material` VALUES ('493', '11103025', '镀锌衬塑三通', '94', '11103', '镀锌衬塑管件', '个', 'DN50', '镀锌衬塑', '', '1', '管理员', '2019-12-04 09:51:43', null);
INSERT INTO `dtoa_material` VALUES ('494', '11103026', '镀锌衬塑三通', '94', '11103', '镀锌衬塑管件', '个', 'DN40*15', '镀锌衬塑', '', '1', '管理员', '2019-12-04 09:53:12', null);
INSERT INTO `dtoa_material` VALUES ('495', '11102033', 'PPR截止阀', '93', '11102', '控水主材', '个', '25', 'PPR', '', '1', '管理员', '2019-12-04 09:54:32', null);
INSERT INTO `dtoa_material` VALUES ('496', '11105037', 'PPR内丝三通', '107', '11105', 'PPR管材管件', '个', '25*1/2', 'PPR', '', '1', '管理员', '2019-12-04 10:08:40', null);
INSERT INTO `dtoa_material` VALUES ('497', '11105038', 'PPR三通', '107', '11105', 'PPR管材管件', '个', '25', 'PPR', '', '1', '管理员', '2019-12-04 10:09:22', null);
INSERT INTO `dtoa_material` VALUES ('498', '11102034', '镀铬水嘴', '93', '11102', '控水主材', '个', 'DN20', '金属', '水龙头', '1', '管理员', '2019-12-04 10:10:00', null);
INSERT INTO `dtoa_material` VALUES ('499', '11102035', '镀铬水嘴', '93', '11102', '控水主材', '个', 'DN25', '金属', '水龙头', '1', '管理员', '2019-12-04 10:11:44', null);
INSERT INTO `dtoa_material` VALUES ('500', '11105039', 'PPR墙卡', '107', '11105', 'PPR管材管件', '个', '25', 'PPR', '', '1', '管理员', '2019-12-04 10:26:51', null);
INSERT INTO `dtoa_material` VALUES ('501', '11103027', '镀锌衬塑三通', '94', '11103', '镀锌衬塑管件', '个', 'DN40*15', '镀锌衬塑', '', '1', '管理员', '2019-12-04 14:27:21', null);
INSERT INTO `dtoa_material` VALUES ('502', '11103028', '镀锌衬塑管箍', '94', '11103', '镀锌衬塑管件', '个', 'DN50*40', '镀锌衬塑', '', '1', '管理员', '2019-12-04 14:28:32', null);
INSERT INTO `dtoa_material` VALUES ('503', '11107039', 'W型铸铁顺水三通', '109', '11107', '球墨管材管件', '个', 'DN100', '球墨铸铁', '', '1', '管理员', '2019-12-04 15:04:56', null);
INSERT INTO `dtoa_material` VALUES ('504', '11007003', 'YC橡套电缆', '114', '11007', '电线电缆', '米', '4*2.5MM²', '', '', '1', '管理员', '2019-12-04 16:02:37', null);
INSERT INTO `dtoa_material` VALUES ('506', '11103029', '镀锌衬塑管箍', '94', '11103', '镀锌衬塑管件', '个', 'DN40*32', '镀锌衬塑', '', '1', '管理员', '2019-12-04 16:52:07', null);
INSERT INTO `dtoa_material` VALUES ('507', '11103030', '镀锌衬塑三通', '94', '11103', '镀锌衬塑管件', '个', 'DN50*15', '镀锌衬塑', '', '1', '管理员', '2019-12-05 08:41:24', null);
INSERT INTO `dtoa_material` VALUES ('508', '11103031', '镀锌衬塑弯头', '94', '11103', '镀锌衬塑管件', '个', 'DN50*90°', '镀锌衬塑', '', '1', '管理员', '2019-12-05 08:42:02', '2021-02-05 11:19:50');
INSERT INTO `dtoa_material` VALUES ('509', '11109023', 'U型卡', '122', '11109', '水暖辅材', '套', 'DN50', '', '', '1', '管理员', '2019-12-05 08:42:39', null);
INSERT INTO `dtoa_material` VALUES ('510', '11109024', 'U型卡', '122', '11109', '水暖辅材', '套', 'DN40', '', '', '1', '管理员', '2019-12-05 13:49:55', null);
INSERT INTO `dtoa_material` VALUES ('511', '11109025', 'U型卡', '122', '11109', '水暖辅材', '套', 'DN25', '', '', '1', '管理员', '2019-12-05 13:50:43', null);
INSERT INTO `dtoa_material` VALUES ('512', '11113004', '暖气炉垫', '132', '11113', '散热器', '个', 'DN20', '', '', '1', '管理员', '2019-12-05 13:51:13', null);
INSERT INTO `dtoa_material` VALUES ('513', '11109026', '不锈钢地漏', '122', '11109', '水暖辅材', '个', '', '', '', '1', '管理员', '2019-12-05 13:52:08', null);
INSERT INTO `dtoa_material` VALUES ('514', '11101028', '镀锌丝堵', '92', '11101', '镀锌管件', '个', 'DN15', '热镀锌', '', '1', '管理员', '2019-12-05 13:52:58', null);
INSERT INTO `dtoa_material` VALUES ('515', '11101029', '镀锌油任活接', '92', '11101', '镀锌管件', '个', 'DN20', '热镀锌', '', '1', '管理员', '2019-12-05 13:54:11', '2021-01-11 10:01:53');
INSERT INTO `dtoa_material` VALUES ('516', '11110033', 'PVC透气帽', '129', '11110', 'PVC管材管件', '个', 'Φ160', 'PVC', '', '1', '管理员', '2019-12-05 13:54:54', null);
INSERT INTO `dtoa_material` VALUES ('517', '11110034', 'PVC透气帽', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '1', '管理员', '2019-12-05 13:55:35', null);
INSERT INTO `dtoa_material` VALUES ('518', '11102036', '铜球阀', '93', '11102', '控水主材', '个', 'DN25', '', '', '1', '管理员', '2019-12-05 13:56:09', null);
INSERT INTO `dtoa_material` VALUES ('519', '11109027', '内外丝活接', '122', '11109', '水暖辅材', '个', 'DN25', '', '', '1', '管理员', '2019-12-05 13:56:45', null);
INSERT INTO `dtoa_material` VALUES ('520', '11105040', 'PPR内丝直接', '107', '11105', 'PPR管材管件', '个', '20*1/2', 'PPR', '', '1', '管理员', '2019-12-05 14:00:23', null);
INSERT INTO `dtoa_material` VALUES ('521', '11003002', '火灾监控探测器', '105', '11003', '电箱', '套', 'JBF6181-100圆形', '', '电箱配件', '1', '管理员', '2019-12-05 14:01:05', '2019-12-05 14:21:28');
INSERT INTO `dtoa_material` VALUES ('522', '11003003', '火灾监控探测器', '105', '11003', '电箱', '套', 'JBF6181-315圆形', '', '电箱配件', '1', '管理员', '2019-12-05 14:20:17', '2019-12-05 14:21:10');
INSERT INTO `dtoa_material` VALUES ('523', '11003004', '火灾监控探测器', '105', '11003', '电箱', '套', 'JBF6181-630圆形', '', '电箱配件', '1', '管理员', '2019-12-05 14:21:29', null);
INSERT INTO `dtoa_material` VALUES ('524', '11003005', '电气火灾监控设备', '105', '11003', '电箱', '台', 'JBF-61S30-128', '', '电箱配件', '1', '管理员', '2019-12-05 14:22:11', null);
INSERT INTO `dtoa_material` VALUES ('525', '11003006', '电箱设备更换', '105', '11003', '电箱', '套', '', '', '', '1', '管理员', '2019-12-05 14:26:12', null);
INSERT INTO `dtoa_material` VALUES ('526', '11003007', '电箱辅料及调试', '105', '11003', '电箱', '台', '', '', '', '1', '管理员', '2019-12-05 14:27:15', null);
INSERT INTO `dtoa_material` VALUES ('527', '11003008', 'AH1配电柜（含盘芯）', '105', '11003', '电箱', '台', '700*1800*400', '金属', '', '1', '管理员', '2019-12-05 14:27:41', null);
INSERT INTO `dtoa_material` VALUES ('528', '11003009', 'AH配电柜（含盘芯）', '105', '11003', '电箱', '台', '700*1800*400', '金属', '', '1', '管理员', '2019-12-05 14:29:06', null);
INSERT INTO `dtoa_material` VALUES ('529', '11003010', 'AL2配电箱盘芯', '105', '11003', '电箱', '套', '400*300*160', '', '无金属外壳', '1', '管理员', '2019-12-05 14:30:37', null);
INSERT INTO `dtoa_material` VALUES ('530', '11003011', 'AL2配电箱', '105', '11003', '电箱', '台', '400*300*160', '金属', '', '1', '管理员', '2019-12-05 14:31:57', null);
INSERT INTO `dtoa_material` VALUES ('531', '10702004', 'PVC弯管簧', '118', '10702', '五金工具', '根', 'Φ25', '', '', '1', '管理员', '2019-12-06 08:46:56', null);
INSERT INTO `dtoa_material` VALUES ('532', '10801006', '沥青漆', '116', '10801', '油漆水漆', '桶', '18GK', '', '', '1', '管理员', '2019-12-06 08:47:57', null);
INSERT INTO `dtoa_material` VALUES ('533', '112005', '毛刷子', '41', '112', '低值易耗品', '把', '2寸', '', '', '1', '管理员', '2019-12-06 10:52:45', null);
INSERT INTO `dtoa_material` VALUES ('534', '112006', '毛刷子', '41', '112', '低值易耗品', '把', '3寸', '', '', '1', '管理员', '2019-12-06 10:53:29', null);
INSERT INTO `dtoa_material` VALUES ('535', '112007', '毛刷子', '41', '112', '低值易耗品', '把', '5寸', '', '', '1', '管理员', '2019-12-06 10:53:46', null);
INSERT INTO `dtoa_material` VALUES ('536', '112008', '毛刷子', '41', '112', '低值易耗品', '把', '4寸', '', '', '1', '管理员', '2019-12-06 10:54:01', null);
INSERT INTO `dtoa_material` VALUES ('537', '112009', '毛刷子', '41', '112', '低值易耗品', '把', '7寸', '', '', '1', '管理员', '2019-12-06 10:54:20', null);
INSERT INTO `dtoa_material` VALUES ('538', '10701030', '切割锯片', '90', '10701', '五金材料', '片', 'Φ350', '树脂砂轮', '', '1', '管理员', '2019-12-06 10:54:35', null);
INSERT INTO `dtoa_material` VALUES ('539', '11102037', 'PPR外丝活接闸阀', '93', '11102', '控水主材', '个', 'DN25', 'PPR/铜', '', '9', '董满仓', '2019-12-09 14:36:23', null);
INSERT INTO `dtoa_material` VALUES ('540', '11102038', '内外丝活接球阀', '93', '11102', '控水主材', '个', 'DN20', '铜', '', '9', '董满仓', '2019-12-09 14:37:09', null);
INSERT INTO `dtoa_material` VALUES ('541', '11102039', '铜球阀', '93', '11102', '控水主材', '个', 'DN20', '铜', '', '9', '董满仓', '2019-12-09 14:54:35', null);
INSERT INTO `dtoa_material` VALUES ('542', '11101030', '镀锌丝堵', '92', '11101', '镀锌管件', '个', 'DN20', '热镀锌', '', '9', '董满仓', '2019-12-09 14:56:22', null);
INSERT INTO `dtoa_material` VALUES ('543', '11109028', '油任垫', '122', '11109', '水暖辅材', '个', 'DN20', '橡胶', '', '9', '董满仓', '2019-12-09 14:58:00', null);
INSERT INTO `dtoa_material` VALUES ('544', '11007004', 'WDZB-YJE电缆', '114', '11007', '电线电缆', '米', '4*240+1*120', '铜', '', '1', '管理员', '2019-12-10 08:24:59', '2019-12-10 08:28:35');
INSERT INTO `dtoa_material` VALUES ('545', '11007005', 'WDZB-YJE电缆', '114', '11007', '电线电缆', '米', '4*185+1*95', '铜', '', '1', '管理员', '2019-12-10 08:28:36', null);
INSERT INTO `dtoa_material` VALUES ('546', '11007006', 'WDZB-YJE电缆', '114', '11007', '电线电缆', '米', '4*50+1*25', '铜', '', '1', '管理员', '2019-12-10 08:29:15', null);
INSERT INTO `dtoa_material` VALUES ('547', '11007007', 'WDZB-BYJ塑铜线', '114', '11007', '电线电缆', '米', 'BYJ 2.5', '铜', '', '1', '管理员', '2019-12-10 08:29:46', '2019-12-10 08:31:44');
INSERT INTO `dtoa_material` VALUES ('548', '11007008', 'WDZB-BYJ塑铜线', '114', '11007', '电线电缆', '米', 'BYJ 4', '铜', '', '1', '管理员', '2019-12-10 08:30:50', null);
INSERT INTO `dtoa_material` VALUES ('549', '11007009', 'WDZB-YJE电缆', '114', '11007', '电线电缆', '米', '4*95+1*50', '铜', '', '1', '管理员', '2019-12-10 08:31:45', null);
INSERT INTO `dtoa_material` VALUES ('550', '11007010', 'WDZBN-BYJ塑铜线', '114', '11007', '电线电缆', '米', 'N-BYJ 2.5', '铜', '', '1', '管理员', '2019-12-10 08:36:29', null);
INSERT INTO `dtoa_material` VALUES ('551', '11007011', 'WDZB-YJE电缆', '114', '11007', '电线电缆', '米', '3*50+2*25', '铜', '', '1', '管理员', '2019-12-10 08:38:11', null);
INSERT INTO `dtoa_material` VALUES ('552', '11007012', 'WDZB-YJE电缆', '114', '11007', '电线电缆', '米', '5*4', '铜', '', '1', '管理员', '2019-12-10 08:38:57', null);
INSERT INTO `dtoa_material` VALUES ('553', '11007013', 'WDZB-YJE电缆', '114', '11007', '电线电缆', '米', '5*6', '铜', '', '1', '管理员', '2019-12-10 08:39:41', null);
INSERT INTO `dtoa_material` VALUES ('554', '11007014', 'WDZB-YJE电缆', '114', '11007', '电线电缆', '米', '5*16', '铜', '', '1', '管理员', '2019-12-10 08:40:06', null);
INSERT INTO `dtoa_material` VALUES ('555', '11007015', 'ZC-BV塑铜线', '114', '11007', '电线电缆', '米', 'ZC-BV 4', '铜', '', '1', '管理员', '2019-12-10 08:40:31', null);
INSERT INTO `dtoa_material` VALUES ('557', '11007017', 'WDZB-YJE电缆', '114', '11007', '电线电缆', '米', '3*10', '铜', '', '1', '管理员', '2019-12-10 08:42:41', '2019-12-10 08:43:27');
INSERT INTO `dtoa_material` VALUES ('558', '11007018', 'WDZB-YJE电缆', '114', '11007', '电线电缆', '米', '5*10', '铜', '', '1', '管理员', '2019-12-10 08:43:28', null);
INSERT INTO `dtoa_material` VALUES ('559', '11007019', 'WDZBN-YJE电缆', '114', '11007', '电线电缆', '米', 'N-5*16', '铜', '', '1', '管理员', '2019-12-10 08:44:15', null);
INSERT INTO `dtoa_material` VALUES ('560', '11007020', 'WDZB-YJE电缆', '114', '11007', '电线电缆', '米', '4*35+1*16', '铜', '', '1', '管理员', '2019-12-10 08:45:26', null);
INSERT INTO `dtoa_material` VALUES ('561', '11007021', 'WDZBN-YJE电缆', '114', '11007', '电线电缆', '米', 'N-5*10', '铜', '', '1', '管理员', '2019-12-10 08:46:14', null);
INSERT INTO `dtoa_material` VALUES ('562', '11007022', 'WDZBN-YJE电缆', '114', '11007', '电线电缆', '米', 'N-3*10', '铜', '', '1', '管理员', '2019-12-10 08:46:46', null);
INSERT INTO `dtoa_material` VALUES ('563', '11007023', 'ZR-BV塑铜线', '114', '11007', '电线电缆', '米', 'ZR-BV 2.5', '铜', '', '1', '管理员', '2019-12-10 08:47:31', null);
INSERT INTO `dtoa_material` VALUES ('564', '11007024', 'ZR-BV塑铜线', '114', '11007', '电线电缆', '米', 'ZR-BV 4', '铜', '', '1', '管理员', '2019-12-10 08:52:18', null);
INSERT INTO `dtoa_material` VALUES ('565', '11007025', 'ZR-BV塑铜线', '114', '11007', '电线电缆', '米', 'ZR-BV 6', '铜', '', '1', '管理员', '2019-12-10 08:53:01', null);
INSERT INTO `dtoa_material` VALUES ('566', '11007026', 'NH-BV塑铜线', '114', '11007', '电线电缆', '米', 'NH-BV 2.5', '铜', '', '1', '管理员', '2019-12-10 08:53:29', null);
INSERT INTO `dtoa_material` VALUES ('567', '11007027', 'ZR-YJV电缆', '114', '11007', '电线电缆', '米', 'ZR-4*95+1*50', '铜', '', '1', '管理员', '2019-12-10 08:54:17', null);
INSERT INTO `dtoa_material` VALUES ('568', '10405001', '抹灰砂浆', '103', '10405', '砂浆', '吨', 'M7.5', '', '', '1', '管理员', '2019-12-10 10:18:27', null);
INSERT INTO `dtoa_material` VALUES ('569', '10405002', '抹灰砂浆', '103', '10405', '砂浆', '吨', 'M5', '', '', '1', '管理员', '2019-12-10 10:19:23', null);
INSERT INTO `dtoa_material` VALUES ('570', '10405003', '抹灰砂浆', '103', '10405', '砂浆', '吨', 'M10', '', '', '1', '管理员', '2019-12-10 10:19:48', null);
INSERT INTO `dtoa_material` VALUES ('571', '10405004', '砌筑砂浆', '103', '10405', '砂浆', '吨', 'M5', '', '', '1', '管理员', '2019-12-10 10:20:13', null);
INSERT INTO `dtoa_material` VALUES ('572', '10405005', '砌筑砂浆', '103', '10405', '砂浆', '吨', 'M7.5', '', '', '1', '管理员', '2019-12-10 10:20:30', null);
INSERT INTO `dtoa_material` VALUES ('573', '10405006', '砌筑砂浆', '103', '10405', '砂浆', '吨', 'M10', '', '', '1', '管理员', '2019-12-10 10:20:49', null);
INSERT INTO `dtoa_material` VALUES ('574', '10405007', '瓷砖粘接砂浆', '103', '10405', '砂浆', '吨', '', '', '', '9', '董满仓', '2019-12-10 10:24:29', null);
INSERT INTO `dtoa_material` VALUES ('575', '11003012', 'AAch配电柜', '105', '11003', '电箱', '台', '800*2200*600', '金属', '全套', '1', '管理员', '2019-12-10 15:43:07', null);
INSERT INTO `dtoa_material` VALUES ('576', '11003013', 'AL-CH配电箱', '105', '11003', '电箱', '台', '600*550*160', '金属', '全套', '1', '管理员', '2019-12-10 15:45:39', null);
INSERT INTO `dtoa_material` VALUES ('577', '11003014', 'AC配电箱', '105', '11003', '电箱', '台', '500*300*160', '金属', '全套', '1', '管理员', '2019-12-10 15:50:25', null);
INSERT INTO `dtoa_material` VALUES ('578', '11003015', 'AP-CH1配电箱', '105', '11003', '电箱', '台', '600*800*200', '金属', '全套', '1', '管理员', '2019-12-10 15:51:19', null);
INSERT INTO `dtoa_material` VALUES ('579', '11003016', 'AP-CH2配电箱', '105', '11003', '电箱', '台', '800*1500*350', '金属', '全套', '1', '管理员', '2019-12-10 15:52:11', null);
INSERT INTO `dtoa_material` VALUES ('580', '11003017', 'AP-CH3配电箱', '105', '11003', '电箱', '台', '1100*550*200', '金属', '全套', '1', '管理员', '2019-12-10 15:53:05', null);
INSERT INTO `dtoa_material` VALUES ('581', '11003018', '金属配电箱', '105', '11003', '电箱', '台', '600*800*250', '金属', '', '1', '管理员', '2019-12-10 15:54:03', null);
INSERT INTO `dtoa_material` VALUES ('582', '11003019', '金属配电柜', '105', '11003', '电箱', '台', '600*1400*400', '金属', '', '1', '管理员', '2019-12-10 15:56:49', null);
INSERT INTO `dtoa_material` VALUES ('583', '11003020', 'AL配电箱', '105', '11003', '电箱', '台', '500*600*180', '金属', '', '1', '管理员', '2019-12-10 15:57:43', null);
INSERT INTO `dtoa_material` VALUES ('584', '11003021', 'AA金属配电柜', '105', '11003', '电箱', '台', '1000*2200*600', '金属', '', '1', '管理员', '2019-12-10 15:58:51', null);
INSERT INTO `dtoa_material` VALUES ('585', '1010102001', '焊管', '53', '1010102', '焊接钢管', '米', '100', '', '', '1', '管理员', '2019-12-11 10:03:31', null);
INSERT INTO `dtoa_material` VALUES ('586', '1010202001', 'H型钢', '57', '1010202', 'H型钢', '米', '200', '', '', '1', '管理员', '2019-12-11 15:18:10', null);
INSERT INTO `dtoa_material` VALUES ('587', '1010104001', '镀锌衬塑管', '104', '1010104', '镀锌衬塑管', '米', '65', '', '', '1', '管理员', '2019-12-11 16:28:05', null);
INSERT INTO `dtoa_material` VALUES ('588', '1010104002', '镀锌衬塑管', '104', '1010104', '镀锌衬塑管', '米', '50', '', '', '1', '管理员', '2019-12-11 16:28:42', null);
INSERT INTO `dtoa_material` VALUES ('589', '1010104003', '镀锌衬塑管', '104', '1010104', '镀锌衬塑管', '米', '40', '', '', '1', '管理员', '2019-12-11 16:28:58', null);
INSERT INTO `dtoa_material` VALUES ('590', '1010104004', '镀锌衬塑管', '104', '1010104', '镀锌衬塑管', '米', '32', '', '', '1', '管理员', '2019-12-11 16:29:14', null);
INSERT INTO `dtoa_material` VALUES ('591', '1010104005', '镀锌衬塑管', '104', '1010104', '镀锌衬塑管', '米', '25', '', '', '1', '管理员', '2019-12-11 16:29:33', null);
INSERT INTO `dtoa_material` VALUES ('592', '1010104006', '镀锌衬塑管', '104', '1010104', '镀锌衬塑管', '米', '20', '', '', '1', '管理员', '2019-12-11 16:29:44', null);
INSERT INTO `dtoa_material` VALUES ('593', '1010104007', '镀锌衬塑管', '104', '1010104', '镀锌衬塑管', '米', '15', '', '', '1', '管理员', '2019-12-11 16:29:55', null);
INSERT INTO `dtoa_material` VALUES ('594', '1010101003', '镀锌焊接钢管', '52', '1010101', '镀锌焊接钢管', '米', 'DN50', '', '', '1', '管理员', '2019-12-11 16:30:07', null);
INSERT INTO `dtoa_material` VALUES ('595', '1010101004', '镀锌焊接钢管', '52', '1010101', '镀锌焊接钢管', '米', 'DN40', '', '', '1', '管理员', '2019-12-11 16:30:47', null);
INSERT INTO `dtoa_material` VALUES ('596', '1010101005', '镀锌焊接钢管', '52', '1010101', '镀锌焊接钢管', '米', 'DN32', '', '', '1', '管理员', '2019-12-11 16:31:04', null);
INSERT INTO `dtoa_material` VALUES ('597', '1010101006', '镀锌焊接钢管', '52', '1010101', '镀锌焊接钢管', '米', 'DN15', '', '', '1', '管理员', '2019-12-11 16:31:22', null);
INSERT INTO `dtoa_material` VALUES ('598', '1010204001', '镀锌角钢', '135', '1010204', '角钢', '米', '40*4', '', '', '1', '管理员', '2019-12-11 16:32:15', null);
INSERT INTO `dtoa_material` VALUES ('599', '1010102002', '焊管', '53', '1010102', '焊接钢管', '米', '80', '', '', '1', '管理员', '2019-12-11 16:33:10', null);
INSERT INTO `dtoa_material` VALUES ('600', '1010102003', '焊管', '53', '1010102', '焊接钢管', '米', '65', '', '', '1', '管理员', '2019-12-11 16:33:39', null);
INSERT INTO `dtoa_material` VALUES ('601', '1010102004', '焊管', '53', '1010102', '焊接钢管', '米', '50', '', '', '1', '管理员', '2019-12-11 16:33:52', null);
INSERT INTO `dtoa_material` VALUES ('602', '1010102005', '焊管', '53', '1010102', '焊接钢管', '米', '40', '', '', '1', '管理员', '2019-12-11 16:34:02', null);
INSERT INTO `dtoa_material` VALUES ('603', '1010102006', '焊管', '53', '1010102', '焊接钢管', '米', '32', '', '', '1', '管理员', '2019-12-11 16:34:12', null);
INSERT INTO `dtoa_material` VALUES ('604', '1010102007', '焊管', '53', '1010102', '焊接钢管', '米', '25', '', '', '1', '管理员', '2019-12-11 16:34:21', null);
INSERT INTO `dtoa_material` VALUES ('605', '1010102008', '焊管', '53', '1010102', '焊接钢管', '米', '20', '', '', '1', '管理员', '2019-12-11 16:34:31', null);
INSERT INTO `dtoa_material` VALUES ('606', '1010102009', '焊管', '53', '1010102', '焊接钢管', '米', '15', '', '', '1', '管理员', '2019-12-11 16:34:45', null);
INSERT INTO `dtoa_material` VALUES ('607', '1010203001', '镀锌扁钢', '58', '1010203', '扁钢', '米', '40', '', '', '1', '管理员', '2019-12-11 16:34:55', null);
INSERT INTO `dtoa_material` VALUES ('608', '1010102010', '焊管', '53', '1010102', '焊接钢管', '米', '150', '', '', '1', '管理员', '2019-12-11 16:35:28', null);
INSERT INTO `dtoa_material` VALUES ('609', '1010301001', '加工铁板', '136', '1010301', '加工铁板', '块', '', '', '', '1', '管理员', '2019-12-11 16:36:14', null);
INSERT INTO `dtoa_material` VALUES ('610', '1010201001', '槽钢', '55', '1010201', '槽钢', '米', '10#', '', '', '1', '管理员', '2019-12-11 16:36:44', '2020-12-15 09:36:12');
INSERT INTO `dtoa_material` VALUES ('611', '1010401001', '三级螺纹', '95', '1010401', '螺纹', '吨', '14', '', '', '1', '管理员', '2019-12-11 16:37:20', null);
INSERT INTO `dtoa_material` VALUES ('612', '1010401002', '三级螺纹', '95', '1010401', '螺纹', '吨', '12', '', '', '1', '管理员', '2019-12-11 16:48:29', null);
INSERT INTO `dtoa_material` VALUES ('613', '11007028', 'YJV电缆', '114', '11007', '电线电缆', '米', '3*4mm²', '铜', '', '1', '管理员', '2019-12-11 16:48:41', null);
INSERT INTO `dtoa_material` VALUES ('614', '11007029', 'YJV电缆', '114', '11007', '电线电缆', '米', '5*16mm²', '铜', '', '1', '管理员', '2019-12-12 10:01:13', null);
INSERT INTO `dtoa_material` VALUES ('615', '11007030', 'YJV电缆', '114', '11007', '电线电缆', '米', '4*4mm²', '铜', '', '1', '管理员', '2019-12-12 10:08:40', null);
INSERT INTO `dtoa_material` VALUES ('616', '1010102011', '焊管', '53', '1010102', '焊接钢管', '米', '125', '', '', '1', '管理员', '2019-12-12 10:09:11', null);
INSERT INTO `dtoa_material` VALUES ('617', '1010105001', '镀锌方管', '137', '1010105', '方管', '米', '40*40', '', '', '1', '管理员', '2019-12-12 10:10:17', '2020-10-19 16:24:58');
INSERT INTO `dtoa_material` VALUES ('618', '1010103001', '无缝管', '54', '1010103', '无缝管', '米', '159', '', '', '1', '管理员', '2019-12-12 10:10:41', null);
INSERT INTO `dtoa_material` VALUES ('619', '1010204002', '角钢', '135', '1010204', '角钢', '米', '40*4', '', '', '1', '管理员', '2019-12-12 10:11:11', null);
INSERT INTO `dtoa_material` VALUES ('620', '1010204003', '镀锌角钢', '135', '1010204', '角钢', '米', '50*5', '', '', '1', '管理员', '2019-12-12 10:11:40', null);
INSERT INTO `dtoa_material` VALUES ('621', '211001', '无粉煤灰冬施混凝土', '138', '211', '无粉煤灰冬施混凝土', 'm³', 'C15', '', '', '1', '管理员', '2019-12-12 11:05:42', '2019-12-12 11:07:00');
INSERT INTO `dtoa_material` VALUES ('622', '211002', '无粉煤灰冬施混凝土', '138', '211', '无粉煤灰冬施混凝土', 'm³', 'C20', '', '', '1', '管理员', '2019-12-12 11:07:00', null);
INSERT INTO `dtoa_material` VALUES ('623', '211003', '无粉煤灰冬施混凝土', '138', '211', '无粉煤灰冬施混凝土', 'm³', 'C25', '', '', '1', '管理员', '2019-12-12 11:07:27', null);
INSERT INTO `dtoa_material` VALUES ('624', '211004', '无粉煤灰冬施混凝土', '138', '211', '无粉煤灰冬施混凝土', 'm³', 'C30', '', '', '1', '管理员', '2019-12-12 11:12:10', null);
INSERT INTO `dtoa_material` VALUES ('625', '212001', '冬施细石混凝土', '139', '212', '冬施细石混凝土', 'm³', 'C15', '', '', '1', '管理员', '2019-12-12 11:18:35', null);
INSERT INTO `dtoa_material` VALUES ('626', '212002', '冬施细石混凝土', '139', '212', '冬施细石混凝土', 'm³', 'C20', '', '', '1', '管理员', '2019-12-12 11:18:57', null);
INSERT INTO `dtoa_material` VALUES ('627', '212003', '冬施细石混凝土', '139', '212', '冬施细石混凝土', 'm³', 'C25', '', '', '1', '管理员', '2019-12-12 11:19:19', null);
INSERT INTO `dtoa_material` VALUES ('628', '212004', '冬施细石混凝土', '139', '212', '冬施细石混凝土', 'm³', 'C30', '', '', '1', '管理员', '2019-12-12 11:19:32', null);
INSERT INTO `dtoa_material` VALUES ('629', '50107001', '汽车混凝土泵', '140', '50107', '汽车泵', '班', '54米臂', '', '', '1', '管理员', '2019-12-12 13:50:54', null);
INSERT INTO `dtoa_material` VALUES ('630', '50101001', '挖掘机', '81', '50101', '挖掘机', '班', '60型', '', '', '1', '管理员', '2019-12-12 13:52:12', null);
INSERT INTO `dtoa_material` VALUES ('631', '50108001', '破碎机', '141', '50108', '破碎机', '班', '60型', '', '', '1', '管理员', '2019-12-12 13:55:11', null);
INSERT INTO `dtoa_material` VALUES ('632', '50101002', '挖掘机', '81', '50101', '挖掘机', '班', '210型', '', '', '1', '管理员', '2019-12-12 13:55:27', null);
INSERT INTO `dtoa_material` VALUES ('633', '50101003', '挖掘机', '81', '50101', '挖掘机', '班', '260型', '', '', '1', '管理员', '2019-12-12 13:55:45', null);
INSERT INTO `dtoa_material` VALUES ('634', '50101004', '挖掘机', '81', '50101', '挖掘机', '班', '300型', '', '', '1', '管理员', '2019-12-12 13:56:01', null);
INSERT INTO `dtoa_material` VALUES ('635', '50101005', '挖掘机', '81', '50101', '挖掘机', '班', '330型', '', '', '1', '管理员', '2019-12-12 13:56:16', null);
INSERT INTO `dtoa_material` VALUES ('636', '50108002', '破碎机', '141', '50108', '破碎机', '班', '260型', '', '', '1', '管理员', '2019-12-12 13:56:32', null);
INSERT INTO `dtoa_material` VALUES ('637', '50108003', '破碎机', '141', '50108', '破碎机', '班', '300型', '', '', '1', '管理员', '2019-12-12 13:56:52', null);
INSERT INTO `dtoa_material` VALUES ('638', '50104001', '农用车', '84', '50104', '运输车', '班', '前二轮后四轮', '', '', '1', '管理员', '2019-12-12 13:57:18', null);
INSERT INTO `dtoa_material` VALUES ('639', '50103001', '链轨推土机', '83', '50103', '推土机', '班', '160型', '', '', '1', '管理员', '2019-12-12 13:58:15', null);
INSERT INTO `dtoa_material` VALUES ('640', '50102001', '铲车（装载机）', '82', '50102', '铲车', '班', '50型', '', '', '1', '管理员', '2019-12-12 13:58:50', '2019-12-12 14:04:48');
INSERT INTO `dtoa_material` VALUES ('641', '50105001', '吊车', '85', '50105', '吊车', '班', '25吨四节臂', '', '', '1', '管理员', '2019-12-12 13:59:27', '2019-12-12 14:00:05');
INSERT INTO `dtoa_material` VALUES ('642', '50105002', '吊车', '85', '50105', '吊车', '班', '8吨', '', '', '1', '管理员', '2019-12-12 14:00:05', null);
INSERT INTO `dtoa_material` VALUES ('643', '50101006', '挖掘机', '81', '50101', '挖掘机', '班', '360型加长臂', '', '', '1', '管理员', '2019-12-12 14:00:27', null);
INSERT INTO `dtoa_material` VALUES ('644', '50104002', '十轮自卸车', '84', '50104', '运输车', '班', '前二轮后八轮', '', '', '1', '管理员', '2019-12-12 14:00:55', '2019-12-12 14:01:45');
INSERT INTO `dtoa_material` VALUES ('645', '50106001', '压路机', '86', '50106', '压路机', '班', '22吨震动', '', '', '1', '管理员', '2019-12-12 14:01:46', null);
INSERT INTO `dtoa_material` VALUES ('646', '50106002', '压路机', '86', '50106', '压路机', '班', '20吨震动', '', '', '1', '管理员', '2019-12-12 14:02:17', null);
INSERT INTO `dtoa_material` VALUES ('647', '50106003', '压路机', '86', '50106', '压路机', '班', '10吨震动', '', '', '1', '管理员', '2019-12-12 14:02:33', null);
INSERT INTO `dtoa_material` VALUES ('648', '50106004', '压路机', '86', '50106', '压路机', '班', '5吨震动', '', '', '1', '管理员', '2019-12-12 14:02:48', null);
INSERT INTO `dtoa_material` VALUES ('649', '50106005', '压路机', '86', '50106', '压路机', '班', '3吨震动', '', '', '1', '管理员', '2019-12-12 14:03:42', null);
INSERT INTO `dtoa_material` VALUES ('650', '50102002', '铲车（装载机）', '82', '50102', '铲车', '班', '30型', '', '', '1', '管理员', '2019-12-12 14:03:55', null);
INSERT INTO `dtoa_material` VALUES ('651', '50102003', '铲车（装载机）', '82', '50102', '铲车', '班', '20型', '', '', '1', '管理员', '2019-12-12 14:04:22', null);
INSERT INTO `dtoa_material` VALUES ('652', '50101007', '挖掘机', '81', '50101', '挖掘机', '班', '350型', '', '', '1', '管理员', '2019-12-12 14:04:49', null);
INSERT INTO `dtoa_material` VALUES ('653', '30202005', '渣土消纳', '47', '30202', '文明施工', '车', '十轮自卸车', '', '', '1', '管理员', '2019-12-12 14:05:56', null);
INSERT INTO `dtoa_material` VALUES ('654', '30201005', '消防架子', '46', '30201', '安全设备', '个', '双架', '', '', '1', '管理员', '2019-12-12 14:07:08', null);
INSERT INTO `dtoa_material` VALUES ('655', '30201006', '消防钩子', '46', '30201', '安全设备', '把', '', '', '', '1', '管理员', '2019-12-12 14:09:25', null);
INSERT INTO `dtoa_material` VALUES ('656', '30201007', '消防桶', '46', '30201', '安全设备', '个', '', '', '', '1', '管理员', '2019-12-12 14:09:46', null);
INSERT INTO `dtoa_material` VALUES ('657', '30201008', '灭火器箱子', '46', '30201', '安全设备', '个', '1*2瓶', '', '', '1', '管理员', '2019-12-12 14:10:15', null);
INSERT INTO `dtoa_material` VALUES ('658', '30201009', '消防水带', '46', '30201', '安全设备', '条', '65型', '', '', '1', '管理员', '2019-12-12 14:11:29', null);
INSERT INTO `dtoa_material` VALUES ('659', '30201010', '消防水带箱', '46', '30201', '安全设备', '个', '', '', '', '1', '管理员', '2019-12-12 14:12:16', null);
INSERT INTO `dtoa_material` VALUES ('660', '30201011', '消防枪头', '46', '30201', '安全设备', '个', '65型', '', '', '1', '管理员', '2019-12-12 14:12:46', null);
INSERT INTO `dtoa_material` VALUES ('661', '11114001', '坐便器', '142', '11114', '卫浴安装', '套', '650型', '', '', '1', '管理员', '2019-12-12 14:44:33', null);
INSERT INTO `dtoa_material` VALUES ('662', '11114002', '浴室柜', '142', '11114', '卫浴安装', '套', '600', '', '', '1', '管理员', '2019-12-12 14:45:27', null);
INSERT INTO `dtoa_material` VALUES ('663', '11114003', '脸盆龙头', '142', '11114', '卫浴安装', '个', 'M30', '', '', '1', '管理员', '2019-12-12 14:45:41', null);
INSERT INTO `dtoa_material` VALUES ('664', '11109029', '脸盆下水器', '122', '11109', '水暖辅材', '套', '', '', '', '1', '管理员', '2019-12-12 14:46:32', null);
INSERT INTO `dtoa_material` VALUES ('665', '11114004', '浴室角架', '142', '11114', '卫浴安装', '个', 'M10', '不锈钢', '', '1', '管理员', '2019-12-12 14:47:13', null);
INSERT INTO `dtoa_material` VALUES ('666', '11114005', '浴室毛巾杆', '142', '11114', '卫浴安装', '个', 'M11', '不锈钢', '', '1', '管理员', '2019-12-12 14:48:20', null);
INSERT INTO `dtoa_material` VALUES ('667', '10802005', '墙固胶', '117', '10802', '化工产品', '桶', '20KG', '', '', '9', '董满仓', '2019-12-12 14:52:16', null);
INSERT INTO `dtoa_material` VALUES ('668', '11008006', '浴霸', '115', '11008', '电气设备安装材料', '个', '300*600', '', '', '9', '董满仓', '2019-12-12 15:23:40', null);
INSERT INTO `dtoa_material` VALUES ('669', '11005008', 'LED筒灯', '112', '11005', '灯具', '个', '6W', '', '', '9', '董满仓', '2019-12-12 15:29:16', null);
INSERT INTO `dtoa_material` VALUES ('670', '11005009', '安全出口指示灯', '112', '11005', '灯具', '个', '3W', '', '', '9', '董满仓', '2019-12-12 15:51:10', null);
INSERT INTO `dtoa_material` VALUES ('671', '11005010', 'LED平板灯', '112', '11005', '灯具', '个', '600*600', '', '', '9', '董满仓', '2019-12-12 15:51:51', null);
INSERT INTO `dtoa_material` VALUES ('672', '11008007', '防水盒', '115', '11008', '电气设备安装材料', '个', '86系列', '塑料', '', '9', '董满仓', '2019-12-12 15:52:16', null);
INSERT INTO `dtoa_material` VALUES ('673', '11008008', '人体感应开关', '115', '11008', '电气设备安装材料', '个', '红外线', '', '', '9', '董满仓', '2019-12-12 15:52:57', null);
INSERT INTO `dtoa_material` VALUES ('674', '1010101007', '镀锌焊接钢管', '52', '1010101', '镀锌焊接钢管', '米', 'DN65', '', '', '1', '管理员', '2019-12-13 10:07:36', null);
INSERT INTO `dtoa_material` VALUES ('675', '1010101008', '镀锌焊接钢管', '52', '1010101', '镀锌焊接钢管', '米', 'DN80', '', '', '1', '管理员', '2019-12-13 10:08:35', null);
INSERT INTO `dtoa_material` VALUES ('676', '1010101009', '镀锌焊接钢管', '52', '1010101', '镀锌焊接钢管', '米', 'DN100', '', '', '1', '管理员', '2019-12-13 10:09:04', null);
INSERT INTO `dtoa_material` VALUES ('677', '1010101010', '镀锌焊接钢管', '52', '1010101', '镀锌焊接钢管', '米', 'DN125', '', '', '1', '管理员', '2019-12-13 10:09:37', null);
INSERT INTO `dtoa_material` VALUES ('678', '1010101011', '镀锌焊接钢管', '52', '1010101', '镀锌焊接钢管', '米', 'DN150', '', '', '1', '管理员', '2019-12-13 10:09:58', null);
INSERT INTO `dtoa_material` VALUES ('679', '1010401003', '三级螺纹', '95', '1010401', '螺纹', '吨', '16', '', '', '1', '管理员', '2019-12-13 10:10:19', null);
INSERT INTO `dtoa_material` VALUES ('680', '1010401004', '三级螺纹', '95', '1010401', '螺纹', '吨', '18', '', '', '1', '管理员', '2019-12-13 10:12:00', null);
INSERT INTO `dtoa_material` VALUES ('681', '1010401005', '三级螺纹', '95', '1010401', '螺纹', '吨', '20', '', '', '1', '管理员', '2019-12-13 10:12:18', null);
INSERT INTO `dtoa_material` VALUES ('682', '1010401006', '三级螺纹', '95', '1010401', '螺纹', '吨', '22', '', '', '1', '管理员', '2019-12-13 10:12:30', null);
INSERT INTO `dtoa_material` VALUES ('683', '1010401007', '三级螺纹', '95', '1010401', '螺纹', '吨', '25', '', '', '1', '管理员', '2019-12-13 10:12:41', null);
INSERT INTO `dtoa_material` VALUES ('684', '1010401008', '三级螺纹（盘螺）', '95', '1010401', '螺纹', '吨', '10', '', '', '1', '管理员', '2019-12-13 10:12:52', null);
INSERT INTO `dtoa_material` VALUES ('685', '1010401009', '三级螺纹（盘螺）', '95', '1010401', '螺纹', '吨', '8', '', '', '1', '管理员', '2019-12-13 10:13:21', null);
INSERT INTO `dtoa_material` VALUES ('686', '1010403001', '镀锌圆钢', '143', '1010403', '圆钢', '米', 'Φ12', '', '', '1', '管理员', '2019-12-13 14:41:21', '2021-08-05 15:29:16');
INSERT INTO `dtoa_material` VALUES ('687', '11002011', '热缩管', '91', '11002', '电气辅材', '米', '95', '', '', '9', '董满仓', '2019-12-16 08:45:00', null);
INSERT INTO `dtoa_material` VALUES ('688', '11002012', '热缩管', '91', '11002', '电气辅材', '米', '120', '', '', '9', '董满仓', '2019-12-16 08:48:08', null);
INSERT INTO `dtoa_material` VALUES ('689', '11002013', '热缩管', '91', '11002', '电气辅材', '米', '240', '', '', '9', '董满仓', '2019-12-16 08:49:30', null);
INSERT INTO `dtoa_material` VALUES ('690', '11002014', 'T接电缆卡子', '91', '11002', '电气辅材', '个', '185*95', '', '', '9', '董满仓', '2019-12-16 08:49:50', null);
INSERT INTO `dtoa_material` VALUES ('691', '11002015', 'T接电缆卡子', '91', '11002', '电气辅材', '个', '95*50', '', '', '9', '董满仓', '2019-12-16 08:51:22', null);
INSERT INTO `dtoa_material` VALUES ('692', '11002016', 'TD长筒铜鼻子', '91', '11002', '电气辅材', '个', '240mm²', '金属铜', '', '9', '董满仓', '2019-12-16 08:51:41', null);
INSERT INTO `dtoa_material` VALUES ('693', '11002017', 'TD长筒铜鼻子', '91', '11002', '电气辅材', '个', '120mm²', '金属铜', '', '9', '董满仓', '2019-12-16 08:53:00', null);
INSERT INTO `dtoa_material` VALUES ('694', '11002018', 'TD长筒铜鼻子', '91', '11002', '电气辅材', '个', '50mm²', '金属铜', '', '9', '董满仓', '2019-12-16 08:53:41', null);
INSERT INTO `dtoa_material` VALUES ('695', '11002019', 'TD长筒铜鼻子', '91', '11002', '电气辅材', '个', '35mm²', '金属铜', '', '9', '董满仓', '2019-12-16 08:54:10', null);
INSERT INTO `dtoa_material` VALUES ('696', '10701031', '镀锌螺栓', '90', '10701', '五金材料', '套', '10*25', '金属', '扭力8.8', '9', '董满仓', '2019-12-16 08:54:35', null);
INSERT INTO `dtoa_material` VALUES ('697', '11002020', 'TD长筒铜鼻子', '91', '11002', '电气辅材', '个', '70mm²', '金属铜', '', '9', '董满仓', '2019-12-16 08:55:54', null);
INSERT INTO `dtoa_material` VALUES ('698', '11002021', '电缆五指套', '91', '11002', '电气辅材', '个', '4*185+1*95', '', '', '9', '董满仓', '2019-12-16 08:56:24', null);
INSERT INTO `dtoa_material` VALUES ('699', '11002022', '电缆五指套', '91', '11002', '电气辅材', '个', '4*95+1*50', '', '', '9', '董满仓', '2019-12-16 08:56:55', null);
INSERT INTO `dtoa_material` VALUES ('700', '11002023', '电缆五指套', '91', '11002', '电气辅材', '个', '4*50+1*25', '', '', '9', '董满仓', '2019-12-16 08:57:24', null);
INSERT INTO `dtoa_material` VALUES ('701', '11002024', '连接编织线', '91', '11002', '电气辅材', '根', '', '', '', '9', '董满仓', '2019-12-16 08:57:53', null);
INSERT INTO `dtoa_material` VALUES ('702', '10701032', '挂网铝片钉', '90', '10701', '五金材料', '箱', '', '', '', '9', '董满仓', '2019-12-16 08:59:26', null);
INSERT INTO `dtoa_material` VALUES ('703', '10802006', '保温钉专用胶', '117', '10802', '化工产品', '桶', '', '', '', '9', '董满仓', '2019-12-16 09:20:52', null);
INSERT INTO `dtoa_material` VALUES ('704', '10701033', '膨胀螺栓', '90', '10701', '五金材料', '个', '8*60', '金属', '', '9', '董满仓', '2019-12-16 09:21:19', null);
INSERT INTO `dtoa_material` VALUES ('705', '10701034', '平机螺丝', '90', '10701', '五金材料', '个', '4*20', '金属', '', '9', '董满仓', '2019-12-16 09:22:09', null);
INSERT INTO `dtoa_material` VALUES ('706', '11002025', '塑料护口', '91', '11002', '电气辅材', '个', '25', '', '', '9', '董满仓', '2019-12-16 09:24:08', null);
INSERT INTO `dtoa_material` VALUES ('707', '11002026', '包塑软管锁头', '91', '11002', '电气辅材', '个', '20', '', '', '9', '董满仓', '2019-12-16 09:24:49', null);
INSERT INTO `dtoa_material` VALUES ('708', '11001014', '铁方盖板', '59', '11001', '管线敷设', '个', '', '', '', '9', '董满仓', '2019-12-16 09:25:31', null);
INSERT INTO `dtoa_material` VALUES ('709', '11001015', '包塑软管', '59', '11001', '管线敷设', '米', 'Φ25', '金属包塑', '', '9', '董满仓', '2019-12-16 09:26:17', null);
INSERT INTO `dtoa_material` VALUES ('710', '11004003', '防火线槽桥架', '110', '11004', '线槽桥架', '米', '200*100', '', '', '9', '董满仓', '2019-12-16 11:08:29', null);
INSERT INTO `dtoa_material` VALUES ('711', '11008009', '轴流风机', '115', '11008', '电气设备安装材料', '台', '直径150*75W', '', '', '9', '董满仓', '2019-12-16 11:11:22', null);
INSERT INTO `dtoa_material` VALUES ('712', '10503002', '勾缝剂', '134', '10503', '小型材料', '袋', '20KG', '', '', '9', '董满仓', '2019-12-16 11:12:16', null);
INSERT INTO `dtoa_material` VALUES ('713', '11008010', '五孔面板', '115', '11008', '电气设备安装材料', '个', '10A', '', '', '9', '董满仓', '2019-12-16 11:13:42', null);
INSERT INTO `dtoa_material` VALUES ('714', '11008011', '三孔面板', '115', '11008', '电气设备安装材料', '个', '16A', '', '', '9', '董满仓', '2019-12-16 11:14:14', null);
INSERT INTO `dtoa_material` VALUES ('715', '11008012', '三联开关', '115', '11008', '电气设备安装材料', '个', '10A', '', '', '9', '董满仓', '2019-12-16 11:14:48', null);
INSERT INTO `dtoa_material` VALUES ('716', '10503003', '玻纤网格布', '134', '10503', '小型材料', '捆', '1米*50米', '', '', '9', '董满仓', '2019-12-16 11:15:15', null);
INSERT INTO `dtoa_material` VALUES ('717', '10902012', '保温管包扎带', '128', '10902', '保温材料', 'KG', '20CM', '白塑料布', '', '9', '董满仓', '2019-12-16 15:09:40', null);
INSERT INTO `dtoa_material` VALUES ('718', '404001', '不锈钢扶手', '144', '404', '扶手栏杆', '米', '950mm高', '201', '', '1', '管理员', '2019-12-17 13:48:18', null);
INSERT INTO `dtoa_material` VALUES ('719', '11106003', '污水泵（工程）', '108', '11106', '水暖设备（消耗）', '台', '380V1.5KW', '', '', '9', '董满仓', '2019-12-19 10:04:23', null);
INSERT INTO `dtoa_material` VALUES ('720', '11114006', '花洒喷头', '142', '11114', '卫浴安装', '个', '', '', '', '1', '管理员', '2019-12-19 10:07:30', null);
INSERT INTO `dtoa_material` VALUES ('721', '11109030', '喉箍', '122', '11109', '水暖辅材', '个', '40', '金属', '', '1', '管理员', '2019-12-19 10:10:05', null);
INSERT INTO `dtoa_material` VALUES ('722', '1010301002', '预埋铁板', '136', '1010301', '加工铁板', '块', '150*150*10', '', '', '1', '管理员', '2019-12-19 14:57:00', null);
INSERT INTO `dtoa_material` VALUES ('723', '10701035', '橡胶止水垫', '90', '10701', '五金材料', '个', '40*40', '橡胶', '止水螺栓上用', '1', '管理员', '2019-12-19 15:01:23', null);
INSERT INTO `dtoa_material` VALUES ('724', '10701036', '轴承', '90', '10701', '五金材料', '个', '6201', '', '', '1', '管理员', '2019-12-19 15:02:27', null);
INSERT INTO `dtoa_material` VALUES ('725', '11001016', '防爆挠性连接管', '59', '11001', '管线敷设', '米', 'DN40*500', '', '', '1', '管理员', '2019-12-19 15:02:48', '2019-12-19 15:28:36');
INSERT INTO `dtoa_material` VALUES ('726', '11001017', '防爆接线盒', '59', '11001', '管线敷设', '个', '200*200', '铸铁', '', '1', '管理员', '2019-12-19 15:28:36', null);
INSERT INTO `dtoa_material` VALUES ('727', '502001', '租赁独立卫生间', '76', '502', '设备租赁', '月', '单坑', '', '', '1', '管理员', '2019-12-19 15:29:08', null);
INSERT INTO `dtoa_material` VALUES ('728', '11101031', '镀锌对丝', '92', '11101', '镀锌管件', '个', 'DN40', '热镀锌', '', '1', '管理员', '2019-12-23 09:36:47', null);
INSERT INTO `dtoa_material` VALUES ('729', '11107040', 'A型铸铁排水管', '109', '11107', '球墨管材管件', '根', 'DN100*1.5', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:37:44', '2022-04-18 09:43:24');
INSERT INTO `dtoa_material` VALUES ('730', '11107041', 'A型铸铁排水管', '109', '11107', '球墨管材管件', '根', 'DN100*1', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:41:28', '2022-04-18 09:43:42');
INSERT INTO `dtoa_material` VALUES ('731', '11107042', 'A型铸铁排水管', '109', '11107', '球墨管材管件', '根', 'DN100*0.5', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:42:08', '2022-04-18 09:43:53');
INSERT INTO `dtoa_material` VALUES ('732', '11107043', 'A型铸铁排水管', '109', '11107', '球墨管材管件', '根', 'DN50*1.5', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:43:03', '2022-04-18 09:44:05');
INSERT INTO `dtoa_material` VALUES ('733', '11107044', 'A型铸铁排水管', '109', '11107', '球墨管材管件', '根', 'DN50*1', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:43:37', '2022-04-18 09:44:16');
INSERT INTO `dtoa_material` VALUES ('734', '11107045', 'A型铸铁排水管', '109', '11107', '球墨管材管件', '根', 'DN50*0.5', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:44:03', '2022-04-18 09:44:25');
INSERT INTO `dtoa_material` VALUES ('735', '11107046', 'A型铸铁TY三通', '109', '11107', '球墨管材管件', '个', 'DN100', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:44:28', null);
INSERT INTO `dtoa_material` VALUES ('736', '11107047', 'A型铸铁TY三通', '109', '11107', '球墨管材管件', '个', 'DN100*50', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:45:24', null);
INSERT INTO `dtoa_material` VALUES ('737', '11107048', 'A型铸铁Y三通', '109', '11107', '球墨管材管件', '个', 'DN100', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:45:57', null);
INSERT INTO `dtoa_material` VALUES ('738', '11107049', 'A型铸铁Y三通', '109', '11107', '球墨管材管件', '个', 'DN100*50', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:46:33', null);
INSERT INTO `dtoa_material` VALUES ('739', '11107050', 'A型铸铁Y三通', '109', '11107', '球墨管材管件', '个', 'DN50', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:47:02', null);
INSERT INTO `dtoa_material` VALUES ('740', '11107051', 'A型铸铁P型反水弯', '109', '11107', '球墨管材管件', '个', 'DN100', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:47:28', null);
INSERT INTO `dtoa_material` VALUES ('741', '11107052', 'A型铸铁弯头', '109', '11107', '球墨管材管件', '个', 'DN100*90°', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:48:15', null);
INSERT INTO `dtoa_material` VALUES ('742', '11107053', 'A型铸铁弯头', '109', '11107', '球墨管材管件', '个', 'DN100*45°', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:48:54', null);
INSERT INTO `dtoa_material` VALUES ('743', '11107054', 'A型铸铁弯头', '109', '11107', '球墨管材管件', '个', 'DN50*90°', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:49:27', null);
INSERT INTO `dtoa_material` VALUES ('744', '11107055', 'A型铸铁弯头', '109', '11107', '球墨管材管件', '个', 'DN50*45°', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:49:56', null);
INSERT INTO `dtoa_material` VALUES ('745', '11107056', 'A型铸铁铜盖地平清扫口', '109', '11107', '球墨管材管件', '个', 'DN100', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:50:19', null);
INSERT INTO `dtoa_material` VALUES ('746', '11107057', 'A型铸铁深水封地漏', '109', '11107', '球墨管材管件', '个', 'DN50', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:51:18', null);
INSERT INTO `dtoa_material` VALUES ('747', '11107058', 'A型铸铁压盖', '109', '11107', '球墨管材管件', '个', 'DN100', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:51:59', null);
INSERT INTO `dtoa_material` VALUES ('748', '11107059', 'A型铸铁压盖', '109', '11107', '球墨管材管件', '个', 'DN50', '球墨铸铁', '', '1', '管理员', '2019-12-23 09:52:33', null);
INSERT INTO `dtoa_material` VALUES ('749', '10701037', '螺栓', '90', '10701', '五金材料', '套', 'M12*60', '', '', '1', '管理员', '2019-12-23 09:53:09', null);
INSERT INTO `dtoa_material` VALUES ('750', '10701038', '螺栓', '90', '10701', '五金材料', '套', 'M10*60', '', '', '1', '管理员', '2019-12-23 09:54:45', null);
INSERT INTO `dtoa_material` VALUES ('751', '11101032', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN50*40', '热镀锌', '', '1', '管理员', '2019-12-23 10:39:29', null);
INSERT INTO `dtoa_material` VALUES ('752', '11101033', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN40*32', '热镀锌', '', '1', '管理员', '2019-12-23 10:40:35', null);
INSERT INTO `dtoa_material` VALUES ('753', '11101034', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN20', '热镀锌', '', '1', '管理员', '2019-12-23 10:41:06', null);
INSERT INTO `dtoa_material` VALUES ('754', '11102040', '铸钢涡轮蝶阀', '93', '11102', '控水主材', '个', 'DN65', '铸钢', '', '1', '管理员', '2019-12-23 10:41:45', '2019-12-23 11:03:34');
INSERT INTO `dtoa_material` VALUES ('755', '11102041', '铸钢过滤器', '93', '11102', '控水主材', '个', 'DN65', '铸钢', '', '1', '管理员', '2019-12-23 10:45:41', null);
INSERT INTO `dtoa_material` VALUES ('756', '11102042', '铸铁涡轮蝶阀', '93', '11102', '控水主材', '个', 'DN65', '铸铁', '', '1', '管理员', '2019-12-23 10:51:09', null);
INSERT INTO `dtoa_material` VALUES ('757', '11102043', '铸铁过滤器', '93', '11102', '控水主材', '个', 'DN65', '铸铁', '', '1', '管理员', '2019-12-23 11:02:38', null);
INSERT INTO `dtoa_material` VALUES ('758', '11101035', '镀锌弯头', '92', '11101', '镀锌管件', '个', 'DN65*90°', '热镀锌', '', '1', '管理员', '2019-12-23 11:03:35', '2019-12-23 14:04:47');
INSERT INTO `dtoa_material` VALUES ('759', '11101036', '镀锌弯头', '92', '11101', '镀锌管件', '个', 'DN50*90°', '热镀锌', '', '1', '管理员', '2019-12-23 14:04:01', null);
INSERT INTO `dtoa_material` VALUES ('760', '11101037', '镀锌弯头', '92', '11101', '镀锌管件', '个', 'DN40*90°', '热镀锌', '', '1', '管理员', '2019-12-23 14:04:48', null);
INSERT INTO `dtoa_material` VALUES ('761', '11101038', '镀锌弯头', '92', '11101', '镀锌管件', '个', 'DN32*20', '热镀锌', '', '1', '管理员', '2019-12-23 14:05:16', null);
INSERT INTO `dtoa_material` VALUES ('762', '11101039', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN65*20', '热镀锌', '', '1', '管理员', '2019-12-23 14:05:46', null);
INSERT INTO `dtoa_material` VALUES ('763', '11101040', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN50*20', '热镀锌', '', '1', '管理员', '2019-12-23 14:07:10', null);
INSERT INTO `dtoa_material` VALUES ('764', '11101041', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN40*20', '热镀锌', '', '1', '管理员', '2019-12-23 14:07:35', null);
INSERT INTO `dtoa_material` VALUES ('765', '11101042', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN32*20', '热镀锌', '', '1', '管理员', '2019-12-23 14:08:01', null);
INSERT INTO `dtoa_material` VALUES ('766', '11101043', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN65', '热镀锌', '', '1', '管理员', '2019-12-23 14:08:29', null);
INSERT INTO `dtoa_material` VALUES ('767', '11101044', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN50', '热镀锌', '', '1', '管理员', '2019-12-23 14:09:34', null);
INSERT INTO `dtoa_material` VALUES ('768', '11101045', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN65*50', '热镀锌', '', '1', '管理员', '2019-12-23 14:09:58', null);
INSERT INTO `dtoa_material` VALUES ('769', '11101046', '镀锌弯头', '92', '11101', '镀锌管件', '个', 'DN65*50', '热镀锌', '', '1', '管理员', '2019-12-23 14:11:05', null);
INSERT INTO `dtoa_material` VALUES ('770', '10701039', '双头螺栓', '90', '10701', '五金材料', '套', 'M14*140', '', '', '1', '管理员', '2019-12-23 14:11:53', null);
INSERT INTO `dtoa_material` VALUES ('771', '30101001', '修防爆风机', '145', '30101', '设备维修', '台', '', '', '', '1', '管理员', '2019-12-23 14:15:48', null);
INSERT INTO `dtoa_material` VALUES ('772', '10701040', '膨胀螺栓', '90', '10701', '五金材料', '个', '16*200', '金属', '', '1', '管理员', '2019-12-23 14:16:08', null);
INSERT INTO `dtoa_material` VALUES ('773', '11109031', '膨胀式单管卡子', '122', '11109', '水暖辅材', '个', 'DN20', '铁镀锌', '', '1', '管理员', '2019-12-23 14:17:08', null);
INSERT INTO `dtoa_material` VALUES ('774', '11109032', '膨胀式双管卡子', '122', '11109', '水暖辅材', '个', 'DN20', '铁镀锌', '', '1', '管理员', '2019-12-23 14:18:55', null);
INSERT INTO `dtoa_material` VALUES ('775', '11113005', ' 铸铁暖气片对丝', '132', '11113', '散热器', '个', '', '', '', '1', '管理员', '2019-12-23 14:19:30', null);
INSERT INTO `dtoa_material` VALUES ('776', '11102044', '波纹补偿器', '93', '11102', '控水主材', '个', 'DN65', '', '', '1', '管理员', '2019-12-23 14:21:22', null);
INSERT INTO `dtoa_material` VALUES ('777', '11102045', '波纹补偿器', '93', '11102', '控水主材', '个', 'DN50', '', '', '1', '管理员', '2019-12-23 14:22:30', null);
INSERT INTO `dtoa_material` VALUES ('778', '11102046', '波纹补偿器', '93', '11102', '控水主材', '个', 'DN40', '', '', '1', '管理员', '2019-12-23 14:22:48', null);
INSERT INTO `dtoa_material` VALUES ('779', '11102047', '丝扣法兰盘', '93', '11102', '控水主材', '个', 'DN40', '', '', '1', '管理员', '2019-12-23 14:23:08', null);
INSERT INTO `dtoa_material` VALUES ('780', '10701041', '镀锌铁丝', '90', '10701', '五金材料', 'KG', '14#', '铁', '', '1', '管理员', '2019-12-23 14:24:29', null);
INSERT INTO `dtoa_material` VALUES ('781', '11113006', '正扣炉堵', '132', '11113', '散热器', '个', 'DN20', '铸铁', '', '1', '管理员', '2019-12-23 14:28:33', null);
INSERT INTO `dtoa_material` VALUES ('782', '11113007', '铸铁暖气反扣补芯', '132', '11113', '散热器', '个', '', '', '', '1', '管理员', '2019-12-23 14:32:28', null);
INSERT INTO `dtoa_material` VALUES ('783', '10801007', '银粉漆', '116', '10801', '油漆水漆', '桶', '18KG', '', '', '1', '管理员', '2019-12-24 09:08:30', null);
INSERT INTO `dtoa_material` VALUES ('784', '11113008', '暖气托钩', '132', '11113', '散热器', '个', '', '', '', '1', '管理员', '2019-12-24 09:09:21', null);
INSERT INTO `dtoa_material` VALUES ('785', '103003', '白水泥', '4', '103', '水泥', 'KG', '42.5', '', '', '1', '管理员', '2019-12-24 09:09:51', null);
INSERT INTO `dtoa_material` VALUES ('786', '112010', '喷壶', '41', '112', '低值易耗品', '个', '15升', '', '', '1', '管理员', '2019-12-24 09:10:15', null);
INSERT INTO `dtoa_material` VALUES ('787', '112011', '小喷壶', '41', '112', '低值易耗品', '个', '2升', '', '', '1', '管理员', '2019-12-24 09:12:11', null);
INSERT INTO `dtoa_material` VALUES ('788', '11113009', '铸铁暖气正扣补芯', '132', '11113', '散热器', '个', '', '', '', '1', '管理员', '2019-12-24 09:37:02', null);
INSERT INTO `dtoa_material` VALUES ('789', '11109033', '线麻', '122', '11109', '水暖辅材', 'KG', '', '', '', '1', '管理员', '2019-12-24 09:37:52', null);
INSERT INTO `dtoa_material` VALUES ('790', '11109034', '白厚漆', '122', '11109', '水暖辅材', '桶', '5KG', '', '', '1', '管理员', '2019-12-24 09:45:56', null);
INSERT INTO `dtoa_material` VALUES ('791', '10701042', '膨胀螺栓', '90', '10701', '五金材料', '个', 'M12*110', '金属', '', '1', '管理员', '2019-12-24 09:46:42', null);
INSERT INTO `dtoa_material` VALUES ('792', '11106004', '污水泵（工程）', '108', '11106', '水暖设备（消耗）', '台', '380V2.2KW', '', '', '1', '管理员', '2019-12-24 09:52:05', null);
INSERT INTO `dtoa_material` VALUES ('793', '11109035', '喉箍', '122', '11109', '水暖辅材', '个', '50', '', '', '1', '管理员', '2019-12-24 10:46:04', null);
INSERT INTO `dtoa_material` VALUES ('794', '11001018', '波纹管', '59', '11001', '管线敷设', '米', 'Φ20', '塑料', '', '1', '管理员', '2019-12-24 10:47:38', null);
INSERT INTO `dtoa_material` VALUES ('795', '11005011', '带应急安全出口', '112', '11005', '灯具', '套', '', '', '', '1', '管理员', '2019-12-24 10:59:44', null);
INSERT INTO `dtoa_material` VALUES ('796', '11107060', 'A型铸铁管胶圈', '109', '11107', '球墨管材管件', '个', 'DN150', '', '', '1', '管理员', '2019-12-25 16:08:52', null);
INSERT INTO `dtoa_material` VALUES ('797', '11107061', 'A型铸铁管胶圈', '109', '11107', '球墨管材管件', '个', 'DN100', '', '', '1', '管理员', '2019-12-25 16:10:02', null);
INSERT INTO `dtoa_material` VALUES ('798', '11107062', 'A型铸铁管胶圈', '109', '11107', '球墨管材管件', '个', 'DN75', '', '', '1', '管理员', '2019-12-25 16:10:21', null);
INSERT INTO `dtoa_material` VALUES ('799', '11107063', 'A型铸铁管胶圈', '109', '11107', '球墨管材管件', '个', 'DN50', '', '', '1', '管理员', '2019-12-25 16:10:49', null);
INSERT INTO `dtoa_material` VALUES ('800', '1010301003', '预埋铁板加工', '136', '1010301', '加工铁板', '块', '300*300*15mm', '', '', '1', '管理员', '2019-12-25 16:11:10', null);
INSERT INTO `dtoa_material` VALUES ('801', '1010301004', '黑止水钢板', '136', '1010301', '加工铁板', '米', '300mm*3mm', '', '', '1', '管理员', '2019-12-25 16:15:06', '2019-12-25 16:17:58');
INSERT INTO `dtoa_material` VALUES ('802', '1010301005', '镀锌止水钢板', '136', '1010301', '加工铁板', '米', '300mm*3mm', '', '', '1', '管理员', '2019-12-25 16:17:29', '2019-12-25 16:18:05');
INSERT INTO `dtoa_material` VALUES ('803', '10705002', '地脚螺栓', '121', '10705', '金属构件', '根', 'M24*770MM', '', '', '1', '管理员', '2019-12-25 16:18:06', null);
INSERT INTO `dtoa_material` VALUES ('804', '10701043', '螺母', '90', '10701', '五金材料', '个', 'M24', '', '', '1', '管理员', '2019-12-25 16:18:53', null);
INSERT INTO `dtoa_material` VALUES ('805', '10503004', '防冻剂', '134', '10503', '小型材料', '袋', '50KG', '', '', '1', '管理员', '2019-12-25 16:23:11', null);
INSERT INTO `dtoa_material` VALUES ('806', '11007031', 'RVV护套线', '114', '11007', '电线电缆', '米', 'RVV4*2.5', '铜', '', '1', '管理员', '2019-12-25 16:27:24', null);
INSERT INTO `dtoa_material` VALUES ('807', '10701044', '圆钢钉', '90', '10701', '五金材料', 'KG', '50', '', '', '1', '管理员', '2019-12-25 16:29:11', null);
INSERT INTO `dtoa_material` VALUES ('808', '10701045', '圆钢钉', '90', '10701', '五金材料', 'KG', '70', '', '', '1', '管理员', '2019-12-25 16:30:02', null);
INSERT INTO `dtoa_material` VALUES ('809', '11102048', '铜闸阀', '93', '11102', '控水主材', '个', 'DN32', '', '', '1', '管理员', '2019-12-25 16:30:18', null);
INSERT INTO `dtoa_material` VALUES ('810', '11102049', '铜截止阀', '93', '11102', '控水主材', '个', 'DN20', '', '', '1', '管理员', '2019-12-25 16:31:32', null);
INSERT INTO `dtoa_material` VALUES ('811', '11101047', '镀锌油任活接', '92', '11101', '镀锌管件', '个', 'DN32', '热镀锌', '', '1', '管理员', '2019-12-25 16:32:07', '2021-01-11 10:02:11');
INSERT INTO `dtoa_material` VALUES ('812', '11101048', '镀锌对丝', '92', '11101', '镀锌管件', '个', 'DN32', '热镀锌', '', '1', '管理员', '2019-12-25 16:36:00', null);
INSERT INTO `dtoa_material` VALUES ('813', '11101049', '镀锌弯头', '92', '11101', '镀锌管件', '个', 'DN32*90°', '热镀锌', '', '1', '管理员', '2019-12-25 16:36:40', null);
INSERT INTO `dtoa_material` VALUES ('815', '11101050', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN32', '热镀锌', '', '1', '管理员', '2019-12-25 16:37:16', null);
INSERT INTO `dtoa_material` VALUES ('816', '11005012', '双管日光灯', '112', '11005', '灯具', '套', '40W*2', '', '', '1', '管理员', '2019-12-25 16:37:48', null);
INSERT INTO `dtoa_material` VALUES ('817', '11002027', '日光灯吊盒', '91', '11002', '电气辅材', '个', '', '', '', '1', '管理员', '2019-12-25 16:38:42', null);
INSERT INTO `dtoa_material` VALUES ('818', '11008013', '换气扇', '115', '11008', '电气设备安装材料', '台', '30B', '', '', '1', '管理员', '2019-12-26 10:11:03', null);
INSERT INTO `dtoa_material` VALUES ('819', '10701046', '钢丝', '90', '10701', '五金材料', 'KG', '16#', '', '', '1', '管理员', '2019-12-26 10:11:56', null);
INSERT INTO `dtoa_material` VALUES ('820', '11109036', '单管卡子', '122', '11109', '水暖辅材', '个', 'DN200', '', '', '1', '管理员', '2019-12-26 10:12:28', null);
INSERT INTO `dtoa_material` VALUES ('821', '10701047', '钢锯条', '90', '10701', '五金材料', '盒', '400mm', '', '', '1', '管理员', '2019-12-26 10:13:21', null);
INSERT INTO `dtoa_material` VALUES ('822', '1010301006', '预埋铁板', '136', '1010301', '加工铁板', '块', '200*200*10mm', '', '', '1', '管理员', '2019-12-26 10:13:53', null);
INSERT INTO `dtoa_material` VALUES ('823', '11109037', '玻璃丝布', '122', '11109', '水暖辅材', '卷', '', '', '', '1', '管理员', '2019-12-26 10:15:57', null);
INSERT INTO `dtoa_material` VALUES ('824', '10701048', '插销', '90', '10701', '五金材料', '个', '100', '金属', '', '1', '管理员', '2019-12-26 15:56:25', null);
INSERT INTO `dtoa_material` VALUES ('825', '10701049', '火烧丝', '90', '10701', '五金材料', '捆', '22#400mm', '', '', '1', '管理员', '2019-12-27 09:14:57', null);
INSERT INTO `dtoa_material` VALUES ('826', '113001', '施工日志', '88', '113', '办公用品', '本', '', '', '', '1', '管理员', '2019-12-27 10:41:48', null);
INSERT INTO `dtoa_material` VALUES ('827', '113002', '碳素笔', '88', '113', '办公用品', '支', '', '', '', '1', '管理员', '2019-12-27 10:42:10', null);
INSERT INTO `dtoa_material` VALUES ('828', '113003', 'A4双夹文件夹', '88', '113', '办公用品', '个', '', '', '', '1', '管理员', '2019-12-27 10:46:20', null);
INSERT INTO `dtoa_material` VALUES ('829', '113004', 'A4板夹', '88', '113', '办公用品', '个', '', '', '', '1', '管理员', '2019-12-27 10:47:19', null);
INSERT INTO `dtoa_material` VALUES ('830', '113005', '签字笔', '88', '113', '办公用品', '支', '', '', '', '1', '管理员', '2019-12-27 10:47:37', null);
INSERT INTO `dtoa_material` VALUES ('831', '113006', '签字笔芯', '88', '113', '办公用品', '支', '', '', '', '1', '管理员', '2019-12-27 10:47:58', null);
INSERT INTO `dtoa_material` VALUES ('832', '113007', '三档文件筐', '88', '113', '办公用品', '个', '', '', '', '1', '管理员', '2019-12-27 10:48:11', null);
INSERT INTO `dtoa_material` VALUES ('833', '113008', 'A4纸', '88', '113', '办公用品', '箱', '500/包*5包', '', '', '1', '管理员', '2019-12-27 11:06:22', '2019-12-27 11:19:33');
INSERT INTO `dtoa_material` VALUES ('834', '112012', '路由器', '41', '112', '低值易耗品', '个', '四天线', '', '', '1', '管理员', '2019-12-27 11:19:34', null);
INSERT INTO `dtoa_material` VALUES ('835', '112013', '网络交换机', '41', '112', '低值易耗品', '台', '', '', '', '1', '管理员', '2019-12-27 11:20:06', null);
INSERT INTO `dtoa_material` VALUES ('836', '11007032', '网线', '114', '11007', '电线电缆', '米', '', '', '', '1', '管理员', '2019-12-27 11:20:21', null);
INSERT INTO `dtoa_material` VALUES ('837', '113009', '计算器', '88', '113', '办公用品', '个', '大', '', '', '1', '管理员', '2019-12-27 11:20:40', null);
INSERT INTO `dtoa_material` VALUES ('838', '113010', '塑料档案盒', '88', '113', '办公用品', '个', '', '', '', '1', '管理员', '2019-12-27 11:20:55', null);
INSERT INTO `dtoa_material` VALUES ('839', '113011', 'A5笔记本', '88', '113', '办公用品', '本', '', '', '', '1', '管理员', '2019-12-27 11:21:07', null);
INSERT INTO `dtoa_material` VALUES ('840', '113012', '硒鼓', '88', '113', '办公用品', '个', 'HP12A', '', '', '1', '管理员', '2019-12-27 11:21:26', null);
INSERT INTO `dtoa_material` VALUES ('841', '112014', '多孔插板', '41', '112', '低值易耗品', '个', '', '', '', '1', '管理员', '2019-12-27 11:21:48', null);
INSERT INTO `dtoa_material` VALUES ('842', '112015', '电池', '41', '112', '低值易耗品', '节', '5#', '', '', '1', '管理员', '2019-12-27 11:22:28', null);
INSERT INTO `dtoa_material` VALUES ('843', '112016', '电池', '41', '112', '低值易耗品', '节', '7#', '', '', '1', '管理员', '2019-12-27 11:22:52', null);
INSERT INTO `dtoa_material` VALUES ('844', '113013', '桌笔', '88', '113', '办公用品', '支', '', '', '', '1', '管理员', '2019-12-27 11:23:05', null);
INSERT INTO `dtoa_material` VALUES ('845', '113014', '硒鼓加粉', '88', '113', '办公用品', '盒', '', '', '', '1', '管理员', '2019-12-27 11:23:24', null);
INSERT INTO `dtoa_material` VALUES ('846', '113015', '电脑配件', '88', '113', '办公用品', '个', '', '', '', '1', '管理员', '2019-12-27 11:23:41', null);
INSERT INTO `dtoa_material` VALUES ('847', '113016', '双面胶', '88', '113', '办公用品', '盘', '', '', '', '1', '管理员', '2019-12-27 11:23:58', null);
INSERT INTO `dtoa_material` VALUES ('848', '113017', '胶棒', '88', '113', '办公用品', '个', '', '', '', '1', '管理员', '2019-12-27 11:24:21', null);
INSERT INTO `dtoa_material` VALUES ('849', '113018', '长尾夹', '88', '113', '办公用品', '盒', '中号', '', '', '1', '管理员', '2019-12-27 11:24:34', null);
INSERT INTO `dtoa_material` VALUES ('850', '113019', '曲别针', '88', '113', '办公用品', '盒', '', '', '', '1', '管理员', '2019-12-27 11:25:08', null);
INSERT INTO `dtoa_material` VALUES ('851', '30102001', '电脑', '146', '30102', '机械设备', '台', '', '', '', '1', '管理员', '2019-12-27 11:25:22', null);
INSERT INTO `dtoa_material` VALUES ('852', '30102002', '打印机', '146', '30102', '机械设备', '台', 'HP1050', '', '', '1', '管理员', '2019-12-27 11:26:15', null);
INSERT INTO `dtoa_material` VALUES ('853', '10703003', '焊接冲压弯头', '119', '10703', '焊接冲压管件', '个', 'Φ32六倍', '熟铁', '', '1', '管理员', '2019-12-27 14:53:39', null);
INSERT INTO `dtoa_material` VALUES ('854', '113020', '自动铅笔', '88', '113', '办公用品', '支', '', '', '', '1', '管理员', '2020-01-03 14:13:49', null);
INSERT INTO `dtoa_material` VALUES ('855', '113021', '自动铅', '88', '113', '办公用品', '盒', '', '', '', '1', '管理员', '2020-01-03 14:14:34', null);
INSERT INTO `dtoa_material` VALUES ('856', '113022', '长尾夹', '88', '113', '办公用品', '盒', '41#', '', '', '1', '管理员', '2020-01-03 14:14:49', null);
INSERT INTO `dtoa_material` VALUES ('857', '112017', '键盘', '41', '112', '低值易耗品', '个', 'USB', '', '', '1', '管理员', '2020-01-03 14:15:55', null);
INSERT INTO `dtoa_material` VALUES ('858', '112018', '内存条', '41', '112', '低值易耗品', '个', '16G', '', '', '1', '管理员', '2020-01-03 14:16:32', null);
INSERT INTO `dtoa_material` VALUES ('859', '112019', '粉仓', '41', '112', '低值易耗品', '个', '', '', '', '1', '管理员', '2020-01-03 14:17:12', null);
INSERT INTO `dtoa_material` VALUES ('860', '50105003', '吊车', '85', '50105', '吊车', '班', '12吨', '', '', '1', '管理员', '2020-01-13 09:28:43', null);
INSERT INTO `dtoa_material` VALUES ('861', '50105004', '吊车', '85', '50105', '吊车', '班', '20吨', '', '', '1', '管理员', '2020-01-13 09:29:15', null);
INSERT INTO `dtoa_material` VALUES ('862', '50105005', '吊车', '85', '50105', '吊车', '班', '25吨', '', '', '1', '管理员', '2020-01-13 09:29:55', null);
INSERT INTO `dtoa_material` VALUES ('863', '50105006', '吊车', '85', '50105', '吊车', '班', '50吨', '', '', '1', '管理员', '2020-01-13 09:30:32', null);
INSERT INTO `dtoa_material` VALUES ('864', '50105007', '吊车', '85', '50105', '吊车', '班', '16吨', '', '', '1', '管理员', '2020-01-13 09:30:46', null);
INSERT INTO `dtoa_material` VALUES ('865', '11003022', '金属配电箱', '105', '11003', '电箱', '台', '500*600*160', '金属', '', '1', '管理员', '2020-01-13 14:29:43', null);
INSERT INTO `dtoa_material` VALUES ('866', '11003023', '金属配电箱', '105', '11003', '电箱', '台', '550*320*160', '金属', '', '1', '管理员', '2020-01-13 14:53:05', null);
INSERT INTO `dtoa_material` VALUES ('867', '11003024', '金属配电箱', '105', '11003', '电箱', '台', '500*580*160', '金属', '', '1', '管理员', '2020-01-13 14:54:03', null);
INSERT INTO `dtoa_material` VALUES ('868', '11003025', '金属防爆配电箱', '105', '11003', '电箱', '台', '850*970*170', '金属', '', '1', '管理员', '2020-01-13 14:54:40', null);
INSERT INTO `dtoa_material` VALUES ('869', '11003026', '金属配电箱', '105', '11003', '电箱', '台', '800*600*230', '金属', '', '1', '管理员', '2020-01-13 14:55:39', null);
INSERT INTO `dtoa_material` VALUES ('870', '11003027', '金属配电箱', '105', '11003', '电箱', '台', '450*580*160', '金属', '', '1', '管理员', '2020-01-13 14:57:19', null);
INSERT INTO `dtoa_material` VALUES ('871', '11003028', '金属防爆配电箱', '105', '11003', '电箱', '台', '550*600*170', '金属', '', '1', '管理员', '2020-01-13 14:58:20', null);
INSERT INTO `dtoa_material` VALUES ('872', '11004004', '不锈钢线槽桥架', '110', '11004', '线槽桥架', '米', '100*100*1.2', '304', '', '9', '董满仓', '2020-04-20 15:15:51', null);
INSERT INTO `dtoa_material` VALUES ('873', '11004005', '镀锌线槽支架', '110', '11004', '线槽桥架', '个', '150', '', '', '9', '董满仓', '2020-04-20 15:17:32', null);
INSERT INTO `dtoa_material` VALUES ('874', '11004006', '镀锌线槽支架', '110', '11004', '线槽桥架', '个', '700', '', '', '9', '董满仓', '2020-04-20 15:32:01', null);
INSERT INTO `dtoa_material` VALUES ('875', '11004007', '不锈钢水平弯通', '110', '11004', '线槽桥架', '个', '100*100*1.2', '304', '', '9', '董满仓', '2020-04-20 15:32:16', null);
INSERT INTO `dtoa_material` VALUES ('876', '11004008', '不锈钢下反弯通', '110', '11004', '线槽桥架', '个', '100*100*1.2', '304', '', '9', '董满仓', '2020-04-20 15:32:56', null);
INSERT INTO `dtoa_material` VALUES ('877', '11004009', '不锈钢上反弯通', '110', '11004', '线槽桥架', '个', '100*100*1.2', '304', '', '9', '董满仓', '2020-04-20 15:37:38', null);
INSERT INTO `dtoa_material` VALUES ('878', '11001019', '不锈钢穿线管', '59', '11001', '管线敷设', '米', 'Φ40*1.3', '304', '', '9', '董满仓', '2020-04-20 15:38:06', null);
INSERT INTO `dtoa_material` VALUES ('880', '11006007', 'PVC管', '113', '11006', 'PVC线管材件', '米', 'Φ20', '', '', '9', '董满仓', '2020-04-20 15:54:05', null);
INSERT INTO `dtoa_material` VALUES ('881', '11006008', 'PVC卡子', '113', '11006', 'PVC线管材件', '个', 'Φ20', '', '', '9', '董满仓', '2020-04-20 16:06:03', null);
INSERT INTO `dtoa_material` VALUES ('882', '11001020', '不锈钢四通接线盒', '59', '11001', '管线敷设', '个', '200*200', '304', '', '9', '董满仓', '2020-04-20 16:06:22', '2020-04-20 16:07:42');
INSERT INTO `dtoa_material` VALUES ('883', '11001021', '不锈钢角通盒', '59', '11001', '管线敷设', '个', '100*100', '304', '', '9', '董满仓', '2020-04-20 16:07:42', null);
INSERT INTO `dtoa_material` VALUES ('884', '11001022', 'JDG盒接', '59', '11001', '管线敷设', '个', 'Φ40', '金属', '', '9', '董满仓', '2020-04-20 16:08:03', null);
INSERT INTO `dtoa_material` VALUES ('885', '10701050', '不锈钢开孔器', '90', '10701', '五金材料', '个', 'Φ45', '', '', '9', '董满仓', '2020-04-20 16:10:03', null);
INSERT INTO `dtoa_material` VALUES ('886', '11006009', 'PVC直接', '113', '11006', 'PVC线管材件', '个', 'Φ20', '', '', '9', '董满仓', '2020-04-20 16:10:52', null);
INSERT INTO `dtoa_material` VALUES ('887', '10701051', '马鞍卡', '90', '10701', '五金材料', '个', '40', '金属', '', '9', '董满仓', '2020-04-20 16:11:23', null);
INSERT INTO `dtoa_material` VALUES ('888', '1010301007', '预埋铁板', '136', '1010301', '加工铁板', '块', '80*80*10mm', '', '', '9', '董满仓', '2020-04-20 16:13:04', null);
INSERT INTO `dtoa_material` VALUES ('889', '10701052', '木工锯片', '90', '10701', '五金材料', '片', '300*120齿', '合金', '', '9', '董满仓', '2020-04-20 16:19:10', null);
INSERT INTO `dtoa_material` VALUES ('890', '1010403002', '圆钢', '143', '1010403', '圆钢', '米', 'Φ6', '', '', '9', '董满仓', '2020-05-19 10:09:19', null);
INSERT INTO `dtoa_material` VALUES ('891', '1010403003', '圆钢', '143', '1010403', '圆钢', '米', 'Φ10', '', '', '9', '董满仓', '2020-05-19 10:10:43', null);
INSERT INTO `dtoa_material` VALUES ('892', '11007033', 'ZC-BV塑铜线', '114', '11007', '电线电缆', '米', '2.5', '铜', '', '9', '董满仓', '2020-05-19 10:17:44', null);
INSERT INTO `dtoa_material` VALUES ('893', '11007034', 'ZC-BVN耐火塑铜线', '114', '11007', '电线电缆', '米', '2.5', '铜', '', '9', '董满仓', '2020-05-19 10:34:48', null);
INSERT INTO `dtoa_material` VALUES ('894', '1010401010', '三级螺纹（盘螺）', '95', '1010401', '螺纹', '吨', '6', '', '', '9', '董满仓', '2020-05-19 10:53:05', null);
INSERT INTO `dtoa_material` VALUES ('895', '1010402001', '线材', '96', '1010402', '线材', '吨', 'Φ6', '', '', '9', '董满仓', '2020-05-19 11:18:03', null);
INSERT INTO `dtoa_material` VALUES ('896', '1010402002', '线材', '96', '1010402', '线材', '吨', 'Φ10', '', '', '9', '董满仓', '2020-05-19 11:18:35', null);
INSERT INTO `dtoa_material` VALUES ('897', '10501009', '全白内墙砖', '125', '10501', '瓷砖', '㎡', '300*450', '釉面砖', '', '9', '董满仓', '2020-05-19 15:41:24', '2020-05-28 16:38:26');
INSERT INTO `dtoa_material` VALUES ('898', '112020', '枪式测温仪', '41', '112', '低值易耗品', '把', '', '', '', '1', '管理员', '2020-05-26 13:39:21', null);
INSERT INTO `dtoa_material` VALUES ('899', '112021', '口罩', '41', '112', '低值易耗品', '个', '', '', '', '1', '管理员', '2020-05-26 13:42:40', null);
INSERT INTO `dtoa_material` VALUES ('900', '10802007', '84消毒液', '117', '10802', '化工产品', '箱', '', '', '', '1', '管理员', '2020-05-26 13:43:20', null);
INSERT INTO `dtoa_material` VALUES ('901', '112022', '洗手液', '41', '112', '低值易耗品', '桶', '', '', '', '1', '管理员', '2020-05-26 13:44:18', null);
INSERT INTO `dtoa_material` VALUES ('902', '112023', '洗涤灵', '41', '112', '低值易耗品', '瓶', '', '', '', '1', '管理员', '2020-05-26 13:44:52', null);
INSERT INTO `dtoa_material` VALUES ('903', '112024', '橡胶手套', '41', '112', '低值易耗品', '付', '', '', '', '1', '管理员', '2020-05-26 13:45:30', null);
INSERT INTO `dtoa_material` VALUES ('904', '112025', '编织袋', '41', '112', '低值易耗品', '个', '450*770', '', '', '1', '管理员', '2020-05-26 13:45:48', null);
INSERT INTO `dtoa_material` VALUES ('905', '11107064', '球墨中盘三通', '109', '11107', '球墨管材管件', '个', '150*100', '', '', '1', '管理员', '2020-05-26 13:51:21', null);
INSERT INTO `dtoa_material` VALUES ('906', '11102050', '地下闸阀', '93', '11102', '控水主材', '个', 'DN150', '', '', '1', '管理员', '2020-05-26 14:13:59', null);
INSERT INTO `dtoa_material` VALUES ('907', '11107065', '球墨铸铁管', '109', '11107', '球墨管材管件', '米', '150', '球墨铸铁', '', '1', '管理员', '2020-05-26 14:22:32', null);
INSERT INTO `dtoa_material` VALUES ('908', '11107066', '球墨管甲', '109', '11107', '球墨管材管件', '个', 'DN150', '球墨铸铁', '', '1', '管理员', '2020-05-26 14:23:39', null);
INSERT INTO `dtoa_material` VALUES ('909', '11107067', '球墨管乙', '109', '11107', '球墨管材管件', '个', 'DN150', '球墨铸铁', '', '1', '管理员', '2020-05-26 14:25:20', null);
INSERT INTO `dtoa_material` VALUES ('910', '11102051', '地下消火栓', '93', '11102', '控水主材', '个', '65', '', '', '1', '管理员', '2020-05-26 14:25:43', '2020-12-24 16:03:44');
INSERT INTO `dtoa_material` VALUES ('911', '11102052', '蝶阀', '93', '11102', '控水主材', '个', 'DN100', '', '', '1', '管理员', '2020-05-26 14:26:45', null);
INSERT INTO `dtoa_material` VALUES ('912', '11107068', '球墨铸铁管胶圈', '109', '11107', '球墨管材管件', '个', '150', '', '', '1', '管理员', '2020-05-26 14:32:48', null);
INSERT INTO `dtoa_material` VALUES ('913', '11109038', '法兰垫', '122', '11109', '水暖辅材', '个', '150', '', '', '1', '管理员', '2020-05-26 14:33:35', null);
INSERT INTO `dtoa_material` VALUES ('914', '10701053', '螺栓', '90', '10701', '五金材料', '套', 'M8*60', '', '', '1', '管理员', '2020-05-26 14:35:15', null);
INSERT INTO `dtoa_material` VALUES ('915', '11115001', '沟槽法兰短管', '147', '11115', '沟槽管件', '个', '114', '', '', '1', '管理员', '2020-05-26 14:39:01', null);
INSERT INTO `dtoa_material` VALUES ('916', '11115002', '沟槽刚性接头', '147', '11115', '沟槽管件', '个', '114', '', '', '1', '管理员', '2020-05-26 14:39:41', null);
INSERT INTO `dtoa_material` VALUES ('917', '10701054', '双头螺栓', '90', '10701', '五金材料', '套', '16*170', '', '', '1', '管理员', '2020-05-26 14:40:07', null);
INSERT INTO `dtoa_material` VALUES ('918', '11110035', 'PVC顺水三通', '129', '11110', 'PVC管材管件', '个', 'Φ160*110', 'PVC', '', '9', '董满仓', '2020-05-29 11:26:10', null);
INSERT INTO `dtoa_material` VALUES ('919', '11110036', 'PVC补芯', '129', '11110', 'PVC管材管件', '个', 'Φ160*110', 'PVC', '', '9', '董满仓', '2020-05-29 11:27:08', null);
INSERT INTO `dtoa_material` VALUES ('920', '11110037', 'PVC弯头', '129', '11110', 'PVC管材管件', '个', 'Φ110*90°', 'PVC', '', '9', '董满仓', '2020-05-29 15:30:21', null);
INSERT INTO `dtoa_material` VALUES ('921', '11110038', 'PVC吊卡', '129', '11110', 'PVC管材管件', '套', 'Φ160', 'PVC', '', '9', '董满仓', '2020-05-29 15:31:26', null);
INSERT INTO `dtoa_material` VALUES ('922', '11109039', 'U型卡', '122', '11109', '水暖辅材', '套', 'DN160', '', '', '9', '董满仓', '2020-05-29 15:36:29', '2020-05-29 15:40:29');
INSERT INTO `dtoa_material` VALUES ('923', '11109040', 'U型卡', '122', '11109', '水暖辅材', '套', 'DN110', '', '', '9', '董满仓', '2020-05-29 15:39:29', '2020-05-29 15:40:39');
INSERT INTO `dtoa_material` VALUES ('924', '11113010', '钢制暖气片腿', '132', '11113', '散热器', '付', '', '', '', '9', '董满仓', '2020-05-29 15:44:47', null);
INSERT INTO `dtoa_material` VALUES ('925', '11113011', '钢制柱式暖气片', '132', '11113', '散热器', '柱', '600', '', '', '9', '董满仓', '2020-05-29 15:46:25', null);
INSERT INTO `dtoa_material` VALUES ('927', '30202006', '污水车', '47', '30202', '文明施工', '车', '5吨', '', '', '9', '董满仓', '2020-05-29 15:54:45', null);
INSERT INTO `dtoa_material` VALUES ('928', '11005013', 'LED投光灯', '112', '11005', '灯具', '个', '100W', '', '', '9', '董满仓', '2020-06-12 14:14:12', null);
INSERT INTO `dtoa_material` VALUES ('929', '11005014', '防爆投光灯', '112', '11005', '灯具', '个', '60W', '', '', '9', '董满仓', '2020-06-12 14:19:43', null);
INSERT INTO `dtoa_material` VALUES ('930', '11006010', 'PVC明装接线盒', '113', '11006', 'PVC线管材件', '个', '', '', '', '9', '董满仓', '2020-06-12 14:21:01', null);
INSERT INTO `dtoa_material` VALUES ('931', '11003029', '明装配电箱', '105', '11003', '电箱', '台', '三路', '', '', '9', '董满仓', '2020-06-12 14:21:36', null);
INSERT INTO `dtoa_material` VALUES ('932', '11003030', '明装配电箱', '105', '11003', '电箱', '台', '七路', '', '', '9', '董满仓', '2020-06-12 14:22:43', null);
INSERT INTO `dtoa_material` VALUES ('933', '11003031', '明装配电箱', '105', '11003', '电箱', '台', '十路', '', '', '9', '董满仓', '2020-06-12 14:23:03', null);
INSERT INTO `dtoa_material` VALUES ('934', '10701055', '不锈钢钻头', '90', '10701', '五金材料', '支', 'Φ10', '', '', '9', '董满仓', '2020-06-12 14:23:23', null);
INSERT INTO `dtoa_material` VALUES ('935', '10701056', '不锈钢开孔器', '90', '10701', '五金材料', '个', 'Φ22', '', '', '9', '董满仓', '2020-06-12 14:47:20', null);
INSERT INTO `dtoa_material` VALUES ('936', '11001023', '防爆角通盒', '59', '11001', '管线敷设', '个', '25', '', '', '9', '董满仓', '2020-06-16 14:41:00', null);
INSERT INTO `dtoa_material` VALUES ('937', '11001024', '防爆挠性连接管', '59', '11001', '管线敷设', '根', 'DN25*500', '', '', '9', '董满仓', '2020-06-16 14:41:59', null);
INSERT INTO `dtoa_material` VALUES ('938', '11007035', 'BV塑铜线', '114', '11007', '电线电缆', '米', 'BV25', '', '', '9', '董满仓', '2020-06-16 14:57:10', null);
INSERT INTO `dtoa_material` VALUES ('939', '50101008', '胶轮挖掘机', '81', '50101', '挖掘机', '班', '150型', '', '', '9', '董满仓', '2020-06-19 14:29:06', null);
INSERT INTO `dtoa_material` VALUES ('940', '10502001', '人造岗石', '127', '10502', '石材', '㎡', '', '', '', '9', '董满仓', '2020-06-24 09:14:43', null);
INSERT INTO `dtoa_material` VALUES ('941', '10601001', '钢木门', '148', '10601', '木门', '樘', '2050*950*210', '', '', '9', '董满仓', '2020-06-29 11:09:03', null);
INSERT INTO `dtoa_material` VALUES ('942', '11004010', '镀锌线槽桥架', '110', '11004', '线槽桥架', '根', '150*100*6000', '', '', '9', '董满仓', '2020-06-30 16:08:04', null);
INSERT INTO `dtoa_material` VALUES ('943', '11004011', '镀锌线槽桥架', '110', '11004', '线槽桥架', '根', '150*100*7000', '', '', '9', '董满仓', '2020-06-30 16:10:24', null);
INSERT INTO `dtoa_material` VALUES ('944', '11004012', '镀锌线槽桥架', '110', '11004', '线槽桥架', '根', '150*100*2000', '', '', '9', '董满仓', '2020-06-30 16:10:51', null);
INSERT INTO `dtoa_material` VALUES ('945', '11007036', 'YJV电缆', '114', '11007', '电线电缆', '米', '5*6mm²', '', '', '9', '董满仓', '2020-06-30 16:11:29', null);
INSERT INTO `dtoa_material` VALUES ('946', '11007037', 'YJV电缆', '114', '11007', '电线电缆', '米', '4*2.5mm²', '', '', '9', '董满仓', '2020-06-30 16:17:27', null);
INSERT INTO `dtoa_material` VALUES ('947', '11004013', '镀锌水平弯头', '110', '11004', '线槽桥架', '个', '150*100*90°', '', '', '9', '董满仓', '2020-06-30 16:19:36', '2021-05-19 09:11:27');
INSERT INTO `dtoa_material` VALUES ('948', '11113012', '暖气片靠背卡子', '132', '11113', '散热器', '套', '760型暖气', '', '', '9', '董满仓', '2020-06-30 16:21:38', null);
INSERT INTO `dtoa_material` VALUES ('949', '11116001', '明装消防箱', '149', '11116', '消防管材管件（消耗）', '个', '800*650*180', '', '', '9', '董满仓', '2020-06-30 16:26:25', null);
INSERT INTO `dtoa_material` VALUES ('950', '11116002', '消防水带', '149', '11116', '消防管材管件（消耗）', '条', '65*30米', '', '', '9', '董满仓', '2020-06-30 16:28:09', '2020-06-30 16:35:09');
INSERT INTO `dtoa_material` VALUES ('951', '11116003', '消防水带', '149', '11116', '消防管材管件（消耗）', '条', '65*25米', '', '', '9', '董满仓', '2020-06-30 16:30:51', '2020-06-30 16:35:15');
INSERT INTO `dtoa_material` VALUES ('952', '11116004', '消防水带', '149', '11116', '消防管材管件（消耗）', '条', '65*20米', '', '', '9', '董满仓', '2020-06-30 16:31:08', '2020-06-30 16:35:21');
INSERT INTO `dtoa_material` VALUES ('953', '11116005', '消防枪头', '149', '11116', '消防管材管件（消耗）', '个', '65', '', '', '9', '董满仓', '2020-06-30 16:31:22', '2020-06-30 16:32:46');
INSERT INTO `dtoa_material` VALUES ('954', '11101051', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN50', '', '', '9', '董满仓', '2020-06-30 16:53:28', null);
INSERT INTO `dtoa_material` VALUES ('955', '11102053', '铸钢截止阀', '93', '11102', '控水主材', '个', 'DN50', '', '', '9', '董满仓', '2020-06-30 16:54:29', null);
INSERT INTO `dtoa_material` VALUES ('956', '11104003', '水表', '106', '11104', '水表', '块', 'DN50', '', '', '9', '董满仓', '2020-06-30 16:55:54', null);
INSERT INTO `dtoa_material` VALUES ('957', '11101052', '吊环卡', '92', '11101', '镀锌管件', '个', 'DN20', '', '', '9', '董满仓', '2020-06-30 16:56:20', null);
INSERT INTO `dtoa_material` VALUES ('958', '11101053', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN50*20', '热镀锌', '', '9', '董满仓', '2020-06-30 16:57:50', null);
INSERT INTO `dtoa_material` VALUES ('959', '11006011', 'PVC管', '113', '11006', 'PVC线管材件', '米', 'Φ40', '', '', '9', '董满仓', '2020-06-30 16:58:39', null);
INSERT INTO `dtoa_material` VALUES ('960', '11006012', 'PVC直接', '113', '11006', 'PVC线管材件', '个', 'Φ40', '', '', '9', '董满仓', '2020-06-30 17:05:41', null);
INSERT INTO `dtoa_material` VALUES ('961', '11006013', 'PVC弯头', '113', '11006', 'PVC线管材件', '个', 'Φ40', '', '', '9', '董满仓', '2020-06-30 17:06:18', null);
INSERT INTO `dtoa_material` VALUES ('962', '11002028', 'SC线鼻子', '91', '11002', '电气辅材', '个', '50mm²', '铜', '', '9', '董满仓', '2020-07-02 09:24:30', '2020-07-02 09:56:08');
INSERT INTO `dtoa_material` VALUES ('963', '11002029', 'SC线鼻子', '91', '11002', '电气辅材', '个', '25mm²', '铜', '', '9', '董满仓', '2020-07-02 09:56:08', null);
INSERT INTO `dtoa_material` VALUES ('964', '11002030', 'SC线鼻子', '91', '11002', '电气辅材', '个', '10mm²', '铜', '', '9', '董满仓', '2020-07-02 09:57:06', null);
INSERT INTO `dtoa_material` VALUES ('965', '11002031', '接地钎子', '91', '11002', '电气辅材', '根', 'Φ16', '', '', '9', '董满仓', '2020-07-03 08:46:02', null);
INSERT INTO `dtoa_material` VALUES ('966', '10701057', '镀锌螺栓', '90', '10701', '五金材料', '套', '10*30', '', '', '9', '董满仓', '2020-07-03 08:47:38', null);
INSERT INTO `dtoa_material` VALUES ('967', '11008014', '轴流风机（工程）', '115', '11008', '电气设备安装材料', '台', '380V0.9kw', '', '', '9', '董满仓', '2020-07-06 08:20:00', null);
INSERT INTO `dtoa_material` VALUES ('968', '112026', '打印机加热组件', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2020-07-11 15:02:07', null);
INSERT INTO `dtoa_material` VALUES ('969', '113023', '惠普36鼓', '88', '113', '办公用品', '个', '', '', '', '9', '董满仓', '2020-07-11 15:03:10', null);
INSERT INTO `dtoa_material` VALUES ('970', '113024', '壁纸刀', '88', '113', '办公用品', '把', '', '', '', '9', '董满仓', '2020-07-11 15:03:50', null);
INSERT INTO `dtoa_material` VALUES ('971', '113025', '壁纸刀片', '88', '113', '办公用品', '个', '', '', '', '9', '董满仓', '2020-07-11 15:04:23', null);
INSERT INTO `dtoa_material` VALUES ('972', '113026', '起钉器', '88', '113', '办公用品', '个', '', '', '', '9', '董满仓', '2020-07-11 15:04:34', null);
INSERT INTO `dtoa_material` VALUES ('973', '113027', '联想粉盒', '88', '113', '办公用品', '个', '', '', '', '9', '董满仓', '2020-07-11 15:49:25', null);
INSERT INTO `dtoa_material` VALUES ('974', '11105041', 'PPR过桥弯', '107', '11105', 'PPR管材管件', '个', '25', 'PPR', '', '9', '董满仓', '2020-07-13 09:24:38', null);
INSERT INTO `dtoa_material` VALUES ('975', '11105042', 'PPR过桥弯', '107', '11105', 'PPR管材管件', '个', '20', 'PPR', '', '9', '董满仓', '2020-07-13 09:26:46', null);
INSERT INTO `dtoa_material` VALUES ('976', '11105043', 'PPR过桥弯', '107', '11105', 'PPR管材管件', '个', '32', 'PPR', '', '9', '董满仓', '2020-07-13 09:27:15', null);
INSERT INTO `dtoa_material` VALUES ('977', '11105044', 'PPR过桥弯', '107', '11105', 'PPR管材管件', '个', '40', 'PPR', '', '9', '董满仓', '2020-07-13 09:27:36', null);
INSERT INTO `dtoa_material` VALUES ('978', '11105045', 'PPR过桥弯', '107', '11105', 'PPR管材管件', '个', '50', 'PPR', '', '9', '董满仓', '2020-07-13 09:27:58', null);
INSERT INTO `dtoa_material` VALUES ('979', '11105046', 'PPR变径管箍', '107', '11105', 'PPR管材管件', '个', '25*20', 'PPR', '', '9', '董满仓', '2020-07-13 09:28:18', null);
INSERT INTO `dtoa_material` VALUES ('980', '11105047', 'PPR管卡', '107', '11105', 'PPR管材管件', '个', '20', 'PPR', '', '9', '董满仓', '2020-07-13 09:29:47', null);
INSERT INTO `dtoa_material` VALUES ('981', '10701058', '塑料涨塞', '90', '10701', '五金材料', '个', '6*30', '塑料', '', '9', '董满仓', '2020-07-13 10:15:27', null);
INSERT INTO `dtoa_material` VALUES ('982', '11101054', '镀锌补芯', '92', '11101', '镀锌管件', '个', 'DN25*20', '热镀锌', '', '9', '董满仓', '2020-07-13 10:17:13', null);
INSERT INTO `dtoa_material` VALUES ('984', '11110039', 'PVC斜三通', '129', '11110', 'PVC管材管件', '个', 'Φ50', 'PVC', '', '9', '董满仓', '2020-07-13 15:51:38', null);
INSERT INTO `dtoa_material` VALUES ('985', '11110040', 'PVC弯头', '129', '11110', 'PVC管材管件', '个', 'Φ50*45°', 'PVC', '', '9', '董满仓', '2020-07-13 15:52:17', null);
INSERT INTO `dtoa_material` VALUES ('986', '11110041', 'PVC立管卡', '129', '11110', 'PVC管材管件', '套', 'Φ75', 'PVC+钉', '', '9', '董满仓', '2020-07-13 15:52:43', null);
INSERT INTO `dtoa_material` VALUES ('987', '11110042', 'PVC立管卡', '129', '11110', 'PVC管材管件', '套', 'Φ50', 'PVC＋钉', '', '9', '董满仓', '2020-07-13 15:54:38', null);
INSERT INTO `dtoa_material` VALUES ('988', '11110043', 'PVC立管卡', '129', '11110', 'PVC管材管件', '套', 'Φ110', 'PVC＋钉', '', '9', '董满仓', '2020-07-13 15:55:18', null);
INSERT INTO `dtoa_material` VALUES ('989', '11110044', 'PVC立管卡', '129', '11110', 'PVC管材管件', '套', 'Φ160', 'PVC＋钉', '', '9', '董满仓', '2020-07-13 15:55:46', null);
INSERT INTO `dtoa_material` VALUES ('990', '11105048', 'PPR三通', '107', '11105', 'PPR管材管件', '个', '32*25', 'PPR', '', '9', '董满仓', '2020-07-13 15:56:15', null);
INSERT INTO `dtoa_material` VALUES ('991', '11105048', 'PPR三通', '107', '11105', 'PPR管材管件', '个', '32*25', 'PPR', '', '9', '董满仓', '2020-07-13 15:56:15', null);
INSERT INTO `dtoa_material` VALUES ('992', '11105049', 'PPR管卡', '107', '11105', 'PPR管材管件', '个', '25', 'PPR', '', '9', '董满仓', '2020-07-13 15:57:24', null);
INSERT INTO `dtoa_material` VALUES ('993', '11006014', 'PVC盒接', '113', '11006', 'PVC线管材件', '个', 'Φ20', '', '', '9', '董满仓', '2020-07-17 08:07:19', null);
INSERT INTO `dtoa_material` VALUES ('994', '10701059', 'PVC弯管簧', '90', '10701', '五金材料', '个', '20', '', '', '9', '董满仓', '2020-07-17 08:09:00', null);
INSERT INTO `dtoa_material` VALUES ('995', '10701060', '电锤钻头', '90', '10701', '五金材料', '根', '8*200', '', '', '9', '董满仓', '2020-07-17 08:10:29', null);
INSERT INTO `dtoa_material` VALUES ('996', '11003032', 'F1AL1', '105', '11003', '电箱', '台', '400*320*160', '金属', '全套', '9', '董满仓', '2020-07-17 08:36:01', null);
INSERT INTO `dtoa_material` VALUES ('997', '11003033', 'F1AL2', '105', '11003', '电箱', '台', '580*320*160', '金属', '全套', '9', '董满仓', '2020-07-17 08:37:44', null);
INSERT INTO `dtoa_material` VALUES ('998', '11003034', 'F1AL3', '105', '11003', '电箱', '台', '500*320*160', '金属', '全套', '9', '董满仓', '2020-07-17 08:38:53', null);
INSERT INTO `dtoa_material` VALUES ('999', '11003035', 'FJAP1', '105', '11003', '电箱', '台', '500*600*160', '金属', '全套', '9', '董满仓', '2020-07-17 08:40:07', null);
INSERT INTO `dtoa_material` VALUES ('1000', '11003036', 'FJAP2', '105', '11003', '电箱', '台', '500*600*280', '金属', '全套', '9', '董满仓', '2020-07-17 08:48:45', null);
INSERT INTO `dtoa_material` VALUES ('1001', '11003037', '等电位箱MEB', '105', '11003', '电箱', '台', '500*250*160', '金属', '全套', '9', '董满仓', '2020-07-17 08:50:07', null);
INSERT INTO `dtoa_material` VALUES ('1002', '11003038', '接地测试点箱', '105', '11003', '电箱', '台', '200*200*160', '金属', '全套', '9', '董满仓', '2020-07-17 08:52:53', null);
INSERT INTO `dtoa_material` VALUES ('1003', '11002032', 'SC线鼻子', '91', '11002', '电气辅材', '个', '35mm²', '铜', '', '9', '董满仓', '2020-07-20 14:51:07', null);
INSERT INTO `dtoa_material` VALUES ('1004', '11002033', '空开', '91', '11002', '电气辅材', '块', '380V160A', '', '', '9', '董满仓', '2020-07-20 14:56:34', null);
INSERT INTO `dtoa_material` VALUES ('1005', '11102054', '感应冷热脸盆水龙头', '93', '11102', '控水主材', '套', 'DN15', '', '', '9', '董满仓', '2020-07-20 15:02:26', null);
INSERT INTO `dtoa_material` VALUES ('1006', '112027', '木围栏板', '41', '112', '低值易耗品', '块', '8cm*30cm', '', '', '9', '董满仓', '2020-07-20 15:11:57', null);
INSERT INTO `dtoa_material` VALUES ('1007', '11008015', '厨宝', '115', '11008', '电气设备安装材料', '台', '220v', '', '', '9', '董满仓', '2020-07-20 15:33:29', null);
INSERT INTO `dtoa_material` VALUES ('1008', '10802008', '瓷砖清洁剂', '117', '10802', '化工产品', '瓶', '', '', '', '9', '董满仓', '2020-07-20 15:35:39', null);
INSERT INTO `dtoa_material` VALUES ('1009', '11002034', '防火包', '91', '11002', '电气辅材', '包', '', '', '', '9', '董满仓', '2020-07-20 15:40:49', null);
INSERT INTO `dtoa_material` VALUES ('1010', '11006015', 'PVC弯头', '113', '11006', 'PVC线管材件', '个', 'Φ20', '', '', '9', '董满仓', '2020-07-20 15:41:34', null);
INSERT INTO `dtoa_material` VALUES ('1011', '10802009', '免钉胶', '117', '10802', '化工产品', '瓶', '', '', '', '9', '董满仓', '2020-07-20 15:43:14', null);
INSERT INTO `dtoa_material` VALUES ('1012', '11114007', '台下洗脸盆', '142', '11114', '卫浴安装', '个', '', '瓷质', '', '9', '董满仓', '2020-07-21 11:15:35', null);
INSERT INTO `dtoa_material` VALUES ('1013', '11114008', '不锈钢下水器', '142', '11114', '卫浴安装', '套', '', '', '', '9', '董满仓', '2020-07-21 11:17:54', null);
INSERT INTO `dtoa_material` VALUES ('1014', '11007038', 'RVV护套线', '114', '11007', '电线电缆', '米', '3*4mm²', '', '', '9', '董满仓', '2020-07-21 11:19:04', null);
INSERT INTO `dtoa_material` VALUES ('1015', '10705003', '不锈钢标牌', '121', '10705', '金属构件', '块', '600*800', '', '', '9', '董满仓', '2020-07-21 11:21:39', null);
INSERT INTO `dtoa_material` VALUES ('1016', '11005015', '防爆灯', '112', '11005', '灯具', '个', '', '', '', '9', '董满仓', '2020-07-21 11:23:52', null);
INSERT INTO `dtoa_material` VALUES ('1017', '11002035', '三相插头', '91', '11002', '电气辅材', '个', '', '', '', '9', '董满仓', '2020-07-21 13:57:29', null);
INSERT INTO `dtoa_material` VALUES ('1018', '10701061', '水钻头', '90', '10701', '五金材料', '个', 'Φ51', '', '', '9', '董满仓', '2020-07-21 13:58:27', null);
INSERT INTO `dtoa_material` VALUES ('1019', '11001025', 'JDG镀彩管', '59', '11001', '管线敷设', '米', 'Φ32', '金属', '', '9', '董满仓', '2020-07-21 14:07:56', null);
INSERT INTO `dtoa_material` VALUES ('1020', '11001026', 'JDG盒接', '59', '11001', '管线敷设', '个', 'Φ32', '', '', '9', '董满仓', '2020-07-21 14:09:34', null);
INSERT INTO `dtoa_material` VALUES ('1021', '11005016', 'LED灯泡', '112', '11005', '灯具', '个', '15W', '', '', '9', '董满仓', '2020-07-21 14:11:57', null);
INSERT INTO `dtoa_material` VALUES ('1022', '11001027', '包塑软管', '59', '11001', '管线敷设', '米', 'Φ32', '', '', '9', '董满仓', '2020-07-21 14:14:51', null);
INSERT INTO `dtoa_material` VALUES ('1023', '11002036', '尼龙绑扎带', '91', '11002', '电气辅材', '包', '300', '', '', '9', '董满仓', '2020-07-21 15:43:39', null);
INSERT INTO `dtoa_material` VALUES ('1024', '10701062', '不锈钢阳角线', '90', '10701', '五金材料', '米', '', '', '', '9', '董满仓', '2020-07-21 15:45:00', null);
INSERT INTO `dtoa_material` VALUES ('1025', '10802010', '防水胶', '117', '10802', '化工产品', '瓶', '2KG', '', '', '9', '董满仓', '2020-07-21 15:49:48', null);
INSERT INTO `dtoa_material` VALUES ('1026', '10702005', '胶枪', '118', '10702', '五金工具', '把', '', '', '', '9', '董满仓', '2020-07-21 15:51:38', null);
INSERT INTO `dtoa_material` VALUES ('1027', '11111006', '外丝三通', '130', '11111', '铝塑管材管件', '个', 'DN15', '铜', '', '9', '董满仓', '2020-07-21 15:52:16', null);
INSERT INTO `dtoa_material` VALUES ('1028', '10902013', '橡塑保温管', '128', '10902', '保温材料', '米', '25*3', '橡塑海绵', '', '9', '董满仓', '2020-07-24 11:25:16', null);
INSERT INTO `dtoa_material` VALUES ('1029', '11101055', '镀锌快接三通', '92', '11101', '镀锌管件', '个', 'DN50*20', '热镀锌', '', '9', '董满仓', '2020-07-24 11:26:34', null);
INSERT INTO `dtoa_material` VALUES ('1030', '213001', '冬施抗渗混凝土', '150', '213', '冬施抗渗混凝土', 'm³', 'C30P6', '', '', '9', '董满仓', '2020-07-28 10:09:28', null);
INSERT INTO `dtoa_material` VALUES ('1031', '214001', '无粉煤灰泵送混凝土', '151', '214', '无粉煤灰泵送混凝土', 'm³', 'C20', '', '', '9', '董满仓', '2020-07-28 10:46:02', null);
INSERT INTO `dtoa_material` VALUES ('1032', '11117001', 'PE管', '152', '11117', 'PE管材管件', '米', 'De50', '', '', '9', '董满仓', '2020-08-04 15:14:08', null);
INSERT INTO `dtoa_material` VALUES ('1033', '11117002', 'PE弯头', '152', '11117', 'PE管材管件', '个', 'De50*90°', '', '', '9', '董满仓', '2020-08-04 15:14:51', null);
INSERT INTO `dtoa_material` VALUES ('1034', '11117003', 'PE管箍', '152', '11117', 'PE管材管件', '个', 'De50', '', '', '9', '董满仓', '2020-08-04 15:15:24', null);
INSERT INTO `dtoa_material` VALUES ('1035', '30202007', '十滴水', '47', '30202', '文明施工', '瓶', '', '', '', '9', '董满仓', '2020-08-18 16:15:07', null);
INSERT INTO `dtoa_material` VALUES ('1036', '30202008', '藿香正气水', '47', '30202', '文明施工', '瓶', '', '', '', '9', '董满仓', '2020-08-18 16:18:51', null);
INSERT INTO `dtoa_material` VALUES ('1037', '11107069', '球墨雨水篦子', '109', '11107', '球墨管材管件', '套', '450*750重型', '球墨铸铁', '', '9', '董满仓', '2020-08-18 16:19:13', '2020-08-18 16:23:32');
INSERT INTO `dtoa_material` VALUES ('1038', '10701063', '钢丝绳', '90', '10701', '五金材料', '米', 'Φ8', '', '', '9', '董满仓', '2020-08-18 16:23:32', null);
INSERT INTO `dtoa_material` VALUES ('1039', '10701064', '卡豆', '90', '10701', '五金材料', '个', '8', '', '', '9', '董满仓', '2020-08-18 16:25:17', null);
INSERT INTO `dtoa_material` VALUES ('1040', '10701065', '花兰螺栓', '90', '10701', '五金材料', '个', '300', '', '', '9', '董满仓', '2020-08-18 16:26:07', null);
INSERT INTO `dtoa_material` VALUES ('1041', '10701066', '螺栓', '90', '10701', '五金材料', '套', 'M18*70', '', '', '9', '董满仓', '2020-08-18 16:27:40', null);
INSERT INTO `dtoa_material` VALUES ('1042', '11102055', '铜球阀', '93', '11102', '控水主材', '个', 'DN15', '', '', '9', '董满仓', '2020-08-18 16:28:38', null);
INSERT INTO `dtoa_material` VALUES ('1043', '11107070', 'A型铸铁地漏', '109', '11107', '球墨管材管件', '个', 'DN100', '球墨铸铁', '', '9', '董满仓', '2020-08-18 16:29:11', null);
INSERT INTO `dtoa_material` VALUES ('1044', '11107071', '球墨给水双垂弯头', '109', '11107', '球墨管材管件', '个', 'DN150', '球墨铸铁', '', '9', '董满仓', '2020-08-18 16:31:08', null);
INSERT INTO `dtoa_material` VALUES ('1045', '11107072', '铸铁橡胶柔性接口', '109', '11107', '球墨管材管件', '个', 'DN150', '', '', '9', '董满仓', '2020-08-18 16:32:08', null);
INSERT INTO `dtoa_material` VALUES ('1046', '11107073', '球墨双盘短管', '109', '11107', '球墨管材管件', '个', 'DN150', '球墨铸铁', '', '9', '董满仓', '2020-08-18 16:40:17', null);
INSERT INTO `dtoa_material` VALUES ('1047', '11107074', '球墨铸铁管垫', '109', '11107', '球墨管材管件', '个', 'DN150', '', '', '9', '董满仓', '2020-08-18 16:41:11', null);
INSERT INTO `dtoa_material` VALUES ('1048', '10701067', '金刚石合金锯片', '90', '10701', '五金材料', '片', 'Φ112', '', '', '9', '董满仓', '2020-08-19 14:46:49', null);
INSERT INTO `dtoa_material` VALUES ('1049', '10406002', '水泥管', '133', '10406', '砼构件', '米', 'Φ400', '砼预制', '', '9', '董满仓', '2020-08-19 14:55:41', null);
INSERT INTO `dtoa_material` VALUES ('1050', '112028', '墙挂排钩', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2020-08-19 15:32:58', null);
INSERT INTO `dtoa_material` VALUES ('1051', '10501010', '腰线', '125', '10501', '瓷砖', '片', '300*80', '', '', '9', '董满仓', '2020-08-20 10:02:01', null);
INSERT INTO `dtoa_material` VALUES ('1052', '10501011', '内墙瓷砖', '125', '10501', '瓷砖', '㎡', '240*660', '', '', '9', '董满仓', '2020-08-20 10:02:37', null);
INSERT INTO `dtoa_material` VALUES ('1053', '11004014', '镀锌线槽桥架', '110', '11004', '线槽桥架', '米', '150*100*6000*2.0', '', '', '9', '董满仓', '2020-08-20 10:04:35', null);
INSERT INTO `dtoa_material` VALUES ('1054', '11004015', '镀锌线槽桥架', '110', '11004', '线槽桥架', '米', '150*100*2000*1.2', '', '', '9', '董满仓', '2020-08-20 10:15:46', null);
INSERT INTO `dtoa_material` VALUES ('1055', '11115003', '沟槽弯头', '147', '11115', '沟槽管件', '个', 'DN100*90°', '', '', '9', '董满仓', '2020-08-20 10:18:00', '2021-01-27 16:22:42');
INSERT INTO `dtoa_material` VALUES ('1056', '10704006', '电焊锡锅', '120', '10704', '五金设备配件', '个', '', '', '', '9', '董满仓', '2020-08-20 10:19:04', null);
INSERT INTO `dtoa_material` VALUES ('1057', '11002037', '3P空开', '91', '11002', '电气辅材', '块', '380V63A', '', '', '9', '董满仓', '2020-09-02 09:04:49', null);
INSERT INTO `dtoa_material` VALUES ('1058', '11002038', '3P空开', '91', '11002', '电气辅材', '块', '380V40A', '', '', '9', '董满仓', '2020-09-02 09:06:17', null);
INSERT INTO `dtoa_material` VALUES ('1059', '11110045', 'PVC三通', '129', '11110', 'PVC管材管件', '个', 'Φ50', 'PVC', '', '9', '董满仓', '2020-09-02 09:06:47', null);
INSERT INTO `dtoa_material` VALUES ('1060', '11110046', 'PVC弯头', '129', '11110', 'PVC管材管件', '个', 'Φ50*90°', 'PVC', '', '9', '董满仓', '2020-09-02 09:09:52', null);
INSERT INTO `dtoa_material` VALUES ('1061', '11110047', 'PVC管箍', '129', '11110', 'PVC管材管件', '个', 'Φ50', 'PVC', '', '9', '董满仓', '2020-09-02 09:10:56', null);
INSERT INTO `dtoa_material` VALUES ('1062', '11110048', 'PVC管', '129', '11110', 'PVC管材管件', '米', 'Φ32', 'PVC', '', '9', '董满仓', '2020-09-02 09:16:02', null);
INSERT INTO `dtoa_material` VALUES ('1063', '11116006', '消防接口', '149', '11116', '消防管材管件（消耗）', '个', '65', '', '', '9', '董满仓', '2020-09-02 09:18:05', null);
INSERT INTO `dtoa_material` VALUES ('1064', '11102056', '铜截止阀', '93', '11102', '控水主材', '个', 'DN50', '铜', '', '9', '董满仓', '2020-09-02 09:18:53', null);
INSERT INTO `dtoa_material` VALUES ('1065', '11005017', '弯管防潮灯', '112', '11005', '灯具', '套', '', '', '', '9', '董满仓', '2020-09-14 09:08:26', null);
INSERT INTO `dtoa_material` VALUES ('1066', '11008016', '防水单联开关', '115', '11008', '电气设备安装材料', '个', '', '', '', '9', '董满仓', '2020-09-14 09:12:30', null);
INSERT INTO `dtoa_material` VALUES ('1067', '11006016', 'PVC六倍弯头', '113', '11006', 'PVC线管材件', '个', 'Φ40', '', '', '9', '董满仓', '2020-09-15 08:53:57', null);
INSERT INTO `dtoa_material` VALUES ('1068', '10702006', '手锤', '118', '10702', '五金工具', '把', '4P', '', '', '9', '董满仓', '2020-09-15 09:16:03', null);
INSERT INTO `dtoa_material` VALUES ('1069', '10702007', '钢丝钳', '118', '10702', '五金工具', '把', '', '', '', '9', '董满仓', '2020-09-15 09:16:30', null);
INSERT INTO `dtoa_material` VALUES ('1070', '112029', '电池', '41', '112', '低值易耗品', '节', '1#', '', '', '9', '董满仓', '2020-09-15 09:17:10', null);
INSERT INTO `dtoa_material` VALUES ('1071', '10701068', '水泥钉', '90', '10701', '五金材料', '盒', '40', '', '', '9', '董满仓', '2020-09-15 10:07:50', null);
INSERT INTO `dtoa_material` VALUES ('1072', '10701068', '水泥钉', '90', '10701', '五金材料', '盒', '50', '', '', '9', '董满仓', '2020-09-15 10:07:50', '2021-01-27 10:35:28');
INSERT INTO `dtoa_material` VALUES ('1073', '11102057', '沟槽蝶阀', '93', '11102', '控水主材', '个', 'DN100', '', '', '9', '董满仓', '2020-09-22 17:19:18', null);
INSERT INTO `dtoa_material` VALUES ('1074', '11115004', '沟槽卡箍', '147', '11115', '沟槽管件', '个', 'DN100', '', '', '9', '董满仓', '2020-09-22 17:20:08', null);
INSERT INTO `dtoa_material` VALUES ('1075', '11115005', '沟槽管堵', '147', '11115', '沟槽管件', '个', 'DN100', '', '', '9', '董满仓', '2020-09-22 17:20:58', null);
INSERT INTO `dtoa_material` VALUES ('1076', '11115006', '沟槽三通', '147', '11115', '沟槽管件', '个', 'DN100', '', '', '9', '董满仓', '2020-09-22 17:21:23', null);
INSERT INTO `dtoa_material` VALUES ('1077', '11115007', '沟槽机械三通', '147', '11115', '沟槽管件', '个', 'DN100*65', '', '', '9', '董满仓', '2020-09-22 17:21:47', null);
INSERT INTO `dtoa_material` VALUES ('1078', '11116007', '消防栓', '149', '11116', '消防管材管件（消耗）', '个', '65', '', '', '9', '董满仓', '2020-09-22 17:22:11', null);
INSERT INTO `dtoa_material` VALUES ('1079', '11101056', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN65', '热镀锌', '', '9', '董满仓', '2020-09-24 09:32:25', null);
INSERT INTO `dtoa_material` VALUES ('1080', '11101057', '镀锌对丝', '92', '11101', '镀锌管件', '个', 'DN65', '热镀锌', '', '9', '董满仓', '2020-09-24 09:33:27', null);
INSERT INTO `dtoa_material` VALUES ('1081', '11101058', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN65*15', '热镀锌', '', '9', '董满仓', '2020-09-24 09:33:53', null);
INSERT INTO `dtoa_material` VALUES ('1082', '11101059', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN65*25', '热镀锌', '', '9', '董满仓', '2020-09-24 09:34:24', null);
INSERT INTO `dtoa_material` VALUES ('1083', '10703004', '焊接冲压弯头', '119', '10703', '焊接冲压管件', '个', '100*90°', '熟铁', '', '9', '董满仓', '2020-09-24 09:34:54', null);
INSERT INTO `dtoa_material` VALUES ('1084', '10703005', '焊接冲压弯头', '119', '10703', '焊接冲压管件', '个', '100*45°', '熟铁', '', '9', '董满仓', '2020-09-24 09:49:11', null);
INSERT INTO `dtoa_material` VALUES ('1085', '11115008', '沟槽大小头', '147', '11115', '沟槽管件', '个', '100*50', '', '', '9', '董满仓', '2020-09-24 09:49:51', null);
INSERT INTO `dtoa_material` VALUES ('1086', '11102058', '铜球阀', '93', '11102', '控水主材', '个', 'DN50', '', '', '9', '董满仓', '2020-09-24 09:52:51', null);
INSERT INTO `dtoa_material` VALUES ('1087', '11101060', '镀锌油任活接', '92', '11101', '镀锌管件', '个', 'DN50', '热镀锌', '', '9', '董满仓', '2020-09-24 09:53:55', null);
INSERT INTO `dtoa_material` VALUES ('1088', '11101061', '镀锌对丝', '92', '11101', '镀锌管件', '个', 'DN50', '热镀锌', '', '9', '董满仓', '2020-09-24 09:59:17', null);
INSERT INTO `dtoa_material` VALUES ('1089', '10503005', '勾缝剂', '134', '10503', '小型材料', '盒', '2KG', '', '', '9', '董满仓', '2020-09-24 16:21:35', null);
INSERT INTO `dtoa_material` VALUES ('1090', '10701069', '镀锌螺母', '90', '10701', '五金材料', '个', 'M8', '', '', '9', '董满仓', '2020-09-24 16:23:33', null);
INSERT INTO `dtoa_material` VALUES ('1091', '10701070', '镀锌螺母', '90', '10701', '五金材料', '个', 'M6', '', '', '9', '董满仓', '2020-09-24 16:25:06', null);
INSERT INTO `dtoa_material` VALUES ('1092', '113028', 'U盘', '88', '113', '办公用品', '个', '64G', '', '', '9', '董满仓', '2020-09-25 09:10:23', null);
INSERT INTO `dtoa_material` VALUES ('1093', '113029', 'U盘', '88', '113', '办公用品', '个', '32G', '', '', '9', '董满仓', '2020-09-25 09:11:16', null);
INSERT INTO `dtoa_material` VALUES ('1094', '404002', '楼梯扶手', '144', '404', '扶手栏杆', '米', '900mm', 'Q235', '', '9', '董满仓', '2020-10-14 08:53:09', null);
INSERT INTO `dtoa_material` VALUES ('1095', '404003', '楼梯扶手', '144', '404', '扶手栏杆', '米', '1200mm', 'Q235', '', '9', '董满仓', '2020-10-14 08:55:18', null);
INSERT INTO `dtoa_material` VALUES ('1096', '404004', '铁栏杆', '144', '404', '扶手栏杆', '米', '1250mm', 'Q235', '', '9', '董满仓', '2020-10-14 08:55:45', null);
INSERT INTO `dtoa_material` VALUES ('1097', '11113013', '暖气拉条', '132', '11113', '散热器', '组', '每组4根', '', '', '9', '董满仓', '2020-10-14 09:42:21', null);
INSERT INTO `dtoa_material` VALUES ('1098', '11102059', '铜截止阀', '93', '11102', '控水主材', '个', 'DN40', '铸铜', '', '9', '董满仓', '2020-10-14 09:43:38', null);
INSERT INTO `dtoa_material` VALUES ('1099', '11101062', '镀锌弯头', '92', '11101', '镀锌管件', '个', 'DN25', '热镀锌', '', '9', '董满仓', '2020-10-14 09:47:15', null);
INSERT INTO `dtoa_material` VALUES ('1100', '11101063', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN25', '热镀锌', '', '9', '董满仓', '2020-10-14 09:51:56', null);
INSERT INTO `dtoa_material` VALUES ('1101', '11101064', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN32*25', '热镀锌', '', '9', '董满仓', '2020-10-14 09:58:15', null);
INSERT INTO `dtoa_material` VALUES ('1102', '11101065', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN25*20', '热镀锌', '', '9', '董满仓', '2020-10-14 10:03:45', null);
INSERT INTO `dtoa_material` VALUES ('1103', '10701071', '万能吊卡', '90', '10701', '五金材料', '个', '40', '', '', '9', '董满仓', '2020-10-14 10:04:15', null);
INSERT INTO `dtoa_material` VALUES ('1104', '10701072', '万能吊卡', '90', '10701', '五金材料', '个', '32', '', '', '9', '董满仓', '2020-10-14 10:31:40', null);
INSERT INTO `dtoa_material` VALUES ('1105', '10701073', '万能吊卡', '90', '10701', '五金材料', '个', '25', '', '', '9', '董满仓', '2020-10-14 10:31:54', null);
INSERT INTO `dtoa_material` VALUES ('1106', '10701074', '万能吊卡', '90', '10701', '五金材料', '个', '20', '', '', '9', '董满仓', '2020-10-14 10:32:07', null);
INSERT INTO `dtoa_material` VALUES ('1107', '11109041', 'U型卡', '122', '11109', '水暖辅材', '套', 'DN20', '', '', '9', '董满仓', '2020-10-14 14:50:44', null);
INSERT INTO `dtoa_material` VALUES ('1108', '10701075', '螺母', '90', '10701', '五金材料', '个', 'M10', '', '', '9', '董满仓', '2020-10-14 14:53:06', null);
INSERT INTO `dtoa_material` VALUES ('1109', '10701076', '开尾销子', '90', '10701', '五金材料', '个', 'M10*40', '', '', '9', '董满仓', '2020-10-14 16:52:34', null);
INSERT INTO `dtoa_material` VALUES ('1110', '112030', '医药箱', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2020-11-06 08:23:59', null);
INSERT INTO `dtoa_material` VALUES ('1111', '30202009', '锥桶', '47', '30202', '文明施工', '个', '', '', '', '9', '董满仓', '2020-11-06 08:25:27', null);
INSERT INTO `dtoa_material` VALUES ('1112', '112031', '塔尺', '41', '112', '低值易耗品', '把', '5米', '铝合金', '', '9', '董满仓', '2020-11-06 08:25:59', null);
INSERT INTO `dtoa_material` VALUES ('1113', '112032', '水平仪检修', '41', '112', '低值易耗品', '台', '', '', '', '9', '董满仓', '2020-11-06 08:27:35', null);
INSERT INTO `dtoa_material` VALUES ('1114', '112033', '胸卡套', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2020-11-06 08:28:03', null);
INSERT INTO `dtoa_material` VALUES ('1115', '11007039', 'RVV护套线', '114', '11007', '电线电缆', '米', 'RVV3*1.5', '铜', '', '9', '董满仓', '2020-11-09 14:55:06', null);
INSERT INTO `dtoa_material` VALUES ('1116', '11005018', 'LED灯泡', '112', '11005', '灯具', '个', '150W', '', '', '9', '董满仓', '2020-11-09 14:57:20', null);
INSERT INTO `dtoa_material` VALUES ('1117', '11101066', '镀锌对丝', '92', '11101', '镀锌管件', '个', 'DN25', '热镀锌', '', '9', '董满仓', '2020-11-09 14:58:11', null);
INSERT INTO `dtoa_material` VALUES ('1118', '11001028', '瓷柱绝缘子', '59', '11001', '管线敷设', '个', '', '', '', '9', '董满仓', '2020-11-12 08:38:40', null);
INSERT INTO `dtoa_material` VALUES ('1119', '11001029', '瓷柱绝缘子卡座', '59', '11001', '管线敷设', '个', '', '', '', '9', '董满仓', '2020-11-12 08:44:13', null);
INSERT INTO `dtoa_material` VALUES ('1120', '11007040', 'YJV电缆', '114', '11007', '电线电缆', '米', '4*25', '', '', '9', '董满仓', '2020-11-12 08:45:29', null);
INSERT INTO `dtoa_material` VALUES ('1121', '11007041', 'BV塑铜线', '114', '11007', '电线电缆', '米', '10mm²', '', '', '9', '董满仓', '2020-11-12 09:01:09', null);
INSERT INTO `dtoa_material` VALUES ('1122', '11007042', 'BV塑铜线', '114', '11007', '电线电缆', '米', '16mm²', '', '', '9', '董满仓', '2020-11-12 09:03:34', null);
INSERT INTO `dtoa_material` VALUES ('1123', '11007043', '电视信号线', '114', '11007', '电线电缆', '米', '', '', '', '9', '董满仓', '2020-11-12 09:09:26', null);
INSERT INTO `dtoa_material` VALUES ('1124', '11005019', '灯口', '112', '11005', '灯具', '个', '', '', '', '9', '董满仓', '2020-11-12 09:10:05', null);
INSERT INTO `dtoa_material` VALUES ('1125', '11005020', 'LED灯泡', '112', '11005', '灯具', '个', '100W', '', '', '9', '董满仓', '2020-11-12 09:11:01', null);
INSERT INTO `dtoa_material` VALUES ('1126', '11110049', 'PVC弯头', '129', '11110', 'PVC管材管件', '个', 'Φ200*90°', 'PVC', '', '9', '董满仓', '2020-11-12 09:24:17', null);
INSERT INTO `dtoa_material` VALUES ('1127', '11005021', 'LED投光灯', '112', '11005', '灯具', '个', '150W', '', '', '9', '董满仓', '2020-11-12 09:25:15', null);
INSERT INTO `dtoa_material` VALUES ('1128', '11004016', '镀锌线槽桥架', '110', '11004', '线槽桥架', '米', '150*50*1.2', '', '', '9', '董满仓', '2020-11-12 09:59:35', null);
INSERT INTO `dtoa_material` VALUES ('1129', '11006017', 'PVC线槽', '113', '11006', 'PVC线管材件', '米', '40*60', '', '', '9', '董满仓', '2020-11-12 10:10:06', null);
INSERT INTO `dtoa_material` VALUES ('1130', '11003039', '明装箱', '105', '11003', '电箱', '台', '580*320*160', '', '', '9', '董满仓', '2020-11-16 14:12:43', null);
INSERT INTO `dtoa_material` VALUES ('1131', '11003040', '明装箱', '105', '11003', '电箱', '台', '450*320*160', '', '', '9', '董满仓', '2020-11-16 14:14:50', null);
INSERT INTO `dtoa_material` VALUES ('1132', '10403002', '蒸压加气块', '101', '10403', '砌块砖等', '方', '150*240*600', '', '', '9', '董满仓', '2020-11-26 10:14:59', null);
INSERT INTO `dtoa_material` VALUES ('1133', '10403003', '灰渣砖', '101', '10403', '砌块砖等', '块', '230*110*45', '', '', '9', '董满仓', '2020-11-26 10:17:25', null);
INSERT INTO `dtoa_material` VALUES ('1134', '10403004', '蒸压加气块', '101', '10403', '砌块砖等', '方', '200*240*600', '', '', '9', '董满仓', '2020-11-26 10:18:52', null);
INSERT INTO `dtoa_material` VALUES ('1135', '10403005', '蒸压加气块', '101', '10403', '砌块砖等', '方', '100*240*600', '', '', '9', '董满仓', '2020-11-26 10:19:28', null);
INSERT INTO `dtoa_material` VALUES ('1136', '10403006', '蒸压加气块', '101', '10403', '砌块砖等', '方', '180*240*600', '', '', '9', '董满仓', '2020-11-26 10:19:47', null);
INSERT INTO `dtoa_material` VALUES ('1137', '10403007', '蒸压加气块', '101', '10403', '砌块砖等', '方', '120*240*600', '', '', '9', '董满仓', '2020-11-26 10:20:05', null);
INSERT INTO `dtoa_material` VALUES ('1138', '10403008', '蒸压加气块', '101', '10403', '砌块砖等', '方', '240*240*600', '', '', '9', '董满仓', '2020-11-26 10:20:37', null);
INSERT INTO `dtoa_material` VALUES ('1139', '10406003', '道牙路沿石', '133', '10406', '砼构件', '块', '500*300*100', '砼预制', '', '9', '董满仓', '2020-11-26 10:21:03', null);
INSERT INTO `dtoa_material` VALUES ('1140', '10406004', '道牙路沿石', '133', '10406', '砼构件', '块', '500*200*100', '砼预制', '', '9', '董满仓', '2020-11-26 10:26:05', null);
INSERT INTO `dtoa_material` VALUES ('1141', '10406005', '道牙路沿石', '133', '10406', '砼构件', '块', '250*300*100', '砼预制', '', '9', '董满仓', '2020-11-26 10:26:31', null);
INSERT INTO `dtoa_material` VALUES ('1142', '10406006', '水泥管', '133', '10406', '砼构件', '米', 'Φ600', '砼预制', '', '9', '董满仓', '2020-11-26 10:26:56', null);
INSERT INTO `dtoa_material` VALUES ('1143', '10406007', '水泥管', '133', '10406', '砼构件', '米', 'Φ500', '砼预制', '', '9', '董满仓', '2020-11-26 10:28:03', null);
INSERT INTO `dtoa_material` VALUES ('1144', '10406008', '水泥管', '133', '10406', '砼构件', '米', 'Φ400', '砼预制', '', '9', '董满仓', '2020-11-26 10:28:32', null);
INSERT INTO `dtoa_material` VALUES ('1145', '10406009', '水泥管', '133', '10406', '砼构件', '米', 'Φ300', '砼预制', '', '9', '董满仓', '2020-11-26 10:28:54', null);
INSERT INTO `dtoa_material` VALUES ('1146', '10406010', '水泥管', '133', '10406', '砼构件', '米', 'Φ200', '砼预制', '', '9', '董满仓', '2020-11-26 10:29:15', null);
INSERT INTO `dtoa_material` VALUES ('1147', '10403009', '透水砖', '101', '10403', '砌块砖等', '块', '15*30*6', '', '', '9', '董满仓', '2020-11-26 10:29:33', null);
INSERT INTO `dtoa_material` VALUES ('1148', '10403010', '透水砖', '101', '10403', '砌块砖等', '块', '10*20*6', '', '', '9', '董满仓', '2020-11-26 10:30:01', null);
INSERT INTO `dtoa_material` VALUES ('1149', '10403011', '透水砖', '101', '10403', '砌块砖等', '块', '20*40*6', '', '', '9', '董满仓', '2020-11-26 10:30:20', null);
INSERT INTO `dtoa_material` VALUES ('1150', '10405008', '抗裂砂浆', '103', '10405', '砂浆', '吨', '', '', '', '9', '董满仓', '2020-11-26 10:30:41', null);
INSERT INTO `dtoa_material` VALUES ('1151', '10405009', '玻珠保温砂浆', '103', '10405', '砂浆', '方', 'FTC', '', '', '9', '董满仓', '2020-11-26 10:31:29', null);
INSERT INTO `dtoa_material` VALUES ('1152', '10405010', '地面砂浆', '103', '10405', '砂浆', '吨', 'M20', '', '', '9', '董满仓', '2020-11-26 10:31:59', null);
INSERT INTO `dtoa_material` VALUES ('1153', '10405011', '抹面砂浆', '103', '10405', '砂浆', '吨', '', '', '', '9', '董满仓', '2020-11-26 10:32:21', null);
INSERT INTO `dtoa_material` VALUES ('1154', '30202010', '渣土消纳', '47', '30202', '文明施工', '车', '六轮自卸车', '', '', '9', '董满仓', '2020-11-26 16:04:49', null);
INSERT INTO `dtoa_material` VALUES ('1155', '10602001', '钢质隔热防火门', '153', '10602', '防火门', '㎡', '甲级', '', '', '9', '董满仓', '2020-12-08 10:27:34', null);
INSERT INTO `dtoa_material` VALUES ('1156', '10602002', '钢质隔热防火门', '153', '10602', '防火门', '㎡', '乙级', '', '', '9', '董满仓', '2020-12-08 10:28:57', '2021-04-20 09:21:36');
INSERT INTO `dtoa_material` VALUES ('1157', '10602003', '钢质隔热防火门', '153', '10602', '防火门', '㎡', '丙级', '', '', '9', '董满仓', '2020-12-08 10:29:33', null);
INSERT INTO `dtoa_material` VALUES ('1158', '10701077', '膨胀螺栓', '90', '10701', '五金材料', '个', '12*150', '金属', '', '9', '董满仓', '2020-12-10 16:54:11', null);
INSERT INTO `dtoa_material` VALUES ('1159', '11007044', 'YJV电缆', '114', '11007', '电线电缆', '米', '4*16+1*10', '铜', '', '9', '董满仓', '2020-12-13 08:42:16', null);
INSERT INTO `dtoa_material` VALUES ('1160', '10701078', '塑料阳角线', '90', '10701', '五金材料', '根', '2.4米', '塑料', '', '9', '董满仓', '2020-12-13 10:10:44', null);
INSERT INTO `dtoa_material` VALUES ('1161', '1010403004', '镀锌圆钢', '143', '1010403', '圆钢', '米', 'Φ14', '', '', '9', '董满仓', '2020-12-13 10:12:04', null);
INSERT INTO `dtoa_material` VALUES ('1162', '1010201002', '槽钢', '55', '1010201', '槽钢', '米', '50', '', '', '9', '董满仓', '2020-12-13 10:24:05', '2020-12-15 09:36:12');
INSERT INTO `dtoa_material` VALUES ('1163', '1010201003', '槽钢', '55', '1010201', '槽钢', '米', '160*100', '', '', '9', '董满仓', '2020-12-15 08:54:44', '2020-12-15 09:36:12');
INSERT INTO `dtoa_material` VALUES ('1164', '1010204004', '角钢', '135', '1010204', '角钢', '米', '30*3', '', '', '9', '董满仓', '2020-12-15 08:55:23', null);
INSERT INTO `dtoa_material` VALUES ('1165', '1010201004', '槽钢', '55', '1010201', '槽钢', '米', '80*8', '', '', '9', '董满仓', '2020-12-15 09:32:25', '2020-12-15 09:36:12');
INSERT INTO `dtoa_material` VALUES ('1166', '10701079', '万向轮', '90', '10701', '五金材料', '个', 'Φ100', '', '', '9', '董满仓', '2020-12-16 08:44:04', null);
INSERT INTO `dtoa_material` VALUES ('1167', '10701080', '地插销', '90', '10701', '五金材料', '个', '', '', '', '9', '董满仓', '2020-12-16 08:46:08', null);
INSERT INTO `dtoa_material` VALUES ('1168', '10701081', '大门插销', '90', '10701', '五金材料', '个', '', '', '', '9', '董满仓', '2020-12-16 08:47:19', null);
INSERT INTO `dtoa_material` VALUES ('1169', '1010302001', '镀锌铁板', '154', '1010302', '板材', '张', '2m*1m*1.2mm', '铁', '', '9', '董满仓', '2020-12-16 08:49:01', '2020-12-16 08:50:46');
INSERT INTO `dtoa_material` VALUES ('1170', '10701082', '拉铆钉', '90', '10701', '五金材料', '盒', '4*16*200个', '', '', '9', '董满仓', '2020-12-16 08:50:46', '2020-12-16 08:56:58');
INSERT INTO `dtoa_material` VALUES ('1171', '10701083', '麻花钻头', '90', '10701', '五金材料', '个', 'M4.2', '', '', '9', '董满仓', '2020-12-16 08:55:01', null);
INSERT INTO `dtoa_material` VALUES ('1172', '10701084', '门拉手', '90', '10701', '五金材料', '个', '', '', '', '9', '董满仓', '2020-12-16 08:56:59', null);
INSERT INTO `dtoa_material` VALUES ('1173', '10701085', '合金锯片', '90', '10701', '五金材料', '片', 'Φ350', '金刚合金', '', '9', '董满仓', '2020-12-16 08:59:12', null);
INSERT INTO `dtoa_material` VALUES ('1174', '10703006', '焊接三通', '119', '10703', '焊接冲压管件', '个', '150*150', '熟铁', '', '9', '董满仓', '2020-12-16 13:27:41', null);
INSERT INTO `dtoa_material` VALUES ('1175', '10703007', '焊接三通', '119', '10703', '焊接冲压管件', '个', '100*100', '熟铁', '', '9', '董满仓', '2020-12-16 13:33:37', null);
INSERT INTO `dtoa_material` VALUES ('1176', '10703008', '焊接冲压弯头', '119', '10703', '焊接冲压管件', '个', '150*45°', '熟铁', '', '9', '董满仓', '2020-12-16 13:34:02', null);
INSERT INTO `dtoa_material` VALUES ('1177', '11102060', '焊接法兰盘', '93', '11102', '控水主材', '片', '150', '', '', '9', '董满仓', '2020-12-16 13:34:34', null);
INSERT INTO `dtoa_material` VALUES ('1178', '11102061', '焊接法兰盘', '93', '11102', '控水主材', '片', '100', '', '', '9', '董满仓', '2020-12-16 13:35:59', null);
INSERT INTO `dtoa_material` VALUES ('1179', '11102062', '法兰盲板', '93', '11102', '控水主材', '片', 'DN100', '', '', '9', '董满仓', '2020-12-16 13:36:21', null);
INSERT INTO `dtoa_material` VALUES ('1180', '10703009', '焊接管帽', '119', '10703', '焊接冲压管件', '个', 'DN100', '熟铁', '', '9', '董满仓', '2020-12-16 13:37:09', null);
INSERT INTO `dtoa_material` VALUES ('1181', '10703010', '焊接管帽', '119', '10703', '焊接冲压管件', '个', 'DN150', '熟铁', '', '9', '董满仓', '2020-12-16 14:01:46', null);
INSERT INTO `dtoa_material` VALUES ('1182', '10703011', '焊接管帽', '119', '10703', '焊接冲压管件', '个', 'DN80', '熟铁', '', '9', '董满仓', '2020-12-16 14:02:20', null);
INSERT INTO `dtoa_material` VALUES ('1183', '10703012', '焊接管帽', '119', '10703', '焊接冲压管件', '个', 'DN65', '熟铁', '', '9', '董满仓', '2020-12-16 14:02:39', null);
INSERT INTO `dtoa_material` VALUES ('1184', '10703013', '焊接管帽', '119', '10703', '焊接冲压管件', '个', 'DN50', '熟铁', '', '9', '董满仓', '2020-12-16 14:02:58', null);
INSERT INTO `dtoa_material` VALUES ('1185', '10701086', '合金锯片', '90', '10701', '五金材料', '片', '108*20*1.8mm', '合金钢', '', '9', '董满仓', '2020-12-16 14:03:21', null);
INSERT INTO `dtoa_material` VALUES ('1186', '11003041', 'ALE1明装箱', '105', '11003', '电箱', '台', '600*800*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 11:01:47', '2020-12-18 11:16:04');
INSERT INTO `dtoa_material` VALUES ('1187', '11003042', 'AT-DT暗装箱', '105', '11003', '电箱', '台', '600*800*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 11:05:41', '2020-12-18 11:16:17');
INSERT INTO `dtoa_material` VALUES ('1188', '11003043', 'ATWD-PY明装箱', '105', '11003', '电箱', '台', '600*800*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 11:06:42', '2020-12-18 11:16:30');
INSERT INTO `dtoa_material` VALUES ('1189', '11003044', 'AW2明装箱', '105', '11003', '电箱', '台', '600*900*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 11:08:44', '2020-12-18 11:16:41');
INSERT INTO `dtoa_material` VALUES ('1190', '11003045', 'AW3明装箱', '105', '11003', '电箱', '台', '600*900*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 11:16:42', null);
INSERT INTO `dtoa_material` VALUES ('1191', '11003046', 'AW1明装箱', '105', '11003', '电箱', '台', '600*900*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 11:17:26', null);
INSERT INTO `dtoa_material` VALUES ('1192', '11003047', 'AL3-1明装箱', '105', '11003', '电箱', '台', '400*500*150', '金属壳', '含芯', '1', '管理员', '2020-12-18 11:18:22', null);
INSERT INTO `dtoa_material` VALUES ('1193', '11003048', 'AL2-1明装箱', '105', '11003', '电箱', '台', '400*500*150', '金属壳', '含芯', '1', '管理员', '2020-12-18 11:20:46', null);
INSERT INTO `dtoa_material` VALUES ('1194', '11003049', 'AA1配电柜', '105', '11003', '电箱', '台', '800*2200*600', '金属', '含芯', '1', '管理员', '2020-12-18 11:31:23', null);
INSERT INTO `dtoa_material` VALUES ('1195', '11003050', 'AA3配电柜', '105', '11003', '电箱', '台', '800*2200*600', '金属', '含芯', '1', '管理员', '2020-12-18 13:52:04', null);
INSERT INTO `dtoa_material` VALUES ('1196', '11003051', 'AA4配电柜', '105', '11003', '电箱', '台', '800*2200*600', '金属', '含芯', '1', '管理员', '2020-12-18 14:08:28', null);
INSERT INTO `dtoa_material` VALUES ('1197', '11003052', '1AT-YJ明装箱', '105', '11003', '电箱', '台', '600*800*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 14:09:01', null);
INSERT INTO `dtoa_material` VALUES ('1198', '11003053', '1AT-XF明装箱', '105', '11003', '电箱', '台', '600*800*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 14:09:54', null);
INSERT INTO `dtoa_material` VALUES ('1199', '11003054', '2-2AF-DY明装箱', '105', '11003', '电箱', '台', '600*800*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 14:10:41', null);
INSERT INTO `dtoa_material` VALUES ('1200', '11003055', '2-3AT-DY明装箱', '105', '11003', '电箱', '台', '600*800*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 14:11:56', null);
INSERT INTO `dtoa_material` VALUES ('1201', '11003056', '2-2ALZ明装箱', '105', '11003', '电箱', '台', '700*900*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 14:20:25', null);
INSERT INTO `dtoa_material` VALUES ('1202', '11003057', '2-1AL-RD明装箱', '105', '11003', '电箱', '台', '450*300*120', '金属壳', '含芯', '1', '管理员', '2020-12-18 14:21:40', null);
INSERT INTO `dtoa_material` VALUES ('1203', '11003058', 'ALc 暗装箱', '105', '11003', '电箱', '台', '450*500*120', '金属壳', '含芯', '1', '管理员', '2020-12-18 14:22:51', null);
INSERT INTO `dtoa_material` VALUES ('1204', '11003059', 'ALa 暗装箱', '105', '11003', '电箱', '台', '500*350*120', '金属壳', '含芯', '1', '管理员', '2020-12-18 14:50:38', null);
INSERT INTO `dtoa_material` VALUES ('1205', '11003060', '2-1AL-CT暗装箱', '105', '11003', '电箱', '台', '600*800*160', '金属壳', '含芯', '1', '管理员', '2020-12-18 14:51:10', null);
INSERT INTO `dtoa_material` VALUES ('1206', '11003061', '2-1AL-DT暗装箱', '105', '11003', '电箱', '台', '600*800*160', '金属壳', '含芯', '1', '管理员', '2020-12-18 14:52:11', null);
INSERT INTO `dtoa_material` VALUES ('1207', '11003062', '2-1AL-WY暗装箱', '105', '11003', '电箱', '台', '600*800*160', '金属壳', '含芯', '1', '管理员', '2020-12-18 14:52:51', null);
INSERT INTO `dtoa_material` VALUES ('1208', '11003063', '2-1ALZ明装箱', '105', '11003', '电箱', '台', '600*900*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 14:53:29', null);
INSERT INTO `dtoa_material` VALUES ('1209', '11003064', '2-2AL-GG1暗装箱', '105', '11003', '电箱', '台', '600*800*160', '金属壳', '含芯', '1', '管理员', '2020-12-18 14:54:17', null);
INSERT INTO `dtoa_material` VALUES ('1210', '11003065', '2-3AL-GG1暗装箱', '105', '11003', '电箱', '台', '600*800*160', '金属壳', '含芯', '1', '管理员', '2020-12-18 14:55:08', null);
INSERT INTO `dtoa_material` VALUES ('1211', '11003066', '2-2AL-GG2暗装箱', '105', '11003', '电箱', '台', '600*800*160', '金属壳', '含芯', '1', '管理员', '2020-12-18 14:56:25', null);
INSERT INTO `dtoa_material` VALUES ('1212', '11003067', '2-3AL-GG2暗装箱', '105', '11003', '电箱', '台', '600*800*160', '金属壳', '含芯', '1', '管理员', '2020-12-18 14:57:59', null);
INSERT INTO `dtoa_material` VALUES ('1213', '11003068', '2-4AT-DT1明装箱', '105', '11003', '电箱', '台', '600*800*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 15:01:14', null);
INSERT INTO `dtoa_material` VALUES ('1214', '11003069', '2-4AT-DT2明装箱', '105', '11003', '电箱', '台', '600*800*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 15:01:56', null);
INSERT INTO `dtoa_material` VALUES ('1215', '11003070', '2-1AT-AF明装箱', '105', '11003', '电箱', '台', '600*800*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 15:02:52', null);
INSERT INTO `dtoa_material` VALUES ('1216', '11003071', '3-4AT-DT1明装箱', '105', '11003', '电箱', '台', '600*800*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 15:03:35', null);
INSERT INTO `dtoa_material` VALUES ('1217', '11003072', '3-4AT-DT2明装箱', '105', '11003', '电箱', '台', '600*800*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 15:04:16', null);
INSERT INTO `dtoa_material` VALUES ('1218', '11003073', '3-1AL-GG1明装箱', '105', '11003', '电箱', '台', '600*800*160', '金属壳', '含芯', '1', '管理员', '2020-12-18 15:05:00', null);
INSERT INTO `dtoa_material` VALUES ('1219', '11003074', '3-1AL-RD明装箱', '105', '11003', '电箱', '台', '450*350*120', '金属壳', '含芯', '1', '管理员', '2020-12-18 15:07:28', null);
INSERT INTO `dtoa_material` VALUES ('1220', '11003075', '3-2AL-1暗装箱', '105', '11003', '电箱', '台', '500*600*150', '金属壳', '含芯', '1', '管理员', '2020-12-18 15:26:04', null);
INSERT INTO `dtoa_material` VALUES ('1221', '11003076', '3-4AL-1暗装箱', '105', '11003', '电箱', '台', '500*600*150', '金属壳', '含芯', '1', '管理员', '2020-12-18 15:30:32', null);
INSERT INTO `dtoa_material` VALUES ('1222', '11003077', '3-3AL-1暗装箱', '105', '11003', '电箱', '台', '600*800*150', '金属壳', '含芯', '1', '管理员', '2020-12-18 15:31:16', null);
INSERT INTO `dtoa_material` VALUES ('1223', '11003078', '1AT-YJ明装箱', '105', '11003', '电箱', '台', '600*800*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 15:32:09', null);
INSERT INTO `dtoa_material` VALUES ('1224', '11003079', '3-1ALZ1明装箱', '105', '11003', '电箱', '台', '600*900*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 15:33:10', null);
INSERT INTO `dtoa_material` VALUES ('1225', '11003080', '3-1ALZ2明装箱', '105', '11003', '电箱', '台', '600*900*200', '金属壳', '含芯', '1', '管理员', '2020-12-18 15:33:53', null);
INSERT INTO `dtoa_material` VALUES ('1226', '11003081', 'APZ1配电柜', '105', '11003', '电箱', '台', '800*2200*600', '金属', '含芯', '1', '管理员', '2020-12-18 15:34:31', null);
INSERT INTO `dtoa_material` VALUES ('1227', '11003082', 'APZ2配电柜', '105', '11003', '电箱', '台', '800*2200*600', '金属', '含芯', '1', '管理员', '2020-12-18 15:35:10', null);
INSERT INTO `dtoa_material` VALUES ('1228', '11003083', 'APZ3配电柜', '105', '11003', '电箱', '台', '800*2200*600', '金属', '含芯', '1', '管理员', '2020-12-18 15:35:47', null);
INSERT INTO `dtoa_material` VALUES ('1229', '11003084', 'ALZ1配电柜', '105', '11003', '电箱', '台', '800*2200*600', '金属', '含芯', '1', '管理员', '2020-12-18 15:36:44', null);
INSERT INTO `dtoa_material` VALUES ('1230', '11003085', 'ALZ2配电柜', '105', '11003', '电箱', '台', '800*2200*600', '金属', '含芯', '1', '管理员', '2020-12-18 15:37:50', null);
INSERT INTO `dtoa_material` VALUES ('1231', '11003086', 'ALZ3配电柜', '105', '11003', '电箱', '台', '800*2200*600', '金属', '含芯', '1', '管理员', '2020-12-18 15:38:51', null);
INSERT INTO `dtoa_material` VALUES ('1232', '11003087', 'B1AT-XFB配电柜', '105', '11003', '电箱', '台', '1000*2200*600', '金属', '含芯', '1', '管理员', '2020-12-18 15:39:47', null);
INSERT INTO `dtoa_material` VALUES ('1233', '11003088', 'B1AT-XFB配电柜', '105', '11003', '电箱', '台', '800*2200*600', '金属', '含芯', '1', '管理员', '2020-12-18 15:40:45', null);
INSERT INTO `dtoa_material` VALUES ('1234', '10701087', '镐钎', '90', '10701', '五金材料', '个', '65', '', '', '1', '管理员', '2020-12-20 10:37:49', null);
INSERT INTO `dtoa_material` VALUES ('1235', '11102063', '铸铁球阀', '93', '11102', '控水主材', '个', 'DN40', '铸铁', '', '1', '管理员', '2020-12-20 10:38:26', null);
INSERT INTO `dtoa_material` VALUES ('1236', '11102064', 'PPR双活接球阀', '93', '11102', '控水主材', '个', 'DN32', '', '', '1', '管理员', '2020-12-20 10:39:17', null);
INSERT INTO `dtoa_material` VALUES ('1237', '11005022', '单管日光灯', '112', '11005', '灯具', '套', '1*40W', '', '', '1', '管理员', '2020-12-24 10:04:07', null);
INSERT INTO `dtoa_material` VALUES ('1238', '11008017', '时控开关', '115', '11008', '电气设备安装材料', '个', '', '', '', '1', '管理员', '2020-12-24 10:05:14', null);
INSERT INTO `dtoa_material` VALUES ('1239', '11008018', '轨道漏电保护器', '115', '11008', '电气设备安装材料', '块', '2P10A', '', '', '1', '管理员', '2020-12-24 10:06:09', null);
INSERT INTO `dtoa_material` VALUES ('1240', '11008019', '轨道漏电保护器', '115', '11008', '电气设备安装材料', '块', '2P32A', '', '', '1', '管理员', '2020-12-24 10:08:32', null);
INSERT INTO `dtoa_material` VALUES ('1241', '11008020', '轨道漏电保护器', '115', '11008', '电气设备安装材料', '块', '2P40A', '', '', '1', '管理员', '2020-12-24 10:09:35', null);
INSERT INTO `dtoa_material` VALUES ('1242', '11005023', '防爆灯', '112', '11005', '灯具', '个', '60W', '', '', '1', '管理员', '2020-12-24 10:10:36', null);
INSERT INTO `dtoa_material` VALUES ('1243', '11005024', 'LED灯泡', '112', '11005', '灯具', '个', '23W', '', '', '1', '管理员', '2020-12-24 10:17:28', null);
INSERT INTO `dtoa_material` VALUES ('1244', '11005025', '单管消毒灯', '112', '11005', '灯具', '套', '40W', '', '', '1', '管理员', '2020-12-24 10:17:59', null);
INSERT INTO `dtoa_material` VALUES ('1245', '11001030', '镀锌明装线盒', '59', '11001', '管线敷设', '个', '', '', '', '1', '管理员', '2020-12-24 10:18:47', null);
INSERT INTO `dtoa_material` VALUES ('1246', '112034', '石笔', '41', '112', '低值易耗品', '盒', '', '', '', '1', '管理员', '2020-12-24 10:24:09', null);
INSERT INTO `dtoa_material` VALUES ('1247', '10701088', '镀锌铁丝', '90', '10701', '五金材料', 'KG', '10#', '铁', '', '1', '管理员', '2020-12-24 10:25:01', '2020-12-24 10:50:43');
INSERT INTO `dtoa_material` VALUES ('1248', '11008021', '轨道空开', '115', '11008', '电气设备安装材料', '块', '1P20A', '', '', '1', '管理员', '2020-12-24 10:26:26', null);
INSERT INTO `dtoa_material` VALUES ('1249', '11008022', '轨道漏电保护器', '115', '11008', '电气设备安装材料', '块', '1P+N20A', '', '', '1', '管理员', '2020-12-24 10:50:44', null);
INSERT INTO `dtoa_material` VALUES ('1250', '10705004', '穿墙螺栓', '121', '10705', '金属构件', '根', 'M14*1800mm', '', '', '1', '管理员', '2020-12-24 10:53:37', null);
INSERT INTO `dtoa_material` VALUES ('1251', '10705005', '穿墙螺栓', '121', '10705', '金属构件', '根', 'M14*1500mm', '', '', '1', '管理员', '2020-12-24 10:55:38', null);
INSERT INTO `dtoa_material` VALUES ('1252', '10705006', '穿墙螺栓', '121', '10705', '金属构件', '根', 'M14*1200mm', '', '', '1', '管理员', '2020-12-24 10:57:28', null);
INSERT INTO `dtoa_material` VALUES ('1253', '10701089', '山形螺母', '90', '10701', '五金材料', '个', 'M14', '', '', '1', '管理员', '2020-12-24 10:57:49', null);
INSERT INTO `dtoa_material` VALUES ('1254', '112035', '水泥垫块', '41', '112', '低值易耗品', '个', '3.5-4', '', '', '1', '管理员', '2020-12-24 11:11:43', null);
INSERT INTO `dtoa_material` VALUES ('1255', '112036', '塑料钢筋卡子（垫块）', '41', '112', '低值易耗品', '个', '3', '', '', '1', '管理员', '2020-12-24 11:16:34', null);
INSERT INTO `dtoa_material` VALUES ('1256', '112037', '棉被', '41', '112', '低值易耗品', '条', '3米*4米', '', '', '1', '管理员', '2020-12-24 11:17:31', null);
INSERT INTO `dtoa_material` VALUES ('1257', '112038', '玻璃贴膜', '41', '112', '低值易耗品', '米', '', '', '', '1', '管理员', '2020-12-24 11:18:38', null);
INSERT INTO `dtoa_material` VALUES ('1258', '10701090', '砂轮切割锯片', '90', '10701', '五金材料', '片', 'Φ400', '树脂砂轮', '', '1', '管理员', '2020-12-24 11:20:01', null);
INSERT INTO `dtoa_material` VALUES ('1259', '112039', '玻璃温度计', '41', '112', '低值易耗品', '支', '100℃', '', '', '1', '管理员', '2020-12-24 11:22:38', null);
INSERT INTO `dtoa_material` VALUES ('1260', '30202011', '反光条', '47', '30202', '文明施工', '盘', '200mm', '', '', '1', '管理员', '2020-12-24 11:25:39', null);
INSERT INTO `dtoa_material` VALUES ('1261', '30202012', '安全标牌', '47', '30202', '文明施工', '块', '60*90', '金属', '', '1', '管理员', '2020-12-24 11:26:26', '2020-12-24 11:31:04');
INSERT INTO `dtoa_material` VALUES ('1262', '30202013', '宣传条幅', '47', '30202', '文明施工', '米', '700mm宽', '', '', '1', '管理员', '2020-12-24 11:27:37', null);
INSERT INTO `dtoa_material` VALUES ('1263', '30201012', '干粉灭火器', '46', '30201', '安全设备', '个', '4KG', '', '', '1', '管理员', '2020-12-24 11:28:41', null);
INSERT INTO `dtoa_material` VALUES ('1264', '30202014', '安全标牌', '47', '30202', '文明施工', '个', '', '树脂', '', '1', '管理员', '2020-12-24 11:31:04', null);
INSERT INTO `dtoa_material` VALUES ('1265', '11008023', '轨道漏电保护器', '115', '11008', '电气设备安装材料', '块', '4级32A', '', '', '1', '管理员', '2020-12-24 11:31:27', null);
INSERT INTO `dtoa_material` VALUES ('1266', '11008024', '轨道空开', '115', '11008', '电气设备安装材料', '块', '3级100A', '', '', '1', '管理员', '2020-12-24 13:22:33', null);
INSERT INTO `dtoa_material` VALUES ('1267', '11008025', '轨道空开', '115', '11008', '电气设备安装材料', '块', '3级32A', '', '', '1', '管理员', '2020-12-24 13:23:02', '2020-12-24 13:25:11');
INSERT INTO `dtoa_material` VALUES ('1268', '11008026', '轨道漏电保护器', '115', '11008', '电气设备安装材料', '块', '3P+N63A', '', '', '1', '管理员', '2020-12-24 13:25:11', '2020-12-24 13:27:31');
INSERT INTO `dtoa_material` VALUES ('1269', '11008027', '轨道漏电保护器', '115', '11008', '电气设备安装材料', '块', '3P+N25A', '', '', '1', '管理员', '2020-12-24 13:26:21', null);
INSERT INTO `dtoa_material` VALUES ('1270', '30202015', '绿密目安全网', '47', '30202', '文明施工', '块', '1.5*6米', '', '', '1', '管理员', '2020-12-24 13:27:32', null);
INSERT INTO `dtoa_material` VALUES ('1271', '10701091', '圆钢钉', '90', '10701', '五金材料', 'KG', '40', '', '', '1', '管理员', '2020-12-24 13:37:08', null);
INSERT INTO `dtoa_material` VALUES ('1272', '10702008', '塔吊灯', '118', '10702', '五金工具', '套', '1000W', '', '', '1', '管理员', '2020-12-24 13:39:06', null);
INSERT INTO `dtoa_material` VALUES ('1273', '11007045', 'YC橡套电缆', '114', '11007', '电线电缆', '米', '3*2.5mm²', '铜芯', '', '1', '管理员', '2020-12-24 13:41:04', '2020-12-24 13:44:45');
INSERT INTO `dtoa_material` VALUES ('1274', '10701092', '螺栓', '90', '10701', '五金材料', '套', '8*30', '', '', '1', '管理员', '2020-12-24 13:44:46', null);
INSERT INTO `dtoa_material` VALUES ('1275', '30301001', '电暖气', '156', '30301', '临建周转设备', '台', '15片', '', '', '1', '管理员', '2020-12-24 13:48:47', null);
INSERT INTO `dtoa_material` VALUES ('1276', '112040', '笤帚', '41', '112', '低值易耗品', '把', '', '', '', '1', '管理员', '2020-12-24 13:49:30', null);
INSERT INTO `dtoa_material` VALUES ('1277', '30301002', '单人床', '156', '30301', '临建周转设备', '套', '', '', '', '1', '管理员', '2020-12-24 13:50:31', null);
INSERT INTO `dtoa_material` VALUES ('1278', '10701093', '插排', '90', '10701', '五金材料', '个', '5米线16A', '', '', '1', '管理员', '2020-12-24 14:26:08', null);
INSERT INTO `dtoa_material` VALUES ('1279', '10701094', '插排', '90', '10701', '五金材料', '个', '3米线16A', '', '', '1', '管理员', '2020-12-24 14:27:22', null);
INSERT INTO `dtoa_material` VALUES ('1280', '10202001', '木方', '98', '10202', '木方', '根', '35*85*4000', '', '', '1', '管理员', '2020-12-24 14:27:51', null);
INSERT INTO `dtoa_material` VALUES ('1281', '10201001', '木模板', '97', '10201', '板材', '张', '1830*915*11', '', '', '1', '管理员', '2020-12-24 14:31:36', '2022-01-18 10:41:18');
INSERT INTO `dtoa_material` VALUES ('1282', '10701095', '挂锁', '90', '10701', '五金材料', '个', '40', '', '', '1', '管理员', '2020-12-24 14:32:30', null);
INSERT INTO `dtoa_material` VALUES ('1283', '10701096', '扣吊', '90', '10701', '五金材料', '付', '125', '', '', '1', '管理员', '2020-12-24 14:33:28', null);
INSERT INTO `dtoa_material` VALUES ('1284', '10701096', '扣吊', '90', '10701', '五金材料', '付', '125', '', '', '1', '管理员', '2020-12-24 14:33:28', null);
INSERT INTO `dtoa_material` VALUES ('1285', '10503006', '砂浆王', '134', '10503', '小型材料', '袋', '5KG', '', '', '1', '管理员', '2020-12-24 14:35:00', null);
INSERT INTO `dtoa_material` VALUES ('1286', '10901004', '塑料绳', '123', '10901', '橡塑制品', '盘', '', '', '', '1', '管理员', '2020-12-24 14:36:43', '2021-10-22 08:21:42');
INSERT INTO `dtoa_material` VALUES ('1287', '11002039', '灯具吊链', '91', '11002', '电气辅材', '米', '', '', '', '1', '管理员', '2020-12-24 14:37:16', null);
INSERT INTO `dtoa_material` VALUES ('1288', '11005026', '灭蝇灯', '112', '11005', '灯具', '个', '30W', '', '', '1', '管理员', '2020-12-24 14:38:39', null);
INSERT INTO `dtoa_material` VALUES ('1289', '11007046', 'YJV电缆', '114', '11007', '电线电缆', '米', '3*6mm²', '铜芯', '', '1', '管理员', '2020-12-24 14:40:14', null);
INSERT INTO `dtoa_material` VALUES ('1290', '11007047', 'YJV电缆', '114', '11007', '电线电缆', '米', '3*2.5mm²', '铜芯', '', '1', '管理员', '2020-12-24 14:51:59', null);
INSERT INTO `dtoa_material` VALUES ('1291', '11115009', '沟槽刚性接头', '147', '11115', '沟槽管件', '个', '165', '', '', '1', '管理员', '2020-12-24 15:33:14', null);
INSERT INTO `dtoa_material` VALUES ('1292', '11115010', '沟槽刚性接头', '147', '11115', '沟槽管件', '个', '76', '', '', '1', '管理员', '2020-12-24 15:34:10', null);
INSERT INTO `dtoa_material` VALUES ('1293', '10902014', '聚氨酯保温瓦壳', '128', '10902', '保温材料', '米', '114*10厚', '', '', '1', '管理员', '2020-12-24 15:34:33', null);
INSERT INTO `dtoa_material` VALUES ('1294', '11115011', '沟槽三通', '147', '11115', '沟槽管件', '个', 'DN65*40', '', '', '1', '管理员', '2020-12-24 15:50:39', null);
INSERT INTO `dtoa_material` VALUES ('1295', '11115012', '沟槽卡箍', '147', '11115', '沟槽管件', '个', 'DN65', '', '', '1', '管理员', '2020-12-24 15:54:02', null);
INSERT INTO `dtoa_material` VALUES ('1296', '11115013', '沟槽弯头', '147', '11115', '沟槽管件', '个', '114*90°', '', '', '1', '管理员', '2020-12-24 15:54:34', null);
INSERT INTO `dtoa_material` VALUES ('1297', '11115014', '沟槽三通', '147', '11115', '沟槽管件', '个', '114*114', '', '', '1', '管理员', '2020-12-24 15:59:22', null);
INSERT INTO `dtoa_material` VALUES ('1298', '11115015', '沟槽大小头', '147', '11115', '沟槽管件', '个', '165*114', '', '', '1', '管理员', '2020-12-24 16:00:12', null);
INSERT INTO `dtoa_material` VALUES ('1299', '11115016', '沟槽大小头', '147', '11115', '沟槽管件', '个', '114*76', '', '', '1', '管理员', '2020-12-24 16:00:35', null);
INSERT INTO `dtoa_material` VALUES ('1300', '11115017', '沟槽弯头', '147', '11115', '沟槽管件', '个', '76*90°', '', '', '1', '管理员', '2020-12-24 16:00:58', null);
INSERT INTO `dtoa_material` VALUES ('1301', '11115018', '沟槽法兰短管', '147', '11115', '沟槽管件', '个', '165', '', '', '1', '管理员', '2020-12-24 16:01:23', null);
INSERT INTO `dtoa_material` VALUES ('1302', '112041', '电水壶', '41', '112', '低值易耗品', '个', '', '', '', '1', '管理员', '2020-12-30 10:18:30', null);
INSERT INTO `dtoa_material` VALUES ('1303', '405001', '玻璃幕墙', '158', '405', '玻璃幕墙', '㎡', '61ow-e+9A+6背釉', '', '', '1', '管理员', '2021-01-04 15:02:23', null);
INSERT INTO `dtoa_material` VALUES ('1304', '405002', '玻璃幕墙', '158', '405', '玻璃幕墙', '㎡', '61ow-e+9A+6', '', '', '1', '管理员', '2021-01-04 15:03:26', null);
INSERT INTO `dtoa_material` VALUES ('1305', '405003', '玻璃电梯顶', '158', '405', '玻璃幕墙', '㎡', '81ow-e+1.08pvb+8', '', '', '1', '管理员', '2021-01-04 15:04:03', null);
INSERT INTO `dtoa_material` VALUES ('1306', '10705007', '不锈钢水槽', '121', '10705', '金属构件', '米', '400*400*300*2mm', '304', '', '1', '管理员', '2021-01-04 15:05:22', null);
INSERT INTO `dtoa_material` VALUES ('1307', '1010301008', '预埋铁板含打孔', '136', '1010301', '加工铁板', '块', '3000mm*1200mm*25mm', '', '', '1', '管理员', '2021-01-04 15:07:19', null);
INSERT INTO `dtoa_material` VALUES ('1308', '11007048', 'WDZ-BYJ塑铜线', '114', '11007', '电线电缆', '米', '4mm²', '铜', '', '1', '管理员', '2021-01-04 15:20:48', null);
INSERT INTO `dtoa_material` VALUES ('1309', '11007049', 'WDZ-BYJ塑铜线', '114', '11007', '电线电缆', '米', '10mm²', '铜', '', '1', '管理员', '2021-01-04 15:40:09', null);
INSERT INTO `dtoa_material` VALUES ('1310', '11007050', 'BTTZ电缆', '114', '11007', '电线电缆', '米', '5*10mm²', '铜', '', '1', '管理员', '2021-01-04 15:41:31', null);
INSERT INTO `dtoa_material` VALUES ('1311', '11007051', 'WDZ-YJY电缆', '114', '11007', '电线电缆', '米', '5*16mm²', '铜', '', '1', '管理员', '2021-01-04 15:42:15', null);
INSERT INTO `dtoa_material` VALUES ('1312', '11007052', 'WDZ-YJY电缆', '114', '11007', '电线电缆', '米', '4*25+1*16', '铜', '', '1', '管理员', '2021-01-04 15:43:29', null);
INSERT INTO `dtoa_material` VALUES ('1313', '11007053', 'WDZ-YJY电缆', '114', '11007', '电线电缆', '米', '4*35+1*16', '铜', '', '1', '管理员', '2021-01-04 15:44:11', null);
INSERT INTO `dtoa_material` VALUES ('1314', '10504001', '821腻子粉', '159', '10504', '其他建材', '袋', '50KG', '', '', '1', '管理员', '2021-01-08 11:08:19', null);
INSERT INTO `dtoa_material` VALUES ('1315', '11004017', '防火线槽桥架', '110', '11004', '线槽桥架', '米', '600*150', '', '', '1', '管理员', '2021-01-08 11:08:52', null);
INSERT INTO `dtoa_material` VALUES ('1316', '11004018', '防火线槽桥架', '110', '11004', '线槽桥架', '米', '400*150', '', '', '1', '管理员', '2021-01-08 11:11:27', null);
INSERT INTO `dtoa_material` VALUES ('1317', '11004019', '防火线槽桥架', '110', '11004', '线槽桥架', '米', '300*100', '', '', '1', '管理员', '2021-01-08 11:11:55', '2021-01-08 11:13:27');
INSERT INTO `dtoa_material` VALUES ('1318', '11004020', '防火线槽桥架', '110', '11004', '线槽桥架', '米', '150*100', '', '', '1', '管理员', '2021-01-08 11:12:18', null);
INSERT INTO `dtoa_material` VALUES ('1319', '11004021', '防火水平弯头', '110', '11004', '线槽桥架', '个', '600*150', '', '', '1', '管理员', '2021-01-08 11:13:27', null);
INSERT INTO `dtoa_material` VALUES ('1320', '11004022', '防火水平弯头', '110', '11004', '线槽桥架', '个', '400*150', '', '', '1', '管理员', '2021-01-08 11:16:59', null);
INSERT INTO `dtoa_material` VALUES ('1321', '11004023', '防火水平弯头', '110', '11004', '线槽桥架', '个', '300*100', '', '', '1', '管理员', '2021-01-08 11:17:21', null);
INSERT INTO `dtoa_material` VALUES ('1322', '11004024', '防火水平弯头', '110', '11004', '线槽桥架', '个', '200*100', '', '', '1', '管理员', '2021-01-08 11:17:39', null);
INSERT INTO `dtoa_material` VALUES ('1323', '11004025', '防火水平弯头', '110', '11004', '线槽桥架', '个', '150*100', '', '', '1', '管理员', '2021-01-08 11:18:01', null);
INSERT INTO `dtoa_material` VALUES ('1324', '11004026', '防火异型三通', '110', '11004', '线槽桥架', '个', '600*150+400*150+300*100', '', '', '1', '管理员', '2021-01-08 11:18:52', null);
INSERT INTO `dtoa_material` VALUES ('1325', '11004027', '防火异型三通', '110', '11004', '线槽桥架', '个', '400*150+200*100', '', '', '1', '管理员', '2021-01-08 13:24:32', null);
INSERT INTO `dtoa_material` VALUES ('1326', '11004028', '防火异型三通', '110', '11004', '线槽桥架', '个', '200*100+300*100', '', '', '1', '管理员', '2021-01-08 13:25:23', null);
INSERT INTO `dtoa_material` VALUES ('1327', '11004029', '防火异型三通', '110', '11004', '线槽桥架', '个', '150*100+200*100', '', '', '1', '管理员', '2021-01-08 13:26:18', null);
INSERT INTO `dtoa_material` VALUES ('1328', '11004030', '防火异型三通', '110', '11004', '线槽桥架', '个', '100*100+200*100', '', '', '1', '管理员', '2021-01-08 13:27:16', null);
INSERT INTO `dtoa_material` VALUES ('1329', '11004031', '防火水平三通', '110', '11004', '线槽桥架', '个', '200*100', '', '', '1', '管理员', '2021-01-08 13:28:15', null);
INSERT INTO `dtoa_material` VALUES ('1330', '11004032', '防火桥架伸缩节', '110', '11004', '线槽桥架', '个', '400*150', '', '', '1', '管理员', '2021-01-08 13:28:34', null);
INSERT INTO `dtoa_material` VALUES ('1331', '11004033', '防火桥架伸缩节', '110', '11004', '线槽桥架', '个', '300*150', '', '', '1', '管理员', '2021-01-08 13:29:37', null);
INSERT INTO `dtoa_material` VALUES ('1332', '11005027', '暖光平板灯', '112', '11005', '灯具', '套', '200*1200', '', '', '1', '管理员', '2021-01-08 13:30:00', null);
INSERT INTO `dtoa_material` VALUES ('1333', '11008028', '应急电池', '115', '11008', '电气设备安装材料', '块', '', '', '', '1', '管理员', '2021-01-08 13:31:57', null);
INSERT INTO `dtoa_material` VALUES ('1334', '11005028', '角灯', '112', '11005', '灯具', '个', '', '', '', '1', '管理员', '2021-01-08 13:33:01', null);
INSERT INTO `dtoa_material` VALUES ('1335', '10602004', '钢制隔热防火门开玻璃窗', '153', '10602', '防火门', '个', '', '', '', '1', '管理员', '2021-01-08 15:59:38', '2021-01-08 16:03:39');
INSERT INTO `dtoa_material` VALUES ('1336', '1010202002', 'H型钢锰板', '57', '1010202', 'H型钢', '吨', '', 'Q345', '', '1', '管理员', '2021-01-08 16:03:40', null);
INSERT INTO `dtoa_material` VALUES ('1337', '1010202003', '柱撑、隅撑等', '57', '1010202', 'H型钢', '吨', '', '', '', '1', '管理员', '2021-01-08 16:16:03', null);
INSERT INTO `dtoa_material` VALUES ('1338', '11101067', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN40*32', '热镀锌', '', '1', '管理员', '2021-01-11 09:49:14', null);
INSERT INTO `dtoa_material` VALUES ('1339', '11101068', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN32*25', '热镀锌', '', '1', '管理员', '2021-01-11 09:55:23', null);
INSERT INTO `dtoa_material` VALUES ('1340', '11101069', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN40*25', '热镀锌', '', '1', '管理员', '2021-01-11 09:56:16', null);
INSERT INTO `dtoa_material` VALUES ('1342', '11101070', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN80', '热镀锌', '', '1', '管理员', '2021-01-11 09:57:52', null);
INSERT INTO `dtoa_material` VALUES ('1343', '11101071', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN40', '热镀锌', '', '1', '管理员', '2021-01-11 09:59:12', null);
INSERT INTO `dtoa_material` VALUES ('1344', '11101072', '镀锌油任活接', '92', '11101', '镀锌管件', '个', 'DN40', '热镀锌', '', '1', '管理员', '2021-01-11 10:02:11', null);
INSERT INTO `dtoa_material` VALUES ('1345', '11101073', '镀锌油任活接', '92', '11101', '镀锌管件', '个', 'DN25', '热镀锌', '', '1', '管理员', '2021-01-11 10:02:44', null);
INSERT INTO `dtoa_material` VALUES ('1346', '11105050', 'PPR热水管', '107', '11105', 'PPR管材管件', '米', '20', 'PPR', '', '1', '管理员', '2021-01-11 10:03:34', null);
INSERT INTO `dtoa_material` VALUES ('1347', '11105051', 'PPR管箍', '107', '11105', 'PPR管材管件', '个', '32*25', 'PPR', '', '1', '管理员', '2021-01-11 10:05:33', null);
INSERT INTO `dtoa_material` VALUES ('1348', '11105052', 'PPR管箍', '107', '11105', 'PPR管材管件', '个', '32*20', 'PPR', '', '1', '管理员', '2021-01-11 10:12:23', null);
INSERT INTO `dtoa_material` VALUES ('1349', '11105053', 'PPR内丝弯头', '107', '11105', 'PPR管材管件', '个', '32*1寸', 'PPR', '', '1', '管理员', '2021-01-11 10:12:49', null);
INSERT INTO `dtoa_material` VALUES ('1350', '10702009', '铁耙子', '118', '10702', '五金工具', '把', '', '', '', '1', '管理员', '2021-01-11 10:15:21', null);
INSERT INTO `dtoa_material` VALUES ('1351', '11008029', '轨道漏电保护器', '115', '11008', '电气设备安装材料', '块', '220V2P32A', '', '', '1', '管理员', '2021-01-11 10:27:14', null);
INSERT INTO `dtoa_material` VALUES ('1352', '10701097', '螺栓', '90', '10701', '五金材料', '套', 'M10*50', '', '', '1', '管理员', '2021-01-11 10:31:00', null);
INSERT INTO `dtoa_material` VALUES ('1353', '11105054', 'PPR丝堵', '107', '11105', 'PPR管材管件', '个', '20', 'PPR', '', '1', '管理员', '2021-01-11 10:32:47', null);
INSERT INTO `dtoa_material` VALUES ('1354', '11101074', '镀锌弯头', '92', '11101', '镀锌管件', '个', 'DN80*90°', '热镀锌', '', '1', '管理员', '2021-01-11 10:34:32', null);
INSERT INTO `dtoa_material` VALUES ('1355', '11101075', '镀锌弯头', '92', '11101', '镀锌管件', '个', 'DN40*32', '热镀锌', '', '1', '管理员', '2021-01-11 10:37:56', null);
INSERT INTO `dtoa_material` VALUES ('1356', '11101076', '镀锌弯头', '92', '11101', '镀锌管件', '个', 'DN32*25', '热镀锌', '', '1', '管理员', '2021-01-11 10:39:55', null);
INSERT INTO `dtoa_material` VALUES ('1357', '11101077', '镀锌弯头', '92', '11101', '镀锌管件', '个', 'DN25*45°', '热镀锌', '', '1', '管理员', '2021-01-11 10:40:23', null);
INSERT INTO `dtoa_material` VALUES ('1358', '11101078', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN40', '热镀锌', '', '1', '管理员', '2021-01-11 10:41:34', null);
INSERT INTO `dtoa_material` VALUES ('1359', '11101079', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN32', '热镀锌', '', '1', '管理员', '2021-01-11 10:43:09', null);
INSERT INTO `dtoa_material` VALUES ('1360', '11101080', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN25', '热镀锌', '', '1', '管理员', '2021-01-11 10:44:04', null);
INSERT INTO `dtoa_material` VALUES ('1361', '1010202004', '镀锌檩条', '57', '1010202', 'H型钢', '吨', 'C300*80*20*2.5', 'Q235B', '', '1', '管理员', '2021-01-11 13:24:16', null);
INSERT INTO `dtoa_material` VALUES ('1362', '10603001', '断桥铝窗', '160', '10603', '窗及制品', '㎡', '60系列', '', '', '1', '管理员', '2021-01-11 13:40:27', null);
INSERT INTO `dtoa_material` VALUES ('1363', '10603002', '窗内U型镀锌钢', '160', '10603', '窗及制品', '㎡', '1.5mm厚', '', '', '1', '管理员', '2021-01-11 13:40:59', null);
INSERT INTO `dtoa_material` VALUES ('1364', '10603003', '推轴开窗机', '160', '10603', '窗及制品', '台', 'SH-T2-600', '', '', '1', '管理员', '2021-01-11 13:41:56', null);
INSERT INTO `dtoa_material` VALUES ('1365', '10603004', '推轴横框安装码', '160', '10603', '窗及制品', '套', 'GCPJ31-010-000A/0', '不锈钢', '', '1', '管理员', '2021-01-11 13:43:15', null);
INSERT INTO `dtoa_material` VALUES ('1366', '10603005', '推轴通用角形支架3#', '160', '10603', '窗及制品', '套', 'C01.2.2.03.01.07 A/0', '', '', '1', '管理员', '2021-01-11 13:45:05', null);
INSERT INTO `dtoa_material` VALUES ('1367', '11008030', '消防电气控制装置GC-ES203', '115', '11008', '电气设备安装材料', '台', '300*400*160/100W/输出20A/主', '', '', '1', '管理员', '2021-01-11 13:48:35', null);
INSERT INTO `dtoa_material` VALUES ('1368', '11008031', '带控制开关UHP-350-24.UHP-350R-24', '115', '11008', '电气设备安装材料', '台', '输出14.6A24V/输入100-240V,50/60Hz,上限4A,350W', '', '', '1', '管理员', '2021-01-11 13:49:32', null);
INSERT INTO `dtoa_material` VALUES ('1369', '11008032', '二位复位琴键开关', '115', '11008', '电气设备安装材料', '个', 'S01D0-1021', '', '', '1', '管理员', '2021-01-11 13:51:12', null);
INSERT INTO `dtoa_material` VALUES ('1370', '502002', '架子管', '76', '502', '设备租赁', '根', '6米', '', '', '9', '董满仓', '2021-01-18 10:35:54', null);
INSERT INTO `dtoa_material` VALUES ('1371', '502003', '架子管', '76', '502', '设备租赁', '根', '4.5米', '', '', '9', '董满仓', '2021-01-18 10:37:17', null);
INSERT INTO `dtoa_material` VALUES ('1372', '502004', '架子管', '76', '502', '设备租赁', '根', '4米', '', '', '9', '董满仓', '2021-01-18 10:37:32', null);
INSERT INTO `dtoa_material` VALUES ('1373', '502005', '架子管', '76', '502', '设备租赁', '根', '3米', '', '', '9', '董满仓', '2021-01-18 10:37:49', null);
INSERT INTO `dtoa_material` VALUES ('1374', '502006', '架子管', '76', '502', '设备租赁', '根', '2.5米', '', '', '9', '董满仓', '2021-01-18 10:38:12', null);
INSERT INTO `dtoa_material` VALUES ('1375', '502007', '架子管', '76', '502', '设备租赁', '根', '2米', '', '', '9', '董满仓', '2021-01-18 10:38:25', null);
INSERT INTO `dtoa_material` VALUES ('1376', '502008', '架子管', '76', '502', '设备租赁', '根', '1.5米', '', '', '9', '董满仓', '2021-01-18 10:38:42', null);
INSERT INTO `dtoa_material` VALUES ('1377', '502009', '架子管', '76', '502', '设备租赁', '根', '1.2米', '', '', '9', '董满仓', '2021-01-18 10:39:01', null);
INSERT INTO `dtoa_material` VALUES ('1378', '502010', '架子管', '76', '502', '设备租赁', '根', '1米', '', '', '9', '董满仓', '2021-01-18 10:39:22', null);
INSERT INTO `dtoa_material` VALUES ('1379', '502011', '脚手板', '76', '502', '设备租赁', '块', '400*30*5cm', '', '', '9', '董满仓', '2021-01-18 10:39:37', null);
INSERT INTO `dtoa_material` VALUES ('1380', '502012', '顶托', '76', '502', '设备租赁', '根', '600mm', '', '', '9', '董满仓', '2021-01-18 10:40:54', null);
INSERT INTO `dtoa_material` VALUES ('1381', '502013', '山型件', '76', '502', '设备租赁', '个', '', '', '', '9', '董满仓', '2021-01-18 10:41:25', null);
INSERT INTO `dtoa_material` VALUES ('1382', '502014', '十字扣件', '76', '502', '设备租赁', '个', '', '', '', '9', '董满仓', '2021-01-18 10:41:50', null);
INSERT INTO `dtoa_material` VALUES ('1383', '502015', '接头扣件', '76', '502', '设备租赁', '个', '', '', '', '9', '董满仓', '2021-01-18 10:42:20', null);
INSERT INTO `dtoa_material` VALUES ('1384', '502016', '转轴扣件', '76', '502', '设备租赁', '个', '', '', '', '9', '董满仓', '2021-01-18 10:42:36', null);
INSERT INTO `dtoa_material` VALUES ('1385', '502017', '十字扣件维修清理', '76', '502', '设备租赁', '个', '', '', '', '9', '董满仓', '2021-01-18 10:42:53', null);
INSERT INTO `dtoa_material` VALUES ('1386', '502018', '架子管丢失报废', '76', '502', '设备租赁', '根', '6米', '', '', '9', '董满仓', '2021-01-18 10:43:13', null);
INSERT INTO `dtoa_material` VALUES ('1387', '502019', '架子管丢失报废', '76', '502', '设备租赁', '根', '4.5米', '', '', '9', '董满仓', '2021-01-18 10:43:43', null);
INSERT INTO `dtoa_material` VALUES ('1388', '502020', '架子管丢失报废', '76', '502', '设备租赁', '根', '4米', '', '', '9', '董满仓', '2021-01-18 10:44:05', null);
INSERT INTO `dtoa_material` VALUES ('1389', '502021', '架子管丢失报废', '76', '502', '设备租赁', '根', '3米', '', '', '9', '董满仓', '2021-01-18 10:44:21', null);
INSERT INTO `dtoa_material` VALUES ('1390', '502022', '架子管丢失报废', '76', '502', '设备租赁', '根', '2.5米', '', '', '9', '董满仓', '2021-01-18 10:44:40', null);
INSERT INTO `dtoa_material` VALUES ('1391', '502023', '架子管丢失报废', '76', '502', '设备租赁', '根', '2米', '', '', '9', '董满仓', '2021-01-18 10:44:55', null);
INSERT INTO `dtoa_material` VALUES ('1392', '502024', '架子管丢失报废', '76', '502', '设备租赁', '根', '1.5米', '', '', '9', '董满仓', '2021-01-18 10:45:22', null);
INSERT INTO `dtoa_material` VALUES ('1393', '502025', '架子管丢失报废', '76', '502', '设备租赁', '根', '1.2米', '', '', '9', '董满仓', '2021-01-18 10:45:37', null);
INSERT INTO `dtoa_material` VALUES ('1394', '502026', '架子管丢失报废', '76', '502', '设备租赁', '根', '1米', '', '', '9', '董满仓', '2021-01-18 10:45:53', null);
INSERT INTO `dtoa_material` VALUES ('1395', '502027', '脚手板丢失报废', '76', '502', '设备租赁', '块', '400*30*5cm', '', '', '9', '董满仓', '2021-01-18 10:46:06', null);
INSERT INTO `dtoa_material` VALUES ('1396', '502028', '顶托丢失报废', '76', '502', '设备租赁', '根', '600mm', '', '', '9', '董满仓', '2021-01-18 10:46:30', null);
INSERT INTO `dtoa_material` VALUES ('1397', '502029', '山型件丢失报废', '76', '502', '设备租赁', '个', '', '', '', '9', '董满仓', '2021-01-18 10:46:47', null);
INSERT INTO `dtoa_material` VALUES ('1398', '502030', '十字扣件丢失报废', '76', '502', '设备租赁', '个', '', '', '', '9', '董满仓', '2021-01-18 10:47:04', null);
INSERT INTO `dtoa_material` VALUES ('1399', '502031', '接头扣件丢失报废', '76', '502', '设备租赁', '个', '', '', '', '9', '董满仓', '2021-01-18 10:47:20', null);
INSERT INTO `dtoa_material` VALUES ('1400', '502032', '转轴扣件丢失报废', '76', '502', '设备租赁', '个', '', '', '', '9', '董满仓', '2021-01-18 10:47:38', null);
INSERT INTO `dtoa_material` VALUES ('1401', '112042', '钥匙牌', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-01-20 16:25:28', null);
INSERT INTO `dtoa_material` VALUES ('1402', '10701098', '内六角螺栓', '90', '10701', '五金材料', '条', 'M6*16', '', '', '9', '董满仓', '2021-01-20 16:26:35', null);
INSERT INTO `dtoa_material` VALUES ('1403', '10701099', '螺栓', '90', '10701', '五金材料', '套', 'M14*80', '', '', '9', '董满仓', '2021-01-20 16:27:53', null);
INSERT INTO `dtoa_material` VALUES ('1404', '112043', '平板墩布', '41', '112', '低值易耗品', '把', '600', '', '', '9', '董满仓', '2021-01-20 16:28:49', null);
INSERT INTO `dtoa_material` VALUES ('1405', '11005029', 'LED平板灯', '112', '11005', '灯具', '套', '300*300', '', '', '9', '董满仓', '2021-01-20 16:30:57', null);
INSERT INTO `dtoa_material` VALUES ('1406', '11109042', '不锈钢喉箍', '122', '11109', '水暖辅材', '个', '80', '', '', '9', '董满仓', '2021-01-20 16:33:04', null);
INSERT INTO `dtoa_material` VALUES ('1407', '11001031', '146等电位盒', '59', '11001', '管线敷设', '个', '60', '金属', '', '9', '董满仓', '2021-01-20 16:34:30', null);
INSERT INTO `dtoa_material` VALUES ('1408', '1010203002', '镀锌扁钢', '58', '1010203', '扁钢', '米', '25*2.3', '', '', '9', '董满仓', '2021-01-20 16:36:47', null);
INSERT INTO `dtoa_material` VALUES ('1409', '1010403005', '镀锌圆钢', '143', '1010403', '圆钢', '米', 'Φ8', '', '', '9', '董满仓', '2021-01-20 16:37:35', null);
INSERT INTO `dtoa_material` VALUES ('1410', '10701100', '机螺丝', '90', '10701', '五金材料', '个', 'M4*50', '', '', '9', '董满仓', '2021-01-20 16:38:31', null);
INSERT INTO `dtoa_material` VALUES ('1411', '112044', '毛巾', '41', '112', '低值易耗品', '条', '', '', '', '9', '董满仓', '2021-01-20 16:43:27', null);
INSERT INTO `dtoa_material` VALUES ('1412', '11102065', '加长镀铬水嘴', '93', '11102', '控水主材', '个', 'DN15', '', '', '9', '董满仓', '2021-01-20 16:44:01', null);
INSERT INTO `dtoa_material` VALUES ('1413', '11102066', '丝扣法兰盘', '93', '11102', '控水主材', '片', 'DN80', '', '', '9', '董满仓', '2021-01-20 16:45:00', null);
INSERT INTO `dtoa_material` VALUES ('1414', '11109043', '法兰垫', '122', '11109', '水暖辅材', '个', '80', '', '', '9', '董满仓', '2021-01-20 16:46:22', null);
INSERT INTO `dtoa_material` VALUES ('1415', '10701101', '螺栓', '90', '10701', '五金材料', '套', 'M16*80', '', '', '9', '董满仓', '2021-01-20 16:47:37', null);
INSERT INTO `dtoa_material` VALUES ('1416', '11002040', '换气扇排风管', '91', '11002', '电气辅材', '根', '100', '', '', '9', '董满仓', '2021-01-20 16:49:27', null);
INSERT INTO `dtoa_material` VALUES ('1417', '11001032', 'PVC方盒', '59', '11001', '管线敷设', '个', '86H50', '', '', '9', '董满仓', '2021-01-20 16:50:19', null);
INSERT INTO `dtoa_material` VALUES ('1418', '213002', '冬施抗渗混凝土', '150', '213', '冬施抗渗混凝土', 'm³', 'C35P6', '', '', '9', '董满仓', '2021-01-25 11:02:04', null);
INSERT INTO `dtoa_material` VALUES ('1419', '50107002', '汽车混凝土泵', '140', '50107', '汽车泵', '班', '47米臂', '', '', '9', '董满仓', '2021-01-25 16:10:30', null);
INSERT INTO `dtoa_material` VALUES ('1420', '10801008', '灰防锈漆', '116', '10801', '油漆水漆', '桶', '3.5KG', '', '', '9', '董满仓', '2021-01-27 10:23:34', null);
INSERT INTO `dtoa_material` VALUES ('1421', '10801009', '稀料', '116', '10801', '油漆水漆', '瓶', '1KG', '', '', '9', '董满仓', '2021-01-27 10:33:01', null);
INSERT INTO `dtoa_material` VALUES ('1423', '10703014', 'SC铁套管', '119', '10703', '焊接冲压管件', '个', '15', '熟铁', '', '9', '董满仓', '2021-01-27 10:37:17', null);
INSERT INTO `dtoa_material` VALUES ('1424', '10703015', 'SC铁套管', '119', '10703', '焊接冲压管件', '个', '20', '熟铁', '', '9', '董满仓', '2021-01-27 10:38:23', null);
INSERT INTO `dtoa_material` VALUES ('1425', '10703016', 'SC铁套管', '119', '10703', '焊接冲压管件', '个', '25', '熟铁', '', '9', '董满仓', '2021-01-27 10:38:42', null);
INSERT INTO `dtoa_material` VALUES ('1426', '10703017', 'SC铁套管', '119', '10703', '焊接冲压管件', '个', '32', '熟铁', '', '9', '董满仓', '2021-01-27 10:38:59', null);
INSERT INTO `dtoa_material` VALUES ('1427', '10703018', 'SC铁套管', '119', '10703', '焊接冲压管件', '个', '40', '熟铁', '', '9', '董满仓', '2021-01-27 10:39:27', null);
INSERT INTO `dtoa_material` VALUES ('1428', '10703019', 'SC铁套管', '119', '10703', '焊接冲压管件', '个', '50', '熟铁', '', '9', '董满仓', '2021-01-27 10:39:42', null);
INSERT INTO `dtoa_material` VALUES ('1429', '10701102', '锁母', '90', '10701', '五金材料', '个', '15', '', '', '9', '董满仓', '2021-01-27 10:40:03', null);
INSERT INTO `dtoa_material` VALUES ('1430', '10701103', '锁母', '90', '10701', '五金材料', '个', '20', '', '', '9', '董满仓', '2021-01-27 10:44:44', null);
INSERT INTO `dtoa_material` VALUES ('1431', '10701104', '锁母', '90', '10701', '五金材料', '个', '25', '', '', '9', '董满仓', '2021-01-27 10:45:00', null);
INSERT INTO `dtoa_material` VALUES ('1432', '10701105', '锁母', '90', '10701', '五金材料', '个', '32', '', '', '9', '董满仓', '2021-01-27 10:45:12', null);
INSERT INTO `dtoa_material` VALUES ('1433', '11002041', '塑料管堵', '91', '11002', '电气辅材', '包', '15*100个', '', '', '9', '董满仓', '2021-01-27 10:45:28', '2021-01-27 10:48:15');
INSERT INTO `dtoa_material` VALUES ('1434', '11002042', '塑料管堵', '91', '11002', '电气辅材', '包', '20*100个', '', '', '9', '董满仓', '2021-01-27 10:47:18', null);
INSERT INTO `dtoa_material` VALUES ('1435', '11002043', '塑料管堵', '91', '11002', '电气辅材', '包', '32*100个', '', '', '9', '董满仓', '2021-01-27 10:48:15', null);
INSERT INTO `dtoa_material` VALUES ('1436', '11001033', '穿筋铁方盒', '59', '11001', '管线敷设', '个', '86-H80-4分孔', '', '', '9', '董满仓', '2021-01-27 10:48:38', '2021-08-04 07:58:38');
INSERT INTO `dtoa_material` VALUES ('1437', '11001034', '穿筋铁八角盒', '59', '11001', '管线敷设', '个', '86-H80', '', '', '9', '董满仓', '2021-01-27 10:49:58', null);
INSERT INTO `dtoa_material` VALUES ('1438', '1010301009', '加工铁板', '136', '1010301', '加工铁板', '块', '600*600*8mm', '', '', '9', '董满仓', '2021-01-27 10:50:28', null);
INSERT INTO `dtoa_material` VALUES ('1439', '1010301010', '加工铁板', '136', '1010301', '加工铁板', '块', '400*600*8mm', '', '', '9', '董满仓', '2021-01-27 13:34:19', null);
INSERT INTO `dtoa_material` VALUES ('1440', '10705008', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN200*260mm', '', '', '9', '董满仓', '2021-01-27 13:39:27', null);
INSERT INTO `dtoa_material` VALUES ('1441', '10705009', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN165*260mm', '', '', '9', '董满仓', '2021-01-27 13:41:26', '2021-01-27 13:43:00');
INSERT INTO `dtoa_material` VALUES ('1442', '10705010', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN65*260mm', '', '', '9', '董满仓', '2021-01-27 13:43:01', null);
INSERT INTO `dtoa_material` VALUES ('1443', '10705011', '柔性防水套管', '121', '10705', '金属构件', '个', 'DN200*400mm', '', '', '9', '董满仓', '2021-01-27 13:43:40', null);
INSERT INTO `dtoa_material` VALUES ('1444', '10705012', '柔性防水套管', '121', '10705', '金属构件', '个', 'DN273*400mm', '', '', '9', '董满仓', '2021-01-27 15:20:53', null);
INSERT INTO `dtoa_material` VALUES ('1445', '10705013', '柔性防水套管', '121', '10705', '金属构件', '个', 'DN159*400mm', '', '', '9', '董满仓', '2021-01-27 15:21:41', null);
INSERT INTO `dtoa_material` VALUES ('1446', '10705014', '柔性防水套管', '121', '10705', '金属构件', '个', 'DN100*400mm', '', '', '9', '董满仓', '2021-01-27 15:22:09', null);
INSERT INTO `dtoa_material` VALUES ('1447', '10705015', '柔性防水套管', '121', '10705', '金属构件', '个', 'DN65*400mm', '', '', '9', '董满仓', '2021-01-27 15:42:52', null);
INSERT INTO `dtoa_material` VALUES ('1448', '10802011', '界面剂', '117', '10802', '化工产品', '桶', '20KG', '', '', '9', '董满仓', '2021-01-27 15:46:41', null);
INSERT INTO `dtoa_material` VALUES ('1449', '11109044', '地暖反射膜', '122', '11109', '水暖辅材', '卷', '1m*100m', '', '', '9', '董满仓', '2021-01-27 15:49:45', null);
INSERT INTO `dtoa_material` VALUES ('1450', '10503007', '玻纤网格布', '134', '10503', '小型材料', '捆', '1m*70m', '', '', '9', '董满仓', '2021-01-27 15:51:09', null);
INSERT INTO `dtoa_material` VALUES ('1451', '11105055', 'PPR弯头', '107', '11105', 'PPR管材管件', '个', '63*90°', 'PPR', '', '9', '董满仓', '2021-01-27 15:55:14', null);
INSERT INTO `dtoa_material` VALUES ('1452', '11105056', 'PPR内丝直接', '107', '11105', 'PPR管材管件', '个', '63*2寸', 'PPR', '', '9', '董满仓', '2021-01-27 16:16:13', null);
INSERT INTO `dtoa_material` VALUES ('1453', '11105057', 'PPR外丝直接', '107', '11105', 'PPR管材管件', '个', '63*2寸', 'PPR', '', '9', '董满仓', '2021-01-27 16:16:49', null);
INSERT INTO `dtoa_material` VALUES ('1454', '11117004', 'PE弯头', '152', '11117', 'PE管材管件', '个', '63', '', '', '9', '董满仓', '2021-01-27 16:17:41', null);
INSERT INTO `dtoa_material` VALUES ('1455', '11117005', '钢丝骨架PE复合管', '152', '11117', 'PE管材管件', '米', '110', '', '电熔', '9', '董满仓', '2021-01-27 16:18:22', null);
INSERT INTO `dtoa_material` VALUES ('1456', '11117006', '钢丝骨架PE管箍', '152', '11117', 'PE管材管件', '个', '110', '', '电熔', '9', '董满仓', '2021-01-27 16:20:54', null);
INSERT INTO `dtoa_material` VALUES ('1457', '11117007', '钢丝骨架PE弯头', '152', '11117', 'PE管材管件', '个', '110', '', '电熔', '9', '董满仓', '2021-01-27 16:21:22', null);
INSERT INTO `dtoa_material` VALUES ('1458', '11115019', '沟槽法兰', '147', '11115', '沟槽管件', '个', '100', '', '', '9', '董满仓', '2021-01-27 16:22:43', null);
INSERT INTO `dtoa_material` VALUES ('1459', '10701106', '螺栓', '90', '10701', '五金材料', '套', 'M16*65', '', '', '9', '董满仓', '2021-01-27 16:23:54', null);
INSERT INTO `dtoa_material` VALUES ('1460', '10705016', '止水螺栓', '121', '10705', '金属构件', '根', 'M14*800mm', '', '', '9', '董满仓', '2021-01-27 16:24:47', null);
INSERT INTO `dtoa_material` VALUES ('1461', '10705017', '山型件（采购）', '121', '10705', '金属构件', '个', '', '', '', '9', '董满仓', '2021-01-27 16:26:38', null);
INSERT INTO `dtoa_material` VALUES ('1463', '11110050', 'PVC顺水三通', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '9', '董满仓', '2021-01-27 16:36:29', null);
INSERT INTO `dtoa_material` VALUES ('1464', '11110051', 'PVC顺水三通', '129', '11110', 'PVC管材管件', '个', 'Φ75', 'PVC', '', '9', '董满仓', '2021-01-27 16:37:27', null);
INSERT INTO `dtoa_material` VALUES ('1465', '11110052', 'PVC顺水三通', '129', '11110', 'PVC管材管件', '个', 'Φ50', 'PVC', '', '9', '董满仓', '2021-01-27 16:38:04', null);
INSERT INTO `dtoa_material` VALUES ('1466', '11110053', 'PVC顺水三通', '129', '11110', 'PVC管材管件', '个', 'Φ110*50', 'PVC', '', '9', '董满仓', '2021-01-27 16:38:30', null);
INSERT INTO `dtoa_material` VALUES ('1467', '11110054', 'PVC顺水三通', '129', '11110', 'PVC管材管件', '个', 'Φ110*75', 'PVC', '', '9', '董满仓', '2021-01-27 16:38:56', null);
INSERT INTO `dtoa_material` VALUES ('1468', '11110055', 'PVC顺水三通', '129', '11110', 'PVC管材管件', '个', 'Φ75*50', 'PVC', '', '9', '董满仓', '2021-01-27 16:39:25', null);
INSERT INTO `dtoa_material` VALUES ('1469', '11110056', 'PVC补芯', '129', '11110', 'PVC管材管件', '个', 'Φ110*50', 'PVC', '', '9', '董满仓', '2021-01-27 16:39:47', null);
INSERT INTO `dtoa_material` VALUES ('1470', '11110057', 'PVC吊卡', '129', '11110', 'PVC管材管件', '套', 'Φ110', 'PVC', '', '9', '董满仓', '2021-01-27 16:40:52', null);
INSERT INTO `dtoa_material` VALUES ('1471', '11110058', 'PVC吊卡', '129', '11110', 'PVC管材管件', '套', 'Φ50', 'PVC', '', '9', '董满仓', '2021-01-27 16:44:30', null);
INSERT INTO `dtoa_material` VALUES ('1472', '50105008', '吊车', '85', '50105', '吊车', '班', '35吨', '', '', '9', '董满仓', '2021-01-29 14:16:03', null);
INSERT INTO `dtoa_material` VALUES ('1473', '50105009', '吊车', '85', '50105', '吊车', '班', '75吨', '', '', '9', '董满仓', '2021-01-29 14:28:24', null);
INSERT INTO `dtoa_material` VALUES ('1474', '50105010', '吊车', '85', '50105', '吊车', '班', '100吨', '', '', '9', '董满仓', '2021-01-29 14:28:38', null);
INSERT INTO `dtoa_material` VALUES ('1475', '10702010', '刀锯', '118', '10702', '五金工具', '把', '', '', '', '9', '董满仓', '2021-02-04 15:04:56', null);
INSERT INTO `dtoa_material` VALUES ('1476', '11117008', 'PE管箍', '152', '11117', 'PE管材管件', '个', '20', '', '', '9', '董满仓', '2021-02-04 15:05:39', null);
INSERT INTO `dtoa_material` VALUES ('1477', '10702011', '游标卡尺', '118', '10702', '五金工具', '把', '150', '', '', '9', '董满仓', '2021-02-04 15:07:27', '2021-02-04 15:08:23');
INSERT INTO `dtoa_material` VALUES ('1478', '11001035', '塑料盖板', '59', '11001', '管线敷设', '个', '86系列', '', '', '9', '董满仓', '2021-02-04 15:08:24', null);
INSERT INTO `dtoa_material` VALUES ('1479', '10902015', '聚苯板', '128', '10902', '保温材料', '方', '18KG/方', '', '', '9', '董满仓', '2021-02-04 15:11:29', null);
INSERT INTO `dtoa_material` VALUES ('1480', '11004034', '防火水平四通', '110', '11004', '线槽桥架', '个', '150*100', '', '', '9', '董满仓', '2021-02-04 16:05:24', null);
INSERT INTO `dtoa_material` VALUES ('1481', '11004035', '防火横担', '110', '11004', '线槽桥架', '个', '260', '', '', '9', '董满仓', '2021-02-04 16:06:40', null);
INSERT INTO `dtoa_material` VALUES ('1482', '11110059', 'PVC斜三通', '129', '11110', 'PVC管材管件', '个', 'Φ110*50', 'PVC', '', '9', '董满仓', '2021-02-04 16:07:52', null);
INSERT INTO `dtoa_material` VALUES ('1483', '11110060', 'PVC座卡', '129', '11110', 'PVC管材管件', '个', '25', '', '', '9', '董满仓', '2021-02-04 16:09:57', null);
INSERT INTO `dtoa_material` VALUES ('1484', '113030', '写字白板', '88', '113', '办公用品', '块', '60*45cm', '', '', '9', '董满仓', '2021-02-04 16:12:37', null);
INSERT INTO `dtoa_material` VALUES ('1485', '11005030', 'LED单管荧光灯', '112', '11005', '灯具', '套', '14w', '', '', '9', '董满仓', '2021-02-04 16:13:56', null);
INSERT INTO `dtoa_material` VALUES ('1486', '11110061', 'PVC伸缩节', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '9', '董满仓', '2021-02-04 16:15:42', null);
INSERT INTO `dtoa_material` VALUES ('1487', '11110062', 'PVC清扫口', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '9', '董满仓', '2021-02-04 16:16:42', null);
INSERT INTO `dtoa_material` VALUES ('1488', '11110063', 'PVC清扫口', '129', '11110', 'PVC管材管件', '个', 'Φ50', 'PVC', '', '9', '董满仓', '2021-02-04 16:41:45', null);
INSERT INTO `dtoa_material` VALUES ('1489', '10702012', '橡皮锤', '118', '10702', '五金工具', '把', '', '', '', '9', '董满仓', '2021-02-04 16:42:06', null);
INSERT INTO `dtoa_material` VALUES ('1490', '1010204005', '镀锌角钢', '135', '1010204', '角钢', '米', '30*3', '', '', '9', '董满仓', '2021-02-04 16:43:25', null);
INSERT INTO `dtoa_material` VALUES ('1491', '112045', '棉被', '41', '112', '低值易耗品', '条', '1.5米*2米', '', '', '9', '董满仓', '2021-02-04 16:45:59', null);
INSERT INTO `dtoa_material` VALUES ('1492', '112046', '草帘子', '41', '112', '低值易耗品', '块', '', '', '', '9', '董满仓', '2021-02-04 16:49:37', null);
INSERT INTO `dtoa_material` VALUES ('1493', '11110064', 'PVC螺旋消音管', '129', '11110', 'PVC管材管件', '米', 'Φ110', 'PVC', '', '9', '董满仓', '2021-02-04 16:50:01', null);
INSERT INTO `dtoa_material` VALUES ('1494', '11110065', 'PVC消音三通', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '9', '董满仓', '2021-02-04 16:50:42', null);
INSERT INTO `dtoa_material` VALUES ('1495', '11110066', 'PVC消音检查口', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '9', '董满仓', '2021-02-04 16:51:56', null);
INSERT INTO `dtoa_material` VALUES ('1496', '11110067', 'PVC斜四通', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '9', '董满仓', '2021-02-05 08:24:29', null);
INSERT INTO `dtoa_material` VALUES ('1497', '11001036', '铁方盒', '59', '11001', '管线敷设', '个', '86H50', '', '', '9', '董满仓', '2021-02-05 08:28:33', null);
INSERT INTO `dtoa_material` VALUES ('1498', '10802012', '橡塑海绵专用胶', '117', '10802', '化工产品', '桶', '20KG', '', '', '9', '董满仓', '2021-02-05 08:39:21', null);
INSERT INTO `dtoa_material` VALUES ('1499', '11002044', '钩卡', '91', '11002', '电气辅材', '个', '32', '', '', '9', '董满仓', '2021-02-05 09:48:14', '2021-02-05 11:31:12');
INSERT INTO `dtoa_material` VALUES ('1500', '11002045', '钩卡', '91', '11002', '电气辅材', '个', '25', '', '', '9', '董满仓', '2021-02-05 09:49:01', '2021-02-05 11:31:33');
INSERT INTO `dtoa_material` VALUES ('1501', '10902016', '地暖保温边条', '128', '10902', '保温材料', '米', '', '', '', '9', '董满仓', '2021-02-05 09:49:17', null);
INSERT INTO `dtoa_material` VALUES ('1502', '11110068', 'PVC顺水四通', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '9', '董满仓', '2021-02-05 09:51:19', null);
INSERT INTO `dtoa_material` VALUES ('1503', '11110069', 'PVC直角立体四通', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '9', '董满仓', '2021-02-05 09:54:13', null);
INSERT INTO `dtoa_material` VALUES ('1504', '11103032', '镀锌衬塑三通', '94', '11103', '镀锌衬塑管件', '个', 'DN50*25', '镀锌衬塑', '', '9', '董满仓', '2021-02-05 10:06:42', '2021-02-05 10:09:05');
INSERT INTO `dtoa_material` VALUES ('1505', '11103033', '镀锌衬塑三通', '94', '11103', '镀锌衬塑管件', '个', 'DN50*40', '镀锌衬塑', '', '9', '董满仓', '2021-02-05 10:09:05', null);
INSERT INTO `dtoa_material` VALUES ('1506', '11103034', '镀锌衬塑三通', '94', '11103', '镀锌衬塑管件', '个', 'DN50*20', '镀锌衬塑', '', '9', '董满仓', '2021-02-05 10:11:28', null);
INSERT INTO `dtoa_material` VALUES ('1507', '10702013', '雪铲', '118', '10702', '五金工具', '把', '', '', '', '9', '董满仓', '2021-02-05 10:11:54', null);
INSERT INTO `dtoa_material` VALUES ('1508', '11110070', 'PVC检查口', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '9', '董满仓', '2021-02-05 10:13:13', null);
INSERT INTO `dtoa_material` VALUES ('1509', '11110071', 'PVC雨水斗', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '9', '董满仓', '2021-02-05 10:45:55', null);
INSERT INTO `dtoa_material` VALUES ('1510', '11001037', 'JDG镀锌管', '59', '11001', '管线敷设', '米', 'Φ25', '', '', '9', '董满仓', '2021-02-05 10:53:40', null);
INSERT INTO `dtoa_material` VALUES ('1511', '11001038', 'JDG盒接', '59', '11001', '管线敷设', '个', 'Φ25', '', '', '9', '董满仓', '2021-02-05 10:55:40', null);
INSERT INTO `dtoa_material` VALUES ('1512', '11001039', 'JDG直接', '59', '11001', '管线敷设', '个', 'Φ25', '', '', '9', '董满仓', '2021-02-05 10:56:22', null);
INSERT INTO `dtoa_material` VALUES ('1513', '11108003', '电熔三通', '111', '11108', '电熔管材管件', '个', '110*63', '', '', '9', '董满仓', '2021-02-05 10:56:36', null);
INSERT INTO `dtoa_material` VALUES ('1514', '11117009', 'PE热熔外丝直接', '152', '11117', 'PE管材管件', '个', '63*50', '', '', '9', '董满仓', '2021-02-05 10:59:49', null);
INSERT INTO `dtoa_material` VALUES ('1515', '10701107', '双头螺栓', '90', '10701', '五金材料', '套', 'M16*200', '', '', '9', '董满仓', '2021-02-05 11:00:56', null);
INSERT INTO `dtoa_material` VALUES ('1516', '11002046', '钩卡', '91', '11002', '电气辅材', '个', '20', '', '', '9', '董满仓', '2021-02-05 11:02:06', '2021-02-05 11:31:42');
INSERT INTO `dtoa_material` VALUES ('1517', '11110072', 'PVC消音三通', '129', '11110', 'PVC管材管件', '个', 'Φ110*50', 'PVC', '', '9', '董满仓', '2021-02-05 11:07:15', null);
INSERT INTO `dtoa_material` VALUES ('1518', '10701108', '木工锯片', '90', '10701', '五金材料', '片', '100', '金属', '', '9', '董满仓', '2021-02-05 11:08:05', null);
INSERT INTO `dtoa_material` VALUES ('1519', '11103035', '镀锌衬塑三通', '94', '11103', '镀锌衬塑管件', '个', 'DN25', '镀锌衬塑', '', '9', '董满仓', '2021-02-05 11:10:57', '2021-02-05 11:15:19');
INSERT INTO `dtoa_material` VALUES ('1520', '11103036', '镀锌衬塑三通', '94', '11103', '镀锌衬塑管件', '个', 'DN15', '镀锌衬塑', '', '9', '董满仓', '2021-02-05 11:15:20', null);
INSERT INTO `dtoa_material` VALUES ('1521', '11103037', '镀锌衬塑管箍', '94', '11103', '镀锌衬塑管件', '个', 'DN50*15', '镀锌衬塑', '', '9', '董满仓', '2021-02-05 11:16:04', null);
INSERT INTO `dtoa_material` VALUES ('1522', '11103038', '镀锌衬塑管箍', '94', '11103', '镀锌衬塑管件', '个', 'DN25*15', '镀锌衬塑', '', '9', '董满仓', '2021-02-05 11:16:56', null);
INSERT INTO `dtoa_material` VALUES ('1523', '11103039', '镀锌衬塑管箍', '94', '11103', '镀锌衬塑管件', '个', 'DN50', '镀锌衬塑', '', '9', '董满仓', '2021-02-05 11:17:34', null);
INSERT INTO `dtoa_material` VALUES ('1524', '11103040', '镀锌衬塑管箍', '94', '11103', '镀锌衬塑管件', '个', 'DN15', '镀锌衬塑', '', '9', '董满仓', '2021-02-05 11:18:14', null);
INSERT INTO `dtoa_material` VALUES ('1525', '11103041', '镀锌衬塑油任', '94', '11103', '镀锌衬塑管件', '个', 'DN50', '镀锌衬塑', '', '9', '董满仓', '2021-02-05 11:19:51', null);
INSERT INTO `dtoa_material` VALUES ('1526', '11103042', '镀锌衬塑油任', '94', '11103', '镀锌衬塑管件', '个', 'DN20', '镀锌衬塑', '', '9', '董满仓', '2021-02-05 11:21:08', null);
INSERT INTO `dtoa_material` VALUES ('1527', '11103043', '镀锌衬塑油任', '94', '11103', '镀锌衬塑管件', '个', 'DN15', '镀锌衬塑', '', '9', '董满仓', '2021-02-05 11:21:42', null);
INSERT INTO `dtoa_material` VALUES ('1528', '10702014', '十字改锥', '118', '10702', '五金工具', '把', '150', '', '', '9', '董满仓', '2021-02-05 11:21:59', null);
INSERT INTO `dtoa_material` VALUES ('1529', '10702015', '剥线钳', '118', '10702', '五金工具', '把', '', '', '', '9', '董满仓', '2021-02-05 11:23:42', null);
INSERT INTO `dtoa_material` VALUES ('1530', '30202016', '苫布', '47', '30202', '文明施工', '块', '6*8米', '', '', '9', '董满仓', '2021-02-05 11:24:15', null);
INSERT INTO `dtoa_material` VALUES ('1531', '11002047', '镀锌扁铁卡子（带胀栓）', '91', '11002', '电气辅材', '个', '', '', '', '9', '董满仓', '2021-02-05 11:31:43', null);
INSERT INTO `dtoa_material` VALUES ('1532', '10701109', '钢丝锁', '90', '10701', '五金材料', '把', '', '', '', '9', '董满仓', '2021-02-05 11:32:26', null);
INSERT INTO `dtoa_material` VALUES ('1533', '11005031', '灯泡', '112', '11005', '灯具', '个', '200W', '', '', '9', '董满仓', '2021-02-05 13:25:09', null);
INSERT INTO `dtoa_material` VALUES ('1534', '11005032', '瓷灯口', '112', '11005', '灯具', '个', '', '', '', '9', '董满仓', '2021-02-05 13:26:06', null);
INSERT INTO `dtoa_material` VALUES ('1535', '11107075', '铸铁方雨水口', '109', '11107', '球墨管材管件', '个', '240墙', '', '', '9', '董满仓', '2021-02-05 13:27:14', null);
INSERT INTO `dtoa_material` VALUES ('1536', '10701110', '通丝', '90', '10701', '五金材料', '米', 'M6', '', '', '9', '董满仓', '2021-02-05 13:28:20', null);
INSERT INTO `dtoa_material` VALUES ('1537', '10403012', '蒸压加气块', '101', '10403', '砌块砖等', '方', '50*240*600', '', '', '9', '董满仓', '2021-03-02 11:20:03', null);
INSERT INTO `dtoa_material` VALUES ('1538', '11001040', '波纹管', '59', '11001', '管线敷设', '米', 'Φ32', '塑料', '', '9', '董满仓', '2021-03-29 14:51:22', null);
INSERT INTO `dtoa_material` VALUES ('1539', '11110073', 'PVC弯头', '129', '11110', 'PVC管材管件', '个', 'Φ75*90°', 'PVC', '', '9', '董满仓', '2021-04-12 15:14:45', null);
INSERT INTO `dtoa_material` VALUES ('1540', '10701111', '火烧丝', '90', '10701', '五金材料', '捆', '22#300mm', '', '', '9', '董满仓', '2021-04-12 15:17:44', null);
INSERT INTO `dtoa_material` VALUES ('1541', '10701112', '电锤钻头', '90', '10701', '五金材料', '支', '14*200', '', '', '9', '董满仓', '2021-04-12 15:33:40', null);
INSERT INTO `dtoa_material` VALUES ('1542', '10701113', '电锤錾子', '90', '10701', '五金材料', '支', '扁錾子', '', '', '9', '董满仓', '2021-04-12 15:35:07', null);
INSERT INTO `dtoa_material` VALUES ('1543', '11002048', '导电膏', '91', '11002', '电气辅材', '盒', '', '', '', '9', '董满仓', '2021-04-12 15:36:42', null);
INSERT INTO `dtoa_material` VALUES ('1544', '11002049', 'JDG管接地卡子', '91', '11002', '电气辅材', '个', '20', '', '', '9', '董满仓', '2021-04-12 15:37:40', null);
INSERT INTO `dtoa_material` VALUES ('1545', '10702016', 'JDG管弯管器', '118', '10702', '五金工具', '把', '20', '', '', '9', '董满仓', '2021-04-12 15:39:08', null);
INSERT INTO `dtoa_material` VALUES ('1546', '10701114', '自攻丝', '90', '10701', '五金材料', '个', '4.2*50mm', '', '', '9', '董满仓', '2021-04-12 15:42:37', null);
INSERT INTO `dtoa_material` VALUES ('1547', '10701115', '元宝卡子', '90', '10701', '五金材料', '个', '20', '', '', '9', '董满仓', '2021-04-12 15:44:38', null);
INSERT INTO `dtoa_material` VALUES ('1548', '11004036', '防火上垂弯头', '110', '11004', '线槽桥架', '个', '200*100', '', '', '9', '董满仓', '2021-04-12 15:45:37', '2021-04-12 15:49:21');
INSERT INTO `dtoa_material` VALUES ('1549', '11004037', '防火左上弯头', '110', '11004', '线槽桥架', '个', '200*100', '', '', '9', '董满仓', '2021-04-12 15:49:22', null);
INSERT INTO `dtoa_material` VALUES ('1550', '11004038', '防火右上弯头', '110', '11004', '线槽桥架', '个', '200*100', '', '', '9', '董满仓', '2021-04-12 15:49:43', null);
INSERT INTO `dtoa_material` VALUES ('1551', '11004039', '防火左下弯头', '110', '11004', '线槽桥架', '个', '200*100', '', '', '9', '董满仓', '2021-04-12 15:50:04', null);
INSERT INTO `dtoa_material` VALUES ('1552', '11004040', '防火右下弯头', '110', '11004', '线槽桥架', '个', '200*100', '', '', '9', '董满仓', '2021-04-12 15:50:28', null);
INSERT INTO `dtoa_material` VALUES ('1553', '11105058', 'PPR管帽', '107', '11105', 'PPR管材管件', '个', '25', 'PPR', '', '9', '董满仓', '2021-04-12 15:50:44', null);
INSERT INTO `dtoa_material` VALUES ('1554', '11105059', 'PPR内丝弯头', '107', '11105', 'PPR管材管件', '个', '25*1/2', 'PPR', '', '9', '董满仓', '2021-04-12 15:58:39', null);
INSERT INTO `dtoa_material` VALUES ('1555', '10701116', '砂轮切割片', '90', '10701', '五金材料', '个', 'Φ100', '树脂砂轮', '', '9', '董满仓', '2021-04-12 16:00:20', null);
INSERT INTO `dtoa_material` VALUES ('1556', '10701117', '镀锌通丝', '90', '10701', '五金材料', '米', 'M10', '', '', '9', '董满仓', '2021-04-12 16:04:35', null);
INSERT INTO `dtoa_material` VALUES ('1557', '10701118', '拉爆', '90', '10701', '五金材料', '个', 'M10', '', '', '9', '董满仓', '2021-04-12 16:05:27', null);
INSERT INTO `dtoa_material` VALUES ('1558', '11001041', 'JDG镀锌管', '59', '11001', '管线敷设', '米', 'Φ20', '', '', '9', '董满仓', '2021-04-12 16:06:09', null);
INSERT INTO `dtoa_material` VALUES ('1559', '11110074', 'PVC管箍', '129', '11110', 'PVC管材管件', '个', 'Φ75', 'PVC', '', '9', '董满仓', '2021-04-13 08:31:23', null);
INSERT INTO `dtoa_material` VALUES ('1560', '11106005', '加压泵', '108', '11106', '水暖设备（消耗）', '台', '55KW-30L/S', '', '', '9', '董满仓', '2021-04-20 09:21:37', null);
INSERT INTO `dtoa_material` VALUES ('1561', '11106006', '加压泵', '108', '11106', '水暖设备（消耗）', '台', '22KW-15L/S', '', '', '9', '董满仓', '2021-04-20 09:25:43', null);
INSERT INTO `dtoa_material` VALUES ('1562', '11106007', '稳压泵', '108', '11106', '水暖设备（消耗）', '台', '2.2KW-1.5L/S', '', '', '9', '董满仓', '2021-04-20 09:26:34', null);
INSERT INTO `dtoa_material` VALUES ('1563', '11106008', '潜污泵', '108', '11106', '水暖设备（消耗）', '台', '4KW-40', '', '', '9', '董满仓', '2021-04-20 09:27:30', null);
INSERT INTO `dtoa_material` VALUES ('1564', '11003089', '水泵控制箱', '105', '11003', '电箱', '台', 'CQK-XF-XY-4', '', '', '9', '董满仓', '2021-04-20 09:28:27', null);
INSERT INTO `dtoa_material` VALUES ('1565', '11003090', '水泵控制柜', '105', '11003', '电箱', '台', 'CQK-2L-4', '', '', '9', '董满仓', '2021-04-20 09:30:41', null);
INSERT INTO `dtoa_material` VALUES ('1566', '11106009', '气压罐', '108', '11106', '水暖设备（消耗）', '台', 'SQL800*0.6MPA  V=150L', '', '', '9', '董满仓', '2021-04-20 09:31:20', null);
INSERT INTO `dtoa_material` VALUES ('1567', '11003091', 'B1AT-XFB配电柜', '105', '11003', '电箱', '台', '800*2000*600', '金属', '含芯', '9', '董满仓', '2021-04-20 09:32:37', '2021-04-20 09:39:20');
INSERT INTO `dtoa_material` VALUES ('1568', '11003092', 'TH-F消防巡检柜', '105', '11003', '电箱', '台', '2000*600*800', '金属', '含芯', '9', '董满仓', '2021-04-20 09:39:21', null);
INSERT INTO `dtoa_material` VALUES ('1569', '11003093', 'AC-PLB消防巡检柜', '105', '11003', '电箱', '台', '2000*600*800', '金属', '含芯', '9', '董满仓', '2021-04-20 09:42:18', null);
INSERT INTO `dtoa_material` VALUES ('1570', '11003094', 'AC-XFB消防泵控制柜', '105', '11003', '电箱', '台', '2000*600*800', '金属', '含芯', '9', '董满仓', '2021-04-20 09:43:00', null);
INSERT INTO `dtoa_material` VALUES ('1571', '11003095', 'B1AP-XF消防配电柜', '105', '11003', '电箱', '台', '2000*600*800', '金属', '含芯', '9', '董满仓', '2021-04-20 09:45:49', '2021-04-20 09:53:43');
INSERT INTO `dtoa_material` VALUES ('1572', '11008033', '铜排', '115', '11008', '电气设备安装材料', '根', '50mm*5mm*6m', '', '', '9', '董满仓', '2021-04-20 09:47:00', '2021-04-20 09:53:01');
INSERT INTO `dtoa_material` VALUES ('1573', '11008034', '铜排', '115', '11008', '电气设备安装材料', '根', '40mm*5mm*6m', '', '', '9', '董满仓', '2021-04-20 09:48:32', null);
INSERT INTO `dtoa_material` VALUES ('1574', '10703020', '焊接冲压弯头', '119', '10703', '焊接冲压管件', '个', '65*90°', '熟铁', '', '9', '董满仓', '2021-05-08 08:34:20', null);
INSERT INTO `dtoa_material` VALUES ('1575', '10703021', '焊接冲压弯头', '119', '10703', '焊接冲压管件', '个', '65*45°', '熟铁', '', '9', '董满仓', '2021-05-08 08:36:06', null);
INSERT INTO `dtoa_material` VALUES ('1576', '10902017', '聚氨酯保温壳', '128', '10902', '保温材料', '米', '65*10厚', '', '', '9', '董满仓', '2021-05-08 10:05:10', null);
INSERT INTO `dtoa_material` VALUES ('1577', '10902018', '聚氨酯保温壳', '128', '10902', '保温材料', ' 米', '50*10厚', '', '', '9', '董满仓', '2021-05-08 10:07:10', null);
INSERT INTO `dtoa_material` VALUES ('1578', '11102067', '手柄蝶阀', '93', '11102', '控水主材', '个', 'DN65', '', '', '9', '董满仓', '2021-05-08 10:07:37', null);
INSERT INTO `dtoa_material` VALUES ('1579', '11101081', '镀锌中大三通', '92', '11101', '镀锌管件', '个', 'DN50*65', '热镀锌', '', '9', '董满仓', '2021-05-08 14:13:13', null);
INSERT INTO `dtoa_material` VALUES ('1580', '11101082', '镀锌快接管箍', '92', '11101', '镀锌管件', '个', 'DN50', '热镀锌', '', '9', '董满仓', '2021-05-08 14:14:11', null);
INSERT INTO `dtoa_material` VALUES ('1581', '11101083', '镀锌快接管箍', '92', '11101', '镀锌管件', '个', 'DN65', '热镀锌', '', '9', '董满仓', '2021-05-08 14:28:42', null);
INSERT INTO `dtoa_material` VALUES ('1582', '11109045', '马桶水箱配件', '122', '11109', '水暖辅材', '套', '', '', '', '1', '管理员', '2021-05-08 15:31:26', null);
INSERT INTO `dtoa_material` VALUES ('1583', '50108004', '胶轮破碎机', '141', '50108', '破碎机', '班', '150型', '', '', '9', '董满仓', '2021-05-08 16:45:54', null);
INSERT INTO `dtoa_material` VALUES ('1584', '11110075', 'PVC吊卡', '129', '11110', 'PVC管材管件', '套', 'Φ75', 'PVC', '', '9', '董满仓', '2021-05-18 09:16:20', null);
INSERT INTO `dtoa_material` VALUES ('1585', '11006018', 'PVC管', '113', '11006', 'PVC线管材件', '米', 'Φ16', '', '', '9', '董满仓', '2021-05-18 09:17:31', null);
INSERT INTO `dtoa_material` VALUES ('1586', '10701119', '膨胀螺栓', '90', '10701', '五金材料', '个', 'M10*80', '', '', '9', '董满仓', '2021-05-18 09:19:20', null);
INSERT INTO `dtoa_material` VALUES ('1587', '10701120', '膨胀螺栓', '90', '10701', '五金材料', '个', 'M6*60', '', '', '9', '董满仓', '2021-05-18 09:20:53', null);
INSERT INTO `dtoa_material` VALUES ('1588', '11110076', 'PVC铜盖地平清扫口', '129', '11110', 'PVC管材管件', '个', 'Φ110', '', '', '9', '董满仓', '2021-05-18 09:22:06', '2021-05-18 09:25:59');
INSERT INTO `dtoa_material` VALUES ('1589', '11110077', 'PVC铜盖地平清扫口', '129', '11110', 'PVC管材管件', '个', 'Φ75', '', '', '9', '董满仓', '2021-05-18 09:26:00', null);
INSERT INTO `dtoa_material` VALUES ('1590', '11110078', 'PVC管箍', '129', '11110', 'PVC管材管件', '个', 'Φ75*50', 'PVC', '', '9', '董满仓', '2021-05-18 09:26:29', null);
INSERT INTO `dtoa_material` VALUES ('1591', '11110079', 'P型反水弯', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '9', '董满仓', '2021-05-18 09:35:20', null);
INSERT INTO `dtoa_material` VALUES ('1592', '11003096', '三级配电箱', '105', '11003', '电箱', '台', '', '金属', '套装', '9', '董满仓', '2021-05-18 09:37:15', null);
INSERT INTO `dtoa_material` VALUES ('1593', '11007054', 'YC橡套电缆', '114', '11007', '电线电缆', '米', '5*6mm²', '铜芯', '', '9', '董满仓', '2021-05-18 09:44:18', null);
INSERT INTO `dtoa_material` VALUES ('1594', '112047', '焊帽', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-05-18 09:45:19', null);
INSERT INTO `dtoa_material` VALUES ('1595', '112048', '焊工手套', '41', '112', '低值易耗品', '付', '', '', '', '9', '董满仓', '2021-05-18 09:46:21', null);
INSERT INTO `dtoa_material` VALUES ('1596', '10701121', '云石片', '90', '10701', '五金材料', '片', '100', '', '合金片', '9', '董满仓', '2021-05-18 09:46:59', null);
INSERT INTO `dtoa_material` VALUES ('1597', '10701122', '铁錾子', '90', '10701', '五金材料', '根', '', '', '', '9', '董满仓', '2021-05-18 09:48:46', null);
INSERT INTO `dtoa_material` VALUES ('1598', '10701123', '一体钉', '90', '10701', '五金材料', '个', 'M8', '金属', '自爆吊顶钉', '9', '董满仓', '2021-05-18 10:02:30', '2021-05-19 09:28:42');
INSERT INTO `dtoa_material` VALUES ('1599', '11002050', '炮钉管卡', '91', '11002', '电气辅材', '个', '20', '', '', '9', '董满仓', '2021-05-18 10:07:29', null);
INSERT INTO `dtoa_material` VALUES ('1600', '11002051', '炮钉管卡', '91', '11002', '电气辅材', '个', '25', '', '', '9', '董满仓', '2021-05-18 10:09:46', null);
INSERT INTO `dtoa_material` VALUES ('1601', '10702017', '炮枪', '118', '10702', '五金工具', '把', '', '', '', '9', '董满仓', '2021-05-18 10:10:04', null);
INSERT INTO `dtoa_material` VALUES ('1602', '10701124', '圆头炮钉', '90', '10701', '五金材料', '个', '', '', '', '9', '董满仓', '2021-05-18 10:10:59', null);
INSERT INTO `dtoa_material` VALUES ('1603', '11001042', 'JDG直接', '59', '11001', '管线敷设', '个', 'Φ32', '', '', '9', '董满仓', '2021-05-18 10:11:34', null);
INSERT INTO `dtoa_material` VALUES ('1604', '10701125', '马鞍卡', '90', '10701', '五金材料', '个', '25', '金属', '', '9', '董满仓', '2021-05-18 10:12:55', null);
INSERT INTO `dtoa_material` VALUES ('1605', '10701126', '马鞍卡', '90', '10701', '五金材料', '个', '32', '金属', '', '9', '董满仓', '2021-05-18 10:14:36', null);
INSERT INTO `dtoa_material` VALUES ('1606', '10703022', '镀锌焊接弯头', '119', '10703', '焊接冲压管件', '个', '100*90°*6倍', '', '', '9', '董满仓', '2021-05-18 10:14:58', '2021-05-18 10:17:51');
INSERT INTO `dtoa_material` VALUES ('1607', '10703023', '镀锌焊接弯头', '119', '10703', '焊接冲压管件', '个', '100*45°*6倍', '', '', '9', '董满仓', '2021-05-18 10:17:02', null);
INSERT INTO `dtoa_material` VALUES ('1608', '10703024', '镀锌焊接弯头', '119', '10703', '焊接冲压管件', '个', '50*90°*6倍', '', '', '9', '董满仓', '2021-05-18 10:17:51', null);
INSERT INTO `dtoa_material` VALUES ('1609', '11007055', 'YC橡套电缆', '114', '11007', '电线电缆', '米', '5*4mm²', '铜芯', '', '9', '董满仓', '2021-05-18 14:49:44', null);
INSERT INTO `dtoa_material` VALUES ('1610', '10802013', '洗洁精', '117', '10802', '化工产品', 'KG', '', '', '', '9', '董满仓', '2021-05-18 14:52:01', null);
INSERT INTO `dtoa_material` VALUES ('1611', '10701127', '燕尾钉', '90', '10701', '五金材料', '个', '5.5*40', '', '', '9', '董满仓', '2021-05-18 14:53:19', '2021-05-18 14:55:24');
INSERT INTO `dtoa_material` VALUES ('1612', '10701128', '六角丝套头', '90', '10701', '五金材料', '个', '10', '', '', '9', '董满仓', '2021-05-18 14:55:25', '2021-06-11 17:24:10');
INSERT INTO `dtoa_material` VALUES ('1613', '10701128', '六角丝套头', '90', '10701', '五金材料', '个', '8', '', '', '9', '董满仓', '2021-05-18 14:55:25', null);
INSERT INTO `dtoa_material` VALUES ('1614', '10503008', '快干粉', '134', '10503', '小型材料', '袋', '5KG', '', '', '9', '董满仓', '2021-05-18 14:59:32', null);
INSERT INTO `dtoa_material` VALUES ('1615', '112049', '塑料桶', '41', '112', '低值易耗品', '个', '200L', '', '', '9', '董满仓', '2021-05-18 15:06:10', null);
INSERT INTO `dtoa_material` VALUES ('1616', '10701129', '燕尾钉', '90', '10701', '五金材料', '个', '5.5*20', '', '', '9', '董满仓', '2021-05-18 15:07:28', null);
INSERT INTO `dtoa_material` VALUES ('1617', '10701130', '通丝接母', '90', '10701', '五金材料', '个', 'M8', '', '连接通丝', '9', '董满仓', '2021-05-18 15:10:46', null);
INSERT INTO `dtoa_material` VALUES ('1618', '10701131', '通丝接母', '90', '10701', '五金材料', '个', 'M10', '', '连接通丝', '9', '董满仓', '2021-05-18 15:11:56', null);
INSERT INTO `dtoa_material` VALUES ('1620', '11002052', '灯具保险钩', '91', '11002', '电气辅材', '个', '', '', '', '9', '董满仓', '2021-05-18 15:14:16', null);
INSERT INTO `dtoa_material` VALUES ('1621', '11002053', '灯具吊环', '91', '11002', '电气辅材', '个', '', '', '', '9', '董满仓', '2021-05-18 15:15:28', null);
INSERT INTO `dtoa_material` VALUES ('1622', '10701132', '镀锌螺栓', '90', '10701', '五金材料', '套', 'M8*25', '', '', '9', '董满仓', '2021-05-18 15:17:36', null);
INSERT INTO `dtoa_material` VALUES ('1623', '11004041', '横担', '110', '11004', '线槽桥架', '个', '150', '', '', '9', '董满仓', '2021-05-18 15:18:51', null);
INSERT INTO `dtoa_material` VALUES ('1624', '11001043', '包塑软管', '59', '11001', '管线敷设', '米', 'Φ16', '金属包塑', '', '9', '董满仓', '2021-05-18 15:20:30', '2021-05-18 15:25:04');
INSERT INTO `dtoa_material` VALUES ('1625', '11002054', '包塑软管接头', '91', '11002', '电气辅材', '个', 'Φ16', '', '', '9', '董满仓', '2021-05-18 15:25:05', null);
INSERT INTO `dtoa_material` VALUES ('1626', '11004042', '防火桥架伸缩节', '110', '11004', '线槽桥架', '个', '200*100', '', '', '9', '董满仓', '2021-05-18 15:33:09', null);
INSERT INTO `dtoa_material` VALUES ('1627', '11002055', '引线穿线器', '91', '11002', '电气辅材', '个', '30米', '', '', '9', '董满仓', '2021-05-18 15:34:04', null);
INSERT INTO `dtoa_material` VALUES ('1628', '10701133', '不锈钢开孔器', '90', '10701', '五金材料', '个', 'Φ32', '', '', '9', '董满仓', '2021-05-18 15:37:57', null);
INSERT INTO `dtoa_material` VALUES ('1629', '10701134', '不锈钢开孔器', '90', '10701', '五金材料', '个', 'Φ25', '', '', '9', '董满仓', '2021-05-18 15:39:26', null);
INSERT INTO `dtoa_material` VALUES ('1630', '11002056', '尼龙绑扎带', '91', '11002', '电气辅材', '包', '4*200', '', '', '9', '董满仓', '2021-05-18 15:39:46', '2021-05-18 15:40:59');
INSERT INTO `dtoa_material` VALUES ('1631', '10701135', '麻花钻头', '90', '10701', '五金材料', '支', 'M8', '', '', '9', '董满仓', '2021-05-18 15:40:59', null);
INSERT INTO `dtoa_material` VALUES ('1632', '112050', '尼龙小线', '41', '112', '低值易耗品', 'kg', '', '', '', '9', '董满仓', '2021-05-18 15:41:49', null);
INSERT INTO `dtoa_material` VALUES ('1633', '11004043', '防火水平三通', '110', '11004', '线槽桥架', '个', '300*100', '', '', '9', '董满仓', '2021-05-18 15:43:27', null);
INSERT INTO `dtoa_material` VALUES ('1634', '11004044', '防火上垂直弯头', '110', '11004', '线槽桥架', '个', '300*100', '', '', '9', '董满仓', '2021-05-18 16:09:28', '2021-05-18 16:11:10');
INSERT INTO `dtoa_material` VALUES ('1635', '11004045', '防火下垂直弯头', '110', '11004', '线槽桥架', '个', '300*100', '', '', '9', '董满仓', '2021-05-18 16:11:11', null);
INSERT INTO `dtoa_material` VALUES ('1636', '11004046', '防火变径接头', '110', '11004', '线槽桥架', '个', '300*200', '', '', '9', '董满仓', '2021-05-18 16:11:30', null);
INSERT INTO `dtoa_material` VALUES ('1637', '11004047', '防火横担', '110', '11004', '线槽桥架', '个', '360', '', '', '9', '董满仓', '2021-05-18 16:13:58', null);
INSERT INTO `dtoa_material` VALUES ('1638', '11004048', '镀锌线槽桥架', '110', '11004', '线槽桥架', '米', '200*100', '', '', '9', '董满仓', '2021-05-18 16:15:05', null);
INSERT INTO `dtoa_material` VALUES ('1639', '11004049', '镀锌水平三通', '110', '11004', '线槽桥架', '个', '200*100', '', '', '9', '董满仓', '2021-05-19 08:40:14', null);
INSERT INTO `dtoa_material` VALUES ('1640', '11004050', '镀锌上垂直弯头', '110', '11004', '线槽桥架', '个', '200*100', '', '', '9', '董满仓', '2021-05-19 08:47:52', null);
INSERT INTO `dtoa_material` VALUES ('1641', '11004051', '镀锌下垂直弯头', '110', '11004', '线槽桥架', '个', '200*100', '', '', '9', '董满仓', '2021-05-19 08:48:22', null);
INSERT INTO `dtoa_material` VALUES ('1642', '11004052', '横担', '110', '11004', '线槽桥架', '个', '200', '', '', '9', '董满仓', '2021-05-19 08:48:43', null);
INSERT INTO `dtoa_material` VALUES ('1643', '11004053', '镀锌水平三通', '110', '11004', '线槽桥架', '个', '150*100', '', '', '9', '董满仓', '2021-05-19 09:10:10', null);
INSERT INTO `dtoa_material` VALUES ('1644', '11004054', '镀锌上垂直弯头', '110', '11004', '线槽桥架', '个', '150*100', '', '', '9', '董满仓', '2021-05-19 09:11:48', null);
INSERT INTO `dtoa_material` VALUES ('1645', '11004055', '镀锌下垂直弯头', '110', '11004', '线槽桥架', '个', '150*100', '', '', '9', '董满仓', '2021-05-19 09:12:35', null);
INSERT INTO `dtoa_material` VALUES ('1646', '30102003', '低压变压器', '146', '30102', '机械设备', '台', '380-220-36-3000W', '', '', '9', '董满仓', '2021-05-19 09:12:51', null);
INSERT INTO `dtoa_material` VALUES ('1647', '11007056', '塑铝线', '114', '11007', '电线电缆', '米', '10mm²', '', '', '9', '董满仓', '2021-05-19 09:18:32', null);
INSERT INTO `dtoa_material` VALUES ('1648', '11005033', '手把灯', '112', '11005', '灯具', '个', '', '', '', '9', '董满仓', '2021-05-19 09:23:07', null);
INSERT INTO `dtoa_material` VALUES ('1649', '113031', '橡皮', '88', '113', '办公用品', '个', '', '', '', '9', '董满仓', '2021-05-19 09:28:42', null);
INSERT INTO `dtoa_material` VALUES ('1650', '113032', '直尺', '88', '113', '办公用品', '个', '30CM', '', '', '9', '董满仓', '2021-05-19 09:29:44', null);
INSERT INTO `dtoa_material` VALUES ('1651', '113033', '胶水', '88', '113', '办公用品', '瓶', '', '', '', '9', '董满仓', '2021-05-19 09:30:15', null);
INSERT INTO `dtoa_material` VALUES ('1652', '113034', '剪刀', '88', '113', '办公用品', '个', '', '', '', '9', '董满仓', '2021-05-19 09:31:05', null);
INSERT INTO `dtoa_material` VALUES ('1653', '113035', '筑业资料软件', '88', '113', '办公用品', '套', '', '', '', '9', '董满仓', '2021-05-19 09:31:53', null);
INSERT INTO `dtoa_material` VALUES ('1654', '113036', '长尾夹', '88', '113', '办公用品', '桶', '大号', '', '', '9', '董满仓', '2021-05-19 09:32:51', null);
INSERT INTO `dtoa_material` VALUES ('1655', '113037', '长尾夹', '88', '113', '办公用品', '桶', '小号', '', '', '9', '董满仓', '2021-05-19 09:33:35', null);
INSERT INTO `dtoa_material` VALUES ('1656', '113038', '订书器', '88', '113', '办公用品', '个', '', '', '', '9', '董满仓', '2021-05-19 09:33:56', null);
INSERT INTO `dtoa_material` VALUES ('1657', '113039', '订书钉', '88', '113', '办公用品', '盒', '', '', '', '9', '董满仓', '2021-05-19 09:34:51', null);
INSERT INTO `dtoa_material` VALUES ('1658', '113040', '记号笔', '88', '113', '办公用品', '支', '', '', '', '9', '董满仓', '2021-05-19 09:38:54', null);
INSERT INTO `dtoa_material` VALUES ('1659', '30102004', '复印打印机', '146', '30102', '机械设备', '台', '奔图M6505N', '', '', '9', '董满仓', '2021-05-19 09:39:20', null);
INSERT INTO `dtoa_material` VALUES ('1660', '113041', '档案袋', '88', '113', '办公用品', '个', '', '', '', '9', '董满仓', '2021-05-19 09:40:57', null);
INSERT INTO `dtoa_material` VALUES ('1661', '113042', '信封', '88', '113', '办公用品', '包', '', '', '', '9', '董满仓', '2021-05-19 09:41:55', null);
INSERT INTO `dtoa_material` VALUES ('1662', '113043', '硒鼓', '88', '113', '办公用品', '个', '奔图M6505N', '', '', '9', '董满仓', '2021-05-19 09:42:38', null);
INSERT INTO `dtoa_material` VALUES ('1663', '11005034', 'LED灯泡', '112', '11005', '灯具', '个', '36V18W', '', '', '9', '董满仓', '2021-05-19 10:14:59', null);
INSERT INTO `dtoa_material` VALUES ('1664', '11005035', 'LED灯泡', '112', '11005', '灯具', '个', '220V18W', '', '', '9', '董满仓', '2021-05-19 10:46:19', null);
INSERT INTO `dtoa_material` VALUES ('1665', '11007057', 'WDZ-BYJ塑铜线', '114', '11007', '电线电缆', '米', '6mm²', '', '', '9', '董满仓', '2021-05-24 11:02:06', null);
INSERT INTO `dtoa_material` VALUES ('1666', '11007058', 'WDZ-BYJ塑铜线', '114', '11007', '电线电缆', '米', '16mm²', '', '', '9', '董满仓', '2021-05-24 11:11:59', null);
INSERT INTO `dtoa_material` VALUES ('1667', '11007059', 'WDZN-BYJ塑铜线', '114', '11007', '电线电缆', '米', '4mm²', '', '', '9', '董满仓', '2021-05-24 11:12:54', null);
INSERT INTO `dtoa_material` VALUES ('1668', '11007060', 'WDZN-BYJ塑铜线', '114', '11007', '电线电缆', '米', '6mm²', '', '', '9', '董满仓', '2021-05-24 11:14:20', null);
INSERT INTO `dtoa_material` VALUES ('1669', '11007061', 'WDZN-YJY电缆', '114', '11007', '电线电缆', '米', '5*6mm²', '', '', '9', '董满仓', '2021-05-24 11:19:47', null);
INSERT INTO `dtoa_material` VALUES ('1670', '11007062', 'WDZN-YJY电缆', '114', '11007', '电线电缆', '米', '5*10mm²', '', '', '9', '董满仓', '2021-05-24 11:21:21', '2021-05-24 11:23:15');
INSERT INTO `dtoa_material` VALUES ('1671', '11007063', 'WDZN-YJY电缆', '114', '11007', '电线电缆', '米', '5*16mm²', '', '', '9', '董满仓', '2021-05-24 11:22:38', null);
INSERT INTO `dtoa_material` VALUES ('1672', '11007064', 'WDZ-YJY电缆', '114', '11007', '电线电缆', '米', '5*6mm²', '', '', '9', '董满仓', '2021-05-24 11:23:16', null);
INSERT INTO `dtoa_material` VALUES ('1673', '11007065', 'WDZ-YJY电缆', '114', '11007', '电线电缆', '米', '4*70+1*35mm²', '', '', '9', '董满仓', '2021-05-24 11:24:16', null);
INSERT INTO `dtoa_material` VALUES ('1674', '11007066', 'WDZ-YJY电缆', '114', '11007', '电线电缆', '米', '4*95+1*50mm²', '', '', '9', '董满仓', '2021-05-24 11:26:31', null);
INSERT INTO `dtoa_material` VALUES ('1676', '11007067', 'WDZN-YJY电缆', '114', '11007', '电线电缆', '米', '4*185+1*95mm²', '', '', '9', '董满仓', '2021-05-24 11:28:57', null);
INSERT INTO `dtoa_material` VALUES ('1677', '11007068', 'WDZ-YJV22电缆', '114', '11007', '电线电缆', '米', '4*185+1*95mm²', '', '', '9', '董满仓', '2021-05-24 11:30:24', null);
INSERT INTO `dtoa_material` VALUES ('1678', '11007069', 'WDZ-YJV22电缆', '114', '11007', '电线电缆', '米', '4*240+1*120mm²', '', '', '9', '董满仓', '2021-05-24 11:31:46', null);
INSERT INTO `dtoa_material` VALUES ('1679', '11007070', 'WDZ-YJY电缆', '114', '11007', '电线电缆', '米', '5*10mm²', '', '', '9', '董满仓', '2021-05-27 14:18:44', null);
INSERT INTO `dtoa_material` VALUES ('1680', '11007071', 'WDZ-YJY电缆', '114', '11007', '电线电缆', '米', '3*16mm²', '', '', '9', '董满仓', '2021-05-27 14:20:39', null);
INSERT INTO `dtoa_material` VALUES ('1681', '11007072', 'WDZ-YJY电缆', '114', '11007', '电线电缆', '米', '2*25+1*16mm²', '', '', '9', '董满仓', '2021-05-27 14:21:22', null);
INSERT INTO `dtoa_material` VALUES ('1682', '11007073', 'WDZN-YJY电缆', '114', '11007', '电线电缆', '米', '3*6mm²', '', '', '9', '董满仓', '2021-05-27 14:22:29', null);
INSERT INTO `dtoa_material` VALUES ('1683', '11007074', 'WDZ-BYJ塑铜线', '114', '11007', '电线电缆', '米', '2.5mm²', '', '', '9', '董满仓', '2021-06-03 10:54:00', null);
INSERT INTO `dtoa_material` VALUES ('1684', '215001', '泵送细石混凝土', '161', '215', '泵送细石混凝土', 'm³', 'C15', '', '', '9', '董满仓', '2021-06-09 08:15:23', null);
INSERT INTO `dtoa_material` VALUES ('1685', '215002', '泵送细石混凝土', '161', '215', '泵送细石混凝土', 'm³', 'C20', '', '', '9', '董满仓', '2021-06-09 08:16:25', null);
INSERT INTO `dtoa_material` VALUES ('1686', '215003', '泵送细石混凝土', '161', '215', '泵送细石混凝土', 'm³', 'C25', '', '', '9', '董满仓', '2021-06-09 08:18:26', null);
INSERT INTO `dtoa_material` VALUES ('1687', '215004', '泵送细石混凝土', '161', '215', '泵送细石混凝土', 'm³', 'C30', '', '', '9', '董满仓', '2021-06-09 08:18:51', null);
INSERT INTO `dtoa_material` VALUES ('1688', '215005', '泵送细石混凝土', '161', '215', '泵送细石混凝土', 'm³', 'C35', '', '', '9', '董满仓', '2021-06-09 08:19:16', null);
INSERT INTO `dtoa_material` VALUES ('1689', '215006', '泵送细石混凝土', '161', '215', '泵送细石混凝土', 'm³', 'C40', '', '', '9', '董满仓', '2021-06-09 08:19:47', null);
INSERT INTO `dtoa_material` VALUES ('1690', '215007', '泵送细石混凝土', '161', '215', '泵送细石混凝土', 'm³', 'C45', '', '', '9', '董满仓', '2021-06-09 08:20:08', null);
INSERT INTO `dtoa_material` VALUES ('1691', '112051', '网格水管', '41', '112', '低值易耗品', '盘', '20*50米', '', '', '9', '董满仓', '2021-06-09 09:01:29', '2021-06-11 17:27:40');
INSERT INTO `dtoa_material` VALUES ('1692', '1010201005', '镀锌槽钢', '55', '1010201', '槽钢', '米', '50*100', '', '', '9', '董满仓', '2021-06-09 10:53:35', null);
INSERT INTO `dtoa_material` VALUES ('1693', '11102068', '不锈钢球阀', '93', '11102', '控水主材', '个', 'DN15', '304', '', '9', '董满仓', '2021-06-09 16:14:17', null);
INSERT INTO `dtoa_material` VALUES ('1694', '11101084', '镀锌短管接头', '92', '11101', '镀锌管件', '个', 'DN15*150MM', '', '', '9', '董满仓', '2021-06-09 16:16:51', null);
INSERT INTO `dtoa_material` VALUES ('1695', '10702018', '弯管器', '118', '10702', '五金工具', '把', '25', '', '', '9', '董满仓', '2021-06-09 16:17:58', null);
INSERT INTO `dtoa_material` VALUES ('1696', '10701136', '镀锌螺母', '90', '10701', '五金材料', '个', 'M10', '', '', '9', '董满仓', '2021-06-09 16:22:58', '2021-06-15 08:33:59');
INSERT INTO `dtoa_material` VALUES ('1697', '11002057', '透明漏电', '91', '11002', '电气辅材', '块', '380V-100A', '', '', '9', '董满仓', '2021-06-09 16:32:40', null);
INSERT INTO `dtoa_material` VALUES ('1699', '11107076', '球墨井盖（裸盖）', '109', '11107', '球墨管材管件', '个', '700轻型', '', '', '9', '董满仓', '2021-06-09 16:37:38', null);
INSERT INTO `dtoa_material` VALUES ('1700', '11002058', '电缆五指套', '91', '11002', '电气辅材', '个', '25mm²', '', '', '9', '董满仓', '2021-06-09 16:38:49', null);
INSERT INTO `dtoa_material` VALUES ('1701', '11002059', '电缆五指套', '91', '11002', '电气辅材', '个', '16mm²', '', '', '9', '董满仓', '2021-06-09 16:40:57', null);
INSERT INTO `dtoa_material` VALUES ('1702', '11002060', '热缩管', '91', '11002', '电气辅材', '米', '16mm²', '', '', '9', '董满仓', '2021-06-09 16:41:13', null);
INSERT INTO `dtoa_material` VALUES ('1703', '11002061', '热缩管', '91', '11002', '电气辅材', '米', '25mm²', '', '', '9', '董满仓', '2021-06-09 16:41:50', null);
INSERT INTO `dtoa_material` VALUES ('1704', '11002062', '热缩管', '91', '11002', '电气辅材', '米', '10mm²', '', '', '9', '董满仓', '2021-06-09 16:42:14', null);
INSERT INTO `dtoa_material` VALUES ('1705', '11002063', 'TD长筒铜鼻子', '91', '11002', '电气辅材', '个', '25mm²', '', '', '9', '董满仓', '2021-06-09 16:42:28', '2021-06-09 16:44:05');
INSERT INTO `dtoa_material` VALUES ('1706', '11002064', 'TD长筒铜鼻子', '91', '11002', '电气辅材', '个', '16mm²', '', '', '9', '董满仓', '2021-06-09 16:43:31', null);
INSERT INTO `dtoa_material` VALUES ('1707', '11002065', 'C45鸭嘴鼻子', '91', '11002', '电气辅材', '个', '10mm²', '铜', '', '9', '董满仓', '2021-06-09 16:44:06', '2021-06-18 08:57:31');
INSERT INTO `dtoa_material` VALUES ('1708', '10701137', '电锤钻头', '90', '10701', '五金材料', '支', 'M6', '', '', '9', '董满仓', '2021-06-09 16:44:48', null);
INSERT INTO `dtoa_material` VALUES ('1709', '30102005', '双轮车', '146', '30102', '机械设备', '辆', '', '', '', '9', '董满仓', '2021-06-09 16:48:15', null);
INSERT INTO `dtoa_material` VALUES ('1710', '11002066', '矿物质电缆终端接头', '91', '11002', '电气辅材', '个', '25mm²', '', '', '9', '董满仓', '2021-06-09 16:49:50', null);
INSERT INTO `dtoa_material` VALUES ('1711', '11002067', '矿物质电缆终端接头', '91', '11002', '电气辅材', '个', '16mm²', '', '', '9', '董满仓', '2021-06-09 16:58:27', null);
INSERT INTO `dtoa_material` VALUES ('1712', '11002068', '矿物质电缆终端接头', '91', '11002', '电气辅材', '个', '6mm²', '', '', '9', '董满仓', '2021-06-09 16:58:52', null);
INSERT INTO `dtoa_material` VALUES ('1713', '11002069', '热缩管', '91', '11002', '电气辅材', '米', '35mm²', '', '', '9', '董满仓', '2021-06-11 17:11:47', null);
INSERT INTO `dtoa_material` VALUES ('1714', '11002070', '高压自粘带', '91', '11002', '电气辅材', '卷', '', '', '', '9', '董满仓', '2021-06-11 17:12:37', null);
INSERT INTO `dtoa_material` VALUES ('1715', '11105060', 'PPR内丝三通', '107', '11105', 'PPR管材管件', '个', '32*1/2', 'PPR', '', '9', '董满仓', '2021-06-11 17:13:58', '2021-06-11 17:15:36');
INSERT INTO `dtoa_material` VALUES ('1716', '11105061', 'PPR管帽', '107', '11105', 'PPR管材管件', '个', '32', 'PPR', '', '9', '董满仓', '2021-06-11 17:15:37', '2021-06-17 17:09:08');
INSERT INTO `dtoa_material` VALUES ('1717', '11105062', 'PPR双活接球阀', '107', '11105', 'PPR管材管件', '个', 'DN25', '', '', '9', '董满仓', '2021-06-11 17:16:20', null);
INSERT INTO `dtoa_material` VALUES ('1718', '11109046', '喷淋喷雾喷头', '122', '11109', '水暖辅材', '个', 'DN15', '', '', '9', '董满仓', '2021-06-11 17:17:16', null);
INSERT INTO `dtoa_material` VALUES ('1719', '11101085', '镀锌短管接头', '92', '11101', '镀锌管件', '个', 'DN20*1000MM', '', '', '9', '董满仓', '2021-06-11 17:18:31', '2021-06-11 17:20:38');
INSERT INTO `dtoa_material` VALUES ('1720', '11101086', '镀锌短管接头', '92', '11101', '镀锌管件', '个', 'DN20*200', '', '', '9', '董满仓', '2021-06-11 17:19:28', null);
INSERT INTO `dtoa_material` VALUES ('1721', '10701138', '燕尾钉', '90', '10701', '五金材料', '个', '5.5*32', '', '', '9', '董满仓', '2021-06-11 17:20:38', null);
INSERT INTO `dtoa_material` VALUES ('1722', '30202017', '网式反光背心', '47', '30202', '文明施工', '件', '', '', '', '9', '董满仓', '2021-06-11 17:24:10', null);
INSERT INTO `dtoa_material` VALUES ('1723', '30202018', '拉链式反光背心', '47', '30202', '文明施工', '件', '', '', '', '9', '董满仓', '2021-06-11 17:25:30', null);
INSERT INTO `dtoa_material` VALUES ('1724', '112052', '网格水管', '41', '112', '低值易耗品', '盘', '25*50米', '', '', '9', '董满仓', '2021-06-11 17:26:01', null);
INSERT INTO `dtoa_material` VALUES ('1725', '11102069', '铜球阀', '93', '11102', '控水主材', '个', 'DN40', '', '', '9', '董满仓', '2021-06-11 17:27:40', null);
INSERT INTO `dtoa_material` VALUES ('1726', '11101087', '镀锌弯头', '92', '11101', '镀锌管件', '个', 'DN40*25', '热镀锌', '', '9', '董满仓', '2021-06-11 17:28:42', null);
INSERT INTO `dtoa_material` VALUES ('1727', '11101088', '镀锌弯头', '92', '11101', '镀锌管件', '个', 'DN40*20', '热镀锌', '', '9', '董满仓', '2021-06-11 17:30:01', null);
INSERT INTO `dtoa_material` VALUES ('1728', '30202019', '塑料垃圾桶', '47', '30202', '文明施工', '个', '240L', '', '', '9', '董满仓', '2021-06-11 17:30:21', null);
INSERT INTO `dtoa_material` VALUES ('1729', '112053', '钢丝管', '41', '112', '低值易耗品', '米', 'Φ80', '', '', '9', '董满仓', '2021-06-12 10:04:55', null);
INSERT INTO `dtoa_material` VALUES ('1730', '11109047', '管接头', '122', '11109', '水暖辅材', '个', 'Φ80', '', '', '9', '董满仓', '2021-06-12 10:06:54', null);
INSERT INTO `dtoa_material` VALUES ('1731', '11109048', '喉箍', '122', '11109', '水暖辅材', '个', 'Φ80', '', '', '9', '董满仓', '2021-06-12 10:07:58', null);
INSERT INTO `dtoa_material` VALUES ('1732', '11002071', '电缆五指套', '91', '11002', '电气辅材', '个', '6mm²', '', '', '9', '董满仓', '2021-06-15 08:34:00', null);
INSERT INTO `dtoa_material` VALUES ('1733', '11002072', '空开', '91', '11002', '电气辅材', '块', '380V200A', '', '', '9', '董满仓', '2021-06-17 17:09:08', null);
INSERT INTO `dtoa_material` VALUES ('1735', '11002073', '漏电', '91', '11002', '电气辅材', '块', '380V160A', '', '', '9', '董满仓', '2021-06-17 17:11:09', null);
INSERT INTO `dtoa_material` VALUES ('1736', '10701139', '合页', '90', '10701', '五金材料', '付', '75', '', '', '9', '董满仓', '2021-06-17 17:12:02', null);
INSERT INTO `dtoa_material` VALUES ('1737', '10702019', '拉铆枪', '118', '10702', '五金工具', '把', '', '', '', '9', '董满仓', '2021-06-17 17:16:10', null);
INSERT INTO `dtoa_material` VALUES ('1738', '10701140', '手把锁', '90', '10701', '五金材料', '把', '', '', '', '9', '董满仓', '2021-06-17 17:17:14', null);
INSERT INTO `dtoa_material` VALUES ('1739', '11002074', '铜编织线', '91', '11002', '电气辅材', '米', '6mm²', '', '', '9', '董满仓', '2021-06-17 17:19:20', null);
INSERT INTO `dtoa_material` VALUES ('1740', '11002075', '绝缘黄腊管', '91', '11002', '电气辅材', '米', '2cm', '', '', '9', '董满仓', '2021-06-17 17:20:35', null);
INSERT INTO `dtoa_material` VALUES ('1741', '11002076', 'SC线鼻子', '91', '11002', '电气辅材', '个', '6mm²', '铜', '', '9', '董满仓', '2021-06-18 08:54:22', null);
INSERT INTO `dtoa_material` VALUES ('1742', '11002077', 'SC线鼻子', '91', '11002', '电气辅材', '个', '16mm²', '铜', '', '9', '董满仓', '2021-06-18 08:55:38', null);
INSERT INTO `dtoa_material` VALUES ('1743', '11002078', 'C45鸭嘴鼻子', '91', '11002', '电气辅材', '个', '16mm²', '铜', '', '9', '董满仓', '2021-06-18 08:57:32', null);
INSERT INTO `dtoa_material` VALUES ('1744', '10701141', '镀锌螺栓', '90', '10701', '五金材料', '套', 'M6*40', '', '', '9', '董满仓', '2021-06-18 17:18:29', null);
INSERT INTO `dtoa_material` VALUES ('1745', '112054', '砂纸', '41', '112', '低值易耗品', '张', '', '', '', '9', '董满仓', '2021-06-18 17:20:59', null);
INSERT INTO `dtoa_material` VALUES ('1746', '11002079', '绝缘板', '91', '11002', '电气辅材', '块', '580*400', '', '', '9', '董满仓', '2021-06-18 17:21:55', null);
INSERT INTO `dtoa_material` VALUES ('1747', '10701142', '燕尾钉', '90', '10701', '五金材料', '个', '4*16', '', '', '9', '董满仓', '2021-06-18 17:23:00', null);
INSERT INTO `dtoa_material` VALUES ('1748', '10701143', '角磨钢丝片', '90', '10701', '五金材料', '个', 'Φ100', '', '', '9', '董满仓', '2021-06-18 17:23:54', null);
INSERT INTO `dtoa_material` VALUES ('1749', '10702020', '热风枪', '118', '10702', '五金工具', '把', '', '', '', '9', '董满仓', '2021-06-18 17:25:06', null);
INSERT INTO `dtoa_material` VALUES ('1750', '30202020', '防护眼镜', '47', '30202', '文明施工', '付', '', '', '', '9', '董满仓', '2021-06-18 17:25:54', null);
INSERT INTO `dtoa_material` VALUES ('1751', '112055', '美纹纸', '41', '112', '低值易耗品', '卷', '5cm*10m', '', '', '9', '董满仓', '2021-06-18 17:27:10', null);
INSERT INTO `dtoa_material` VALUES ('1752', '10801010', '自喷漆', '116', '10801', '油漆水漆', '瓶', '', '', '', '9', '董满仓', '2021-06-18 17:28:00', null);
INSERT INTO `dtoa_material` VALUES ('1753', '10704007', '角磨机电刷', '120', '10704', '五金设备配件', '付', '', '', '', '9', '董满仓', '2021-06-18 17:28:34', null);
INSERT INTO `dtoa_material` VALUES ('1754', '112056', '塑料桶', '41', '112', '低值易耗品', '个', '2L', '', '', '9', '董满仓', '2021-06-18 17:29:14', '2021-06-18 17:30:33');
INSERT INTO `dtoa_material` VALUES ('1755', '112057', '刻字镂空板', '41', '112', '低值易耗品', '块', '', '', '', '9', '董满仓', '2021-06-18 17:30:34', null);
INSERT INTO `dtoa_material` VALUES ('1756', '112058', '美纹纸', '41', '112', '低值易耗品', '卷', '2.4cm*25m', '', '', '9', '董满仓', '2021-06-18 17:31:47', null);
INSERT INTO `dtoa_material` VALUES ('1757', '30202021', '玻璃钢化粪池', '47', '30202', '文明施工', '个', '30m³', '', '', '9', '董满仓', '2021-06-18 17:32:03', null);
INSERT INTO `dtoa_material` VALUES ('1758', '30202022', '隔油池', '47', '30202', '文明施工', '个', '', '', '', '9', '董满仓', '2021-06-18 17:33:07', null);
INSERT INTO `dtoa_material` VALUES ('1759', '30202023', '红旗', '47', '30202', '文明施工', '面', '', '', '', '9', '董满仓', '2021-06-18 17:33:21', null);
INSERT INTO `dtoa_material` VALUES ('1760', '30202024', '仿真草坪', '47', '30202', '文明施工', '㎡', '', '', '', '9', '董满仓', '2021-06-18 17:33:54', null);
INSERT INTO `dtoa_material` VALUES ('1761', '11007075', 'WDZ-BYJ塑铜线', '114', '11007', '电线电缆', '米', '1.5mm²', '', '', '9', '董满仓', '2021-06-18 17:35:25', null);
INSERT INTO `dtoa_material` VALUES ('1762', '11007076', 'ZC-BV塑铜线', '114', '11007', '电线电缆', '米', '1.5mm²', '', '', '9', '董满仓', '2021-06-18 17:36:31', null);
INSERT INTO `dtoa_material` VALUES ('1763', '11007077', 'BTTRZ电缆', '114', '11007', '电线电缆', '米', '5*6mm²', '', '', '9', '董满仓', '2021-06-18 17:37:21', null);
INSERT INTO `dtoa_material` VALUES ('1764', '11007078', 'BTTRZ电缆', '114', '11007', '电线电缆', '米', '4*25+1*16mm²', '', '', '9', '董满仓', '2021-06-18 17:39:15', null);
INSERT INTO `dtoa_material` VALUES ('1765', '11007079', 'WDZN-YJY电缆', '114', '11007', '电线电缆', '米', '5*2.5mm²', '', '', '9', '董满仓', '2021-06-18 17:39:42', null);
INSERT INTO `dtoa_material` VALUES ('1766', '11007080', 'WDZN-YJY电缆', '114', '11007', '电线电缆', '米', '7*10mm²', '', '', '9', '董满仓', '2021-06-18 17:40:50', null);
INSERT INTO `dtoa_material` VALUES ('1768', '50104003', '洒水车', '84', '50104', '运输车', '班', '', '', '', '9', '董满仓', '2021-06-21 13:54:01', null);
INSERT INTO `dtoa_material` VALUES ('1769', '50104004', '拖车', '84', '50104', '运输车', '班', '7.8米', '', '', '9', '董满仓', '2021-06-21 13:58:08', '2021-06-21 13:59:20');
INSERT INTO `dtoa_material` VALUES ('1770', '1010201006', '镀锌槽钢', '55', '1010201', '槽钢', '米', '10#', '', '', '9', '董满仓', '2021-06-21 13:59:20', null);
INSERT INTO `dtoa_material` VALUES ('1771', '1010105002', '镀锌方管', '137', '1010105', '方管', '米', '100*100*2.5', '', '', '9', '董满仓', '2021-06-21 14:02:07', null);
INSERT INTO `dtoa_material` VALUES ('1772', '1010104008', '镀锌衬塑管', '104', '1010104', '镀锌衬塑管', '米', '80', '', '', '9', '董满仓', '2021-06-21 14:02:42', null);
INSERT INTO `dtoa_material` VALUES ('1773', '1010204006', '角钢', '135', '1010204', '角钢', '米', '50*5', '', '', '9', '董满仓', '2021-06-21 14:07:29', null);
INSERT INTO `dtoa_material` VALUES ('1774', '1010402003', '线材', '96', '1010402', '线材', '吨', 'Φ8', '', '', '9', '董满仓', '2021-06-21 14:08:33', null);
INSERT INTO `dtoa_material` VALUES ('1775', '11003097', '不锈钢箱体', '105', '11003', '电箱', '台', '1200*500*160', '', '', '9', '董满仓', '2021-06-22 09:40:37', null);
INSERT INTO `dtoa_material` VALUES ('1776', '11003098', '等电位箱', '105', '11003', '电箱', '台', '400*300*160', '', '', '9', '董满仓', '2021-06-22 09:43:19', null);
INSERT INTO `dtoa_material` VALUES ('1777', '11003099', '照明箱', '105', '11003', '电箱', '台', '400*580*160', '', '', '9', '董满仓', '2021-06-22 09:54:58', null);
INSERT INTO `dtoa_material` VALUES ('1778', '11003100', '电源箱', '105', '11003', '电箱', '台', '400*580*160', '', '', '9', '董满仓', '2021-06-22 09:56:17', null);
INSERT INTO `dtoa_material` VALUES ('1779', '11117010', '双壁波纹管', '152', '11117', 'PE管材管件', '米', 'Φ300', '', '', '9', '董满仓', '2021-06-25 08:31:06', null);
INSERT INTO `dtoa_material` VALUES ('1780', '11117011', 'PE管', '152', '11117', 'PE管材管件', '米', 'De75', '', '', '9', '董满仓', '2021-06-25 08:33:31', null);
INSERT INTO `dtoa_material` VALUES ('1781', '11117012', 'PE管箍', '152', '11117', 'PE管材管件', '个', '75', '', '', '9', '董满仓', '2021-06-25 08:34:11', null);
INSERT INTO `dtoa_material` VALUES ('1782', '11117013', 'PE弯头', '152', '11117', 'PE管材管件', '个', '75*90°', '', '', '9', '董满仓', '2021-06-25 08:34:32', null);
INSERT INTO `dtoa_material` VALUES ('1783', '11117014', 'PE外牙弯头', '152', '11117', 'PE管材管件', '个', '75*65', '', '', '9', '董满仓', '2021-06-25 08:34:56', null);
INSERT INTO `dtoa_material` VALUES ('1784', '11117015', 'PE三通', '152', '11117', 'PE管材管件', '个', '75', '', '', '9', '董满仓', '2021-06-25 08:35:25', null);
INSERT INTO `dtoa_material` VALUES ('1785', '11117016', 'PE外牙大小头', '152', '11117', 'PE管材管件', '个', '75*25', '', '', '9', '董满仓', '2021-06-25 08:35:49', null);
INSERT INTO `dtoa_material` VALUES ('1786', '11002080', '空开断路器', '91', '11002', '电气辅材', '块', '380V400A', '', '', '9', '董满仓', '2021-06-25 08:36:18', null);
INSERT INTO `dtoa_material` VALUES ('1787', '11002081', '空开断路器', '91', '11002', '电气辅材', '块', '380V630A', '', '', '9', '董满仓', '2021-06-25 08:38:26', null);
INSERT INTO `dtoa_material` VALUES ('1788', '11117017', 'PE管', '152', '11117', 'PE管材管件', '米', '110', '', '', '9', '董满仓', '2021-06-25 08:39:00', null);
INSERT INTO `dtoa_material` VALUES ('1789', '11117018', 'PE三通', '152', '11117', 'PE管材管件', '个', '110', '', '', '9', '董满仓', '2021-06-25 08:40:57', null);
INSERT INTO `dtoa_material` VALUES ('1790', '11117019', 'PE内牙三通', '152', '11117', 'PE管材管件', '个', '110*65', '', '', '9', '董满仓', '2021-06-25 08:41:32', null);
INSERT INTO `dtoa_material` VALUES ('1791', '11117020', 'PE管堵', '152', '11117', 'PE管材管件', '个', '110', '', '', '9', '董满仓', '2021-06-25 08:41:51', null);
INSERT INTO `dtoa_material` VALUES ('1792', '11117021', 'PE热熔法兰', '152', '11117', 'PE管材管件', '个', '110', '', '', '9', '董满仓', '2021-06-25 08:42:49', null);
INSERT INTO `dtoa_material` VALUES ('1793', '11117022', 'PE弯头', '152', '11117', 'PE管材管件', '个', '110*90°', '', '', '9', '董满仓', '2021-06-25 08:43:27', null);
INSERT INTO `dtoa_material` VALUES ('1794', '11117023', 'PE内牙大小头', '152', '11117', 'PE管材管件', '个', '110*40', '', '', '9', '董满仓', '2021-06-25 08:43:59', null);
INSERT INTO `dtoa_material` VALUES ('1795', '11102070', '软密封闸阀', '93', '11102', '控水主材', '个', 'DN100', '', '', '9', '董满仓', '2021-06-25 08:44:25', null);
INSERT INTO `dtoa_material` VALUES ('1796', '11109049', '法兰垫', '122', '11109', '水暖辅材', '个', '100', '', '', '9', '董满仓', '2021-06-25 08:45:23', null);
INSERT INTO `dtoa_material` VALUES ('1797', '30201013', '消防栓', '46', '30201', '安全设备', '个', 'DN65', '', '', '9', '董满仓', '2021-06-25 08:52:24', null);
INSERT INTO `dtoa_material` VALUES ('1798', '11105063', 'PPR三通', '107', '11105', 'PPR管材管件', '个', '50', 'PPR', '', '9', '董满仓', '2021-06-25 08:53:37', null);
INSERT INTO `dtoa_material` VALUES ('1799', '11117024', 'PE管箍', '152', '11117', 'PE管材管件', '个', '110', '', '', '9', '董满仓', '2021-06-25 08:54:36', null);
INSERT INTO `dtoa_material` VALUES ('1800', '11117025', 'PE三通', '152', '11117', 'PE管材管件', '个', '110*75', '', '', '9', '董满仓', '2021-06-25 09:34:28', null);
INSERT INTO `dtoa_material` VALUES ('1801', '11001044', '聚乙烯管', '59', '11001', '管线敷设', '米', 'Φ63', '', '', '9', '董满仓', '2021-06-25 09:40:18', null);
INSERT INTO `dtoa_material` VALUES ('1802', '11002082', '电伴热带', '91', '11002', '电气辅材', '米', '12', '', '', '9', '董满仓', '2021-06-25 10:13:07', null);
INSERT INTO `dtoa_material` VALUES ('1803', '10701144', '螺栓', '90', '10701', '五金材料', '套', 'M6*30', '', '', '9', '董满仓', '2021-06-25 10:14:25', null);
INSERT INTO `dtoa_material` VALUES ('1804', '11002083', '电缆五指套', '91', '11002', '电气辅材', '个', '120mm²', '', '', '9', '董满仓', '2021-06-25 10:23:48', '2021-06-25 10:24:38');
INSERT INTO `dtoa_material` VALUES ('1805', '11002084', '电缆五指套', '91', '11002', '电气辅材', '个', '240mm²', '', '', '9', '董满仓', '2021-06-25 10:24:38', null);
INSERT INTO `dtoa_material` VALUES ('1806', '11101089', '镀锌快接三通', '92', '11101', '镀锌管件', '个', 'DN100*65', '', '', '9', '董满仓', '2021-06-25 10:26:37', null);
INSERT INTO `dtoa_material` VALUES ('1807', '11117026', 'PE大小头', '152', '11117', 'PE管材管件', '个', '110*75', '', '', '9', '董满仓', '2021-06-25 10:29:49', null);
INSERT INTO `dtoa_material` VALUES ('1808', '11102071', '铜球阀', '93', '11102', '控水主材', '个', 'DN65', '', '', '9', '董满仓', '2021-06-25 10:36:09', null);
INSERT INTO `dtoa_material` VALUES ('1809', '30202025', '夜间警示灯', '47', '30202', '文明施工', '个', '', '', '', '9', '董满仓', '2021-06-25 11:15:12', null);
INSERT INTO `dtoa_material` VALUES ('1810', '112059', '竹砧板', '41', '112', '低值易耗品', '块', '1m', '', '', '9', '董满仓', '2021-06-25 11:15:45', null);
INSERT INTO `dtoa_material` VALUES ('1811', '112060', '锅刷炊厨', '41', '112', '低值易耗品', '把', '', '', '', '9', '董满仓', '2021-06-25 15:00:47', null);
INSERT INTO `dtoa_material` VALUES ('1812', '112061', '菜刀', '41', '112', '低值易耗品', '把', '', '', '', '9', '董满仓', '2021-06-25 15:02:21', null);
INSERT INTO `dtoa_material` VALUES ('1813', '112062', '抹布', '41', '112', '低值易耗品', '包', '', '', '', '9', '董满仓', '2021-06-25 15:02:39', null);
INSERT INTO `dtoa_material` VALUES ('1814', '112063', '削皮刀', '41', '112', '低值易耗品', '把', '', '', '', '9', '董满仓', '2021-06-25 15:03:05', null);
INSERT INTO `dtoa_material` VALUES ('1815', '112064', '不锈钢漏勺', '41', '112', '低值易耗品', '把', '', '', '', '9', '董满仓', '2021-06-25 15:03:19', null);
INSERT INTO `dtoa_material` VALUES ('1816', '112065', '擦丝器', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-06-25 15:03:57', null);
INSERT INTO `dtoa_material` VALUES ('1817', '112066', '清洁球', '41', '112', '低值易耗品', '包', '', '', '', '9', '董满仓', '2021-06-25 15:04:14', null);
INSERT INTO `dtoa_material` VALUES ('1818', '112067', '不锈钢保温汤桶', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-06-25 15:04:45', null);
INSERT INTO `dtoa_material` VALUES ('1819', '112068', '不锈钢盆', '41', '112', '低值易耗品', '个', '65cm', '', '', '9', '董满仓', '2021-06-25 15:05:18', null);
INSERT INTO `dtoa_material` VALUES ('1820', '30301003', '冰柜', '156', '30301', '临建周转设备', '台', '220L', '', '', '9', '董满仓', '2021-06-25 15:05:37', null);
INSERT INTO `dtoa_material` VALUES ('1821', '30301004', '电饼铛', '156', '30301', '临建周转设备', '套', '', '', '', '9', '董满仓', '2021-06-25 15:06:49', null);
INSERT INTO `dtoa_material` VALUES ('1822', '30301005', '饮水机', '156', '30301', '临建周转设备', '台 ', '', '', '', '9', '董满仓', '2021-06-25 15:07:34', null);
INSERT INTO `dtoa_material` VALUES ('1823', '30301006', '托盘圆桌', '156', '30301', '临建周转设备', '套', '', '', '', '9', '董满仓', '2021-06-25 15:07:50', null);
INSERT INTO `dtoa_material` VALUES ('1824', '30301007', '圆凳', '156', '30301', '临建周转设备', '把', '', '', '', '9', '董满仓', '2021-06-25 15:08:46', null);
INSERT INTO `dtoa_material` VALUES ('1825', '112069', '烟灰缸', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-06-25 15:09:04', null);
INSERT INTO `dtoa_material` VALUES ('1826', '112070', '垃圾铲', '41', '112', '低值易耗品', '把', '', '', '', '9', '董满仓', '2021-06-25 15:09:24', null);
INSERT INTO `dtoa_material` VALUES ('1827', '112071', '不锈钢盆', '41', '112', '低值易耗品', '个', '36cm', '', '', '9', '董满仓', '2021-06-25 15:12:25', null);
INSERT INTO `dtoa_material` VALUES ('1828', '30301008', '不锈钢三格水池', '156', '30301', '临建周转设备', '套', '', '', '洗菜池', '9', '董满仓', '2021-06-25 15:14:00', null);
INSERT INTO `dtoa_material` VALUES ('1829', '30301009', '食品留样柜', '156', '30301', '临建周转设备', '台', '100L', '', '', '9', '董满仓', '2021-06-25 15:15:42', null);
INSERT INTO `dtoa_material` VALUES ('1830', '30301010', '消毒柜', '156', '30301', '临建周转设备', '台', '388L', '', '', '9', '董满仓', '2021-06-25 15:16:12', null);
INSERT INTO `dtoa_material` VALUES ('1831', '112072', '纸杯', '41', '112', '低值易耗品', '包', '', '', '', '9', '董满仓', '2021-06-25 15:16:32', null);
INSERT INTO `dtoa_material` VALUES ('1832', '112073', '不锈钢快餐盘', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-06-25 15:17:00', null);
INSERT INTO `dtoa_material` VALUES ('1833', '112074', '大饼铲', '41', '112', '低值易耗品', '把', '', '', '', '9', '董满仓', '2021-06-25 15:18:07', null);
INSERT INTO `dtoa_material` VALUES ('1834', '112075', '油刷', '41', '112', '低值易耗品', '把', '5寸', '', '', '9', '董满仓', '2021-06-25 15:19:00', null);
INSERT INTO `dtoa_material` VALUES ('1835', '112076', '筷子', '41', '112', '低值易耗品', '盒', '', '', '', '9', '董满仓', '2021-06-25 15:19:28', null);
INSERT INTO `dtoa_material` VALUES ('1836', '30202026', '医用隔离服', '47', '30202', '文明施工', '套', '', '', '', '9', '董满仓', '2021-06-25 15:19:40', null);
INSERT INTO `dtoa_material` VALUES ('1837', '30202027', '医用面罩', '47', '30202', '文明施工', '个', '', '', '', '9', '董满仓', '2021-06-25 15:22:11', null);
INSERT INTO `dtoa_material` VALUES ('1838', '30202028', '抑菌免洗凝胶', '47', '30202', '文明施工', '瓶', '', '', '', '9', '董满仓', '2021-06-25 15:22:26', null);
INSERT INTO `dtoa_material` VALUES ('1839', '30202029', '消毒酒精', '47', '30202', '文明施工', '瓶', '', '', '', '9', '董满仓', '2021-06-25 15:23:02', null);
INSERT INTO `dtoa_material` VALUES ('1840', '30202030', '水银体温计', '47', '30202', '文明施工', '个', '', '', '', '9', '董满仓', '2021-06-25 15:23:25', null);
INSERT INTO `dtoa_material` VALUES ('1841', '30202031', '背带式喷雾器', '47', '30202', '文明施工', '个', '', '', '', '9', '董满仓', '2021-06-25 15:24:46', null);
INSERT INTO `dtoa_material` VALUES ('1842', '30202032', '消毒毯', '47', '30202', '文明施工', '块', '2*6米', '', '', '9', '董满仓', '2021-06-25 15:25:53', null);
INSERT INTO `dtoa_material` VALUES ('1843', '30202033', '喊话器', '47', '30202', '文明施工', '个', '', '', '', '9', '董满仓', '2021-06-25 15:26:25', null);
INSERT INTO `dtoa_material` VALUES ('1844', '30301011', '不锈钢蒸饭车', '156', '30301', '临建周转设备', '台', '8屉', '', '', '9', '董满仓', '2021-06-25 15:26:49', null);
INSERT INTO `dtoa_material` VALUES ('1845', '30301012', '大锅灶', '156', '30301', '临建周转设备', '台', '85CM', '', '', '9', '董满仓', '2021-06-25 15:28:07', null);
INSERT INTO `dtoa_material` VALUES ('1846', '30301013', '不锈钢两格水池', '156', '30301', '临建周转设备', '套', '', '', '', '9', '董满仓', '2021-06-25 15:28:28', null);
INSERT INTO `dtoa_material` VALUES ('1847', '30301014', '不锈钢厨房操作台', '156', '30301', '临建周转设备', '套', '双层1.8m', '', '', '9', '董满仓', '2021-06-25 15:29:16', '2021-06-25 15:36:04');
INSERT INTO `dtoa_material` VALUES ('1848', '112077', '竹砧板', '41', '112', '低值易耗品', '块', '70cm', '', '', '9', '董满仓', '2021-06-25 15:36:46', null);
INSERT INTO `dtoa_material` VALUES ('1849', '112078', '不锈钢勺', '41', '112', '低值易耗品', '把', '', '', '', '9', '董满仓', '2021-06-25 15:37:22', null);
INSERT INTO `dtoa_material` VALUES ('1850', '112079', '不锈钢分菜盆', '41', '112', '低值易耗品', '个', '15cm深', '', '', '9', '董满仓', '2021-06-25 15:38:08', null);
INSERT INTO `dtoa_material` VALUES ('1851', '112080', '不锈钢铲', '41', '112', '低值易耗品', '把', '', '', '', '9', '董满仓', '2021-06-25 15:39:24', '2021-06-25 15:40:14');
INSERT INTO `dtoa_material` VALUES ('1852', '112081', '不锈钢炒菜勺', '41', '112', '低值易耗品', '把', '', '', '', '9', '董满仓', '2021-06-25 15:40:14', null);
INSERT INTO `dtoa_material` VALUES ('1853', '112082', '不锈钢盆', '41', '112', '低值易耗品', '个', '40cm', '', '', '9', '董满仓', '2021-06-25 15:40:38', null);
INSERT INTO `dtoa_material` VALUES ('1854', '112083', '笊篱', '41', '112', '低值易耗品', '把', '', '', '', '9', '董满仓', '2021-06-25 15:41:15', null);
INSERT INTO `dtoa_material` VALUES ('1855', '11001045', 'JDG弯头', '59', '11001', '管线敷设', '个', '六倍Φ32', '', '', '9', '董满仓', '2021-06-25 17:13:11', null);
INSERT INTO `dtoa_material` VALUES ('1856', '11007081', 'YC橡套电缆', '114', '11007', '电线电缆', '米', '3*6mm²', '铜', '', '9', '董满仓', '2021-06-25 17:14:09', null);
INSERT INTO `dtoa_material` VALUES ('1857', '11002085', '电缆五指套', '91', '11002', '电气辅材', '个', '35mm²', '', '', '9', '董满仓', '2021-06-25 17:15:19', null);
INSERT INTO `dtoa_material` VALUES ('1858', '30301015', '上下床', '156', '30301', '临建周转设备', '套', '', '', '', '9', '董满仓', '2021-06-25 17:16:23', null);
INSERT INTO `dtoa_material` VALUES ('1859', '11008035', '电表', '115', '11008', '电气设备安装材料', '块', '1.5-6A', '', '', '9', '董满仓', '2021-06-25 17:16:54', null);
INSERT INTO `dtoa_material` VALUES ('1860', '30202034', '玻璃钢化粪池', '47', '30202', '文明施工', '个', '50m³', '', '', '9', '董满仓', '2021-06-25 17:18:14', null);
INSERT INTO `dtoa_material` VALUES ('1861', '11105064', 'PPR管帽', '107', '11105', 'PPR管材管件', '个', '40', 'PPR', '', '9', '董满仓', '2021-06-25 17:19:12', null);
INSERT INTO `dtoa_material` VALUES ('1862', '11105065', 'PPR管箍', '107', '11105', 'PPR管材管件', '个', '40', 'PPR', '', '9', '董满仓', '2021-06-25 17:20:01', null);
INSERT INTO `dtoa_material` VALUES ('1863', '11102072', 'PPR双活接球阀', '93', '11102', '控水主材', '个', 'DN40', '', '', '9', '董满仓', '2021-06-25 17:20:44', null);
INSERT INTO `dtoa_material` VALUES ('1864', '11101090', '镀锌快接三通', '92', '11101', '镀锌管件', '个', 'DN75*32', '热镀锌', '', '9', '董满仓', '2021-06-25 17:24:02', null);
INSERT INTO `dtoa_material` VALUES ('1865', '11007082', 'WDZA-YJV电缆', '114', '11007', '电线电缆', '米', '4*25+1*16', '', '', '9', '董满仓', '2021-06-29 08:02:05', null);
INSERT INTO `dtoa_material` VALUES ('1867', '112084', '挡鼠板', '41', '112', '低值易耗品', '块', '775*600', '', '', '9', '董满仓', '2021-06-30 09:44:25', null);
INSERT INTO `dtoa_material` VALUES ('1868', '112085', '鼠笼子', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-06-30 09:45:15', null);
INSERT INTO `dtoa_material` VALUES ('1869', '112086', '门帘', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-06-30 09:45:40', null);
INSERT INTO `dtoa_material` VALUES ('1870', '30301016', '污水泵', '156', '30301', '临建周转设备', '台', '3寸7.5KW', '', '', '9', '董满仓', '2021-06-30 09:46:08', null);
INSERT INTO `dtoa_material` VALUES ('1871', '10702021', '断丝取出器', '118', '10702', '五金工具', '套', '', '', '', '9', '董满仓', '2021-06-30 09:50:09', null);
INSERT INTO `dtoa_material` VALUES ('1872', '11002086', '瓷插保险', '91', '11002', '电气辅材', '个', '6A', '', '', '9', '董满仓', '2021-06-30 09:54:41', null);
INSERT INTO `dtoa_material` VALUES ('1873', '30201014', '消防组合柜', '46', '30201', '安全设备', '套', '二合一', '', '', '9', '董满仓', '2021-06-30 10:03:14', null);
INSERT INTO `dtoa_material` VALUES ('1874', '30201015', '消防组合柜', '46', '30201', '安全设备', '套', '三合一', '', '', '9', '董满仓', '2021-06-30 10:04:25', null);
INSERT INTO `dtoa_material` VALUES ('1875', '30301017', '热水器', '156', '30301', '临建周转设备', '台', '80L', '', '', '9', '董满仓', '2021-06-30 10:04:41', null);
INSERT INTO `dtoa_material` VALUES ('1876', '112087', '对讲机', '41', '112', '低值易耗品', '台', '', '', '', '9', '董满仓', '2021-06-30 10:05:16', null);
INSERT INTO `dtoa_material` VALUES ('1877', '112088', '二合一垃圾桶', '41', '112', '低值易耗品', '个', '16L', '', '', '9', '董满仓', '2021-06-30 10:05:40', '2021-06-30 10:12:14');
INSERT INTO `dtoa_material` VALUES ('1878', '112089', '圆垃圾桶', '41', '112', '低值易耗品', '个', '8L', '', '', '9', '董满仓', '2021-06-30 10:12:15', null);
INSERT INTO `dtoa_material` VALUES ('1879', '112090', '强光手电', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-06-30 10:12:54', null);
INSERT INTO `dtoa_material` VALUES ('1880', '112091', '垃圾袋', '41', '112', '低值易耗品', '个', '·1.2m*1.4m', '', '', '9', '董满仓', '2021-06-30 10:14:27', null);
INSERT INTO `dtoa_material` VALUES ('1881', '112092', '小垃圾袋', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-06-30 10:17:39', null);
INSERT INTO `dtoa_material` VALUES ('1882', '30301018', '货架', '156', '30301', '临建周转设备', '套', '', '', '', '9', '董满仓', '2021-06-30 10:17:58', null);
INSERT INTO `dtoa_material` VALUES ('1883', '11117027', 'PE弯头', '152', '11117', 'PE管材管件', '个', '110*45°', '', '', '9', '董满仓', '2021-06-30 10:18:27', null);
INSERT INTO `dtoa_material` VALUES ('1884', '11117028', 'PE法兰根', '152', '11117', 'PE管材管件', '个', '110', '', '', '9', '董满仓', '2021-06-30 10:19:51', null);
INSERT INTO `dtoa_material` VALUES ('1885', '11117029', 'PE内丝直接', '152', '11117', 'PE管材管件', '个', '110*80', '', '', '9', '董满仓', '2021-06-30 10:23:07', null);
INSERT INTO `dtoa_material` VALUES ('1886', '30301019', '自动搅匀潜污泵', '156', '30301', '临建周转设备', '台', '7.5KW', '', '', '9', '董满仓', '2021-06-30 10:23:47', null);
INSERT INTO `dtoa_material` VALUES ('1887', '11002087', '避雷墩', '91', '11002', '电气辅材', '个', '', '', '', '9', '董满仓', '2021-06-30 10:24:39', null);
INSERT INTO `dtoa_material` VALUES ('1888', '10701145', '配电箱锁', '90', '10701', '五金材料', '把', '', '', '', '9', '董满仓', '2021-06-30 10:25:44', null);
INSERT INTO `dtoa_material` VALUES ('1889', '11109050', '铝合金快速接头', '122', '11109', '水暖辅材', '个', '80', '', '', '9', '董满仓', '2021-06-30 10:26:59', '2021-06-30 10:43:15');
INSERT INTO `dtoa_material` VALUES ('1890', '10702022', '腻子刀', '118', '10702', '五金工具', '把', '', '', '', '9', '董满仓', '2021-06-30 10:30:01', null);
INSERT INTO `dtoa_material` VALUES ('1891', '10802014', '汽油机油', '117', '10802', '化工产品', '桶', '5L', '', '', '9', '董满仓', '2021-06-30 10:31:32', null);
INSERT INTO `dtoa_material` VALUES ('1892', '10702023', '铁抹子', '118', '10702', '五金工具', '把', '', '', '', '9', '董满仓', '2021-06-30 10:32:06', null);
INSERT INTO `dtoa_material` VALUES ('1893', '30102006', '气泵', '146', '30102', '机械设备', '台', '220V9L', '', '', '9', '董满仓', '2021-06-30 10:32:41', '2021-06-30 10:43:37');
INSERT INTO `dtoa_material` VALUES ('1894', '10702024', '手锤', '118', '10702', '五金工具', '把', '6P', '', '', '9', '董满仓', '2021-06-30 10:34:29', null);
INSERT INTO `dtoa_material` VALUES ('1895', '10702025', '塑料试模', '118', '10702', '五金工具', '组', '100*100*3', '', '', '9', '董满仓', '2021-06-30 10:43:38', null);
INSERT INTO `dtoa_material` VALUES ('1896', '10702026', '塑料抗渗试模', '118', '10702', '五金工具', '组', '150', '', '', '9', '董满仓', '2021-06-30 10:44:10', null);
INSERT INTO `dtoa_material` VALUES ('1897', '10702027', '塑料试模', '118', '10702', '五金工具', '组', '75*75*3', '', '', '9', '董满仓', '2021-06-30 10:44:26', null);
INSERT INTO `dtoa_material` VALUES ('1898', '112093', '线手套', '41', '112', '低值易耗品', '付', '', '', '', '9', '董满仓', '2021-06-30 10:44:38', null);
INSERT INTO `dtoa_material` VALUES ('1899', '11110080', 'PVC顺水三通', '129', '11110', 'PVC管材管件', '个', 'Φ200', 'PVC', '', '9', '董满仓', '2021-06-30 10:45:13', null);
INSERT INTO `dtoa_material` VALUES ('1900', '11110081', 'PVC顺水三通', '129', '11110', 'PVC管材管件', '个', 'Φ200*100', 'PVC', '', '9', '董满仓', '2021-06-30 10:46:15', null);
INSERT INTO `dtoa_material` VALUES ('1901', '11110082', 'PVC顺水三通', '129', '11110', 'PVC管材管件', '个', 'Φ200*50', 'PVC', '', '9', '董满仓', '2021-06-30 10:46:40', null);
INSERT INTO `dtoa_material` VALUES ('1902', '11110083', 'PVC清扫口', '129', '11110', 'PVC管材管件', '个', 'Φ200', 'PVC', '', '9', '董满仓', '2021-06-30 10:46:57', null);
INSERT INTO `dtoa_material` VALUES ('1903', '11117030', 'PE弯头', '152', '11117', 'PE管材管件', '个', '160*90°', '', '', '9', '董满仓', '2021-06-30 10:47:23', null);
INSERT INTO `dtoa_material` VALUES ('1904', '11117031', 'PE大小头', '152', '11117', 'PE管材管件', '个', '160*110', '', '', '9', '董满仓', '2021-06-30 10:48:17', null);
INSERT INTO `dtoa_material` VALUES ('1905', '11117032', 'PE法兰根', '152', '11117', 'PE管材管件', '个', '160', '', '', '9', '董满仓', '2021-06-30 10:48:34', null);
INSERT INTO `dtoa_material` VALUES ('1906', '11117033', 'PE法兰盘', '152', '11117', 'PE管材管件', '个', '160', '', '', '9', '董满仓', '2021-06-30 10:48:48', null);
INSERT INTO `dtoa_material` VALUES ('1907', '11117034', 'PE管', '152', '11117', 'PE管材管件', '米', '160*1.6MPa', '', '', '9', '董满仓', '2021-06-30 10:49:03', null);
INSERT INTO `dtoa_material` VALUES ('1908', '10902019', '橡塑保温管', '128', '10902', '保温材料', '米', '160', '', '', '9', '董满仓', '2021-06-30 10:49:51', null);
INSERT INTO `dtoa_material` VALUES ('1909', '11102073', '浮球阀', '93', '11102', '控水主材', '个', 'DN50', '铜', '', '9', '董满仓', '2021-06-30 10:50:49', null);
INSERT INTO `dtoa_material` VALUES ('1910', '11115020', '沟槽大小头', '147', '11115', '沟槽管件', '个', '100*80', '', '', '9', '董满仓', '2021-06-30 10:53:44', null);
INSERT INTO `dtoa_material` VALUES ('1911', '11115021', '沟槽法兰', '147', '11115', '沟槽管件', '个', 'DN80', '', '', '9', '董满仓', '2021-06-30 10:54:51', null);
INSERT INTO `dtoa_material` VALUES ('1912', '11115022', '沟槽卡箍', '147', '11115', '沟槽管件', '个', 'DN80', '', '', '9', '董满仓', '2021-06-30 10:55:26', null);
INSERT INTO `dtoa_material` VALUES ('1913', '11115023', '软连接', '147', '11115', '沟槽管件', '个', 'DN100', '', '', '9', '董满仓', '2021-06-30 10:55:59', '2021-06-30 11:18:23');
INSERT INTO `dtoa_material` VALUES ('1914', '11102074', '法兰止回阀', '93', '11102', '控水主材', '个', 'DN100', '', '', '9', '董满仓', '2021-06-30 10:57:35', null);
INSERT INTO `dtoa_material` VALUES ('1915', '11102075', '法兰闸阀', '93', '11102', '控水主材', '个', 'DN40', '', '', '9', '董满仓', '2021-06-30 10:58:15', null);
INSERT INTO `dtoa_material` VALUES ('1916', '11102076', '法兰止回阀', '93', '11102', '控水主材', '个', 'DN40', '', '', '9', '董满仓', '2021-06-30 10:58:38', null);
INSERT INTO `dtoa_material` VALUES ('1917', '11101091', '镀锌短管接头', '92', '11101', '镀锌管件', '个', 'DN40*200mm', '热镀锌', '', '9', '董满仓', '2021-06-30 10:59:14', null);
INSERT INTO `dtoa_material` VALUES ('1918', '112094', '钢丝管', '41', '112', '低值易耗品', '米', 'Φ50', '', '', '9', '董满仓', '2021-06-30 11:00:22', '2021-06-30 11:01:29');
INSERT INTO `dtoa_material` VALUES ('1920', '11102077', 'PPR双活接球阀', '93', '11102', '控水主材', '个', 'DN50', '', '', '9', '董满仓', '2021-06-30 11:02:13', null);
INSERT INTO `dtoa_material` VALUES ('1921', '11105066', 'PPR外丝直接', '107', '11105', 'PPR管材管件', '个', '50*50', '', '', '9', '董满仓', '2021-06-30 11:02:40', null);
INSERT INTO `dtoa_material` VALUES ('1922', '11109051', '法兰垫', '122', '11109', '水暖辅材', '个', 'DN40', '', '', '9', '董满仓', '2021-06-30 11:03:29', null);
INSERT INTO `dtoa_material` VALUES ('1923', '10701146', '橡胶减震垫', '90', '10701', '五金材料', '个', '', '', '', '9', '董满仓', '2021-06-30 11:04:37', null);
INSERT INTO `dtoa_material` VALUES ('1924', '11102078', '旋塞阀', '93', '11102', '控水主材', '个', 'DN15', '', '', '9', '董满仓', '2021-06-30 11:05:24', null);
INSERT INTO `dtoa_material` VALUES ('1925', '11002088', '电缆五指套', '91', '11002', '电气辅材', '个', '150mm²', '', '', '9', '董满仓', '2021-06-30 11:06:28', '2021-06-30 11:07:40');
INSERT INTO `dtoa_material` VALUES ('1926', '11002089', 'TD长筒铜鼻子', '91', '11002', '电气辅材', '个', '150mm²', '', '', '9', '董满仓', '2021-06-30 11:08:07', null);
INSERT INTO `dtoa_material` VALUES ('1927', '11007083', 'VV22铠装电缆', '114', '11007', '电线电缆', '米', '4*150+1*70', '铜', '', '9', '董满仓', '2021-06-30 11:10:36', null);
INSERT INTO `dtoa_material` VALUES ('1928', '112095', '磨砂门帘', '41', '112', '低值易耗品', '付', '', '', '', '9', '董满仓', '2021-06-30 11:18:24', null);
INSERT INTO `dtoa_material` VALUES ('1929', '112096', '钢丝管', '41', '112', '低值易耗品', '米', 'Φ100', '', '', '9', '董满仓', '2021-06-30 11:28:32', null);
INSERT INTO `dtoa_material` VALUES ('1930', '11101092', '镀锌补芯', '92', '11101', '镀锌管件', '个', 'DN65*40', '热镀锌', '', '9', '董满仓', '2021-06-30 14:03:12', null);
INSERT INTO `dtoa_material` VALUES ('1931', '11101093', '镀锌补芯', '92', '11101', '镀锌管件', '个', 'DN50*40', '热镀锌', '', '9', '董满仓', '2021-06-30 14:04:10', null);
INSERT INTO `dtoa_material` VALUES ('1932', '11101094', '镀锌补芯', '92', '11101', '镀锌管件', '个', 'DN65*50', '热镀锌', '', '9', '董满仓', '2021-06-30 14:04:28', null);
INSERT INTO `dtoa_material` VALUES ('1933', '11117035', 'PE外丝活接', '152', '11117', 'PE管材管件', '个', '75*65', '', '', '9', '董满仓', '2021-06-30 14:04:46', null);
INSERT INTO `dtoa_material` VALUES ('1934', '11117036', 'PE外丝活接', '152', '11117', 'PE管材管件', '个', '65*65', '', '', '9', '董满仓', '2021-06-30 14:06:21', null);
INSERT INTO `dtoa_material` VALUES ('1935', '10701147', '铁链', '90', '10701', '五金材料', '米', '10#', '', '', '9', '董满仓', '2021-06-30 14:06:48', null);
INSERT INTO `dtoa_material` VALUES ('1936', '30202035', '雾炮机', '47', '30202', '文明施工', '台', '', '', '', '9', '董满仓', '2021-06-30 14:07:31', null);
INSERT INTO `dtoa_material` VALUES ('1937', '112097', '透明门帘', '41', '112', '低值易耗品', '付', '', '', '', '9', '董满仓', '2021-06-30 14:08:52', null);
INSERT INTO `dtoa_material` VALUES ('1938', '112098', '雨鞋', '41', '112', '低值易耗品', '双', '', '', '', '9', '董满仓', '2021-06-30 14:09:44', null);
INSERT INTO `dtoa_material` VALUES ('1939', '30301020', '床板', '156', '30301', '临建周转设备', '张', '', '', '', '9', '董满仓', '2021-06-30 14:12:36', null);
INSERT INTO `dtoa_material` VALUES ('1940', '112099', '纸篓', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-06-30 14:13:24', null);
INSERT INTO `dtoa_material` VALUES ('1941', '30201016', '绝缘鞋', '46', '30201', '安全设备', '双', '', '', '', '9', '董满仓', '2021-06-30 14:14:22', null);
INSERT INTO `dtoa_material` VALUES ('1942', '30201017', '二氧化碳灭火器', '46', '30201', '安全设备', '个', '3KG', '', '', '9', '董满仓', '2021-06-30 14:16:27', null);
INSERT INTO `dtoa_material` VALUES ('1943', '30201018', '二氧化碳灭火器箱', '46', '30201', '安全设备', '个', '1*2瓶', '', '', '9', '董满仓', '2021-06-30 14:17:26', '2021-06-30 14:18:14');
INSERT INTO `dtoa_material` VALUES ('1944', '112100', '粘蝇贴', '41', '112', '低值易耗品', '卷', '', '', '', '9', '董满仓', '2021-07-04 08:35:39', null);
INSERT INTO `dtoa_material` VALUES ('1945', '10702028', '铁锹把', '118', '10702', '五金工具', '根', '', '', '', '9', '董满仓', '2021-07-04 09:00:34', null);
INSERT INTO `dtoa_material` VALUES ('1946', '10702029', '羊镐头', '118', '10702', '五金工具', '个', '', '', '', '9', '董满仓', '2021-07-04 09:01:25', null);
INSERT INTO `dtoa_material` VALUES ('1947', '10702030', '镐把', '118', '10702', '五金工具', '根', '', '', '', '9', '董满仓', '2021-07-04 09:02:33', null);
INSERT INTO `dtoa_material` VALUES ('1948', '112101', '雨衣', '41', '112', '低值易耗品', '件', '', '', '', '9', '董满仓', '2021-07-04 09:02:49', null);
INSERT INTO `dtoa_material` VALUES ('1949', '112102', '雨伞', '41', '112', '低值易耗品', '把', '', '', '', '9', '董满仓', '2021-07-04 09:06:13', null);
INSERT INTO `dtoa_material` VALUES ('1950', '30201019', '防汛沙袋', '46', '30201', '安全设备', '个', '', '', '', '9', '董满仓', '2021-07-04 09:06:29', null);
INSERT INTO `dtoa_material` VALUES ('1951', '112103', '尼龙绳', '41', '112', '低值易耗品', '条', '12*50m', '', '', '9', '董满仓', '2021-07-04 09:07:15', null);
INSERT INTO `dtoa_material` VALUES ('1952', '10702031', '电缆轴', '118', '10702', '五金工具', '个', '4*2.5*30米', '', '', '9', '董满仓', '2021-07-04 09:08:03', null);
INSERT INTO `dtoa_material` VALUES ('1953', '30202036', '担架', '47', '30202', '文明施工', '付', '', '', '', '9', '董满仓', '2021-07-04 09:11:00', null);
INSERT INTO `dtoa_material` VALUES ('1954', '11005036', '太阳能路灯', '112', '11005', '灯具', '套', '3.5米', '', '', '9', '董满仓', '2021-07-04 09:11:42', null);
INSERT INTO `dtoa_material` VALUES ('1955', '112104', '挡鼠板', '41', '112', '低值易耗品', '块', '1m*0.5m', '', '', '9', '董满仓', '2021-07-04 10:01:04', null);
INSERT INTO `dtoa_material` VALUES ('1956', '11002090', '橡胶绝缘板', '91', '11002', '电气辅材', '米', '1米*10mm', '', '', '9', '董满仓', '2021-07-04 10:03:06', null);
INSERT INTO `dtoa_material` VALUES ('1957', '11002091', '电缆五指套', '91', '11002', '电气辅材', '个', '70mm²', '', '', '9', '董满仓', '2021-07-04 10:26:04', null);
INSERT INTO `dtoa_material` VALUES ('1958', '11008036', '按钮开关', '115', '11008', '电气设备安装材料', '个', '', '', '', '9', '董满仓', '2021-07-04 10:27:24', null);
INSERT INTO `dtoa_material` VALUES ('1959', '11008037', '空开', '115', '11008', '电气设备安装材料', '块', '380V225A', '', '', '9', '董满仓', '2021-07-04 10:28:01', null);
INSERT INTO `dtoa_material` VALUES ('1960', '11008038', '漏电保护器', '115', '11008', '电气设备安装材料', '块', '380V250A', '', '', '9', '董满仓', '2021-07-04 10:28:38', null);
INSERT INTO `dtoa_material` VALUES ('1961', '10701148', '电加热管', '90', '10701', '五金材料', '个', '2000W', '', '', '9', '董满仓', '2021-07-04 10:29:27', null);
INSERT INTO `dtoa_material` VALUES ('1962', '30301021', '不锈钢开水器', '156', '30301', '临建周转设备', '台', '220V', '', '', '9', '董满仓', '2021-07-04 10:38:13', null);
INSERT INTO `dtoa_material` VALUES ('1963', '11005037', '太阳能警示灯', '112', '11005', '灯具', '个', '', '', '', '9', '董满仓', '2021-07-04 10:39:18', null);
INSERT INTO `dtoa_material` VALUES ('1965', '11008039', '漏电保护器', '115', '11008', '电气设备安装材料', '块', '380V400A', '', '', '9', '董满仓', '2021-07-04 10:40:47', null);
INSERT INTO `dtoa_material` VALUES ('1966', '112105', '不锈钢垃圾桶', '41', '112', '低值易耗品', '个', '70L', '', '', '9', '董满仓', '2021-07-04 10:41:33', null);
INSERT INTO `dtoa_material` VALUES ('1967', '30301022', '长条凳子', '156', '30301', '临建周转设备', '个', '30*1200', '', '', '9', '董满仓', '2021-07-04 10:45:33', null);
INSERT INTO `dtoa_material` VALUES ('1968', '11002092', '铜管接头', '91', '11002', '电气辅材', '个', '50mm²', '', '', '9', '董满仓', '2021-07-04 10:46:16', null);
INSERT INTO `dtoa_material` VALUES ('1969', '11007084', 'YC橡套电缆', '114', '11007', '电线电缆', '米', '5*10mm²', '', '', '9', '董满仓', '2021-07-04 10:49:24', null);
INSERT INTO `dtoa_material` VALUES ('1970', '30301023', '加湿器', '156', '30301', '临建周转设备', '台', '220V', '', '', '9', '董满仓', '2021-07-04 10:49:58', null);
INSERT INTO `dtoa_material` VALUES ('1971', '30202037', '八角翼闸', '47', '30202', '文明施工', '台', '单机芯', '', '人脸识别系统', '9', '董满仓', '2021-07-04 11:07:29', '2021-07-04 11:10:41');
INSERT INTO `dtoa_material` VALUES ('1972', '30202038', '八角翼闸', '47', '30202', '文明施工', '台', '双机芯', '', '人脸识别系统', '9', '董满仓', '2021-07-04 11:08:48', '2021-07-04 11:10:51');
INSERT INTO `dtoa_material` VALUES ('1973', '30202039', '测温动态人脸机', '47', '30202', '文明施工', '台', '', '', '人脸识别系统', '9', '董满仓', '2021-07-04 11:09:23', '2021-07-04 11:10:29');
INSERT INTO `dtoa_material` VALUES ('1974', '30202040', '联网U盾', '47', '30202', '文明施工', '套', '', '', '人脸识别系统', '9', '董满仓', '2021-07-04 11:09:41', null);
INSERT INTO `dtoa_material` VALUES ('1975', '30202041', '液晶显示屏', '47', '30202', '文明施工', '台', '', '', '', '9', '董满仓', '2021-07-04 11:10:52', null);
INSERT INTO `dtoa_material` VALUES ('1976', '30202042', '不锈钢栏栅门', '47', '30202', '文明施工', '㎡', '', '', '', '9', '董满仓', '2021-07-04 11:11:09', null);
INSERT INTO `dtoa_material` VALUES ('1978', '30202044', '摄像头', '47', '30202', '文明施工', '个', '', '', '', '9', '董满仓', '2021-07-04 11:12:10', null);
INSERT INTO `dtoa_material` VALUES ('1979', '30202045', 'IC卡', '47', '30202', '文明施工', '张', '', '', '', '9', '董满仓', '2021-07-04 11:12:56', null);
INSERT INTO `dtoa_material` VALUES ('1980', '30202046', '刻录机', '47', '30202', '文明施工', '台', '', '', '', '9', '董满仓', '2021-07-04 11:14:10', null);
INSERT INTO `dtoa_material` VALUES ('1981', '30202047', '读卡器', '47', '30202', '文明施工', '台', '', '', '', '9', '董满仓', '2021-07-04 11:14:27', null);
INSERT INTO `dtoa_material` VALUES ('1982', '30202048', '发卡器', '47', '30202', '文明施工', '台', '', '', '', '9', '董满仓', '2021-07-04 11:14:56', null);
INSERT INTO `dtoa_material` VALUES ('1983', '30202049', '电源控制板', '47', '30202', '文明施工', '台', '', '', '人脸识别系统', '9', '董满仓', '2021-07-04 11:15:06', null);
INSERT INTO `dtoa_material` VALUES ('1984', '30102007', '硬盘', '146', '30102', '机械设备', '块', '3T', '', '', '9', '董满仓', '2021-07-04 11:15:42', '2021-07-04 11:17:23');
INSERT INTO `dtoa_material` VALUES ('1985', '30202050', '人脸识别系统软件', '47', '30202', '文明施工', '套', '', '', '', '9', '董满仓', '2021-07-04 11:17:23', null);
INSERT INTO `dtoa_material` VALUES ('1986', '30102008', '监控显示器', '146', '30102', '机械设备', '台', '', '', '', '9', '董满仓', '2021-07-04 11:19:06', null);
INSERT INTO `dtoa_material` VALUES ('1987', '30301024', '机箱房', '156', '30301', '临建周转设备', '套', '6m*3m*2.78m', '', '含插座、开关、配电箱等', '9', '董满仓', '2021-07-04 11:19:54', null);
INSERT INTO `dtoa_material` VALUES ('1988', '11116008', '消防栓箱', '149', '11116', '消防管材管件（消耗）', '套', '1600*700*240', '', '', '9', '董满仓', '2021-07-05 10:26:55', null);
INSERT INTO `dtoa_material` VALUES ('1989', '11116009', '消防栓箱', '149', '11116', '消防管材管件（消耗）', '套', '800*650*240', '', '', '9', '董满仓', '2021-07-05 10:28:14', null);
INSERT INTO `dtoa_material` VALUES ('1990', '11102079', '沟槽蝶阀', '93', '11102', '控水主材', '个', 'DN150', '', '', '9', '董满仓', '2021-07-05 10:28:38', null);
INSERT INTO `dtoa_material` VALUES ('1992', '11102080', '沟槽蝶阀', '93', '11102', '控水主材', '个', 'DN65', '', '', '9', '董满仓', '2021-07-05 10:29:47', null);
INSERT INTO `dtoa_material` VALUES ('1993', '11115024', '沟槽三通', '147', '11115', '沟槽管件', '个', 'DN150', '', '', '9', '董满仓', '2021-07-05 10:30:21', null);
INSERT INTO `dtoa_material` VALUES ('1994', '11115025', '沟槽三通', '147', '11115', '沟槽管件', '个', 'DN150*100', '', '', '9', '董满仓', '2021-07-05 10:31:08', null);
INSERT INTO `dtoa_material` VALUES ('1995', '11115026', '沟槽三通', '147', '11115', '沟槽管件', '个', 'DN150*65', '', '', '9', '董满仓', '2021-07-05 10:31:26', null);
INSERT INTO `dtoa_material` VALUES ('1997', '11115027', '沟槽三通', '147', '11115', '沟槽管件', '个', 'DN150*80', '', '', '9', '董满仓', '2021-07-05 10:32:03', null);
INSERT INTO `dtoa_material` VALUES ('1998', '11115028', '沟槽弯头', '147', '11115', '沟槽管件', '个', 'DN150*90°', '', '', '9', '董满仓', '2021-07-05 10:32:17', null);
INSERT INTO `dtoa_material` VALUES ('2000', '11115029', '沟槽弯头', '147', '11115', '沟槽管件', '个', 'DN65*90°', '', '', '9', '董满仓', '2021-07-05 10:33:19', null);
INSERT INTO `dtoa_material` VALUES ('2001', '11115030', '沟槽弯头', '147', '11115', '沟槽管件', '个', 'DN80*90°', '', '', '9', '董满仓', '2021-07-05 10:33:40', null);
INSERT INTO `dtoa_material` VALUES ('2002', '11101095', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN65*15', '', '', '9', '董满仓', '2021-07-05 10:34:08', null);
INSERT INTO `dtoa_material` VALUES ('2003', '11115031', '沟槽卡箍', '147', '11115', '沟槽管件', '个', 'DN150', '', '', '9', '董满仓', '2021-07-05 10:34:59', null);
INSERT INTO `dtoa_material` VALUES ('2005', '11109052', 'U型卡', '122', '11109', '水暖辅材', '个', 'DN150', '', '', '9', '董满仓', '2021-07-05 10:35:43', null);
INSERT INTO `dtoa_material` VALUES ('2006', '11109053', 'U型卡', '122', '11109', '水暖辅材', '个', 'DN65', '', '', '9', '董满仓', '2021-07-05 10:36:51', null);
INSERT INTO `dtoa_material` VALUES ('2007', '11109054', 'U型卡', '122', '11109', '水暖辅材', '个', 'DN100', '', '', '9', '董满仓', '2021-07-05 10:37:06', null);
INSERT INTO `dtoa_material` VALUES ('2008', '11109055', 'U型卡', '122', '11109', '水暖辅材', '个', 'DN80', '', '', '9', '董满仓', '2021-07-05 10:37:22', null);
INSERT INTO `dtoa_material` VALUES ('2009', '11103044', '镀锌衬塑弯头', '94', '11103', '镀锌衬塑管件', '个', 'DN80*90°', '镀锌衬塑', '', '9', '董满仓', '2021-07-05 10:37:38', null);
INSERT INTO `dtoa_material` VALUES ('2010', '11103045', '镀锌衬塑管箍', '94', '11103', '镀锌衬塑管件', '个', 'DN80', '镀锌衬塑', '', '9', '董满仓', '2021-07-05 10:38:47', null);
INSERT INTO `dtoa_material` VALUES ('2011', '11102081', '铜闸阀', '93', '11102', '控水主材', '个', 'DN80', '', '', '9', '董满仓', '2021-07-05 10:39:11', null);
INSERT INTO `dtoa_material` VALUES ('2012', '11104004', '湿式旋翼式水表', '106', '11104', '水表', '块', 'DN80', '', '', '9', '董满仓', '2021-07-05 10:39:46', null);
INSERT INTO `dtoa_material` VALUES ('2013', '11102082', '止回阀', '93', '11102', '控水主材', '个', 'DN80', '', '', '9', '董满仓', '2021-07-05 10:40:17', null);
INSERT INTO `dtoa_material` VALUES ('2014', '11008040', '接触器', '115', '11008', '电气设备安装材料', '个', 'CJX2-3211/220V', '', '', '9', '董满仓', '2021-07-05 10:41:19', null);
INSERT INTO `dtoa_material` VALUES ('2016', '11003101', '双面二级箱', '105', '11003', '电箱', '台', '1000*800', '', '', '9', '董满仓', '2021-07-05 15:10:23', null);
INSERT INTO `dtoa_material` VALUES ('2018', '11003102', '塔吊控制箱', '105', '11003', '电箱', '台', '800*600', '', '', '9', '董满仓', '2021-07-05 15:14:04', null);
INSERT INTO `dtoa_material` VALUES ('2019', '11008041', '漏电保护器', '115', '11008', '电气设备安装材料', '块', '380V200A', '', '', '9', '董满仓', '2021-07-05 15:14:29', null);
INSERT INTO `dtoa_material` VALUES ('2020', '30201020', '灭火毯', '46', '30201', '安全设备', '个', '', '', '', '9', '董满仓', '2021-07-05 15:15:12', null);
INSERT INTO `dtoa_material` VALUES ('2021', '112106', '塑料盆', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-07-05 15:16:14', null);
INSERT INTO `dtoa_material` VALUES ('2022', '112107', '芳香球', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-07-05 15:18:34', null);
INSERT INTO `dtoa_material` VALUES ('2023', '11117037', 'PE哈夫节', '152', '11117', 'PE管材管件', '个', '110', '', '', '9', '董满仓', '2021-07-05 15:19:32', null);
INSERT INTO `dtoa_material` VALUES ('2024', '11102083', '法兰盲板', '93', '11102', '控水主材', '片', 'DN80', '', '', '9', '董满仓', '2021-07-05 15:24:07', null);
INSERT INTO `dtoa_material` VALUES ('2025', '10702032', '绕管器', '118', '10702', '五金工具', '套', '', '', '', '9', '董满仓', '2021-07-05 15:40:42', null);
INSERT INTO `dtoa_material` VALUES ('2026', '30102009', '污水泵', '146', '30102', '机械设备', '台', '220V2.2KW2.5寸', '', '', '9', '董满仓', '2021-07-05 15:44:28', null);
INSERT INTO `dtoa_material` VALUES ('2027', '112108', '雨披', '41', '112', '低值易耗品', '件', '', '', '', '9', '董满仓', '2021-07-05 16:41:44', null);
INSERT INTO `dtoa_material` VALUES ('2029', '30201021', '涂塑水带', '46', '30201', '安全设备', '条', '50', '', '', '9', '董满仓', '2021-07-05 17:00:59', null);
INSERT INTO `dtoa_material` VALUES ('2030', '11007085', 'RVV护套线', '114', '11007', '电线电缆', '米', '2*1.5mm²', '', '', '9', '董满仓', '2021-07-06 08:38:21', null);
INSERT INTO `dtoa_material` VALUES ('2031', '10701149', '管道疏通簧', '90', '10701', '五金材料', '根', '2米', '', '', '9', '董满仓', '2021-07-06 08:39:22', null);
INSERT INTO `dtoa_material` VALUES ('2032', '1010301011', '预埋铁板', '136', '1010301', '加工铁板', '块', '500*500*20mm', '', '', '9', '董满仓', '2021-07-06 09:24:30', null);
INSERT INTO `dtoa_material` VALUES ('2033', '10702033', '尖锹', '118', '10702', '五金工具', '把', '', '', '', '9', '董满仓', '2021-07-06 09:25:20', null);
INSERT INTO `dtoa_material` VALUES ('2034', '11110084', 'PVC弯头', '129', '11110', 'PVC管材管件', '个', 'Φ32*90°', 'PVC', '', '9', '董满仓', '2021-07-06 09:26:55', null);
INSERT INTO `dtoa_material` VALUES ('2035', '11110085', 'PVC管箍', '129', '11110', 'PVC管材管件', '个', 'Φ32', 'PVC', '', '9', '董满仓', '2021-07-06 09:28:54', null);
INSERT INTO `dtoa_material` VALUES ('2036', '112109', '手提灯', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-07-06 09:29:18', null);
INSERT INTO `dtoa_material` VALUES ('2037', '10901005', '瓷砖卡子', '123', '10901', '橡塑制品', '包', '', '', '', '9', '董满仓', '2021-07-06 09:32:46', '2021-10-22 08:21:42');
INSERT INTO `dtoa_material` VALUES ('2038', '11110086', 'PVC座卡', '129', '11110', 'PVC管材管件', '个', 'Φ32', 'PVC', '', '9', '董满仓', '2021-07-06 09:33:47', null);
INSERT INTO `dtoa_material` VALUES ('2039', '10503009', '勾缝剂', '134', '10503', '小型材料', '盒', '3KG', '', '', '9', '董满仓', '2021-07-06 09:34:32', null);
INSERT INTO `dtoa_material` VALUES ('2040', '11101096', '镀锌补芯', '92', '11101', '镀锌管件', '个', 'DN80*25', '热镀锌', '', '9', '董满仓', '2021-07-06 09:35:22', null);
INSERT INTO `dtoa_material` VALUES ('2041', '11105067', 'PPR外丝直接', '107', '11105', 'PPR管材管件', '个', '25', 'PPR', '', '9', '董满仓', '2021-07-06 09:41:44', null);
INSERT INTO `dtoa_material` VALUES ('2042', '30301025', '空调风扇', '156', '30301', '临建周转设备', '台', '', '', '', '9', '董满仓', '2021-07-06 09:47:21', '2021-07-06 09:48:31');
INSERT INTO `dtoa_material` VALUES ('2043', '11109056', '包胶铁吊卡', '122', '11109', '水暖辅材', '个', '25', '', '', '9', '董满仓', '2021-07-06 09:48:32', null);
INSERT INTO `dtoa_material` VALUES ('2044', '11114009', '蹲便器', '142', '11114', '卫浴安装', '个', '', '', '', '9', '董满仓', '2021-07-06 09:52:08', null);
INSERT INTO `dtoa_material` VALUES ('2045', '10701150', '铁平垫', '90', '10701', '五金材料', '个', 'M8', '', '', '9', '董满仓', '2021-07-06 09:54:15', null);
INSERT INTO `dtoa_material` VALUES ('2046', '10801011', '调和漆', '116', '10801', '油漆水漆', '桶', '1KG', '', '', '9', '董满仓', '2021-07-06 16:40:10', null);
INSERT INTO `dtoa_material` VALUES ('2047', '11115032', '沟槽机械三通', '147', '11115', '沟槽管件', '个', '200*80', '', '', '9', '董满仓', '2021-07-06 16:48:11', null);
INSERT INTO `dtoa_material` VALUES ('2048', '10701151', '铁开孔器', '90', '10701', '五金材料', '个', 'Φ89', '', '', '9', '董满仓', '2021-07-06 16:49:51', null);
INSERT INTO `dtoa_material` VALUES ('2049', '11102084', '暗杆地下闸阀', '93', '11102', '控水主材', '个', 'DN80', '', '', '9', '董满仓', '2021-07-06 16:50:42', null);
INSERT INTO `dtoa_material` VALUES ('2050', '11114010', '柱式洗脸盆', '142', '11114', '卫浴安装', '个', '', '', '', '9', '董满仓', '2021-07-06 16:52:10', null);
INSERT INTO `dtoa_material` VALUES ('2051', '11114011', '挂式小便器', '142', '11114', '卫浴安装', '个', '', '', '', '9', '董满仓', '2021-07-06 16:53:27', null);
INSERT INTO `dtoa_material` VALUES ('2052', '11102085', '明装感应器', '93', '11102', '控水主材', '个', '', '', '', '9', '董满仓', '2021-07-06 16:54:18', null);
INSERT INTO `dtoa_material` VALUES ('2053', '11114012', '蹲便水箱', '142', '11114', '卫浴安装', '个', '', '', '', '9', '董满仓', '2021-07-06 16:54:56', null);
INSERT INTO `dtoa_material` VALUES ('2054', '11105068', 'PPR弯头', '107', '11105', 'PPR管材管件', '个', '25*20', 'PPR', '', '9', '董满仓', '2021-07-06 16:55:26', null);
INSERT INTO `dtoa_material` VALUES ('2055', '11105069', 'PPR座卡', '107', '11105', 'PPR管材管件', '个', '25', 'PPR', '', '9', '董满仓', '2021-07-06 16:56:54', null);
INSERT INTO `dtoa_material` VALUES ('2056', '11101097', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN80*50', '', '', '9', '董满仓', '2021-07-06 16:57:45', null);
INSERT INTO `dtoa_material` VALUES ('2057', '11101098', '镀锌对丝', '92', '11101', '镀锌管件', '个', 'DN80', '', '', '9', '董满仓', '2021-07-06 16:58:24', null);
INSERT INTO `dtoa_material` VALUES ('2058', '11101099', '镀锌补芯', '92', '11101', '镀锌管件', '个', 'DN80*20', '', '', '9', '董满仓', '2021-07-06 16:58:51', null);
INSERT INTO `dtoa_material` VALUES ('2059', '11112010', '不锈钢透气帽', '131', '11112', '不锈钢给水材料', '个', '75', '', '', '9', '董满仓', '2021-07-06 16:59:43', null);
INSERT INTO `dtoa_material` VALUES ('2060', '11102086', '洗脸盆水龙头', '93', '11102', '控水主材', '个', 'DN15', '', '', '9', '董满仓', '2021-07-06 17:00:39', '2021-07-06 17:03:15');
INSERT INTO `dtoa_material` VALUES ('2061', '11109057', '小便池下水器', '122', '11109', '水暖辅材', '个', '', '', '', '9', '董满仓', '2021-07-06 17:01:50', null);
INSERT INTO `dtoa_material` VALUES ('2062', '11109058', '洗脸盆下水器', '122', '11109', '水暖辅材', '个', '', '', '', '9', '董满仓', '2021-07-06 17:02:50', null);
INSERT INTO `dtoa_material` VALUES ('2063', '11114013', '镜子', '142', '11114', '卫浴安装', '套', '600*800', '', '', '9', '董满仓', '2021-07-06 17:03:15', null);
INSERT INTO `dtoa_material` VALUES ('2064', '1010302002', '铁板', '154', '1010302', '板材', '吨', '25mm厚', 'Q235B', '', '9', '董满仓', '2021-07-07 11:08:44', null);
INSERT INTO `dtoa_material` VALUES ('2065', '11005038', '吊装LED单管灯', '112', '11005', '灯具', '套', '16W', '', '', '9', '董满仓', '2021-07-07 11:14:41', null);
INSERT INTO `dtoa_material` VALUES ('2066', '11005039', '壁装LED单管灯', '112', '11005', '灯具', '套', '16W', '', '', '9', '董满仓', '2021-07-07 11:20:50', null);
INSERT INTO `dtoa_material` VALUES ('2067', '11005040', 'LED吸顶灯', '112', '11005', '灯具', '个', '18W', '', '', '9', '董满仓', '2021-07-07 11:21:14', null);
INSERT INTO `dtoa_material` VALUES ('2068', '11005041', '防尘吸顶灯', '112', '11005', '灯具', '个', '18W', '', '', '9', '董满仓', '2021-07-07 11:23:15', null);
INSERT INTO `dtoa_material` VALUES ('2069', '11005042', 'LED防爆壁灯', '112', '11005', '灯具', '套', '5W', '', '', '9', '董满仓', '2021-07-07 11:23:42', null);
INSERT INTO `dtoa_material` VALUES ('2070', '11008042', '紧急按钮', '115', '11008', '电气设备安装材料', '个', '36W', '', '', '9', '董满仓', '2021-07-07 11:26:10', null);
INSERT INTO `dtoa_material` VALUES ('2071', '11008043', '报警铃', '115', '11008', '电气设备安装材料', '个', '220V36W', '', '', '9', '董满仓', '2021-07-07 11:28:16', null);
INSERT INTO `dtoa_material` VALUES ('2072', '11008044', '密闭三联开关', '115', '11008', '电气设备安装材料', '个', '250V10A', '', '', '9', '董满仓', '2021-07-08 14:33:23', null);
INSERT INTO `dtoa_material` VALUES ('2073', '11008045', '密闭双联开关', '115', '11008', '电气设备安装材料', '个', '250V10A', '', '', '9', '董满仓', '2021-07-08 14:42:35', null);
INSERT INTO `dtoa_material` VALUES ('2074', '11008046', '声光控延时开关', '115', '11008', '电气设备安装材料', '个', '250V10A', '', '', '9', '董满仓', '2021-07-08 14:42:57', null);
INSERT INTO `dtoa_material` VALUES ('2075', '10602005', '钢质门', '153', '10602', '防火门', '㎡', '', '', '', '9', '董满仓', '2021-07-14 08:15:02', null);
INSERT INTO `dtoa_material` VALUES ('2076', '10501012', '全瓷地砖', '125', '10501', '瓷砖', '块', '1000*1000', '', '', '9', '董满仓', '2021-07-18 16:02:41', null);
INSERT INTO `dtoa_material` VALUES ('2077', '11005043', 'LED投光灯', '112', '11005', '灯具', '个', '50W', '', '', '9', '董满仓', '2021-07-20 14:21:42', '2021-07-20 14:33:01');
INSERT INTO `dtoa_material` VALUES ('2078', '11005044', 'LED灯泡', '112', '11005', '灯具', '个', '9W', '', '', '9', '董满仓', '2021-07-20 14:33:01', null);
INSERT INTO `dtoa_material` VALUES ('2079', '11005045', '路灯灯头', '112', '11005', '灯具', '套', '八灯臂九灯球', '', '', '9', '董满仓', '2021-07-20 14:33:51', null);
INSERT INTO `dtoa_material` VALUES ('2080', '10702034', '开口扳手', '118', '10702', '五金工具', '把', '18#', '', '', '9', '董满仓', '2021-07-20 14:42:03', null);
INSERT INTO `dtoa_material` VALUES ('2081', '10702035', '开口扳手', '118', '10702', '五金工具', '把', '21#', '', '', '9', '董满仓', '2021-07-20 14:42:55', null);
INSERT INTO `dtoa_material` VALUES ('2082', '10702036', '电钻钥匙', '118', '10702', '五金工具', '把', '', '', '', '9', '董满仓', '2021-07-20 14:43:08', null);
INSERT INTO `dtoa_material` VALUES ('2083', '30301026', '空调柜机', '156', '30301', '临建周转设备', '台', 'TCLKFRD-72LW/EL23', '', '', '9', '董满仓', '2021-07-20 14:43:29', null);
INSERT INTO `dtoa_material` VALUES ('2084', '30301027', '空调挂机', '156', '30301', '临建周转设备', '台', 'TCLKFRD-35GW/XA11+3', '', '', '9', '董满仓', '2021-07-20 15:00:37', null);
INSERT INTO `dtoa_material` VALUES ('2085', '11401001', '铜管', '163', '11401', '铜', '米', 'Φ10', '', '', '9', '董满仓', '2021-07-20 15:23:32', null);
INSERT INTO `dtoa_material` VALUES ('2086', '11401002', '铜管', '163', '11401', '铜', '米', 'Φ12', '', '', '9', '董满仓', '2021-07-20 15:24:32', null);
INSERT INTO `dtoa_material` VALUES ('2087', '11008047', '空调漏电保护器', '115', '11008', '电气设备安装材料', '个', '220V32A', '', '', '9', '董满仓', '2021-07-20 15:24:59', null);
INSERT INTO `dtoa_material` VALUES ('2088', '10802015', '氟', '117', '10802', '化工产品', 'KG', 'R22', '', '', '9', '董满仓', '2021-07-20 15:26:12', null);
INSERT INTO `dtoa_material` VALUES ('2089', '10802016', '氟', '117', '10802', '化工产品', 'KG', 'R32', '', '', '9', '董满仓', '2021-07-20 15:26:57', null);
INSERT INTO `dtoa_material` VALUES ('2090', '112110', '柜机空调移机', '41', '112', '低值易耗品', '台', '', '', '', '9', '董满仓', '2021-07-20 15:27:15', null);
INSERT INTO `dtoa_material` VALUES ('2091', '112111', '挂机空调移机', '41', '112', '低值易耗品', '台', '', '', '', '9', '董满仓', '2021-07-20 15:29:02', null);
INSERT INTO `dtoa_material` VALUES ('2092', '112112', '柜机空调清洗', '41', '112', '低值易耗品', '台', '', '', '', '9', '董满仓', '2021-07-20 15:29:12', '2021-07-20 15:29:58');
INSERT INTO `dtoa_material` VALUES ('2093', '112113', '挂机空调清洗', '41', '112', '低值易耗品', '台', '', '', '', '9', '董满仓', '2021-07-20 15:29:36', null);
INSERT INTO `dtoa_material` VALUES ('2094', '10701152', '镀锌板矩形风管', '90', '10701', '五金材料', '㎡', '500*300', '', '', '9', '董满仓', '2021-07-20 15:29:59', null);
INSERT INTO `dtoa_material` VALUES ('2095', '30301028', '排烟罩', '156', '30301', '临建周转设备', '个', '1800*1500', '', '', '9', '董满仓', '2021-07-20 15:37:25', null);
INSERT INTO `dtoa_material` VALUES ('2096', '112114', '风管软连接', '41', '112', '低值易耗品', '㎡', '', '', '', '9', '董满仓', '2021-07-20 15:38:05', null);
INSERT INTO `dtoa_material` VALUES ('2097', '10802017', '除锈油', '117', '10802', '化工产品', '桶', '10KG', '', '', '9', '董满仓', '2021-07-20 15:39:11', null);
INSERT INTO `dtoa_material` VALUES ('2098', '30102010', '排烟风机', '146', '30102', '机械设备', '台', '11374m³/h/770pa/1200W/220V', '', '', '9', '董满仓', '2021-07-20 15:39:44', '2021-07-20 15:42:30');
INSERT INTO `dtoa_material` VALUES ('2099', '30102011', '油烟净化器', '146', '30102', '机械设备', '台', '6000m³/h/578pa/1200W', '', '', '9', '董满仓', '2021-07-20 15:42:30', null);
INSERT INTO `dtoa_material` VALUES ('2100', '10705018', '角铁支架', '121', '10705', '金属构件', '个', '550*300', '', '', '9', '董满仓', '2021-07-20 15:43:41', null);
INSERT INTO `dtoa_material` VALUES ('2101', '10802018', '密封剂', '117', '10802', '化工产品', '瓶', '1KG', '', '', '9', '董满仓', '2021-07-20 15:44:31', null);
INSERT INTO `dtoa_material` VALUES ('2102', '30102012', '消音箱', '146', '30102', '机械设备', '台', '500*300*600', '', '', '9', '董满仓', '2021-07-20 15:44:57', null);
INSERT INTO `dtoa_material` VALUES ('2103', '10701153', '矩形吊卡', '90', '10701', '五金材料', '个', '550*300', '', '', '9', '董满仓', '2021-07-20 15:45:53', null);
INSERT INTO `dtoa_material` VALUES ('2104', '11003103', '1AL2', '105', '11003', '电箱', '台', '500*600*200', '', '全套', '9', '董满仓', '2021-07-21 14:46:38', null);
INSERT INTO `dtoa_material` VALUES ('2105', '11003104', '1AL1', '105', '11003', '电箱', '台', '600*800*200', '', '全套', '9', '董满仓', '2021-07-21 14:47:48', null);
INSERT INTO `dtoa_material` VALUES ('2106', '11003105', '2AL1', '105', '11003', '电箱', '台', '500*600*200', '', '全套', '9', '董满仓', '2021-07-21 14:48:55', null);
INSERT INTO `dtoa_material` VALUES ('2107', '11003106', 'WDAT-XF', '105', '11003', '电箱', '台', '600*800*200', '', '全套', '9', '董满仓', '2021-07-21 14:49:44', null);
INSERT INTO `dtoa_material` VALUES ('2108', '11003107', '2AP-KT1', '105', '11003', '电箱', '台', '600*800*200', '', '全套', '9', '董满仓', '2021-07-21 14:50:41', null);
INSERT INTO `dtoa_material` VALUES ('2109', '11003108', '2AP-KT2', '105', '11003', '电箱', '台', '600*800*200', '', '全套', '9', '董满仓', '2021-07-21 14:51:26', null);
INSERT INTO `dtoa_material` VALUES ('2110', '11003109', '1AA1', '105', '11003', '电箱', '台', '700*2000*400', '', '全套', '9', '董满仓', '2021-07-21 14:51:57', null);
INSERT INTO `dtoa_material` VALUES ('2111', '11003110', '1AA2', '105', '11003', '电箱', '台', '700*2000*400', '', '全套', '9', '董满仓', '2021-07-21 14:53:16', null);
INSERT INTO `dtoa_material` VALUES ('2112', '11003111', '1AA3', '105', '11003', '电箱', '台', '700*2000*400', '', '全套', '9', '董满仓', '2021-07-21 14:53:43', null);
INSERT INTO `dtoa_material` VALUES ('2113', '11003112', '1AA4', '105', '11003', '电箱', '台', '700*2000*400', '', '全套', '9', '董满仓', '2021-07-21 14:54:14', null);
INSERT INTO `dtoa_material` VALUES ('2114', '11003113', '1AK-RD', '105', '11003', '电箱', '台', '500*600*200', '', '全套', '9', '董满仓', '2021-07-21 14:54:46', null);
INSERT INTO `dtoa_material` VALUES ('2115', '11003114', '1AT-XF', '105', '11003', '电箱', '台', '600*800*200', '', '全套', '9', '董满仓', '2021-07-21 14:56:02', null);
INSERT INTO `dtoa_material` VALUES ('2116', '11003115', '控制箱', '105', '11003', '电箱', '台', '500*400*200', '', '全套', '9', '董满仓', '2021-07-21 14:56:37', null);
INSERT INTO `dtoa_material` VALUES ('2117', '30102013', '卧式消防泵', '146', '30102', '机械设备', '台', 'XBD10.0/15G-CQW/30KW', '', '', '9', '董满仓', '2021-07-22 16:18:17', null);
INSERT INTO `dtoa_material` VALUES ('2118', '11003116', '变频控制柜', '105', '11003', '电箱', '台', 'CQBK-2GM-30', '', '', '9', '董满仓', '2021-07-22 16:20:29', null);
INSERT INTO `dtoa_material` VALUES ('2119', '30102014', '卧式管道泵', '146', '30102', '机械设备', '台', 'CQW40-250/5.5KW', '', '', '9', '董满仓', '2021-07-22 16:22:03', null);
INSERT INTO `dtoa_material` VALUES ('2120', '11003117', '水泵控制箱', '105', '11003', '电箱', '台', 'CQK-2P-5.5KW', '', '', '9', '董满仓', '2021-07-22 16:23:02', null);
INSERT INTO `dtoa_material` VALUES ('2121', '30301029', '水箱', '156', '30301', '临建周转设备', '台', '2.5m*2m*2m', '4mm厚钛钢板', '', '9', '董满仓', '2021-07-22 16:24:32', null);
INSERT INTO `dtoa_material` VALUES ('2122', '10701154', '直螺纹套筒', '90', '10701', '五金材料', '个', 'Φ16正', '', '', '9', '董满仓', '2021-07-22 16:27:09', null);
INSERT INTO `dtoa_material` VALUES ('2123', '10701155', '直螺纹套筒', '90', '10701', '五金材料', '个', 'Φ16反', '', '', '9', '董满仓', '2021-07-22 16:28:48', null);
INSERT INTO `dtoa_material` VALUES ('2124', '10701156', '直螺纹套筒', '90', '10701', '五金材料', '个', 'Φ18正', '', '', '9', '董满仓', '2021-07-22 16:29:20', null);
INSERT INTO `dtoa_material` VALUES ('2125', '10701157', '直螺纹套筒', '90', '10701', '五金材料', '个', 'Φ18反', '', '', '9', '董满仓', '2021-07-22 16:29:44', null);
INSERT INTO `dtoa_material` VALUES ('2126', '10701158', '直螺纹套筒', '90', '10701', '五金材料', '个', 'Φ20正', '', '', '9', '董满仓', '2021-07-22 16:29:59', null);
INSERT INTO `dtoa_material` VALUES ('2127', '10701159', '直螺纹套筒', '90', '10701', '五金材料', '个', 'Φ20反', '', '', '9', '董满仓', '2021-07-22 16:30:12', null);
INSERT INTO `dtoa_material` VALUES ('2128', '10701160', '直螺纹套筒', '90', '10701', '五金材料', '个', 'Φ22正', '', '', '9', '董满仓', '2021-07-22 16:30:25', null);
INSERT INTO `dtoa_material` VALUES ('2129', '10701161', '直螺纹套筒', '90', '10701', '五金材料', '个', 'Φ22反', '', '', '9', '董满仓', '2021-07-22 16:30:52', null);
INSERT INTO `dtoa_material` VALUES ('2130', '10701162', '直螺纹套筒', '90', '10701', '五金材料', '个', 'Φ25正', '', '', '9', '董满仓', '2021-07-22 16:31:06', null);
INSERT INTO `dtoa_material` VALUES ('2131', '10701163', '直螺纹套筒', '90', '10701', '五金材料', '个', 'Φ25反', '', '', '9', '董满仓', '2021-07-22 16:31:20', null);
INSERT INTO `dtoa_material` VALUES ('2132', '10701164', '直螺纹套筒', '90', '10701', '五金材料', '个', 'Φ18变16', '', '', '9', '董满仓', '2021-07-22 16:31:37', null);
INSERT INTO `dtoa_material` VALUES ('2133', '10901006', '钢筋保护帽', '123', '10901', '橡塑制品', '个', 'Φ16', '', '', '9', '董满仓', '2021-07-22 16:32:30', '2021-10-22 08:21:42');
INSERT INTO `dtoa_material` VALUES ('2134', '10901007', '钢筋保护帽', '123', '10901', '橡塑制品', '个', 'Φ18', '', '', '9', '董满仓', '2021-07-22 16:33:07', '2021-10-22 08:21:42');
INSERT INTO `dtoa_material` VALUES ('2135', '10901008', '钢筋保护帽', '123', '10901', '橡塑制品', '个', 'Φ20', '', '', '9', '董满仓', '2021-07-22 16:33:30', '2021-10-22 08:21:42');
INSERT INTO `dtoa_material` VALUES ('2136', '10901009', '钢筋保护帽', '123', '10901', '橡塑制品', '个', 'Φ22', '', '', '9', '董满仓', '2021-07-22 16:33:46', '2021-10-22 08:21:42');
INSERT INTO `dtoa_material` VALUES ('2137', '10901010', '钢筋保护帽', '123', '10901', '橡塑制品', '个', 'Φ25', '', '', '9', '董满仓', '2021-07-22 16:34:00', '2021-10-22 08:21:42');
INSERT INTO `dtoa_material` VALUES ('2138', '10701165', '钢丝绳', '90', '10701', '五金材料', '米', 'Φ10', '', '', '9', '董满仓', '2021-07-22 16:34:12', null);
INSERT INTO `dtoa_material` VALUES ('2139', '10701166', '卡豆', '90', '10701', '五金材料', '个', '10', '', '', '9', '董满仓', '2021-07-22 16:34:52', null);
INSERT INTO `dtoa_material` VALUES ('2140', '10701167', '花兰螺栓', '90', '10701', '五金材料', '个', '16*250', '', '', '9', '董满仓', '2021-07-22 16:35:14', null);
INSERT INTO `dtoa_material` VALUES ('2141', '11007086', 'YC橡套电缆', '114', '11007', '电线电缆', '米', '3*4mm²', '', '', '9', '董满仓', '2021-07-22 16:36:04', null);
INSERT INTO `dtoa_material` VALUES ('2142', '201007', '混凝土', '10', '201', '普通混凝土', 'm³', 'C40', '', '', '9', '董满仓', '2021-07-28 08:19:35', null);
INSERT INTO `dtoa_material` VALUES ('2143', '201008', '混凝土', '10', '201', '普通混凝土', 'm³', 'C45', '', '', '9', '董满仓', '2021-07-28 08:19:59', null);
INSERT INTO `dtoa_material` VALUES ('2144', '203005', '抗渗混凝土', '12', '203', '抗渗混凝土', 'm³', 'C45P6', '', '', '9', '董满仓', '2021-07-28 08:23:51', null);
INSERT INTO `dtoa_material` VALUES ('2145', '203006', '抗渗混凝土', '12', '203', '抗渗混凝土', 'm³', 'C40P6', '', '', '9', '董满仓', '2021-07-28 08:24:32', null);
INSERT INTO `dtoa_material` VALUES ('2146', '216001', '抗渗膨胀混凝土', '164', '216', '抗渗膨胀混凝土', 'm³', 'C40P6', '', '', '9', '董满仓', '2021-07-28 08:27:17', null);
INSERT INTO `dtoa_material` VALUES ('2147', '216002', '抗渗膨胀混凝土', '164', '216', '抗渗膨胀混凝土', 'm³', 'C35P6', '', '', '9', '董满仓', '2021-07-28 08:28:06', null);
INSERT INTO `dtoa_material` VALUES ('2148', '206006', '细石混凝土', '65', '206', '细石混凝土', 'm³', 'C40', '', '', '9', '董满仓', '2021-07-28 08:28:33', null);
INSERT INTO `dtoa_material` VALUES ('2149', '206007', '细石混凝土', '65', '206', '细石混凝土', 'm³', 'C45', '', '', '9', '董满仓', '2021-07-28 08:29:05', null);
INSERT INTO `dtoa_material` VALUES ('2150', '217001', '轻集料混凝土', '165', '217', '轻集料混凝土', 'm³', 'B型复合轻集料', '', '', '9', '董满仓', '2021-07-28 08:33:07', null);
INSERT INTO `dtoa_material` VALUES ('2151', '10801012', '黑漆', '116', '10801', '油漆水漆', '桶', '18KG', '', '', '9', '董满仓', '2021-07-28 09:04:25', null);
INSERT INTO `dtoa_material` VALUES ('2152', '10801013', '稀料', '116', '10801', '油漆水漆', '桶', '15KG', '', '', '9', '董满仓', '2021-07-28 09:07:54', null);
INSERT INTO `dtoa_material` VALUES ('2153', '10603006', '金刚网纱窗', '160', '10603', '窗及制品', '个', '1370*1400', '', '', '9', '董满仓', '2021-07-28 09:08:27', null);
INSERT INTO `dtoa_material` VALUES ('2154', '11110087', 'PVC给水管', '129', '11110', 'PVC管材管件', '米', 'Φ63', 'PVC', '', '9', '董满仓', '2021-08-02 14:59:17', null);
INSERT INTO `dtoa_material` VALUES ('2155', '11112011', '不锈钢哈夫节抱箍', '131', '11112', '不锈钢给水材料', '个', 'DN50', '', '', '9', '董满仓', '2021-08-03 16:59:27', null);
INSERT INTO `dtoa_material` VALUES ('2156', '10702037', '喷漆枪', '118', '10702', '五金工具', '把', '', '', '', '9', '董满仓', '2021-08-03 17:02:36', null);
INSERT INTO `dtoa_material` VALUES ('2157', '10901011', '塑料软管', '123', '10901', '橡塑制品', '米', 'Φ10', '', '', '9', '董满仓', '2021-08-03 17:03:12', '2021-10-22 08:21:42');
INSERT INTO `dtoa_material` VALUES ('2158', '11008048', '洗车池感应器', '115', '11008', '电气设备安装材料', '个', '', '', '', '9', '董满仓', '2021-08-03 17:04:13', null);
INSERT INTO `dtoa_material` VALUES ('2159', '11003118', '中转箱', '105', '11003', '电箱', '台', '', '', '', '9', '董满仓', '2021-08-03 17:05:44', null);
INSERT INTO `dtoa_material` VALUES ('2160', '10701168', '轴承', '90', '10701', '五金材料', '个', '301', '', '', '9', '董满仓', '2021-08-03 17:07:22', null);
INSERT INTO `dtoa_material` VALUES ('2161', '11001046', '密闭线盒', '59', '11001', '管线敷设', '套', '180*150*120', '', '', '9', '董满仓', '2021-08-03 17:07:53', null);
INSERT INTO `dtoa_material` VALUES ('2162', '11001047', '铁八角盒', '59', '11001', '管线敷设', '个', '86H90-4分孔', '', '', '9', '董满仓', '2021-08-03 17:11:23', null);
INSERT INTO `dtoa_material` VALUES ('2163', '11001048', '铁八角盒', '59', '11001', '管线敷设', '个', '86H90-6分孔', '', '', '9', '董满仓', '2021-08-03 17:12:57', null);
INSERT INTO `dtoa_material` VALUES ('2164', '11001049', '穿筋铁方盒', '59', '11001', '管线敷设', '个', '86H80-6分孔', '', '', '9', '董满仓', '2021-08-04 07:58:39', null);
INSERT INTO `dtoa_material` VALUES ('2165', '11001050', '钢制方盒', '59', '11001', '管线敷设', '套', '150*150*120', '', '', '9', '董满仓', '2021-08-04 07:59:17', null);
INSERT INTO `dtoa_material` VALUES ('2166', '11001051', '钢制方盒', '59', '11001', '管线敷设', '套', '100*100*100', '', '', '9', '董满仓', '2021-08-04 08:01:00', null);
INSERT INTO `dtoa_material` VALUES ('2167', '11001052', '钢制方盒', '59', '11001', '管线敷设', '个', '200*200*120', '', '', '9', '董满仓', '2021-08-04 08:01:21', null);
INSERT INTO `dtoa_material` VALUES ('2168', '11001053', '分线箱', '59', '11001', '管线敷设', '套', '200*200*150', '', '', '9', '董满仓', '2021-08-04 08:01:39', null);
INSERT INTO `dtoa_material` VALUES ('2169', '11001054', '分线箱', '59', '11001', '管线敷设', '套', '300*200*150', '', '', '9', '董满仓', '2021-08-04 08:04:06', null);
INSERT INTO `dtoa_material` VALUES ('2170', '10703025', '焊接镀锌管帽', '119', '10703', '焊接冲压管件', '个', '50', '', '', '9', '董满仓', '2021-08-04 08:04:22', null);
INSERT INTO `dtoa_material` VALUES ('2171', '10603007', '窗纱', '160', '10603', '窗及制品', '米', '1.5m宽', '', '', '9', '董满仓', '2021-08-04 08:05:53', '2021-08-04 08:16:04');
INSERT INTO `dtoa_material` VALUES ('2172', '11002093', '铜管接头', '91', '11002', '电气辅材', '个', '70mm²', '', '', '9', '董满仓', '2021-08-04 08:07:05', null);
INSERT INTO `dtoa_material` VALUES ('2173', '11001055', '瓷柱绝缘子', '59', '11001', '管线敷设', '个', '2#', '', '', '9', '董满仓', '2021-08-04 08:09:04', null);
INSERT INTO `dtoa_material` VALUES ('2174', '112115', '拉绳彩旗', '41', '112', '低值易耗品', '米', '', '', '', '9', '董满仓', '2021-08-04 08:16:05', null);
INSERT INTO `dtoa_material` VALUES ('2175', '10802019', '乳化液', '117', '10802', '化工产品', '桶', '15kg', '', '', '9', '董满仓', '2021-08-04 08:17:01', '2021-08-04 08:25:41');
INSERT INTO `dtoa_material` VALUES ('2176', '10701169', '内六角螺栓', '90', '10701', '五金材料', '条', 'M8*16', '', '', '9', '董满仓', '2021-08-04 08:21:03', null);
INSERT INTO `dtoa_material` VALUES ('2177', '30202051', '迷彩服', '47', '30202', '文明施工', '套', '', '', '', '9', '董满仓', '2021-08-04 08:25:42', null);
INSERT INTO `dtoa_material` VALUES ('2178', '401001', '卫生间隔断', '71', '401', '卫生间隔板', '套', '1.2厚抗倍特板', '', '', '9', '董满仓', '2021-08-04 08:32:21', '2021-08-04 08:47:02');
INSERT INTO `dtoa_material` VALUES ('2179', '401002', '小便池隔板', '71', '401', '卫生间隔板', '块', '1.2厚抗倍特板', '', '', '9', '董满仓', '2021-08-04 08:47:03', null);
INSERT INTO `dtoa_material` VALUES ('2180', '10502002', '广西白将军柱', '127', '10502', '石材', '根', '200*200*1250', '', '', '9', '董满仓', '2021-08-04 08:47:29', '2021-08-04 09:18:11');
INSERT INTO `dtoa_material` VALUES ('2181', '10502003', '广西白花瓶柱', '127', '10502', '石材', '根', 'φ150*770', '', '', '9', '董满仓', '2021-08-04 08:49:12', '2021-08-04 09:18:05');
INSERT INTO `dtoa_material` VALUES ('2182', '10502004', '广西白扶手', '127', '10502', '石材', '米', '1000*150*100', '', '', '9', '董满仓', '2021-08-04 08:49:39', '2021-08-04 09:18:00');
INSERT INTO `dtoa_material` VALUES ('2183', '10502005', '广西白底座', '127', '10502', '石材', '米', '1000*200*100', '', '', '9', '董满仓', '2021-08-04 08:50:51', '2021-08-04 09:17:54');
INSERT INTO `dtoa_material` VALUES ('2184', '50109001', '刮平机', '167', '50109', '其他', '台班', 'GR1803', '', '', '9', '董满仓', '2021-08-04 08:56:58', null);
INSERT INTO `dtoa_material` VALUES ('2185', '50106006', '双钢轮压路机', '86', '50106', '压路机', '班', 'CC900', '', '', '9', '董满仓', '2021-08-04 09:04:10', null);
INSERT INTO `dtoa_material` VALUES ('2186', '50106007', '压路机', '86', '50106', '压路机', '班', 'CC6200', '', '', '9', '董满仓', '2021-08-04 09:04:52', null);
INSERT INTO `dtoa_material` VALUES ('2187', '50102004', '铲车（装载机）', '82', '50102', '铲车', '班', 'LG850', '', '', '9', '董满仓', '2021-08-04 09:05:12', null);
INSERT INTO `dtoa_material` VALUES ('2188', '10504002', '腻子粉', '159', '10504', '其他建材', '吨', '20KG/袋', '', '', '9', '董满仓', '2021-08-04 09:05:41', null);
INSERT INTO `dtoa_material` VALUES ('2189', '10802020', '防水涂料', '117', '10802', '化工产品', '桶', '18KG', '', '', '9', '董满仓', '2021-08-04 09:08:33', null);
INSERT INTO `dtoa_material` VALUES ('2190', '10504003', '涂料', '159', '10504', '其他建材', '桶', '18L', '', '', '9', '董满仓', '2021-08-04 09:12:33', null);
INSERT INTO `dtoa_material` VALUES ('2191', '11001056', '外耳铁八角盒', '59', '11001', '管线敷设', '个', '86H70', '', '', '9', '董满仓', '2021-08-05 09:23:58', null);
INSERT INTO `dtoa_material` VALUES ('2192', '11001057', '钢制方盒', '59', '11001', '管线敷设', '个', '200*250*150', '', '', '9', '董满仓', '2021-08-05 09:25:02', null);
INSERT INTO `dtoa_material` VALUES ('2193', '11001058', '146钢制方盒', '59', '11001', '管线敷设', '个', '146H70', '', '', '9', '董满仓', '2021-08-05 09:27:35', null);
INSERT INTO `dtoa_material` VALUES ('2194', '10703026', '焊接冲压弯头', '119', '10703', '焊接冲压管件', '个', 'SC80*90°*6倍', '', '', '9', '董满仓', '2021-08-05 09:28:22', null);
INSERT INTO `dtoa_material` VALUES ('2195', '10703027', 'SC铁套管', '119', '10703', '焊接冲压管件', '个', '90', '', '', '9', '董满仓', '2021-08-05 09:30:20', null);
INSERT INTO `dtoa_material` VALUES ('2196', '1010104009', '镀锌衬塑管', '104', '1010104', '镀锌衬塑管', '米', '100', '', '', '9', '董满仓', '2021-08-05 15:25:23', null);
INSERT INTO `dtoa_material` VALUES ('2197', '1010104010', '镀锌衬塑管', '104', '1010104', '镀锌衬塑管', '米', '125', '', '', '9', '董满仓', '2021-08-05 15:27:15', null);
INSERT INTO `dtoa_material` VALUES ('2198', '1010104011', '镀锌衬塑管', '104', '1010104', '镀锌衬塑管', '米', '150', '', '', '9', '董满仓', '2021-08-05 15:27:26', null);
INSERT INTO `dtoa_material` VALUES ('2199', '1010403006', '镀锌圆钢', '143', '1010403', '圆钢', '米', 'Φ10', '', '', '9', '董满仓', '2021-08-05 15:27:43', null);
INSERT INTO `dtoa_material` VALUES ('2200', '1010403007', '镀锌圆钢', '143', '1010403', '圆钢', '米', 'Φ16', '', '', '9', '董满仓', '2021-08-05 15:29:17', null);
INSERT INTO `dtoa_material` VALUES ('2201', '1010403008', '圆钢', '143', '1010403', '圆钢', '米', 'Φ20', '', '', '9', '董满仓', '2021-08-05 15:29:41', null);
INSERT INTO `dtoa_material` VALUES ('2202', '1010203003', '镀锌扁钢', '58', '1010203', '扁钢', '米', '50', '', '', '9', '董满仓', '2021-08-05 15:29:56', null);
INSERT INTO `dtoa_material` VALUES ('2203', '10705019', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN300*600', '', '', '9', '董满仓', '2021-08-05 15:31:06', null);
INSERT INTO `dtoa_material` VALUES ('2204', '10705020', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN150*500', '', '', '9', '董满仓', '2021-08-05 15:32:57', null);
INSERT INTO `dtoa_material` VALUES ('2205', '10705021', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN150*400', '', '', '9', '董满仓', '2021-08-05 15:33:31', null);
INSERT INTO `dtoa_material` VALUES ('2206', '10705022', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN100*400', '', '', '9', '董满仓', '2021-08-05 15:34:25', null);
INSERT INTO `dtoa_material` VALUES ('2207', '10705023', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN100*500', '', '', '9', '董满仓', '2021-08-05 15:35:05', null);
INSERT INTO `dtoa_material` VALUES ('2208', '10705024', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN100*600', '', '', '9', '董满仓', '2021-08-05 15:35:21', null);
INSERT INTO `dtoa_material` VALUES ('2209', '10705025', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN100*800', '', '', '9', '董满仓', '2021-08-05 15:35:42', null);
INSERT INTO `dtoa_material` VALUES ('2210', '10705026', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN100*860', '', '', '9', '董满仓', '2021-08-05 15:36:13', null);
INSERT INTO `dtoa_material` VALUES ('2211', '10705027', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN80*400', '', '', '9', '董满仓', '2021-08-05 15:36:40', null);
INSERT INTO `dtoa_material` VALUES ('2212', '10705028', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN50*500', '', '', '9', '董满仓', '2021-08-05 15:37:32', null);
INSERT INTO `dtoa_material` VALUES ('2213', '10705029', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN50*860', '', '', '9', '董满仓', '2021-08-05 15:37:56', null);
INSERT INTO `dtoa_material` VALUES ('2214', '10705030', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN65*500', '', '', '9', '董满仓', '2021-08-05 15:38:20', null);
INSERT INTO `dtoa_material` VALUES ('2215', '10705031', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN75*500', '', '', '9', '董满仓', '2021-08-05 15:38:45', null);
INSERT INTO `dtoa_material` VALUES ('2216', '10705032', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN40*400', '', '', '9', '董满仓', '2021-08-05 15:39:32', null);
INSERT INTO `dtoa_material` VALUES ('2217', '10705033', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN40*500', '', '', '9', '董满仓', '2021-08-05 15:39:58', null);
INSERT INTO `dtoa_material` VALUES ('2218', '10705034', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN40*860', '', '', '9', '董满仓', '2021-08-05 15:40:22', null);
INSERT INTO `dtoa_material` VALUES ('2219', '10705035', '刚性止水套管', '121', '10705', '金属构件', '个', 'DN32*500', '', '', '9', '董满仓', '2021-08-05 15:41:01', null);
INSERT INTO `dtoa_material` VALUES ('2220', '10705036', '柔性防水套管', '121', '10705', '金属构件', '个', 'DN200*600', '', '', '9', '董满仓', '2021-08-05 15:41:35', null);
INSERT INTO `dtoa_material` VALUES ('2221', '10705037', '柔性防水套管', '121', '10705', '金属构件', '个', 'DN150*600', '', '', '9', '董满仓', '2021-08-05 15:43:53', null);
INSERT INTO `dtoa_material` VALUES ('2222', '10705038', '柔性防水套管', '121', '10705', '金属构件', '个', 'DN100*600', '', '', '9', '董满仓', '2021-08-05 15:44:46', null);
INSERT INTO `dtoa_material` VALUES ('2223', '10705039', '柔性防水套管', '121', '10705', '金属构件', '个', 'DN65*600', '', '', '9', '董满仓', '2021-08-05 15:45:37', null);
INSERT INTO `dtoa_material` VALUES ('2224', '10705040', '柔性防水套管', '121', '10705', '金属构件', '个', 'DN50*600', '', '', '9', '董满仓', '2021-08-05 15:46:01', null);
INSERT INTO `dtoa_material` VALUES ('2225', '1010301012', '带孔止水钢板', '136', '1010301', '加工铁板', '块', '350*350*10', '', '', '9', '董满仓', '2021-08-06 09:39:41', null);
INSERT INTO `dtoa_material` VALUES ('2226', '1010301013', '带孔止水钢板', '136', '1010301', '加工铁板', '块', '650*650*10', '', '', '9', '董满仓', '2021-08-06 10:42:55', null);
INSERT INTO `dtoa_material` VALUES ('2227', '1010301014', '带孔止水钢板', '136', '1010301', '加工铁板', '块', '900*650*10', '', '', '9', '董满仓', '2021-08-06 10:43:22', null);
INSERT INTO `dtoa_material` VALUES ('2228', '1010301015', '带孔止水钢板', '136', '1010301', '加工铁板', '块', '200*200*10', '', '', '9', '董满仓', '2021-08-06 10:43:48', null);
INSERT INTO `dtoa_material` VALUES ('2229', '1010301016', '带孔止水钢板', '136', '1010301', '加工铁板', '块', '500*350*10', '', '', '9', '董满仓', '2021-08-06 10:44:07', null);
INSERT INTO `dtoa_material` VALUES ('2230', '1010301017', '带孔止水钢板', '136', '1010301', '加工铁板', '块', '650*500*10', '', '', '9', '董满仓', '2021-08-06 10:44:30', null);
INSERT INTO `dtoa_material` VALUES ('2231', '1010301018', '带孔止水钢板', '136', '1010301', '加工铁板', '块', '300*300*10', '', '', '9', '董满仓', '2021-08-06 10:44:47', null);
INSERT INTO `dtoa_material` VALUES ('2232', '1010301019', '带孔止水钢板', '136', '1010301', '加工铁板', '块', '350*200*10', '', '', '9', '董满仓', '2021-08-06 10:45:12', null);
INSERT INTO `dtoa_material` VALUES ('2233', '1010301020', '阴阳角镀锌止水钢板', '136', '1010301', '加工铁板', '米', '300*3', '', '', '9', '董满仓', '2021-08-06 10:45:37', null);
INSERT INTO `dtoa_material` VALUES ('2234', '10705041', '三翼环密闭套管', '121', '10705', '金属构件', '个', 'DN150*300', '', '', '9', '董满仓', '2021-08-06 10:46:53', '2021-08-06 10:49:42');
INSERT INTO `dtoa_material` VALUES ('2235', '10705042', '三翼环密闭套管', '121', '10705', '金属构件', '个', 'DN100*300', '', '', '9', '董满仓', '2021-08-06 10:49:43', null);
INSERT INTO `dtoa_material` VALUES ('2236', '10705043', '三翼环密闭套管', '121', '10705', '金属构件', '个', 'DN25*300', '', '', '9', '董满仓', '2021-08-06 10:50:12', null);
INSERT INTO `dtoa_material` VALUES ('2237', '10705044', '三翼环密闭套管', '121', '10705', '金属构件', '个', 'DN100*350', '', '', '9', '董满仓', '2021-08-06 10:50:41', null);
INSERT INTO `dtoa_material` VALUES ('2238', '10705045', '三翼环密闭套管', '121', '10705', '金属构件', '个', 'DN50*350', '', '', '9', '董满仓', '2021-08-06 10:51:08', null);
INSERT INTO `dtoa_material` VALUES ('2239', '10705046', '双管帽镀锌套管', '121', '10705', '金属构件', '个', 'DN15*400', '', '', '9', '董满仓', '2021-08-06 10:51:34', null);
INSERT INTO `dtoa_material` VALUES ('2240', '10705047', '双管帽镀锌套管', '121', '10705', '金属构件', '个', 'DN32*400', '', '', '9', '董满仓', '2021-08-06 10:52:43', null);
INSERT INTO `dtoa_material` VALUES ('2241', '10705048', '双管帽镀锌套管', '121', '10705', '金属构件', '个', 'DN50*400', '', '', '9', '董满仓', '2021-08-06 10:53:12', null);
INSERT INTO `dtoa_material` VALUES ('2242', '10705049', '三翼环密闭套管', '121', '10705', '金属构件', '个', 'DN460*300', '', '', '9', '董满仓', '2021-08-06 10:53:43', null);
INSERT INTO `dtoa_material` VALUES ('2243', '10705050', '三翼环密闭套管', '121', '10705', '金属构件', '个', 'DN360*300', '', '', '9', '董满仓', '2021-08-06 10:54:31', null);
INSERT INTO `dtoa_material` VALUES ('2244', '10705051', '三翼环密闭套管', '121', '10705', '金属构件', '个', 'DN250*300', '', '', '9', '董满仓', '2021-08-06 10:57:03', null);
INSERT INTO `dtoa_material` VALUES ('2245', '10705052', '一翼环密闭套管', '121', '10705', '金属构件', '个', 'DN600*300', '', '', '9', '董满仓', '2021-08-06 10:57:28', null);
INSERT INTO `dtoa_material` VALUES ('2246', '10705053', '二翼环密闭套管', '121', '10705', '金属构件', '个', 'DN600*300', '', '', '9', '董满仓', '2021-08-06 10:57:59', null);
INSERT INTO `dtoa_material` VALUES ('2247', '10705054', '三翼环密闭套管', '121', '10705', '金属构件', '个', 'DN600*300', '', '', '9', '董满仓', '2021-08-06 10:58:24', null);
INSERT INTO `dtoa_material` VALUES ('2248', '10705055', '一翼环密闭套管', '121', '10705', '金属构件', '个', 'DN250*400', '', '', '9', '董满仓', '2021-08-06 10:59:01', null);
INSERT INTO `dtoa_material` VALUES ('2249', '10705056', '柔性防水套管', '121', '10705', '金属构件', '个', 'DN15*600', '', '', '9', '董满仓', '2021-08-06 16:16:45', null);
INSERT INTO `dtoa_material` VALUES ('2250', '10601002', '平开木门', '148', '10601', '木门', '樘', '2100*1000', '', '', '9', '董满仓', '2021-08-06 16:31:13', null);
INSERT INTO `dtoa_material` VALUES ('2251', '10601003', '平开木门', '148', '10601', '木门', '樘', '2100*900', '', '', '9', '董满仓', '2021-08-06 16:36:00', null);
INSERT INTO `dtoa_material` VALUES ('2252', '10601004', '对开木门', '148', '10601', '木门', '樘', '2100*1500', '', '', '9', '董满仓', '2021-08-06 16:36:13', null);
INSERT INTO `dtoa_material` VALUES ('2253', '10603008', '木百叶窗', '160', '10603', '窗及制品', '个', '300*300', '', '', '9', '董满仓', '2021-08-06 16:38:12', null);
INSERT INTO `dtoa_material` VALUES ('2254', '11105070', 'PPR外丝直接', '107', '11105', 'PPR管材管件', '个', '50*1寸5', '', '', '9', '董满仓', '2021-08-11 14:25:15', null);
INSERT INTO `dtoa_material` VALUES ('2255', '11105071', 'PPR三通', '107', '11105', 'PPR管材管件', '个', '50*20', 'PPR', '', '9', '董满仓', '2021-08-11 14:28:31', null);
INSERT INTO `dtoa_material` VALUES ('2256', '11105072', 'PPR管箍', '107', '11105', 'PPR管材管件', '个', '50*20', 'PPR', '', '9', '董满仓', '2021-08-11 14:30:31', null);
INSERT INTO `dtoa_material` VALUES ('2257', '11105073', 'PPR热水管', '107', '11105', 'PPR管材管件', '米', '50', 'PPR', '', '9', '董满仓', '2021-08-16 10:27:08', null);
INSERT INTO `dtoa_material` VALUES ('2258', '1010401011', '四级螺纹', '95', '1010401', '螺纹', '吨', '25', 'HRB500', '', '9', '董满仓', '2021-08-16 11:09:49', null);
INSERT INTO `dtoa_material` VALUES ('2259', '11003119', '2-JAT-XF', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2021-08-19 15:59:27', null);
INSERT INTO `dtoa_material` VALUES ('2260', '11003120', '2-3AL-GG1', '105', '11003', '电箱', '台', '700*900*200', '', '', '9', '董满仓', '2021-08-19 16:14:26', null);
INSERT INTO `dtoa_material` VALUES ('2261', '11003121', '2-3AT-XF', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2021-08-19 16:15:05', null);
INSERT INTO `dtoa_material` VALUES ('2262', '11003122', '3-1AT-XF', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2021-08-19 16:15:59', null);
INSERT INTO `dtoa_material` VALUES ('2263', '11003123', '2-4ALZ', '105', '11003', '电箱', '台', '500*600*160', '', '', '9', '董满仓', '2021-08-19 16:16:26', null);
INSERT INTO `dtoa_material` VALUES ('2264', '113044', '移动硬盘', '88', '113', '办公用品', '块', '', '', '', '9', '董满仓', '2021-08-22 09:01:17', null);
INSERT INTO `dtoa_material` VALUES ('2265', '113045', 'A3纸', '88', '113', '办公用品', '箱', '', '', '', '9', '董满仓', '2021-08-22 09:04:44', null);
INSERT INTO `dtoa_material` VALUES ('2266', '113046', '彩色记号笔', '88', '113', '办公用品', '支', '', '', '', '9', '董满仓', '2021-08-22 09:05:21', null);
INSERT INTO `dtoa_material` VALUES ('2267', '113047', '便签纸', '88', '113', '办公用品', '包', '76*76', '', '', '9', '董满仓', '2021-08-22 09:05:48', null);
INSERT INTO `dtoa_material` VALUES ('2268', '113048', '皮面本', '88', '113', '办公用品', '本', '', '', '', '9', '董满仓', '2021-08-22 09:06:46', null);
INSERT INTO `dtoa_material` VALUES ('2269', '113049', '透明文件袋', '88', '113', '办公用品', '个', '', '', '', '9', '董满仓', '2021-08-22 09:46:32', null);
INSERT INTO `dtoa_material` VALUES ('2270', '113050', '印台', '88', '113', '办公用品', '个', '', '', '', '9', '董满仓', '2021-08-22 09:49:39', null);
INSERT INTO `dtoa_material` VALUES ('2271', '113051', '印油', '88', '113', '办公用品', '瓶', '', '', '', '9', '董满仓', '2021-08-22 09:50:03', null);
INSERT INTO `dtoa_material` VALUES ('2272', '10702038', '皮尺', '118', '10702', '五金工具', '把', '100M', '', '', '9', '董满仓', '2021-08-22 09:50:17', null);
INSERT INTO `dtoa_material` VALUES ('2273', '113052', '四档文件筐', '88', '113', '办公用品', '个', '', '', '', '9', '董满仓', '2021-08-22 09:51:03', null);
INSERT INTO `dtoa_material` VALUES ('2274', '112116', '磁吸排', '41', '112', '低值易耗品', '排', '', '', '', '9', '董满仓', '2021-08-22 09:51:56', null);
INSERT INTO `dtoa_material` VALUES ('2275', '112117', '粘钩', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-08-22 09:52:28', null);
INSERT INTO `dtoa_material` VALUES ('2276', '113053', '长尾夹', '88', '113', '办公用品', '盒', '50mm', '', '', '9', '董满仓', '2021-08-22 09:52:48', null);
INSERT INTO `dtoa_material` VALUES ('2277', '112118', '遮光窗帘', '41', '112', '低值易耗品', '套', '2㎡', '', '', '9', '董满仓', '2021-08-22 10:22:26', null);
INSERT INTO `dtoa_material` VALUES ('2278', '112119', '窗帘', '41', '112', '低值易耗品', '套', '2㎡', '', '', '9', '董满仓', '2021-08-22 10:23:41', null);
INSERT INTO `dtoa_material` VALUES ('2279', '113054', '拉杆文件夹', '88', '113', '办公用品', '个', '', '', '', '9', '董满仓', '2021-08-22 10:24:26', null);
INSERT INTO `dtoa_material` VALUES ('2280', '112120', '透明胶条', '41', '112', '低值易耗品', '卷', '', '', '', '9', '董满仓', '2021-08-22 10:25:16', null);
INSERT INTO `dtoa_material` VALUES ('2281', '112121', '打印彩图', '41', '112', '低值易耗品', '张', '', '', '', '9', '董满仓', '2021-08-22 10:26:05', null);
INSERT INTO `dtoa_material` VALUES ('2282', '112122', '刻章', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-08-22 10:26:47', null);
INSERT INTO `dtoa_material` VALUES ('2283', '30301030', '音箱', '156', '30301', '临建周转设备', '个', '', '', '', '9', '董满仓', '2021-08-22 10:26:59', null);
INSERT INTO `dtoa_material` VALUES ('2284', '30301031', '无线话筒', '156', '30301', '临建周转设备', '套', '', '', '', '9', '董满仓', '2021-08-22 10:29:11', null);
INSERT INTO `dtoa_material` VALUES ('2285', '30301032', '企业级功放机', '156', '30301', '临建周转设备', '套', '', '', '', '9', '董满仓', '2021-08-22 10:29:35', null);
INSERT INTO `dtoa_material` VALUES ('2286', '30301033', '机柜', '156', '30301', '临建周转设备', '台', '1000mm*600mm', '', '', '9', '董满仓', '2021-08-22 10:30:07', null);
INSERT INTO `dtoa_material` VALUES ('2287', '112123', '网线、音频线', '41', '112', '低值易耗品', '套', '', '', '', '9', '董满仓', '2021-08-22 10:33:14', null);
INSERT INTO `dtoa_material` VALUES ('2288', '112124', '电源线、线板', '41', '112', '低值易耗品', '套', '', '', '', '9', '董满仓', '2021-08-22 10:37:14', null);
INSERT INTO `dtoa_material` VALUES ('2289', '30301034', '千兆交换机', '156', '30301', '临建周转设备', '台', '', '', '', '9', '董满仓', '2021-08-22 10:37:30', null);
INSERT INTO `dtoa_material` VALUES ('2290', '112125', '网线布线', '41', '112', '低值易耗品', '套', '', '', '', '9', '董满仓', '2021-08-22 10:38:07', null);
INSERT INTO `dtoa_material` VALUES ('2291', '112126', 'HDMI线', '41', '112', '低值易耗品', '根', '3m', '', '', '9', '董满仓', '2021-08-22 10:38:54', null);
INSERT INTO `dtoa_material` VALUES ('2292', '112127', 'USB转接器', '41', '112', '低值易耗品', '个', '3.0', '', '', '9', '董满仓', '2021-08-22 10:39:47', null);
INSERT INTO `dtoa_material` VALUES ('2293', '112128', 'USB光驱', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-08-22 10:40:09', null);
INSERT INTO `dtoa_material` VALUES ('2294', '112129', '光驱', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-08-22 10:40:24', null);
INSERT INTO `dtoa_material` VALUES ('2295', '112130', '无线网卡', '41', '112', '低值易耗品', '块', '', '', '', '9', '董满仓', '2021-08-22 10:40:50', null);
INSERT INTO `dtoa_material` VALUES ('2296', '113055', '口取纸', '88', '113', '办公用品', '张', '', '', '', '9', '董满仓', '2021-08-22 10:41:21', null);
INSERT INTO `dtoa_material` VALUES ('2297', '112131', '彩色塑封', '41', '112', '低值易耗品', '张', '', '', '', '9', '董满仓', '2021-08-22 10:42:08', null);
INSERT INTO `dtoa_material` VALUES ('2298', '112132', '大图扫描', '41', '112', '低值易耗品', '张', '', '', '', '9', '董满仓', '2021-08-22 10:43:03', null);
INSERT INTO `dtoa_material` VALUES ('2299', '112133', '电脑主板', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-08-22 10:43:39', null);
INSERT INTO `dtoa_material` VALUES ('2300', '112134', '笔记本电脑包', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-08-22 10:44:17', null);
INSERT INTO `dtoa_material` VALUES ('2301', '30301035', '投影控制器', '156', '30301', '临建周转设备', '套', '', '', '', '9', '董满仓', '2021-08-22 10:44:45', null);
INSERT INTO `dtoa_material` VALUES ('2302', '30301036', '折叠椅', '156', '30301', '临建周转设备', '把', '', '', '', '9', '董满仓', '2021-08-24 09:30:17', null);
INSERT INTO `dtoa_material` VALUES ('2303', '30301037', '办公桌', '156', '30301', '临建周转设备', '张', '700*1400', '', '', '9', '董满仓', '2021-08-24 10:14:58', '2021-08-24 10:20:16');
INSERT INTO `dtoa_material` VALUES ('2304', '30301038', '皮面钢椅', '156', '30301', '临建周转设备', '把', '', '', '', '9', '董满仓', '2021-08-24 10:16:34', null);
INSERT INTO `dtoa_material` VALUES ('2305', '30301039', '电脑桌', '156', '30301', '临建周转设备', '张', '700*1400', '', '', '9', '董满仓', '2021-08-24 10:19:45', null);
INSERT INTO `dtoa_material` VALUES ('2306', '30301040', '五节文件柜', '156', '30301', '临建周转设备', '组', '800*2000', '', '', '9', '董满仓', '2021-08-24 10:20:17', null);
INSERT INTO `dtoa_material` VALUES ('2307', '30301041', '皮沙发', '156', '30301', '临建周转设备', '套', '一大两小', '', '', '9', '董满仓', '2021-08-24 10:23:30', null);
INSERT INTO `dtoa_material` VALUES ('2308', '30301042', '茶几', '156', '30301', '临建周转设备', '张', '1200*450', '', '', '9', '董满仓', '2021-08-24 10:24:13', null);
INSERT INTO `dtoa_material` VALUES ('2309', '30301043', '茶几', '156', '30301', '临建周转设备', '张', '800*400', '', '', '9', '董满仓', '2021-08-24 10:24:39', null);
INSERT INTO `dtoa_material` VALUES ('2310', '30301044', '老板桌', '156', '30301', '临建周转设备', '张', '1200*2000', '', '', '9', '董满仓', '2021-08-24 10:24:54', null);
INSERT INTO `dtoa_material` VALUES ('2311', '30301045', '会议桌', '156', '30301', '临建周转设备', '㎡', '', '', '', '9', '董满仓', '2021-08-24 10:25:39', '2021-08-24 10:36:48');
INSERT INTO `dtoa_material` VALUES ('2312', '30301046', '铁皮文件柜', '156', '30301', '临建周转设备', '个', '850*1800', '', '', '9', '董满仓', '2021-08-24 10:25:59', null);
INSERT INTO `dtoa_material` VALUES ('2313', '30301047', '复印机', '156', '30301', '临建周转设备', '台', '东芝2323', '', '', '9', '董满仓', '2021-08-24 10:36:48', null);
INSERT INTO `dtoa_material` VALUES ('2314', '30301048', '复印机工作台', '156', '30301', '临建周转设备', '个', '', '', '', '9', '董满仓', '2021-08-24 10:38:21', null);
INSERT INTO `dtoa_material` VALUES ('2316', '30301049', '笔记本电脑', '156', '30301', '临建周转设备', '台', '', '', '', '9', '董满仓', '2021-08-24 10:42:30', null);
INSERT INTO `dtoa_material` VALUES ('2317', '30301050', '打印机', '156', '30301', '临建周转设备', '台', '', '', '', '9', '董满仓', '2021-08-24 10:43:31', null);
INSERT INTO `dtoa_material` VALUES ('2318', '30301051', '保鲜柜', '156', '30301', '临建周转设备', '台', '', '', '', '9', '董满仓', '2021-08-24 10:43:42', '2021-08-24 10:47:08');
INSERT INTO `dtoa_material` VALUES ('2319', '30301052', '冷藏柜', '156', '30301', '临建周转设备', '台', '', '', '', '9', '董满仓', '2021-08-24 10:44:45', null);
INSERT INTO `dtoa_material` VALUES ('2322', '112135', '鼠标', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-08-24 10:47:55', null);
INSERT INTO `dtoa_material` VALUES ('2323', '30301053', '会议长桌', '156', '30301', '临建周转设备', '张', '1000*2000', '', '', '9', '董满仓', '2021-08-24 16:24:48', null);
INSERT INTO `dtoa_material` VALUES ('2324', '30301054', '简易桌', '156', '30301', '临建周转设备', '张', '1200*350', '', '', '9', '董满仓', '2021-08-24 16:26:21', null);
INSERT INTO `dtoa_material` VALUES ('2325', '1010401012', '四级螺纹', '95', '1010401', '螺纹', '吨', '12', 'HRB500', '', '9', '董满仓', '2021-08-25 14:15:25', null);
INSERT INTO `dtoa_material` VALUES ('2326', '1010401013', '四级螺纹', '95', '1010401', '螺纹', '吨', '14', 'HRB500', '', '9', '董满仓', '2021-08-25 14:16:32', null);
INSERT INTO `dtoa_material` VALUES ('2327', '1010401014', '四级螺纹', '95', '1010401', '螺纹', '吨', '16', 'HRB500', '', '9', '董满仓', '2021-08-25 14:17:00', null);
INSERT INTO `dtoa_material` VALUES ('2328', '1010401014', '四级螺纹', '95', '1010401', '螺纹', '吨', '18', 'HRB500', '', '9', '董满仓', '2021-08-25 14:17:00', '2021-08-25 14:17:49');
INSERT INTO `dtoa_material` VALUES ('2329', '1010401015', '四级螺纹', '95', '1010401', '螺纹', '吨', '20', 'HRB500', '', '9', '董满仓', '2021-08-25 14:17:50', null);
INSERT INTO `dtoa_material` VALUES ('2330', '1010401016', '四级螺纹', '95', '1010401', '螺纹', '吨', '22', 'HRB500', '', '9', '董满仓', '2021-08-25 14:18:14', null);
INSERT INTO `dtoa_material` VALUES ('2331', '404005', '不锈钢栏杆', '144', '404', '扶手栏杆', '米', '1500', '', '', '9', '董满仓', '2021-08-27 10:51:32', null);
INSERT INTO `dtoa_material` VALUES ('2332', '404006', '不锈钢栏杆', '144', '404', '扶手栏杆', '米', '1400', '', '', '9', '董满仓', '2021-08-27 10:52:54', null);
INSERT INTO `dtoa_material` VALUES ('2333', '404007', '不锈钢栏杆', '144', '404', '扶手栏杆', '米', '900', '', '', '9', '董满仓', '2021-08-27 10:53:23', null);
INSERT INTO `dtoa_material` VALUES ('2334', '404007', '不锈钢栏杆', '144', '404', '扶手栏杆', '米', '1200', '', '', '9', '董满仓', '2021-08-27 10:53:23', '2021-08-27 10:55:09');
INSERT INTO `dtoa_material` VALUES ('2335', '1010102012', '焊管', '53', '1010102', '焊接钢管', '米', '200', '', '', '1', '管理员', '2021-09-03 16:30:30', null);
INSERT INTO `dtoa_material` VALUES ('2336', '1010203004', '扁钢', '58', '1010203', '扁钢', '米', '25', '', '', '1', '管理员', '2021-09-03 16:31:00', null);
INSERT INTO `dtoa_material` VALUES ('2337', '30301055', '镀锌板大门', '156', '30301', '临建周转设备', '㎡', '3000*4000', '', '', '1', '管理员', '2021-09-06 09:01:02', null);
INSERT INTO `dtoa_material` VALUES ('2338', '30301056', '镀锌围挡', '156', '30301', '临建周转设备', '㎡', '2500*5000', '', '', '1', '管理员', '2021-09-06 09:04:13', null);
INSERT INTO `dtoa_material` VALUES ('2339', '30301057', '宝丽布围挡', '156', '30301', '临建周转设备', '㎡', '3000*5000', '', '', '1', '管理员', '2021-09-06 09:05:12', null);
INSERT INTO `dtoa_material` VALUES ('2340', '30202052', '假草坪', '47', '30202', '文明施工', '㎡', '300*4000', '', '', '1', '管理员', '2021-09-06 09:07:25', null);
INSERT INTO `dtoa_material` VALUES ('2341', '112136', '防滑垫', '41', '112', '低值易耗品', '米', '300*900', '', '', '1', '管理员', '2021-09-06 09:09:06', null);
INSERT INTO `dtoa_material` VALUES ('2342', '30301058', '铁护栏', '156', '30301', '临建周转设备', '米', '1500*2000', '', '', '1', '管理员', '2021-09-06 09:10:45', null);
INSERT INTO `dtoa_material` VALUES ('2343', '30202053', 'PVC门牌', '47', '30202', '文明施工', '块', '300*150', '', '', '1', '管理员', '2021-09-06 09:11:36', null);
INSERT INTO `dtoa_material` VALUES ('2344', '30202054', 'PVC标识牌', '47', '30202', '文明施工', '块', '300*150', '', '', '1', '管理员', '2021-09-06 09:13:00', null);
INSERT INTO `dtoa_material` VALUES ('2345', '30202055', 'PVC材料牌', '47', '30202', '文明施工', '块', '300*400', '', '', '1', '管理员', '2021-09-06 09:13:50', null);
INSERT INTO `dtoa_material` VALUES ('2346', '30202056', 'PVC标识牌', '47', '30202', '文明施工', '块', '350*120', '', '', '1', '管理员', '2021-09-06 09:14:36', null);
INSERT INTO `dtoa_material` VALUES ('2347', '30202057', 'PVC标识牌', '47', '30202', '文明施工', '块', '400*600', '', '', '1', '管理员', '2021-09-06 09:15:11', null);
INSERT INTO `dtoa_material` VALUES ('2348', '30202058', 'PVC标识牌', '47', '30202', '文明施工', '块', '500*700', '', '', '1', '管理员', '2021-09-06 09:15:30', null);
INSERT INTO `dtoa_material` VALUES ('2349', '30202059', 'PVC标识牌', '47', '30202', '文明施工', '块', '600*900', '', '', '1', '管理员', '2021-09-06 09:15:54', null);
INSERT INTO `dtoa_material` VALUES ('2350', '30202060', 'PVC标识牌', '47', '30202', '文明施工', '块', '700*1100', '', '', '1', '管理员', '2021-09-06 09:17:11', null);
INSERT INTO `dtoa_material` VALUES ('2351', '30202061', 'PVC标识牌', '47', '30202', '文明施工', '块', '420*300', '', '', '1', '管理员', '2021-09-06 09:17:36', null);
INSERT INTO `dtoa_material` VALUES ('2352', '30202062', 'PVC合格牌', '47', '30202', '文明施工', '块', '420*300', '', '', '1', '管理员', '2021-09-06 09:17:58', null);
INSERT INTO `dtoa_material` VALUES ('2353', '30202063', 'PVC公示牌', '47', '30202', '文明施工', '块', '210*300', '', '', '1', '管理员', '2021-09-06 09:18:42', null);
INSERT INTO `dtoa_material` VALUES ('2354', '30202064', 'PVC标识牌', '47', '30202', '文明施工', '块', '5900*8400', '', '', '1', '管理员', '2021-09-06 09:19:01', null);
INSERT INTO `dtoa_material` VALUES ('2355', '30202065', 'PVC标识牌', '47', '30202', '文明施工', '块', '420*300', '', '', '1', '管理员', '2021-09-06 09:19:27', null);
INSERT INTO `dtoa_material` VALUES ('2356', '30202066', 'PVC形象墙', '47', '30202', '文明施工', '块', '2500*1200', '', '', '1', '管理员', '2021-09-06 09:37:43', null);
INSERT INTO `dtoa_material` VALUES ('2358', '30202067', '金属门牌', '47', '30202', '文明施工', '块', '300*100', '', '', '1', '管理员', '2021-09-06 09:42:02', null);
INSERT INTO `dtoa_material` VALUES ('2359', '30202068', '金属门牌', '47', '30202', '文明施工', '块', '300*150', '', '', '1', '管理员', '2021-09-06 09:42:41', null);
INSERT INTO `dtoa_material` VALUES ('2360', '30202069', '金属标识牌', '47', '30202', '文明施工', '块', '400*500', '', '', '1', '管理员', '2021-09-06 09:42:57', null);
INSERT INTO `dtoa_material` VALUES ('2361', '30202070', '不锈钢告示牌', '47', '30202', '文明施工', '块', '600*900', '', '', '1', '管理员', '2021-09-06 09:43:27', null);
INSERT INTO `dtoa_material` VALUES ('2362', '30202071', '不锈钢公告牌', '47', '30202', '文明施工', '块', '1800*1200', '', '', '1', '管理员', '2021-09-06 09:43:45', null);
INSERT INTO `dtoa_material` VALUES ('2363', '30202072', '不锈钢公告牌', '47', '30202', '文明施工', '块', '2000*1300', '', '', '1', '管理员', '2021-09-06 09:44:43', null);
INSERT INTO `dtoa_material` VALUES ('2364', '30202073', '不锈钢公示牌', '47', '30202', '文明施工', '套', '2800*900', '', '', '1', '管理员', '2021-09-06 09:45:10', null);
INSERT INTO `dtoa_material` VALUES ('2365', '30202074', '不锈钢架子', '47', '30202', '文明施工', '个', '900*1200', '', '', '1', '管理员', '2021-09-06 09:45:48', null);
INSERT INTO `dtoa_material` VALUES ('2366', '30202075', '不锈钢架子', '47', '30202', '文明施工', '个', '800*600*1100', '', '', '1', '管理员', '2021-09-06 09:46:17', null);
INSERT INTO `dtoa_material` VALUES ('2367', '30202076', 'KT标识牌', '47', '30202', '文明施工', '块', '210*297', '', '', '1', '管理员', '2021-09-06 09:46:55', null);
INSERT INTO `dtoa_material` VALUES ('2369', '30202077', 'KT制度板', '47', '30202', '文明施工', '块', '500*800', '', '', '1', '管理员', '2021-09-06 09:50:18', null);
INSERT INTO `dtoa_material` VALUES ('2370', '30202078', 'KT展板', '47', '30202', '文明施工', '块', '500*800', '', '', '1', '管理员', '2021-09-06 09:54:52', null);
INSERT INTO `dtoa_material` VALUES ('2371', '30202079', 'KT展板', '47', '30202', '文明施工', '块', '600*900', '', '', '1', '管理员', '2021-09-06 09:55:14', null);
INSERT INTO `dtoa_material` VALUES ('2372', '30202080', 'KT展板', '47', '30202', '文明施工', '块', '900*1200', '', '', '1', '管理员', '2021-09-06 09:55:57', null);
INSERT INTO `dtoa_material` VALUES ('2373', '30202081', '铝塑展板', '47', '30202', '文明施工', '块', '300*400', '', '', '1', '管理员', '2021-09-06 09:56:29', null);
INSERT INTO `dtoa_material` VALUES ('2374', '30202082', '铝塑展板', '47', '30202', '文明施工', '块', '500*800', '', '', '1', '管理员', '2021-09-06 09:56:47', null);
INSERT INTO `dtoa_material` VALUES ('2376', '30202083', '铝塑展板', '47', '30202', '文明施工', '块', '800*600', '', '', '1', '管理员', '2021-09-06 09:57:27', null);
INSERT INTO `dtoa_material` VALUES ('2377', '30202084', '铝塑展板', '47', '30202', '文明施工', '块', '600*800', '', '', '1', '管理员', '2021-09-06 09:57:47', null);
INSERT INTO `dtoa_material` VALUES ('2378', '30202085', '铝塑展板', '47', '30202', '文明施工', '块', '420*300', '', '', '1', '管理员', '2021-09-06 09:58:11', null);
INSERT INTO `dtoa_material` VALUES ('2379', '30202086', '铝塑展板', '47', '30202', '文明施工', '块', '210*300', '', '', '1', '管理员', '2021-09-06 09:58:28', null);
INSERT INTO `dtoa_material` VALUES ('2380', '30202087', '铝塑合格牌', '47', '30202', '文明施工', '块', '420*300', '', '', '1', '管理员', '2021-09-06 09:58:48', null);
INSERT INTO `dtoa_material` VALUES ('2381', '30202088', '防水贴纸', '47', '30202', '文明施工', '张', '300*150', '', '', '1', '管理员', '2021-09-06 09:59:21', null);
INSERT INTO `dtoa_material` VALUES ('2382', '30301059', '防水LED显示屏', '156', '30301', '临建周转设备', '块', '3500*400', '', '', '1', '管理员', '2021-09-06 10:00:15', null);
INSERT INTO `dtoa_material` VALUES ('2383', '30301060', '防水LED显示屏', '156', '30301', '临建周转设备', '块', '2000*400', '', '', '1', '管理员', '2021-09-06 10:18:45', null);
INSERT INTO `dtoa_material` VALUES ('2384', '30202089', '贴纸', '47', '30202', '文明施工', '张', '500*150', '', '', '1', '管理员', '2021-09-06 10:19:04', null);
INSERT INTO `dtoa_material` VALUES ('2385', '30202090', '广告布', '47', '30202', '文明施工', '㎡', '3500*600', '', '', '1', '管理员', '2021-09-06 10:19:26', null);
INSERT INTO `dtoa_material` VALUES ('2386', '30301061', '宣讲台架子', '156', '30301', '临建周转设备', '个', '6000*2400*300', '', '', '1', '管理员', '2021-09-06 10:19:51', null);
INSERT INTO `dtoa_material` VALUES ('2387', '30301062', '镀锌架子宣传图', '156', '30301', '临建周转设备', '块', '5600*2600', '', '', '1', '管理员', '2021-09-06 10:20:28', null);
INSERT INTO `dtoa_material` VALUES ('2388', '30301063', '镀锌楼梯护栏', '156', '30301', '临建周转设备', '块', '24200*1150', '', '', '1', '管理员', '2021-09-06 10:47:02', null);
INSERT INTO `dtoa_material` VALUES ('2389', '30301064', '镀锌楼梯护栏', '156', '30301', '临建周转设备', '块', '1100*1080', '', '', '1', '管理员', '2021-09-06 10:48:28', null);
INSERT INTO `dtoa_material` VALUES ('2390', '30301065', '镀锌楼梯护栏', '156', '30301', '临建周转设备', '块', '1140*1100', '', '', '1', '管理员', '2021-09-06 10:49:07', null);
INSERT INTO `dtoa_material` VALUES ('2391', '30301066', '镀锌楼梯护栏', '156', '30301', '临建周转设备', '块', '2300*1080', '', '', '1', '管理员', '2021-09-06 10:49:39', null);
INSERT INTO `dtoa_material` VALUES ('2392', '30301067', '镀锌楼梯护栏', '156', '30301', '临建周转设备', '块', '2300*1200', '', '', '1', '管理员', '2021-09-06 10:50:19', null);
INSERT INTO `dtoa_material` VALUES ('2393', '30301068', '镀锌楼梯护栏', '156', '30301', '临建周转设备', '块', '2400*1050', '', '', '1', '管理员', '2021-09-06 10:50:54', null);
INSERT INTO `dtoa_material` VALUES ('2394', '30202091', '一米线标贴', '47', '30202', '文明施工', '条', '1000*100', '', '', '1', '管理员', '2021-09-06 10:51:11', '2021-09-06 10:52:13');
INSERT INTO `dtoa_material` VALUES ('2395', '30301069', '铝合金支架', '156', '30301', '临建周转设备', '个', '1100*1300', '', '', '1', '管理员', '2021-09-06 10:52:13', null);
INSERT INTO `dtoa_material` VALUES ('2396', '30301070', '铝合金支架', '156', '30301', '临建周转设备', '个', '300*1100', '', '', '1', '管理员', '2021-09-06 10:52:36', null);
INSERT INTO `dtoa_material` VALUES ('2397', '30301071', '铝合金支架', '156', '30301', '临建周转设备', '个', '300*1200', '', '', '1', '管理员', '2021-09-06 10:52:52', null);
INSERT INTO `dtoa_material` VALUES ('2398', '30301072', '宣讲台围挡', '156', '30301', '临建周转设备', '个', '16400*3000', '', '', '1', '管理员', '2021-09-06 10:54:05', null);
INSERT INTO `dtoa_material` VALUES ('2399', '10705057', '止水螺栓', '121', '10705', '金属构件', '根', 'M14*1000', '', '', '1', '管理员', '2021-09-06 10:58:37', null);
INSERT INTO `dtoa_material` VALUES ('2400', '10501013', '腰线', '125', '10501', '瓷砖', '片', '300*600', '', '', '1', '管理员', '2021-09-09 10:05:27', null);
INSERT INTO `dtoa_material` VALUES ('2401', '11102087', 'PVC球阀', '93', '11102', '控水主材', '个', '25', '', '', '1', '管理员', '2021-09-09 15:08:34', null);
INSERT INTO `dtoa_material` VALUES ('2402', '11102088', 'PVC球阀', '93', '11102', '控水主材', '个', '20', '', '', '1', '管理员', '2021-09-09 15:09:39', null);
INSERT INTO `dtoa_material` VALUES ('2403', '30202092', '移动厕所', '47', '30202', '文明施工', '套', '1150*1150*2300', '', '', '1', '管理员', '2021-09-09 15:09:52', null);
INSERT INTO `dtoa_material` VALUES ('2404', '30202093', '塑料水罐', '47', '30202', '文明施工', '个', '1200*700', '', '', '1', '管理员', '2021-09-09 15:50:20', null);
INSERT INTO `dtoa_material` VALUES ('2405', '10704008', '套丝机滚丝轮', '120', '10704', '五金设备配件', '套', '16-22', '', '', '1', '管理员', '2021-09-09 15:51:08', null);
INSERT INTO `dtoa_material` VALUES ('2406', '10704009', '套丝机滚丝轮', '120', '10704', '五金设备配件', '套', '25', '', '', '1', '管理员', '2021-09-09 15:53:02', null);
INSERT INTO `dtoa_material` VALUES ('2407', '10701170', '直螺纹套筒', '90', '10701', '五金材料', '个', '22变20', '', '', '1', '管理员', '2021-09-09 15:53:15', null);
INSERT INTO `dtoa_material` VALUES ('2408', '10901012', '铝箔通风管', '123', '10901', '橡塑制品', '根', '100*2m', '', '', '1', '管理员', '2021-09-14 14:19:17', '2021-10-22 08:21:42');
INSERT INTO `dtoa_material` VALUES ('2409', '10901013', '铝箔通风管', '123', '10901', '橡塑制品', '根', '75*2m', '', '', '1', '管理员', '2021-09-14 14:33:33', '2021-10-22 08:21:42');
INSERT INTO `dtoa_material` VALUES ('2410', '11109059', '不锈钢喉箍', '122', '11109', '水暖辅材', '个', '75', '', '', '1', '管理员', '2021-09-14 14:33:54', null);
INSERT INTO `dtoa_material` VALUES ('2411', '11109060', '不锈钢喉箍', '122', '11109', '水暖辅材', '个', '110', '', '', '1', '管理员', '2021-09-14 14:34:28', null);
INSERT INTO `dtoa_material` VALUES ('2412', '11002094', '线盒修复器', '91', '11002', '电气辅材', '个', '', '', '', '1', '管理员', '2021-09-14 14:34:41', null);
INSERT INTO `dtoa_material` VALUES ('2413', '11101100', '镀锌速联管箍', '92', '11101', '镀锌管件', '个', 'DN25', '', '', '1', '管理员', '2021-09-14 14:35:33', null);
INSERT INTO `dtoa_material` VALUES ('2414', '112137', '棉丝', '41', '112', '低值易耗品', 'KG', '', '', '', '1', '管理员', '2021-09-14 14:38:18', null);
INSERT INTO `dtoa_material` VALUES ('2415', '11105074', 'PPR热水管', '107', '11105', 'PPR管材管件', '米', '40', 'PPR', '', '1', '管理员', '2021-09-14 14:59:41', null);
INSERT INTO `dtoa_material` VALUES ('2417', '11001059', 'JDG弯头', '59', '11001', '管线敷设', '个', 'Φ20', '', '', '1', '管理员', '2021-09-14 15:50:05', null);
INSERT INTO `dtoa_material` VALUES ('2418', '11001060', 'JDG弯头', '59', '11001', '管线敷设', '个', 'Φ25', '', '', '1', '管理员', '2021-09-14 15:51:00', null);
INSERT INTO `dtoa_material` VALUES ('2419', '11007087', 'RVV护套线', '114', '11007', '电线电缆', '米', '2*2.5mm²', '', '', '1', '管理员', '2021-09-15 10:15:58', null);
INSERT INTO `dtoa_material` VALUES ('2420', '11105075', 'PPR内丝三通', '107', '11105', 'PPR管材管件', '个', '40*3/4', 'PPR', '', '1', '管理员', '2021-09-15 10:28:40', null);
INSERT INTO `dtoa_material` VALUES ('2421', '11105076', 'PPR内丝弯头', '107', '11105', 'PPR管材管件', '个', '40*3/4', 'PPR', '', '1', '管理员', '2021-09-15 14:07:22', null);
INSERT INTO `dtoa_material` VALUES ('2422', '11105077', 'PPR外丝直接', '107', '11105', 'PPR管材管件', '个', '40*1\"1/2', 'PPR', '', '1', '管理员', '2021-09-15 14:07:56', '2021-09-15 14:10:31');
INSERT INTO `dtoa_material` VALUES ('2423', '30201022', '消防水带', '46', '30201', '安全设备', '盘', '80mm*20m', '', '', '1', '管理员', '2021-09-15 14:10:32', null);
INSERT INTO `dtoa_material` VALUES ('2424', '30102015', '清洗机', '146', '30102', '机械设备', '台', '熊猫PX-58', '', '', '1', '管理员', '2021-09-15 14:11:33', null);
INSERT INTO `dtoa_material` VALUES ('2425', '10701171', '钢丝绳套', '90', '10701', '五金材料', '根', 'Φ20*4m', '', '', '1', '管理员', '2021-09-15 14:16:56', null);
INSERT INTO `dtoa_material` VALUES ('2426', '10701172', '钢丝绳套', '90', '10701', '五金材料', '根', 'Φ16*6m', '', '', '1', '管理员', '2021-09-15 14:29:30', null);
INSERT INTO `dtoa_material` VALUES ('2428', '10701173', '卸扣', '90', '10701', '五金材料', '个', '10T', '', '', '1', '管理员', '2021-09-15 14:42:05', null);
INSERT INTO `dtoa_material` VALUES ('2429', '10701174', '卸扣', '90', '10701', '五金材料', '个', '5T', '', '', '1', '管理员', '2021-09-15 15:34:10', null);
INSERT INTO `dtoa_material` VALUES ('2430', '10802021', '聚乙烯四氟板', '117', '10802', '化工产品', '块', '1350*280*5', '', '', '1', '管理员', '2021-09-15 15:34:27', null);
INSERT INTO `dtoa_material` VALUES ('2431', '112138', '创可贴', '41', '112', '低值易耗品', '个', '', '', '', '1', '管理员', '2021-09-15 15:36:42', null);
INSERT INTO `dtoa_material` VALUES ('2432', '112139', '医用胶带', '41', '112', '低值易耗品', '盘', '', '', '', '1', '管理员', '2021-09-15 15:37:24', null);
INSERT INTO `dtoa_material` VALUES ('2433', '112140', '消毒纸巾', '41', '112', '低值易耗品', '包', '', '', '', '1', '管理员', '2021-09-15 15:37:37', null);
INSERT INTO `dtoa_material` VALUES ('2434', '30301073', '电炒锅', '156', '30301', '临建周转设备', '个', '', '', '', '1', '管理员', '2021-09-15 15:37:57', null);
INSERT INTO `dtoa_material` VALUES ('2435', '11101101', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN65*20', '热镀锌', '', '1', '管理员', '2021-09-15 15:41:08', null);
INSERT INTO `dtoa_material` VALUES ('2436', '10701175', '钢丝绳套', '90', '10701', '五金材料', '根', 'Φ20*6m', '', '', '1', '管理员', '2021-09-15 15:48:12', null);
INSERT INTO `dtoa_material` VALUES ('2437', '10701176', '钢丝绳套', '90', '10701', '五金材料', '根', 'Φ13*6m', '', '', '1', '管理员', '2021-09-15 15:51:42', null);
INSERT INTO `dtoa_material` VALUES ('2438', '11008049', '风扇调速开关', '115', '11008', '电气设备安装材料', '个', '', '', '', '1', '管理员', '2021-09-22 09:55:25', null);
INSERT INTO `dtoa_material` VALUES ('2439', '11004056', '镀锌线槽桥架', '110', '11004', '线槽桥架', '米', '50*50*1.2', '', '', '1', '管理员', '2021-09-22 09:55:53', null);
INSERT INTO `dtoa_material` VALUES ('2440', '11109061', '不锈钢喉箍', '122', '11109', '水暖辅材', '个', '20', '', '', '1', '管理员', '2021-09-22 15:19:34', null);
INSERT INTO `dtoa_material` VALUES ('2441', '406001', '瓷砖防静电地板', '168', '406', '地板', '㎡', '', '', '', '1', '管理员', '2021-10-22 08:17:56', null);
INSERT INTO `dtoa_material` VALUES ('2442', '10901014', '橡胶止水带', '123', '10901', '橡塑制品', '米', '300*10', '', '', '1', '管理员', '2021-10-22 08:21:42', null);
INSERT INTO `dtoa_material` VALUES ('2443', '11001061', 'PVC八角盒', '59', '11001', '管线敷设', '个', '86H70-4分孔', '', '', '1', '管理员', '2021-10-22 08:22:19', '2021-10-22 08:24:24');
INSERT INTO `dtoa_material` VALUES ('2444', '11001062', 'PVC穿筋方盒', '59', '11001', '管线敷设', '个', '86H80-4分孔', '', '', '1', '管理员', '2021-10-22 08:24:24', null);
INSERT INTO `dtoa_material` VALUES ('2445', '11001063', 'PVC穿筋方盒', '59', '11001', '管线敷设', '个', '86H80-6分孔', '', '', '1', '管理员', '2021-10-22 08:25:47', null);
INSERT INTO `dtoa_material` VALUES ('2446', '11006019', 'PVC盒接', '113', '11006', 'PVC线管材件', '个', 'Φ25', '', '', '1', '管理员', '2021-10-22 08:26:10', null);
INSERT INTO `dtoa_material` VALUES ('2447', '10701177', '直螺纹套筒', '90', '10701', '五金材料', '个', '20变18', '', '', '1', '管理员', '2021-10-22 08:27:31', null);
INSERT INTO `dtoa_material` VALUES ('2448', '10701178', '直螺纹套筒', '90', '10701', '五金材料', '个', '25变22', '', '', '1', '管理员', '2021-10-22 08:28:29', null);
INSERT INTO `dtoa_material` VALUES ('2449', '10701179', '直螺纹套筒', '90', '10701', '五金材料', '个', '20变16', '', '', '1', '管理员', '2021-10-22 08:29:33', null);
INSERT INTO `dtoa_material` VALUES ('2450', '11110088', 'PVC线槽', '129', '11110', 'PVC管材管件', '米', '100*60', '', '', '1', '管理员', '2021-10-22 08:33:32', null);
INSERT INTO `dtoa_material` VALUES ('2451', '30202094', '爬架网', '47', '30202', '文明施工', '㎡', '1.2m*1.8m', '', '', '1', '管理员', '2021-10-22 08:35:02', null);
INSERT INTO `dtoa_material` VALUES ('2452', '30202095', '爬架网配件', '47', '30202', '文明施工', '个', '', '', '', '1', '管理员', '2021-10-22 08:40:25', null);
INSERT INTO `dtoa_material` VALUES ('2453', '11001064', 'PVC穿筋方盒', '59', '11001', '管线敷设', '个', '86H70-25孔', '', '', '1', '管理员', '2021-10-22 08:40:41', null);
INSERT INTO `dtoa_material` VALUES ('2454', '10901015', '橡胶O型圈', '123', '10901', '橡塑制品', '个', 'Φ50', '', '', '1', '管理员', '2021-10-22 09:14:25', null);
INSERT INTO `dtoa_material` VALUES ('2455', '10901016', '橡胶O型圈', '123', '10901', '橡塑制品', '个', 'Φ40', '', '', '1', '管理员', '2021-10-22 09:19:28', null);
INSERT INTO `dtoa_material` VALUES ('2456', '207006', '冬施混凝土', '66', '207', '冬施混凝土', 'm³', 'C35', '', '', '9', '董满仓', '2021-10-29 08:51:12', null);
INSERT INTO `dtoa_material` VALUES ('2457', '207007', '冬施混凝土', '66', '207', '冬施混凝土', 'm³', 'C40', '', '', '9', '董满仓', '2021-10-29 08:52:04', null);
INSERT INTO `dtoa_material` VALUES ('2458', '207008', '冬施混凝土', '66', '207', '冬施混凝土', 'm³', 'C45', '', '', '9', '董满仓', '2021-10-29 08:52:31', null);
INSERT INTO `dtoa_material` VALUES ('2459', '50107003', '汽车混凝土泵', '140', '50107', '汽车泵', 'm³', '56米臂', '', '', '9', '董满仓', '2021-10-29 09:05:37', null);
INSERT INTO `dtoa_material` VALUES ('2460', '50107004', '汽车混凝土泵', '140', '50107', '汽车泵', 'm³', '62米臂', '', '', '9', '董满仓', '2021-10-29 09:07:48', null);
INSERT INTO `dtoa_material` VALUES ('2461', '50107005', '汽车混凝土泵', '140', '50107', '汽车泵', '班', '56米臂', '', '', '9', '董满仓', '2021-10-29 09:08:09', null);
INSERT INTO `dtoa_material` VALUES ('2462', '50107006', '汽车混凝土泵', '140', '50107', '汽车泵', '班', '62米臂', '', '', '9', '董满仓', '2021-10-29 09:08:23', null);
INSERT INTO `dtoa_material` VALUES ('2464', '11003124', '防爆风机箱', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2021-10-29 09:08:51', null);
INSERT INTO `dtoa_material` VALUES ('2465', '11003125', '明装箱', '105', '11003', '电箱', '台', '750*600*230', '', '', '9', '董满仓', '2021-10-29 09:11:55', null);
INSERT INTO `dtoa_material` VALUES ('2466', '11003126', '防爆配电箱', '105', '11003', '电箱', '台', '600*600*180', '', '', '9', '董满仓', '2021-10-29 09:14:03', null);
INSERT INTO `dtoa_material` VALUES ('2467', '10704010', '套丝机刀架', '120', '10704', '五金设备配件', '套', '', '', '', '9', '董满仓', '2021-10-29 10:05:23', null);
INSERT INTO `dtoa_material` VALUES ('2468', '10701180', '半边扣件', '90', '10701', '五金材料', '个', '', '', '', '9', '董满仓', '2021-10-29 10:24:39', null);
INSERT INTO `dtoa_material` VALUES ('2469', '10703028', '镀锌焊接弯头', '119', '10703', '焊接冲压管件', '个', 'Φ114', '', '', '9', '董满仓', '2021-10-29 10:33:31', null);
INSERT INTO `dtoa_material` VALUES ('2470', '103004', '膨胀水泥', '4', '103', '水泥', '袋', '50kg', '', '', '9', '董满仓', '2021-10-29 10:34:17', null);
INSERT INTO `dtoa_material` VALUES ('2471', '10702039', '镰刀', '118', '10702', '五金工具', '把', '', '', '', '9', '董满仓', '2021-10-29 10:35:24', null);
INSERT INTO `dtoa_material` VALUES ('2472', '11003127', '温控箱', '105', '11003', '电箱', '台', '220v', '', '', '9', '董满仓', '2021-10-29 10:35:54', null);
INSERT INTO `dtoa_material` VALUES ('2473', '10802022', '橡塑海绵胶', '117', '10802', '化工产品', '桶', '15kg', '', '', '9', '董满仓', '2021-10-29 10:36:37', null);
INSERT INTO `dtoa_material` VALUES ('2474', '10701181', '电加热棒', '90', '10701', '五金材料', '根', '10KW', '', '', '9', '董满仓', '2021-10-29 10:37:42', null);
INSERT INTO `dtoa_material` VALUES ('2475', '11003128', '温控箱', '105', '11003', '电箱', '台', '380v', '', '', '9', '董满仓', '2021-10-29 10:38:49', null);
INSERT INTO `dtoa_material` VALUES ('2476', '11002095', '尼龙绑扎带', '91', '11002', '电气辅材', '包', '10*650', '', '', '9', '董满仓', '2021-10-29 10:39:11', null);
INSERT INTO `dtoa_material` VALUES ('2477', '10802023', '脱模润滑剂', '117', '10802', '化工产品', '桶', '5L', '', '', '9', '董满仓', '2021-10-29 10:40:16', null);
INSERT INTO `dtoa_material` VALUES ('2478', '10705058', '止水螺栓', '121', '10705', '金属构件', '根', 'M14*900', '', '', '9', '董满仓', '2021-11-03 10:48:37', null);
INSERT INTO `dtoa_material` VALUES ('2479', '10705059', '止水螺栓', '121', '10705', '金属构件', '根', 'M14*1100', '', '', '9', '董满仓', '2021-11-03 10:50:29', null);
INSERT INTO `dtoa_material` VALUES ('2480', '50107007', '车载式混凝土泵车', '140', '50107', '汽车泵', 'm³', '4500ml/132KW', '', '', '9', '董满仓', '2021-11-03 10:50:50', null);
INSERT INTO `dtoa_material` VALUES ('2481', '50107008', '车载式混凝土泵车', '140', '50107', '汽车泵', '班', '4500ml/132KW', '', '', '9', '董满仓', '2021-11-03 10:54:38', null);
INSERT INTO `dtoa_material` VALUES ('2482', '10802024', '铸工胶', '117', '10802', '化工产品', '组', 'AB型', '', '', '9', '董满仓', '2021-11-03 10:55:09', null);
INSERT INTO `dtoa_material` VALUES ('2483', '11114014', '墩布池', '142', '11114', '卫浴安装', '套', '395*395', '瓷质', '', '9', '董满仓', '2021-11-03 10:58:22', '2021-11-03 11:00:14');
INSERT INTO `dtoa_material` VALUES ('2484', '11002096', '导向灯护网', '91', '11002', '电气辅材', '个', '335*145', '', '', '9', '董满仓', '2021-11-03 11:00:15', null);
INSERT INTO `dtoa_material` VALUES ('2485', '11003129', '防爆箱AL', '105', '11003', '电箱', '台', '450*600*230', '', '', '9', '董满仓', '2021-11-05 16:25:43', null);
INSERT INTO `dtoa_material` VALUES ('2486', '11003130', '防爆箱WFAL', '105', '11003', '电箱', '台', '450*600*230', '', '', '9', '董满仓', '2021-11-05 16:28:15', null);
INSERT INTO `dtoa_material` VALUES ('2487', '11003131', '防爆箱FJAP1', '105', '11003', '电箱', '台', '550*600*230', '', '', '9', '董满仓', '2021-11-05 16:28:40', '2021-11-05 16:29:42');
INSERT INTO `dtoa_material` VALUES ('2488', '11003132', '防爆箱FJAP2', '105', '11003', '电箱', '台', '550*600*230', '', '', '9', '董满仓', '2021-11-05 16:29:43', null);
INSERT INTO `dtoa_material` VALUES ('2489', '11003133', '防爆箱FJAP3', '105', '11003', '电箱', '台', '400*580*230', '', '', '9', '董满仓', '2021-11-05 16:30:13', null);
INSERT INTO `dtoa_material` VALUES ('2490', '11003134', '防爆箱FJAP4', '105', '11003', '电箱', '台', '400*580*230', '', '', '9', '董满仓', '2021-11-05 16:30:48', null);
INSERT INTO `dtoa_material` VALUES ('2491', '11007088', 'YJV电缆', '114', '11007', '电线电缆', '米', '3*35+2', '', '', '9', '董满仓', '2021-11-08 09:35:43', null);
INSERT INTO `dtoa_material` VALUES ('2492', '1010302003', '铁板', '154', '1010302', '板材', '㎡', '10mm', '', '', '9', '董满仓', '2021-11-10 13:43:52', null);
INSERT INTO `dtoa_material` VALUES ('2495', '11102089', '脸盆冷热水龙头', '93', '11102', '控水主材', '个', 'DN15', '', '', '9', '董满仓', '2021-11-15 10:42:11', null);
INSERT INTO `dtoa_material` VALUES ('2496', '11114015', '不锈钢花洒', '142', '11114', '卫浴安装', '套', '', '', '', '9', '董满仓', '2021-11-15 10:43:05', null);
INSERT INTO `dtoa_material` VALUES ('2497', '11114016', '软管花洒', '142', '11114', '卫浴安装', '套', '', '', '', '9', '董满仓', '2021-11-15 10:44:21', null);
INSERT INTO `dtoa_material` VALUES ('2498', '112141', '粘鼠板', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-11-17 10:33:35', null);
INSERT INTO `dtoa_material` VALUES ('2499', '112142', '簸箕', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2021-11-17 10:34:38', null);
INSERT INTO `dtoa_material` VALUES ('2500', '11008050', '排风扇', '115', '11008', '电气设备安装材料', '台', '400*400', '', '', '9', '董满仓', '2021-11-17 13:53:30', null);
INSERT INTO `dtoa_material` VALUES ('2501', '11008051', '静电接地报警器', '115', '11008', '电气设备安装材料', '台', 'JDBL-2型', '', '', '9', '董满仓', '2021-11-17 13:54:05', null);
INSERT INTO `dtoa_material` VALUES ('2502', '11002097', '防爆软管', '91', '11002', '电气辅材', '根', 'Φ20*1米', '', '', '9', '董满仓', '2021-11-18 09:50:58', null);
INSERT INTO `dtoa_material` VALUES ('2503', '11002098', '防爆软管', '91', '11002', '电气辅材', '根', 'Φ32*1米', '', '', '9', '董满仓', '2021-11-18 10:00:03', null);
INSERT INTO `dtoa_material` VALUES ('2504', '10701182', '镀锌螺栓', '90', '10701', '五金材料', '套', 'M8*50', '', '', '9', '董满仓', '2021-11-18 10:00:21', null);
INSERT INTO `dtoa_material` VALUES ('2505', '30202096', '焊机吸烟净化器', '47', '30202', '文明施工', '台', '', '', '', '9', '董满仓', '2021-11-29 08:52:04', null);
INSERT INTO `dtoa_material` VALUES ('2506', '30102016', '卸料平台', '146', '30102', '机械设备', '台', '7m*2.5m*1.5m', '', '工字钢加方矩管', '9', '董满仓', '2021-11-29 08:53:04', null);
INSERT INTO `dtoa_material` VALUES ('2507', '10701183', '镀锌螺栓', '90', '10701', '五金材料', '套', 'M28*410MM', '', '', '9', '董满仓', '2021-11-29 08:55:51', null);
INSERT INTO `dtoa_material` VALUES ('2508', '10701184', '镀锌双头螺栓', '90', '10701', '五金材料', '套', 'M28*410MM', '', '', '9', '董满仓', '2021-11-29 08:58:41', null);
INSERT INTO `dtoa_material` VALUES ('2509', '10701185', '扇形螺栓', '90', '10701', '五金材料', '套', '245mm*170mm*25mm', '', '', '9', '董满仓', '2021-11-29 08:59:23', null);
INSERT INTO `dtoa_material` VALUES ('2510', '10701186', '板型螺栓', '90', '10701', '五金材料', '套', '250mm*200mm*14mm', '', '', '9', '董满仓', '2021-11-29 09:04:23', null);
INSERT INTO `dtoa_material` VALUES ('2511', '10701187', '钢丝绳', '90', '10701', '五金材料', '米', 'Φ21.5', '', '', '9', '董满仓', '2021-11-29 09:05:59', null);
INSERT INTO `dtoa_material` VALUES ('2512', '10802025', '防冻液', '117', '10802', '化工产品', '斤', '', '', '', '9', '董满仓', '2021-11-29 09:07:10', null);
INSERT INTO `dtoa_material` VALUES ('2513', '10701188', '直螺纹套筒', '90', '10701', '五金材料', '个', '25变18', '', '', '9', '董满仓', '2021-11-29 09:26:36', null);
INSERT INTO `dtoa_material` VALUES ('2514', '10701189', '直螺纹套筒', '90', '10701', '五金材料', '个', '22变16', '', '', '9', '董满仓', '2021-11-29 09:27:29', null);
INSERT INTO `dtoa_material` VALUES ('2515', '10701190', '直螺纹套筒', '90', '10701', '五金材料', '个', '22变18', '', '', '9', '董满仓', '2021-11-29 09:27:56', null);
INSERT INTO `dtoa_material` VALUES ('2516', '30101002', '套丝机机头', '145', '30101', '设备维修', '套', '', '', '', '9', '董满仓', '2021-11-29 09:28:26', null);
INSERT INTO `dtoa_material` VALUES ('2517', '11001065', '穿筋铁方盒', '59', '11001', '管线敷设', '个', '86H70-4分孔', '', '', '9', '董满仓', '2021-11-29 09:37:38', '2021-11-29 09:40:36');
INSERT INTO `dtoa_material` VALUES ('2518', '218001', '冬施抗渗膨胀混凝土', '169', '218', '冬施抗渗膨胀混凝土', 'm³', 'C40P6', '', '', '9', '董满仓', '2021-11-29 10:41:23', '2021-11-29 10:42:45');
INSERT INTO `dtoa_material` VALUES ('2519', '10406011', '过梁', '133', '10406', '砼构件', '根', '2米*0.12', '砼预制', '', '9', '董满仓', '2021-11-30 14:26:14', null);
INSERT INTO `dtoa_material` VALUES ('2520', '10406012', '过梁', '133', '10406', '砼构件', '根', '1.5米*0.12', '砼预制', '', '9', '董满仓', '2021-11-30 14:27:07', null);
INSERT INTO `dtoa_material` VALUES ('2521', '11110089', 'PVC下水管', '129', '11110', 'PVC管材管件', '个', 'Φ40', 'PVC', '', '9', '董满仓', '2021-12-01 08:49:49', null);
INSERT INTO `dtoa_material` VALUES ('2522', '11107077', '球墨哈夫三通', '109', '11107', '球墨管材管件', '个', '100*100', '', '', '9', '董满仓', '2021-12-01 08:52:24', null);
INSERT INTO `dtoa_material` VALUES ('2523', '11102090', '延时冲洗阀', '93', '11102', '控水主材', '个', 'DN25', '', '', '9', '董满仓', '2021-12-01 09:14:53', null);
INSERT INTO `dtoa_material` VALUES ('2524', '11109062', '镀锌单管卡子', '122', '11109', '水暖辅材', '个', 'DN25', '', '', '9', '董满仓', '2021-12-01 09:15:28', null);
INSERT INTO `dtoa_material` VALUES ('2525', '11109063', '镀锌单管卡子', '122', '11109', '水暖辅材', '个', 'DN32', '', '', '9', '董满仓', '2021-12-01 09:42:54', null);
INSERT INTO `dtoa_material` VALUES ('2526', '11109064', '镀锌单管卡子', '122', '11109', '水暖辅材', '个', 'DN20', '', '', '9', '董满仓', '2021-12-01 09:43:28', null);
INSERT INTO `dtoa_material` VALUES ('2530', '11109065', '镀锌单管卡子', '122', '11109', '水暖辅材', '个', 'DN40', '', '', '9', '董满仓', '2021-12-01 09:44:24', null);
INSERT INTO `dtoa_material` VALUES ('2531', '30202097', '电动喷雾器', '47', '30202', '文明施工', '个', '', '', '', '9', '董满仓', '2021-12-03 08:38:27', null);
INSERT INTO `dtoa_material` VALUES ('2532', '50104005', '运输车', '84', '50104', '运输车', '车次', '6轮4米车厢', '', '', '1', '管理员', '2021-12-07 10:18:14', null);
INSERT INTO `dtoa_material` VALUES ('2533', '10705060', '地脚螺栓', '121', '10705', '金属构件', '根', 'M18*600mm', '', '', '1', '管理员', '2021-12-07 10:19:26', '2021-12-07 10:23:57');
INSERT INTO `dtoa_material` VALUES ('2534', '10705061', '不锈钢篦子', '121', '10705', '金属构件', '块', '1000*500mm', '', '', '1', '管理员', '2021-12-07 10:21:28', null);
INSERT INTO `dtoa_material` VALUES ('2535', '11109066', '镀锌速连管束', '122', '11109', '水暖辅材', '个', 'DN20', '', '', '1', '管理员', '2021-12-08 10:42:56', null);
INSERT INTO `dtoa_material` VALUES ('2536', '1010301021', '圆铁板', '136', '1010301', '加工铁板', '块', 'Φ640*5mm', '', '', '1', '管理员', '2021-12-08 10:44:22', null);
INSERT INTO `dtoa_material` VALUES ('2537', '1010301022', '加工铁板', '136', '1010301', '加工铁板', '块', '670*670*5mm', '', '', '1', '管理员', '2021-12-08 10:45:57', null);
INSERT INTO `dtoa_material` VALUES ('2538', '1010301023', '加工铁板', '136', '1010301', '加工铁板', '块', '840*530*5mm', '', '', '1', '管理员', '2021-12-08 10:46:35', null);
INSERT INTO `dtoa_material` VALUES ('2539', '1010301024', '加工铁板', '136', '1010301', '加工铁板', '块', '630*810*5mm', '', '', '1', '管理员', '2021-12-08 10:47:24', null);
INSERT INTO `dtoa_material` VALUES ('2540', '1010301025', '加工铁板', '136', '1010301', '加工铁板', '块', '990*570*5mm', '', '', '1', '管理员', '2021-12-08 10:47:52', null);
INSERT INTO `dtoa_material` VALUES ('2541', '1010301026', '加工铁板', '136', '1010301', '加工铁板', '块', '850*720*5mm', '', '', '1', '管理员', '2021-12-08 10:48:12', null);
INSERT INTO `dtoa_material` VALUES ('2544', '1010301027', '加工铁板', '136', '1010301', '加工铁板', '块', '1290*420*5mm', '', '', '1', '管理员', '2021-12-08 10:48:53', null);
INSERT INTO `dtoa_material` VALUES ('2545', '1010301028', '加工铁板', '136', '1010301', '加工铁板', '块', '550*730*5mm', '', '', '1', '管理员', '2021-12-08 10:49:25', null);
INSERT INTO `dtoa_material` VALUES ('2546', '1010301029', '加工铁板', '136', '1010301', '加工铁板', '块', '840*580*5mm', '', '', '1', '管理员', '2021-12-08 10:49:48', null);
INSERT INTO `dtoa_material` VALUES ('2547', '30102017', '电镐', '146', '30102', '机械设备', '台', 'Z1G-FF115-1240W', '', '', '1', '管理员', '2021-12-08 10:50:28', '2021-12-08 10:52:31');
INSERT INTO `dtoa_material` VALUES ('2548', '30202098', '防毒面罩', '47', '30202', '文明施工', '个', '', '', '', '1', '管理员', '2021-12-08 10:52:32', null);
INSERT INTO `dtoa_material` VALUES ('2550', '30202099', '消防服', '47', '30202', '文明施工', '件', '', '', '', '1', '管理员', '2021-12-08 10:59:16', null);
INSERT INTO `dtoa_material` VALUES ('2551', '30202100', '烟雾弹', '47', '30202', '文明施工', '个', '', '', '', '1', '管理员', '2021-12-08 10:59:52', null);
INSERT INTO `dtoa_material` VALUES ('2552', '11110090', 'PVC补芯', '129', '11110', 'PVC管材管件', '个', 'Φ75*50', 'PVC', '', '1', '管理员', '2021-12-08 11:00:06', null);
INSERT INTO `dtoa_material` VALUES ('2553', '11110091', 'PVC斜三通', '129', '11110', 'PVC管材管件', '个', 'Φ75*50', 'PVC', '', '1', '管理员', '2021-12-08 11:02:26', null);
INSERT INTO `dtoa_material` VALUES ('2554', '11110092', 'PVC洗衣机地漏', '129', '11110', 'PVC管材管件', '个', 'Φ50', 'PVC', '', '1', '管理员', '2021-12-08 11:02:58', null);
INSERT INTO `dtoa_material` VALUES ('2555', '11110093', 'PVC-S型反水弯', '129', '11110', 'PVC管材管件', '个', 'Φ50', 'PVC', '', '1', '管理员', '2021-12-08 11:03:44', '2021-12-08 11:04:54');
INSERT INTO `dtoa_material` VALUES ('2556', '11110094', 'PVC-P型反水弯', '129', '11110', 'PVC管材管件', '个', 'Φ50', 'PVC', '', '1', '管理员', '2021-12-08 11:04:22', null);
INSERT INTO `dtoa_material` VALUES ('2557', '11110095', 'PVC吸盘吊卡', '129', '11110', 'PVC管材管件', '套', 'Φ110', 'PVC', '', '1', '管理员', '2021-12-08 11:04:54', null);
INSERT INTO `dtoa_material` VALUES ('2558', '11110096', 'PVC吸盘吊卡', '129', '11110', 'PVC管材管件', '个', 'Φ75', 'PVC', '', '1', '管理员', '2021-12-08 11:05:34', null);
INSERT INTO `dtoa_material` VALUES ('2559', '11110097', 'PVC吸盘吊卡', '129', '11110', 'PVC管材管件', '个', 'Φ50', 'PVC', '', '1', '管理员', '2021-12-08 11:05:53', null);
INSERT INTO `dtoa_material` VALUES ('2560', '11110098', 'PVC止水环', '129', '11110', 'PVC管材管件', '个', 'Φ110', 'PVC', '', '1', '管理员', '2021-12-08 11:06:15', null);
INSERT INTO `dtoa_material` VALUES ('2561', '30102018', '充电电钻', '146', '30102', '机械设备', '台', '10-10E', '', '', '1', '管理员', '2021-12-08 11:06:46', null);
INSERT INTO `dtoa_material` VALUES ('2562', '11110099', 'PVC瓶口三通', '129', '11110', 'PVC管材管件', '个', 'Φ110*50', 'PVC', '', '1', '管理员', '2021-12-08 11:08:10', null);
INSERT INTO `dtoa_material` VALUES ('2563', '11109067', '阻火圈', '122', '11109', '水暖辅材', '个', 'Φ110', '', '', '1', '管理员', '2021-12-08 11:13:06', null);
INSERT INTO `dtoa_material` VALUES ('2564', '10902020', '橡塑保温管', '128', '10902', '保温材料', '米', '28*3', '橡塑海绵', '', '1', '管理员', '2021-12-08 11:15:16', null);
INSERT INTO `dtoa_material` VALUES ('2567', '30102019', '管道清理机', '146', '30102', '机械设备', '台', '550W/Φ20-200', '', '', '1', '管理员', '2021-12-08 11:18:15', null);
INSERT INTO `dtoa_material` VALUES ('2568', '30202101', '消防井围栏', '47', '30202', '文明施工', '套', '3m*40cm', '', '', '1', '管理员', '2021-12-08 11:19:36', null);
INSERT INTO `dtoa_material` VALUES ('2569', '30102020', '恒温恒湿养护箱', '146', '30102', '机械设备', '台', 'SHBY-60B型', '', '', '1', '管理员', '2021-12-08 11:20:46', null);
INSERT INTO `dtoa_material` VALUES ('2570', '10801014', '真石漆涂料', '116', '10801', '油漆水漆', '吨', '石砾漆灰色', '', '', '1', '管理员', '2021-12-08 13:28:53', null);
INSERT INTO `dtoa_material` VALUES ('2571', '10802026', '外墙涂料', '117', '10802', '化工产品', '吨', '灰色', '', '', '1', '管理员', '2021-12-08 13:30:08', null);
INSERT INTO `dtoa_material` VALUES ('2572', '10503010', '玻纤维网', '134', '10503', '小型材料', '㎡', '网孔5mm', '', '', '1', '管理员', '2021-12-08 13:30:47', null);
INSERT INTO `dtoa_material` VALUES ('2573', '10802027', '墙面固化剂', '117', '10802', '化工产品', '桶', '20KG', '', '', '1', '管理员', '2021-12-08 13:32:24', null);
INSERT INTO `dtoa_material` VALUES ('2574', '10801015', '抗碱封闭底漆', '116', '10801', '油漆水漆', '吨', '白色', '', '', '1', '管理员', '2021-12-08 13:33:35', null);
INSERT INTO `dtoa_material` VALUES ('2575', '10801016', '罩面漆', '116', '10801', '油漆水漆', '吨', '透明', '', '', '1', '管理员', '2021-12-08 13:34:08', null);
INSERT INTO `dtoa_material` VALUES ('2576', '10603009', '断桥铝窗', '160', '10603', '窗及制品', '扇', '70系列1800*2200', '', '', '1', '管理员', '2021-12-08 13:34:50', null);
INSERT INTO `dtoa_material` VALUES ('2577', '10604001', '断桥铝门', '170', '10604', '其他门', '樘', '70系列2700*2800', '', '', '1', '管理员', '2021-12-08 13:37:18', null);
INSERT INTO `dtoa_material` VALUES ('2578', '10603010', '纱窗', '160', '10603', '窗及制品', '个', '650*900', '', '', '1', '管理员', '2021-12-08 13:37:56', null);
INSERT INTO `dtoa_material` VALUES ('2579', '10705062', '不锈钢标识牌', '121', '10705', '金属构件', '座', '后排7993*500*3080 前排6000*400*800', '', '', '1', '管理员', '2021-12-08 13:38:37', null);
INSERT INTO `dtoa_material` VALUES ('2580', '10705063', '不锈钢标识牌', '121', '10705', '金属构件', '座', '前排13984*500*970 后排7361*600*2800', '', '', '1', '管理员', '2021-12-08 13:48:21', null);
INSERT INTO `dtoa_material` VALUES ('2581', '10705064', '不锈钢标识牌', '121', '10705', '金属构件', '座', '18710*600*5500', '', '', '1', '管理员', '2021-12-08 13:48:41', null);
INSERT INTO `dtoa_material` VALUES ('2582', '10705065', '不锈钢标识牌', '121', '10705', '金属构件', '座', '24000*2600*2755', '', '', '1', '管理员', '2021-12-08 13:48:59', null);
INSERT INTO `dtoa_material` VALUES ('2583', '10705066', '不锈钢标识牌', '121', '10705', '金属构件', '座', '后排15680*500*4600  前排10400*500*18200', '', '', '1', '管理员', '2021-12-08 13:49:16', null);
INSERT INTO `dtoa_material` VALUES ('2584', '10705067', '不锈钢标识牌', '121', '10705', '金属构件', '座', '前排23033*400*1815   后排12529*500*4105', '', '', '1', '管理员', '2021-12-08 13:49:37', null);
INSERT INTO `dtoa_material` VALUES ('2585', '10705068', '不锈钢标识牌', '121', '10705', '金属构件', '座', '6340*500*2000', '', '', '1', '管理员', '2021-12-08 13:50:00', null);
INSERT INTO `dtoa_material` VALUES ('2586', '10705069', '不锈钢标识牌', '121', '10705', '金属构件', '座', '前排21640*550*1790     后排9748*600*3680', '', '', '1', '管理员', '2021-12-08 13:50:18', null);
INSERT INTO `dtoa_material` VALUES ('2587', '10705070', '不锈钢标识牌', '121', '10705', '金属构件', '座', '4550*500*850', '', '', '1', '管理员', '2021-12-08 13:50:39', null);
INSERT INTO `dtoa_material` VALUES ('2588', '10705071', '不锈钢标识牌', '121', '10705', '金属构件', '座', '1781*400*2000*12个字', '', '', '1', '管理员', '2021-12-08 13:50:58', null);
INSERT INTO `dtoa_material` VALUES ('2589', '10705072', '不锈钢标识牌', '121', '10705', '金属构件', '座', '后排16000*500*788   前排16965*2600*2755', '', '', '1', '管理员', '2021-12-08 13:51:59', null);
INSERT INTO `dtoa_material` VALUES ('2590', '10705073', '花箱', '121', '10705', '金属构件', '个', '4000*1700*1000', '', '', '1', '管理员', '2021-12-08 13:57:00', null);
INSERT INTO `dtoa_material` VALUES ('2591', '10705074', '花箱', '121', '10705', '金属构件', '个', '3000*1000*800', '', '', '1', '管理员', '2021-12-08 13:59:57', null);
INSERT INTO `dtoa_material` VALUES ('2592', '10705075', '花箱', '121', '10705', '金属构件', '个', '4000*800*600', '', '', '1', '管理员', '2021-12-08 14:00:22', null);
INSERT INTO `dtoa_material` VALUES ('2593', '10705076', '护栏（月季花架）', '121', '10705', '金属构件', '米', '高度1.5米', '', '', '1', '管理员', '2021-12-08 14:00:44', null);
INSERT INTO `dtoa_material` VALUES ('2594', '1010301030', '镀锌铁板', '136', '1010301', '加工铁板', '块', '500*500*0.5', '', '', '1', '管理员', '2021-12-09 09:22:45', null);
INSERT INTO `dtoa_material` VALUES ('2595', '11101102', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN65*50', '', '', '1', '管理员', '2021-12-09 09:38:51', null);
INSERT INTO `dtoa_material` VALUES ('2596', '11002099', '插头', '91', '11002', '电气辅材', '个', '4P/32A', '', '', '1', '管理员', '2021-12-14 09:36:32', null);
INSERT INTO `dtoa_material` VALUES ('2597', '11002100', '插头', '91', '11002', '电气辅材', '个', '5P/32A', '', '', '1', '管理员', '2021-12-14 09:39:32', null);
INSERT INTO `dtoa_material` VALUES ('2599', '11101103', '镀锌过桥弯', '92', '11101', '镀锌管件', '个', 'DN25', '', '', '1', '管理员', '2021-12-14 09:40:09', '2021-12-14 09:44:08');
INSERT INTO `dtoa_material` VALUES ('2600', '11101104', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN65*40', '', '', '1', '管理员', '2021-12-14 09:45:05', null);
INSERT INTO `dtoa_material` VALUES ('2601', '10701191', '通丝连接片', '90', '10701', '五金材料', '个', 'M10', '', '', '1', '管理员', '2021-12-14 09:47:24', null);
INSERT INTO `dtoa_material` VALUES ('2602', '10701192', '通丝连接片', '90', '10701', '五金材料', '个', 'M8', '', '', '1', '管理员', '2021-12-14 09:48:13', '2021-12-14 09:48:37');
INSERT INTO `dtoa_material` VALUES ('2603', '11102091', '铜截止阀', '93', '11102', '控水主材', '个', 'DN32', '', '', '1', '管理员', '2021-12-14 09:48:37', null);
INSERT INTO `dtoa_material` VALUES ('2604', '11102092', '铜截止阀', '93', '11102', '控水主材', '个', 'DN25', '', '', '1', '管理员', '2021-12-14 10:18:41', null);
INSERT INTO `dtoa_material` VALUES ('2605', '11102093', '铸钢法兰截止阀', '93', '11102', '控水主材', '个', 'DN65', '', '', '1', '管理员', '2021-12-14 10:18:56', '2021-12-14 10:25:00');
INSERT INTO `dtoa_material` VALUES ('2606', '11102094', '铜截止阀', '93', '11102', '控水主材', '个', 'DN40', '', '', '1', '管理员', '2021-12-14 10:21:01', null);
INSERT INTO `dtoa_material` VALUES ('2607', '11102095', '铸钢法兰截止阀', '93', '11102', '控水主材', '个', 'DN100', '', '', '1', '管理员', '2021-12-14 10:25:00', null);
INSERT INTO `dtoa_material` VALUES ('2608', '10703029', '焊接大小头', '119', '10703', '焊接冲压管件', '个', 'DN100*65', '', '', '1', '管理员', '2021-12-14 10:25:21', null);
INSERT INTO `dtoa_material` VALUES ('2609', '10703030', '焊接大小头', '119', '10703', '焊接冲压管件', '个', 'DN100*80', '', '', '1', '管理员', '2021-12-14 10:27:25', null);
INSERT INTO `dtoa_material` VALUES ('2610', '11109068', '防火布', '122', '11109', '水暖辅材', '平米', '', '', '', '1', '管理员', '2021-12-14 10:27:42', '2021-12-14 10:29:07');
INSERT INTO `dtoa_material` VALUES ('2611', '10406013', '水泥透水管', '133', '10406', '砼构件', '米', 'Φ400*1000', '砼预制', '', '1', '管理员', '2021-12-15 14:42:40', null);
INSERT INTO `dtoa_material` VALUES ('2612', '10403013', '蒸压加气块', '101', '10403', '砌块砖等', '方', '300*240*600', '', '', '1', '管理员', '2021-12-15 14:47:39', null);
INSERT INTO `dtoa_material` VALUES ('2613', '10504004', '白灰粉', '159', '10504', '其他建材', '袋', '25KG', '', '', '1', '管理员', '2021-12-15 14:49:00', null);
INSERT INTO `dtoa_material` VALUES ('2614', '30102021', '电梯井升降平台', '146', '30102', '机械设备', '套', '1900*2900*2000', '', '', '1', '管理员', '2021-12-15 14:50:14', null);
INSERT INTO `dtoa_material` VALUES ('2615', '1010105003', '镀锌方管', '137', '1010105', '方管', '米', '50*50*2.0', '', '', '1', '管理员', '2021-12-15 14:53:22', null);
INSERT INTO `dtoa_material` VALUES ('2616', '1010105003', '镀锌方管', '137', '1010105', '方管', '米', '20*20*2.0', '', '', '1', '管理员', '2021-12-15 14:53:22', '2021-12-15 14:58:05');
INSERT INTO `dtoa_material` VALUES ('2617', '10701193', '钢网', '90', '10701', '五金材料', '㎡', '30*30孔', '', '', '1', '管理员', '2021-12-15 14:58:06', null);
INSERT INTO `dtoa_material` VALUES ('2618', '10701194', '合页', '90', '10701', '五金材料', '付', '80', '', '', '1', '管理员', '2021-12-15 15:00:26', null);
INSERT INTO `dtoa_material` VALUES ('2619', '11109069', '镀锌吊卡', '122', '11109', '水暖辅材', '套', 'DN65', '', '', '1', '管理员', '2021-12-16 09:07:06', null);
INSERT INTO `dtoa_material` VALUES ('2620', '11109070', '镀锌吊卡', '122', '11109', '水暖辅材', '套', 'DN50', '', '', '1', '管理员', '2021-12-16 09:08:37', null);
INSERT INTO `dtoa_material` VALUES ('2621', '11109071', '镀锌吊卡', '122', '11109', '水暖辅材', '套', 'DN40', '', '', '1', '管理员', '2021-12-16 09:08:51', null);
INSERT INTO `dtoa_material` VALUES ('2622', '10504005', '加气块碎料', '159', '10504', '其他建材', '方', '', '', '', '1', '管理员', '2021-12-18 10:19:52', null);
INSERT INTO `dtoa_material` VALUES ('2623', '112143', '打印共享器', '41', '112', '低值易耗品', '个', '', '', '', '1', '管理员', '2021-12-30 08:10:30', null);
INSERT INTO `dtoa_material` VALUES ('2624', '113056', '装订机', '88', '113', '办公用品', '台', '', '', '', '1', '管理员', '2021-12-30 08:13:22', null);
INSERT INTO `dtoa_material` VALUES ('2625', '113057', '修正液', '88', '113', '办公用品', '瓶', '', '', '', '1', '管理员', '2021-12-30 08:15:55', null);
INSERT INTO `dtoa_material` VALUES ('2626', '112144', '复印机刮板', '41', '112', '低值易耗品', '个', '', '', '', '1', '管理员', '2021-12-30 08:17:36', null);
INSERT INTO `dtoa_material` VALUES ('2627', '10701195', '卡豆', '90', '10701', '五金材料', '个', '22', '', '', '1', '管理员', '2021-12-30 08:18:07', null);
INSERT INTO `dtoa_material` VALUES ('2628', '10701196', '鸡心环', '90', '10701', '五金材料', '个', '22', '', '', '1', '管理员', '2021-12-30 08:23:46', null);
INSERT INTO `dtoa_material` VALUES ('2629', '10902021', '阻燃岩棉被', '128', '10902', '保温材料', '条', '1.2m*3m', '', '', '1', '管理员', '2021-12-30 08:24:02', null);
INSERT INTO `dtoa_material` VALUES ('2630', '10902022', '挤塑板', '128', '10902', '保温材料', '方', '6cm', '', '', '1', '管理员', '2021-12-30 08:25:08', null);
INSERT INTO `dtoa_material` VALUES ('2631', '10702040', '测温仪', '118', '10702', '五金工具', '个', '', '', '', '1', '管理员', '2021-12-30 08:27:21', null);
INSERT INTO `dtoa_material` VALUES ('2632', '10701197', '钢板网', '90', '10701', '五金材料', '块', '1m*2m', '', '', '1', '管理员', '2021-12-30 08:28:08', null);
INSERT INTO `dtoa_material` VALUES ('2633', '10902023', '橡塑保温管', '128', '10902', '保温材料', '米', '42*3cm', '', '', '1', '管理员', '2021-12-30 08:30:33', null);
INSERT INTO `dtoa_material` VALUES ('2634', '10902024', '橡塑保温管', '128', '10902', '保温材料', '米', '48*3cm', '', '', '1', '管理员', '2021-12-30 08:38:06', null);
INSERT INTO `dtoa_material` VALUES ('2635', '10902025', '橡塑保温管', '128', '10902', '保温材料', '米', '60*3cm', '', '', '1', '管理员', '2021-12-30 08:38:43', null);
INSERT INTO `dtoa_material` VALUES ('2636', '10902026', '橡塑保温管', '128', '10902', '保温材料', '米', '76*4cm', '', '', '1', '管理员', '2021-12-30 08:39:08', null);
INSERT INTO `dtoa_material` VALUES ('2637', '10902027', '橡塑保温管', '128', '10902', '保温材料', '米', '89*4cm', '', '', '1', '管理员', '2021-12-30 08:39:34', null);
INSERT INTO `dtoa_material` VALUES ('2638', '10902028', '橡塑保温管', '128', '10902', '保温材料', '米', '108*5cm', '', '', '1', '管理员', '2021-12-30 08:39:55', null);
INSERT INTO `dtoa_material` VALUES ('2639', '10902029', '橡塑保温管', '128', '10902', '保温材料', '米', '133*5cm', '', '', '1', '管理员', '2021-12-30 08:40:12', null);
INSERT INTO `dtoa_material` VALUES ('2640', '10902030', '橡塑保温管', '128', '10902', '保温材料', '米', '159*5cm', '', '', '1', '管理员', '2021-12-30 08:40:30', null);
INSERT INTO `dtoa_material` VALUES ('2641', '10902031', '四氟生料带', '128', '10902', '保温材料', 'kg', '20cm*2mm', '', '', '1', '管理员', '2021-12-30 08:42:03', null);
INSERT INTO `dtoa_material` VALUES ('2642', '10902032', '硅酸钙保温瓦壳', '128', '10902', '保温材料', '米', '159*5cm', '', '', '1', '管理员', '2021-12-30 08:43:50', '2021-12-30 08:46:27');
INSERT INTO `dtoa_material` VALUES ('2643', '10902033', '聚氨酯保温瓦壳', '128', '10902', '保温材料', '米', '159*5cm', '', '', '1', '管理员', '2021-12-30 08:46:28', null);
INSERT INTO `dtoa_material` VALUES ('2644', '10902034', '黑聚氨酯保温管外壳', '128', '10902', '保温材料', '米', '259*5mm', '黑色聚氨酯', '', '1', '管理员', '2021-12-30 08:46:55', null);
INSERT INTO `dtoa_material` VALUES ('2645', '30202102', '绿防尘网', '47', '30202', '文明施工', '卷', '六针型8*30米', '', '', '9', '董满仓', '2021-12-31 09:06:00', null);
INSERT INTO `dtoa_material` VALUES ('2647', '50104006', '洒水车', '84', '50104', '运输车', '班', '12方', '', '', '9', '董满仓', '2021-12-31 09:07:22', null);
INSERT INTO `dtoa_material` VALUES ('2648', '11007089', '室外防水网线', '114', '11007', '电线电缆', '米', '超五类', '', '', '9', '董满仓', '2021-12-31 14:04:37', null);
INSERT INTO `dtoa_material` VALUES ('2650', '30301074', '录像机', '156', '30301', '临建周转设备', '台', '八路', '', '', '9', '董满仓', '2021-12-31 14:09:46', null);
INSERT INTO `dtoa_material` VALUES ('2651', '10705077', '室外摄像头支架', '121', '10705', '金属构件', '个', '', '', '', '9', '董满仓', '2021-12-31 14:10:21', null);
INSERT INTO `dtoa_material` VALUES ('2652', '502033', '塔吊租赁', '76', '502', '设备租赁', '月', '6013型', '', '', '9', '董满仓', '2021-12-31 15:57:12', null);
INSERT INTO `dtoa_material` VALUES ('2653', '502034', '塔吊租赁', '76', '502', '设备租赁', '月', '6015型', '', '', '9', '董满仓', '2021-12-31 15:58:07', null);
INSERT INTO `dtoa_material` VALUES ('2654', '10705078', '塔吊预埋件', '121', '10705', '金属构件', '套', '6013型', '', '', '9', '董满仓', '2021-12-31 15:58:21', null);
INSERT INTO `dtoa_material` VALUES ('2655', '10705079', '塔吊预埋件', '121', '10705', '金属构件', '套', '6015型', '', '', '9', '董满仓', '2021-12-31 15:59:41', null);
INSERT INTO `dtoa_material` VALUES ('2656', '11007090', 'YJV电缆', '114', '11007', '电线电缆', '米', '5*25mm²', '', '', '9', '董满仓', '2022-01-04 10:57:59', null);
INSERT INTO `dtoa_material` VALUES ('2657', '11003135', '防爆配电箱', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2022-01-10 16:11:47', null);
INSERT INTO `dtoa_material` VALUES ('2658', '11003136', '空调防爆箱220V', '105', '11003', '电箱', '台', '300*300*150', '', '', '9', '董满仓', '2022-01-10 16:15:18', '2022-01-10 16:16:47');
INSERT INTO `dtoa_material` VALUES ('2659', '11003137', '空调防爆箱380V', '105', '11003', '电箱', '台', '300*300*150', '', '', '9', '董满仓', '2022-01-10 16:16:49', null);
INSERT INTO `dtoa_material` VALUES ('2660', '11003138', '双面二级箱', '105', '11003', '电箱', '台', '1050*700*500', '', '', '9', '董满仓', '2022-01-10 16:17:18', null);
INSERT INTO `dtoa_material` VALUES ('2661', '1010205001', '钢结构件', '171', '1010205', '其他', '吨', 'Q345-B', '', '', '1', '管理员', '2022-01-17 08:08:25', null);
INSERT INTO `dtoa_material` VALUES ('2662', '1010205002', '屋面彩钢板', '171', '1010205', '其他', '平米', '100厚岩棉复合板', '', '', '1', '管理员', '2022-01-17 08:09:44', null);
INSERT INTO `dtoa_material` VALUES ('2663', '1010205003', '墙面彩钢板', '171', '1010205', '其他', '平米', '100厚岩棉复合板', '', '', '1', '管理员', '2022-01-17 08:14:00', null);
INSERT INTO `dtoa_material` VALUES ('2664', '1010205004', '彩钢板檐沟', '171', '1010205', '其他', '米', '0.6mm', '', '', '1', '管理员', '2022-01-17 08:14:23', null);
INSERT INTO `dtoa_material` VALUES ('2665', '10602006', '复合板防火门', '153', '10602', '防火门', '㎡', '', '', '', '1', '管理员', '2022-01-17 08:15:25', null);
INSERT INTO `dtoa_material` VALUES ('2666', '10604002', '金属卷帘保温门', '170', '10604', '其他门', '㎡', '30mm', '', '', '1', '管理员', '2022-01-17 08:16:25', null);
INSERT INTO `dtoa_material` VALUES ('2667', '10705080', '雨棚支架', '121', '10705', '金属构件', '吨', 'C型钢180*60*3', '', '', '1', '管理员', '2022-01-17 08:17:42', null);
INSERT INTO `dtoa_material` VALUES ('2668', '1010205005', '压型板雨罩', '171', '1010205', '其他', '平米', '上板0.6mm/下板0.5mm', '', '', '1', '管理员', '2022-01-17 08:19:09', null);
INSERT INTO `dtoa_material` VALUES ('2669', '10501014', '全瓷地砖', '125', '10501', '瓷砖', '块', '600*600', '', '', '1', '管理员', '2022-01-18 10:31:20', null);
INSERT INTO `dtoa_material` VALUES ('2670', '10201002', 'B级阻燃板', '97', '10201', '板材', '张', '1000*2000*9', '', '', '1', '管理员', '2022-01-18 10:41:18', null);
INSERT INTO `dtoa_material` VALUES ('2671', '10201003', 'B级阻燃板', '97', '10201', '板材', '张', '1000*2000*15', '', '', '1', '管理员', '2022-01-18 10:42:28', null);
INSERT INTO `dtoa_material` VALUES ('2672', '10501015', '内墙瓷砖', '125', '10501', '瓷砖', '块', '300*600', '', '', '1', '管理员', '2022-01-18 10:42:44', null);
INSERT INTO `dtoa_material` VALUES ('2673', '10701198', '轻钢龙骨', '90', '10701', '五金材料', '根', 'H75*50', '', '', '1', '管理员', '2022-01-18 10:44:31', null);
INSERT INTO `dtoa_material` VALUES ('2674', '10701199', '嵌入式铝扣板', '90', '10701', '五金材料', '平米', '600*600', '', '', '1', '管理员', '2022-01-18 10:47:11', null);
INSERT INTO `dtoa_material` VALUES ('2675', '406002', 'PVC 卷材地板', '168', '406', '地板', '平米', '水性PVC*3mm', '', '', '1', '管理员', '2022-01-18 10:49:08', null);
INSERT INTO `dtoa_material` VALUES ('2676', '10802028', '万能胶', '117', '10802', '化工产品', '桶', '10L', '', '', '1', '管理员', '2022-01-18 10:50:05', null);
INSERT INTO `dtoa_material` VALUES ('2677', '10801017', '内墙乳胶漆', '116', '10801', '油漆水漆', '桶', '18L', '', '', '1', '管理员', '2022-01-18 10:51:10', null);
INSERT INTO `dtoa_material` VALUES ('2678', '10504006', '耐水腻子N型', '159', '10504', '其他建材', '袋', '20kg', '', '', '1', '管理员', '2022-01-18 10:51:58', null);
INSERT INTO `dtoa_material` VALUES ('2679', '10901017', 'PVC挂板', '123', '10901', '橡塑制品', '平米', '400*9', '', '', '1', '管理员', '2022-01-18 10:54:34', null);
INSERT INTO `dtoa_material` VALUES ('2680', '10902035', '橡塑保温管', '128', '10902', '保温材料', '米', '89*3cm', '', '', '1', '管理员', '2022-01-18 10:56:22', '2022-01-18 10:58:47');
INSERT INTO `dtoa_material` VALUES ('2681', '10604003', '断桥铝平开门', '170', '10604', '其他门', '平米', '70系列', '', '', '1', '管理员', '2022-01-18 10:58:47', null);
INSERT INTO `dtoa_material` VALUES ('2682', '10603011', '断桥铝推拉窗', '160', '10603', '窗及制品', '平米', '70系列', '', '', '1', '管理员', '2022-01-18 11:00:30', null);
INSERT INTO `dtoa_material` VALUES ('2683', '10504007', '粉刷石膏QN600', '159', '10504', '其他建材', '袋', '20kg', '', '', '1', '管理员', '2022-01-18 11:01:06', null);
INSERT INTO `dtoa_material` VALUES ('2685', '10405012', '瓷砖粘接剂', '103', '10405', '砂浆', '袋', 'C1型20kg', '', '', '1', '管理员', '2022-01-18 11:02:57', null);
INSERT INTO `dtoa_material` VALUES ('2687', '11008052', '单联双控开关', '115', '11008', '电气设备安装材料', '个', '10A/220V', '', '', '1', '管理员', '2022-01-18 11:04:12', null);
INSERT INTO `dtoa_material` VALUES ('2689', '11008053', '单联紫外线开关', '115', '11008', '电气设备安装材料', '个', '10A/220V', '', '', '1', '管理员', '2022-01-18 11:09:13', null);
INSERT INTO `dtoa_material` VALUES ('2690', '11005046', '诱导灯', '112', '11005', '灯具', '套', '带蓄电池', '', '', '1', '管理员', '2022-01-18 11:10:54', null);
INSERT INTO `dtoa_material` VALUES ('2691', '11005047', '消防应急标志灯', '112', '11005', '灯具', '套', '单向', '', '', '1', '管理员', '2022-01-18 13:47:44', null);
INSERT INTO `dtoa_material` VALUES ('2692', '11005048', '消防应急标志灯', '112', '11005', '灯具', '套', '双向', '', '', '1', '管理员', '2022-01-18 13:48:40', null);
INSERT INTO `dtoa_material` VALUES ('2694', '11005049', '紫外线灭蚊灯', '112', '11005', '灯具', '套', '2*30w', '', '', '1', '管理员', '2022-01-18 13:49:13', null);
INSERT INTO `dtoa_material` VALUES ('2695', '11005050', '紫外线灭菌灯', '112', '11005', '灯具', '套', '200*34w', '', '', '1', '管理员', '2022-01-18 13:50:01', null);
INSERT INTO `dtoa_material` VALUES ('2696', '11005051', 'LED吸顶灯', '112', '11005', '灯具', '个', '36w', '', '', '1', '管理员', '2022-01-18 13:50:37', null);
INSERT INTO `dtoa_material` VALUES ('2697', '11001066', 'JDG镀锌管', '59', '11001', '管线敷设', '米', 'Φ40*2.0', '', '', '1', '管理员', '2022-01-18 13:53:38', null);
INSERT INTO `dtoa_material` VALUES ('2698', '11007091', 'ZCRVV护套线', '114', '11007', '电线电缆', '米', '300/500V4*2.5', '', '', '1', '管理员', '2022-01-18 13:56:03', null);
INSERT INTO `dtoa_material` VALUES ('2699', '11008054', '风机空调', '115', '11008', '电气设备安装材料', '台', 'FP-170', '', '', '1', '管理员', '2022-01-18 13:59:34', null);
INSERT INTO `dtoa_material` VALUES ('2700', '50109002', '电动升降平台车', '167', '50109', '其他', '台班', '20米', '', '', '1', '管理员', '2022-01-18 14:01:36', null);
INSERT INTO `dtoa_material` VALUES ('2701', '50109003', '曲臂登高车', '167', '50109', '其他', '台班', '24米', '', '', '1', '管理员', '2022-01-18 14:02:58', null);
INSERT INTO `dtoa_material` VALUES ('2702', '1010105004', '镀锌方管', '137', '1010105', '方管', '米', '100*60*5', '', '', '1', '管理员', '2022-01-18 14:03:32', null);
INSERT INTO `dtoa_material` VALUES ('2703', '1010105005', '镀锌方管', '137', '1010105', '方管', '米', '80*40*4', '', '', '1', '管理员', '2022-01-18 14:04:37', null);
INSERT INTO `dtoa_material` VALUES ('2704', '1010105006', '镀锌方管', '137', '1010105', '方管', '米', '150*150*8', '', '', '1', '管理员', '2022-01-18 14:04:54', null);
INSERT INTO `dtoa_material` VALUES ('2705', '1010105006', '镀锌方管', '137', '1010105', '方管', '米', '100*100*6', '', '', '1', '管理员', '2022-01-18 14:04:54', '2022-01-18 14:07:16');
INSERT INTO `dtoa_material` VALUES ('2706', '1010302004', '不锈钢板', '154', '1010302', '板材', '平米', '304/1.5mm', '', '', '1', '管理员', '2022-01-18 14:07:17', null);
INSERT INTO `dtoa_material` VALUES ('2707', '10801018', '灰防锈漆', '116', '10801', '油漆水漆', '桶', '20kg', '', '', '1', '管理员', '2022-01-18 14:08:19', null);
INSERT INTO `dtoa_material` VALUES ('2708', '11007092', 'ZCBV塑铜线', '114', '11007', '电线电缆', '米', '10mm²', '', '', '1', '管理员', '2022-01-18 14:09:47', null);
INSERT INTO `dtoa_material` VALUES ('2709', '402001', 'SBS改性沥青防水卷材', '72', '402', '防水', '卷', '1m*10m*3mm/-25C°', '', '', '1', '管理员', '2022-01-19 10:05:15', null);
INSERT INTO `dtoa_material` VALUES ('2710', '10802029', '防水卷材基层处理剂', '117', '10802', '化工产品', '桶', 'W型/20kg', '', '', '1', '管理员', '2022-01-19 10:06:49', null);
INSERT INTO `dtoa_material` VALUES ('2711', '30201023', '安全带检测设备', '46', '30201', '安全设备', '套', '6m*4.8m*0.6m', '', '', '1', '管理员', '2022-01-23 10:18:55', null);
INSERT INTO `dtoa_material` VALUES ('2712', '30201024', '安全帽撞击设备', '46', '30201', '安全设备', '套', '2.28m*2.5m*0.6m', '', '', '1', '管理员', '2022-01-23 10:19:59', null);
INSERT INTO `dtoa_material` VALUES ('2713', '30201025', '灭火器演示设备', '46', '30201', '安全设备', '套', '2.4m*2.5m*0.61m', '', '', '1', '管理员', '2022-01-23 10:20:35', '2022-01-23 10:29:03');
INSERT INTO `dtoa_material` VALUES ('2714', '30301075', '铁质柜子', '156', '30301', '临建周转设备', '个', '1.2m*1.2m', '', '', '1', '管理员', '2022-01-23 10:29:03', null);
INSERT INTO `dtoa_material` VALUES ('2715', '30301076', '铁质柜子', '156', '30301', '临建周转设备', '个', '0.8m*0.7m', '', '', '1', '管理员', '2022-01-23 10:32:36', null);
INSERT INTO `dtoa_material` VALUES ('2716', '10705081', '不锈钢杆', '121', '10705', '金属构件', '根', '1.2m*2.5m', '', '', '1', '管理员', '2022-01-23 10:33:17', null);
INSERT INTO `dtoa_material` VALUES ('2717', '30201026', '铁隔离护栏', '46', '30201', '安全设备', '套', '400cm*180cm', '', '', '1', '管理员', '2022-01-23 10:34:50', null);
INSERT INTO `dtoa_material` VALUES ('2718', '30202103', '广告布标牌', '47', '30202', '文明施工', '块', '400*50cm', '', '', '1', '管理员', '2022-01-23 10:36:19', null);
INSERT INTO `dtoa_material` VALUES ('2719', '30202104', '广告布标牌', '47', '30202', '文明施工', '块', '120*120cm', '', '', '1', '管理员', '2022-01-23 10:37:18', null);
INSERT INTO `dtoa_material` VALUES ('2720', '30202105', '广告布标牌', '47', '30202', '文明施工', '块', '676*113cm', '', '', '1', '管理员', '2022-01-23 10:37:36', null);
INSERT INTO `dtoa_material` VALUES ('2721', '30202106', '广告布标牌', '47', '30202', '文明施工', '块', '450*50cm', '', '', '1', '管理员', '2022-01-23 10:38:45', null);
INSERT INTO `dtoa_material` VALUES ('2722', '30202107', '广告布标牌', '47', '30202', '文明施工', '块', '180*180cm', '', '', '1', '管理员', '2022-01-23 10:39:12', null);
INSERT INTO `dtoa_material` VALUES ('2723', '30202108', '广告布标牌', '47', '30202', '文明施工', '套', '320*70cm', '', '', '1', '管理员', '2022-01-23 10:39:30', null);
INSERT INTO `dtoa_material` VALUES ('2724', '30202109', '广告布标牌', '47', '30202', '文明施工', '块', '560*120cm', '', '', '1', '管理员', '2022-01-23 10:40:02', null);
INSERT INTO `dtoa_material` VALUES ('2725', '30202110', '广告布标牌', '47', '30202', '文明施工', '块', '200*200cm', '', '', '1', '管理员', '2022-01-23 10:40:31', null);
INSERT INTO `dtoa_material` VALUES ('2726', '30202111', '广告布标牌', '47', '30202', '文明施工', '块', '680*120cm', '', '', '1', '管理员', '2022-01-23 10:40:54', null);
INSERT INTO `dtoa_material` VALUES ('2727', '30202112', '铝塑板展示平台', '47', '30202', '文明施工', '个', '180*300cm', '', '', '1', '管理员', '2022-01-23 10:41:28', null);
INSERT INTO `dtoa_material` VALUES ('2728', '30202113', '广告布标牌', '47', '30202', '文明施工', '套', '200*60cm', '', '', '1', '管理员', '2022-01-23 10:43:40', null);
INSERT INTO `dtoa_material` VALUES ('2729', '30202114', '广告布标牌', '47', '30202', '文明施工', '套', '615*40cm', '', '', '1', '管理员', '2022-01-23 10:44:11', null);
INSERT INTO `dtoa_material` VALUES ('2730', '30202115', '广告布标牌', '47', '30202', '文明施工', '套', '450*30cm', '', '', '1', '管理员', '2022-01-23 10:44:32', null);
INSERT INTO `dtoa_material` VALUES ('2731', '30202116', '广告布标牌', '47', '30202', '文明施工', '套', '330*30cm', '', '', '1', '管理员', '2022-01-23 10:44:54', null);
INSERT INTO `dtoa_material` VALUES ('2732', '30202117', '广告布标牌', '47', '30202', '文明施工', '个', '205*70cm', '', '', '1', '管理员', '2022-01-23 10:45:18', null);
INSERT INTO `dtoa_material` VALUES ('2733', '30202118', '广告布标牌', '47', '30202', '文明施工', '块', '10800*60cm', '', '', '1', '管理员', '2022-01-23 10:46:01', null);
INSERT INTO `dtoa_material` VALUES ('2734', '30202119', '防水防晒贴纸', '47', '30202', '文明施工', '条', '100*10cm', '', '', '1', '管理员', '2022-01-23 10:46:43', null);
INSERT INTO `dtoa_material` VALUES ('2735', '30202120', 'PVC文字板', '47', '30202', '文明施工', '个', '180*300cm', '', '', '1', '管理员', '2022-01-23 10:48:05', null);
INSERT INTO `dtoa_material` VALUES ('2736', '30201027', '铁围挡', '46', '30201', '安全设备', '㎡', '770*410cm', '', '', '1', '管理员', '2022-01-23 10:48:45', null);
INSERT INTO `dtoa_material` VALUES ('2737', '30202121', '铝塑板标识牌', '47', '30202', '文明施工', '块', '40*70cm', '', '', '1', '管理员', '2022-01-23 10:49:25', null);
INSERT INTO `dtoa_material` VALUES ('2738', '30202122', 'PVC标识牌带架子', '47', '30202', '文明施工', '块', '60*90cm', '', '', '1', '管理员', '2022-01-23 10:50:13', '2022-01-23 11:00:55');
INSERT INTO `dtoa_material` VALUES ('2739', '30202123', 'PVC标识牌', '47', '30202', '文明施工', '块', '50*80cm', '', '', '1', '管理员', '2022-01-23 11:00:56', null);
INSERT INTO `dtoa_material` VALUES ('2740', '30202124', 'PVC标识牌', '47', '30202', '文明施工', '块', '30*45cm', '', '', '1', '管理员', '2022-01-23 11:01:22', null);
INSERT INTO `dtoa_material` VALUES ('2741', '30202125', 'PVC标识牌', '47', '30202', '文明施工', '块', '115*80cm', '', '', '1', '管理员', '2022-01-23 11:01:49', null);
INSERT INTO `dtoa_material` VALUES ('2742', '30202126', 'PVC标识牌', '47', '30202', '文明施工', '块', '120*120cm', '', '', '1', '管理员', '2022-01-23 11:02:32', null);
INSERT INTO `dtoa_material` VALUES ('2743', '30202127', 'PVC标识牌', '47', '30202', '文明施工', '块', '120*80cm', '', '', '1', '管理员', '2022-01-23 11:02:52', null);
INSERT INTO `dtoa_material` VALUES ('2744', '30202128', 'PVC标识牌', '47', '30202', '文明施工', '块', '40*20cm', '', '', '1', '管理员', '2022-01-23 11:03:34', null);
INSERT INTO `dtoa_material` VALUES ('2745', '30202129', 'PVC标识牌', '47', '30202', '文明施工', '块', '30*45cm', '', '', '1', '管理员', '2022-01-23 11:04:14', null);
INSERT INTO `dtoa_material` VALUES ('2746', '30202130', 'PVC标识牌', '47', '30202', '文明施工', '块', '120*80cm', '', '', '1', '管理员', '2022-01-23 11:05:27', null);
INSERT INTO `dtoa_material` VALUES ('2747', '30202131', 'PVC标识牌', '47', '30202', '文明施工', '块', '40*20cm', '', '', '1', '管理员', '2022-01-23 11:05:43', null);
INSERT INTO `dtoa_material` VALUES ('2748', '30202132', '广告布标牌', '47', '30202', '文明施工', '条', '300*30cm', '', '', '1', '管理员', '2022-01-24 08:03:49', null);
INSERT INTO `dtoa_material` VALUES ('2749', '10802030', '中性硅酮结构胶', '117', '10802', '化工产品', '支', '590ml', '', '', '1', '管理员', '2022-01-24 14:48:50', null);
INSERT INTO `dtoa_material` VALUES ('2750', '10405013', '粘结砂浆', '103', '10405', '砂浆', '吨', 'M10', '', '', '1', '管理员', '2022-01-24 14:50:03', null);
INSERT INTO `dtoa_material` VALUES ('2751', '10902036', 'B1挤塑板', '128', '10902', '保温材料', '方', 'B1级6cm/30kg', '', '', '1', '管理员', '2022-01-24 14:56:07', null);
INSERT INTO `dtoa_material` VALUES ('2752', '10503011', '玻纤网格布', '134', '10503', '小型材料', '卷', '1m*95m', '', '', '1', '管理员', '2022-01-24 14:58:49', null);
INSERT INTO `dtoa_material` VALUES ('2754', '11001067', '防爆挠性连接管', '59', '11001', '管线敷设', '根', 'DN50*1000', '', '', '1', '管理员', '2022-03-20 09:05:25', null);
INSERT INTO `dtoa_material` VALUES ('2755', '11111007', '铝塑管外丝弯头', '130', '11111', '铝塑管材管件', '个', '25*20', '铜', '', '1', '管理员', '2022-03-29 14:53:56', null);
INSERT INTO `dtoa_material` VALUES ('2756', '11111008', '铝塑管外丝弯头', '130', '11111', '铝塑管材管件', '个', '20*15', '铜', '', '1', '管理员', '2022-03-29 14:55:43', null);
INSERT INTO `dtoa_material` VALUES ('2757', '11111009', '铝塑管直接', '130', '11111', '铝塑管材管件', '个', '25*20', '铜', '', '1', '管理员', '2022-03-29 14:56:04', null);
INSERT INTO `dtoa_material` VALUES ('2758', '112145', '墨斗', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2022-04-01 10:41:46', null);
INSERT INTO `dtoa_material` VALUES ('2759', '112146', '墨汁', '41', '112', '低值易耗品', '瓶', '', '', '', '9', '董满仓', '2022-04-01 10:43:04', null);
INSERT INTO `dtoa_material` VALUES ('2760', '11007093', 'YJV电缆', '114', '11007', '电线电缆', '米', '3*35+2*16', '', '', '9', '董满仓', '2022-04-12 09:24:52', null);
INSERT INTO `dtoa_material` VALUES ('2761', '10704011', '热熔模具', '120', '10704', '五金设备配件', '个', '110', '', '', '9', '董满仓', '2022-04-17 08:52:21', null);
INSERT INTO `dtoa_material` VALUES ('2762', '11117038', 'PE抱箍', '152', '11117', 'PE管材管件', '个', '110*20', '', '', '9', '董满仓', '2022-04-17 09:02:24', null);
INSERT INTO `dtoa_material` VALUES ('2763', '11117039', 'PE抱箍', '152', '11117', 'PE管材管件', '个', '110*25', '', '', '9', '董满仓', '2022-04-17 09:03:36', null);
INSERT INTO `dtoa_material` VALUES ('2764', '11117040', 'PE抱箍', '152', '11117', 'PE管材管件', '个', '110*50', '', '', '9', '董满仓', '2022-04-17 09:03:49', null);
INSERT INTO `dtoa_material` VALUES ('2765', '11102096', '铜球阀', '93', '11102', '控水主材', '个', 'DN32', '', '', '9', '董满仓', '2022-04-17 09:04:02', null);
INSERT INTO `dtoa_material` VALUES ('2766', '11115033', '沟槽机械大小头', '147', '11115', '沟槽管件', '个', '100*25', '', '', '9', '董满仓', '2022-04-17 09:05:13', null);
INSERT INTO `dtoa_material` VALUES ('2767', '10701200', '膨胀螺栓', '90', '10701', '五金材料', '个', '14*120', '', '', '9', '董满仓', '2022-04-17 09:08:46', null);
INSERT INTO `dtoa_material` VALUES ('2768', '10702041', '电子秤', '118', '10702', '五金工具', '个', '', '', '', '9', '董满仓', '2022-04-17 09:09:50', null);
INSERT INTO `dtoa_material` VALUES ('2769', '11105078', 'PPR内丝活接', '107', '11105', 'PPR管材管件', '个', '20*1/2', '', '', '9', '董满仓', '2022-04-17 09:10:27', null);
INSERT INTO `dtoa_material` VALUES ('2770', '11109072', '不锈钢喉箍', '122', '11109', '水暖辅材', '个', '65', '', '', '9', '董满仓', '2022-04-17 09:11:39', null);
INSERT INTO `dtoa_material` VALUES ('2771', '10701201', '筛底', '90', '10701', '五金材料', '片', '1米*2米', '', '', '9', '董满仓', '2022-04-17 09:12:15', null);
INSERT INTO `dtoa_material` VALUES ('2772', '112147', '彩色粉笔', '41', '112', '低值易耗品', '盒', '', '', '', '9', '董满仓', '2022-04-17 09:13:00', null);
INSERT INTO `dtoa_material` VALUES ('2773', '112148', '食品袋', '41', '112', '低值易耗品', '个', '22cm', '', '', '9', '董满仓', '2022-04-17 09:13:55', null);
INSERT INTO `dtoa_material` VALUES ('2774', '112149', '食品袋', '41', '112', '低值易耗品', '个', '34cm', '', '', '9', '董满仓', '2022-04-17 09:14:31', null);
INSERT INTO `dtoa_material` VALUES ('2775', '112150', '食品袋', '41', '112', '低值易耗品', '个', '48cm', '', '', '9', '董满仓', '2022-04-17 09:14:46', null);
INSERT INTO `dtoa_material` VALUES ('2776', '11110100', 'PVC消音TY四通', '129', '11110', 'PVC管材管件', '个', 'Φ110', '', '', '9', '董满仓', '2022-04-17 09:15:02', null);
INSERT INTO `dtoa_material` VALUES ('2777', '11110101', 'PVC消音平行四通', '129', '11110', 'PVC管材管件', '个', 'Φ110', '', '', '9', '董满仓', '2022-04-17 09:16:24', null);
INSERT INTO `dtoa_material` VALUES ('2778', '11110102', 'PVC透气帽', '129', '11110', 'PVC管材管件', '个', 'Φ72', '', '', '9', '董满仓', '2022-04-17 09:17:03', null);
INSERT INTO `dtoa_material` VALUES ('2779', '11110103', 'PVC伸缩节', '129', '11110', 'PVC管材管件', '个', 'Φ75', '', '', '9', '董满仓', '2022-04-17 09:17:33', null);
INSERT INTO `dtoa_material` VALUES ('2780', '11110104', 'PVC止水环', '129', '11110', 'PVC管材管件', '个', 'Φ50', '', '', '9', '董满仓', '2022-04-17 09:17:50', null);
INSERT INTO `dtoa_material` VALUES ('2781', '11117041', 'PE增节口', '152', '11117', 'PE管材管件', '个', '100*32', '', '', '9', '董满仓', '2022-04-17 09:18:39', null);
INSERT INTO `dtoa_material` VALUES ('2782', '11002101', '接地编织线', '91', '11002', '电气辅材', '根', '4mm²*30cm', '', '', '9', '董满仓', '2022-04-17 09:32:37', null);
INSERT INTO `dtoa_material` VALUES ('2783', '11002102', '扁铁避雷卡子', '91', '11002', '电气辅材', '个', '40*2.5*400mm', '', '', '9', '董满仓', '2022-04-17 09:38:40', null);
INSERT INTO `dtoa_material` VALUES ('2784', '10902037', '钢网憎水岩棉板', '128', '10902', '保温材料', '块', '1m*60cm*10cm', '', '', '9', '董满仓', '2022-04-17 09:46:25', null);
INSERT INTO `dtoa_material` VALUES ('2785', '11105079', 'PPR中水管', '107', '11105', 'PPR管材管件', '米', '20*2.3厚', '', '', '9', '董满仓', '2022-04-18 08:26:15', null);
INSERT INTO `dtoa_material` VALUES ('2786', '11105080', 'PPR中水管', '107', '11105', 'PPR管材管件', '米', '25*2.8厚', '', '', '9', '董满仓', '2022-04-18 08:27:09', null);
INSERT INTO `dtoa_material` VALUES ('2787', '11105081', 'PPR异径三通', '107', '11105', 'PPR管材管件', '个', '32*20', '', '', '9', '董满仓', '2022-04-18 08:27:28', null);
INSERT INTO `dtoa_material` VALUES ('2788', '11105082', 'PPR变径', '107', '11105', 'PPR管材管件', '个', '32*25', '', '', '9', '董满仓', '2022-04-18 08:27:56', null);
INSERT INTO `dtoa_material` VALUES ('2789', '11105083', 'PPR丝堵', '107', '11105', 'PPR管材管件', '个', '15', 'PPR', '', '9', '董满仓', '2022-04-18 08:28:18', '2022-04-18 08:29:04');
INSERT INTO `dtoa_material` VALUES ('2790', '11103046', '镀锌衬塑管箍', '94', '11103', '镀锌衬塑管件', '个', 'DN25*20', '', '', '9', '董满仓', '2022-04-18 08:29:04', null);
INSERT INTO `dtoa_material` VALUES ('2793', '11103047', '镀锌衬塑对丝', '94', '11103', '镀锌衬塑管件', '个', 'DN25', '', '', '9', '董满仓', '2022-04-18 08:33:16', null);
INSERT INTO `dtoa_material` VALUES ('2794', '11103048', '镀锌衬塑三通', '94', '11103', '镀锌衬塑管件', '个', 'DN25*20', '', '', '9', '董满仓', '2022-04-18 08:34:35', null);
INSERT INTO `dtoa_material` VALUES ('2795', '11103049', '镀锌衬塑三通', '94', '11103', '镀锌衬塑管件', '个', 'DN32*20', '', '', '9', '董满仓', '2022-04-18 08:36:17', null);
INSERT INTO `dtoa_material` VALUES ('2796', '11103050', '镀锌衬塑管箍', '94', '11103', '镀锌衬塑管件', '个', 'DN20', '', '', '9', '董满仓', '2022-04-18 08:36:45', null);
INSERT INTO `dtoa_material` VALUES ('2798', '11101105', '镀锌弯头', '92', '11101', '镀锌管件', '个', 'DN15*90°', '', '', '9', '董满仓', '2022-04-18 08:40:12', null);
INSERT INTO `dtoa_material` VALUES ('2799', '11101106', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN32*15', '', '', '9', '董满仓', '2022-04-18 08:41:09', null);
INSERT INTO `dtoa_material` VALUES ('2800', '11101107', '镀锌三通', '92', '11101', '镀锌管件', '个', 'DN80*15', '', '', '9', '董满仓', '2022-04-18 08:41:42', null);
INSERT INTO `dtoa_material` VALUES ('2801', '11109073', '可曲挠软接头', '122', '11109', '水暖辅材', '个', 'DN80', '法兰橡胶', '', '9', '董满仓', '2022-04-18 08:42:07', null);
INSERT INTO `dtoa_material` VALUES ('2802', '11115034', '沟槽大小头', '147', '11115', '沟槽管件', '个', 'DN80*50', '', '', '9', '董满仓', '2022-04-18 08:45:37', null);
INSERT INTO `dtoa_material` VALUES ('2803', '11101108', '镀锌管箍', '92', '11101', '镀锌管件', '个', 'DN15', '', '', '9', '董满仓', '2022-04-18 08:50:23', null);
INSERT INTO `dtoa_material` VALUES ('2804', '11102097', '自动排气阀', '93', '11102', '控水主材', '个', 'DN15', '铜', '', '9', '董满仓', '2022-04-18 08:50:54', null);
INSERT INTO `dtoa_material` VALUES ('2805', '11109074', 'A型法兰盘', '122', '11109', '水暖辅材', '片', 'DN100', '', '', '9', '董满仓', '2022-04-18 08:52:05', '2022-04-18 11:25:49');
INSERT INTO `dtoa_material` VALUES ('2806', '11109075', 'A型法兰盘', '122', '11109', '水暖辅材', '片', 'DN150', '', '', '9', '董满仓', '2022-04-18 09:39:37', '2022-04-18 11:25:56');
INSERT INTO `dtoa_material` VALUES ('2807', '11107078', 'A型铸铁排水管', '109', '11107', '球墨管材管件', '根', '150*1.5m', '', '', '9', '董满仓', '2022-04-18 09:39:58', null);
INSERT INTO `dtoa_material` VALUES ('2808', '11107079', 'W型铸铁排水管', '109', '11107', '球墨管材管件', '米', '150', '', '', '9', '董满仓', '2022-04-18 09:44:26', null);
INSERT INTO `dtoa_material` VALUES ('2809', '11107080', 'W型铸铁排水管', '109', '11107', '球墨管材管件', '米', '100', '', '', '9', '董满仓', '2022-04-18 09:48:21', null);
INSERT INTO `dtoa_material` VALUES ('2810', '11107081', 'W型铸铁排水管', '109', '11107', '球墨管材管件', '米', '75', '', '', '9', '董满仓', '2022-04-18 09:48:36', null);
INSERT INTO `dtoa_material` VALUES ('2811', '11107082', 'W型顺水三通', '109', '11107', '球墨管材管件', '个', '150*100', '', '', '9', '董满仓', '2022-04-18 09:53:46', null);
INSERT INTO `dtoa_material` VALUES ('2812', '11107083', 'W型顺水三通', '109', '11107', '球墨管材管件', '个', '150', '', '', '9', '董满仓', '2022-04-18 09:55:36', null);
INSERT INTO `dtoa_material` VALUES ('2813', '11107084', 'W型T三通', '109', '11107', '球墨管材管件', '个', '150', '', '', '9', '董满仓', '2022-04-18 09:56:02', null);
INSERT INTO `dtoa_material` VALUES ('2814', '11107085', 'W型Y三通', '109', '11107', '球墨管材管件', '个', '100', '', '', '9', '董满仓', '2022-04-18 09:57:39', null);
INSERT INTO `dtoa_material` VALUES ('2815', '11107086', 'W型同心变径', '109', '11107', '球墨管材管件', '个', '100*50', '', '', '9', '董满仓', '2022-04-18 09:59:15', null);
INSERT INTO `dtoa_material` VALUES ('2816', '11107087', 'W型同心变径', '109', '11107', '球墨管材管件', '个', '150*100', '', '', '9', '董满仓', '2022-04-18 10:00:39', '2022-04-18 10:01:03');
INSERT INTO `dtoa_material` VALUES ('2817', '11107088', 'W型铸铁弯头', '109', '11107', '球墨管材管件', '个', '150双45°', '', '', '9', '董满仓', '2022-04-18 10:01:04', null);
INSERT INTO `dtoa_material` VALUES ('2818', '11107089', 'W型铸铁清扫口', '109', '11107', '球墨管材管件', '个', '150', '', '', '9', '董满仓', '2022-04-18 10:23:46', '2022-04-18 10:26:39');
INSERT INTO `dtoa_material` VALUES ('2819', '11107090', 'W型铜盖地平清扫口', '109', '11107', '球墨管材管件', '个', '150', '', '', '9', '董满仓', '2022-04-18 10:26:39', null);
INSERT INTO `dtoa_material` VALUES ('2820', '11107091', 'W型铜盖地平清扫口', '109', '11107', '球墨管材管件', '个', '100', '', '', '9', '董满仓', '2022-04-18 10:28:31', null);
INSERT INTO `dtoa_material` VALUES ('2821', '11107092', 'W型铜盖地平清扫口', '109', '11107', '球墨管材管件', '个', '75', '', '', '9', '董满仓', '2022-04-18 10:28:47', null);
INSERT INTO `dtoa_material` VALUES ('2822', '11107093', 'W型铸铁T型三通', '109', '11107', '球墨管材管件', '个', '75*50', '', '', '9', '董满仓', '2022-04-18 10:29:00', null);
INSERT INTO `dtoa_material` VALUES ('2823', '11107094', 'W型铸铁顺水三通', '109', '11107', '球墨管材管件', '个', '75*50', '', '', '9', '董满仓', '2022-04-18 10:30:20', null);
INSERT INTO `dtoa_material` VALUES ('2824', '11107095', 'W型管不锈钢卡箍', '109', '11107', '球墨管材管件', '个', 'DN150', '', '', '9', '董满仓', '2022-04-18 10:32:12', null);
INSERT INTO `dtoa_material` VALUES ('2825', '11107096', 'W型管不锈钢卡箍', '109', '11107', '球墨管材管件', '个', '100*75', '', '', '9', '董满仓', '2022-04-18 10:32:53', null);
INSERT INTO `dtoa_material` VALUES ('2826', '11107097', 'W型管不锈钢卡箍', '109', '11107', '球墨管材管件', '个', '75*50', '', '', '9', '董满仓', '2022-04-18 10:58:48', null);
INSERT INTO `dtoa_material` VALUES ('2827', '11102098', '铜截止阀', '93', '11102', '控水主材', '个', 'DN15', '', '', '9', '董满仓', '2022-04-18 10:59:06', null);
INSERT INTO `dtoa_material` VALUES ('2828', '11107098', 'A型铸铁排水管', '109', '11107', '球墨管材管件', '根', '150*1m', '', '', '9', '董满仓', '2022-04-18 11:10:43', null);
INSERT INTO `dtoa_material` VALUES ('2829', '11107099', 'A型铸铁排水管', '109', '11107', '球墨管材管件', '根', '150*0.5m', '', '', '9', '董满仓', '2022-04-18 11:11:39', null);
INSERT INTO `dtoa_material` VALUES ('2830', '11107100', 'A型铸铁排水管', '109', '11107', '球墨管材管件', '根', '75*1m', '', '', '9', '董满仓', '2022-04-18 11:12:35', null);
INSERT INTO `dtoa_material` VALUES ('2831', '11107101', 'A型铸铁排水管', '109', '11107', '球墨管材管件', '根', '75*0.5m', '', '', '9', '董满仓', '2022-04-18 11:13:21', null);
INSERT INTO `dtoa_material` VALUES ('2832', '11107102', 'W型铸铁排水管', '109', '11107', '球墨管材管件', '米', 'DN50', '', '', '9', '董满仓', '2022-04-18 11:13:50', '2022-04-18 11:14:47');
INSERT INTO `dtoa_material` VALUES ('2833', '11107103', 'A型铸铁TY三通', '109', '11107', '球墨管材管件', '个', '150*100', '', '', '9', '董满仓', '2022-04-18 11:14:48', null);
INSERT INTO `dtoa_material` VALUES ('2834', '11107104', 'A型铸铁TY三通', '109', '11107', '球墨管材管件', '个', '150*50', '', '', '9', '董满仓', '2022-04-18 11:15:46', null);
INSERT INTO `dtoa_material` VALUES ('2835', '11107105', 'A型铸铁TY三通', '109', '11107', '球墨管材管件', '个', '75*50', '', '', '9', '董满仓', '2022-04-18 11:16:11', null);
INSERT INTO `dtoa_material` VALUES ('2836', '11107106', 'A型铸铁Y四通', '109', '11107', '球墨管材管件', '个', '100', '', '', '9', '董满仓', '2022-04-18 11:16:35', null);
INSERT INTO `dtoa_material` VALUES ('2837', '11107107', 'A型铸铁变径大小头', '109', '11107', '球墨管材管件', '个', '150*100', '', '', '9', '董满仓', '2022-04-18 11:17:05', null);
INSERT INTO `dtoa_material` VALUES ('2838', '11107108', 'A型铸铁变径大小头', '109', '11107', '球墨管材管件', '个', '100*75', '', '', '9', '董满仓', '2022-04-18 11:18:58', null);
INSERT INTO `dtoa_material` VALUES ('2839', '11107109', 'A型铸铁变径大小头', '109', '11107', '球墨管材管件', '个', '75*50', '', '', '9', '董满仓', '2022-04-18 11:19:23', null);
INSERT INTO `dtoa_material` VALUES ('2840', '11107110', 'A型铸铁P型反水弯', '109', '11107', '球墨管材管件', '个', '50', '', '', '9', '董满仓', '2022-04-18 11:19:40', null);
INSERT INTO `dtoa_material` VALUES ('2841', '11107111', 'A型铸铁弯头', '109', '11107', '球墨管材管件', '个', '100*45°', '', '', '9', '董满仓', '2022-04-18 11:21:14', null);
INSERT INTO `dtoa_material` VALUES ('2842', '11107112', 'A型铸铁弯头', '109', '11107', '球墨管材管件', '个', '150*45°', '', '', '9', '董满仓', '2022-04-18 11:21:57', null);
INSERT INTO `dtoa_material` VALUES ('2843', '11107113', 'A型铸铁透气帽', '109', '11107', '球墨管材管件', '个', '100', '', '', '9', '董满仓', '2022-04-18 11:22:21', null);
INSERT INTO `dtoa_material` VALUES ('2844', '11109076', 'A型法兰盘', '122', '11109', '水暖辅材', '片', 'DN75', '', '', '9', '董满仓', '2022-04-18 11:25:57', null);
INSERT INTO `dtoa_material` VALUES ('2845', '11101109', '吊环卡', '92', '11101', '镀锌管件', '个', 'DN25', '', '', '9', '董满仓', '2022-04-18 11:26:49', null);
INSERT INTO `dtoa_material` VALUES ('2846', '11107114', 'W型铸铁盲堵', '109', '11107', '球墨管材管件', '个', 'DN150', '', '', '9', '董满仓', '2022-04-18 16:24:09', '2022-04-18 16:25:17');
INSERT INTO `dtoa_material` VALUES ('2847', '11107115', 'A型铸铁弯头', '109', '11107', '球墨管材管件', '个', 'DN100双45°', '', '', '9', '董满仓', '2022-04-18 16:25:18', null);
INSERT INTO `dtoa_material` VALUES ('2848', '11107116', 'A型铸铁弯头', '109', '11107', '球墨管材管件', '个', 'DN75双45°', '', '', '9', '董满仓', '2022-04-18 16:27:24', null);
INSERT INTO `dtoa_material` VALUES ('2849', '11107117', 'A型铸铁弯头', '109', '11107', '球墨管材管件', '个', 'DN50双45°', '', '', '9', '董满仓', '2022-04-18 16:27:42', null);
INSERT INTO `dtoa_material` VALUES ('2850', '11109077', 'A型法兰盘', '122', '11109', '水暖辅材', '片', 'DN50', '', '', '9', '董满仓', '2022-04-18 16:28:03', null);
INSERT INTO `dtoa_material` VALUES ('2851', '11107118', '铸铁方雨水口', '109', '11107', '球墨管材管件', '个', '370墙', '', '', '9', '董满仓', '2022-04-18 16:28:38', '2022-04-18 16:29:45');
INSERT INTO `dtoa_material` VALUES ('2852', '10701202', '直螺纹套筒', '90', '10701', '五金材料', '个', '25变16', '', '', '9', '董满仓', '2022-04-18 16:29:45', null);
INSERT INTO `dtoa_material` VALUES ('2853', '10701203', '直螺纹套筒', '90', '10701', '五金材料', '个', '25变20', '', '', '9', '董满仓', '2022-04-18 16:30:59', null);
INSERT INTO `dtoa_material` VALUES ('2854', '11003139', '低压变压器箱', '105', '11003', '电箱', '台', '500*700*500', '', '', '9', '董满仓', '2022-04-18 16:31:34', null);
INSERT INTO `dtoa_material` VALUES ('2855', '112151', '毒饵站', '41', '112', '低值易耗品', '个', '', '', '', '9', '董满仓', '2022-04-18 16:32:36', null);
INSERT INTO `dtoa_material` VALUES ('2856', '11001068', 'PVC方盒', '59', '11001', '管线敷设', '个', '86H60-20孔', '', '', '9', '董满仓', '2022-04-19 10:03:11', null);
INSERT INTO `dtoa_material` VALUES ('2857', '11001069', 'PVC方盒', '59', '11001', '管线敷设', '个', '86H60-25孔', '', '', '9', '董满仓', '2022-04-19 10:04:50', null);
INSERT INTO `dtoa_material` VALUES ('2858', '30301077', '空调挂机', '156', '30301', '临建周转设备', '台', 'KFR-35GW/(35563)FNhAa-B3JY01', '', '', '9', '董满仓', '2022-06-10 15:05:24', null);
INSERT INTO `dtoa_material` VALUES ('2859', '10505001', '水泥平板瓦', '172', '10505', '瓦', '片', '420mm*330mm', '', '', '9', '董满仓', '2022-06-10 15:10:02', null);
INSERT INTO `dtoa_material` VALUES ('2860', '10505002', '水泥脊瓦', '172', '10505', '瓦', '片', '330mm*255mm', '', '', '9', '董满仓', '2022-06-10 15:10:37', null);
INSERT INTO `dtoa_material` VALUES ('2861', '10505003', '水泥沟瓦', '172', '10505', '瓦', '片', '380mm*300mm', '', '', '9', '董满仓', '2022-06-10 15:11:02', null);
INSERT INTO `dtoa_material` VALUES ('2862', '10505004', '水泥瓦斜封头', '172', '10505', '瓦', '片', '330mm*255mm', '', '', '9', '董满仓', '2022-06-10 15:11:50', null);
INSERT INTO `dtoa_material` VALUES ('2863', '10505005', '水泥二通瓦', '172', '10505', '瓦', '片', '330mm*330mm', '', '', '9', '董满仓', '2022-06-10 15:12:32', null);
INSERT INTO `dtoa_material` VALUES ('2864', '10505006', '水泥三通瓦', '172', '10505', '瓦', '片', '210mm*180mm*180mm', '', '', '9', '董满仓', '2022-06-10 15:16:42', null);
INSERT INTO `dtoa_material` VALUES ('2865', '219001', '预拌砂浆', '173', '219', '砂浆', 'm³', 'M5', '', '', '9', '董满仓', '2022-06-10 15:20:39', null);
INSERT INTO `dtoa_material` VALUES ('2866', '219002', '预拌砂浆', '173', '219', '砂浆', 'm³', 'M7.5', '', '', '9', '董满仓', '2022-06-10 15:21:16', null);
INSERT INTO `dtoa_material` VALUES ('2867', '219003', '预拌砂浆', '173', '219', '砂浆', 'm³', 'M10', '', '', '9', '董满仓', '2022-06-10 15:21:35', null);
INSERT INTO `dtoa_material` VALUES ('2868', '10502006', '蒙古黑火烧板', '127', '10502', '石材', '米', '宽400*50', '', '', '1', '管理员', '2022-06-20 15:23:34', null);
INSERT INTO `dtoa_material` VALUES ('2869', '10502007', '吉林白麻火烧板', '127', '10502', '石材', '㎡', '600*400*30', '', '', '1', '管理员', '2022-06-20 15:24:47', null);
INSERT INTO `dtoa_material` VALUES ('2870', '10405014', '地面砂浆', '103', '10405', '砂浆', '吨', 'M15', '', '', '1', '管理员', '2022-07-13 16:27:38', null);
INSERT INTO `dtoa_material` VALUES ('2871', '10405015', '砌块专用粘接剂', '103', '10405', '砂浆', '吨', 'M7.5', '', '', '1', '管理员', '2022-07-13 16:28:52', null);
INSERT INTO `dtoa_material` VALUES ('2873', '10405016', 'SF憎水膨珠保温砂浆', '103', '10405', '砂浆', 'm³', '', '', '', '1', '管理员', '2022-07-13 16:31:51', null);
INSERT INTO `dtoa_material` VALUES ('2874', '10405017', '玻化微珠保温砂浆', '103', '10405', '砂浆', 'm³', '', '', '', '1', '管理员', '2022-07-13 16:32:40', null);
INSERT INTO `dtoa_material` VALUES ('2875', '10802031', '界面剂', '117', '10802', '化工产品', '吨', '40KG/袋', '', '', '1', '管理员', '2022-07-13 16:33:16', null);
INSERT INTO `dtoa_material` VALUES ('2876', '502035', '三层集装箱移动房租赁', '76', '502', '设备租赁', '月', '3*6*2.65*18间', '', '', '9', '董满仓', '2022-07-13 17:09:59', null);
INSERT INTO `dtoa_material` VALUES ('2877', '502036', '单层集装箱移动房租赁', '76', '502', '设备租赁', '年', '3*6*2.65*13间', '', '', '9', '董满仓', '2022-07-13 17:11:58', null);
INSERT INTO `dtoa_material` VALUES ('2878', '10901018', '遮阳网', '123', '10901', '橡塑制品', '米', '4米宽', '', '', '9', '董满仓', '2022-07-13 17:14:15', null);
INSERT INTO `dtoa_material` VALUES ('2879', '11007094', '平行铜线', '114', '11007', '电线电缆', '米', '2*6mm²', '', '', '9', '董满仓', '2022-07-13 17:18:36', null);
INSERT INTO `dtoa_material` VALUES ('2880', '30301078', '集成房屋标准箱', '156', '30301', '临建周转设备', '套', '5990*2990*2870', '', '', '9', '董满仓', '2022-08-01 14:42:28', null);
INSERT INTO `dtoa_material` VALUES ('2881', '30301079', '集成房屋卫生间', '156', '30301', '临建周转设备', '套', '5990*2990*2870', '', '', '9', '董满仓', '2022-08-01 14:47:55', null);
INSERT INTO `dtoa_material` VALUES ('2882', '30301080', '集成房屋厨房间', '156', '30301', '临建周转设备', '套', '5990*2990*2870', '', '', '9', '董满仓', '2022-08-01 14:48:27', '2022-08-01 14:49:19');
INSERT INTO `dtoa_material` VALUES ('2883', '30301081', '集成房屋外置楼梯', '156', '30301', '临建周转设备', '套', '', '', '', '9', '董满仓', '2022-08-01 14:49:19', null);
INSERT INTO `dtoa_material` VALUES ('2884', '30301082', '集成房屋外置走廊', '156', '30301', '临建周转设备', '套', '1000*3000', '', '', '9', '董满仓', '2022-08-01 14:50:18', null);
INSERT INTO `dtoa_material` VALUES ('2885', '30301083', '彩钢板房屋', '156', '30301', '临建周转设备', '㎡', '5cm墙板、7.5cm顶板', '', '岩棉彩钢、4*6、4*8方管骨架', '9', '董满仓', '2022-08-01 15:00:59', null);
INSERT INTO `dtoa_material` VALUES ('2886', '30301084', '彩钢厕所', '156', '30301', '临建周转设备', '㎡', '单层铁皮、4*6、4*8方管', '', '', '9', '董满仓', '2022-08-01 15:21:07', null);
INSERT INTO `dtoa_material` VALUES ('2887', '10901019', '广告宝丽布', '123', '10901', '橡塑制品', '㎡', '', '', '', '9', '董满仓', '2022-08-04 15:16:57', null);
INSERT INTO `dtoa_material` VALUES ('2888', '10901020', 'PVC字', '123', '10901', '橡塑制品', '套', '1.2m*1m*4', '', '', '9', '董满仓', '2022-08-04 15:18:07', null);
INSERT INTO `dtoa_material` VALUES ('2889', '11110105', 'PVC顺水三通', '129', '11110', 'PVC管材管件', '个', 'Φ160*50', '', '', '9', '董满仓', '2022-08-29 16:05:36', null);
INSERT INTO `dtoa_material` VALUES ('2890', '11110106', 'PVC吸盘吊卡', '129', '11110', 'PVC管材管件', '套', 'Φ160', '', '', '9', '董满仓', '2022-08-29 16:06:33', null);
INSERT INTO `dtoa_material` VALUES ('2891', '11110107', 'PVCY型四通', '129', '11110', 'PVC管材管件', '个', 'Φ160*110', '', '', '9', '董满仓', '2022-08-29 16:07:27', null);
INSERT INTO `dtoa_material` VALUES ('2892', '11110108', 'PVCY型四通', '129', '11110', 'PVC管材管件', '个', 'Φ160', '', '', '9', '董满仓', '2022-08-29 16:08:19', null);
INSERT INTO `dtoa_material` VALUES ('2893', '11110109', 'PVC清扫口', '129', '11110', 'PVC管材管件', '个', 'Φ160', '', '', '9', '董满仓', '2022-08-29 17:25:23', null);
INSERT INTO `dtoa_material` VALUES ('2894', '11110110', 'PVC螺旋消音管', '129', '11110', 'PVC管材管件', '米', 'Φ75', '', '', '9', '董满仓', '2022-08-29 17:25:44', null);
INSERT INTO `dtoa_material` VALUES ('2895', '11110111', 'PVC螺旋消音检查口', '129', '11110', 'PVC管材管件', '个', 'Φ75', '', '', '9', '董满仓', '2022-08-29 17:26:15', null);
INSERT INTO `dtoa_material` VALUES ('2896', '11110112', 'PVC螺旋消音三通', '129', '11110', 'PVC管材管件', '个', 'Φ75*50', '', '', '9', '董满仓', '2022-08-29 17:26:35', null);
INSERT INTO `dtoa_material` VALUES ('2897', '11110113', 'PVC止水环', '129', '11110', 'PVC管材管件', '个', 'Φ75', '', '', '9', '董满仓', '2022-08-29 17:26:59', null);
INSERT INTO `dtoa_material` VALUES ('2898', '1010105007', '镀锌方管', '137', '1010105', '方管', '米', '25*25*1.5', '', '', '9', '董满仓', '2022-08-29 17:27:32', null);
INSERT INTO `dtoa_material` VALUES ('2899', '11002103', '避雷卡子', '91', '11002', '电气辅材', '套', '10*150mm', '', '', '9', '董满仓', '2022-08-29 17:28:21', null);
INSERT INTO `dtoa_material` VALUES ('2900', '11008055', 'USB面板', '115', '11008', '电气设备安装材料', '个', '86系列', '', '', '9', '董满仓', '2022-08-29 17:29:24', null);
INSERT INTO `dtoa_material` VALUES ('2901', '11008056', '漏电测试仪', '115', '11008', '电气设备安装材料', '台', '', '', '', '9', '董满仓', '2022-08-29 17:29:53', null);
INSERT INTO `dtoa_material` VALUES ('2902', '11003140', '手机充电箱', '105', '11003', '电箱', '套', '800*1400*25', '', '', '9', '董满仓', '2022-08-29 17:30:14', null);
INSERT INTO `dtoa_material` VALUES ('2903', '10701204', '镀锌平垫', '90', '10701', '五金材料', '个', 'Φ10', '', '', '9', '董满仓', '2022-08-29 17:30:57', null);
INSERT INTO `dtoa_material` VALUES ('2904', '10701205', '镀锌弹垫', '90', '10701', '五金材料', '个', 'Φ10', '', '', '9', '董满仓', '2022-08-29 17:31:35', null);
INSERT INTO `dtoa_material` VALUES ('2905', '407001', '卸料平台声光预警系统', '174', '407', '其他', '套', '', '', '', '9', '董满仓', '2022-08-29 17:33:36', null);
INSERT INTO `dtoa_material` VALUES ('2906', '11110114', 'PVC伸缩节', '129', '11110', 'PVC管材管件', '个', 'Φ50', '', '', '9', '董满仓', '2022-08-30 08:32:39', null);
INSERT INTO `dtoa_material` VALUES ('2907', '11110115', 'PVC瓶口三通', '129', '11110', 'PVC管材管件', '个', 'Φ110*75', '', '', '9', '董满仓', '2022-08-30 08:33:26', null);
INSERT INTO `dtoa_material` VALUES ('2908', '11110116', 'PVC清扫口', '129', '11110', 'PVC管材管件', '个', 'Φ75', '', '', '9', '董满仓', '2022-08-30 08:34:14', null);
INSERT INTO `dtoa_material` VALUES ('2909', '11003141', '户内弱电布电箱RD', '105', '11003', '电箱', '台', '400*320*160', '', '', '9', '董满仓', '2022-08-30 08:44:48', null);
INSERT INTO `dtoa_material` VALUES ('2910', '11003142', '电信过路箱T', '105', '11003', '电箱', '台', '300*400*150', '', '', '9', '董满仓', '2022-08-30 08:46:49', null);
INSERT INTO `dtoa_material` VALUES ('2911', '11003143', '电视放大器箱VF', '105', '11003', '电箱', '台', '300*600*150', '', '', '9', '董满仓', '2022-08-30 08:49:12', null);
INSERT INTO `dtoa_material` VALUES ('2912', '11003144', '电视分支分配器箱VP', '105', '11003', '电箱', '台', '300*400*150', '', '', '9', '董满仓', '2022-08-30 08:49:53', null);
INSERT INTO `dtoa_material` VALUES ('2913', '11003145', '等电位箱MEB', '105', '11003', '电箱', '台', '400*300*120', '', '', '9', '董满仓', '2022-08-30 08:50:28', null);
INSERT INTO `dtoa_material` VALUES ('2914', '11003146', '-1AA1配电柜', '105', '11003', '电箱', '台', '600*2200*600', '', '', '9', '董满仓', '2022-08-30 08:52:24', null);
INSERT INTO `dtoa_material` VALUES ('2915', '11003147', '-1AA2配电柜', '105', '11003', '电箱', '台', '600*2200*600', '', '', '9', '董满仓', '2022-08-30 08:57:27', null);
INSERT INTO `dtoa_material` VALUES ('2916', '11003148', '-1AA3配电柜', '105', '11003', '电箱', '台', '800*2200*600', '', '', '9', '董满仓', '2022-08-30 08:57:50', '2022-08-30 09:00:35');
INSERT INTO `dtoa_material` VALUES ('2917', '11003149', '-1AA4配电柜', '105', '11003', '电箱', '台', '800*2200*600', '', '', '9', '董满仓', '2022-08-30 08:59:10', '2022-08-30 09:00:46');
INSERT INTO `dtoa_material` VALUES ('2918', '11003150', '-1AA5配电柜', '105', '11003', '电箱', '台', '800*2200*600', '', '', '9', '董满仓', '2022-08-30 08:59:27', null);
INSERT INTO `dtoa_material` VALUES ('2919', '11003151', '-1AA6配电柜', '105', '11003', '电箱', '台', '800*2200*600', '', '', '9', '董满仓', '2022-08-30 09:00:47', null);
INSERT INTO `dtoa_material` VALUES ('2920', '11003152', '-1AL2配电箱', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2022-08-30 09:01:14', null);
INSERT INTO `dtoa_material` VALUES ('2921', '11003153', '-1AL4配电箱', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2022-08-30 09:02:24', '2022-08-30 09:02:50');
INSERT INTO `dtoa_material` VALUES ('2922', '11003154', '-1AL3配电箱', '105', '11003', '电箱', '台', '400*600*200', '', '', '9', '董满仓', '2022-08-30 09:02:51', null);
INSERT INTO `dtoa_material` VALUES ('2923', '11003155', '-1YJ2~4配电箱', '105', '11003', '电箱', '台', '500*800*250', '', '', '9', '董满仓', '2022-08-30 09:03:13', null);
INSERT INTO `dtoa_material` VALUES ('2924', '11003156', '-1ALE2~4配电箱', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2022-08-30 09:03:42', null);
INSERT INTO `dtoa_material` VALUES ('2925', '11003157', '-1AT2-JF配电箱', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2022-08-30 09:04:01', null);
INSERT INTO `dtoa_material` VALUES ('2926', '11003158', '-1AT4-JF配电箱', '105', '11003', '电箱', '台', '600*1000*200', '', '', '9', '董满仓', '2022-08-30 09:04:30', null);
INSERT INTO `dtoa_material` VALUES ('2927', '11003159', '-1AT3-BF配电箱', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2022-08-30 09:04:51', null);
INSERT INTO `dtoa_material` VALUES ('2928', '11003160', '-1AT2-PY配电箱', '105', '11003', '电箱', '台', '600*1000*200', '', '', '9', '董满仓', '2022-08-30 09:05:09', null);
INSERT INTO `dtoa_material` VALUES ('2929', '11003161', '-1AT3-PY配电箱', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2022-08-30 09:05:40', null);
INSERT INTO `dtoa_material` VALUES ('2930', '11003162', '-1AT4-PY配电箱', '105', '11003', '电箱', '台', '600*900*200', '', '', '9', '董满仓', '2022-08-30 09:05:58', null);
INSERT INTO `dtoa_material` VALUES ('2931', '11003163', '-1AT2-PW配电箱', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2022-08-30 09:06:15', null);
INSERT INTO `dtoa_material` VALUES ('2932', '11003164', '-1AT4-PW配电箱', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2022-08-30 09:06:38', null);
INSERT INTO `dtoa_material` VALUES ('2933', '11003165', '-1AT3-YD配电箱', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2022-08-30 09:07:14', null);
INSERT INTO `dtoa_material` VALUES ('2934', '11003166', '-1AT3-DS配电箱', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2022-08-30 09:07:34', null);
INSERT INTO `dtoa_material` VALUES ('2935', '11003167', '-1AT3-DX配电箱', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2022-08-30 09:07:54', null);
INSERT INTO `dtoa_material` VALUES ('2936', '11003168', '-1AT3-SHS配电箱', '105', '11003', '电箱', '台', '600*900*200', '', '', '9', '董满仓', '2022-08-30 09:08:15', null);
INSERT INTO `dtoa_material` VALUES ('2937', '11003169', '-1AT3-ZS配电箱', '105', '11003', '电箱', '台', '600*900*200', '', '', '9', '董满仓', '2022-08-30 09:08:34', null);
INSERT INTO `dtoa_material` VALUES ('2938', '11003170', '-1AC3-SF,PF配电箱', '105', '11003', '电箱', '台', '400*500*200', '', '', '9', '董满仓', '2022-08-30 09:09:00', null);
INSERT INTO `dtoa_material` VALUES ('2939', '11003171', '1AT-XF配电箱', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2022-08-30 09:09:18', null);
INSERT INTO `dtoa_material` VALUES ('2940', '11003172', '1AT-AF配电箱', '105', '11003', '电箱', '台', '600*900*200', '', '', '9', '董满仓', '2022-08-30 09:09:39', null);
INSERT INTO `dtoa_material` VALUES ('2941', '11003173', '-1AL1-RF配电箱', '105', '11003', '电箱', '台', '600*1000*200', '', '', '9', '董满仓', '2022-08-30 09:09:57', null);
INSERT INTO `dtoa_material` VALUES ('2942', '11003174', '-1AP1-RFS配电箱', '105', '11003', '电箱', '台', '600*900*200', '', '', '9', '董满仓', '2022-08-30 09:10:14', null);
INSERT INTO `dtoa_material` VALUES ('2943', '11003175', '-1AP1-RFP配电箱', '105', '11003', '电箱', '台', '600*500*200', '', '', '9', '董满仓', '2022-08-30 09:10:31', null);
INSERT INTO `dtoa_material` VALUES ('2944', '11003176', '插座箱', '105', '11003', '电箱', '台', '550*350*200', '', '', '9', '董满仓', '2022-08-30 09:10:48', null);
INSERT INTO `dtoa_material` VALUES ('2945', '11003177', '-1AT1-PW配电箱', '105', '11003', '电箱', '台', '600*700*200', '', '', '9', '董满仓', '2022-08-30 09:11:19', null);
INSERT INTO `dtoa_material` VALUES ('2946', '11003178', '-1ALE1-RF配电箱', '105', '11003', '电箱', '台', '800*1800*600', '', '', '9', '董满仓', '2022-08-30 09:11:35', null);
INSERT INTO `dtoa_material` VALUES ('2947', '11003179', '-1AT1-JF配电箱', '105', '11003', '电箱', '台', '600*900*200', '', '', '9', '董满仓', '2022-08-30 09:11:54', null);
INSERT INTO `dtoa_material` VALUES ('2948', '11003180', '-1AT1-PY配电箱', '105', '11003', '电箱', '台', '600*900*200', '', '', '9', '董满仓', '2022-08-30 09:12:12', null);
INSERT INTO `dtoa_material` VALUES ('2949', '11003181', '-1YJ1-RF配电箱', '105', '11003', '电箱', '台', '500*800*250', '', '', '9', '董满仓', '2022-08-30 09:12:29', null);
INSERT INTO `dtoa_material` VALUES ('2950', '11003182', '-1AC1-MBF1,2配电箱', '105', '11003', '电箱', '台', '600*800*200', '', '', '9', '董满仓', '2022-08-30 09:12:45', null);
INSERT INTO `dtoa_material` VALUES ('2951', '11003183', '-2AL1配电箱', '105', '11003', '电箱', '台', '700*900*200', '', '', '9', '董满仓', '2022-08-30 09:13:09', null);
INSERT INTO `dtoa_material` VALUES ('2952', '11003184', '-2AL2配电箱', '105', '11003', '电箱', '台', '700*900*200', '', '', '9', '董满仓', '2022-08-30 09:21:38', null);
INSERT INTO `dtoa_material` VALUES ('2953', '11003185', '-2AL3配电箱', '105', '11003', '电箱', '台', '1000*900*200', '', '', '9', '董满仓', '2022-08-30 09:21:58', null);
INSERT INTO `dtoa_material` VALUES ('2954', '11003186', '-2ALE1,3配电箱', '105', '11003', '电箱', '台', '500*600*200', '', '', '9', '董满仓', '2022-08-30 09:22:18', null);
INSERT INTO `dtoa_material` VALUES ('2955', '11003187', '-2ALE2配电箱', '105', '11003', '电箱', '台', '500*600*200', '', '', '9', '董满仓', '2022-08-30 09:22:36', null);
INSERT INTO `dtoa_material` VALUES ('2956', '11003188', 'WDAT-DT1~3配电箱', '105', '11003', '电箱', '台', '700*1000*350', '', '', '9', '董满仓', '2022-08-30 09:22:51', null);
INSERT INTO `dtoa_material` VALUES ('2957', '11003189', '-2YJ1~3配电箱', '105', '11003', '电箱', '台', '500*800*250', '', '', '9', '董满仓', '2022-08-30 09:23:12', null);
INSERT INTO `dtoa_material` VALUES ('2958', '11003190', 'AH1,2配电箱', '105', '11003', '电箱', '台', '460*500*160', '', '', '9', '董满仓', '2022-08-30 09:23:32', null);
INSERT INTO `dtoa_material` VALUES ('2959', '11003191', 'AH3配电箱', '105', '11003', '电箱', '台', '460*500*160', '', '', '9', '董满仓', '2022-08-30 09:23:48', null);
INSERT INTO `dtoa_material` VALUES ('2960', '11003192', 'AH11,21配电箱', '105', '11003', '电箱', '台', '460*500*160', '', '', '9', '董满仓', '2022-08-30 09:24:37', null);
INSERT INTO `dtoa_material` VALUES ('2961', '11003193', 'AH31配电箱', '105', '11003', '电箱', '台', '520*500*160', '', '', '9', '董满仓', '2022-08-30 09:25:18', null);
INSERT INTO `dtoa_material` VALUES ('2962', '11003194', '-1AH1~3配电箱', '105', '11003', '电箱', '台', '420*500*160', '', '', '9', '董满仓', '2022-08-30 09:25:37', null);
INSERT INTO `dtoa_material` VALUES ('2963', '11003195', '-2AL1配电箱', '105', '11003', '电箱', '台', '800*900*200', '', '', '9', '董满仓', '2022-08-30 09:25:55', null);
INSERT INTO `dtoa_material` VALUES ('2964', '11003196', '-2AL2配电箱', '105', '11003', '电箱', '台', '900*900*200', '', '', '9', '董满仓', '2022-08-30 09:26:38', null);
INSERT INTO `dtoa_material` VALUES ('2965', '11003197', '-2AL3配电箱', '105', '11003', '电箱', '台', '700*900*200', '', '', '9', '董满仓', '2022-08-30 09:27:00', null);
INSERT INTO `dtoa_material` VALUES ('2966', '11003198', '-2AL1配电箱', '105', '11003', '电箱', '台', '900*900*200', '', '', '9', '董满仓', '2022-08-30 09:27:20', null);
INSERT INTO `dtoa_material` VALUES ('2967', '11003199', '-2AL2配电箱', '105', '11003', '电箱', '台', '1000*900*200', '', '', '9', '董满仓', '2022-08-30 09:30:49', null);
INSERT INTO `dtoa_material` VALUES ('2968', '11101110', '法兰快接三通', '92', '11101', '镀锌管件', '个', 'DN150*100', '', '', '9', '董满仓', '2022-09-01 09:31:44', null);
INSERT INTO `dtoa_material` VALUES ('2969', '11003200', '金属配电箱', '105', '11003', '电箱', '台', '500*600*200', '', '', '9', '董满仓', '2022-09-01 09:35:59', null);

-- ----------------------------
-- Table structure for dtoa_pay
-- ----------------------------
DROP TABLE IF EXISTS `dtoa_pay`;
CREATE TABLE `dtoa_pay` (
  `p_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '结算ID',
  `p_no` char(20) DEFAULT NULL COMMENT '结算单编号',
  `g_id` int(10) unsigned DEFAULT NULL COMMENT '工程ID',
  `s_id` int(10) unsigned DEFAULT NULL COMMENT '供应商ID',
  `p_data` text COMMENT '结算对象：入库单ID数组 [k_id]',
  `p_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '结算状态 0未审批',
  `has_print` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否打印',
  `total_price` decimal(12,3) unsigned DEFAULT NULL COMMENT '总金额',
  `p_info` varchar(255) DEFAULT NULL COMMENT '结算备注',
  `creator_id` int(10) unsigned NOT NULL COMMENT '创建者ID',
  `creator` varchar(255) NOT NULL COMMENT '创建者',
  `next_admin_id` int(10) unsigned NOT NULL COMMENT '下个审批人ID',
  `approval_time` datetime DEFAULT NULL COMMENT '审批通过时间',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`p_id`),
  KEY `g_id` (`g_id`),
  KEY `s_id` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算单表';

-- ----------------------------
-- Records of dtoa_pay
-- ----------------------------

-- ----------------------------
-- Table structure for dtoa_plan
-- ----------------------------
DROP TABLE IF EXISTS `dtoa_plan`;
CREATE TABLE `dtoa_plan` (
  `j_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '计划ID',
  `g_id` int(10) unsigned NOT NULL COMMENT '工程ID',
  `s_id` int(10) unsigned NOT NULL COMMENT '供应商ID',
  `j_no` char(20) NOT NULL COMMENT '材料计划编号',
  `j_name` varchar(255) NOT NULL COMMENT '材料计划名',
  `j_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '材料计划状态 0筹备 1未审批',
  `next_admin_id` int(10) unsigned NOT NULL COMMENT '下个审批人ID',
  `total_price` decimal(12,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '总金额',
  `need_date` date DEFAULT NULL COMMENT '需用日期',
  `approval_time` datetime DEFAULT NULL COMMENT '计划审批通过时间',
  `j_info` varchar(255) DEFAULT NULL COMMENT '材料计划备注',
  `creator_id` int(10) unsigned DEFAULT NULL COMMENT '创建者ID',
  `creator` varchar(50) NOT NULL COMMENT '创建者',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`j_id`),
  KEY `g_id` (`g_id`),
  KEY `s_id` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='材料计划表';

-- ----------------------------
-- Records of dtoa_plan
-- ----------------------------
INSERT INTO `dtoa_plan` VALUES ('1', '2', '9', '001', '测试计划111', '2', '40', '50168.000', '2021-05-08', '2022-09-01 17:19:45', '', '1', '管理员', '2022-09-01 17:14:55', '2022-09-01 17:19:45');

-- ----------------------------
-- Table structure for dtoa_precart
-- ----------------------------
DROP TABLE IF EXISTS `dtoa_precart`;
CREATE TABLE `dtoa_precart` (
  `jc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '采购ID',
  `j_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '计划ID',
  `c_id` int(10) unsigned NOT NULL COMMENT '材料ID',
  `j_num` decimal(12,3) unsigned NOT NULL DEFAULT '1.000' COMMENT '材料采购数量 0不限制 合同材料可能会限制数量',
  `j_price` decimal(12,3) unsigned DEFAULT NULL COMMENT '材料采购单价',
  `jc_info` varchar(255) DEFAULT NULL COMMENT '材料采购备注',
  `c_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '材料入库状态 0-未入库 1-已入库',
  `creator_id` int(10) unsigned NOT NULL COMMENT '创建者ID',
  `creator` varchar(255) NOT NULL COMMENT '创建者',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`jc_id`),
  KEY `j_id` (`j_id`),
  KEY `c_id` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='材料采购表';

-- ----------------------------
-- Records of dtoa_precart
-- ----------------------------

-- ----------------------------
-- Table structure for dtoa_preplan
-- ----------------------------
DROP TABLE IF EXISTS `dtoa_preplan`;
CREATE TABLE `dtoa_preplan` (
  `j_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '计划ID',
  `g_id` int(10) unsigned NOT NULL COMMENT '工程ID',
  `s_id` int(10) unsigned DEFAULT NULL COMMENT '供应商ID',
  `j_no` char(20) NOT NULL COMMENT '材料计划编号',
  `j_name` varchar(255) NOT NULL COMMENT '材料计划名',
  `j_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '材料计划状态 0筹备 1未审批',
  `next_admin_id` int(10) unsigned NOT NULL COMMENT '下个审批人ID',
  `total_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `need_date` date DEFAULT NULL COMMENT '需用日期',
  `approval_time` datetime DEFAULT NULL COMMENT '计划审批通过时间',
  `j_info` varchar(255) DEFAULT NULL COMMENT '材料计划备注',
  `creator_id` int(10) unsigned DEFAULT NULL COMMENT '创建者ID',
  `creator` varchar(50) NOT NULL COMMENT '创建者',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`j_id`),
  KEY `g_id` (`g_id`),
  KEY `s_id` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='材料计划表';

-- ----------------------------
-- Records of dtoa_preplan
-- ----------------------------

-- ----------------------------
-- Table structure for dtoa_project
-- ----------------------------
DROP TABLE IF EXISTS `dtoa_project`;
CREATE TABLE `dtoa_project` (
  `g_id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '工程ID',
  `g_no` char(20) NOT NULL COMMENT '工程编号',
  `g_name` varchar(255) NOT NULL COMMENT '工程名',
  `build_unit` varchar(255) DEFAULT NULL COMMENT '建设单位',
  `build_master` varchar(255) DEFAULT NULL COMMENT '建设单位项目负责人',
  `build_no` varchar(255) DEFAULT NULL COMMENT '施工许可证编号',
  `build_address` varchar(255) DEFAULT NULL COMMENT '建设地点',
  `build_area` varchar(50) DEFAULT NULL COMMENT '建筑面积',
  `creator_id` int(10) unsigned NOT NULL COMMENT '创建者ID',
  `creator` varchar(50) NOT NULL COMMENT '创建者',
  `g_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '工程状态 1正常 2只读 0禁用',
  `g_info` varchar(255) DEFAULT NULL COMMENT '工程备注',
  `uid_arr` varchar(255) DEFAULT NULL COMMENT '工程对应的用户ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='工程表';

-- ----------------------------
-- Records of dtoa_project
-- ----------------------------
INSERT INTO `dtoa_project` VALUES ('1', '001', '北京地铁1号线', '中铁五局', '张三', 'DT202208', '北京', '100000', '1', '管理员', '1', '', '[38,34,40,35,36,39,37]', '2022-09-01 16:50:41', '2022-09-01 17:11:12');
INSERT INTO `dtoa_project` VALUES ('2', '002', '北京燕京啤酒厂维修改造工程', '八一工程', '张三', 'DT202106', '河北', '100000', '1', '管理员', '1', '', '[38,34,40,35,36,39,37]', '2022-09-01 17:12:08', '2022-09-01 17:13:43');

-- ----------------------------
-- Table structure for dtoa_storage
-- ----------------------------
DROP TABLE IF EXISTS `dtoa_storage`;
CREATE TABLE `dtoa_storage` (
  `k_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '入库ID',
  `k_no` char(20) NOT NULL COMMENT '入库单号',
  `g_id` int(10) unsigned NOT NULL COMMENT '工程ID',
  `s_id` int(10) unsigned NOT NULL COMMENT '供应商ID',
  `h_id` int(10) unsigned NOT NULL COMMENT '合同ID',
  `k_type` tinyint(1) unsigned NOT NULL COMMENT '入库类型 1-材料入库 2-商砼小票入库 3-租赁入库',
  `k_source` varchar(50) NOT NULL COMMENT '入库来源 计划|合同|直入',
  `cid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '材料分类ID 直接入库时限制只能添加同一个材料分类',
  `k_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '入库状态 0未审批',
  `next_admin_id` int(10) unsigned NOT NULL COMMENT '下个审批人ID',
  `approval_time` datetime DEFAULT NULL COMMENT '审批通过时间',
  `total_price` decimal(12,3) unsigned NOT NULL COMMENT '总金额',
  `arrival_date` date DEFAULT NULL COMMENT '到货日期',
  `k_info` varchar(255) DEFAULT NULL COMMENT '入库备注',
  `c_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '出库状态',
  `checkout_time` datetime DEFAULT NULL COMMENT '出库时间',
  `c_info` varchar(255) DEFAULT NULL COMMENT '出库备注',
  `creator_id` int(10) unsigned NOT NULL COMMENT '创建者ID',
  `creator` varchar(255) NOT NULL COMMENT '创建者',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`k_id`),
  KEY `g_id` (`g_id`),
  KEY `s_id` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='入库单表';

-- ----------------------------
-- Records of dtoa_storage
-- ----------------------------
INSERT INTO `dtoa_storage` VALUES ('1', '001', '2', '9', '0', '1', '计划入库', '0', '0', '36', null, '0.000', '2021-07-14', '', '0', null, null, '1', '管理员', '2022-09-01 17:25:15', null);

-- ----------------------------
-- Table structure for dtoa_storage_cart
-- ----------------------------
DROP TABLE IF EXISTS `dtoa_storage_cart`;
CREATE TABLE `dtoa_storage_cart` (
  `sc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '采购ID',
  `k_id` int(10) unsigned NOT NULL COMMENT '入库ID',
  `j_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '计划ID',
  `j_no` char(20) DEFAULT NULL COMMENT '计划编号',
  `h_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '合同ID',
  `h_no` char(20) DEFAULT NULL COMMENT '合同编号',
  `jc_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '计划/合同采购jc_id',
  `c_id` int(10) unsigned NOT NULL COMMENT '材料ID',
  `j_num` decimal(12,3) unsigned NOT NULL COMMENT '材料计划/合同数量 0不限量',
  `j_real_num` decimal(12,3) unsigned NOT NULL COMMENT '材料实际入库数量',
  `over_num` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '数量是否超出 0 1',
  `lease_time` decimal(12,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '租赁时间',
  `lease_time_unit` varchar(20) NOT NULL DEFAULT '' COMMENT '租赁时间单位',
  `real_time` decimal(12,3) unsigned DEFAULT NULL COMMENT '实际入库租赁时间 丢失等登记时可能为空',
  `over_time` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '时间是否超出 0 1',
  `j_price` decimal(12,3) unsigned NOT NULL COMMENT '材料入库单价',
  `j_real_price` decimal(12,3) unsigned NOT NULL COMMENT '材料实际入库单价',
  `over_price` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '价格是否超出 0 1',
  `one_price` decimal(12,3) unsigned NOT NULL COMMENT '材料采购价格',
  `storage_ok` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否完成入库 ',
  `jc_info` varchar(255) DEFAULT NULL COMMENT '材料入库备注',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`sc_id`),
  KEY `k_id` (`k_id`),
  KEY `j_id` (`j_id`),
  KEY `c_id` (`c_id`),
  KEY `jc_id` (`jc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='材料入库采购表';

-- ----------------------------
-- Records of dtoa_storage_cart
-- ----------------------------

-- ----------------------------
-- Table structure for dtoa_supplier
-- ----------------------------
DROP TABLE IF EXISTS `dtoa_supplier`;
CREATE TABLE `dtoa_supplier` (
  `s_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
  `s_name` varchar(255) NOT NULL COMMENT '供应商名',
  `s_contact` varchar(50) DEFAULT NULL COMMENT '供应商联系人',
  `s_tel` varchar(50) DEFAULT NULL COMMENT '供应商电话',
  `s_info` varchar(255) DEFAULT NULL COMMENT '供应商备注',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='供应商表';

-- ----------------------------
-- Records of dtoa_supplier
-- ----------------------------
INSERT INTO `dtoa_supplier` VALUES ('7', '北京仁和红星商贸有限公司', '任', '13912345678', '电气材料及其他零星材料供应');
INSERT INTO `dtoa_supplier` VALUES ('8', '北京顺帆顺源商贸有限责任公司', '江', '13912345678', '水暖材料及其他零星材料供应');
INSERT INTO `dtoa_supplier` VALUES ('9', '北京金童鑫源商贸有限公司', '贾', '13912345678', 'PVC及室外排水材料供应');
INSERT INTO `dtoa_supplier` VALUES ('10', '北京圣德恒润商贸有限公司', '李', '13912345678', '水泥砂浆蒸压砌块等材料供应');
INSERT INTO `dtoa_supplier` VALUES ('11', '北京鑫泉旺顺商贸中心', '朱', '13912345678', '钢筋、钢管、型材、电缆等材料供应');
INSERT INTO `dtoa_supplier` VALUES ('12', '河北金昌华安实业有限公司', '张', '13912345678', '防火门厂家');

-- ----------------------------
-- Table structure for dtoa_ticket_cart
-- ----------------------------
DROP TABLE IF EXISTS `dtoa_ticket_cart`;
CREATE TABLE `dtoa_ticket_cart` (
  `jct_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '采购ID',
  `k_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '入库ID',
  `h_id` int(10) unsigned NOT NULL COMMENT '合同ID',
  `jc_id` int(10) unsigned NOT NULL COMMENT '合同采购jc_id',
  `c_id` int(10) unsigned NOT NULL COMMENT '材料ID',
  `j_num` decimal(12,3) unsigned NOT NULL DEFAULT '1.000' COMMENT '材料采购数量 0不限制 合同材料可能会限制数量',
  `surplus_num` decimal(12,3) unsigned NOT NULL COMMENT '剩余未入库数量',
  `j_price` decimal(12,3) unsigned NOT NULL COMMENT '材料采购单价',
  `jc_info` varchar(255) DEFAULT NULL COMMENT '材料采购备注',
  `use_style` varchar(255) DEFAULT NULL COMMENT '浇筑方式',
  `use_date` date NOT NULL COMMENT '浇筑日期',
  `hc_grade` char(5) DEFAULT NULL COMMENT '强度等级',
  `ticket_num` tinyint(5) unsigned NOT NULL COMMENT '小票张数',
  `use_place` varchar(255) DEFAULT NULL COMMENT '施工部位',
  `pour_num` decimal(12,3) unsigned DEFAULT NULL COMMENT '浇筑方量',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`jct_id`),
  KEY `c_id` (`c_id`),
  KEY `k_id` (`k_id`),
  KEY `h_id` (`h_id`),
  KEY `jc_id` (`jc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商砼小票表';

-- ----------------------------
-- Records of dtoa_ticket_cart
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '导航栏目ID',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父类ID(只支持两级)',
  `menu_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '导航栏目',
  `icons` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'icon-desktop' COMMENT '使用的小图标',
  `url` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site/index' COMMENT '访问地址',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` smallint(6) NOT NULL DEFAULT '100' COMMENT '排序',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `created_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建用户',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `updated_id` int(11) NOT NULL DEFAULT '0' COMMENT '修改用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='后台导航栏目信息表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '系统管理', 'menu-icon fa fa-cog', '', '1', '1', '1528516724', '1', '1559543739', '1');
INSERT INTO `menu` VALUES ('2', '0', '用户管理', 'menu-icon fa fa-users', 'admin/admin/index', '1', '2', '1528516724', '1', '1559543719', '1');
INSERT INTO `menu` VALUES ('3', '1', '导航菜单', '', 'admin/menu/index', '1', '2', '1528516724', '1', '1559543685', '1');
INSERT INTO `menu` VALUES ('4', '1', '模块生成', '', 'admin/module/index', '1', '3', '1528516724', '1', '1528516724', '1');
INSERT INTO `menu` VALUES ('5', '1', '操作日志', '', 'admin/admin-log/index', '1', '4', '1528516724', '1', '1528516724', '1');
INSERT INTO `menu` VALUES ('6', '1', '后台权限', '', '', '1', '5', '1528516724', '1', '1528516724', '1');
INSERT INTO `menu` VALUES ('7', '6', '角色管理', 'menu-icon fa fa-graduation-cap', 'admin/role/index', '1', '1', '1528516724', '1', '1528516724', '1');
INSERT INTO `menu` VALUES ('8', '6', '角色分配', 'menu-icon fa fa-paper-plane', 'admin/auth-assignment/index', '1', '2', '1528516724', '1', '1528516724', '1');
INSERT INTO `menu` VALUES ('9', '6', '权限管理', 'menu-icon fa fa-fire', 'admin/authority/index', '1', '3', '1528516724', '1', '1528516724', '1');
INSERT INTO `menu` VALUES ('10', '6', '规则管理', 'menu-icon fa fa-shield', 'admin/auth-rule/index', '1', '4', '1528516724', '1', '1528516724', '1');
INSERT INTO `menu` VALUES ('15', '0', '工程管理', 'menu-icon fa fa-cubes', 'project/index', '1', '100', '1559488580', '1', '1559488580', '1');
INSERT INTO `menu` VALUES ('16', '0', '资料库', 'menu-icon fa fa-archive', '', '1', '100', '1559520685', '1', '1559520685', '1');
INSERT INTO `menu` VALUES ('17', '16', '材料库', 'menu-icon fa fa-globe', 'material/index', '1', '100', '1559520761', '1', '1559520761', '1');
INSERT INTO `menu` VALUES ('18', '16', '材料分类', 'menu-icon fa fa-globe', 'category/index', '1', '100', '1559535294', '1', '1559535294', '1');
INSERT INTO `menu` VALUES ('19', '16', '供应商', 'menu-icon fa fa-globe', 'supplier/index', '1', '100', '1559538985', '1', '1559538985', '1');
INSERT INTO `menu` VALUES ('21', '0', '材料计划', 'menu-icon fa fa-shopping-cart', 'plan/index', '1', '100', '1559541001', '1', '1559608007', '1');
INSERT INTO `menu` VALUES ('22', '0', '合同列表', 'menu-icon fa fa-file-word-o', 'agreement/index', '1', '100', '1559541051', '1', '1559607998', '1');
INSERT INTO `menu` VALUES ('23', '0', '计划审批', 'menu-icon fa fa-pencil-square', 'approval-plan/index', '1', '100', '1559541196', '1', '1559542371', '1');
INSERT INTO `menu` VALUES ('24', '0', '合同审批', 'menu-icon fa fa-briefcase', 'approval-agreement/index', '1', '100', '1559541283', '1', '1559542364', '1');
INSERT INTO `menu` VALUES ('25', '0', '入库列表', 'menu-icon fa fa-cloud-download', '', '1', '100', '1559541379', '1', '1559541786', '1');
INSERT INTO `menu` VALUES ('30', '0', '入库审批', 'menu-icon fa fa-inbox', 'approval-storage/index', '1', '100', '1559541878', '1', '1559541878', '1');
INSERT INTO `menu` VALUES ('31', '0', '财务结算', 'menu-icon fa fa-money', 'pay/index', '1', '100', '1559541923', '1', '1559541923', '1');
INSERT INTO `menu` VALUES ('32', '0', '结算审批', 'menu-icon fa fa-credit-card', 'approval-pay/index', '1', '100', '1559541952', '1', '1559541952', '1');
INSERT INTO `menu` VALUES ('35', '0', '系统赋权', 'menu-icon fa fa-compass', 'system-grant/update', '1', '1', '1559541952', '1', '1559541952', '1');
INSERT INTO `menu` VALUES ('36', '25', '材料入库', 'menu-icon fa fa-globe', 'storage-material/index', '1', '100', '1559541952', '1', '1559541952', '1');
INSERT INTO `menu` VALUES ('37', '25', '商砼小票入库', 'menu-icon fa fa-globe', 'storage-ticket/index', '1', '100', '1559541952', '1', '1559541952', '1');
INSERT INTO `menu` VALUES ('38', '25', '租赁入库', 'menu-icon fa fa-globe', 'storage-lease/index', '1', '100', '1559541952', '1', '1559541952', '1');
INSERT INTO `menu` VALUES ('39', '16', '材料字典', 'menu-icon fa fa-globe', 'category-material/index', '1', '100', '1559541952', '1', '1559541952', '1');
INSERT INTO `menu` VALUES ('40', '25', '入库材料查询', 'menu-icon fa fa-globe', 'storage/search', '1', '100', '1559541952', '1', '1559541952', '1');
INSERT INTO `menu` VALUES ('41', '0', '帮助文档', 'menu-icon fa fa-question', '/site/helpdoc', '1', '100', '0', '0', '0', '0');
INSERT INTO `menu` VALUES ('44', '0', '采购意向单', 'menu-icon fa fa-shopping-cart', 'pre-plan/index', '1', '100', '1559541001', '1', '1559608007', '1');
INSERT INTO `menu` VALUES ('45', '0', '意向单审批', 'menu-icon fa fa-pencil-square', 'approval-pre-plan/index', '1', '100', '1559541196', '1', '1559542371', '1');
INSERT INTO `menu` VALUES ('46', '25', '材料出库', 'menu-icon fa fa-globe', '/checkout-material/index', '1', '100', '1559541952', '1', '1559541952', '0');

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1528516700');
INSERT INTO `migration` VALUES ('m130524_201442_init', '1528516756');
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', '1528516703');
INSERT INTO `migration` VALUES ('m170801_061245_create_menu', '1528516724');
INSERT INTO `migration` VALUES ('m170801_072726_create_admin', '1528516727');
INSERT INTO `migration` VALUES ('m170801_074527_create_arrange', '1528516729');
INSERT INTO `migration` VALUES ('m170801_081237_insert_rabc', '1528516730');
INSERT INTO `migration` VALUES ('m170804_163745_create_china', '1528516731');
INSERT INTO `migration` VALUES ('m170805_100055_create_admin_operate_logs', '1528516734');
INSERT INTO `migration` VALUES ('m170907_052038_rbac_add_index_on_auth_assignment_user_id', '1528516703');
INSERT INTO `migration` VALUES ('m171118_082050_create_uploads', '1528516735');
