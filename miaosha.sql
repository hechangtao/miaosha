/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : 127.0.0.1:3306
 Source Schema         : miaosha

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : 65001

 Date: 01/03/2019 09:40:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for item_stock
-- ----------------------------
DROP TABLE IF EXISTS `item_stock`;
CREATE TABLE `item_stock`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品库存id',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '商品库存',
  `item_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_stock
-- ----------------------------
INSERT INTO `item_stock` VALUES (1, 94, 1);
INSERT INTO `item_stock` VALUES (2, 97, 2);

-- ----------------------------
-- Table structure for t_item
-- ----------------------------
DROP TABLE IF EXISTS `t_item`;
CREATE TABLE `t_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品描述',
  `sales` int(11) NOT NULL DEFAULT 0 COMMENT '商品销量',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品图片地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_item
-- ----------------------------
INSERT INTO `t_item` VALUES (1, '苹果8p', 5600.00, '世界上最好用的手机', 4, 'https://img10.360buyimg.com/n7/jfs/t1/3405/18/3537/69901/5b997c0aE5dc8ed9f/a2c208410ae84d1f.jpg');
INSERT INTO `t_item` VALUES (2, '苹果8p', 7800.00, '世界上最好用的手机', 2, 'https://img10.360buyimg.com/n7/jfs/t1/3405/18/3537/69901/5b997c0aE5dc8ed9f/a2c208410ae84d1f.jpg');

-- ----------------------------
-- Table structure for t_order_info
-- ----------------------------
DROP TABLE IF EXISTS `t_order_info`;
CREATE TABLE `t_order_info`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `item_price` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `amount` int(11) NOT NULL DEFAULT 0,
  `order_price` decimal(10, 0) NOT NULL DEFAULT 0,
  `promo_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_info
-- ----------------------------
INSERT INTO `t_order_info` VALUES ('2019022700000000', 1, 1, 5600.00, 1, 5600, 0);
INSERT INTO `t_order_info` VALUES ('2019022700000100', 1, 2, 7800.00, 1, 7800, 0);
INSERT INTO `t_order_info` VALUES ('2019022700000200', 1, 1, 5600.00, 1, 5600, 0);
INSERT INTO `t_order_info` VALUES ('2019022700000300', 1, 1, 5600.00, 1, 5600, 0);
INSERT INTO `t_order_info` VALUES ('2019022700000400', 1, 1, 100.00, 1, 100, 1);
INSERT INTO `t_order_info` VALUES ('2019022700000500', 1, 1, 100.00, 1, 100, 1);
INSERT INTO `t_order_info` VALUES ('2019022700000600', 1, 2, 7800.00, 1, 7800, 0);
INSERT INTO `t_order_info` VALUES ('2019022700000700', 1, 2, 7800.00, 1, 7800, 0);
INSERT INTO `t_order_info` VALUES ('2019022700000800', 1, 1, 100.00, 1, 100, 1);

-- ----------------------------
-- Table structure for t_promo
-- ----------------------------
DROP TABLE IF EXISTS `t_promo`;
CREATE TABLE `t_promo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promo_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `start_date` datetime(0) NOT NULL,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `promo_item_price` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `end_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_promo
-- ----------------------------
INSERT INTO `t_promo` VALUES (1, 'iphone8p', '2019-02-27 17:35:00', 1, 100.00, '2019-02-27 19:00:00');

-- ----------------------------
-- Table structure for t_sequence_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sequence_info`;
CREATE TABLE `t_sequence_info`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `current_value` int(11) NOT NULL DEFAULT 0,
  `step` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sequence_info
-- ----------------------------
INSERT INTO `t_sequence_info` VALUES ('t_order_info', 9, 1);

-- ----------------------------
-- Table structure for t_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `gender` tinyint(4) NOT NULL DEFAULT 0 COMMENT '性别',
  `age` int(11) NOT NULL DEFAULT 0 COMMENT '年龄',
  `registerMode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `thirdPartyId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tel_unique_index`(`tel`) USING BTREE COMMENT '手机号唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_info
-- ----------------------------
INSERT INTO `t_user_info` VALUES (1, 'dockerTest', '4QrcOUm6Wau+VuBX8g+IPg==', '15810951990', 1, 23, '', '');

SET FOREIGN_KEY_CHECKS = 1;
