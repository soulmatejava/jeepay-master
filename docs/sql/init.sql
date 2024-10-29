/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80012 (8.0.12)
 Source Host           : localhost:3306
 Source Schema         : jeepaydb

 Target Server Type    : MySQL
 Target Server Version : 80012 (8.0.12)
 File Encoding         : 65001

 Date: 29/10/2024 15:50:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_isv_info
-- ----------------------------
DROP TABLE IF EXISTS `t_isv_info`;
CREATE TABLE `t_isv_info`  (
  `isv_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务商号',
  `isv_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务商名称',
  `isv_short_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务商简称',
  `contact_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `contact_tel` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人手机号',
  `contact_email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人邮箱',
  `state` tinyint(6) NOT NULL DEFAULT 1 COMMENT '状态: 0-停用, 1-正常',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `created_uid` bigint(20) NULL DEFAULT NULL COMMENT '创建者用户ID',
  `created_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`isv_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '服务商信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_isv_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_mch_app
-- ----------------------------
DROP TABLE IF EXISTS `t_mch_app`;
CREATE TABLE `t_mch_app`  (
  `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用ID',
  `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '应用名称',
  `mch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户号',
  `state` tinyint(6) NOT NULL DEFAULT 1 COMMENT '应用状态: 0-停用, 1-正常',
  `app_secret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用私钥',
  `pankou_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '盘口回调地址',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `created_uid` bigint(20) NULL DEFAULT NULL COMMENT '创建者用户ID',
  `created_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商户应用表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_mch_app
-- ----------------------------
INSERT INTO `t_mch_app` VALUES ('67192f55d2e0f36eccb0c3bc', '默认应用', 'M1729703764', 1, 'VsrTgUmJGYKaOl57azwJqJNMdpW3Os9qaEM6DGzVRednsPBlwoqTlcVThM7keCt9QHdx3TJAwAYERnUbmhQm4fjVDvjqLdYJb6g6zUzSCGxivDakC0uvl3A0D9havTxQ', 'https://www.baidu.com/', NULL, 100001, 'jeepay', '2024-10-24 01:16:05.000', '2024-10-24 01:16:05.000');

-- ----------------------------
-- Table structure for t_mch_division_receiver
-- ----------------------------
DROP TABLE IF EXISTS `t_mch_division_receiver`;
CREATE TABLE `t_mch_division_receiver`  (
  `receiver_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分账接收者ID',
  `receiver_alias` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '接收者账号别名',
  `receiver_group_id` bigint(20) NULL DEFAULT NULL COMMENT '组ID（便于商户接口使用）',
  `receiver_group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组名称',
  `mch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户号',
  `isv_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务商号',
  `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用ID',
  `if_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付接口代码',
  `acc_type` tinyint(6) NOT NULL COMMENT '分账接收账号类型: 0-个人(对私) 1-商户(对公)',
  `acc_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分账接收账号',
  `acc_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '分账接收账号名称',
  `relation_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分账关系类型（参考微信）， 如： SERVICE_PROVIDER 服务商等',
  `relation_type_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '当选择自定义时，需要录入该字段。 否则为对应的名称',
  `division_profit` decimal(20, 6) NULL DEFAULT NULL COMMENT '分账比例',
  `state` tinyint(6) NOT NULL COMMENT '分账状态（本系统状态，并不调用上游关联关系）: 1-正常分账, 0-暂停分账',
  `channel_bind_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '上游绑定返回信息，一般用作查询账号异常时的记录',
  `channel_ext_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '渠道特殊信息',
  `bind_success_time` datetime NULL DEFAULT NULL COMMENT '绑定成功时间',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`receiver_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 800003 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商户分账接收者账号绑定关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_mch_division_receiver
-- ----------------------------
INSERT INTO `t_mch_division_receiver` VALUES (800001, 'pgnihl8470@sandbox.com', 100001, '测试组', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', 'alipay', 1, 'pgnihl8470@sandbox.com', 'pgnihl8470@sandbox.com', 'PARTNER', '合作伙伴', 0.100000, 1, NULL, NULL, '2024-10-28 14:50:48', '2024-10-28 14:50:47.597', '2024-10-28 14:50:47.597');
INSERT INTO `t_mch_division_receiver` VALUES (800002, 'lcxptt4632@sandbox.com', 100001, '测试组', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', 'alipay', 1, 'lcxptt4632@sandbox.com', 'lcxptt4632@sandbox.com', 'PARTNER', '合作伙伴', 0.100000, 1, NULL, NULL, '2024-10-28 14:56:40', '2024-10-28 14:56:40.094', '2024-10-28 14:56:40.094');

-- ----------------------------
-- Table structure for t_mch_division_receiver_group
-- ----------------------------
DROP TABLE IF EXISTS `t_mch_division_receiver_group`;
CREATE TABLE `t_mch_division_receiver_group`  (
  `receiver_group_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '组ID',
  `receiver_group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `mch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户号',
  `auto_division_flag` tinyint(6) NOT NULL DEFAULT 0 COMMENT '自动分账组（当订单分账模式为自动分账，改组将完成分账逻辑） 0-否 1-是',
  `created_uid` bigint(20) NOT NULL COMMENT '创建者用户ID',
  `created_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建者姓名',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`receiver_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分账账号组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_mch_division_receiver_group
-- ----------------------------
INSERT INTO `t_mch_division_receiver_group` VALUES (100001, '测试组', 'M1729703764', 1, 100001, 'jeepay', '2024-10-28 14:42:47.288', '2024-10-28 14:42:47.288');

-- ----------------------------
-- Table structure for t_mch_info
-- ----------------------------
DROP TABLE IF EXISTS `t_mch_info`;
CREATE TABLE `t_mch_info`  (
  `mch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户号',
  `mch_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户名称',
  `mch_short_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户简称',
  `type` tinyint(6) NOT NULL DEFAULT 1 COMMENT '类型: 1-普通商户, 2-特约商户(服务商模式)',
  `isv_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务商号',
  `contact_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `contact_tel` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人手机号',
  `contact_email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人邮箱',
  `state` tinyint(6) NOT NULL DEFAULT 1 COMMENT '商户状态: 0-停用, 1-正常',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商户备注',
  `init_user_id` bigint(20) NULL DEFAULT NULL COMMENT '初始用户ID（创建商户时，允许商户登录的用户）',
  `created_uid` bigint(20) NULL DEFAULT NULL COMMENT '创建者用户ID',
  `created_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`mch_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_mch_info
-- ----------------------------
INSERT INTO `t_mch_info` VALUES ('M1729703764', '测试商户', '测试', 1, NULL, 'jeepay', '13100000000', NULL, 1, NULL, 100001, 801, '超管', '2024-10-24 01:16:04.910', '2024-10-24 01:16:05.461');

-- ----------------------------
-- Table structure for t_mch_notify_record
-- ----------------------------
DROP TABLE IF EXISTS `t_mch_notify_record`;
CREATE TABLE `t_mch_notify_record`  (
  `notify_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商户通知记录ID',
  `order_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
  `order_type` tinyint(6) NOT NULL COMMENT '订单类型:1-支付,2-退款',
  `mch_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户订单号',
  `mch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户号',
  `isv_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务商号',
  `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用ID',
  `notify_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '通知地址',
  `res_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '通知响应结果',
  `notify_count` int(11) NOT NULL DEFAULT 0 COMMENT '通知次数',
  `notify_count_limit` int(11) NOT NULL DEFAULT 6 COMMENT '最大通知次数, 默认6次',
  `state` tinyint(6) NOT NULL DEFAULT 1 COMMENT '通知状态,1-通知中,2-通知成功,3-通知失败',
  `last_notify_time` datetime NULL DEFAULT NULL COMMENT '最后一次通知时间',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`notify_id`) USING BTREE,
  UNIQUE INDEX `Uni_OrderId_Type`(`order_id` ASC, `order_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1007 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商户通知记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_mch_notify_record
-- ----------------------------
INSERT INTO `t_mch_notify_record` VALUES (1001, 'P1849382821832658945', 1, 'M17297621736303722', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder?ifCode=alipay&amount=1&payOrderId=P1849382821832658945&mchOrderNo=M17297621736303722&subject=%E6%8E%A5%E5%8F%A3%E8%B0%83%E8%AF%95%5BM1729703764%E5%95%86%E6%88%B7%E8%81%94%E8%B0%83%5D&wayCode=ALI_QR&sign=FE4D189FDA0C2E014FCD663F81A450F3&channelOrderNo=2024102422001425210503902582&reqTime=1729762800796&body=%E6%8E%A5%E5%8F%A3%E8%B0%83%E8%AF%95%5BM1729703764%E5%95%86%E6%88%B7%E8%81%94%E8%B0%83%5D&createdAt=1729762199258&appId=67192f55d2e0f36eccb0c3bc&clientIp=0:0:0:0:0:0:0:1&successTime=1729762801000&currency=CNY&state=2&mchNo=M1729703764', 'SUCCESS', 1, 6, 2, '2024-10-24 17:40:01', '2024-10-24 17:40:00.810', '2024-10-24 17:40:01.035');
INSERT INTO `t_mch_notify_record` VALUES (1002, 'P1849387265580265473', 1, 'M17297632543148872', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', 'http://172.20.10.5:9218/api/anon/paytestNotify/payOrder?ifCode=alipay&amount=1&payOrderId=P1849387265580265473&mchOrderNo=M17297632543148872&subject=%E6%8E%A5%E5%8F%A3%E8%B0%83%E8%AF%95%5BM1729703764%E5%95%86%E6%88%B7%E8%81%94%E8%B0%83%5D&wayCode=ALI_QR&sign=9AAE21C023B41AC2162E1E16212F237B&channelOrderNo=2024102422001425210503903840&reqTime=1729763890638&body=%E6%8E%A5%E5%8F%A3%E8%B0%83%E8%AF%95%5BM1729703764%E5%95%86%E6%88%B7%E8%81%94%E8%B0%83%5D&createdAt=1729763258730&appId=67192f55d2e0f36eccb0c3bc&clientIp=0:0:0:0:0:0:0:1&successTime=1729763890000&currency=CNY&state=2&mchNo=M1729703764', 'SUCCESS', 1, 6, 2, '2024-10-24 17:58:10', '2024-10-24 17:58:10.657', '2024-10-24 17:58:10.890');
INSERT INTO `t_mch_notify_record` VALUES (1003, 'P1849387838807404546', 1, 'M17297633914383957', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', 'http://172.20.10.5:9218/api/anon/paytestNotify/payOrder?ifCode=alipay&amount=1&payOrderId=P1849387838807404546&mchOrderNo=M17297633914383957&subject=%E6%8E%A5%E5%8F%A3%E8%B0%83%E8%AF%95%5BM1729703764%E5%95%86%E6%88%B7%E8%81%94%E8%B0%83%5D&wayCode=ALI_QR&sign=E5F4FC1A8E27D98ACBB80BF06F4C8191&channelOrderNo=2024102422001425210503908304&reqTime=1729764006247&body=%E6%8E%A5%E5%8F%A3%E8%B0%83%E8%AF%95%5BM1729703764%E5%95%86%E6%88%B7%E8%81%94%E8%B0%83%5D&createdAt=1729763395407&appId=67192f55d2e0f36eccb0c3bc&clientIp=0:0:0:0:0:0:0:1&successTime=1729764006000&currency=CNY&state=2&mchNo=M1729703764', 'SUCCESS', 1, 6, 2, '2024-10-24 18:00:06', '2024-10-24 18:00:06.252', '2024-10-24 18:00:06.336');
INSERT INTO `t_mch_notify_record` VALUES (1004, 'P1850792442325561346', 1, 'M17300982687191220', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder?ifCode=alipay&amount=10000&payOrderId=P1850792442325561346&mchOrderNo=M17300982687191220&subject=%E6%8E%A5%E5%8F%A3%E8%B0%83%E8%AF%95%5BM1729703764%E5%95%86%E6%88%B7%E8%81%94%E8%B0%83%5D&wayCode=ALI_QR&sign=675859E8F10806F6C68116405C2D81E2&channelOrderNo=2024102822001425210503916589&reqTime=1730098920977&body=%E6%8E%A5%E5%8F%A3%E8%B0%83%E8%AF%95%5BM1729703764%E5%95%86%E6%88%B7%E8%81%94%E8%B0%83%5D&createdAt=1730098278972&appId=67192f55d2e0f36eccb0c3bc&clientIp=0:0:0:0:0:0:0:1&successTime=1730098921000&currency=CNY&state=2&mchNo=M1729703764', 'SUCCESS', 1, 6, 2, '2024-10-28 15:02:01', '2024-10-28 15:02:00.994', '2024-10-28 15:02:01.339');
INSERT INTO `t_mch_notify_record` VALUES (1005, 'P1850792741995999233', 1, 'M17300983377519592', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder?ifCode=alipay&amount=20000&payOrderId=P1850792741995999233&mchOrderNo=M17300983377519592&subject=%E6%8E%A5%E5%8F%A3%E8%B0%83%E8%AF%95%5BM1729703764%E5%95%86%E6%88%B7%E8%81%94%E8%B0%83%5D&wayCode=ALI_QR&sign=214923D050466032D8934157B64BA2FE&channelOrderNo=2024102822001425210503922406&reqTime=1730098980869&body=%E6%8E%A5%E5%8F%A3%E8%B0%83%E8%AF%95%5BM1729703764%E5%95%86%E6%88%B7%E8%81%94%E8%B0%83%5D&createdAt=1730098350415&appId=67192f55d2e0f36eccb0c3bc&clientIp=0:0:0:0:0:0:0:1&successTime=1730098981000&currency=CNY&state=2&mchNo=M1729703764', 'SUCCESS', 1, 6, 2, '2024-10-28 15:03:00', '2024-10-28 15:03:00.877', '2024-10-28 15:03:00.953');
INSERT INTO `t_mch_notify_record` VALUES (1006, 'P1850793928904339457', 1, 'M17300986326668228', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder?ifCode=alipay&amount=10000&payOrderId=P1850793928904339457&mchOrderNo=M17300986326668228&subject=%E6%8E%A5%E5%8F%A3%E8%B0%83%E8%AF%95%5BM1729703764%E5%95%86%E6%88%B7%E8%81%94%E8%B0%83%5D&wayCode=ALI_QR&sign=0CD87902BA12B13B28EDA736F57D50AE&channelOrderNo=2024102822001425210503918517&reqTime=1730099280877&body=%E6%8E%A5%E5%8F%A3%E8%B0%83%E8%AF%95%5BM1729703764%E5%95%86%E6%88%B7%E8%81%94%E8%B0%83%5D&createdAt=1730098633402&appId=67192f55d2e0f36eccb0c3bc&clientIp=0:0:0:0:0:0:0:1&successTime=1730099281000&currency=CNY&state=2&mchNo=M1729703764', 'SUCCESS', 1, 6, 2, '2024-10-28 15:08:00', '2024-10-28 15:08:00.881', '2024-10-28 15:08:00.954');

-- ----------------------------
-- Table structure for t_mch_pay_passage
-- ----------------------------
DROP TABLE IF EXISTS `t_mch_pay_passage`;
CREATE TABLE `t_mch_pay_passage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `mch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户号',
  `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用ID',
  `if_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付接口',
  `way_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付方式',
  `rate` decimal(20, 6) NOT NULL COMMENT '支付方式费率',
  `risk_config` json NULL COMMENT '风控数据',
  `state` tinyint(6) NOT NULL COMMENT '状态: 0-停用, 1-启用',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `Uni_AppId_WayCode`(`app_id` ASC, `if_code` ASC, `way_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商户支付通道表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_mch_pay_passage
-- ----------------------------
INSERT INTO `t_mch_pay_passage` VALUES (1, 'M1729703764', '67192f55d2e0f36eccb0c3bc', 'alipay', 'ALI_WAP', 0.006000, NULL, 1, '2024-10-24 14:10:38.592', '2024-10-24 14:10:38.592');
INSERT INTO `t_mch_pay_passage` VALUES (2, 'M1729703764', '67192f55d2e0f36eccb0c3bc', 'alipay', 'ALI_QR', 0.006000, NULL, 1, '2024-10-24 14:15:40.344', '2024-10-24 14:15:40.344');

-- ----------------------------
-- Table structure for t_order_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `t_order_snapshot`;
CREATE TABLE `t_order_snapshot`  (
  `order_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
  `order_type` tinyint(6) NOT NULL COMMENT '订单类型: 1-支付, 2-退款',
  `mch_req_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '下游请求数据',
  `mch_req_time` datetime NULL DEFAULT NULL COMMENT '下游请求时间',
  `mch_resp_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '向下游响应数据',
  `mch_resp_time` datetime NULL DEFAULT NULL COMMENT '向下游响应时间',
  `channel_req_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '向上游请求数据',
  `channel_req_time` datetime NULL DEFAULT NULL COMMENT '向上游请求时间',
  `channel_resp_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '上游响应数据',
  `channel_resp_time` datetime NULL DEFAULT NULL COMMENT '上游响应时间',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`order_id`, `order_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单接口数据快照' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_snapshot
-- ----------------------------

-- ----------------------------
-- Table structure for t_pay_interface_config
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_interface_config`;
CREATE TABLE `t_pay_interface_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `info_type` tinyint(6) NOT NULL COMMENT '账号类型:1-服务商 2-商户 3-商户应用',
  `info_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务商号/商户号/应用ID',
  `if_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付接口代码',
  `if_params` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '接口配置参数,json字符串',
  `if_rate` decimal(20, 6) NULL DEFAULT NULL COMMENT '支付接口费率',
  `state` tinyint(6) NOT NULL DEFAULT 1 COMMENT '状态: 0-停用, 1-启用',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `created_uid` bigint(20) NULL DEFAULT NULL COMMENT '创建者用户ID',
  `created_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_uid` bigint(20) NULL DEFAULT NULL COMMENT '更新者用户ID',
  `updated_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者姓名',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `Uni_InfoType_InfoId_IfCode`(`info_type` ASC, `info_id` ASC, `if_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '支付接口配置参数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pay_interface_config
-- ----------------------------
INSERT INTO `t_pay_interface_config` VALUES (1, 3, '67192f55d2e0f36eccb0c3bc', 'alipay', '{\"privateKey\":\"MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCzPype51NaRAEwrdXMf8tW+gcZ2qAa0YvSduP6Fb3Axdb47YJRqPNUcEzRFIuPXrd15UhNt0LGCykDOJcI1kQJjJW/UjsKyaIhSWHU7MRR0eyj9gPnDiFv6df3Fo3sLc/SMM04FtGQQxiJ2D/ghDV/brM2i5d4ALUaTqdjIJapatrRLMjeDMez0J0wqHhrfGrbWMuUeR/vGU0TsuHp/A50sTLf4oLxGEYsYyIj1H7x7c8WuNb2unypLT3hl89BrBGQX19OikrCPmOXAaaZdUfhB4kYjc9IFvo67YyKbSnaBxfdbqftqCcj/P3fQB1mSImR2kEByLfP9V739aR4ZJBvAgMBAAECggEAJesu43S8RVQtjEa5+9DtCzFJX0bIp+O8WIGeKMGAqs8vcumLsAq1rx8yoOhfvayj0uT2Lrqd/ZdOzcei69OoAP0kkJyssNOG4NPNRmXwAf8OuIDKwo5StIIblcHHtDbcx/Ja94qcOpB3GHIO0UgmqRaaAuf02wYLSc1py6aROLVvTYKh9FXIR5BvQFvScZApF5cb11nP0ajTcQjcZnqm5ZwJh/R3q9fGa0ccRuREoH33N5N3zmtkhuaJHBY1QxcnToMuu/JZ8LNlux7rPBrbvBu9711N0+6qdVHc2Z/tIKTaJqgU2SmXvmCR54DKivAiTVX5ym1Nf8yaNvyXh8ECQQKBgQDlQKseDB/MxpVpa/BVuVvKAxVIa1f34EBDeG2J90NjJuDIbZkD5jbNQF7pceMgWRjyJgkCkC1NaE3BDhWlxHFqWBbsj/oCkyNmaROC/S0cYKdnynGwOMhRVWi40BrIVhBeY6mINDfam+FoJdrwgHY7+Az6CDC22/I/8pdqmTUXkwKBgQDIKOsmVWbpi21NKWh2WqDy1ZndmBxx2rDDZ6MLvIZ+GLpr2ZSxaNditRwpEtZrXF2oZaHOwJohLXcMgpHxeqLmVvaDmcLXaq+f/rixz0fgoEr34s4HZtKapEtS2diIzHVFAceSCYg2hZc4zngxjlJHvRobr3Rnhl1XYk5yhC31NQKBgQDdV+7fd/1MDYA85QaK/ghtp0RpQ5sPrOjfO+snBiF+Hg9x9L+EUEYhLkF1S4xrsxqu0aJpYyMaVdacyyiDgIOwlZSsmuZcjgvj2RgJpMBlYbzALWpPJsPiI4CUz/jL7KypNbh91U0IOPENSV92TdHaXMjKsBW4t+vRajxfo8TrGQKBgQC8fjQ8LE62/rNW5/jVBDHvnRHCKZ4X5h9yVSWpRsfM9dKRABzUGWxEK1QypefAwQH+NH91adF8Dwm+gTOZGalQi3KoqeNf47syS7l40T/aHHmdCTyGoeEQ+klo43fUE98Xtj5Pm6Rn29R2DZII8QMxRbbRfaB8YX+DbDN+ClYRRQKBgQC0zguqiabVYNZaM2nPB5KHrZruIlh4nXeTVZaETOODHsrexgaifmF1DIrFlUuFniUIm4TZ9DR2VUCcMy7VZRlNyTZJHavtQ/C8EnVT1+KBZQmVuqRl9c8GUOizd86iZn+H0b4EKayycQFplEsSM9IXmezSt9qKxID6amftuKQw+Q==\",\"alipayPublicCert\":\"\",\"alipayPublicKey\":\"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiYA2QhC+IXUD+0THOQ6D4UwMLy1L0KgjtypS2CRfO4wrcwg95+DVFKYNoEXLbRH3vtOibB0bY9G7u4iymm2iNgUUvHIPfPdr7aGqJ7fsSxYixMvVIGsoDNYJfMqRfZHS+pqr7b38ymnwWzej68LKhr76IsBB93KBfj343EitSUQxmZzCBR7sUuV3MWIs1WR9NQpnQtkfC6lXz+NjMRhU1kS2NlmTVsmrc/WELNu7zQ4TeVQgGemwhxF9jXL0vtYSX1S45fF/L+QAd6eipZYxXi17l9D7gP/EspX2igHg67x5QJMzjDPsS+2SQeJwAt1SJAOu0g173HzW4VCEBcj1wwIDAQAB\",\"appPublicCert\":\"\",\"appId\":\"9021000132668801\",\"sandbox\":1,\"alipayRootCert\":\"\",\"signType\":\"RSA2\",\"useCert\":0}', NULL, 1, NULL, 801, '超管', '2024-10-24 14:09:56.212', 801, '超管', '2024-10-24 14:10:01.349');

-- ----------------------------
-- Table structure for t_pay_interface_define
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_interface_define`;
CREATE TABLE `t_pay_interface_define`  (
  `if_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '接口代码 全小写  wxpay alipay ',
  `if_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '接口名称',
  `is_mch_mode` tinyint(6) NOT NULL DEFAULT 1 COMMENT '是否支持普通商户模式: 0-不支持, 1-支持',
  `is_isv_mode` tinyint(6) NOT NULL DEFAULT 1 COMMENT '是否支持服务商子商户模式: 0-不支持, 1-支持',
  `config_page_type` tinyint(6) NOT NULL DEFAULT 1 COMMENT '支付参数配置页面类型:1-JSON渲染,2-自定义',
  `isv_params` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ISV接口配置定义描述,json字符串',
  `isvsub_mch_params` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '特约商户接口配置定义描述,json字符串',
  `normal_mch_params` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '普通商户接口配置定义描述,json字符串',
  `way_codes` json NOT NULL COMMENT '支持的支付方式 [\"wxpay_jsapi\", \"wxpay_bar\"]',
  `icon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '页面展示：卡片-图标',
  `bg_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '页面展示：卡片-背景色',
  `state` tinyint(6) NOT NULL DEFAULT 1 COMMENT '状态: 0-停用, 1-启用',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`if_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '支付接口定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pay_interface_define
-- ----------------------------
INSERT INTO `t_pay_interface_define` VALUES ('alipay', '支付宝官方', 1, 1, 2, '[{\"name\":\"sandbox\",\"desc\":\"环境配置\",\"type\":\"radio\",\"verify\":\"\",\"values\":\"1,0\",\"titles\":\"沙箱环境,生产环境\",\"verify\":\"required\"},{\"name\":\"pid\",\"desc\":\"合作伙伴身份（PID）\",\"type\":\"text\",\"verify\":\"required\"},{\"name\":\"appId\",\"desc\":\"应用App ID\",\"type\":\"text\",\"verify\":\"required\"},{\"name\":\"privateKey\", \"desc\":\"应用私钥\", \"type\": \"textarea\",\"verify\":\"required\",\"star\":\"1\"},{\"name\":\"alipayPublicKey\", \"desc\":\"支付宝公钥(不使用证书时必填)\", \"type\": \"textarea\",\"star\":\"1\"},{\"name\":\"signType\",\"desc\":\"接口签名方式(推荐使用RSA2)\",\"type\":\"radio\",\"verify\":\"\",\"values\":\"RSA,RSA2\",\"titles\":\"RSA,RSA2\",\"verify\":\"required\"},{\"name\":\"useCert\",\"desc\":\"公钥证书\",\"type\":\"radio\",\"verify\":\"\",\"values\":\"1,0\",\"titles\":\"使用证书（请使用RSA2私钥）,不使用证书\"},{\"name\":\"appPublicCert\",\"desc\":\"应用公钥证书（.crt格式）\",\"type\":\"file\",\"verify\":\"\"},{\"name\":\"alipayPublicCert\",\"desc\":\"支付宝公钥证书（.crt格式）\",\"type\":\"file\",\"verify\":\"\"},{\"name\":\"alipayRootCert\",\"desc\":\"支付宝根证书（.crt格式）\",\"type\":\"file\",\"verify\":\"\"}]', '[{\"name\":\"appAuthToken\", \"desc\":\"子商户app_auth_token\", \"type\": \"text\",\"readonly\":\"readonly\"},{\"name\":\"refreshToken\", \"desc\":\"子商户刷新token\", \"type\": \"hidden\",\"readonly\":\"readonly\"},{\"name\":\"expireTimestamp\", \"desc\":\"authToken有效期（13位时间戳）\", \"type\": \"hidden\",\"readonly\":\"readonly\"}]', '[{\"name\":\"sandbox\",\"desc\":\"环境配置\",\"type\":\"radio\",\"verify\":\"\",\"values\":\"1,0\",\"titles\":\"沙箱环境,生产环境\",\"verify\":\"required\"},{\"name\":\"appId\",\"desc\":\"应用App ID\",\"type\":\"text\",\"verify\":\"required\"},{\"name\":\"privateKey\", \"desc\":\"应用私钥\", \"type\": \"textarea\",\"verify\":\"required\",\"star\":\"1\"},{\"name\":\"alipayPublicKey\", \"desc\":\"支付宝公钥(不使用证书时必填)\", \"type\": \"textarea\",\"star\":\"1\"},{\"name\":\"signType\",\"desc\":\"接口签名方式(推荐使用RSA2)\",\"type\":\"radio\",\"verify\":\"\",\"values\":\"RSA,RSA2\",\"titles\":\"RSA,RSA2\",\"verify\":\"required\"},{\"name\":\"useCert\",\"desc\":\"公钥证书\",\"type\":\"radio\",\"verify\":\"\",\"values\":\"1,0\",\"titles\":\"使用证书（请使用RSA2私钥）,不使用证书\"},{\"name\":\"appPublicCert\",\"desc\":\"应用公钥证书（.crt格式）\",\"type\":\"file\",\"verify\":\"\"},{\"name\":\"alipayPublicCert\",\"desc\":\"支付宝公钥证书（.crt格式）\",\"type\":\"file\",\"verify\":\"\"},{\"name\":\"alipayRootCert\",\"desc\":\"支付宝根证书（.crt格式）\",\"type\":\"file\",\"verify\":\"\"}]', '[{\"wayCode\": \"ALI_JSAPI\"}, {\"wayCode\": \"ALI_WAP\"}, {\"wayCode\": \"ALI_BAR\"}, {\"wayCode\": \"ALI_APP\"}, {\"wayCode\": \"ALI_PC\"}, {\"wayCode\": \"ALI_QR\"}, {\"wayCode\": \"ALI_OC\"}]', 'http://jeequan.oss-cn-beijing.aliyuncs.com/jeepay/img/alipay.png', '#1779FF', 1, '支付宝官方通道', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_pay_interface_define` VALUES ('plspay', '计全付', 1, 0, 1, NULL, NULL, '[{\"name\":\"signType\",\"desc\":\"签名方式\",\"type\":\"radio\",\"verify\":\"required\",\"values\":\"MD5,RSA2\",\"titles\":\"MD5,RSA2\"},{\"name\":\"merchantNo\",\"desc\":\"计全付商户号\",\"type\":\"text\",\"verify\":\"required\"},{\"name\":\"appId\",\"desc\":\"应用ID\",\"type\":\"text\",\"verify\":\"required\"},{\"name\":\"appSecret\",\"desc\":\"md5秘钥\",\"type\":\"textarea\",\"verify\":\"required\",\"star\":\"1\"},{\"name\":\"rsa2AppPrivateKey\",\"desc\":\"RSA2: 应用私钥\",\"type\":\"textarea\",\"verify\":\"required\",\"star\":\"1\"},{\"name\":\"rsa2PayPublicKey\",\"desc\":\"RSA2: 支付网关公钥\",\"type\":\"textarea\",\"verify\":\"required\",\"star\":\"1\"}]', '[{\"wayCode\": \"ALI_APP\"}, {\"wayCode\": \"ALI_BAR\"}, {\"wayCode\": \"ALI_JSAPI\"}, {\"wayCode\": \"ALI_LITE\"}, {\"wayCode\": \"ALI_PC\"}, {\"wayCode\": \"ALI_QR\"}, {\"wayCode\": \"ALI_WAP\"}, {\"wayCode\": \"WX_APP\"}, {\"wayCode\": \"WX_BAR\"}, {\"wayCode\": \"WX_H5\"}, {\"wayCode\": \"WX_JSAPI\"}, {\"wayCode\": \"WX_LITE\"}, {\"wayCode\": \"WX_NATIVE\"}]', 'http://jeequan.oss-cn-beijing.aliyuncs.com/jeepay/img/plspay.svg', '#0CACFF', 1, '计全付', '2024-10-22 23:02:41.477', '2024-10-22 23:02:41.477');
INSERT INTO `t_pay_interface_define` VALUES ('pppay', 'PayPal支付', 1, 0, 1, NULL, NULL, '[{\"name\":\"sandbox\",\"desc\":\"环境配置\",\"type\":\"radio\",\"verify\":\"required\",\"values\":\"1,0\",\"titles\":\"沙箱环境, 生产环境\"},{\"name\":\"clientId\",\"desc\":\"Client ID（客户端ID）\",\"type\":\"text\",\"verify\":\"required\"},{\"name\":\"secret\",\"desc\":\"Secret（密钥）\",\"type\":\"text\",\"verify\":\"required\",\"star\":\"1\"},{\"name\":\"refundWebhook\",\"desc\":\"退款 Webhook id\",\"type\":\"text\",\"verify\":\"required\"},{\"name\":\"notifyWebhook\",\"desc\":\"支付 Webhook id\",\"type\":\"text\",\"verify\":\"required\"}]', '[{\"wayCode\": \"PP_PC\"}]', 'http://jeequan.oss-cn-beijing.aliyuncs.com/jeepay/img/paypal.png', '#005ea6', 1, 'PayPal官方通道', '2024-10-22 23:02:41.477', '2024-10-22 23:02:41.477');
INSERT INTO `t_pay_interface_define` VALUES ('wxpay', '微信支付官方', 1, 1, 2, '[{\"name\":\"mchId\", \"desc\":\"微信支付商户号\", \"type\": \"text\",\"verify\":\"required\"},{\"name\":\"appId\",\"desc\":\"应用App ID\",\"type\":\"text\",\"verify\":\"required\"},{\"name\":\"appSecret\",\"desc\":\"应用AppSecret\",\"type\":\"text\",\"verify\":\"required\",\"star\":\"1\"},{\"name\":\"oauth2Url\", \"desc\":\"oauth2地址（置空将使用官方）\", \"type\": \"text\"},{\"name\":\"apiVersion\", \"desc\":\"微信支付API版本\", \"type\": \"radio\",\"values\":\"V2,V3\",\"titles\":\"V2,V3\",\"verify\":\"required\"},{\"name\":\"key\", \"desc\":\"APIv2密钥\", \"type\": \"textarea\",\"verify\":\"required\",\"star\":\"1\"},{\"name\":\"apiV3Key\", \"desc\":\"APIv3密钥（V3接口必填）\", \"type\": \"textarea\",\"verify\":\"\",\"star\":\"1\"},{\"name\":\"serialNo\", \"desc\":\"序列号（V3接口必填）\", \"type\": \"textarea\",\"verify\":\"\",\"star\":\"1\"},{\"name\":\"cert\", \"desc\":\"API证书(apiclient_cert.p12)\", \"type\": \"file\",\"verify\":\"\"},{\"name\":\"apiClientCert\", \"desc\":\"证书文件(apiclient_cert.pem) \", \"type\": \"file\",\"verify\":\"\"},{\"name\":\"apiClientKey\", \"desc\":\"私钥文件(apiclient_key.pem)\", \"type\": \"file\",\"verify\":\"\"}]', '[{\"name\":\"subMchId\",\"desc\":\"子商户ID\",\"type\":\"text\",\"verify\":\"required\"},{\"name\":\"subMchAppId\",\"desc\":\"子账户appID(线上支付必填)\",\"type\":\"text\",\"verify\":\"\"}]', '[{\"name\":\"mchId\", \"desc\":\"微信支付商户号\", \"type\": \"text\",\"verify\":\"required\"},{\"name\":\"appId\",\"desc\":\"应用App ID\",\"type\":\"text\",\"verify\":\"required\"},{\"name\":\"appSecret\",\"desc\":\"应用AppSecret\",\"type\":\"text\",\"verify\":\"required\",\"star\":\"1\"},{\"name\":\"oauth2Url\", \"desc\":\"oauth2地址（置空将使用官方）\", \"type\": \"text\"},{\"name\":\"apiVersion\", \"desc\":\"微信支付API版本\", \"type\": \"radio\",\"values\":\"V2,V3\",\"titles\":\"V2,V3\",\"verify\":\"required\"},{\"name\":\"key\", \"desc\":\"APIv2密钥\", \"type\": \"textarea\",\"verify\":\"required\",\"star\":\"1\"},{\"name\":\"apiV3Key\", \"desc\":\"APIv3密钥（V3接口必填）\", \"type\": \"textarea\",\"verify\":\"\",\"star\":\"1\"},{\"name\":\"serialNo\", \"desc\":\"序列号（V3接口必填）\", \"type\": \"textarea\",\"verify\":\"\",\"star\":\"1\" },{\"name\":\"cert\", \"desc\":\"API证书(apiclient_cert.p12)\", \"type\": \"file\",\"verify\":\"\"},{\"name\":\"apiClientCert\", \"desc\":\"证书文件(apiclient_cert.pem) \", \"type\": \"file\",\"verify\":\"\"},{\"name\":\"apiClientKey\", \"desc\":\"私钥文件(apiclient_key.pem)\", \"type\": \"file\",\"verify\":\"\"}]', '[{\"wayCode\": \"WX_APP\"}, {\"wayCode\": \"WX_H5\"}, {\"wayCode\": \"WX_NATIVE\"}, {\"wayCode\": \"WX_JSAPI\"}, {\"wayCode\": \"WX_BAR\"}, {\"wayCode\": \"WX_LITE\"}]', 'http://jeequan.oss-cn-beijing.aliyuncs.com/jeepay/img/wxpay.png', '#04BE02', 1, '微信官方通道', '2024-10-22 23:02:41.477', '2024-10-22 23:02:41.477');
INSERT INTO `t_pay_interface_define` VALUES ('ysfpay', '云闪付官方', 0, 1, 1, '[{\"name\":\"sandbox\",\"desc\":\"环境配置\",\"type\":\"radio\",\"verify\":\"\",\"values\":\"1,0\",\"titles\":\"沙箱环境,生产环境\",\"verify\":\"required\"},{\"name\":\"serProvId\",\"desc\":\"服务商开发ID[serProvId]\",\"type\":\"text\",\"verify\":\"required\"},{\"name\":\"isvPrivateCertFile\",\"desc\":\"服务商私钥文件（.pfx格式）\",\"type\":\"file\",\"verify\":\"required\"},{\"name\":\"isvPrivateCertPwd\",\"desc\":\"服务商私钥文件密码\",\"type\":\"text\",\"verify\":\"required\",\"star\":\"1\"},{\"name\":\"ysfpayPublicKey\",\"desc\":\"云闪付开发公钥（证书管理页面可查询）\",\"type\":\"textarea\",\"verify\":\"required\",\"star\":\"1\"},{\"name\":\"acqOrgCode\",\"desc\":\"可用支付机构编号\",\"type\":\"text\",\"verify\":\"required\"}]', '[{\"name\":\"merId\",\"desc\":\"商户编号\",\"type\":\"text\",\"verify\":\"required\"}]', NULL, '[{\"wayCode\": \"YSF_BAR\"}, {\"wayCode\": \"ALI_JSAPI\"}, {\"wayCode\": \"WX_JSAPI\"}, {\"wayCode\": \"ALI_BAR\"}, {\"wayCode\": \"WX_BAR\"}]', 'http://jeequan.oss-cn-beijing.aliyuncs.com/jeepay/img/ysfpay.png', 'red', 1, '云闪付官方通道', '2024-10-22 23:02:41.477', '2024-10-22 23:02:41.477');

-- ----------------------------
-- Table structure for t_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_order`;
CREATE TABLE `t_pay_order`  (
  `pay_order_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付订单号',
  `mch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户号',
  `isv_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务商号',
  `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用ID',
  `mch_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户名称',
  `mch_type` tinyint(6) NOT NULL COMMENT '类型: 1-普通商户, 2-特约商户(服务商模式)',
  `mch_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户订单号',
  `if_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付接口代码',
  `way_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付方式代码',
  `amount` bigint(20) NOT NULL COMMENT '支付金额,单位分',
  `mch_fee_rate` decimal(20, 6) NOT NULL COMMENT '商户手续费费率快照',
  `mch_fee_amount` bigint(20) NOT NULL COMMENT '商户手续费,单位分',
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'cny' COMMENT '三位货币代码,人民币:cny',
  `state` tinyint(6) NOT NULL DEFAULT 0 COMMENT '支付状态: 0-订单生成, 1-支付中, 2-支付成功, 3-支付失败, 4-已撤销, 5-已退款, 6-订单关闭',
  `notify_state` tinyint(6) NOT NULL DEFAULT 0 COMMENT '向下游回调状态, 0-未发送,  1-已发送',
  `client_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端IP',
  `subject` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品标题',
  `body` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品描述信息',
  `channel_extra` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '特定渠道发起额外参数',
  `channel_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '渠道用户标识,如微信openId,支付宝账号',
  `channel_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '渠道订单号',
  `refund_state` tinyint(6) NOT NULL DEFAULT 0 COMMENT '退款状态: 0-未发生实际退款, 1-部分退款, 2-全额退款',
  `refund_times` int(11) NOT NULL DEFAULT 0 COMMENT '退款次数',
  `refund_amount` bigint(20) NOT NULL DEFAULT 0 COMMENT '退款总金额,单位分',
  `division_mode` tinyint(6) NULL DEFAULT 0 COMMENT '订单分账模式：0-该笔订单不允许分账, 1-支付成功按配置自动完成分账, 2-商户手动分账(解冻商户金额)',
  `division_state` tinyint(6) NULL DEFAULT 0 COMMENT '订单分账状态：0-未发生分账, 1-等待分账任务处理, 2-分账处理中, 3-分账任务已结束(不体现状态)',
  `division_last_time` datetime NULL DEFAULT NULL COMMENT '最新分账时间',
  `err_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '渠道支付错误码',
  `err_msg` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '渠道支付错误描述',
  `ext_param` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商户扩展参数',
  `notify_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '异步通知地址',
  `return_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '页面跳转地址',
  `expired_time` datetime NULL DEFAULT NULL COMMENT '订单失效时间',
  `success_time` datetime NULL DEFAULT NULL COMMENT '订单支付成功时间',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`pay_order_id`) USING BTREE,
  UNIQUE INDEX `Uni_MchNo_MchOrderNo`(`mch_no` ASC, `mch_order_no` ASC) USING BTREE,
  INDEX `created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '支付订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pay_order
-- ----------------------------
INSERT INTO `t_pay_order` VALUES ('P1849332815905923074', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17297502682293809', 'alipay', 'ALI_WAP', 1, 0.006000, 0, 'CNY', 6, 0, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-24 16:11:17', NULL, '2024-10-24 14:11:16.916', '2024-10-24 17:27:00.648');
INSERT INTO `t_pay_order` VALUES ('P1849332950903791617', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17297502780415242', 'alipay', 'ALI_WAP', 1, 0.006000, 0, 'CNY', 6, 0, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-24 16:11:49', NULL, '2024-10-24 14:11:49.101', '2024-10-24 17:27:00.648');
INSERT INTO `t_pay_order` VALUES ('P1849334008153612290', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17297505573634624', 'alipay', 'ALI_QR', 1, 0.006000, 0, 'CNY', 2, 0, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-24 16:16:01', NULL, '2024-10-24 14:16:01.000', '2024-10-24 17:27:00.000');
INSERT INTO `t_pay_order` VALUES ('P1849382821832658945', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17297621736303722', 'alipay', 'ALI_QR', 1, 0.006000, 0, 'CNY', 2, 1, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, '2024102422001425210503902582', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-24 19:29:59', '2024-10-24 17:40:01', '2024-10-24 17:29:59.258', '2024-10-24 17:40:01.014');
INSERT INTO `t_pay_order` VALUES ('P1849383414521368577', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17297623047586725', 'alipay', 'ALI_WAP', 1, 0.006000, 0, 'CNY', 2, 0, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-24 19:32:21', NULL, '2024-10-24 17:32:20.000', '2024-10-25 16:17:00.000');
INSERT INTO `t_pay_order` VALUES ('P1849383445555023873', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17297623406635418', 'alipay', 'ALI_QR', 1, 0.006000, 0, 'CNY', 2, 0, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-24 19:32:28', NULL, '2024-10-24 17:32:27.000', '2024-10-25 16:17:00.000');
INSERT INTO `t_pay_order` VALUES ('P1849385281167003649', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17297623492923893', 'alipay', 'ALI_QR', 15, 0.006000, 0, 'CNY', 2, 0, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-24 19:39:46', NULL, '2024-10-24 17:39:45.000', '2024-10-25 16:17:00.000');
INSERT INTO `t_pay_order` VALUES ('P1849385942394851329', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17297628672027230', 'alipay', 'ALI_QR', 15, 0.006000, 0, 'CNY', 2, 0, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-24 19:42:23', NULL, '2024-10-24 17:42:23.000', '2024-10-25 16:17:00.000');
INSERT INTO `t_pay_order` VALUES ('P1849386216417120258', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17297629635018128', 'alipay', 'ALI_QR', 15, 0.006000, 0, 'CNY', 2, 0, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-24 19:43:29', NULL, '2024-10-24 17:43:28.000', '2024-10-25 16:17:00.000');
INSERT INTO `t_pay_order` VALUES ('P1849387265580265473', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17297632543148872', 'alipay', 'ALI_QR', 1, 0.006000, 0, 'CNY', 2, 1, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, '2024102422001425210503903840', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'http://172.20.10.5:9218/api/anon/paytestNotify/payOrder', '', '2024-10-24 19:47:39', '2024-10-24 17:58:10', '2024-10-24 17:47:38.730', '2024-10-24 17:58:10.880');
INSERT INTO `t_pay_order` VALUES ('P1849387838807404546', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17297633914383957', 'alipay', 'ALI_QR', 1, 0.006000, 0, 'CNY', 2, 1, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, '2024102422001425210503908304', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'http://172.20.10.5:9218/api/anon/paytestNotify/payOrder', '', '2024-10-24 19:49:55', '2024-10-24 18:00:06', '2024-10-24 17:49:55.407', '2024-10-24 18:00:06.315');
INSERT INTO `t_pay_order` VALUES ('P1850130614557835266', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17299404820435926', 'alipay', 'ALI_QR', 1, 0.006000, 0, 'CNY', 6, 0, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-26 21:01:27', NULL, '2024-10-26 19:01:26.936', '2024-10-28 14:27:00.602');
INSERT INTO `t_pay_order` VALUES ('P1850131316004847617', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17299406401652068', 'alipay', 'ALI_QR', 64, 0.006000, 0, 'CNY', 6, 0, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-26 21:04:14', NULL, '2024-10-26 19:04:14.180', '2024-10-28 14:27:00.602');
INSERT INTO `t_pay_order` VALUES ('P1850131344509337602', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17299406552868314', 'alipay', 'ALI_QR', 64, 0.006000, 0, 'CNY', 6, 0, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-26 21:04:21', NULL, '2024-10-26 19:04:20.970', '2024-10-28 14:27:00.602');
INSERT INTO `t_pay_order` VALUES ('P1850132265473638402', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17299406633779624', 'alipay', 'ALI_QR', 64, 0.006000, 0, 'CNY', 2, 0, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-26 21:08:01', NULL, '2024-10-26 19:08:00.000', '2024-10-28 14:27:00.000');
INSERT INTO `t_pay_order` VALUES ('P1850792442325561346', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17300982687191220', 'alipay', 'ALI_QR', 10000, 0.006000, 60, 'CNY', 2, 1, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, '2024102822001425210503916589', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-28 16:51:19', '2024-10-28 15:02:01', '2024-10-28 14:51:18.972', '2024-10-28 15:02:01.295');
INSERT INTO `t_pay_order` VALUES ('P1850792741995999233', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17300983377519592', 'alipay', 'ALI_QR', 20000, 0.006000, 120, 'CNY', 2, 1, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, '2024102822001425210503922406', 0, 0, 0, 1, 3, '2024-10-28 15:03:05', NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-28 16:52:30', '2024-10-28 15:03:01', '2024-10-28 14:52:30.415', '2024-10-28 15:03:05.415');
INSERT INTO `t_pay_order` VALUES ('P1850793867621363713', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17300986132229340', 'alipay', 'ALI_QR', 10000, 0.006000, 60, 'CNY', 6, 0, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-28 16:56:59', NULL, '2024-10-28 14:56:58.787', '2024-10-28 16:57:00.044');
INSERT INTO `t_pay_order` VALUES ('P1850793898235588610', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17300986197008177', 'alipay', 'ALI_QR', 10000, 0.006000, 60, 'CNY', 6, 0, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-28 16:57:06', NULL, '2024-10-28 14:57:06.085', '2024-10-28 16:58:00.041');
INSERT INTO `t_pay_order` VALUES ('P1850793928904339457', 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'M17300986326668228', 'alipay', 'ALI_QR', 10000, 0.006000, 60, 'CNY', 2, 1, '0:0:0:0:0:0:0:1', '接口调试[M1729703764商户联调]', '接口调试[M1729703764商户联调]', NULL, NULL, '2024102822001425210503918517', 0, 0, 0, 1, 3, '2024-10-28 15:08:05', NULL, NULL, NULL, 'http://127.0.0.1:9218/api/anon/paytestNotify/payOrder', '', '2024-10-28 16:57:13', '2024-10-28 15:08:01', '2024-10-28 14:57:13.402', '2024-10-28 15:08:04.949');

-- ----------------------------
-- Table structure for t_pay_order_division_record
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_order_division_record`;
CREATE TABLE `t_pay_order_division_record`  (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分账记录ID',
  `mch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户号',
  `isv_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务商号',
  `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用ID',
  `mch_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户名称',
  `mch_type` tinyint(6) NOT NULL COMMENT '类型: 1-普通商户, 2-特约商户(服务商模式)',
  `if_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付接口代码',
  `pay_order_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '系统支付订单号',
  `pay_order_channel_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付订单渠道支付订单号',
  `pay_order_amount` bigint(20) NOT NULL COMMENT '订单金额,单位分',
  `pay_order_division_amount` bigint(20) NOT NULL COMMENT '订单实际分账金额, 单位：分（订单金额 - 商户手续费 - 已退款金额）',
  `batch_order_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '系统分账批次号',
  `channel_batch_order_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上游分账批次号',
  `state` tinyint(6) NOT NULL COMMENT '状态: 0-待分账 1-分账成功（明确成功）, 2-分账失败（明确失败）, 3-分账已受理（上游受理）',
  `channel_resp_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '上游返回数据包',
  `receiver_id` bigint(20) NOT NULL COMMENT '账号快照》 分账接收者ID',
  `receiver_group_id` bigint(20) NULL DEFAULT NULL COMMENT '账号快照》 组ID（便于商户接口使用）',
  `receiver_alias` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '接收者账号别名',
  `acc_type` tinyint(6) NOT NULL COMMENT '账号快照》 分账接收账号类型: 0-个人 1-商户',
  `acc_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号快照》 分账接收账号',
  `acc_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '账号快照》 分账接收账号名称',
  `relation_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号快照》 分账关系类型（参考微信）， 如： SERVICE_PROVIDER 服务商等',
  `relation_type_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号快照》 当选择自定义时，需要录入该字段。 否则为对应的名称',
  `division_profit` decimal(20, 6) NOT NULL COMMENT '账号快照》 配置的实际分账比例',
  `cal_division_amount` bigint(20) NOT NULL COMMENT '计算该接收方的分账金额,单位分',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1005 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分账记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pay_order_division_record
-- ----------------------------
INSERT INTO `t_pay_order_division_record` VALUES (1001, 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'alipay', 'P1850792741995999233', '2024102822001425210503922406', 20000, 19880, 'D1850795386638888962', '2024102822001425210503922406', 1, NULL, 800001, 100001, 'pgnihl8470@sandbox.com', 1, 'pgnihl8470@sandbox.com', 'pgnihl8470@sandbox.com', 'PARTNER', '合作伙伴', 0.100000, 1988, '2024-10-28 15:03:00.974', '2024-10-28 15:03:05.364');
INSERT INTO `t_pay_order_division_record` VALUES (1002, 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'alipay', 'P1850792741995999233', '2024102822001425210503922406', 20000, 19880, 'D1850795386638888962', '2024102822001425210503922406', 1, NULL, 800002, 100001, 'lcxptt4632@sandbox.com', 1, 'lcxptt4632@sandbox.com', 'lcxptt4632@sandbox.com', 'PARTNER', '合作伙伴', 0.100000, 1988, '2024-10-28 15:03:00.985', '2024-10-28 15:03:05.364');
INSERT INTO `t_pay_order_division_record` VALUES (1003, 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'alipay', 'P1850793928904339457', '2024102822001425210503918517', 10000, 9940, 'D1850796644737150978', '2024102822001425210503918517', 1, NULL, 800001, 100001, 'pgnihl8470@sandbox.com', 1, 'pgnihl8470@sandbox.com', 'pgnihl8470@sandbox.com', 'PARTNER', '合作伙伴', 0.100000, 994, '2024-10-28 15:08:00.913', '2024-10-28 15:08:04.920');
INSERT INTO `t_pay_order_division_record` VALUES (1004, 'M1729703764', NULL, '67192f55d2e0f36eccb0c3bc', '测试', 1, 'alipay', 'P1850793928904339457', '2024102822001425210503918517', 10000, 9940, 'D1850796644737150978', '2024102822001425210503918517', 1, NULL, 800002, 100001, 'lcxptt4632@sandbox.com', 1, 'lcxptt4632@sandbox.com', 'lcxptt4632@sandbox.com', 'PARTNER', '合作伙伴', 0.100000, 994, '2024-10-28 15:08:00.923', '2024-10-28 15:08:04.920');

-- ----------------------------
-- Table structure for t_pay_pankou_log
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_pankou_log`;
CREATE TABLE `t_pay_pankou_log`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `log_send` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送人',
  `log_context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送内容',
  `log_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `log_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送状态(1：成功   2：失败)',
  `log_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送地址',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '回调盘口日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pay_pankou_log
-- ----------------------------
INSERT INTO `t_pay_pankou_log` VALUES (1, 'jeepay', '{payOrderId=P1849383414521368577, amount=1}', '2024-10-25 22:47:07', '1', 'https://www.baidu.com/');
INSERT INTO `t_pay_pankou_log` VALUES (2, 'jeepay', '{payOrderId=P1849334008153612290, amount=1}', '2024-10-25 23:53:19', '1', 'https://www.baidu.com/');
INSERT INTO `t_pay_pankou_log` VALUES (3, 'jeepay', '{payOrderId=P1850132265473638402, amount=64}', '2024-10-28 14:29:24', '1', 'https://www.baidu.com/');

-- ----------------------------
-- Table structure for t_pay_way
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_way`;
CREATE TABLE `t_pay_way`  (
  `way_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付方式代码  例如： wxpay_jsapi',
  `way_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付方式名称',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`way_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '支付方式表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pay_way
-- ----------------------------
INSERT INTO `t_pay_way` VALUES ('ALI_APP', '支付宝APP', '2024-10-22 23:02:41.475', '2024-10-22 23:02:41.475');
INSERT INTO `t_pay_way` VALUES ('ALI_BAR', '支付宝条码', '2024-10-22 23:02:41.473', '2024-10-22 23:02:41.473');
INSERT INTO `t_pay_way` VALUES ('ALI_JSAPI', '支付宝生活号', '2024-10-22 23:02:41.474', '2024-10-22 23:02:41.474');
INSERT INTO `t_pay_way` VALUES ('ALI_LITE', '支付宝小程序', '2024-10-22 23:02:41.475', '2024-10-22 23:02:41.475');
INSERT INTO `t_pay_way` VALUES ('ALI_OC', '支付宝订单码', '2024-10-22 23:02:41.475', '2024-10-22 23:02:41.475');
INSERT INTO `t_pay_way` VALUES ('ALI_PC', '支付宝PC网站', '2024-10-22 23:02:41.475', '2024-10-22 23:02:41.475');
INSERT INTO `t_pay_way` VALUES ('ALI_QR', '支付宝二维码', '2024-10-22 23:02:41.475', '2024-10-22 23:02:41.475');
INSERT INTO `t_pay_way` VALUES ('ALI_WAP', '支付宝WAP', '2024-10-22 23:02:41.475', '2024-10-22 23:02:41.475');
INSERT INTO `t_pay_way` VALUES ('PP_PC', 'PayPal支付', '2024-10-22 23:02:41.475', '2024-10-22 23:02:41.475');
INSERT INTO `t_pay_way` VALUES ('UP_APP', '银联App支付', '2024-10-22 23:02:41.475', '2024-10-22 23:02:41.475');
INSERT INTO `t_pay_way` VALUES ('UP_B2B', '银联企业网银支付', '2024-10-22 23:02:41.476', '2024-10-22 23:02:41.476');
INSERT INTO `t_pay_way` VALUES ('UP_BAR', '银联二维码(被扫)', '2024-10-22 23:02:41.476', '2024-10-22 23:02:41.476');
INSERT INTO `t_pay_way` VALUES ('UP_JSAPI', '银联Js支付', '2024-10-22 23:02:41.476', '2024-10-22 23:02:41.476');
INSERT INTO `t_pay_way` VALUES ('UP_PC', '银联网关支付', '2024-10-22 23:02:41.476', '2024-10-22 23:02:41.476');
INSERT INTO `t_pay_way` VALUES ('UP_QR', '银联二维码(主扫)', '2024-10-22 23:02:41.476', '2024-10-22 23:02:41.476');
INSERT INTO `t_pay_way` VALUES ('UP_WAP', '银联手机网站支付', '2024-10-22 23:02:41.475', '2024-10-22 23:02:41.475');
INSERT INTO `t_pay_way` VALUES ('WX_APP', '微信APP', '2024-10-22 23:02:41.475', '2024-10-22 23:02:41.475');
INSERT INTO `t_pay_way` VALUES ('WX_BAR', '微信条码', '2024-10-22 23:02:41.475', '2024-10-22 23:02:41.475');
INSERT INTO `t_pay_way` VALUES ('WX_H5', '微信H5', '2024-10-22 23:02:41.475', '2024-10-22 23:02:41.475');
INSERT INTO `t_pay_way` VALUES ('WX_JSAPI', '微信公众号', '2024-10-22 23:02:41.475', '2024-10-22 23:02:41.475');
INSERT INTO `t_pay_way` VALUES ('WX_LITE', '微信小程序', '2024-10-22 23:02:41.475', '2024-10-22 23:02:41.475');
INSERT INTO `t_pay_way` VALUES ('WX_NATIVE', '微信扫码', '2024-10-22 23:02:41.475', '2024-10-22 23:02:41.475');
INSERT INTO `t_pay_way` VALUES ('YSF_BAR', '云闪付条码', '2024-10-22 23:02:41.475', '2024-10-22 23:02:41.475');
INSERT INTO `t_pay_way` VALUES ('YSF_JSAPI', '云闪付jsapi', '2024-10-22 23:02:41.475', '2024-10-22 23:02:41.475');

-- ----------------------------
-- Table structure for t_refund_order
-- ----------------------------
DROP TABLE IF EXISTS `t_refund_order`;
CREATE TABLE `t_refund_order`  (
  `refund_order_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '退款订单号（支付系统生成订单号）',
  `pay_order_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付订单号（与t_pay_order对应）',
  `channel_pay_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '渠道支付单号（与t_pay_order channel_order_no对应）',
  `mch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户号',
  `isv_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务商号',
  `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用ID',
  `mch_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户名称',
  `mch_type` tinyint(6) NOT NULL COMMENT '类型: 1-普通商户, 2-特约商户(服务商模式)',
  `mch_refund_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户退款单号（商户系统的订单号）',
  `way_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付方式代码',
  `if_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付接口代码',
  `pay_amount` bigint(20) NOT NULL COMMENT '支付金额,单位分',
  `refund_amount` bigint(20) NOT NULL COMMENT '退款金额,单位分',
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'cny' COMMENT '三位货币代码,人民币:cny',
  `state` tinyint(6) NOT NULL DEFAULT 0 COMMENT '退款状态:0-订单生成,1-退款中,2-退款成功,3-退款失败,4-退款任务关闭',
  `client_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端IP',
  `refund_reason` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '退款原因',
  `channel_order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '渠道订单号',
  `err_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '渠道错误码',
  `err_msg` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '渠道错误描述',
  `channel_extra` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '特定渠道发起时额外参数',
  `notify_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '通知地址',
  `ext_param` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '扩展参数',
  `success_time` datetime NULL DEFAULT NULL COMMENT '订单退款成功时间',
  `expired_time` datetime NULL DEFAULT NULL COMMENT '退款失效时间（失效后系统更改为退款任务关闭状态）',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`refund_order_id`) USING BTREE,
  UNIQUE INDEX `Uni_MchNo_MchRefundNo`(`mch_no` ASC, `mch_refund_no` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '退款订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_refund_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_config`;
CREATE TABLE `t_sys_config`  (
  `config_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '配置KEY',
  `config_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '配置名称',
  `config_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '描述信息',
  `group_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分组key',
  `group_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分组名称',
  `config_val` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '配置内容项',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'text' COMMENT '类型: text-输入框, textarea-多行文本, uploadImg-上传图片, switch-开关',
  `sort_num` bigint(20) NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`config_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_config
-- ----------------------------
INSERT INTO `t_sys_config` VALUES ('mchSiteUrl', '商户平台网址(不包含结尾/)', '商户平台网址(不包含结尾/)', 'applicationConfig', '系统应用配置', 'http://127.0.0.1:9218', 'text', 0, '2024-10-26 18:59:28.120');
INSERT INTO `t_sys_config` VALUES ('mgrSiteUrl', '运营平台网址(不包含结尾/)', '运营平台网址(不包含结尾/)', 'applicationConfig', '系统应用配置', 'http://127.0.0.1:9217', 'text', 0, '2024-10-26 18:59:32.291');
INSERT INTO `t_sys_config` VALUES ('ossPublicSiteUrl', '公共oss访问地址(不包含结尾/)', '公共oss访问地址(不包含结尾/)', 'applicationConfig', '系统应用配置', 'http://127.0.0.1:9217/api/anon/localOssFiles', 'text', 0, '2024-10-26 18:59:36.886');
INSERT INTO `t_sys_config` VALUES ('paySiteUrl', '支付网关地址(不包含结尾/)', '支付网关地址(不包含结尾/)', 'applicationConfig', '系统应用配置', 'http://127.0.0.1:9216', 'text', 0, '2024-10-26 18:59:46.586');

-- ----------------------------
-- Table structure for t_sys_entitlement
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_entitlement`;
CREATE TABLE `t_sys_entitlement`  (
  `ent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限ID[ENT_功能模块_子模块_操作], eg: ENT_ROLE_LIST_ADD',
  `ent_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限名称',
  `menu_icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `menu_uri` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单uri/路由地址',
  `component_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件Name（前后端分离使用）',
  `ent_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限类型 ML-左侧显示菜单, MO-其他菜单, PB-页面/按钮',
  `quick_jump` tinyint(6) NOT NULL DEFAULT 0 COMMENT '快速开始菜单 0-否, 1-是',
  `state` tinyint(6) NOT NULL DEFAULT 1 COMMENT '状态 0-停用, 1-启用',
  `pid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '父ID',
  `ent_sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序字段, 规则：正序',
  `sys_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属系统： MGR-运营平台, MCH-商户中心',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`ent_id`, `sys_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_entitlement
-- ----------------------------
INSERT INTO `t_sys_entitlement` VALUES ('ENT_C_MAIN', '主页', 'home', '/main', 'MainPage', 'ML', 0, 1, 'ROOT', 1, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_C_MAIN_NUMBER_COUNT', '主页数量总统计', 'no-icon', '', '', 'PB', 0, 1, 'ENT_C_MAIN', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_C_MAIN_PAY_AMOUNT_WEEK', '主页周支付统计', 'no-icon', '', '', 'PB', 0, 1, 'ENT_C_MAIN', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_C_MAIN_PAY_COUNT', '主页交易统计', 'no-icon', '', '', 'PB', 0, 1, 'ENT_C_MAIN', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_C_MAIN_PAY_TYPE_COUNT', '主页交易方式统计', 'no-icon', '', '', 'PB', 0, 1, 'ENT_C_MAIN', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_C_USERINFO', '个人中心', 'no-icon', '/current/userinfo', 'CurrentUserInfo', 'MO', 0, 1, 'ENT_COMMONS', -1, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_C_USERINFO', '个人中心', 'no-icon', '/current/userinfo', 'CurrentUserInfo', 'MO', 0, 1, 'ENT_COMMONS', -1, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_COMMONS', '系统通用菜单', 'no-icon', '', 'RouteView', 'MO', 0, 1, 'ROOT', -1, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_COMMONS', '系统通用菜单', 'no-icon', '', 'RouteView', 'MO', 0, 1, 'ROOT', -1, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_DIVISION', '分账管理', 'apartment', '', 'RouteView', 'ML', 0, 1, 'ROOT', 30, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_DIVISION_RECEIVER', '收款账号管理', 'trademark', '/divisionReceiver', 'DivisionReceiverPage', 'ML', 0, 1, 'ENT_DIVISION', 20, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_DIVISION_RECEIVER_ADD', '按钮：新增收款账号', 'no-icon', '', '', 'PB', 0, 1, 'ENT_DIVISION_RECEIVER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_DIVISION_RECEIVER_DELETE', '按钮：删除收款账号', 'no-icon', '', '', 'PB', 0, 1, 'ENT_DIVISION_RECEIVER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_DIVISION_RECEIVER_EDIT', '按钮：修改账号信息', 'no-icon', '', '', 'PB', 0, 1, 'ENT_DIVISION_RECEIVER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_DIVISION_RECEIVER_GROUP', '账号组管理', 'team', '/divisionReceiverGroup', 'DivisionReceiverGroupPage', 'ML', 0, 1, 'ENT_DIVISION', 10, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_DIVISION_RECEIVER_GROUP_ADD', '按钮：新增', 'no-icon', '', '', 'PB', 0, 1, 'ENT_DIVISION_RECEIVER_GROUP', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_DIVISION_RECEIVER_GROUP_DELETE', '按钮：删除', 'no-icon', '', '', 'PB', 0, 1, 'ENT_DIVISION_RECEIVER_GROUP', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_DIVISION_RECEIVER_GROUP_EDIT', '按钮：修改', 'no-icon', '', '', 'PB', 0, 1, 'ENT_DIVISION_RECEIVER_GROUP', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_DIVISION_RECEIVER_GROUP_LIST', '页面：数据列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_DIVISION_RECEIVER_GROUP', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_DIVISION_RECEIVER_GROUP_VIEW', '按钮：详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_DIVISION_RECEIVER_GROUP', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_DIVISION_RECEIVER_LIST', '页面：数据列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_DIVISION_RECEIVER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_DIVISION_RECEIVER_VIEW', '按钮：详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_DIVISION_RECEIVER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_DIVISION_RECORD', '分账记录', 'unordered-list', '/divisionRecord', 'DivisionRecordPage', 'ML', 0, 1, 'ENT_DIVISION', 30, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_DIVISION_RECORD_LIST', '页面：数据列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_DIVISION_RECORD', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_DIVISION_RECORD_RESEND', '按钮：重试', 'no-icon', '', '', 'PB', 0, 1, 'ENT_DIVISION_RECORD', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_DIVISION_RECORD_VIEW', '按钮：详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_DIVISION_RECORD', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_ISV', '服务商管理', 'block', '', 'RouteView', 'ML', 0, 1, 'ROOT', 40, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_ISV_INFO', '服务商列表', 'profile', '/isv', 'IsvListPage', 'ML', 0, 1, 'ENT_ISV', 10, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_ISV_INFO_ADD', '按钮：新增', 'no-icon', '', '', 'PB', 0, 1, 'ENT_ISV_INFO', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_ISV_INFO_DEL', '按钮：删除', 'no-icon', '', '', 'PB', 0, 1, 'ENT_ISV_INFO', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_ISV_INFO_EDIT', '按钮：编辑', 'no-icon', '', '', 'PB', 0, 1, 'ENT_ISV_INFO', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_ISV_INFO_VIEW', '按钮：详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_ISV_INFO', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_ISV_LIST', '页面：服务商列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_ISV_INFO', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_ISV_PAY_CONFIG_ADD', '服务商支付参数配置', 'no-icon', '', '', 'PB', 0, 1, 'ENT_ISV_PAY_CONFIG_LIST', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_ISV_PAY_CONFIG_LIST', '服务商支付参数配置列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_ISV_INFO', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_ISV_PAY_CONFIG_VIEW', '服务商支付参数配置详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_ISV_PAY_CONFIG_LIST', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_LOG_LIST', '页面：系统日志列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_SYS_LOG', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH', '商户管理', 'shop', '', 'RouteView', 'ML', 0, 1, 'ROOT', 30, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_APP', '应用管理', 'appstore', '/apps', 'MchAppPage', 'ML', 0, 1, 'ENT_MCH_CENTER', 10, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_APP', '应用列表', 'appstore', '/apps', 'MchAppPage', 'ML', 0, 1, 'ENT_MCH', 20, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_APP_ADD', '按钮：新增', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_APP', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_APP_ADD', '按钮：新增', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_APP', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_APP_CONFIG', '应用配置', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_INFO', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_APP_DEL', '按钮：删除', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_APP', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_APP_DEL', '按钮：删除', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_APP', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_APP_EDIT', '按钮：编辑', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_APP', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_APP_EDIT', '按钮：编辑', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_APP', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_APP_LIST', '页面：应用列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_APP', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_APP_LIST', '页面：应用列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_APP', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_APP_VIEW', '按钮：详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_APP', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_APP_VIEW', '按钮：详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_APP', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_CENTER', '商户中心', 'team', '', 'RouteView', 'ML', 0, 1, 'ROOT', 10, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_INFO', '商户列表', 'profile', '/mch', 'MchListPage', 'ML', 0, 1, 'ENT_MCH', 10, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_INFO_ADD', '按钮：新增', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_INFO', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_INFO_DEL', '按钮：删除', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_INFO', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_INFO_EDIT', '按钮：编辑', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_INFO', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_INFO_VIEW', '按钮：详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_INFO', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_LIST', '页面：商户列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_INFO', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_MAIN', '主页', 'home', '/main', 'MainPage', 'ML', 0, 1, 'ROOT', 1, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_MAIN_NUMBER_COUNT', '主页数量总统计', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_MAIN', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_MAIN_PAY_AMOUNT_WEEK', '主页周支付统计', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_MAIN', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_MAIN_PAY_COUNT', '主页交易统计', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_MAIN', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_MAIN_PAY_TYPE_COUNT', '主页交易方式统计', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_MAIN', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_MAIN_USER_INFO', '主页用户信息', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_MAIN', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_NOTIFY', '商户通知', 'notification', '/notify', 'MchNotifyListPage', 'ML', 0, 1, 'ENT_ORDER', 30, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_NOTIFY_RESEND', '按钮：重发通知', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_NOTIFY', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_NOTIFY_VIEW', '按钮：详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_NOTIFY', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_PAY_CONFIG_ADD', '应用支付参数配置', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_PAY_CONFIG_LIST', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_PAY_CONFIG_ADD', '应用支付参数配置', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_PAY_CONFIG_LIST', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_PAY_CONFIG_LIST', '应用支付参数配置列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_APP', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_PAY_CONFIG_LIST', '应用支付参数配置列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_APP', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_PAY_CONFIG_VIEW', '应用支付参数配置详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_PAY_CONFIG_LIST', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_PAY_CONFIG_VIEW', '应用支付参数配置详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_PAY_CONFIG_LIST', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_PAY_PASSAGE_ADD', '应用支付通道配置保存', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_PAY_PASSAGE_LIST', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_PAY_PASSAGE_ADD', '应用支付通道配置保存', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_PAY_PASSAGE_LIST', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_PAY_PASSAGE_CONFIG', '应用支付通道配置入口', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_PAY_PASSAGE_LIST', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_PAY_PASSAGE_CONFIG', '应用支付通道配置入口', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_PAY_PASSAGE_LIST', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_PAY_PASSAGE_LIST', '应用支付通道配置列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_APP', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_PAY_PASSAGE_LIST', '应用支付通道配置列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_APP', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_PAY_TEST', '支付测试', 'transaction', '/paytest', 'PayTestPage', 'ML', 0, 1, 'ENT_MCH_CENTER', 20, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_PAY_TEST_DO', '按钮：支付测试', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_PAY_TEST', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_PAY_TEST_PAYWAY_LIST', '页面：获取全部支付方式', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_PAY_TEST', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_TRANSFER', '转账', 'property-safety', '/doTransfer', 'MchTransferPage', 'ML', 0, 1, 'ENT_MCH_CENTER', 30, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_TRANSFER_CHANNEL_USER', '按钮：获取渠道用户', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_TRANSFER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_TRANSFER_DO', '按钮：发起转账', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_TRANSFER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_MCH_TRANSFER_IF_CODE_LIST', '页面：获取全部代付通道', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_TRANSFER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_NOTIFY_LIST', '页面：商户通知列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_MCH_NOTIFY', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_ORDER', '订单中心', 'transaction', '', 'RouteView', 'ML', 0, 1, 'ROOT', 20, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_ORDER', '订单管理', 'transaction', '', 'RouteView', 'ML', 0, 1, 'ROOT', 50, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_ORDER_LIST', '页面：订单列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PAY_ORDER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_ORDER_LIST', '页面：订单列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PAY_ORDER', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PAY_ORDER', '订单管理', 'account-book', '/pay', 'PayOrderListPage', 'ML', 0, 1, 'ENT_ORDER', 10, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PAY_ORDER', '支付订单', 'account-book', '/pay', 'PayOrderListPage', 'ML', 0, 1, 'ENT_ORDER', 10, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PAY_ORDER_PANKOUURL', '按钮：回调', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PAY_ORDER', 0, 'MCH', '2024-10-25 17:22:41.000', '2024-10-25 17:22:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PAY_ORDER_PANKOUURL', '按钮：回调', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PAY_ORDER', 0, 'MGR', '2024-10-25 17:22:41.000', '2024-10-25 17:22:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PAY_ORDER_REFUND', '按钮：订单退款', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PAY_ORDER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PAY_ORDER_REFUND', '按钮：订单退款', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PAY_ORDER', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PAY_ORDER_SEARCH_PAY_WAY', '筛选项：支付方式', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PAY_ORDER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PAY_ORDER_SEARCH_PAY_WAY', '筛选项：支付方式', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PAY_ORDER', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PAY_ORDER_VIEW', '按钮：详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PAY_ORDER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PAY_ORDER_VIEW', '按钮：详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PAY_ORDER', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PC', '支付配置', 'file-done', '', 'RouteView', 'ML', 0, 1, 'ROOT', 60, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PC_IF_DEFINE', '支付接口', 'interaction', '/ifdefines', 'IfDefinePage', 'ML', 0, 1, 'ENT_PC', 10, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PC_IF_DEFINE_ADD', '按钮：新增', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PC_IF_DEFINE', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PC_IF_DEFINE_DEL', '按钮：删除', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PC_IF_DEFINE', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PC_IF_DEFINE_EDIT', '按钮：修改', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PC_IF_DEFINE', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PC_IF_DEFINE_LIST', '页面：支付接口定义列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PC_IF_DEFINE', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PC_IF_DEFINE_SEARCH', '页面：搜索', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PC_IF_DEFINE', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PC_IF_DEFINE_VIEW', '按钮：详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PC_IF_DEFINE', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PC_WAY', '支付方式', 'appstore', '/payways', 'PayWayPage', 'ML', 0, 1, 'ENT_PC', 20, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PC_WAY_ADD', '按钮：新增', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PC_WAY', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PC_WAY_DEL', '按钮：删除', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PC_WAY', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PC_WAY_EDIT', '按钮：修改', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PC_WAY', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PC_WAY_LIST', '页面：支付方式列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PC_WAY', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PC_WAY_SEARCH', '页面：搜索', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PC_WAY', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_PC_WAY_VIEW', '按钮：详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_PC_WAY', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_REFUND_LIST', '页面：退款订单列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_REFUND_ORDER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_REFUND_LIST', '页面：退款订单列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_REFUND_ORDER', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_REFUND_ORDER', '退款记录', 'exception', '/refund', 'RefundOrderListPage', 'ML', 0, 1, 'ENT_ORDER', 20, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_REFUND_ORDER', '退款订单', 'exception', '/refund', 'RefundOrderListPage', 'ML', 0, 1, 'ENT_ORDER', 20, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_REFUND_ORDER_VIEW', '按钮：详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_REFUND_ORDER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_REFUND_ORDER_VIEW', '按钮：详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_REFUND_ORDER', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_SYS_CONFIG', '系统管理', 'setting', '', 'RouteView', 'ML', 0, 1, 'ROOT', 200, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_SYS_CONFIG', '系统管理', 'setting', '', 'RouteView', 'ML', 0, 1, 'ROOT', 200, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_SYS_CONFIG_EDIT', '按钮： 修改', 'no-icon', '', '', 'PB', 0, 1, 'ENT_SYS_CONFIG_INFO', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_SYS_CONFIG_INFO', '系统配置', 'setting', '/config', 'SysConfigPage', 'ML', 0, 1, 'ENT_SYS_CONFIG', 15, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_SYS_LOG', '系统日志', 'file-text', '/log', 'SysLogPage', 'ML', 0, 1, 'ENT_SYS_CONFIG', 20, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_SYS_LOG_DEL', '按钮：删除', 'no-icon', '', '', 'PB', 0, 1, 'ENT_SYS_LOG', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_SYS_LOG_VIEW', '按钮：详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_SYS_LOG', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_TRANSFER_ORDER', '转账订单', 'property-safety', '/transfer', 'TransferOrderListPage', 'ML', 0, 1, 'ENT_ORDER', 30, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_TRANSFER_ORDER', '转账订单', 'property-safety', '/transfer', 'TransferOrderListPage', 'ML', 0, 1, 'ENT_ORDER', 25, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_TRANSFER_ORDER_LIST', '页面：转账订单列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_TRANSFER_ORDER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_TRANSFER_ORDER_LIST', '页面：转账订单列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_TRANSFER_ORDER', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_TRANSFER_ORDER_VIEW', '按钮：详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_TRANSFER_ORDER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_TRANSFER_ORDER_VIEW', '按钮：详情', 'no-icon', '', '', 'PB', 0, 1, 'ENT_TRANSFER_ORDER', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR', '用户角色管理', 'team', '', 'RouteView', 'ML', 0, 1, 'ENT_SYS_CONFIG', 10, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR', '用户角色管理', 'team', '', 'RouteView', 'ML', 0, 1, 'ENT_SYS_CONFIG', 10, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_ROLE', '角色管理', 'user', '/roles', 'RolePage', 'ML', 0, 1, 'ENT_UR', 20, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_ROLE', '角色管理', 'user', '/roles', 'RolePage', 'ML', 0, 1, 'ENT_UR', 20, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_ROLE_ADD', '按钮：添加角色', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_ROLE', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_ROLE_ADD', '按钮：添加角色', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_ROLE', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_ROLE_DEL', '按钮： 删除', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_ROLE', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_ROLE_DEL', '按钮： 删除', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_ROLE', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_ROLE_DIST', '按钮： 分配权限', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_ROLE', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_ROLE_DIST', '按钮： 分配权限', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_ROLE', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_ROLE_EDIT', '按钮： 修改名称', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_ROLE', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_ROLE_EDIT', '按钮： 修改基本信息', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_ROLE', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_ROLE_ENT', '权限管理', 'apartment', '/ents', 'EntPage', 'ML', 0, 1, 'ENT_UR', 30, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_ROLE_ENT_EDIT', '按钮： 权限变更', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_ROLE_ENT', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_ROLE_ENT_LIST', '页面： 权限列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_ROLE_ENT', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_ROLE_LIST', '页面：角色列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_ROLE', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_ROLE_LIST', '页面：角色列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_ROLE', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_ROLE_SEARCH', '页面：搜索', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_ROLE', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_ROLE_SEARCH', '页面：搜索', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_ROLE', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_USER', '操作员管理', 'contacts', '/users', 'SysUserPage', 'ML', 0, 1, 'ENT_UR', 10, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_USER', '操作员管理', 'contacts', '/users', 'SysUserPage', 'ML', 0, 1, 'ENT_UR', 10, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_USER_ADD', '按钮：添加操作员', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_USER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_USER_ADD', '按钮：添加操作员', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_USER', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_USER_DELETE', '按钮： 删除操作员', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_USER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_USER_DELETE', '按钮： 删除操作员', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_USER', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_USER_EDIT', '按钮： 修改基本信息', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_USER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_USER_EDIT', '按钮： 修改基本信息', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_USER', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_USER_LIST', '页面：操作员列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_USER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_USER_LIST', '页面：操作员列表', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_USER', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_USER_SEARCH', '按钮：搜索', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_USER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_USER_SEARCH', '按钮：搜索', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_USER', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_USER_UPD_ROLE', '按钮： 角色分配', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_USER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_USER_UPD_ROLE', '按钮： 角色分配', 'no-icon', '', '', 'PB', 0, 1, 'ENT_UR_USER', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_USER_VIEW', '按钮： 详情', '', 'no-icon', '', 'PB', 0, 1, 'ENT_UR_USER', 0, 'MCH', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');
INSERT INTO `t_sys_entitlement` VALUES ('ENT_UR_USER_VIEW', '按钮： 详情', '', 'no-icon', '', 'PB', 0, 1, 'ENT_UR_USER', 0, 'MGR', '2024-10-22 23:02:41.000', '2024-10-22 23:02:41.000');

-- ----------------------------
-- Table structure for t_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_log`;
CREATE TABLE `t_sys_log`  (
  `sys_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '系统用户ID',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `user_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户IP',
  `sys_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属系统： MGR-运营平台, MCH-商户中心',
  `method_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '方法名',
  `method_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '方法描述',
  `req_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '请求地址',
  `opt_req_param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '操作请求参数',
  `opt_res_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '操作响应结果',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  PRIMARY KEY (`sys_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_log
-- ----------------------------
INSERT INTO `t_sys_log` VALUES (1, NULL, NULL, '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"YWNrOQ==\",\"vt\":\"N2I2ZmFhODktYjcxNS00ZmViLWI0ZDUtZDU4MzdkY2IxYTZj\"}', '用户名/密码错误！', '2024-10-24 01:10:26.036');
INSERT INTO `t_sys_log` VALUES (2, NULL, NULL, '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"YWRtaW5o\",\"ia\":\"amVlcGF5\",\"vc\":\"aW9xcw==\",\"vt\":\"ZjU0MjJhNmMtZTA4Yi00OTllLTg5NTEtNTA1ZGQ0OTI4NDMw\"}', '验证码有误！', '2024-10-24 01:11:43.015');
INSERT INTO `t_sys_log` VALUES (3, NULL, NULL, '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"YWRtaW5o\",\"ia\":\"amVlcGF5\",\"vc\":\"c2Jqaw==\",\"vt\":\"ZTNhNzE4MjAtOTRlNi00NDNjLWIyZDItOTcyM2MwMjk3NWZi\"}', '用户名/密码错误！', '2024-10-24 01:11:47.285');
INSERT INTO `t_sys_log` VALUES (4, NULL, NULL, '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"c2Jqaw==\",\"vt\":\"ZTNhNzE4MjAtOTRlNi00NDNjLWIyZDItOTcyM2MwMjk3NWZi\"}', '用户名/密码错误！', '2024-10-24 01:11:52.934');
INSERT INTO `t_sys_log` VALUES (5, NULL, NULL, '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"MDBoNjk=\",\"vt\":\"MzMzNWJkNGItNjcyNy00ZGNhLWIwMzItMTIzYTlmMzQ1NDJm\"}', '验证码有误！', '2024-10-24 01:13:21.331');
INSERT INTO `t_sys_log` VALUES (6, NULL, NULL, '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"MGg2OQ==\",\"vt\":\"MzMzNWJkNGItNjcyNy00ZGNhLWIwMzItMTIzYTlmMzQ1NDJm\"}', '用户名/密码错误！', '2024-10-24 01:13:25.547');
INSERT INTO `t_sys_log` VALUES (7, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"a2xrbA==\",\"vt\":\"NjQ2YjRhMDAtOTQ5ZS00MjgyLWI5NWMtZTA2OGZkYWFjMDE1\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzgwMV9jNzA3NjljYy1jMGVjLTQ1MmYtYjI3OC0xNzI5MGJiYzViNjUiLCJjcmVhdGVkIjoxNzI5NzAzNjM2NjUyLCJzeXNVc2VySWQiOjgwMX0.TnwDEfiS4pInWII4H-EIEeuLOVPBpPq_7ns6zXeU5DFOUr2a1iBXfC4RVOdkRnjz1lNY9kVKIPlpIaTWma3w0g\"}}', '2024-10-24 01:13:57.352');
INSERT INTO `t_sys_log` VALUES (8, NULL, NULL, '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"ejh4Zg==\",\"vt\":\"YzZjOGQ3MDUtZTgwNC00Y2FjLTkzYzAtYmY1NzVkMjBkYWM0\"}', '用户名/密码错误！', '2024-10-24 01:14:15.401');
INSERT INTO `t_sys_log` VALUES (9, NULL, NULL, '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5NjY2\",\"vc\":\"ejh4Zg==\",\"vt\":\"YzZjOGQ3MDUtZTgwNC00Y2FjLTkzYzAtYmY1NzVkMjBkYWM0\"}', '用户名/密码错误！', '2024-10-24 01:14:18.520');
INSERT INTO `t_sys_log` VALUES (10, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.merchant.MchInfoController.add', '新增商户', 'http://localhost:9217/api/mchInfo', '{\"loginUserName\":\"jeepay\",\"contactName\":\"jeepay\",\"mchName\":\"测试商户\",\"state\":1,\"type\":1,\"mchShortName\":\"测试\",\"contactTel\":\"13100000000\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-24 01:16:05.470');
INSERT INTO `t_sys_log` VALUES (11, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"aG12eA==\",\"vt\":\"NzBmMzY1YzctZTZlYS00MDNhLTg0MzYtZjA1ZDQ4MDk0MmI1\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzEwMDAwMV8yNjA0YWViZC1kMGNkLTRiOTktOGUyOC1kMmIyYjFjNzI5NjMiLCJjcmVhdGVkIjoxNzI5NzAzNzgwMTE4LCJzeXNVc2VySWQiOjEwMDAwMX0.fGTTBrFMfvQ2HgxqigQ4QKXKyqxK4lhdnB32-a1aWhcC7S8eGHNuNXDzqSTwCEmuZgDi3lzaYy4ZYtv_5uKkqg\"}}', '2024-10-24 01:16:20.731');
INSERT INTO `t_sys_log` VALUES (12, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.payconfig.PayInterfaceDefineController.update', '更新支付接口', 'http://localhost:9217/api/payIfDefines/alipay', '{\"ifCode\":\"alipay\",\"normalMchParams\":\"[{\\\"name\\\":\\\"sandbox\\\",\\\"desc\\\":\\\"环境配置\\\",\\\"type\\\":\\\"radio\\\",\\\"verify\\\":\\\"\\\",\\\"values\\\":\\\"1,0\\\",\\\"titles\\\":\\\"沙箱环境,生产环境\\\",\\\"verify\\\":\\\"required\\\"},{\\\"name\\\":\\\"appId\\\",\\\"desc\\\":\\\"应用App ID\\\",\\\"type\\\":\\\"text\\\",\\\"verify\\\":\\\"required\\\"},{\\\"name\\\":\\\"privateKey\\\", \\\"desc\\\":\\\"应用私钥\\\", \\\"type\\\": \\\"textarea\\\",\\\"verify\\\":\\\"required\\\",\\\"star\\\":\\\"1\\\"},{\\\"name\\\":\\\"alipayPublicKey\\\", \\\"desc\\\":\\\"支付宝公钥(不使用证书时必填)\\\", \\\"type\\\": \\\"textarea\\\",\\\"star\\\":\\\"1\\\"},{\\\"name\\\":\\\"signType\\\",\\\"desc\\\":\\\"接口签名方式(推荐使用RSA2)\\\",\\\"type\\\":\\\"radio\\\",\\\"verify\\\":\\\"\\\",\\\"values\\\":\\\"RSA,RSA2\\\",\\\"titles\\\":\\\"RSA,RSA2\\\",\\\"verify\\\":\\\"required\\\"},{\\\"name\\\":\\\"useCert\\\",\\\"desc\\\":\\\"公钥证书\\\",\\\"type\\\":\\\"radio\\\",\\\"verify\\\":\\\"\\\",\\\"values\\\":\\\"1,0\\\",\\\"titles\\\":\\\"使用证书（请使用RSA2私钥）,不使用证书\\\"},{\\\"name\\\":\\\"appPublicCert\\\",\\\"desc\\\":\\\"应用公钥证书（.crt格式）\\\",\\\"type\\\":\\\"file\\\",\\\"verify\\\":\\\"\\\"},{\\\"name\\\":\\\"alipayPublicCert\\\",\\\"desc\\\":\\\"支付宝公钥证书（.crt格式）\\\",\\\"type\\\":\\\"file\\\",\\\"verify\\\":\\\"\\\"},{\\\"name\\\":\\\"alipayRootCert\\\",\\\"desc\\\":\\\"支付宝根证书（.crt格式）\\\",\\\"type\\\":\\\"file\\\",\\\"verify\\\":\\\"\\\"}]\",\"isIsvMode\":1,\"ifName\":\"支付宝官方\",\"wayCodeStrs\":\"ALI_JSAPI,ALI_WAP,ALI_BAR,ALI_APP,ALI_PC,ALI_QR,ALI_OC\",\"icon\":\"http://jeequan.oss-cn-beijing.aliyuncs.com/jeepay/img/alipay.png\",\"remark\":\"支付宝官方通道\",\"configPageType\":2,\"isMchMode\":1,\"createdAt\":\"2024-10-22 23:02:41\",\"wayCodes\":[{\"wayCode\":\"ALI_JSAPI\"},{\"wayCode\":\"ALI_WAP\"},{\"wayCode\":\"ALI_BAR\"},{\"wayCode\":\"ALI_APP\"},{\"wayCode\":\"ALI_PC\"},{\"wayCode\":\"ALI_QR\"},{\"wayCode\":\"ALI_OC\"}],\"isvsubMchParams\":\"[{\\\"name\\\":\\\"appAuthToken\\\", \\\"desc\\\":\\\"子商户app_auth_token\\\", \\\"type\\\": \\\"text\\\",\\\"readonly\\\":\\\"readonly\\\"},{\\\"name\\\":\\\"refreshToken\\\", \\\"desc\\\":\\\"子商户刷新token\\\", \\\"type\\\": \\\"hidden\\\",\\\"readonly\\\":\\\"readonly\\\"},{\\\"name\\\":\\\"expireTimestamp\\\", \\\"desc\\\":\\\"authToken有效期（13位时间戳）\\\", \\\"type\\\": \\\"hidden\\\",\\\"readonly\\\":\\\"readonly\\\"}]\",\"bgColor\":\"#1779FF\",\"isvParams\":\"[{\\\"name\\\":\\\"sandbox\\\",\\\"desc\\\":\\\"环境配置\\\",\\\"type\\\":\\\"radio\\\",\\\"verify\\\":\\\"\\\",\\\"values\\\":\\\"1,0\\\",\\\"titles\\\":\\\"沙箱环境,生产环境\\\",\\\"verify\\\":\\\"required\\\"},{\\\"name\\\":\\\"pid\\\",\\\"desc\\\":\\\"合作伙伴身份（PID）\\\",\\\"type\\\":\\\"text\\\",\\\"verify\\\":\\\"required\\\"},{\\\"name\\\":\\\"appId\\\",\\\"desc\\\":\\\"应用App ID\\\",\\\"type\\\":\\\"text\\\",\\\"verify\\\":\\\"required\\\"},{\\\"name\\\":\\\"privateKey\\\", \\\"desc\\\":\\\"应用私钥\\\", \\\"type\\\": \\\"textarea\\\",\\\"verify\\\":\\\"required\\\",\\\"star\\\":\\\"1\\\"},{\\\"name\\\":\\\"alipayPublicKey\\\", \\\"desc\\\":\\\"支付宝公钥(不使用证书时必填)\\\", \\\"type\\\": \\\"textarea\\\",\\\"star\\\":\\\"1\\\"},{\\\"name\\\":\\\"signType\\\",\\\"desc\\\":\\\"接口签名方式(推荐使用RSA2)\\\",\\\"type\\\":\\\"radio\\\",\\\"verify\\\":\\\"\\\",\\\"values\\\":\\\"RSA,RSA2\\\",\\\"titles\\\":\\\"RSA,RSA2\\\",\\\"verify\\\":\\\"required\\\"},{\\\"name\\\":\\\"useCert\\\",\\\"desc\\\":\\\"公钥证书\\\",\\\"type\\\":\\\"radio\\\",\\\"verify\\\":\\\"\\\",\\\"values\\\":\\\"1,0\\\",\\\"titles\\\":\\\"使用证书（请使用RSA2私钥）,不使用证书\\\"},{\\\"name\\\":\\\"appPublicCert\\\",\\\"desc\\\":\\\"应用公钥证书（.crt格式）\\\",\\\"type\\\":\\\"file\\\",\\\"verify\\\":\\\"\\\"},{\\\"name\\\":\\\"alipayPublicCert\\\",\\\"desc\\\":\\\"支付宝公钥证书（.crt格式）\\\",\\\"type\\\":\\\"file\\\",\\\"verify\\\":\\\"\\\"},{\\\"name\\\":\\\"alipayRootCert\\\",\\\"desc\\\":\\\"支付宝根证书（.crt格式）\\\",\\\"type\\\":\\\"file\\\",\\\"verify\\\":\\\"\\\"}]\",\"state\":1,\"updatedAt\":\"2024-10-22 23:02:41\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-24 01:19:23.896');
INSERT INTO `t_sys_log` VALUES (13, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.merchant.MchAppController.update', '更新应用信息', 'http://localhost:9217/api/mchApps/67192f55d2e0f36eccb0c3bc', '{\"createdAt\":\"2024-10-24 01:16:05\",\"createdBy\":\"jeepay\",\"appName\":\"默认应用\",\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"appSecret\":\"VsrTgUmJGYKaOl57azwJqJNMdpW3Os9qaEM6DGzVRednsPBlwoqTlcVThM7keCt9QHdx3TJAwAYERnUbmhQm4fjVDvjqLdYJb6g6zUzSCGxivDakC0uvl3A0D9havTxQ\",\"createdUid\":100001,\"state\":1,\"mchNo\":\"M1729703764\",\"updatedAt\":\"2024-10-24 01:16:05\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-24 01:25:57.088');
INSERT INTO `t_sys_log` VALUES (14, NULL, NULL, '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"enptZw==\",\"vt\":\"ZTdkZjg0ZGMtZThjZC00MmEzLTg5YWItOGY3MjZjYmMyZjQ0\"}', '用户名/密码错误！', '2024-10-24 13:49:12.861');
INSERT INTO `t_sys_log` VALUES (15, NULL, NULL, '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"cG43NQ==\",\"vt\":\"MDc4MWY2ZWYtMzdjZi00YjlmLTg4MjgtY2FmOWIyZTdhMDA3\"}', '用户名/密码错误！', '2024-10-24 13:50:36.911');
INSERT INTO `t_sys_log` VALUES (16, NULL, NULL, '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"NzJGQQ==\",\"vt\":\"MGI4OTM1ZWMtOGRmZi00ZjcxLWIwYTEtYzVkMmJkOTRlODlh\"}', '用户名/密码错误！', '2024-10-24 13:50:47.260');
INSERT INTO `t_sys_log` VALUES (17, NULL, NULL, '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"a2J6Zg==\",\"vt\":\"NTU2YzcyZDEtM2E2Ni00ZTYyLTkxYzctMjJmOWZhNTQ0MjUx\"}', '用户名/密码错误！', '2024-10-24 13:51:12.864');
INSERT INTO `t_sys_log` VALUES (18, NULL, NULL, '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"Y3JheA==\",\"vt\":\"ZjNlZWU4ZjYtZDMyYS00ZWJmLTk1YzItMjFkYWJkN2I1YzA4\"}', '用户名/密码错误！', '2024-10-24 13:52:30.689');
INSERT INTO `t_sys_log` VALUES (19, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"Y3JheA==\",\"vt\":\"ZjNlZWU4ZjYtZDMyYS00ZWJmLTk1YzItMjFkYWJkN2I1YzA4\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzgwMV80MzdiNWRhZi00YTY5LTQ4NmMtODAzNy0yZjllM2I0YzVmMDciLCJjcmVhdGVkIjoxNzI5NzQ5MTYwMTA0LCJzeXNVc2VySWQiOjgwMX0.4EyaoU6Sp9WfbBrPiyzSkZy5sPrOuwNWy2Sp0NMVJQNaGUWkmYWN4CcB7ptyBl07oaEJ2gkKT6U7l2s9sQ-ELQ\"}}', '2024-10-24 13:52:40.128');
INSERT INTO `t_sys_log` VALUES (20, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"aDd4ZA==\",\"vt\":\"OGQ5YzUzYmQtNWEwNy00Njc2LWFjMmEtNzczNzg1ZDk3MDZl\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzEwMDAwMV83ODIyMzM4NS0zMDFiLTQ1MDYtOTJiZi0wMTNmOTVmYzhkMzMiLCJjcmVhdGVkIjoxNzI5NzQ5MTk0MjMzLCJzeXNVc2VySWQiOjEwMDAwMX0.UkSAfWR3AMm9bsO7SYo_sDRPsvFK7jAScmB2FyC2ROcUujIMa3NOGYmSDd1ytBF43HhRSSv-jEOQbFCWPbQ4KQ\"}}', '2024-10-24 13:53:14.262');
INSERT INTO `t_sys_log` VALUES (21, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.merchant.MchPayInterfaceConfigController.saveOrUpdate', '更新应用支付参数', 'http://localhost:9217/api/mch/payConfigs', '{\"ifCode\":\"alipay\",\"infoId\":\"67192f55d2e0f36eccb0c3bc\",\"ifParams\":\"{\\\"sandbox\\\":1,\\\"signType\\\":\\\"RSA2\\\",\\\"useCert\\\":0,\\\"privateKey\\\":\\\"MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCzPype51NaRAEwrdXMf8tW+gcZ2qAa0YvSduP6Fb3Axdb47YJRqPNUcEzRFIuPXrd15UhNt0LGCykDOJcI1kQJjJW/UjsKyaIhSWHU7MRR0eyj9gPnDiFv6df3Fo3sLc/SMM04FtGQQxiJ2D/ghDV/brM2i5d4ALUaTqdjIJapatrRLMjeDMez0J0wqHhrfGrbWMuUeR/vGU0TsuHp/A50sTLf4oLxGEYsYyIj1H7x7c8WuNb2unypLT3hl89BrBGQX19OikrCPmOXAaaZdUfhB4kYjc9IFvo67YyKbSnaBxfdbqftqCcj/P3fQB1mSImR2kEByLfP9V739aR4ZJBvAgMBAAECggEAJesu43S8RVQtjEa5+9DtCzFJX0bIp+O8WIGeKMGAqs8vcumLsAq1rx8yoOhfvayj0uT2Lrqd/ZdOzcei69OoAP0kkJyssNOG4NPNRmXwAf8OuIDKwo5StIIblcHHtDbcx/Ja94qcOpB3GHIO0UgmqRaaAuf02wYLSc1py6aROLVvTYKh9FXIR5BvQFvScZApF5cb11nP0ajTcQjcZnqm5ZwJh/R3q9fGa0ccRuREoH33N5N3zmtkhuaJHBY1QxcnToMuu/JZ8LNlux7rPBrbvBu9711N0+6qdVHc2Z/tIKTaJqgU2SmXvmCR54DKivAiTVX5ym1Nf8yaNvyXh8ECQQKBgQDlQKseDB/MxpVpa/BVuVvKAxVIa1f34EBDeG2J90NjJuDIbZkD5jbNQF7pceMgWRjyJgkCkC1NaE3BDhWlxHFqWBbsj/oCkyNmaROC/S0cYKdnynGwOMhRVWi40BrIVhBeY6mINDfam+FoJdrwgHY7+Az6CDC22/I/8pdqmTUXkwKBgQDIKOsmVWbpi21NKWh2WqDy1ZndmBxx2rDDZ6MLvIZ+GLpr2ZSxaNditRwpEtZrXF2oZaHOwJohLXcMgpHxeqLmVvaDmcLXaq+f/rixz0fgoEr34s4HZtKapEtS2diIzHVFAceSCYg2hZc4zngxjlJHvRobr3Rnhl1XYk5yhC31NQKBgQDdV+7fd/1MDYA85QaK/ghtp0RpQ5sPrOjfO+snBiF+Hg9x9L+EUEYhLkF1S4xrsxqu0aJpYyMaVdacyyiDgIOwlZSsmuZcjgvj2RgJpMBlYbzALWpPJsPiI4CUz/jL7KypNbh91U0IOPENSV92TdHaXMjKsBW4t+vRajxfo8TrGQKBgQC8fjQ8LE62/rNW5/jVBDHvnRHCKZ4X5h9yVSWpRsfM9dKRABzUGWxEK1QypefAwQH+NH91adF8Dwm+gTOZGalQi3KoqeNf47syS7l40T/aHHmdCTyGoeEQ+klo43fUE98Xtj5Pm6Rn29R2DZII8QMxRbbRfaB8YX+DbDN+ClYRRQKBgQC0zguqiabVYNZaM2nPB5KHrZruIlh4nXeTVZaETOODHsrexgaifmF1DIrFlUuFniUIm4TZ9DR2VUCcMy7VZRlNyTZJHavtQ/C8EnVT1+KBZQmVuqRl9c8GUOizd86iZn+H0b4EKayycQFplEsSM9IXmezSt9qKxID6amftuKQw+Q==\\\",\\\"alipayPublicKey\\\":\\\"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiYA2QhC+IXUD+0THOQ6D4UwMLy1L0KgjtypS2CRfO4wrcwg95+DVFKYNoEXLbRH3vtOibB0bY9G7u4iymm2iNgUUvHIPfPdr7aGqJ7fsSxYixMvVIGsoDNYJfMqRfZHS+pqr7b38ymnwWzej68LKhr76IsBB93KBfj343EitSUQxmZzCBR7sUuV3MWIs1WR9NQpnQtkfC6lXz+NjMRhU1kS2NlmTVsmrc/WELNu7zQ4TeVQgGemwhxF9jXL0vtYSX1S45fF/L+QAd6eipZYxXi17l9D7gP/EspX2igHg67x5QJMzjDPsS+2SQeJwAt1SJAOu0g173HzW4VCEBcj1wwIDAQAB\\\",\\\"appPublicCert\\\":\\\"\\\",\\\"alipayPublicCert\\\":\\\"\\\",\\\"alipayRootCert\\\":\\\"\\\",\\\"appId\\\":\\\"9021000132668801\\\"}\",\"state\":1}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-24 14:09:56.323');
INSERT INTO `t_sys_log` VALUES (22, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.merchant.MchPayInterfaceConfigController.saveOrUpdate', '更新应用支付参数', 'http://localhost:9217/api/mch/payConfigs', '{\"ifCode\":\"alipay\",\"infoId\":\"67192f55d2e0f36eccb0c3bc\",\"ifParams\":\"{\\\"alipayPublicCert\\\":\\\"\\\",\\\"appPublicCert\\\":\\\"\\\",\\\"appId\\\":\\\"9021000132668801\\\",\\\"alipayRootCert\\\":\\\"\\\",\\\"sandbox\\\":1,\\\"signType\\\":\\\"RSA2\\\",\\\"useCert\\\":0}\",\"state\":1}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-24 14:10:01.372');
INSERT INTO `t_sys_log` VALUES (23, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.merchant.MchPayPassageConfigController.saveOrUpdate', '更新商户支付通道', 'http://localhost:9217/api/mch/payPassages', '{\"reqParams\":\"[{\\\"id\\\":\\\"\\\",\\\"appId\\\":\\\"67192f55d2e0f36eccb0c3bc\\\",\\\"wayCode\\\":\\\"ALI_WAP\\\",\\\"ifCode\\\":\\\"alipay\\\",\\\"rate\\\":\\\"0.6\\\",\\\"state\\\":1}]\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-24 14:10:38.683');
INSERT INTO `t_sys_log` VALUES (24, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.merchant.MchPayInterfaceConfigController.saveOrUpdate', '更新应用支付参数', 'http://localhost:9217/api/mch/payConfigs', '{\"ifCode\":\"alipay\",\"infoId\":\"67192f55d2e0f36eccb0c3bc\",\"ifParams\":\"{\\\"alipayPublicCert\\\":\\\"\\\",\\\"appPublicCert\\\":\\\"\\\",\\\"appId\\\":\\\"9021000132668801\\\",\\\"alipayRootCert\\\":\\\"\\\",\\\"sandbox\\\":1,\\\"signType\\\":\\\"RSA2\\\",\\\"useCert\\\":0}\",\"state\":1}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-24 14:15:28.589');
INSERT INTO `t_sys_log` VALUES (25, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.merchant.MchPayPassageConfigController.saveOrUpdate', '更新商户支付通道', 'http://localhost:9217/api/mch/payPassages', '{\"reqParams\":\"[{\\\"id\\\":\\\"\\\",\\\"appId\\\":\\\"67192f55d2e0f36eccb0c3bc\\\",\\\"wayCode\\\":\\\"ALI_QR\\\",\\\"ifCode\\\":\\\"alipay\\\",\\\"rate\\\":\\\"0.6\\\",\\\"state\\\":1}]\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-24 14:15:40.373');
INSERT INTO `t_sys_log` VALUES (26, NULL, NULL, '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"dnZ5cA==\",\"vt\":\"YWQwMDZkYjUtNThkZC00OWE3LTlkNDgtNGJjMmVhOWI1NDM5\"}', '用户名/密码错误！', '2024-10-24 17:27:35.707');
INSERT INTO `t_sys_log` VALUES (27, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"dnZ5cA==\",\"vt\":\"YWQwMDZkYjUtNThkZC00OWE3LTlkNDgtNGJjMmVhOWI1NDM5\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzgwMV80OGMyNmFiNC05NjFkLTRkZWQtYjg3Ny01ZDg5NmE4YWVhOTMiLCJjcmVhdGVkIjoxNzI5NzYyMDY3NjMyLCJzeXNVc2VySWQiOjgwMX0.Eyjt8A-bsO0fpgaqJUlQopvmR6ARf1eIv2Ws-vo22L3wNyhCjp_ySPWj9BzMrtXjdjvSc0v_4I0rs-fscoYqMg\"}}', '2024-10-24 17:27:47.682');
INSERT INTO `t_sys_log` VALUES (28, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"b2Vzeg==\",\"vt\":\"ZDUwMWY4N2QtZTM3Ni00OTYzLWExOTgtOGNlNDBiODI3ZWU5\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzEwMDAwMV8wMGRhZWZmZC0yZTJlLTRmYjAtYThjNi04NWY0YWU5N2UzZTgiLCJjcmVhdGVkIjoxNzI5NzYyMDkyMzkwLCJzeXNVc2VySWQiOjEwMDAwMX0.T9hNj3GCqDWZ_p8xSgF0Hu2lIhN9fTZEpArWh7qJJ-UX091QF14Ik4pv1h6m1nMYA2yxTilBsyDpAcXf2r6u_w\"}}', '2024-10-24 17:28:12.416');
INSERT INTO `t_sys_log` VALUES (29, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.merchant.MchInfoController.delete', '删除商户', 'http://localhost:9217/api/mchInfo/M1729703764', '{}', '该商户已存在交易数据，不可删除', '2024-10-24 17:28:30.792');
INSERT INTO `t_sys_log` VALUES (30, NULL, NULL, '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"dHhybA==\",\"vt\":\"Mjk5MjhjOWYtNmQxYS00NWM3LTlmOTctZjM3ZjAwODhiMjEz\"}', '验证码有误！', '2024-10-24 17:46:53.239');
INSERT INTO `t_sys_log` VALUES (31, NULL, NULL, '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"bHUybQ==\",\"vt\":\"MGUxN2UyZTItYzA2Ni00MzE5LWFjMzUtNTY4MDc2ZGQ5Mjhi\"}', '验证码有误！', '2024-10-24 17:47:04.697');
INSERT INTO `t_sys_log` VALUES (32, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"aWtjbA==\",\"vt\":\"Y2E3M2VhMjYtMjhmOC00MmRjLTg5NDEtODliYmM4NjIzMGYz\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzgwMV80MDI2MWNhYi02MmE2LTQ2NzItYjFiYS0xN2UwYmFiZTcyOGYiLCJjcmVhdGVkIjoxNzI5NzYzMjMzNjEzLCJzeXNVc2VySWQiOjgwMX0.2ZEF6Aci2Luphe7CiAaKZbqYwEHrxvMfM2nnATXabNJ6ZegjmiKD2RpLum0cKl0C-XH6Z6xDffZfy-rmVFCfmQ\"}}', '2024-10-24 17:47:14.390');
INSERT INTO `t_sys_log` VALUES (33, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"Znlkag==\",\"vt\":\"NzhhMjAwNjAtZjllOC00MTlkLWI3NTUtMmM4MThlNTUzYWIx\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzEwMDAwMV82NWE2ODgyZC0yODEwLTQ0YTAtODA5NS03MjcxYWU0NTYzNzciLCJjcmVhdGVkIjoxNzI5NzYzMjQ2MDk0LCJzeXNVc2VySWQiOjEwMDAwMX0.xZY6joXk41U5DbOmHfc7gZqJT-8JUd8B_hq8q5f1iyJJ-cUznWZuOyk6BsN-l6GR4w12usAuskldduLbBlhujw\"}}', '2024-10-24 17:47:26.803');
INSERT INTO `t_sys_log` VALUES (34, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"cHdrMw==\",\"vt\":\"MWExNWYwMjYtNGVkMi00ODIxLWE5MjYtNjFmMjk0YTJjOGJh\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzgwMV9jMmViMTZmOS1kYmQ2LTQ0MjgtODY1MS01NTQwYTBhNjBjM2UiLCJjcmVhdGVkIjoxNzI5ODQ0Mzc3NDMxLCJzeXNVc2VySWQiOjgwMX0.HMMRuiYEC3-zWjwOfZHVq45IRcmti6yyp9SqSCiOvzntrEum2zl7_b6t39_D3WnFnHsDLhfiszjtJ6p0IEzqMg\"}}', '2024-10-25 16:19:37.463');
INSERT INTO `t_sys_log` VALUES (35, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"dGNqOA==\",\"vt\":\"NjU4YzU3YjEtZjQ4MS00Mjk3LWJkZTItODQ5M2JkMTY4YTUy\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzEwMDAwMV8xYTkxNjEyYS00NzUwLTQ3ZjUtYTc4Yy05NzczNTZiOTcwOGIiLCJjcmVhdGVkIjoxNzI5ODQ0MzkzNzY5LCJzeXNVc2VySWQiOjEwMDAwMX0.HE9Iuf8_vDL_ao0cEQSqezrQBbICYIO5Z5dbIoiXgvh_DS96ybaT5I6o9i5YQcVYI6Eh_O18Ud2HUOxKtLwTxw\"}}', '2024-10-25 16:19:53.801');
INSERT INTO `t_sys_log` VALUES (36, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"c3k2OA==\",\"vt\":\"NmRiMDA0NWYtNDhlNS00MTdiLWEyYTItOWI5MmI0OGUxMTZm\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzgwMV81MmY0NjA3OC1hY2QzLTQ1MTktOWQ5NS0zZTUxOTcyN2YyNzkiLCJjcmVhdGVkIjoxNzI5ODQ0OTYzNzA5LCJzeXNVc2VySWQiOjgwMX0.W9vQH3EnT0XYfGkpZZMbRv_WGf6gK1G0OTn0OKKeG0lsNGGh-Emu7XdZ18JksKHK-u2P4_gu44fchvTLReERiA\"}}', '2024-10-25 16:29:23.712');
INSERT INTO `t_sys_log` VALUES (37, NULL, NULL, '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"ZXhvYQ==\",\"vt\":\"ZDMzMDcwMmUtOTg5My00NTYxLWE2MmQtMmU3YzZhYjM0ZDg5\"}', '验证码有误！', '2024-10-25 16:29:47.170');
INSERT INTO `t_sys_log` VALUES (38, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"ZXgwYQ==\",\"vt\":\"ZDMzMDcwMmUtOTg5My00NTYxLWE2MmQtMmU3YzZhYjM0ZDg5\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzEwMDAwMV9iNmNmN2VjNi05MWIyLTRiN2QtYTcwNy1mYmZlMGIwZTNhZjYiLCJjcmVhdGVkIjoxNzI5ODQ0OTkyMzAxLCJzeXNVc2VySWQiOjEwMDAwMX0.VnIhNd4dnJLTZJoCptUN9eM6x_-DodEXGCDjuICtIulBD4sU8XgSuJRhrIHlAhmlKbd96CNGySzFtEpxKQ4cOg\"}}', '2024-10-25 16:29:52.302');
INSERT INTO `t_sys_log` VALUES (39, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.merchant.MchAppController.update', '更新应用信息', 'http://localhost:9218/api/mchApps/67192f55d2e0f36eccb0c3bc', '{\"createdAt\":\"2024-10-24 01:16:05\",\"createdBy\":\"jeepay\",\"appName\":\"默认应用\",\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"createdUid\":100001,\"state\":1,\"mchNo\":\"M1729703764\",\"updatedAt\":\"2024-10-24 01:16:05\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-25 16:34:45.162');
INSERT INTO `t_sys_log` VALUES (40, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.merchant.MchAppController.update', '更新应用信息', 'http://localhost:9218/api/mchApps/67192f55d2e0f36eccb0c3bc', '{\"createdAt\":\"2024-10-24 01:16:05\",\"createdBy\":\"jeepay\",\"appName\":\"默认应用\",\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"createdUid\":100001,\"state\":1,\"mchNo\":\"M1729703764\",\"updatedAt\":\"2024-10-24 01:16:05\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-25 16:34:57.262');
INSERT INTO `t_sys_log` VALUES (41, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.merchant.MchAppController.update', '更新应用信息', 'http://localhost:9218/api/mchApps/67192f55d2e0f36eccb0c3bc', '{\"createdAt\":\"2024-10-24 01:16:05\",\"pankouUrl\":\"\",\"createdBy\":\"jeepay\",\"appName\":\"默认应用\",\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"createdUid\":100001,\"state\":1,\"mchNo\":\"M1729703764\",\"updatedAt\":\"2024-10-24 01:16:05\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-25 16:46:56.385');
INSERT INTO `t_sys_log` VALUES (42, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.merchant.MchAppController.update', '更新应用信息', 'http://localhost:9218/api/mchApps/67192f55d2e0f36eccb0c3bc', '{\"createdAt\":\"2024-10-24 01:16:05\",\"pankouUrl\":\"\",\"createdBy\":\"jeepay\",\"appName\":\"默认应用\",\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"createdUid\":100001,\"state\":1,\"mchNo\":\"M1729703764\",\"updatedAt\":\"2024-10-24 01:16:05\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-25 16:48:47.590');
INSERT INTO `t_sys_log` VALUES (43, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.merchant.MchAppController.update', '更新应用信息', 'http://localhost:9218/api/mchApps/67192f55d2e0f36eccb0c3bc', '{\"createdAt\":\"2024-10-24 01:16:05\",\"pankouUrl\":\"1\",\"createdBy\":\"jeepay\",\"appName\":\"默认应用\",\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"createdUid\":100001,\"state\":1,\"mchNo\":\"M1729703764\",\"updatedAt\":\"2024-10-24 01:16:05\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-25 16:52:07.417');
INSERT INTO `t_sys_log` VALUES (44, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.merchant.MchAppController.update', '更新应用信息', 'http://localhost:9217/api/mchApps/67192f55d2e0f36eccb0c3bc', '{\"createdAt\":\"2024-10-24 01:16:05\",\"createdBy\":\"jeepay\",\"appName\":\"默认应用\",\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"createdUid\":100001,\"state\":1,\"mchNo\":\"M1729703764\",\"updatedAt\":\"2024-10-24 01:16:05\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-25 16:56:24.709');
INSERT INTO `t_sys_log` VALUES (45, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.merchant.MchAppController.add', '新建应用', 'http://localhost:9218/api/mchApps', '{\"pankouUrl\":\"111\",\"appName\":\"测试应用\",\"appSecret\":\"n6BoGs2N25swn0uZCv78JLvcjGoL4ryKrNqrdxmgOQVSHLRn20ZlQKzvQo73tXZDoMO4yGuKUTKBzi2YDpN8WQOZ9PUZuca8Ww3PStxNZMwg6o3Ga744xtxAjyuHQA5p\",\"state\":1}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-25 17:00:03.880');
INSERT INTO `t_sys_log` VALUES (46, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.merchant.MchAppController.delete', '删除应用', 'http://localhost:9218/api/mchApps/671b5e1390364ef837172c63', '{}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-25 17:00:39.779');
INSERT INTO `t_sys_log` VALUES (47, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"eHBjbA==\",\"vt\":\"NDJkMGNjNmQtYzBlYi00ZjJiLTg3MWQtZGMzYzhmOTAxMGY0\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzEwMDAwMV8zYjgxMGUxMC1mYzkzLTRjZTktOGRhMy03Y2RiZmQ3NWNmYzEiLCJjcmVhdGVkIjoxNzI5ODUxNjQ0ODA1LCJzeXNVc2VySWQiOjEwMDAwMX0.NSMUj5GDpoL8Rnq_3czwxC72ifJ_YJy56KkK3CzppRSxNzDj1nrbaALFUTfxDlM1J4omuJF7gXwyjZRp6uj00g\"}}', '2024-10-25 18:20:44.828');
INSERT INTO `t_sys_log` VALUES (48, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.order.PayOrderController.callbackPankou', '发起回调盘口', 'http://localhost:9218/api/payOrder/callbackPankou', '{\"payOrderId\":\"P1849387838807404546\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-25 18:44:23.232');
INSERT INTO `t_sys_log` VALUES (49, NULL, NULL, '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"bGxmODI=\",\"vt\":\"YzM4YzA2YzktMTU0ZC00ZDk2LWEwNDktYmM2YmIyMWE2MDZk\"}', '验证码有误！', '2024-10-25 21:43:22.227');
INSERT INTO `t_sys_log` VALUES (50, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"amtxdA==\",\"vt\":\"NjJmMGU4ZmUtMDE0Ni00NGQwLThhYmMtNThiODQ2NmFlZmEz\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzEwMDAwMV82M2RhYzA0Ni00NDBjLTQ2M2ItOWUyNS0wNWZmYmQxYzRiZDUiLCJjcmVhdGVkIjoxNzI5ODYzODA5MDk2LCJzeXNVc2VySWQiOjEwMDAwMX0.TMGFtGAt6jzjJI1sVhGNc2h36Y7w99sFzEm6qerZKy9GElfhStPyL0K5aGthUm0g5UmK7f-3r1u2_XB0iKS98w\"}}', '2024-10-25 21:43:29.125');
INSERT INTO `t_sys_log` VALUES (51, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.order.PayOrderController.callbackPankou', '发起回调盘口', 'http://localhost:9218/api/payOrder/callbackPankou', '{\"payOrderId\":\"P1849386216417120258\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-25 21:46:55.597');
INSERT INTO `t_sys_log` VALUES (52, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.merchant.MchAppController.update', '更新应用信息', 'http://localhost:9218/api/mchApps/67192f55d2e0f36eccb0c3bc', '{\"createdAt\":\"2024-10-24 01:16:05\",\"pankouUrl\":\"https://www.baidu.com/\",\"createdBy\":\"jeepay\",\"appName\":\"默认应用\",\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"createdUid\":100001,\"state\":1,\"mchNo\":\"M1729703764\",\"updatedAt\":\"2024-10-24 01:16:05\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-25 21:49:52.212');
INSERT INTO `t_sys_log` VALUES (53, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.order.PayOrderController.callbackPankou', '发起回调盘口', 'http://localhost:9218/api/payOrder/callbackPankou', '{\"payOrderId\":\"P1849386216417120258\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-25 21:49:58.201');
INSERT INTO `t_sys_log` VALUES (54, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.order.PayOrderController.callbackPankou', '发起回调盘口', 'http://localhost:9218/api/payOrder/callbackPankou', '{\"payOrderId\":\"P1849385942394851329\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-25 21:51:42.694');
INSERT INTO `t_sys_log` VALUES (55, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.order.PayOrderController.callbackPankou', '发起回调盘口', 'http://localhost:9218/api/payOrder/callbackPankou', '{\"payOrderId\":\"P1849385281167003649\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-25 21:52:35.724');
INSERT INTO `t_sys_log` VALUES (56, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.order.PayOrderController.callbackPankou', '发起回调盘口', 'http://localhost:9218/api/payOrder/callbackPankou', '{\"payOrderId\":\"P1849383445555023873\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-25 21:54:53.080');
INSERT INTO `t_sys_log` VALUES (57, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"NHdhcA==\",\"vt\":\"ZTViZjM2MWQtOGYzYi00OWQzLTkxM2MtM2M2ZGRhYzhiNzM4\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzEwMDAwMV9mYTYyNjI5My1hOGQ2LTQ0OTAtODdiZC0zNDc3MzNmZjA0ZGIiLCJjcmVhdGVkIjoxNzI5ODY3NjEzMzM5LCJzeXNVc2VySWQiOjEwMDAwMX0.FrIW0n-gshYR2tdtv3K4mf6wiLAhj4_r1crkjykvoESM64gGMcomuxfE1hBy1Uwpxgm9Ib9YhKOG2EefNL0zWQ\"}}', '2024-10-25 22:46:53.946');
INSERT INTO `t_sys_log` VALUES (58, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.order.PayOrderController.callbackPankou', '发起回调盘口', 'http://localhost:9218/api/payOrder/callbackPankou', '{\"payOrderId\":\"P1849383414521368577\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-25 22:47:07.227');
INSERT INTO `t_sys_log` VALUES (59, NULL, NULL, '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"OHVpbg==\",\"vt\":\"MDBhYmJhZTItMzMzMi00YjY3LTgxMGEtMzA4YjcxZDc4Mjg3\"}', '验证码有误！', '2024-10-25 22:49:42.656');
INSERT INTO `t_sys_log` VALUES (60, NULL, NULL, '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"OHUxbg==\",\"vt\":\"MDBhYmJhZTItMzMzMi00YjY3LTgxMGEtMzA4YjcxZDc4Mjg3\"}', '验证码有误！', '2024-10-25 22:49:46.996');
INSERT INTO `t_sys_log` VALUES (61, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"b3M3ZQ==\",\"vt\":\"MmVmNDFlN2QtMTM3ZC00NTc3LWJlODUtOGNkYmY4MGE2YWNl\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzgwMV9kZGI4MGI1Yi02ZmE2LTQzNzctODVmYS0wMzc3MmVlNTU3M2QiLCJjcmVhdGVkIjoxNzI5ODY3NzkxMDE0LCJzeXNVc2VySWQiOjgwMX0.MUnzHEuRY-z9r9Ba28GYk2aXeb1JnNUZEv_9jWrax0RgaMKKg3kdsiuwPnpjRd3DBZvSmyMpcbWUyJwaV1frZg\"}}', '2024-10-25 22:49:51.021');
INSERT INTO `t_sys_log` VALUES (62, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.order.PayOrderController.callbackPankou', '发起回调盘口', 'http://localhost:9217/api/payOrder/callbackPankou', '{\"payOrderId\":\"P1849334008153612290\"}', '{\"msg\":\"权限错误，当前用户不支持此操作\",\"code\":5004}', '2024-10-25 23:04:54.294');
INSERT INTO `t_sys_log` VALUES (63, NULL, NULL, '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"aThveg==\",\"vt\":\"MWU3YTNiZjAtMGE1YS00YzkyLTk3NWYtMmQxYTZjZjM3ZTcw\"}', '用户名/密码错误！', '2024-10-25 23:05:16.224');
INSERT INTO `t_sys_log` VALUES (64, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"aThveg==\",\"vt\":\"MWU3YTNiZjAtMGE1YS00YzkyLTk3NWYtMmQxYTZjZjM3ZTcw\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzgwMV8xYjRmNmI0ZS1kOTIwLTQyYjktYWU2ZS0xNjQzMTc4MmMxM2EiLCJjcmVhdGVkIjoxNzI5ODY4NzIxMDM3LCJzeXNVc2VySWQiOjgwMX0.nQbOdV59LP_43kYY7gDMERm9tfOdk3KlpHgx4_rDjnAB4RNYn3bs6C4IYvx3mTo_ybkIrbrXGtuehV-tkFgS0w\"}}', '2024-10-25 23:05:21.059');
INSERT INTO `t_sys_log` VALUES (65, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.order.PayOrderController.callbackPankou', '发起回调盘口', 'http://localhost:9217/api/payOrder/callbackPankou', '{\"payOrderId\":\"P1849334008153612290\"}', '{\"msg\":\"权限错误，当前用户不支持此操作\",\"code\":5004}', '2024-10-25 23:05:28.459');
INSERT INTO `t_sys_log` VALUES (66, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.order.PayOrderController.callbackPankou', '发起回调盘口', 'http://localhost:9217/api/payOrder/callbackPankou', '{\"payOrderId\":\"P1849334008153612290\"}', '{\"msg\":\"权限错误，当前用户不支持此操作\",\"code\":5004}', '2024-10-25 23:06:00.370');
INSERT INTO `t_sys_log` VALUES (67, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.order.PayOrderController.callbackPankou', '发起回调盘口', 'http://localhost:9217/api/payOrder/callbackPankou', '{\"payOrderId\":\"P1849334008153612290\"}', '{\"msg\":\"权限错误，当前用户不支持此操作\",\"code\":5004}', '2024-10-25 23:06:33.613');
INSERT INTO `t_sys_log` VALUES (68, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.order.PayOrderController.callbackPankou', '发起回调盘口', 'http://localhost:9217/api/payOrder/callbackPankou', '{\"payOrderId\":\"P1849334008153612290\"}', '{\"msg\":\"权限错误，当前用户不支持此操作\",\"code\":5004}', '2024-10-25 23:07:31.802');
INSERT INTO `t_sys_log` VALUES (69, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.order.PayOrderController.callbackPankou', '发起回调盘口', 'http://localhost:9217/api/payOrder/callbackPankou', '{\"payOrderId\":\"P1849334008153612290\"}', '{\"msg\":\"权限错误，当前用户不支持此操作\",\"code\":5004}', '2024-10-25 23:08:05.998');
INSERT INTO `t_sys_log` VALUES (70, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.order.PayOrderController.callbackPankou', '发起回调盘口', 'http://localhost:9217/api/payOrder/callbackPankou', '{\"payOrderId\":\"P1849334008153612290\"}', '{\"msg\":\"权限错误，当前用户不支持此操作\",\"code\":5004}', '2024-10-25 23:09:00.513');
INSERT INTO `t_sys_log` VALUES (71, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.order.PayOrderController.callbackPankou', '发起回调盘口', 'http://localhost:9217/api/payOrder/callbackPankou', '{\"payOrderId\":\"P1849334008153612290\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-25 23:53:18.689');
INSERT INTO `t_sys_log` VALUES (72, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"ZGp0dQ==\",\"vt\":\"Y2M2NWI4YTYtMDU5Zi00ZjZiLTljZDEtNzcwNjdiODU0MmRi\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzEwMDAwMV8zYjIwM2NkMy1iMmFkLTQ5MjMtYTQyNC01ODcyNDViMzZjMzQiLCJjcmVhdGVkIjoxNzI5ODcyOTM2NjcwLCJzeXNVc2VySWQiOjEwMDAwMX0.5l3YX38V_RRdkr-oxT6PSjKJrb_MMoJ8neEY0bhmf8pwThwN7Z2eyO_I2aAI9RPa8Gn17_C7LcXOv1rPozYY_w\"}}', '2024-10-26 00:15:36.679');
INSERT INTO `t_sys_log` VALUES (73, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"YnlnYQ==\",\"vt\":\"ZjBmNzc0ZTMtYzg4Mi00MjQ1LWFjZjEtZjYzMTY0ZWQ5MGM3\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzEwMDAwMV85ZjhjMzAwMC0yYmE2LTQ2OWMtOWQzMS00YTIzMDlmNDViZDIiLCJjcmVhdGVkIjoxNzI5ODczMDI3NTM0LCJzeXNVc2VySWQiOjEwMDAwMX0.XB92ELaJ5D9mmHbpD7qINP-CzIIhxoziwEW0wwtAejURie6hJhJ0AuZjeXsDgvSSV0XpqMzPodUQDwOAo9zW1A\"}}', '2024-10-26 00:17:07.535');
INSERT INTO `t_sys_log` VALUES (74, NULL, NULL, '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"YmIybg==\",\"vt\":\"YzhlNDY0MDUtNzk0NC00Mjg2LWIxNGMtOGZlZWUxMWUyNGMx\"}', '用户名/密码错误！', '2024-10-26 00:41:38.007');
INSERT INTO `t_sys_log` VALUES (75, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"YmIybg==\",\"vt\":\"YzhlNDY0MDUtNzk0NC00Mjg2LWIxNGMtOGZlZWUxMWUyNGMx\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzEwMDAwMV84MTU4MTAwOC0wOWEzLTRkNGItYjViNi1hMWYyOTllNDJlZDAiLCJjcmVhdGVkIjoxNzI5ODc0NTA2NTc2LCJzeXNVc2VySWQiOjEwMDAwMX0.RQto6m0Ib9xwOKS_lj1KWXAaL94wYP4ZkpIdoQwnZlMBxxSbbee-p7NqoRwWK-nnfJerNnoZEGhfvowwlZFCkQ\"}}', '2024-10-26 00:41:46.579');
INSERT INTO `t_sys_log` VALUES (76, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"bnE3dw==\",\"vt\":\"NWE5MTVlYmEtM2E2Zi00ZGNlLTg5MWItN2E4NGM1OGZlMTZl\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzgwMV81MGRmYTkzYy0zZDEwLTRkYTQtOGZmYi1kNmMwYzc2M2UxYmUiLCJjcmVhdGVkIjoxNzI5ODc0Njk1MTE5LCJzeXNVc2VySWQiOjgwMX0.QRuEY4A4USQppPr8o4vFbXDfaJhMbJTmnqtSutCPdYaY3xyZNVduTo7JKQgwFboG_iXJuZHdXosqMVqIzr9HuQ\"}}', '2024-10-26 00:44:55.176');
INSERT INTO `t_sys_log` VALUES (77, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"ZnVwZw==\",\"vt\":\"ZGJjMTljZWItNDEyMS00MDNkLTgwNTYtMGE1OGZlMmFiMTM1\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzEwMDAwMV8zMGQwNmZlYi1hZWIwLTRmYWEtYmRmMi1iNDVjMmZmNGNjYTYiLCJjcmVhdGVkIjoxNzI5OTI5MjM4NDAwLCJzeXNVc2VySWQiOjEwMDAwMX0._ruimn1u_-haG9QdyYqTXZ-t4ntnvbNAUdbifPrHfutLncedUKHJhS7v5RgW9l7sVwpMrRI4JulpnH6ZX0zcsg\"}}', '2024-10-26 15:53:58.432');
INSERT INTO `t_sys_log` VALUES (78, NULL, NULL, '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"am9maQ==\",\"vt\":\"NjVkMzgzYzktODcwNS00NmIwLTgxNzAtNGI1MWMwNjBmYTA2\"}', '验证码有误！', '2024-10-26 15:55:08.696');
INSERT INTO `t_sys_log` VALUES (79, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"NGc3dA==\",\"vt\":\"ZjA2MTU3YzYtYzIyNi00NDVhLWI4NzktODU4Y2Y2ZGY0ZTI2\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzgwMV9lZGFkZjNkMC1kOGE2LTQ1ZTctOWU3My1kZDYxZDE0YjQ2YmMiLCJjcmVhdGVkIjoxNzI5OTI5MzE3ODgyLCJzeXNVc2VySWQiOjgwMX0.7LlWV-45Bk747lB5IdBvTaNdnrtAKmk8-2mOHpRY1-mbUmlgzCMjPMv-4vBfQ8wu-4knJ0o8d8USUR1hW3tQkQ\"}}', '2024-10-26 15:55:17.898');
INSERT INTO `t_sys_log` VALUES (80, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"aGI2Mg==\",\"vt\":\"NjQ4MzY0YTItYmU1Yi00Njc3LTgwY2EtMThlMDJlZjAyZWIw\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzEwMDAwMV9kMTM1YjkyZi1mZGNkLTQyZTItYTRjZC03NjI2NGY5MjI3N2YiLCJjcmVhdGVkIjoxNzMwMDk2OTI5MTQwLCJzeXNVc2VySWQiOjEwMDAwMX0.iUfDF3CNYDJ8ls8bj64ka9Rer2phDq3ouKwQFbRe_5lUMzwKQgC3RQXhX2rbepMgg4mdHBzqEYf5pgoQnFVoYg\"}}', '2024-10-28 14:28:49.176');
INSERT INTO `t_sys_log` VALUES (81, 801, '超管', '0:0:0:0:0:0:0:1', 'MGR', 'com.jeequan.jeepay.mgr.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9217/api/anon/auth/validate', '{\"ip\":\"amVlcGF5MTIz\",\"ia\":\"amVlcGF5\",\"vc\":\"ZTBhdw==\",\"vt\":\"NGUxNTZmNmEtZTQxZS00NTM3LWJkMzctYzcwMDliNTNiYmE2\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzgwMV8zMmIyZmZiYS05OTk0LTQyN2YtOTAyOC1mY2NjZGRjMGEyNzYiLCJjcmVhdGVkIjoxNzMwMDk2OTUxMTU3LCJzeXNVc2VySWQiOjgwMX0.NJ86nfcYF6RAioKE_qdzt5WLfs-Hw4qov9fwx49LJZ23SlgDSGSOWULxkD1uYU9SglxnisdmJcURKe9BKvglmA\"}}', '2024-10-28 14:29:11.190');
INSERT INTO `t_sys_log` VALUES (82, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.order.PayOrderController.callbackPankou', '发起回调盘口', 'http://localhost:9218/api/payOrder/callbackPankou', '{\"payOrderId\":\"P1850132265473638402\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-28 14:29:24.045');
INSERT INTO `t_sys_log` VALUES (83, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.division.MchDivisionReceiverGroupController.add', '新增分账账号组', 'http://localhost:9218/api/divisionReceiverGroups', '{\"autoDivisionFlag\":1,\"receiverGroupName\":\"测试组\"}', '{\"msg\":\"SUCCESS\",\"code\":0}', '2024-10-28 14:42:47.372');
INSERT INTO `t_sys_log` VALUES (84, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.division.MchDivisionReceiverController.add', '新增分账接收账号', 'http://localhost:9218/api/divisionReceivers', '{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"receiverGroupId\":100001,\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"accNo\":\"pgnihl8470@sandbox.com\",\"accName\":\"贺求威\",\"receiverAlias\":\"自己账号\",\"accType\":\"1\",\"divisionProfit\":\"10\",\"reqBindState\":0,\"relationTypeName\":\"合作伙伴\",\"rowKey\":\"1730097774638_1\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"accNo\":\"pgnihl8470@sandbox.com\",\"accName\":\"贺求威\",\"errMsg\":\"Business Failed【分账接收方全称不匹配】\",\"relationTypeName\":\"合作伙伴\",\"receiverGroupId\":100001,\"bindState\":0,\"errCode\":\"USERNAME_NOT_MATCH\",\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"receiverAlias\":\"自己账号\",\"accType\":1,\"divisionProfit\":0.1,\"mchNo\":\"M1729703764\"}}', '2024-10-28 14:45:25.581');
INSERT INTO `t_sys_log` VALUES (85, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.division.MchDivisionReceiverController.add', '新增分账接收账号', 'http://localhost:9218/api/divisionReceivers', '{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"receiverGroupId\":100001,\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"accNo\":\"pgnihl8470@sandbox.com\",\"accName\":\"贺求威\",\"receiverAlias\":\"自己账号\",\"accType\":\"1\",\"divisionProfit\":\"10\",\"reqBindState\":2,\"relationTypeName\":\"合作伙伴\",\"rowKey\":\"1730097774638_1\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"accNo\":\"pgnihl8470@sandbox.com\",\"accName\":\"贺求威\",\"errMsg\":\"Business Failed【分账接收方全称不匹配】\",\"relationTypeName\":\"合作伙伴\",\"receiverGroupId\":100001,\"bindState\":0,\"errCode\":\"USERNAME_NOT_MATCH\",\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"receiverAlias\":\"自己账号\",\"accType\":1,\"divisionProfit\":0.1,\"mchNo\":\"M1729703764\"}}', '2024-10-28 14:45:44.662');
INSERT INTO `t_sys_log` VALUES (86, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.division.MchDivisionReceiverController.add', '新增分账接收账号', 'http://localhost:9218/api/divisionReceivers', '{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"receiverGroupId\":100001,\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"accNo\":\"pgnihl8470@sandbox.com\",\"accName\":\"贺求威\",\"receiverAlias\":\"自己账号\",\"accType\":\"1\",\"divisionProfit\":\"10\",\"reqBindState\":2,\"relationTypeName\":\"合作伙伴\",\"rowKey\":\"1730097774638_1\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"accNo\":\"pgnihl8470@sandbox.com\",\"accName\":\"贺求威\",\"errMsg\":\"Business Failed【分账接收方全称不匹配】\",\"relationTypeName\":\"合作伙伴\",\"receiverGroupId\":100001,\"bindState\":0,\"errCode\":\"USERNAME_NOT_MATCH\",\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"receiverAlias\":\"自己账号\",\"accType\":1,\"divisionProfit\":0.1,\"mchNo\":\"M1729703764\"}}', '2024-10-28 14:45:57.970');
INSERT INTO `t_sys_log` VALUES (87, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.division.MchDivisionReceiverController.add', '新增分账接收账号', 'http://localhost:9218/api/divisionReceivers', '{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"receiverGroupId\":100001,\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"accNo\":\"pgnihl8470@sandbox.com\",\"accName\":\"贺求威\",\"receiverAlias\":\"自己账号\",\"accType\":\"1\",\"divisionProfit\":\"10\",\"reqBindState\":2,\"relationTypeName\":\"合作伙伴\",\"rowKey\":\"1730097774638_1\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"accNo\":\"pgnihl8470@sandbox.com\",\"accName\":\"贺求威\",\"errMsg\":\"Business Failed【分账接收方全称不匹配】\",\"relationTypeName\":\"合作伙伴\",\"receiverGroupId\":100001,\"bindState\":0,\"errCode\":\"USERNAME_NOT_MATCH\",\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"receiverAlias\":\"自己账号\",\"accType\":1,\"divisionProfit\":0.1,\"mchNo\":\"M1729703764\"}}', '2024-10-28 14:46:51.001');
INSERT INTO `t_sys_log` VALUES (88, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.division.MchDivisionReceiverController.add', '新增分账接收账号', 'http://localhost:9218/api/divisionReceivers', '{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"receiverGroupId\":100001,\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"accNo\":\"pgnihl8470@sandbox.com\",\"accName\":\"贺求威\",\"receiverAlias\":\"自己账号\",\"accType\":\"1\",\"divisionProfit\":\"10\",\"reqBindState\":2,\"relationTypeName\":\"合作伙伴\",\"rowKey\":\"1730097774638_1\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"accNo\":\"pgnihl8470@sandbox.com\",\"accName\":\"贺求威\",\"errMsg\":\"Business Failed【分账接收方全称不匹配】\",\"relationTypeName\":\"合作伙伴\",\"receiverGroupId\":100001,\"bindState\":0,\"errCode\":\"USERNAME_NOT_MATCH\",\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"receiverAlias\":\"自己账号\",\"accType\":1,\"divisionProfit\":0.1,\"mchNo\":\"M1729703764\"}}', '2024-10-28 14:49:31.473');
INSERT INTO `t_sys_log` VALUES (89, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.division.MchDivisionReceiverController.add', '新增分账接收账号', 'http://localhost:9218/api/divisionReceivers', '{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"receiverGroupId\":100001,\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"accNo\":\"pgnihl8470@sandbox.com\",\"accName\":\"贺求威\",\"receiverAlias\":\"贺求威\",\"accType\":\"1\",\"divisionProfit\":\"10\",\"reqBindState\":2,\"relationTypeName\":\"合作伙伴\",\"rowKey\":\"1730097774638_1\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"accNo\":\"pgnihl8470@sandbox.com\",\"accName\":\"贺求威\",\"errMsg\":\"Business Failed【分账接收方全称不匹配】\",\"relationTypeName\":\"合作伙伴\",\"receiverGroupId\":100001,\"bindState\":0,\"errCode\":\"USERNAME_NOT_MATCH\",\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"receiverAlias\":\"贺求威\",\"accType\":1,\"divisionProfit\":0.1,\"mchNo\":\"M1729703764\"}}', '2024-10-28 14:50:25.165');
INSERT INTO `t_sys_log` VALUES (90, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.division.MchDivisionReceiverController.add', '新增分账接收账号', 'http://localhost:9218/api/divisionReceivers', '{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"receiverGroupId\":100001,\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"accNo\":\"pgnihl8470@sandbox.com\",\"accName\":\"贺求威\",\"receiverAlias\":\"pgnihl8470@sandbox.com\",\"accType\":\"1\",\"divisionProfit\":\"10\",\"reqBindState\":2,\"relationTypeName\":\"合作伙伴\",\"rowKey\":\"1730097774638_1\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"accNo\":\"pgnihl8470@sandbox.com\",\"accName\":\"贺求威\",\"errMsg\":\"Business Failed【分账接收方全称不匹配】\",\"relationTypeName\":\"合作伙伴\",\"receiverGroupId\":100001,\"bindState\":0,\"errCode\":\"USERNAME_NOT_MATCH\",\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"receiverAlias\":\"pgnihl8470@sandbox.com\",\"accType\":1,\"divisionProfit\":0.1,\"mchNo\":\"M1729703764\"}}', '2024-10-28 14:50:41.210');
INSERT INTO `t_sys_log` VALUES (91, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.division.MchDivisionReceiverController.add', '新增分账接收账号', 'http://localhost:9218/api/divisionReceivers', '{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"receiverGroupId\":100001,\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"accNo\":\"pgnihl8470@sandbox.com\",\"accName\":\"pgnihl8470@sandbox.com\",\"receiverAlias\":\"pgnihl8470@sandbox.com\",\"accType\":\"1\",\"divisionProfit\":\"10\",\"reqBindState\":2,\"relationTypeName\":\"合作伙伴\",\"rowKey\":\"1730097774638_1\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"accNo\":\"pgnihl8470@sandbox.com\",\"accName\":\"pgnihl8470@sandbox.com\",\"bindSuccessTime\":1730098247554,\"relationTypeName\":\"合作伙伴\",\"receiverGroupId\":100001,\"bindState\":1,\"receiverId\":800001,\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"receiverAlias\":\"pgnihl8470@sandbox.com\",\"accType\":1,\"divisionProfit\":0.1,\"mchNo\":\"M1729703764\"}}', '2024-10-28 14:50:47.629');
INSERT INTO `t_sys_log` VALUES (92, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"Z2hwdQ==\",\"vt\":\"MDNlMWZjMWUtNmIxOC00ZDQ3LWE5YmEtYjNkNjFlZGM1MzQ2\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzEwMDAwMV9lNzIyOTUyYy1kMTVjLTRjMzEtYWMwZS0xYmM1NzI4ZDdhNWYiLCJjcmVhdGVkIjoxNzMwMDk4NTc5MzEzLCJzeXNVc2VySWQiOjEwMDAwMX0.TrbgxXG_SCVAyY3JY5D6CX4lqNvAqCCObGyZLZF4iz28ICXzOAPu0X1Tzr4HNmsxKWWu3Z51xRILQcR42sSDKg\"}}', '2024-10-28 14:56:19.313');
INSERT INTO `t_sys_log` VALUES (93, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.division.MchDivisionReceiverController.add', '新增分账接收账号', 'http://localhost:9218/api/divisionReceivers', '{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"receiverGroupId\":100001,\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"accNo\":\"lcxptt4632@sandbox.com\",\"accName\":\"lcxptt4632@sandbox.com\",\"receiverAlias\":\"\",\"accType\":\"1\",\"divisionProfit\":\"10\",\"reqBindState\":0,\"relationTypeName\":\"合作伙伴\",\"rowKey\":\"1730098585281_1\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"ifCode\":\"alipay\",\"relationType\":\"PARTNER\",\"accNo\":\"lcxptt4632@sandbox.com\",\"accName\":\"lcxptt4632@sandbox.com\",\"bindSuccessTime\":1730098600090,\"relationTypeName\":\"合作伙伴\",\"receiverGroupId\":100001,\"bindState\":1,\"receiverId\":800002,\"appId\":\"67192f55d2e0f36eccb0c3bc\",\"receiverAlias\":\"lcxptt4632@sandbox.com\",\"accType\":1,\"divisionProfit\":0.1,\"mchNo\":\"M1729703764\"}}', '2024-10-28 14:56:40.209');
INSERT INTO `t_sys_log` VALUES (94, NULL, NULL, '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"a2duaw==\",\"vt\":\"MmIyOGRmMjUtMjIxOC00MjYyLWE0YWItYjQwOGVhNjM3MzZi\"}', '验证码有误！', '2024-10-28 15:54:24.927');
INSERT INTO `t_sys_log` VALUES (95, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"a2duag==\",\"vt\":\"MmIyOGRmMjUtMjIxOC00MjYyLWE0YWItYjQwOGVhNjM3MzZi\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzEwMDAwMV8zMzJiNzcwYi03NDFhLTRkOWYtYmVlNS0xOTljOWMwYjFkOWYiLCJjcmVhdGVkIjoxNzMwMTAyMDcwOTcyLCJzeXNVc2VySWQiOjEwMDAwMX0.WqxRHZA9EfLUYaikIF_ihNPEh-ECgCMZnllSyumK581MPIqFiSgVKCZCoOlvUeids_1C252YWo6ju0-qHAAWYA\"}}', '2024-10-28 15:54:30.977');
INSERT INTO `t_sys_log` VALUES (96, 100001, 'jeepay', '0:0:0:0:0:0:0:1', 'MCH', 'com.jeequan.jeepay.mch.ctrl.anon.AuthController.validate', '登录认证', 'http://localhost:9218/api/anon/auth/validate', '{\"ip\":\"amVlcGF5NjY2\",\"ia\":\"amVlcGF5\",\"vc\":\"aXlhaQ==\",\"vt\":\"YzY4OTMxMzEtNDQ4MS00YjExLTkyNTYtYjZhZjJjN2Q2OWZh\"}', '{\"msg\":\"SUCCESS\",\"code\":0,\"data\":{\"iToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJjYWNoZUtleSI6IlRPS0VOXzEwMDAwMV84ZGM0Mjk5Zi1hYzFhLTRmZDYtYTU0Zi03MDM5YmUzZjZlYjAiLCJjcmVhdGVkIjoxNzMwMTA3NzExNjc4LCJzeXNVc2VySWQiOjEwMDAwMX0.bSXRgM6yKVVNHqH7BacGOEOPaYd8FByukW7jru4EudktbdvcIXVR7V3jVnXo3cZm3BY23qe0U3IDaP6P9TaSYQ\"}}', '2024-10-28 17:28:31.686');

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role`  (
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色ID, ROLE_开头',
  `role_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `sys_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属系统： MGR-运营平台, MCH-商户中心',
  `belong_info_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '所属商户ID / 0(平台)',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES ('ROLE_ADMIN', '系统管理员', 'MGR', '0', '2021-05-01 00:00:00.000');
INSERT INTO `t_sys_role` VALUES ('ROLE_OP', '普通操作员', 'MGR', '0', '2021-05-01 00:00:00.000');

-- ----------------------------
-- Table structure for t_sys_role_ent_rela
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_ent_rela`;
CREATE TABLE `t_sys_role_ent_rela`  (
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色ID',
  `ent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`, `ent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统角色权限关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_role_ent_rela
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user`  (
  `sys_user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '系统用户ID',
  `login_username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录用户名',
  `realname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '真实姓名',
  `telphone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `sex` tinyint(6) NOT NULL DEFAULT 0 COMMENT '性别 0-未知, 1-男, 2-女',
  `avatar_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像地址',
  `user_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '员工编号',
  `is_admin` tinyint(6) NOT NULL DEFAULT 0 COMMENT '是否超管（超管拥有全部权限） 0-否 1-是',
  `state` tinyint(6) NOT NULL DEFAULT 0 COMMENT '状态 0-停用 1-启用',
  `sys_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属系统： MGR-运营平台, MCH-商户中心',
  `belong_info_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '所属商户ID / 0(平台)',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`sys_user_id`) USING BTREE,
  UNIQUE INDEX `sys_type`(`sys_type` ASC, `login_username` ASC) USING BTREE,
  UNIQUE INDEX `sys_type_2`(`sys_type` ASC, `telphone` ASC) USING BTREE,
  UNIQUE INDEX `sys_type_3`(`sys_type` ASC, `user_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES (801, 'jeepay', '超管', '13000000001', 1, 'https://jeequan.oss-cn-beijing.aliyuncs.com/jeepay/img/defava_m.png', 'D0001', 1, 1, 'MGR', '0', '2020-06-13 00:00:00.000', '2020-06-13 00:00:00.000');
INSERT INTO `t_sys_user` VALUES (100001, 'jeepay', 'jeepay', '13100000000', 1, 'https://jeequan.oss-cn-beijing.aliyuncs.com/jeepay/img/defava_m.png', 'M1729703764', 1, 1, 'MCH', 'M1729703764', '2024-10-24 01:16:04.934', '2024-10-24 01:16:04.934');

-- ----------------------------
-- Table structure for t_sys_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_auth`;
CREATE TABLE `t_sys_user_auth`  (
  `auth_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(20) NOT NULL COMMENT 'user_id',
  `identity_type` tinyint(6) NOT NULL DEFAULT 0 COMMENT '登录类型  1-登录账号 2-手机号 3-邮箱  10-微信  11-QQ 12-支付宝 13-微博',
  `identifier` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '认证标识 ( 用户名 | open_id )',
  `credential` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码凭证',
  `salt` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'salt',
  `sys_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属系统： MGR-运营平台, MCH-商户中心',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1003 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户认证表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_user_auth
-- ----------------------------
INSERT INTO `t_sys_user_auth` VALUES (801, 801, 1, 'jeepay', '$2a$10$WKuPJKE1XhX15ibqDM745eOCaZZVUiRitUjEyX6zVNd9k.cQXfzGa', 'testkey', 'MGR');
INSERT INTO `t_sys_user_auth` VALUES (1001, 100001, 1, 'jeepay', '$2a$10$s4Fc.847s.oHxNN2tJwLGuU0EP9pO0q6kjTiRM1Zr/RqQlQVvwtIG', '6798a8', 'MCH');
INSERT INTO `t_sys_user_auth` VALUES (1002, 100001, 2, '13100000000', '$2a$10$s4Fc.847s.oHxNN2tJwLGuU0EP9pO0q6kjTiRM1Zr/RqQlQVvwtIG', '6798a8', 'MCH');

-- ----------------------------
-- Table structure for t_sys_user_role_rela
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_role_rela`;
CREATE TABLE `t_sys_user_role_rela`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作员<->角色 关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_user_role_rela
-- ----------------------------

-- ----------------------------
-- Table structure for t_transfer_order
-- ----------------------------
DROP TABLE IF EXISTS `t_transfer_order`;
CREATE TABLE `t_transfer_order`  (
  `transfer_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '转账订单号',
  `mch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户号',
  `isv_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务商号',
  `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用ID',
  `mch_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户名称',
  `mch_type` tinyint(6) NOT NULL COMMENT '类型: 1-普通商户, 2-特约商户(服务商模式)',
  `mch_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户订单号',
  `if_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付接口代码',
  `entry_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '入账方式： WX_CASH-微信零钱; ALIPAY_CASH-支付宝转账; BANK_CARD-银行卡',
  `amount` bigint(20) NOT NULL COMMENT '转账金额,单位分',
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'cny' COMMENT '三位货币代码,人民币:cny',
  `account_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收款账号',
  `account_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收款人姓名',
  `bank_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收款人开户行名称',
  `transfer_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '转账备注信息',
  `client_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端IP',
  `state` tinyint(6) NOT NULL DEFAULT 0 COMMENT '支付状态: 0-订单生成, 1-转账中, 2-转账成功, 3-转账失败, 4-订单关闭',
  `channel_extra` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '特定渠道发起额外参数',
  `channel_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '渠道订单号',
  `err_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '渠道支付错误码',
  `err_msg` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '渠道支付错误描述',
  `ext_param` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商户扩展参数',
  `notify_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '异步通知地址',
  `success_time` datetime NULL DEFAULT NULL COMMENT '转账成功时间',
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`transfer_id`) USING BTREE,
  UNIQUE INDEX `Uni_MchNo_MchOrderNo`(`mch_no` ASC, `mch_order_no` ASC) USING BTREE,
  INDEX `created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '转账订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_transfer_order
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
