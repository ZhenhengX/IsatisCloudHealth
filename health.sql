/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : health

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 07/06/2022 16:26:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for h_address
-- ----------------------------
DROP TABLE IF EXISTS `h_address`;
CREATE TABLE `h_address`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `addressName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lngAndLat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经纬度',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `map` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detailaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_address
-- ----------------------------
INSERT INTO `h_address` VALUES (4, '合肥第二人民医院', '1731111111', '117.28269909,31.86694226', '857bf9f7-7a0b-4520-a306-4933aa95392e.jpg', NULL, '安徽省合肥市庐阳区');
INSERT INTO `h_address` VALUES (6, '第三医院', '17356535908', '117.315828,31.760817', '6d086275-07de-4b16-9550-1494494b75ba.jpg', NULL, '安徽省合肥市包河区');
INSERT INTO `h_address` VALUES (7, '精神病院', '1234567894513', '117.223914,31.866984', '352aa2b7-c624-4f2a-b85b-56b0a06b03e8.jpg', NULL, '安徽省合肥市蜀山区');
INSERT INTO `h_address` VALUES (11, '骨科医院', '12345678910', '117.429374,31.903716', 'b3fb4dbf-d344-4868-97ac-77690bf3f1f8.jpg', NULL, '安徽省合肥市瑶海区');
INSERT INTO `h_address` VALUES (12, '市二院', '123456', '117.404657,31.973398', '423cdc6e-6fe0-4e00-84fc-935442f22bb4.jpg', NULL, '安徽省合肥市瑶海区魏武路');
INSERT INTO `h_address` VALUES (13, '门诊部', '13453733473', '117.112236,31.84944', 'b6d53601-3c83-4419-8c3a-c90e13f1ba7f.jpg', NULL, '安徽省合肥市蜀山区');
INSERT INTO `h_address` VALUES (14, '省医院', '5463753737', '117.288764,31.888727', '6b5588c0-407f-4f9c-9047-b72f1fc12b79.jpg', NULL, '安徽省合肥市庐阳区阜阳路95号');

-- ----------------------------
-- Table structure for h_check_group
-- ----------------------------
DROP TABLE IF EXISTS `h_check_group`;
CREATE TABLE `h_check_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `helpCode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attention` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_check_group
-- ----------------------------
INSERT INTO `h_check_group` VALUES (5, '0001', '一般检查', 'YBJC', '0', '一般检查', '无');
INSERT INTO `h_check_group` VALUES (6, '0002', '视力色觉', 'SLSJ', '0', '视力色觉', '无');
INSERT INTO `h_check_group` VALUES (7, '0003', '血常规', 'XCG', '0', '血常规', '无');
INSERT INTO `h_check_group` VALUES (9, '0005', '肝功三项', 'GGSX', '0', '肝功三项', '无');
INSERT INTO `h_check_group` VALUES (10, '0006', '肾功三项', 'NGSX', '0', '肾功三项', '无');
INSERT INTO `h_check_group` VALUES (11, '0007', '血脂四项', 'XZSX', '0', '血脂四项', '无');
INSERT INTO `h_check_group` VALUES (12, '0008', '心肌酶三项', 'XJMSX', '0', '心肌酶三项', '无');
INSERT INTO `h_check_group` VALUES (13, '0009', '甲功三项', 'JGSX', '0', '甲功三项', '无');
INSERT INTO `h_check_group` VALUES (14, '0010', '子宫附件彩超', 'ZGFJCC', '2', '子宫附件彩超', '无');
INSERT INTO `h_check_group` VALUES (15, '0011', '胆红素三项', 'DHSSX', '0', '胆红素三项', '无');
INSERT INTO `h_check_group` VALUES (19, '0012', 'test', 'test', '1', 'test', 'test');

-- ----------------------------
-- Table structure for h_check_item
-- ----------------------------
DROP TABLE IF EXISTS `h_check_item`;
CREATE TABLE `h_check_item`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查检项类型,分为检查和检验两种',
  `attention` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_check_item
-- ----------------------------
INSERT INTO `h_check_item` VALUES (28, '0001', '身高', '0', '0-100', 5, '1', '无', '身高');
INSERT INTO `h_check_item` VALUES (29, '0002', '体重', '0', '0-100', 5, '1', '无', '体重');
INSERT INTO `h_check_item` VALUES (30, '0003', '体重指数', '0', '0-100', 5, '1', '无', '体重指数');
INSERT INTO `h_check_item` VALUES (31, '0004', '收缩压', '0', '0-100', 5, '1', '无', '收缩压');
INSERT INTO `h_check_item` VALUES (32, '0005', '舒张压', '0', '0-100', 5, '1', '无', '舒张压');
INSERT INTO `h_check_item` VALUES (33, '0006', '裸视力（右）', '0', '0-100', 5, '1', '无', '裸视力（右）');
INSERT INTO `h_check_item` VALUES (34, '0007', '裸视力（左）', '0', '0-100', 5, '1', '无', '裸视力（左）');
INSERT INTO `h_check_item` VALUES (35, '0008', '矫正视力（右）', '0', '0-100', 5, '1', '无', '矫正视力（右）');
INSERT INTO `h_check_item` VALUES (36, '0009', '矫正视力（左）', '0', '0-100', 5, '1', '无', '矫正视力（左）');
INSERT INTO `h_check_item` VALUES (38, '0011', '白细胞计数', '0', '0-100', 10, '2', '无', '白细胞计数');
INSERT INTO `h_check_item` VALUES (39, '0012', '红细胞计数', '0', '0-100', 10, '2', NULL, '红细胞计数');
INSERT INTO `h_check_item` VALUES (40, '0013', '血红蛋白', '0', '0-100', 10, '2', NULL, '血红蛋白');
INSERT INTO `h_check_item` VALUES (41, '0014', '红细胞压积', '0', '0-100', 10, '2', NULL, '红细胞压积');
INSERT INTO `h_check_item` VALUES (42, '0015', '平均红细胞体积', '0', '0-100', 10, '2', NULL, '平均红细胞体积');
INSERT INTO `h_check_item` VALUES (43, '0016', '平均红细胞血红蛋白含量', '0', '0-100', 10, '2', NULL, '平均红细胞血红蛋白含量');
INSERT INTO `h_check_item` VALUES (44, '0017', '平均红细胞血红蛋白浓度', '0', '0-100', 10, '2', NULL, '平均红细胞血红蛋白浓度');
INSERT INTO `h_check_item` VALUES (45, '0018', '红细胞分布宽度-变异系数', '0', '0-100', 10, '2', NULL, '红细胞分布宽度-变异系数');
INSERT INTO `h_check_item` VALUES (46, '0019', '血小板计数', '0', '0-100', 10, '2', NULL, '血小板计数');
INSERT INTO `h_check_item` VALUES (47, '0020', '平均血小板体积', '0', '0-100', 10, '2', NULL, '平均血小板体积');
INSERT INTO `h_check_item` VALUES (48, '0021', '血小板分布宽度', '0', '0-100', 10, '2', NULL, '血小板分布宽度');
INSERT INTO `h_check_item` VALUES (49, '0022', '淋巴细胞百分比', '0', '0-100', 10, '2', NULL, '淋巴细胞百分比');
INSERT INTO `h_check_item` VALUES (50, '0023', '中间细胞百分比', '0', '0-100', 10, '2', NULL, '中间细胞百分比');
INSERT INTO `h_check_item` VALUES (51, '0024', '中性粒细胞百分比', '0', '0-100', 10, '2', NULL, '中性粒细胞百分比');
INSERT INTO `h_check_item` VALUES (52, '0025', '淋巴细胞绝对值', '0', '0-100', 10, '2', NULL, '淋巴细胞绝对值');
INSERT INTO `h_check_item` VALUES (53, '0026', '中间细胞绝对值', '0', '0-100', 10, '2', NULL, '中间细胞绝对值');
INSERT INTO `h_check_item` VALUES (54, '0027', '中性粒细胞绝对值', '0', '0-100', 10, '2', NULL, '中性粒细胞绝对值');
INSERT INTO `h_check_item` VALUES (55, '0028', '红细胞分布宽度-标准差', '0', '0-100', 10, '2', NULL, '红细胞分布宽度-标准差');
INSERT INTO `h_check_item` VALUES (56, '0029', '血小板压积', '0', '0-100', 10, '2', NULL, '血小板压积');
INSERT INTO `h_check_item` VALUES (57, '0030', '尿比重', '0', '0-100', 10, '2', NULL, '尿比重');
INSERT INTO `h_check_item` VALUES (58, '0031', '尿酸碱度', '0', '0-100', 10, '2', NULL, '尿酸碱度');
INSERT INTO `h_check_item` VALUES (59, '0032', '尿白细胞', '0', '0-100', 10, '2', NULL, '尿白细胞');
INSERT INTO `h_check_item` VALUES (60, '0033', '尿亚硝酸盐', '0', '0-100', 10, '2', NULL, '尿亚硝酸盐');
INSERT INTO `h_check_item` VALUES (61, '0034', '尿蛋白质', '0', '0-100', 10, '2', NULL, '尿蛋白质');
INSERT INTO `h_check_item` VALUES (62, '0035', '尿糖', '0', '0-100', 10, '2', NULL, '尿糖');
INSERT INTO `h_check_item` VALUES (63, '0036', '尿酮体', '0', '0-100', 10, '2', NULL, '尿酮体');
INSERT INTO `h_check_item` VALUES (64, '0037', '尿胆原', '0', '0-100', 10, '2', NULL, '尿胆原');
INSERT INTO `h_check_item` VALUES (65, '0038', '尿胆红素', '0', '0-100', 10, '2', NULL, '尿胆红素');
INSERT INTO `h_check_item` VALUES (66, '0039', '尿隐血', '0', '0-100', 10, '2', NULL, '尿隐血');
INSERT INTO `h_check_item` VALUES (67, '0040', '尿镜检红细胞', '0', '0-100', 10, '2', NULL, '尿镜检红细胞');
INSERT INTO `h_check_item` VALUES (68, '0041', '尿镜检白细胞', '0', '0-100', 10, '2', NULL, '尿镜检白细胞');
INSERT INTO `h_check_item` VALUES (69, '0042', '上皮细胞', '0', '0-100', 10, '2', NULL, '上皮细胞');
INSERT INTO `h_check_item` VALUES (70, '0043', '无机盐类', '0', '0-100', 10, '2', NULL, '无机盐类');
INSERT INTO `h_check_item` VALUES (71, '0044', '尿镜检蛋白定性', '0', '0-100', 10, '2', NULL, '尿镜检蛋白定性');
INSERT INTO `h_check_item` VALUES (72, '0045', '丙氨酸氨基转移酶', '0', '0-100', 10, '2', NULL, '丙氨酸氨基转移酶');
INSERT INTO `h_check_item` VALUES (73, '0046', '天门冬氨酸氨基转移酶', '0', '0-100', 10, '2', NULL, '天门冬氨酸氨基转移酶');
INSERT INTO `h_check_item` VALUES (74, '0047', 'Y-谷氨酰转移酶', '0', '0-100', 10, '2', NULL, 'Y-谷氨酰转移酶');
INSERT INTO `h_check_item` VALUES (75, '0048', '尿素', '0', '0-100', 10, '2', NULL, '尿素');
INSERT INTO `h_check_item` VALUES (76, '0049', '肌酐', '0', '0-100', 10, '2', NULL, '肌酐');
INSERT INTO `h_check_item` VALUES (77, '0050', '尿酸', '0', '0-100', 10, '2', NULL, '尿酸');
INSERT INTO `h_check_item` VALUES (78, '0051', '总胆固醇', '0', '0-100', 10, '2', NULL, '总胆固醇');
INSERT INTO `h_check_item` VALUES (79, '0052', '甘油三酯', '0', '0-100', 10, '2', NULL, '甘油三酯');
INSERT INTO `h_check_item` VALUES (80, '0053', '高密度脂蛋白胆固醇', '0', '0-100', 10, '2', NULL, '高密度脂蛋白胆固醇');
INSERT INTO `h_check_item` VALUES (81, '0054', '低密度脂蛋白胆固醇', '0', '0-100', 10, '2', NULL, '低密度脂蛋白胆固醇');
INSERT INTO `h_check_item` VALUES (82, '0055', '磷酸肌酸激酶', '0', '0-100', 10, '2', NULL, '磷酸肌酸激酶');
INSERT INTO `h_check_item` VALUES (83, '0056', '磷酸肌酸激酶同工酶', '0', '0-100', 10, '2', NULL, '磷酸肌酸激酶同工酶');
INSERT INTO `h_check_item` VALUES (84, '0057', '乳酸脱氢酶', '0', '0-100', 10, '2', NULL, '乳酸脱氢酶');
INSERT INTO `h_check_item` VALUES (85, '0058', '三碘甲状腺原氨酸', '0', '0-100', 10, '2', NULL, '三碘甲状腺原氨酸');
INSERT INTO `h_check_item` VALUES (86, '0059', '甲状腺素', '0', '0-100', 10, '2', NULL, '甲状腺素');
INSERT INTO `h_check_item` VALUES (87, '0060', '促甲状腺激素', '0', '0-100', 10, '2', NULL, '促甲状腺激素');
INSERT INTO `h_check_item` VALUES (90, '0063', '总胆红素', '0', '0-100', 10, '2', NULL, '总胆红素');
INSERT INTO `h_check_item` VALUES (91, '0064', '直接胆红素', '0', '0-100', 10, '2', NULL, '直接胆红素');
INSERT INTO `h_check_item` VALUES (92, '0065', '间接胆红素', '0', '0-100', 10, '2', NULL, '间接胆红素');
INSERT INTO `h_check_item` VALUES (94, '0066', 'test', '1', '20~30', 30, '1', 'test', 'test');

-- ----------------------------
-- Table structure for h_checkgroup_checkitem
-- ----------------------------
DROP TABLE IF EXISTS `h_checkgroup_checkitem`;
CREATE TABLE `h_checkgroup_checkitem`  (
  `checkgroup_id` int NOT NULL DEFAULT 0,
  `checkitem_id` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`checkgroup_id`, `checkitem_id`) USING BTREE,
  INDEX `item_id`(`checkitem_id`) USING BTREE,
  CONSTRAINT `group_id` FOREIGN KEY (`checkgroup_id`) REFERENCES `h_check_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_id` FOREIGN KEY (`checkitem_id`) REFERENCES `h_check_item` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_checkgroup_checkitem
-- ----------------------------
INSERT INTO `h_checkgroup_checkitem` VALUES (5, 28);
INSERT INTO `h_checkgroup_checkitem` VALUES (5, 29);
INSERT INTO `h_checkgroup_checkitem` VALUES (5, 30);
INSERT INTO `h_checkgroup_checkitem` VALUES (5, 31);
INSERT INTO `h_checkgroup_checkitem` VALUES (5, 32);
INSERT INTO `h_checkgroup_checkitem` VALUES (6, 33);
INSERT INTO `h_checkgroup_checkitem` VALUES (6, 34);
INSERT INTO `h_checkgroup_checkitem` VALUES (6, 35);
INSERT INTO `h_checkgroup_checkitem` VALUES (6, 36);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 38);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 39);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 40);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 41);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 42);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 43);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 44);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 45);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 46);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 47);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 48);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 49);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 50);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 51);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 52);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 53);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 54);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 55);
INSERT INTO `h_checkgroup_checkitem` VALUES (7, 56);
INSERT INTO `h_checkgroup_checkitem` VALUES (9, 72);
INSERT INTO `h_checkgroup_checkitem` VALUES (9, 73);
INSERT INTO `h_checkgroup_checkitem` VALUES (9, 74);
INSERT INTO `h_checkgroup_checkitem` VALUES (10, 75);
INSERT INTO `h_checkgroup_checkitem` VALUES (10, 76);
INSERT INTO `h_checkgroup_checkitem` VALUES (10, 77);
INSERT INTO `h_checkgroup_checkitem` VALUES (11, 78);
INSERT INTO `h_checkgroup_checkitem` VALUES (11, 79);
INSERT INTO `h_checkgroup_checkitem` VALUES (11, 80);
INSERT INTO `h_checkgroup_checkitem` VALUES (11, 81);
INSERT INTO `h_checkgroup_checkitem` VALUES (12, 82);
INSERT INTO `h_checkgroup_checkitem` VALUES (12, 83);
INSERT INTO `h_checkgroup_checkitem` VALUES (12, 84);
INSERT INTO `h_checkgroup_checkitem` VALUES (13, 85);
INSERT INTO `h_checkgroup_checkitem` VALUES (13, 86);
INSERT INTO `h_checkgroup_checkitem` VALUES (13, 87);
INSERT INTO `h_checkgroup_checkitem` VALUES (15, 90);
INSERT INTO `h_checkgroup_checkitem` VALUES (15, 91);
INSERT INTO `h_checkgroup_checkitem` VALUES (15, 92);
INSERT INTO `h_checkgroup_checkitem` VALUES (19, 94);

-- ----------------------------
-- Table structure for h_food
-- ----------------------------
DROP TABLE IF EXISTS `h_food`;
CREATE TABLE `h_food`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `foodname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kind` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_food
-- ----------------------------
INSERT INTO `h_food` VALUES (1, '苹果', '水果类', '个', '0-100');
INSERT INTO `h_food` VALUES (2, '香蕉', '水果类', '千克', '0-100');
INSERT INTO `h_food` VALUES (3, '葡萄', '水果类', '克', '0-100');
INSERT INTO `h_food` VALUES (16, '火龙果', '水果类', '千克', '0-100');
INSERT INTO `h_food` VALUES (17, '火龙果(进口)', '大豆类', '个', '0-100');

-- ----------------------------
-- Table structure for h_member
-- ----------------------------
DROP TABLE IF EXISTS `h_member`;
CREATE TABLE `h_member`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `fileNumber` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idCard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `regTime` date NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `healthmanager` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_member_user`(`healthmanager`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_member
-- ----------------------------
INSERT INTO `h_member` VALUES (123, '01-001', '谢振恒', '1', '412725200209290038', '18342986091', '2022-05-01', '098f6bcd4621d373cade4e832627b4f6', 'xzhmailbox@gmail.com', '2002-09-29', NULL, 'admin', 19);
INSERT INTO `h_member` VALUES (129, '01-002', 'test1', '1', '412725200209290038', '18342986092', '2022-05-31', NULL, NULL, '2000-01-31', NULL, 'health', NULL);
INSERT INTO `h_member` VALUES (130, '01-003', '王玉梅', '2', '412725197510050047', '13352225637', '2022-05-31', NULL, NULL, '1975-10-04', NULL, 'health', NULL);
INSERT INTO `h_member` VALUES (131, '01-004', '王乐', '2', '412725200209290039', '18525448339', '2022-05-31', NULL, NULL, '1993-06-23', NULL, 'health', NULL);
INSERT INTO `h_member` VALUES (132, '01-005', '张三', '1', '412725200209290099', '18342986099', '2022-05-31', '098f6bcd4621d373cade4e832627b4f6', '123456789@qq.com', '2020-03-01', NULL, 'health2', 2);
INSERT INTO `h_member` VALUES (133, '01-006', '王18', '2', '210522202205020202', '13100001001', '2022-05-31', '098f6bcd4621d373cade4e832627b4f6', 'test18', '2022-05-02', NULL, 'health3', 0);
INSERT INTO `h_member` VALUES (134, '01-007', '李18', '2', '123353636355635', '13100001002', '2022-05-31', '098f6bcd4621d373cade4e832627b4f6', NULL, '2003-05-01', NULL, 'health2', 19);
INSERT INTO `h_member` VALUES (135, '01-008', '王28', '2', '23215343512123', '13100001003', '2022-05-31', '098f6bcd4621d373cade4e832627b4f6', 'yt', '1993-10-01', NULL, 'health2', 28);

-- ----------------------------
-- Table structure for h_menu
-- ----------------------------
DROP TABLE IF EXISTS `h_menu`;
CREATE TABLE `h_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkUrl` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int NULL DEFAULT NULL,
  `icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentMenuId` int NULL DEFAULT NULL,
  `level` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_13`(`parentMenuId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_menu
-- ----------------------------
INSERT INTO `h_menu` VALUES (1, '会员管理', 'null.html', '2', 1, 'fa-users', '', NULL, 1);
INSERT INTO `h_menu` VALUES (2, '会员档案', 'member.html', '2-1', 1, NULL, NULL, 1, 2);
INSERT INTO `h_menu` VALUES (5, '预约管理', 'null.html', '3', 2, 'fa-tty', NULL, NULL, 1);
INSERT INTO `h_menu` VALUES (7, '预约设置', 'ordersetting.html', '3-1', 2, NULL, NULL, 5, 2);
INSERT INTO `h_menu` VALUES (8, '套餐管理', 'setmeal.html', '3-2', 3, NULL, NULL, 5, 2);
INSERT INTO `h_menu` VALUES (9, '检查组管理', 'checkgroup.html', '3-3', 4, NULL, NULL, 5, 2);
INSERT INTO `h_menu` VALUES (10, '检查项管理', 'checkitem.html', '3-4', 5, NULL, NULL, 5, 2);
INSERT INTO `h_menu` VALUES (13, '统计分析', 'null.html', '5', 4, 'fa-bar-chart', NULL, NULL, 1);
INSERT INTO `h_menu` VALUES (14, '会员数量', 'report_member.html', '5-1', 1, NULL, NULL, 13, 2);
INSERT INTO `h_menu` VALUES (15, '系统管理', 'null.html', '6', 5, 'fa-cogs', NULL, NULL, 1);
INSERT INTO `h_menu` VALUES (16, '菜单管理', 'menu.html', '6-2', 2, NULL, NULL, 15, 2);
INSERT INTO `h_menu` VALUES (17, '权限管理', 'permission.html', '6-1', 1, NULL, NULL, 15, 2);
INSERT INTO `h_menu` VALUES (18, '角色管理', 'role.html', '6-4', 4, NULL, NULL, 15, 2);
INSERT INTO `h_menu` VALUES (19, '用户管理', 'user.html', '6-3', 3, NULL, NULL, 15, 2);
INSERT INTO `h_menu` VALUES (20, '套餐占比', 'report_setmeal.html', '5-2', 2, NULL, NULL, 13, 2);
INSERT INTO `h_menu` VALUES (21, '运营数据', 'report_business.html', '5-3', 3, NULL, NULL, 13, 2);
INSERT INTO `h_menu` VALUES (29, '预约订单管理', 'order.html', '3-5', 1, NULL, NULL, 5, 2);
INSERT INTO `h_menu` VALUES (30, '健康干预信息管理', 'booking.html', '1-2', 2, NULL, NULL, 43, 2);
INSERT INTO `h_menu` VALUES (35, '日志管理', 'syslog.html', '6-5', 1, NULL, NULL, 15, 4);
INSERT INTO `h_menu` VALUES (36, '知识库', 'null.html', '8', 7, 'fa-book', NULL, NULL, 1);
INSERT INTO `h_menu` VALUES (37, '饮食库', 'food.html', '8-1', 1, NULL, NULL, 36, 2);
INSERT INTO `h_menu` VALUES (38, '运动库', 'sport.html', '8-2', 2, NULL, NULL, 36, 2);
INSERT INTO `h_menu` VALUES (39, '年龄分布统计', 'report_age.html', '5-4', 4, NULL, NULL, 13, 2);
INSERT INTO `h_menu` VALUES (43, '健康管理', 'null.html', '1', 3, 'fa-heartbeat', NULL, NULL, 1);
INSERT INTO `h_menu` VALUES (44, '体检报告管理', 'checkReport.html', '1-1', 1, NULL, NULL, 43, 2);

-- ----------------------------
-- Table structure for h_order
-- ----------------------------
DROP TABLE IF EXISTS `h_order`;
CREATE TABLE `h_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NULL DEFAULT NULL COMMENT '会员id',
  `order_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体检人name',
  `sex` int NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderDate` date NULL DEFAULT NULL COMMENT '约预日期',
  `orderType` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '约预类型 电话预约/微信预约',
  `orderStatus` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约状态（是否到诊）',
  `setmeal_id` int NULL DEFAULT NULL COMMENT '餐套id',
  `food` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sport` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `healthName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `suggestion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_id` int NULL DEFAULT NULL,
  `check_report` json NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key_member_id`(`member_id`) USING BTREE,
  INDEX `key_setmeal_id`(`setmeal_id`) USING BTREE,
  INDEX `key_address_id`(`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_order
-- ----------------------------
INSERT INTO `h_order` VALUES (107, 123, '123', 1, '18342986091', '12345', '2022-05-17', '微信预约', '已到诊', 14, '苹果', '背部拉伸', 'admin', 'test', NULL, '[{\"尿素\": \"正常\", \"尿酸\": \"正常\", \"肌酐\": \"正常\", \"checkGroupName\": \"肾功三项\"}, {\"总胆固醇\": \"正常\", \"甘油三酯\": \"正常\", \"checkGroupName\": \"血脂四项\", \"低密度脂蛋白胆固醇\": \"正常\", \"高密度脂蛋白胆固醇\": \"正常\"}, {\"checkGroupName\": \"心肌酶三项\", \"乳酸脱氢酶\": \"正常\", \"磷酸肌酸激酶\": \"正常\", \"磷酸肌酸激酶同工酶\": \"正常\"}, {\"甲状腺素\": \"正常\", \"checkGroupName\": \"甲功三项\", \"促甲状腺激素\": \"正常\", \"三碘甲状腺原氨酸\": \"正常\"}]');
INSERT INTO `h_order` VALUES (109, 123, '谢振恒', 1, '18342986091', '412725200209290038', '2022-05-25', '微信预约', '已到诊', 14, NULL, NULL, NULL, NULL, NULL, '[{\"尿素\": \"正常\", \"尿酸\": \"正常\", \"肌酐\": \"正常\", \"checkGroupName\": \"肾功三项\"}, {\"总胆固醇\": \"正常\", \"甘油三酯\": \"正常\", \"checkGroupName\": \"血脂四项\", \"低密度脂蛋白胆固醇\": \"正常\", \"高密度脂蛋白胆固醇\": \"正常\"}, {\"checkGroupName\": \"心肌酶三项\", \"乳酸脱氢酶\": \"正常\", \"磷酸肌酸激酶\": \"正常\", \"磷酸肌酸激酶同工酶\": \"正常\"}, {\"甲状腺素\": \"正常\", \"checkGroupName\": \"甲功三项\", \"促甲状腺激素\": \"正常\", \"三碘甲状腺原氨酸\": \"正常\"}]');
INSERT INTO `h_order` VALUES (110, 132, '张三', 1, '18342986099', '412725200209290099', '2022-06-01', '微信预约', '未到诊', 12, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `h_order` VALUES (111, 133, '王18', 2, '13100001001', '210522202205020202', '2022-05-17', '微信预约', '未到诊', 12, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `h_order` VALUES (112, 133, '王18', 2, '13100001001', '210522202205020202', '2022-05-25', '微信预约', '未到诊', 15, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `h_order` VALUES (113, 134, '王18', 2, '13100001002', '21052220220502', '2022-06-02', '微信预约', '未到诊', 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `h_order` VALUES (114, 135, '王28', 2, '13100001003', '23215343512123', '2022-06-02', '微信预约', '未到诊', 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `h_order` VALUES (115, 123, 'raku', 2, '13352225637', '412725200209290040', '2022-06-01', '微信预约', '未到诊', 13, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `h_order` VALUES (116, 123, 'raku2', 2, '13352225638', '412725200209290041', '2022-06-01', '微信预约', '未到诊', 13, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `h_order` VALUES (117, 123, 'raku', 2, '18342986080', '412725200209290030', '2022-06-01', '微信预约', '未到诊', 15, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `h_order` VALUES (118, 123, '谢振恒', 1, '18342986091', '412725200209290038', '2022-06-01', '微信预约', '已到诊', 18, '苹果,香蕉,葡萄,火龙果,火龙果(进口)', '背部拉伸,深蹲,跑步', 'admin', '健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议健康建议', NULL, '[{\"test\": \"正常\", \"checkGroupName\": \"test\"}]');
INSERT INTO `h_order` VALUES (119, 123, '谢振恒', 2, '18342986091', '412725200209290038', '2022-06-01', '微信预约', '未到诊', 12, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `h_order` VALUES (124, 123, '谢振恒', 1, '18342986091', '412725200209290038', '2022-06-04', '微信预约', '已到诊', 12, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for h_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `h_order_setting`;
CREATE TABLE `h_order_setting`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderDate` date NULL DEFAULT NULL COMMENT '约预日期',
  `number` int NULL DEFAULT NULL COMMENT '可预约人数',
  `reservations` int NULL DEFAULT NULL COMMENT '已预约人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_order_setting
-- ----------------------------
INSERT INTO `h_order_setting` VALUES (74, '2022-05-11', 30, 0);
INSERT INTO `h_order_setting` VALUES (75, '2022-06-02', 50, 6);
INSERT INTO `h_order_setting` VALUES (76, '2022-06-01', 50, 6);
INSERT INTO `h_order_setting` VALUES (77, '2022-05-07', 100, 0);
INSERT INTO `h_order_setting` VALUES (78, '2022-05-17', 100, 6);
INSERT INTO `h_order_setting` VALUES (79, '2022-05-20', 100, 0);
INSERT INTO `h_order_setting` VALUES (80, '2022-05-21', 100, 0);
INSERT INTO `h_order_setting` VALUES (81, '2022-05-22', 100, 0);
INSERT INTO `h_order_setting` VALUES (82, '2022-05-25', 100, 2);
INSERT INTO `h_order_setting` VALUES (83, '2022-05-26', 100, 0);
INSERT INTO `h_order_setting` VALUES (84, '2022-05-27', 100, 0);
INSERT INTO `h_order_setting` VALUES (85, '2022-05-28', 100, 0);
INSERT INTO `h_order_setting` VALUES (86, '2022-05-29', 100, 0);
INSERT INTO `h_order_setting` VALUES (87, '2022-06-03', 50, 0);
INSERT INTO `h_order_setting` VALUES (88, '2022-06-04', 10, 1);

-- ----------------------------
-- Table structure for h_people_class
-- ----------------------------
DROP TABLE IF EXISTS `h_people_class`;
CREATE TABLE `h_people_class`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_people_class
-- ----------------------------
INSERT INTO `h_people_class` VALUES (1, 95, '高血压');

-- ----------------------------
-- Table structure for h_permission
-- ----------------------------
DROP TABLE IF EXISTS `h_permission`;
CREATE TABLE `h_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keyword` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cretime` date NULL DEFAULT NULL,
  `station` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_permission
-- ----------------------------
INSERT INTO `h_permission` VALUES (1, '新增检查项', 'CHECKITEM_ADD', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (2, '删除检查项', 'CHECKITEM_DELETE', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (3, '编辑检查项', 'CHECKITEM_EDIT', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (4, '查询检查项', 'CHECKITEM_QUERY', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (5, '新增检查组', 'CHECKGROUP_ADD', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (6, '删除检查组', 'CHECKGROUP_DELETE', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (7, '编辑检查组', 'CHECKGROUP_EDIT', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (8, '查询检查组', 'CHECKGROUP_QUERY', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (9, '新增套餐', 'SETMEAL_ADD', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (10, '删除套餐', 'SETMEAL_DELETE', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (11, '编辑套餐', 'SETMEAL_EDIT', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (12, '查询套餐', 'SETMEAL_QUERY', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (13, '预约设置', 'ORDERSETTING', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (14, '查看统计报表', 'REPORT_VIEW', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (15, '新增菜单', 'MENU_ADD', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (16, '删除菜单', 'MENU_DELETE', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (17, '编辑菜单', 'MENU_EDIT', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (18, '查询菜单', 'MENU_QUERY', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (19, '新增角色', 'ROLE_ADD', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (20, '删除角色', 'ROLE_DELETE', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (21, '编辑角色', 'ROLE_EDIT', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (22, '查询角色', 'ROLE_QUERY', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (23, '新增用户', 'USER_ADD', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (24, '删除用户', 'USER_DELETE', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (25, '编辑用户', 'USER_EDIT', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (26, '查询用户', 'USER_QUERY', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (27, '初始化套餐', 'SETMEAL_INIT', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (28, '初始化套餐', 'SETMEAL_INIT', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (29, '预约模板下载', 'ORDER_DOWM', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (30, '预约模板上传', 'ORDER_UPLOAD', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (31, '查询会员', 'MEMBER_ADD', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (32, '编辑会员', 'MEMBER_EDIT', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (33, '删除会员', 'MEMBER_DELETE', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (34, '查询会员', 'MEMBER_QUERY', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (35, '会员模板下载', 'MEMBER_DOWN', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (36, '新增体检机构', 'ADDRESS_ADD', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (37, '查询体检机构', 'ADDRESS_QUERY', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (38, '修改体检机构', 'ADDRESS_EDIT', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (39, '删除体检机构', 'ADDRESS_DELETE', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (40, '饮食库模板下载', 'FOOD_DOWN', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (41, '饮食库模板上传', 'FOOD_UPLOAD', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (42, '查询食物', 'FOOD_QUERY', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (43, '新增食物', 'FOOD_ADD', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (44, '修改食物', 'FOOD_EDIT', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (45, '删除食物', 'FOOD_DELETE', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (46, '运动库模板下载', 'SPORT_DOWN', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (47, '运动库模板上传', 'SPORT_UPLOAD', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (48, '新增运动', 'SPORT_ADD', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (49, '修改运动', 'SPORT_EDIT', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (50, '删除运动', 'SPORT_DELETE', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (51, '查询运动', 'SPORT_QUERY', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (52, '新增权限', 'PERMISSION_ADD', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (53, '编辑权限', 'PERMISSION_EDIT', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (54, '删除权限', 'PERMISSION_DELETE', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (55, '查询权限', 'PERMISSION_QUERY', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (60, '查询预约', 'ORDER_QUERY', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (61, '添加预约', 'ORDER_ADD', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (62, '编辑预约', 'ORDER_EDIT', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (63, '删除预约', 'ORDER_DELETE', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (64, '电话预约', 'ORDER_BY_TELEPHONE', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (66, '查看健康干预', 'HEALTH_LOOK', NULL, NULL, '1');
INSERT INTO `h_permission` VALUES (67, '新增健康干预', 'HEALTH_ADD', NULL, NULL, '1');

-- ----------------------------
-- Table structure for h_role
-- ----------------------------
DROP TABLE IF EXISTS `h_role`;
CREATE TABLE `h_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keyword` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_role
-- ----------------------------
INSERT INTO `h_role` VALUES (1, '系统管理员', 'ROLE_ADMIN', '拥有系统全部权限');
INSERT INTO `h_role` VALUES (23, '健康管理师', 'HealthManager', '健康管理师');

-- ----------------------------
-- Table structure for h_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `h_role_menu`;
CREATE TABLE `h_role_menu`  (
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `FK_Reference_10`(`menu_id`) USING BTREE,
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`menu_id`) REFERENCES `h_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`role_id`) REFERENCES `h_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_role_menu
-- ----------------------------
INSERT INTO `h_role_menu` VALUES (1, 1);
INSERT INTO `h_role_menu` VALUES (1, 2);
INSERT INTO `h_role_menu` VALUES (1, 5);
INSERT INTO `h_role_menu` VALUES (1, 7);
INSERT INTO `h_role_menu` VALUES (1, 8);
INSERT INTO `h_role_menu` VALUES (1, 9);
INSERT INTO `h_role_menu` VALUES (1, 10);
INSERT INTO `h_role_menu` VALUES (1, 13);
INSERT INTO `h_role_menu` VALUES (1, 14);
INSERT INTO `h_role_menu` VALUES (1, 15);
INSERT INTO `h_role_menu` VALUES (1, 16);
INSERT INTO `h_role_menu` VALUES (1, 17);
INSERT INTO `h_role_menu` VALUES (1, 18);
INSERT INTO `h_role_menu` VALUES (1, 19);
INSERT INTO `h_role_menu` VALUES (1, 20);
INSERT INTO `h_role_menu` VALUES (1, 21);
INSERT INTO `h_role_menu` VALUES (1, 29);
INSERT INTO `h_role_menu` VALUES (1, 30);
INSERT INTO `h_role_menu` VALUES (23, 30);
INSERT INTO `h_role_menu` VALUES (1, 35);
INSERT INTO `h_role_menu` VALUES (1, 36);
INSERT INTO `h_role_menu` VALUES (1, 37);
INSERT INTO `h_role_menu` VALUES (1, 38);
INSERT INTO `h_role_menu` VALUES (1, 39);
INSERT INTO `h_role_menu` VALUES (1, 43);
INSERT INTO `h_role_menu` VALUES (23, 43);
INSERT INTO `h_role_menu` VALUES (1, 44);
INSERT INTO `h_role_menu` VALUES (23, 44);

-- ----------------------------
-- Table structure for h_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `h_role_permission`;
CREATE TABLE `h_role_permission`  (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `FK_Reference_12`(`permission_id`) USING BTREE,
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`role_id`) REFERENCES `h_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`permission_id`) REFERENCES `h_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_role_permission
-- ----------------------------
INSERT INTO `h_role_permission` VALUES (1, 1);
INSERT INTO `h_role_permission` VALUES (23, 1);
INSERT INTO `h_role_permission` VALUES (1, 2);
INSERT INTO `h_role_permission` VALUES (23, 2);
INSERT INTO `h_role_permission` VALUES (1, 3);
INSERT INTO `h_role_permission` VALUES (23, 3);
INSERT INTO `h_role_permission` VALUES (1, 4);
INSERT INTO `h_role_permission` VALUES (23, 4);
INSERT INTO `h_role_permission` VALUES (1, 5);
INSERT INTO `h_role_permission` VALUES (23, 5);
INSERT INTO `h_role_permission` VALUES (1, 6);
INSERT INTO `h_role_permission` VALUES (23, 6);
INSERT INTO `h_role_permission` VALUES (1, 7);
INSERT INTO `h_role_permission` VALUES (23, 7);
INSERT INTO `h_role_permission` VALUES (1, 8);
INSERT INTO `h_role_permission` VALUES (23, 8);
INSERT INTO `h_role_permission` VALUES (1, 9);
INSERT INTO `h_role_permission` VALUES (23, 9);
INSERT INTO `h_role_permission` VALUES (1, 10);
INSERT INTO `h_role_permission` VALUES (23, 10);
INSERT INTO `h_role_permission` VALUES (1, 11);
INSERT INTO `h_role_permission` VALUES (23, 11);
INSERT INTO `h_role_permission` VALUES (1, 12);
INSERT INTO `h_role_permission` VALUES (23, 12);
INSERT INTO `h_role_permission` VALUES (1, 13);
INSERT INTO `h_role_permission` VALUES (23, 13);
INSERT INTO `h_role_permission` VALUES (1, 14);
INSERT INTO `h_role_permission` VALUES (23, 14);
INSERT INTO `h_role_permission` VALUES (1, 15);
INSERT INTO `h_role_permission` VALUES (23, 15);
INSERT INTO `h_role_permission` VALUES (1, 16);
INSERT INTO `h_role_permission` VALUES (23, 16);
INSERT INTO `h_role_permission` VALUES (1, 17);
INSERT INTO `h_role_permission` VALUES (23, 17);
INSERT INTO `h_role_permission` VALUES (1, 18);
INSERT INTO `h_role_permission` VALUES (23, 18);
INSERT INTO `h_role_permission` VALUES (1, 19);
INSERT INTO `h_role_permission` VALUES (23, 19);
INSERT INTO `h_role_permission` VALUES (1, 20);
INSERT INTO `h_role_permission` VALUES (23, 20);
INSERT INTO `h_role_permission` VALUES (1, 21);
INSERT INTO `h_role_permission` VALUES (23, 21);
INSERT INTO `h_role_permission` VALUES (1, 22);
INSERT INTO `h_role_permission` VALUES (23, 22);
INSERT INTO `h_role_permission` VALUES (1, 23);
INSERT INTO `h_role_permission` VALUES (23, 23);
INSERT INTO `h_role_permission` VALUES (1, 24);
INSERT INTO `h_role_permission` VALUES (23, 24);
INSERT INTO `h_role_permission` VALUES (1, 25);
INSERT INTO `h_role_permission` VALUES (23, 25);
INSERT INTO `h_role_permission` VALUES (1, 26);
INSERT INTO `h_role_permission` VALUES (23, 26);
INSERT INTO `h_role_permission` VALUES (1, 27);
INSERT INTO `h_role_permission` VALUES (23, 27);
INSERT INTO `h_role_permission` VALUES (1, 28);
INSERT INTO `h_role_permission` VALUES (23, 28);
INSERT INTO `h_role_permission` VALUES (1, 29);
INSERT INTO `h_role_permission` VALUES (23, 29);
INSERT INTO `h_role_permission` VALUES (1, 30);
INSERT INTO `h_role_permission` VALUES (23, 30);
INSERT INTO `h_role_permission` VALUES (1, 31);
INSERT INTO `h_role_permission` VALUES (23, 31);
INSERT INTO `h_role_permission` VALUES (1, 32);
INSERT INTO `h_role_permission` VALUES (23, 32);
INSERT INTO `h_role_permission` VALUES (1, 33);
INSERT INTO `h_role_permission` VALUES (23, 33);
INSERT INTO `h_role_permission` VALUES (1, 34);
INSERT INTO `h_role_permission` VALUES (23, 34);
INSERT INTO `h_role_permission` VALUES (1, 35);
INSERT INTO `h_role_permission` VALUES (23, 35);
INSERT INTO `h_role_permission` VALUES (1, 36);
INSERT INTO `h_role_permission` VALUES (23, 36);
INSERT INTO `h_role_permission` VALUES (1, 37);
INSERT INTO `h_role_permission` VALUES (23, 37);
INSERT INTO `h_role_permission` VALUES (1, 38);
INSERT INTO `h_role_permission` VALUES (23, 38);
INSERT INTO `h_role_permission` VALUES (1, 39);
INSERT INTO `h_role_permission` VALUES (23, 39);
INSERT INTO `h_role_permission` VALUES (1, 40);
INSERT INTO `h_role_permission` VALUES (23, 40);
INSERT INTO `h_role_permission` VALUES (1, 41);
INSERT INTO `h_role_permission` VALUES (23, 41);
INSERT INTO `h_role_permission` VALUES (1, 42);
INSERT INTO `h_role_permission` VALUES (23, 42);
INSERT INTO `h_role_permission` VALUES (1, 43);
INSERT INTO `h_role_permission` VALUES (23, 43);
INSERT INTO `h_role_permission` VALUES (1, 44);
INSERT INTO `h_role_permission` VALUES (23, 44);
INSERT INTO `h_role_permission` VALUES (1, 45);
INSERT INTO `h_role_permission` VALUES (23, 45);
INSERT INTO `h_role_permission` VALUES (1, 46);
INSERT INTO `h_role_permission` VALUES (23, 46);
INSERT INTO `h_role_permission` VALUES (1, 47);
INSERT INTO `h_role_permission` VALUES (23, 47);
INSERT INTO `h_role_permission` VALUES (1, 48);
INSERT INTO `h_role_permission` VALUES (23, 48);
INSERT INTO `h_role_permission` VALUES (1, 49);
INSERT INTO `h_role_permission` VALUES (23, 49);
INSERT INTO `h_role_permission` VALUES (1, 50);
INSERT INTO `h_role_permission` VALUES (23, 50);
INSERT INTO `h_role_permission` VALUES (1, 51);
INSERT INTO `h_role_permission` VALUES (23, 51);
INSERT INTO `h_role_permission` VALUES (1, 52);
INSERT INTO `h_role_permission` VALUES (23, 52);
INSERT INTO `h_role_permission` VALUES (1, 53);
INSERT INTO `h_role_permission` VALUES (23, 53);
INSERT INTO `h_role_permission` VALUES (1, 54);
INSERT INTO `h_role_permission` VALUES (23, 54);
INSERT INTO `h_role_permission` VALUES (1, 55);
INSERT INTO `h_role_permission` VALUES (23, 55);
INSERT INTO `h_role_permission` VALUES (1, 60);
INSERT INTO `h_role_permission` VALUES (23, 60);
INSERT INTO `h_role_permission` VALUES (1, 61);
INSERT INTO `h_role_permission` VALUES (23, 61);
INSERT INTO `h_role_permission` VALUES (1, 62);
INSERT INTO `h_role_permission` VALUES (23, 62);
INSERT INTO `h_role_permission` VALUES (1, 63);
INSERT INTO `h_role_permission` VALUES (23, 63);
INSERT INTO `h_role_permission` VALUES (1, 64);
INSERT INTO `h_role_permission` VALUES (23, 64);
INSERT INTO `h_role_permission` VALUES (1, 66);
INSERT INTO `h_role_permission` VALUES (23, 66);
INSERT INTO `h_role_permission` VALUES (1, 67);
INSERT INTO `h_role_permission` VALUES (23, 67);

-- ----------------------------
-- Table structure for h_scheme
-- ----------------------------
DROP TABLE IF EXISTS `h_scheme`;
CREATE TABLE `h_scheme`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'd',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `people` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `statue` int NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_scheme
-- ----------------------------
INSERT INTO `h_scheme` VALUES (2, '高血脂干预方案', '高血脂', '中度肥胖', '吃低糖食物', 2, '注意饮食和运动');
INSERT INTO `h_scheme` VALUES (3, '高血糖干预方案', '高血糖', '中度肥胖', '吃低糖食物', 2, '注意饮食和运动');

-- ----------------------------
-- Table structure for h_scheme_food_sport
-- ----------------------------
DROP TABLE IF EXISTS `h_scheme_food_sport`;
CREATE TABLE `h_scheme_food_sport`  (
  `id` int NOT NULL DEFAULT 0,
  `food_id` int NOT NULL DEFAULT 0,
  `sport_id` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `food_id`, `sport_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_scheme_food_sport
-- ----------------------------
INSERT INTO `h_scheme_food_sport` VALUES (2, 1, 1);
INSERT INTO `h_scheme_food_sport` VALUES (2, 1, 2);

-- ----------------------------
-- Table structure for h_setmeal
-- ----------------------------
DROP TABLE IF EXISTS `h_setmeal`;
CREATE TABLE `h_setmeal`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `helpCode` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attention` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_setmeal
-- ----------------------------
INSERT INTO `h_setmeal` VALUES (12, '入职体检套餐', '0001', 'RZTJ', '0', '18-60', 98, '入职体检套餐', NULL, '30cb8c2f-9a4f-4835-9aa9-131d3a2fc2f43.jpg');
INSERT INTO `h_setmeal` VALUES (13, '女士普查套餐', '0002', 'FHZA', '2', '18-60', 998, '本套餐针对宫颈(TCT检查、HPV乳头瘤病毒筛查）、乳腺（彩超，癌抗125），甲状腺（彩超，甲功验血）以及胸片，血常规肝功等有全面检查，非常适合女性全面疾病筛查使用。', NULL, 'b4417ff7-ec65-4158-bf02-e3e2139bff161.jpg');
INSERT INTO `h_setmeal` VALUES (14, '中年通用套餐', '0003', 'YGBM', '0', '55-100', 1998, '本套餐主要针对常见肿瘤筛查，肝肾、颈动脉、脑血栓、颅内血流筛查，以及风湿、颈椎、骨密度检查', NULL, '11742f10-6ff3-45f3-bdb8-b319a14664db3.jpg');
INSERT INTO `h_setmeal` VALUES (15, '女士全面检查套餐', '0004', 'ZAGD', '2', '14-20', 2998, '本套餐是一款针对生化五项检查，心，肝，胆，胃，甲状腺，颈椎，肺功能，脑部检查（经颅多普勒）以及癌症筛查，适合大众人群体检的套餐', NULL, 'c4.png');
INSERT INTO `h_setmeal` VALUES (18, 'test', '0005', 'test', '1', '20~30', 30, 'test', 'test', 'af6fb9cf-0e05-4a55-8d12-fa71b55be568像.jpg');

-- ----------------------------
-- Table structure for h_setmeal_checkgroup
-- ----------------------------
DROP TABLE IF EXISTS `h_setmeal_checkgroup`;
CREATE TABLE `h_setmeal_checkgroup`  (
  `setmeal_id` int NOT NULL DEFAULT 0,
  `checkgroup_id` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`setmeal_id`, `checkgroup_id`) USING BTREE,
  INDEX `checkgroup_key`(`checkgroup_id`) USING BTREE,
  CONSTRAINT `checkgroup_key` FOREIGN KEY (`checkgroup_id`) REFERENCES `h_check_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `setmeal_key` FOREIGN KEY (`setmeal_id`) REFERENCES `h_setmeal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_setmeal_checkgroup
-- ----------------------------
INSERT INTO `h_setmeal_checkgroup` VALUES (12, 5);
INSERT INTO `h_setmeal_checkgroup` VALUES (12, 6);
INSERT INTO `h_setmeal_checkgroup` VALUES (12, 7);
INSERT INTO `h_setmeal_checkgroup` VALUES (12, 9);
INSERT INTO `h_setmeal_checkgroup` VALUES (12, 10);
INSERT INTO `h_setmeal_checkgroup` VALUES (14, 10);
INSERT INTO `h_setmeal_checkgroup` VALUES (15, 10);
INSERT INTO `h_setmeal_checkgroup` VALUES (12, 11);
INSERT INTO `h_setmeal_checkgroup` VALUES (14, 11);
INSERT INTO `h_setmeal_checkgroup` VALUES (15, 11);
INSERT INTO `h_setmeal_checkgroup` VALUES (14, 12);
INSERT INTO `h_setmeal_checkgroup` VALUES (14, 13);
INSERT INTO `h_setmeal_checkgroup` VALUES (15, 13);
INSERT INTO `h_setmeal_checkgroup` VALUES (13, 14);
INSERT INTO `h_setmeal_checkgroup` VALUES (15, 14);
INSERT INTO `h_setmeal_checkgroup` VALUES (13, 15);
INSERT INTO `h_setmeal_checkgroup` VALUES (18, 19);

-- ----------------------------
-- Table structure for h_sport
-- ----------------------------
DROP TABLE IF EXISTS `h_sport`;
CREATE TABLE `h_sport`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `helpCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sportname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sporttime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_sport
-- ----------------------------
INSERT INTO `h_sport` VALUES (1, 'YD3108', '背部拉伸', '3-5次/周', '30-60分钟/次');
INSERT INTO `h_sport` VALUES (3, 'YD3106', '深蹲', '3-5次', '30-60分钟/次');
INSERT INTO `h_sport` VALUES (4, 'YD3105', '跑步', '每天一次', '每次半个小时');

-- ----------------------------
-- Table structure for h_syslog
-- ----------------------------
DROP TABLE IF EXISTS `h_syslog`;
CREATE TABLE `h_syslog`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `consumerName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visitTime` date NULL DEFAULT NULL,
  `visit_timestr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `executionTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_syslog
-- ----------------------------
INSERT INTO `h_syslog` VALUES ('0044ad77-b4e7-4aca-91b9-7fad56ea886a', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('0094ca2c-77c9-4c8f-b778-68a843ed15ee', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('00966085-dd26-4f8b-a907-9cf41d9f0ea9', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '12', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('00f95c33-67f2-426d-8507-2fd1ed017ecf', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('01b760f6-b85d-47b4-8208-1480086286c1', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '15', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('021e786b-7c0f-48db-bf92-ed840a088711', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('027d1d48-57c1-49e5-8d81-f40cf42c1e28', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findFoodById', '5', '[类]com.xzh.view.controller.FoodController[方法]findFoodById');
INSERT INTO `h_syslog` VALUES ('02a74798-14bc-4798-a722-b5f46d3ad31f', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '118', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('02e4b17e-af05-418e-bd93-02fb7099e5c2', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '99', '[类]com.xzh.view.controller.RoleController[方法]edit');
INSERT INTO `h_syslog` VALUES ('030bd810-f1fe-4753-9186-5963da9efa48', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/edit', '34', '[类]com.xzh.view.controller.CheckGroupController[方法]edit');
INSERT INTO `h_syslog` VALUES ('030d2289-798a-4930-a1c9-03ee4a319a81', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '16', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('03443c3e-8489-4121-a10c-f9a326615957', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '410', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('03475e97-0a95-42c8-baac-ef6a8ae43b16', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '33', '[类]com.xzh.view.controller.UserController[方法]edit');
INSERT INTO `h_syslog` VALUES ('03518cfc-8248-414e-bc17-b8be3409e363', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '5', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('035b0c59-fe0e-4836-8767-8208e6cee1c0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '5', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('03dfc66f-fd05-4305-9755-a966f9d75d5e', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '86', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('04032625-844c-40c8-87f0-675f435ce0bf', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('0422a2bc-221a-4d8d-8374-5e1708ab1ce2', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '15', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('0425a66c-f5fa-40ae-b502-b5c7d6fb00af', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '5', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('044d6fdd-61e5-4c39-9641-0469beb63de1', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '35', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('0459d18f-0f81-47b4-b088-a48c87cc7a44', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '8', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('045d2dab-f3db-40f5-a83d-fca02246cf73', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('049fd733-8eb2-4444-91c5-cc392fe103ff', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '26', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('04b552ea-2808-441b-b372-f1a0dfc5380f', 'health', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('04c8f842-fad7-40a3-99d3-cd6aaecf64b3', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '8', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('050de6ac-d093-4a49-be88-9fddb501f6cf', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('050df29a-19dd-4701-ad4a-c2c5647f5829', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '5', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('0513149b-b303-4fd0-a16e-27ba764aea57', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '5', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('0538bf53-4402-41d9-b02d-3ce90d637aa7', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '4', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('0595edd4-69ee-454b-b2e0-e4efe560ef63', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('059dcfe6-8916-4d5c-bbb8-998e5746d806', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '12', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('05a42de1-4159-4b63-9946-b8910ee8544f', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '7', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('05b9f2aa-d83c-4a06-be38-fc6a86e7ff6e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '16', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('05cb1123-a0e1-4744-90a8-10131700fa2e', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '10', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('05d3d529-e99f-466f-8312-93375a052d83', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '4', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('05ff1aae-3278-4a3d-bb72-211580570c2f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '5', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('06116644-53ec-4cfe-aad0-9fb1d9158be0', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '5', '[类]com.xzh.view.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `h_syslog` VALUES ('06196279-bb76-4ee9-b825-c8e8403a6ac1', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '20', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('06382afd-0aa0-47ff-abe7-de58d521f833', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '3', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('06465a29-6af7-4715-94e1-69491bda89c0', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '17', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('06517d86-bdc9-419c-9e62-4f3778fe718a', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '5', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('0652be9b-1d28-40fe-8307-8e4a3cb1421c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '5', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('065ec6bf-aaca-4014-a40e-039acd6b6bf9', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '10', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('06665b37-edfe-449d-8e35-bd5ad5b7d85b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '4', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('0674e575-1eb7-40da-b59f-885eaebc3843', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/edit', '15', '[类]com.xzh.view.controller.SportController[方法]edit');
INSERT INTO `h_syslog` VALUES ('0696235d-ab11-4a1a-a6aa-28f5aaaef88c', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '8', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('06ce5116-ff9b-4e0b-b08a-94fbfeac9c3e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('06d011c7-3226-4a6d-a3ef-dcd98486a65b', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('06e18f5e-87b1-405b-adaf-58b7e619e223', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '407', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('0707a56c-b372-4a33-a8d2-8c316f054a14', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '4', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('07099b1c-2d02-44f0-9bca-b0f11a349ca7', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('0743e457-1fd0-4dd8-bdaa-9ec679743457', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '29', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('074408c9-e1f4-4046-bc3e-4bb9f0f157c1', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '17', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('077c3ecf-3b5d-4219-b8a1-ea3c099527da', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '11', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('0788fc58-9f4d-436a-a43f-5fc774958e7d', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '9', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('07b86764-e2dd-4b50-a271-d18abe240b49', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('07cac61b-fab2-418f-a4c6-34d7f69fb1af', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('07d03929-394e-45ad-bcec-2b8120878222', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '3', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('07d48e6b-efa7-4c82-ad81-869f880c3342', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/food/findAllFood', '6', '[类]com.xzh.view.controller.FoodController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('080595a7-da91-4703-bee3-c4ef14629bd2', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '20', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('081f79e2-5459-4d96-9a8d-43e167e2ba28', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('08283e78-1756-42a2-949a-34687e9e673a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '7', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('0851b67e-d62f-4932-9f77-d060c1b2f2e0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/add', '14', '[类]com.xzh.view.controller.AdviceController[方法]add');
INSERT INTO `h_syslog` VALUES ('085d8a89-6d49-4375-9639-b3ba9577598e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '14', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('085e14f7-4d70-4e13-9de8-172aaad42682', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '0', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('08688d72-df2e-41bd-86bf-4cfb25b909f6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '5', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('08785c99-f842-4096-b0b2-5ce007b9028b', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('088f775b-d58a-484f-9029-20ee8cc1f1c2', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '16', '[类]com.xzh.view.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `h_syslog` VALUES ('089bc1e2-2952-4107-a9a5-ae565cfeb23a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('08a82dcb-593c-4190-95c6-0810cbbf4642', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('08b2dfcd-59be-46a9-8055-3470ad0d364c', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '8', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('08d2bb27-a343-455a-9130-f02375a3fed3', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '6', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('08d66cac-1adf-43d5-b92d-0f3f1227547a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '47', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('08fcd7e9-2a88-4540-bb9e-457fb78af1ad', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '53', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('0902cadc-4782-46a7-a297-5cf88ddab24f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('09444305-fa4f-460b-a3be-c0f3f07dbbd3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '3', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('0993ceaf-085d-4fff-acd8-83919d92e798', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '9', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('09959e4a-7d49-4fc5-b1e0-f83651315933', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '14', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('09a10f81-9d6e-4d46-ac24-999fc0d3def6', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '11', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('09c5d520-b97f-47e7-ab81-c0a8d39b8987', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('09ca7ea3-5d31-46c5-a8c4-e3be3581a24d', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '13', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('09e8c2bd-d3ea-4126-8a96-ae6168ff918b', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '13', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('09eb74f0-925a-4452-9b5c-b39c8dd76830', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('09f8ee43-082d-4e07-b144-feee9f38cf50', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('09fdd9bd-a70f-4445-a13a-b447282d39f6', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '26', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('0a0fa0c9-94db-4cd8-9ca2-260cc5e4d0bf', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '5', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('0a154d00-3dfb-4ae6-94ad-98f0921c9bb9', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '5', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('0a215cfe-866a-4d9c-95a3-c80582b0ddd3', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '8', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('0a252873-8730-456d-a31b-4193bec38b04', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '7', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('0a47a630-1307-43a3-82b5-07205528e35f', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('0a95df19-6480-4115-af2a-792baa436403', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '16', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('0ac206ff-e819-4db5-a1aa-210a0c03e172', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '19', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('0ac22ccd-5c32-42fc-9e6c-7947142d2974', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('0ac46894-1f0e-4f4f-a563-d8106440cdf1', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '13', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('0ac71237-a741-4984-b5e0-16e794697fd4', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '4', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('0aed2e4a-f24a-47bb-9cf3-34f3c344cde8', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '66', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('0afdd1b4-5eb4-438a-8101-4e884504d1f3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('0b184a70-1d8b-4e4a-afba-77ec8ea09766', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '64', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('0b299e72-7171-4c76-b418-e48388de2f4e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '6', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('0b39a4e2-457d-454d-a644-3cc514ec48dd', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '7', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('0b4c465a-084b-4cf0-ae80-9cf188396e27', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '12', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('0b4d43a8-7371-4f01-8e04-9ba7b0244a63', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('0b54583e-f4ba-464b-b645-0531b1ed667b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/add', '20', '[类]com.xzh.view.controller.PermissionController[方法]add');
INSERT INTO `h_syslog` VALUES ('0b5a2d96-0b94-4351-b74f-6faa5e75e81e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/edit', '16', '[类]com.xzh.view.controller.OrderController[方法]edit');
INSERT INTO `h_syslog` VALUES ('0bb144aa-f57d-4479-a47b-d1dd1e8861ca', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '564', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('0bbd07dc-4aa7-4f9e-b0d2-9802c4b52a1c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '3', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('0bc1cb09-1bb5-4d32-b5bd-afa8df6db0ab', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '3', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('0bcae574-d26d-4ee2-95d3-cb3f56e1d4df', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '148', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('0bd88cb8-4c85-41a7-966e-07f8386b6895', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('0be9f771-1e1e-4efe-af6f-ec35f8e66ac8', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '19', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('0ca63a5d-4834-4f92-a61f-337d47574908', 'admin', 'pighome', '2022-05-25', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('0cad04d4-0bae-43c4-af68-c21d92c21601', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '301', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('0cc3e9d1-0c34-4165-b662-6269a3904aec', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '34', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('0cd037cd-f2e7-46b6-bb29-7b9e85347962', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '18', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('0cd322f6-a455-4991-9a10-fc80a421ccf3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '4', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('0d28e123-6e38-41e1-bd57-276f5e0e7f14', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '9', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('0d611417-fef5-49a4-8d7e-2684ec09a5a5', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '10', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('0d73fe70-702c-4487-856f-a64840e53b64', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '19', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('0d96ff82-db84-4540-9b10-9862209d3752', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/role/add', '91', '[类]com.xzh.view.controller.RoleController[方法]add');
INSERT INTO `h_syslog` VALUES ('0da0edbf-e122-437a-8f68-340cc06ce8f0', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('0dd04e9f-03c1-4d9b-a0fb-6057cadc0492', 'admin', 'pighome', '2022-05-25', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '331', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('0df68fc2-5d9d-4651-831e-6d31ef8ef249', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllFood', '9', '[类]com.xzh.view.controller.SportController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('0df7dadc-1448-436d-8c9f-e16a1e3ca1ca', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '47', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('0dfc7f6a-e29c-4e67-9e15-c9fe177c0862', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '10', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('0e1b8bb9-0d60-410b-9670-daffa0a42430', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '7', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('0e1cafde-b4d4-43a8-a38b-44e7006ec87b', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '29', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('0e28404f-340d-43a5-b88f-de8be4a1ed16', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/edit', '10', '[类]com.xzh.view.controller.SportController[方法]edit');
INSERT INTO `h_syslog` VALUES ('0e2c8475-b9d2-4ba0-a532-8013341d48c1', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '4', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('0e392666-1ff9-4a01-b23d-c6fd47d2f462', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '15', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('0e394a32-f106-40a6-8e5f-8b6b590c7ce0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '5', '[类]com.xzh.view.controller.RoleController[方法]findAllMenus');
INSERT INTO `h_syslog` VALUES ('0e4ad6ff-2467-4a0c-bc16-e9bd592df8ab', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '321', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('0e5f1c08-3737-49db-a744-959a872158fa', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '35', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('0eecd921-c0cb-460f-9004-4cb052dbbd8b', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '22', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('0ef048dc-66aa-41f2-9829-5ed2707c6690', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '15', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('0f19777f-7383-4e8d-910d-e753bf9bf0a3', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '24', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('0f46ede2-6432-4442-abf1-1dbeca220203', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('0f70fe67-eacc-4c83-adce-c27b5c8a34d6', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '12', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('0f88b763-3a17-401c-b74a-25058b1ef3e7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '5', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('0fd1370c-1be0-41ff-a67a-639c5123612b', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '10', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('0fe93c7e-82cc-4609-be28-71e07bbe381b', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('101c91f1-ff63-482f-9b8b-b6e6420eb379', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/sport/findSportById', '7', '[类]com.xzh.view.controller.SportController[方法]findSportById');
INSERT INTO `h_syslog` VALUES ('10360c31-6b0f-41c7-a4fc-2a581f46cbaa', 'health', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '40', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('103a0b0f-b5bf-4e98-82fb-abed094fc1af', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '6', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('1049c091-1189-4367-aad3-f1382d3eee18', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '9', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('1058d92e-13a7-412b-be4f-77411aee65a5', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '326', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('105b0f45-d0ca-4eaf-8bf1-d28fe2fdb1a1', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '8', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('107dad83-0686-4802-9dc4-c1929d694733', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/edit', '47', '[类]com.xzh.view.controller.SetmealController[方法]edit');
INSERT INTO `h_syslog` VALUES ('10a61449-bf7f-485e-9cae-88d7d6f40550', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '19', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('10b5cc79-09d4-4c5f-80ac-d44317404b6e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '', '14', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('10eebdc9-bbe1-49c4-b44b-577c83dcb187', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '26', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('11121bae-d102-46d1-b89d-6c1d05931856', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '7', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('1124617b-1429-4824-aac2-98997aa2175a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '405', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('112ae815-8da1-48e1-bbd0-418bc3579900', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '36', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('11385840-3b4f-4c17-af7a-007ef588bd05', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '9', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('11492daa-8ecb-4fd8-9a8a-5d71ae0b176a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '25', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('1154bcbb-14ba-4f9f-80a1-3ed4d67efb91', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '10', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('11610a27-f2d5-4c44-bb53-107345f94f7c', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('116449fb-8feb-4338-9144-b9bd50f3cd2e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/delete', '13', '[类]com.xzh.view.controller.SetmealController[方法]delete');
INSERT INTO `h_syslog` VALUES ('11661ba7-88bc-4a96-a305-fff4b24edcb8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/addMember', '14', '[类]com.xzh.view.controller.MemberController[方法]addMember');
INSERT INTO `h_syslog` VALUES ('11809925-0802-4e4a-959e-6384815aa478', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '13', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('119a137f-e663-4dc9-b194-86150382cbaa', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '43', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('119c31a9-b68e-480e-b65b-f25941018d41', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '0', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('11bc771d-0455-4836-a104-cbda05fe05fa', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '10', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('11cc4eb2-5b56-4db7-b7da-c8f8cf648751', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '11', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('11d35c3c-7c88-47a1-a5a9-f4ebb143d261', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '15', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('11eaeb9a-295e-4b61-a12a-b692560f4207', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllFood', '5', '[类]com.xzh.view.controller.SportController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('11ec4831-7231-474b-bad2-b6b5cd8b943c', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('120d04c9-66e8-4b8c-8ec2-a19ba54a06a9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('120e2da6-509e-4a21-ae03-ad4d31892c15', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '6', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('122eef92-f94b-4413-a22d-13dc20508f18', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '4', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('128b293c-bd3c-4fee-b1f5-429973296f3b', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '36', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('12d039e6-f954-48e1-96cb-a7b49944fa88', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('12e6db73-391c-45f3-bc36-08bf64692ff6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '5', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('130662e3-9fd5-4c43-a943-7a12fee25e14', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '7', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('133c5dab-3cb1-41f2-b367-8c7353d42d0a', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '13', '[类]com.xzh.view.controller.MenuController[方法]add');
INSERT INTO `h_syslog` VALUES ('137e7589-8c09-43ec-a6dc-310c72fa4edd', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '7', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('13848911-58a3-4300-8bc7-63df04ff8b45', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '7', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('139b91e1-7677-4008-b3a3-2aa41203843c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('13aa5b67-74c6-4bdb-a829-265b90be5d77', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '21', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('13fcb338-3ab1-4829-b2ae-b450382a8af6', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findFoodById', '6', '[类]com.xzh.view.controller.FoodController[方法]findFoodById');
INSERT INTO `h_syslog` VALUES ('1403142e-ccb9-47e7-8eeb-32d6d3a92862', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('142f7848-8701-46d7-94a5-437fcb87d9e5', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '4', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('14341369-1ea0-4575-bfc5-fd5be3635966', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '16', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('144f0853-07fc-4e6b-9a1e-ad0e6cb67861', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '13', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('1454f066-7791-4be7-8db6-50461c19a273', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '415', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('14589911-2ce5-4dae-88d6-7181e4726752', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '10', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('146bda36-4ae2-4624-a8f0-0247071cf198', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '67', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('14ace15b-8e28-4f9a-9895-5a3e8190565c', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '409', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('14b58b16-c1d1-4717-b717-aa6fcaa32490', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('14b65773-9819-4e20-9f33-575dc2733c90', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmealupload', '1319', '[类]com.xzh.view.controller.SetmealController[方法]upload');
INSERT INTO `h_syslog` VALUES ('14e936a2-6961-488c-8403-128774f8ead3', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '', '18', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('15024923-acd5-439f-a8f3-c630dc9ef0de', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '188', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('150e133b-d5d5-46f2-9e60-c99577b18813', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '6', '[类]com.xzh.view.controller.RoleController[方法]findAllMenus');
INSERT INTO `h_syslog` VALUES ('151cbd1a-7de2-4ef6-a74a-44569e98970c', 'health', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '26', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('15306efe-bdf8-441a-b6f9-386fd65ddd9c', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('15504792-e99f-461a-9dfa-69275ec5fca6', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '4', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('1552f8de-6704-4610-9603-cb422bdb3e23', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '44', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('156cd7f8-41cf-4050-bb15-45f68b7900c2', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '10', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('15829d74-d89c-4754-b907-5153b3dfd0c2', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '5', '[类]com.xzh.view.controller.MemberController[方法]findHealthManager');
INSERT INTO `h_syslog` VALUES ('15a1bc69-771c-4d0d-b04e-5512dd2b6c24', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('15a3ce4f-621e-44b5-b151-bad3e1d82bbe', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '10', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('15a9e403-3688-4bea-b345-102d0badc9ea', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '8', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('15aff7a6-9ef6-48fc-8302-dc3bc3461c00', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '', '10', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('15cf22fb-f5e9-4b65-ad27-37edba4b2942', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '7', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('15d6e699-b186-47d4-a0d5-8d4da7c82787', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '4', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('162a7419-4a10-483c-9da3-6e1f82b70f49', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '', '10', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('1631a1a6-72b0-40e9-83e8-b3f28f195d80', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '98', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('1638652e-2b25-490a-bf6a-dd4131519f71', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '24', '[类]com.xzh.view.controller.UserController[方法]quit');
INSERT INTO `h_syslog` VALUES ('16444479-9d20-424a-850b-b5c1f95ce552', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '365', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('165ff4f4-dfd3-4bb3-aeff-96d5a5e59f17', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '1', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('1662a9cf-81e4-462c-b2fd-b76d6a55db2a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '4', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('16740a23-11f1-4c59-81f3-a09a3e1ebd4a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '18', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('169edb28-18ca-4227-8c5b-e05e8c244695', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '13', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('16a25499-618c-47c6-a15b-5a6a00e1c84c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('16b392ab-2576-4577-9732-1299ec8177ce', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('16bc3df5-48b3-476c-9c3e-ad5b0637dbcd', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '7', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('16be35da-7a0e-4b5a-ad63-3d5d276e224e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '4', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('171ef9f4-7189-405e-80fe-5bca6331c250', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '5', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('172239df-285d-4cb3-bba3-dafabae42174', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/delete', '9', '[类]com.xzh.view.controller.SportController[方法]delete');
INSERT INTO `h_syslog` VALUES ('172f104e-b359-476e-bc3f-90c5ad9d3857', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '29', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('1739b765-2302-4575-9959-56d62d4f29c8', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/edit', '44', '[类]com.xzh.view.controller.SetmealController[方法]edit');
INSERT INTO `h_syslog` VALUES ('173cdabf-40c7-4fd3-a1ac-a3c792531f0e', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '7', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('1748c12b-d156-4e33-be4a-4443aec41228', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '4', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('1756ad65-6dc1-4d2c-928b-0d1172d47b7e', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '30', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('17618d89-1ba9-4e51-bc2e-b7b69f27fe17', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '15', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('17673e93-ee98-43bd-8445-d32a0a542198', 'health', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('1768909c-dcc9-4196-bfd3-e70664a02cd6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('177e3a14-86b7-47fa-8631-a8db208c2d2a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('17867b9b-b21d-459f-a472-4267b062cb50', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '17', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('17c1d4a2-8f2c-41da-9cbf-167489e2cace', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '9', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('17cb4db9-7c8c-43f8-a190-4333b3015cad', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '8', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('181fde05-767b-434a-92aa-ee8f871d7e6e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('1820b8dd-a3e9-48bc-8677-94760d6ff2f0', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '7', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('18c96ec6-9212-4212-8636-cdd143bece82', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '303', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('18ebd0cb-e3e1-4161-b032-05d8d3656609', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('18f2dcf6-c7b1-4a4a-810e-d721f8198bc8', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('19041a0b-4f66-44fc-bb6d-2b442b190aeb', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('191931a2-577d-4a84-8e9a-9b27b431773f', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '35', '[类]com.xzh.view.controller.UserController[方法]quit');
INSERT INTO `h_syslog` VALUES ('191a7723-5920-443a-87b0-d997fe504ab9', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/editMember', '13', '[类]com.xzh.view.controller.MemberController[方法]editMember');
INSERT INTO `h_syslog` VALUES ('1923667d-9167-432b-b1df-d8bb93e14a7a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('197a22f9-9391-4526-b7fa-7a3b692d82cd', 'admin', 'pighome', '2022-05-25', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '346', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('19882665-b605-4424-a4cb-9764789f212d', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '307', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('198cfc22-4585-4385-9b2e-541029a142c3', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('19ea681e-970a-4ca6-87ef-737de9cfc8e9', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '30', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('19eddd03-7300-405d-a3ff-a129bf882b9e', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('19fc24a4-6d89-44c9-803e-677a4daa2814', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '4', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('1a07e714-5b9a-416c-87d4-73f2c5932111', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '12', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('1a207bfb-b2a6-4d00-bb5c-801f1cf8930f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('1a32dfba-ea82-4625-a89f-d27ae9757f74', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/editOrderSettingByDate', '17', '[类]com.xzh.view.controller.OrderSettingController[方法]editOrderSettingByDate');
INSERT INTO `h_syslog` VALUES ('1a36863c-fea9-4a2f-bc6d-64a24c4ccf51', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/food/findAllFood', '9', '[类]com.xzh.view.controller.FoodController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('1a5b75de-a294-4919-bb68-322abcbd6d0d', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '15', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('1a7000d9-d105-4a69-a8ad-e7145939a7f2', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('1a8bddb9-4741-4431-8a7d-3dda87f51038', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '5', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('1ac21a1f-3cf6-458a-8f42-758fd1d756b9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '14', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('1ae04ed7-2fe2-4652-a8c1-0e20f9017df1', 'admin', 'pighome', '2022-05-25', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '335', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('1b2b744f-355f-468f-918e-e324a25e3825', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('1b309066-a83b-44a6-ba83-f949f2d87546', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '7', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('1b33c356-801b-4bd7-a90e-48e28af957ac', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('1b608614-ef6c-4397-a917-42b7968887d2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '14', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('1b617887-b4da-46bc-90aa-d23fb0fe9a85', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '8', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('1b6ccb97-755d-49fd-8eda-01088a68e107', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '12', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('1b6f8275-9dd8-4689-91d2-ee62ac07d28b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('1bac97eb-594a-493a-a952-0b0673b3f940', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '65', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('1bbff8b6-ab12-4e2b-b10f-019467390b95', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '14', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('1bc6e082-9220-4fae-bb3a-50d2c7d76c9a', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/menu/findRoleBymid', '7', '[类]com.xzh.view.controller.MenuController[方法]findRoleByRid');
INSERT INTO `h_syslog` VALUES ('1bfadf3d-1fb5-4cea-827a-d0c5eb4edf8b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '4', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('1c0e1166-5f6a-498d-b4fe-88a14d85e665', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '28', '[类]com.xzh.view.controller.AddressController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('1c15daf3-6330-4fb6-87fd-174e39060104', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '14', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('1c1e8f95-461a-4e22-b5fe-ee86e62b4247', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '7', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('1c4b8105-86e9-43c0-9e99-e9a52ee34830', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '7', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('1c7108aa-148a-4b75-b563-307579273a43', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '300', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('1c83ff78-858a-4e20-abf4-1d2dfefcdc3d', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '7', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('1cd4a964-8722-404b-bb14-6dc5819ee3c8', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('1cea6e2a-8300-441a-ac71-42aebfa4c8f1', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('1d1c7540-2d6d-4ca9-affa-f3838da74175', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('1d47fec8-5a11-42a3-a5e6-01753e888125', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '7', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('1d5780f0-4d37-4993-bcc4-41f8cf934900', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '124', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('1d5d367b-ad6f-4dec-9c54-2810d4123c24', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/changePassword', '102', '[类]com.xzh.view.controller.UserController[方法]changePassword');
INSERT INTO `h_syslog` VALUES ('1d66f250-0dba-469f-9cee-6ceabfb16243', 'admin', 'pighome', '2022-05-25', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '34', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('1d811914-e2a6-473a-b1ef-9d45759c4ce8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '14', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('1db9ff6a-b652-43e0-86ac-b35c54004c96', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('1dcb9d73-fdfd-4c62-92a5-cc5b6673313b', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '9', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('1ddc6135-6f1e-46dd-85bb-62f0632048d5', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '8', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('1ddcb347-8fc1-4272-89c5-9d026940cdd5', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '27', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('1dece736-9c35-4958-96dd-061e20ecb083', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '9', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('1e09d8bb-2146-4fe6-bdab-970a1e79cbcd', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '13', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('1e0e0179-dce2-493e-bdad-3e25b8238b91', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('1e4b5666-42b2-4194-9c2e-20cb5c35c820', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('1e57d120-d98a-474c-98df-34207f8fb604', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '6', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('1e6635c1-a0e2-42f8-9163-f1785d6f7e3c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '19', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('1e6bf9bd-c885-4b88-9ac6-b4e93d2547da', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '5', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('1ea994fe-c459-4437-ad17-ddd64ffd6cdb', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '6', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('1ef61ee8-cdd6-404e-8f90-61258330e612', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '4', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('1f10fcb2-5792-486f-8e74-852b8cb30e73', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '6', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('1f160f76-c8bf-4a96-82ee-49672dbaf47a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '7', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('1f19c48b-0768-46e3-b57a-1fcb94caa306', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '24', '[类]com.xzh.view.controller.UserController[方法]quit');
INSERT INTO `h_syslog` VALUES ('1f279536-a779-4130-a6a7-a47726bfe776', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '7', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('1f2b9698-4b58-46d4-9c60-765d82989ff3', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '8', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('1f64f92f-68db-4c58-ba34-641e0a7763b5', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('1f66c120-33d1-4703-8bee-a5e2e2d716cb', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/delete', '20', '[类]com.xzh.view.controller.SetmealController[方法]delete');
INSERT INTO `h_syslog` VALUES ('1f7d7dfb-8ac7-4311-a6c4-d61db48732ea', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '70', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('1fc191b2-2b46-43db-9bed-739299e733fa', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '4', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('1ff77170-2c40-41fa-9961-9ccebbb9b5bf', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '8', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('202bfe0b-bd16-49e0-bc51-0fb5612a02f8', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckByStMealId/{setmealId}', '29', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckByStMealId');
INSERT INTO `h_syslog` VALUES ('203b3cdd-ed09-4164-a4fe-e3cdeffe6015', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('203bb8cf-ca6b-40a0-a3da-e374328fdeb4', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '6', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('204067f3-6dcb-46e1-96dd-75cb86d88cc0', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '3', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('20589e77-463f-4600-af1f-71da86e442dd', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('207b2139-f4ce-42fa-8613-2e45b058708b', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '19', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('20b47a9f-3f1c-40ff-9c44-ec0b00780626', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '11', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('20cacd89-6b05-4cb1-9669-2a61a1a0afa0', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '32', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('20d1cf57-48f8-4af6-963b-49749d48d886', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/edit', '43', '[类]com.xzh.view.controller.OrderController[方法]edit');
INSERT INTO `h_syslog` VALUES ('21187097-31ad-44b3-9fbb-75c6195d47d3', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '30', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('2123a3ce-5500-4f94-a7a0-34ee9261de63', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '4', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('21246cee-88ab-4f98-b137-b62f717e40ff', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '162', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('215c0384-6326-473b-bfc2-572e4191970c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('21632cd3-d5fe-48f1-92b0-7600656e4b00', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '6', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('218009ba-071e-4232-8ed3-ee92434cc2e5', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '4', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('21a0c784-ecf7-497e-b309-93723073a8e7', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '440', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('21adbd4f-32fe-4216-bce6-a8664f80271b', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('21c56fa4-54f7-4ee5-8b8c-597852c05f06', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('21eddfa9-8e4c-486e-bef4-5c777d59dbb4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '17', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('2226b8e0-b45b-4bd2-a95f-fad19a39f06f', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '23', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('2231734b-3073-4b91-bf64-0a42c724063b', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '7', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('224212dc-7d11-4456-8fe7-3bb00c66b743', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '17', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('22497e10-82b4-45d5-b1f7-4c8ee95dd49d', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '12', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('225d8a2a-1e30-404c-b0fe-866e8f3aba31', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '4', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('22812165-102e-46e6-9708-5105316fec83', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '7', '[类]com.xzh.view.controller.MenuController[方法]add');
INSERT INTO `h_syslog` VALUES ('22b08de1-64d4-478d-afc8-dc21b7cebeca', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '15', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('22cfbd9c-9dbe-4357-8761-398ee6bfc68f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('22d45913-252a-4ac6-9f6a-50fbb3d489b3', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '8', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('22d801b7-8c04-4b89-b1fc-5ffb3f575da4', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '21', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('22f40340-8b09-4db4-89d4-89f992c5fc14', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('2323f3dd-574c-4d1d-852f-e9945b29edbd', 'health3', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('235309e8-018b-456e-8233-f064b88f97c9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '12', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('235f5099-050e-4d9c-8dc3-a2d8d2636a73', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '4', '[类]com.xzh.view.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `h_syslog` VALUES ('236de861-da79-4a05-aa51-e5e4f2c2885c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('238b09c3-7120-4139-97ba-3f2ddf504430', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '5', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('238c3221-8ac2-49e2-ba57-3862fcfe86e3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '5', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('238f10e5-3614-43d0-943b-04ec84024c70', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('23f636ab-86be-41a0-8c3f-8f62b117e18d', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('2402046f-8694-4e0d-bfe1-066c1e8be9f7', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '17', '[类]com.xzh.view.controller.UserController[方法]quit');
INSERT INTO `h_syslog` VALUES ('2410e5de-cfe5-4e41-9fa2-80a034f7e664', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '14', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('245461ff-b026-4d14-ace4-abbdf5d402fa', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '14', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('246c681f-643f-413b-9979-c6cc41e09d02', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('2485e0cd-ed31-412e-b8f4-59bd42deb9fb', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('24bf180f-1260-457e-978f-89c85125cce9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '11', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('24c7633e-c0f5-43a4-a7f2-df17eeab7e25', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '399', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('24caacb9-584e-4c8c-be04-a6a53955ef90', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '18', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('24d5a94c-79a2-4fde-8cba-52267706143d', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('24d5e9a3-1789-4581-a1b9-022f9de19585', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('24dacd7b-ffb0-4d41-827c-27a6bf8f35ad', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '19', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('24dfafb9-3d64-49c8-805d-0eaa5b9d02cb', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '18', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('24e42d82-c476-4398-b7f8-c9df1e6434cf', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '29', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('250074ff-8ed3-47ee-8f6c-d673a7aaeff8', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findRoleBymid', '7', '[类]com.xzh.view.controller.MenuController[方法]findRoleByRid');
INSERT INTO `h_syslog` VALUES ('252b19d6-35ac-44ee-a6aa-287571590340', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/food/findAllSport', '7', '[类]com.xzh.view.controller.FoodController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('253bd429-fc8d-4db0-9af7-e1075b4c4797', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '5', '[类]com.xzh.view.controller.MemberController[方法]findHealthManager');
INSERT INTO `h_syslog` VALUES ('254e8632-e173-46ff-8863-ec670d60a142', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '17', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('254f700b-da62-4876-ad43-c83b2af24b8e', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '10', '[类]com.xzh.view.controller.CheckitemController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('255620e6-0c20-4229-8ca6-373fb2834dc8', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '8', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('2557e15e-a58c-4e94-a481-1c3ffa4bba9b', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '6', '[类]com.xzh.view.controller.MenuController[方法]add');
INSERT INTO `h_syslog` VALUES ('2558acf3-4bda-42bc-9a5f-cf208ac46c24', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('25810f0e-9126-402e-8f9f-7443081936da', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '6', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('25825743-08d6-4b5f-a167-2379aad3261a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('25838969-1e2a-43ab-8693-2e9fffb29f95', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '12', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('25a859d3-e8a0-41a2-ae81-b10d218ce23d', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '30', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('25e59fcc-62fe-4c5b-a882-4b1e7dd40e5d', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '10', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('261ad769-f839-4ee6-80dc-2d9c416466e0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '5', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('26392bcf-aa94-45dd-a9b9-334bddefcff6', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('267af537-8578-487e-a83a-ecd571a368d9', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '18', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('2694dcad-b13b-4242-9490-5216b466516a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('269e65ff-6f12-4282-b421-faf1cdf9a6a2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '0', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('26a84b73-fea0-4835-bebd-85a7f020315c', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '8', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('26ebe21f-a423-4f75-a188-bafe2e19a805', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '7', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('26f9aa9c-463f-4268-872a-92857a855564', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('26fa640f-d4ec-4b08-8a86-83432187a0ff', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('270facf6-5825-4092-bd60-8616ca67b27b', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('271b3ce5-e55a-46af-b661-234b7953e803', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '3', '[类]com.xzh.view.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `h_syslog` VALUES ('274d7230-3b16-4ea2-9f41-e13be6742cab', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('276b956d-5307-4978-a206-c477f23725be', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('277a4353-76ca-4a93-a3cd-4a59789c9ebc', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('278bede4-6750-432d-94ba-d55468e08359', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('27af8422-a153-4063-92a2-99d1660f6503', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('27d3ff99-48b2-4b68-8daf-bbde92820f8a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '107', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('27d540d5-4165-4cf3-998d-e32f211cfb65', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('27e742ed-7d6a-48f4-9fce-bd4c7613e089', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '19', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('2806ecfd-d320-4337-b252-64266187274f', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '25', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('28070805-d4bf-4f61-9edd-fb3b0a397b9d', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '4', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('280e0abc-5043-4c26-9413-55ab0be08e8d', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '83', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('283825bd-3ddd-4a35-9e5c-02ab9517e740', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '6', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('2839a63a-5eee-42c6-9602-475d280468b9', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '4', '[类]com.xzh.view.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `h_syslog` VALUES ('28590240-3f5a-4fd9-9e08-b654525a5d4a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('285ed301-1341-48c9-9827-b20d55091f89', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/edit', '56', '[类]com.xzh.view.controller.SetmealController[方法]edit');
INSERT INTO `h_syslog` VALUES ('28686aa3-57d8-4578-9bcf-b6fc9d13c841', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/deletemenu', '14', '[类]com.xzh.view.controller.MenuController[方法]deletemenu');
INSERT INTO `h_syslog` VALUES ('287f2849-f91a-412f-96e6-32b2f30402d6', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '7', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('28994264-c0e7-457b-9e37-0dc489ddda53', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '23', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('28a9261d-8614-476d-a221-b66d37e73e47', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('28bc6d7a-57db-443f-ab13-6130559b8081', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/editMember', '10', '[类]com.xzh.view.controller.MemberController[方法]editMember');
INSERT INTO `h_syslog` VALUES ('28dd8205-7650-481e-ba1b-89b198eb4338', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/edit', '10', '[类]com.xzh.view.controller.CheckGroupController[方法]edit');
INSERT INTO `h_syslog` VALUES ('28edb54f-ac16-4c41-bd1b-9902f7ab38b6', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('28f37165-8a43-4d9d-9ade-b714aafc7b38', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('2903d87f-772c-451e-a448-dccdf8737669', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '5', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('291ccc1a-cd5c-4ebc-9b20-bf0728e5a429', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '12', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('29202ac9-59cb-4a81-9d4d-ffc9c5952958', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '0', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('2934250c-a2eb-4403-bfd0-9667dfac491b', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/editMember', '11', '[类]com.xzh.view.controller.MemberController[方法]editMember');
INSERT INTO `h_syslog` VALUES ('293b195b-3155-4e24-8f7d-dc5ce96c2673', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '21', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('2984be63-9fd7-4f9b-b679-27109d15ba24', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '10', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('29b84253-acdd-45a8-91a2-e3d6f21ba419', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('29d7c4e9-b50c-48ce-81f0-114867a0eb44', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '10', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('29db8cd5-0ab9-4d7f-9ad2-baaff105abb8', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '8', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('2a093c8d-c5bb-44ea-8a64-ea191a6fb966', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/menu/deletemenu', '14', '[类]com.xzh.view.controller.MenuController[方法]deletemenu');
INSERT INTO `h_syslog` VALUES ('2a1523bc-dd27-4066-b79b-873490046fbf', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '7', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('2a165ccf-e86a-4b6f-bfb7-6423bf952d94', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '35', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('2a1b72f9-0004-4e3c-82c1-49f667fb5714', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '6', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('2a1e237e-1f51-4ab5-924f-63e260b126cc', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '84', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('2a375cfd-2508-4267-8f01-a5c96954a732', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '4', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('2a7528dd-db09-4df3-aae0-19cdfe549c4a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('2a781bdb-bc65-4fc9-bde7-c1e4ab22daa6', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '5', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('2a8c702b-3141-4987-ae22-2f3f9ed5daae', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '39', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('2aa398f2-4397-4e1a-9889-69bc072f67c1', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '7', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('2aa67184-d1d9-4ac2-a1dc-088d60c5ae94', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '20', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('2abc8808-3a34-46de-a395-79371ceaf235', 'admin', 'pighome', '2022-05-25', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('2ac4ad5c-8a23-4f55-b065-2e2db02136c8', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '9', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('2adfaaa6-62ed-4c01-bd73-9839956b9d1b', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '7', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('2b398be9-b0e3-43b7-8ae6-3bbd87d4f626', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '15', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('2b3e5793-4768-45ca-bc93-dcd41e9bf3d6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('2b5678ab-9c0b-4399-88c8-86e3becd92db', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '309', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('2b5739e4-368e-41d6-9f4a-035032f06d14', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('2b63a240-bd62-4a2b-b7ad-490b39729ca3', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '14', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('2b77044a-d669-4a83-be30-0a34f3e9d488', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('2b984669-1ef6-4da9-8c54-cb8485d0d10a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('2bea53b5-b69e-44bb-8b08-9665070de0fe', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '39', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('2bf2a74d-697e-4efb-a165-cc7645bc745e', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '7', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('2c0bdb94-72cd-44d5-8e2d-a6fe5ddf67b6', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '28', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('2c16f279-0373-405c-9771-2b53e65744aa', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '11', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('2c290f6c-5c56-40d7-b635-0eb65449c2a7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findCheckitemIdsByCheckgroupId', '2', '[类]com.xzh.view.controller.CheckGroupController[方法]findCheckitemIdsByCheckgroupId');
INSERT INTO `h_syslog` VALUES ('2c3e1785-3005-4cb1-9f1a-aa3e7ea7d74f', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '18', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('2c52e58b-9c99-4c12-ac63-0e4d26d8d9d8', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '4', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('2c7a0d07-e953-4b5b-b4a1-36094af89e89', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '12', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('2c9e5258-3a5b-4769-9317-9b7661941e43', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '13', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('2cd4bae7-48d8-413f-bb3c-160aa3e771e0', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '13', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('2ce7b3b3-bee7-4500-947a-270779899cf9', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '21', '[类]com.xzh.view.controller.UserController[方法]edit');
INSERT INTO `h_syslog` VALUES ('2d0c1be2-45e9-4a20-a975-ab92ce59fa77', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '10', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('2d2f1482-d5c6-4ed7-888b-c77e45a56895', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '78', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('2d357b08-2a3b-4855-9e4a-04eebdb55c50', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '16', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('2d7993d2-cae8-4e70-b9c5-6f2406d6e5da', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '48', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('2d86264b-2c99-416c-996a-e3c16fade6ed', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('2d9b9c50-5ff5-4033-9ba6-1fbf2165b4fc', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '398', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('2db7f644-8f54-4b1b-9b20-2c8b0f4a6d28', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('2db89cd7-0bf9-46fd-96e6-8f9728417747', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '33', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('2dc78b7c-3e01-4015-9f49-5673a313af45', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '31', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('2df21e97-9096-47b3-819c-385f163ed476', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '11', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('2df455b0-4c30-4c4d-bdd9-68bbf158c77b', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '7', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('2e04c0c2-e2f5-4d7f-b2d5-a7b287c7df26', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '28', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('2e4c23ee-f513-4db9-8fbd-80e3ed06c1c1', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '17', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('2e559a95-b723-4183-9c2b-6601951a92ad', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '5', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('2e5e8795-ce23-43a2-bbc9-963595f1f7e5', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '7', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('2e7e175c-140c-417f-9dea-8657930b111c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('2e835221-7efc-4281-b262-319dd51b5428', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '8', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('2e92eba2-5992-4a6f-834f-b4fff923a4da', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '42', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('2e9c00ca-b5b8-4979-a61f-bc99fe1a8015', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('2ea303d0-4a2c-4ba1-a55b-92a530f84f9f', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '22', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('2ebf12de-a490-478d-8f4e-f29984bd5010', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '15', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('2ed807a5-5730-486a-925e-f920fa56839e', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '3', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('2f017c50-5551-493b-913a-23f457c21bd3', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '30', '[类]com.xzh.view.controller.UserController[方法]quit');
INSERT INTO `h_syslog` VALUES ('2f055718-e5f2-4927-9540-06e37e4ef905', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '3', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('2f17d5aa-863c-43f1-b821-430d72e6eeb5', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '3', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('2f1a5b8a-879f-400a-a53e-099fab509dae', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '8', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('2f1aa1de-8449-49c4-bda7-b1dee1f07764', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '9', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('2fe0c60b-72b6-41c6-96ee-d54f2d5b8928', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('2fe2cd79-0236-40d4-ab8b-0933967ebfb6', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '37', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('300c2a56-7bb7-4db3-98a3-d728f8d74603', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '24', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('3021729e-3c5e-4b53-b966-c6737b829f02', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '14', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('30409642-5758-4f32-ade6-bcdef946dfc5', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '31', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('3059516a-6a2c-444c-8e29-7077e4177f44', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '10', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('307e4817-e687-4186-95bc-18c36226d194', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '7', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('30820798-2b82-4991-84d6-0b9b8c044f7b', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('30ca5187-7af2-4114-bcf4-f28604dd9746', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '7', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('30cc39fe-718e-484e-9ec5-865956ec6f66', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '5', '[类]com.xzh.view.controller.MemberController[方法]findHealthManager');
INSERT INTO `h_syslog` VALUES ('30f1121a-28bf-48ee-aa64-444b52627bf5', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('3100fe26-2267-42fe-9d9e-9f2119feb27f', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '14', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('310996fb-28f7-44dd-892d-92b550c9bf65', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('311cd374-ead2-4257-ab57-73c9c74dfa15', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '5', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('311f1a82-dcf0-4bd4-9e49-1902e2fe49bc', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '9', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('3140d5bb-09ca-4bbb-a809-8a5c8678d8ee', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '364', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('315b634a-b778-469e-9785-2101be19babb', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '100', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('315f914a-f933-4513-ab02-0d6db4ae6177', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/edit', '38', '[类]com.xzh.view.controller.OrderController[方法]edit');
INSERT INTO `h_syslog` VALUES ('317b216e-dbec-48a2-8d22-c83341d0682c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '310', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('317baee6-3163-4ff8-a9f8-7dc8d228c105', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '13', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('31b21691-926a-4139-b257-5abee4c1534b', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '13', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('32068e25-5230-4ac2-b56c-ded95a09fdfa', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '7', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('32081314-72a7-44e4-9634-62d49529f732', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '65', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('32119c0d-887f-4094-96c3-447db7ffa8e8', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '6', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('321bd5ac-73d7-4c2c-b3bb-5cb4bb9f5dfd', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '15', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('3230a278-894b-46b9-a39e-45fcdb9bd5e9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '10', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('323748aa-b42b-453e-9d72-39cebfbfbaf7', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '10', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('324d76a2-080f-4e55-b166-f71b10975906', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '16', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('324e4f0e-02c5-40d2-9d6f-2ae8f8c78653', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('3262009b-a9f4-4a8e-8004-3e712363a0ad', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '8', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('326f7602-f41e-4420-9507-0a7cf5d89b1e', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '11', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('326fe325-171e-4a6b-b404-b6e977329e30', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('32749f56-88a6-47de-97db-9e59c2e1be12', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findRoleBymid', '5', '[类]com.xzh.view.controller.MenuController[方法]findRoleByRid');
INSERT INTO `h_syslog` VALUES ('327dfb41-86e3-41d9-bb63-0eabe7b28f54', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/editOrderSettingByDate', '9', '[类]com.xzh.view.controller.OrderSettingController[方法]editOrderSettingByDate');
INSERT INTO `h_syslog` VALUES ('32898c7d-26e9-45f6-bd6b-15ef3371f553', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('328d3f2d-e3d7-4a4a-a36d-1b3ddf72e975', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('328f35ca-556f-41d1-b62c-63bac9714a43', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '10', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('32badae6-10c3-4acb-97d7-9d64f1b115cf', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '49', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('32c52d2e-f700-4bf9-8424-12f93fa3e45c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '9', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('32c6192a-6a94-418a-943d-6c1ee4ba546b', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '18', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('32d6dc0e-8ad1-473a-a948-fd341753cda6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('32e2d9d5-37b8-49fe-b39f-1ca82f846785', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('32f1cdc2-735f-4924-b734-6d7d297bb165', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '4', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('32fbe600-b3ab-44a1-9297-02feedf460f8', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '8', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('32fc08ef-ffa4-4584-89ed-b2f6aea1a17b', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '8', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('3306d8cd-acbf-482e-8678-22f705b09ca7', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('330ebe34-46e3-4892-8750-91ebdd9c436c', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '10', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('33134b25-0bc1-423e-b74c-5a2a60d8273a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('331f7d3a-6a17-4e1a-8264-886151db8cc0', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '7', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('33282ab3-e2b9-4a21-845f-6b7b401ae9b0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('3335fbbe-004c-4eed-97c0-d78243a803f6', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('334946b7-375d-4fa1-b79a-6ddda27bd8e6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('334ce39c-abd1-44bf-a8d0-7ebf4cb79ad4', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '13', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('33681062-23b1-4bf6-acd1-295e2bc432c8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '309', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('3377903d-e8b1-4945-81ec-ca1503daf5d5', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '13', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('33790dd6-32e3-401e-b1d0-6cdbe8e1c293', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '3', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('337d484b-69f1-480f-b513-ca552a9300c6', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '6', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('33a1a9e0-fb7c-4da9-851c-60523f3faf59', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '8', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('33adb0f1-1a29-4abb-a753-fe9ecccb9bc1', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '8', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('33f1499b-01be-4b08-a6b2-90a4f407b43a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('3400d390-36e9-4102-b61c-4de4dc7dc4ce', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '4', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('340a65cd-5524-41c7-bf8f-0f3316d993f6', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '428', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('3429163e-c4c5-4d96-9f91-83d9b2a4782e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '7', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('344532d6-e173-4967-8a9f-dbee926954c1', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('344b2843-0037-48a9-a380-5cde8beee969', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '6', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('3454fbac-4dca-4d05-8a43-97aa82f271e5', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '9', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('345c886f-dc5f-4b09-978f-7937cfa16069', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '6', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('345e6772-2a11-4aae-b751-30cd1f2b91aa', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '54', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('347635f6-0090-4e81-9e08-ace25eb2cdac', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '40', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('34807b10-1447-4e96-a5c1-cbb8051b0249', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '377', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('34985799-b098-40d4-8ebb-2ff3afeeaef4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '16', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('34a8c487-2eeb-4151-a0fe-db5abd08d25a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '38', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('34b91e33-f284-44c8-9775-3b6389e794b0', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '32', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('34bddb25-3b28-474e-9e41-38efb6195dd5', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '9', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('34c451b3-e092-43a8-b9b7-f62a7e03ad19', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '12', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('34c7123b-1fb6-49ff-a52f-631c449659ff', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/editOrderSettingByDate', '10', '[类]com.xzh.view.controller.OrderSettingController[方法]editOrderSettingByDate');
INSERT INTO `h_syslog` VALUES ('35021c3c-6099-46f6-b0eb-70eb9ca246d7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '10', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('350adaa4-6981-4860-87fb-ce2c891fe5b1', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '11', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('354432f8-3f89-4761-8d56-f2a3c96b6a3c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/editOrderSettingByDate', '10', '[类]com.xzh.view.controller.OrderSettingController[方法]editOrderSettingByDate');
INSERT INTO `h_syslog` VALUES ('3546886c-1e18-4e4b-8be7-798e53b39844', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '16', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('354a616f-eb0c-4ab2-8b30-7f9e9a244d44', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '4', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('354c0f44-75f3-4413-87cf-4361e040a8af', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '21', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('355034e8-56eb-474e-900a-619d8d19dc0d', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '15', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('35717fed-7548-4a27-8bf8-81f45f4fd0ff', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '8', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3578c8b0-c2c6-4299-8718-7d7729f3a30b', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '33', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('35ac08d2-c388-4288-b219-9d955b89985f', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '4', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('35ad8c63-6b30-46ac-be10-4785f0e8a59e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '25', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('35bb71fb-3b80-4fbb-9bd7-373499ef47bc', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '5', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('3600ba55-300f-4bd3-8dd7-730db688a516', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('3628d3a0-e0df-452b-b266-7057d00bd9ae', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '79', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('362d9c5d-a9f7-455b-86a5-a22d2ae351ca', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '4', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3635f885-b547-498f-a8d8-cfdec40092d7', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '6', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('36398664-8244-40ba-ac33-1590d441368b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '11', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('363c994c-8b5f-4f2d-b25f-64f9e9a0a811', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('36404dcc-7e70-45c4-bfb8-a05f09d52758', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '13', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3644066d-d88f-4687-a0da-e966e7088889', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3672461a-7109-42d1-b7b7-907540b429fc', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '', '10', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('36ad0a3e-f042-48e4-87c7-a70712996fa0', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('370009ca-d969-4c3b-ac91-aeec76a17b76', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '8', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('3702c67d-3309-4419-9197-3120fb5698f0', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '448', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('370b01f5-6bb1-436c-8822-a4af8c655d13', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3723e118-73ef-477c-aaa2-803c33b0db9f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '5', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('37698f6b-702d-4591-8fa2-575b2d01e136', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '10', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('37c6b866-239a-494d-8e4b-8a0b73500a5a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '14', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('37cb1917-4c32-4a18-b84b-2e980b686164', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '16', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('37d099cb-d05c-467f-b421-f2cf9aa1cf84', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('37d62208-a51a-4910-b8ee-20e93dd26473', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '7', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('37eeebe6-bc5a-4fc5-b966-bbdf0ed1d45c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '15', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('3807d62b-ddc4-49ec-a1fa-1db1afeacd59', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '30', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('380a8ae2-3afb-4e34-b373-0958fc3e41f7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '25', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('381b89fb-46c4-456d-9398-9fc89c307113', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/edit', '9', '[类]com.xzh.view.controller.CheckitemController[方法]edit');
INSERT INTO `h_syslog` VALUES ('3841514d-bbcb-4809-9dcb-81721779b4bf', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/food/findAllFood', '9', '[类]com.xzh.view.controller.FoodController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('385d3cb4-6711-4bb8-8c2d-f411f1bfdc64', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('388329c0-c479-4667-9195-414869cdee8b', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '8', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('38d9b6df-946b-4731-adeb-c80fa27d9126', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '7', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('38ddcc68-2b9a-46d6-a4c4-f86cee3366b4', 'health', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('39403e32-c47a-4307-b665-1622c9c3c43a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '16', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('39731076-778f-40ca-b57e-e40af043d192', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '651', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('3980d194-cd5f-4608-9fa6-73f48d5cd888', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '7', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('398dbe89-a6ef-45d9-ab1d-9bc0bf17b103', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '21', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('399143ff-78a7-4db2-87e8-6b7fdd9dde5e', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '15', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('39ac4dc1-42d7-4ff8-9534-b6327189fcb0', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '17', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('39b34358-34f6-492e-b86b-b65b6c2a7524', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('39c6a737-fe8b-40eb-8c40-1c533b95eac7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '12', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('39fc5300-1f7c-48cf-95f4-54b19aa3016a', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '14', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3a0a3665-0f85-46d6-9693-6150c60cc769', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '7', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3a31757e-de9b-41ef-b08e-7c13130e035c', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('3a3756ca-8c9b-41b4-a52a-fc7ee1587f21', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('3a42c9f0-bea1-4895-9d1e-0b18a5ff5e67', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '7', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('3a70db38-36e5-4969-a10b-3038472c4a0c', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '11', '[类]com.xzh.view.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `h_syslog` VALUES ('3a7e4821-b316-4b83-9e8f-6ebdbefb3132', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/edit', '10', '[类]com.xzh.view.controller.PermissionController[方法]edit');
INSERT INTO `h_syslog` VALUES ('3a9cb1a1-314a-4fc6-b683-8f2b002cb17d', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '10', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3ab0af38-76f6-434e-b3fb-2114e9921ff3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '5', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('3aeff86e-ec34-4129-8d98-130fb90d8a70', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckByStMealId/{setmealId}', '29', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckByStMealId');
INSERT INTO `h_syslog` VALUES ('3af6b257-f0a7-4e57-a786-c3e10f02b5cb', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('3b1d1059-2acb-4271-a4e5-885ee4f771e9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '5', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('3b266157-7782-4215-a13f-c8f31568fbd0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '8', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('3b4ed18b-4794-4d7a-8dec-781ed428b3bf', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '5', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('3b69382a-d565-468e-bd40-c82a7d822317', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findCheckitemIdsByCheckgroupId', '4', '[类]com.xzh.view.controller.CheckGroupController[方法]findCheckitemIdsByCheckgroupId');
INSERT INTO `h_syslog` VALUES ('3b78ad86-6916-4c88-97dd-520d9f84472b', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '3', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3b843a15-f7af-43c5-a833-262e87c3a1be', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('3ba4cee0-c26c-4e26-87f1-c10ea774ed92', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '5', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('3bb1f28e-5930-4fbc-bfe6-6db44096b7d0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('3bb69332-514e-47f8-9068-0588d94d7367', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '8', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3beab316-b5f9-4987-b8d8-bb8ba36b7d8d', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '1', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('3becbc09-f6f9-48d3-b180-85d6c3e3d73b', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3bf924b6-3fbf-4cd5-837b-9cbdd5a4eb10', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('3c1b7b2c-5883-4a7c-8b2f-f93a73bab105', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('3c4f4b3d-c03a-4c51-a855-6cf31b1dbc4f', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '50', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('3ccdb309-aff9-4ba0-b4d4-9ed20c11a8ae', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '5', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('3cd1f82e-7332-4040-938f-edc86fd0c4ab', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/setmeal/add', '18', '[类]com.xzh.view.controller.SetmealController[方法]add');
INSERT INTO `h_syslog` VALUES ('3cd4d35e-4b58-40cc-b2a4-d5cef65c03ae', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '8', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('3cfcc795-aa56-462f-8d05-4f49d2c6b3a0', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/editMember', '12', '[类]com.xzh.view.controller.MemberController[方法]editMember');
INSERT INTO `h_syslog` VALUES ('3d065abb-904f-4f2c-b1de-9af7483614df', 'health', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '4', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('3d2be00e-09ad-4955-bdbf-f3b2292cec28', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findRoleByPmId', '24', '[类]com.xzh.view.controller.PermissionController[方法]findRoleByPmId');
INSERT INTO `h_syslog` VALUES ('3d2f4939-996d-4f95-80ea-0a4debd7e4eb', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '5', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('3d37497b-646b-474b-8245-cbea086e10fc', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '10', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3d3a7874-4231-4238-b399-73e526b360ee', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '14', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3d5c97a7-d98d-4c9f-b8c0-f8c865bdb47e', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '14', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3d9be246-cf33-4f6c-8436-10557af970e8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '18', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('3db3adc2-c3c9-407b-8783-889b2e1d1a5f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('3dbefe42-900e-448a-bfe2-d6e29e466f98', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/delete', '19', '[类]com.xzh.view.controller.SportController[方法]delete');
INSERT INTO `h_syslog` VALUES ('3dc0fa77-385d-48ae-be1a-511372da33f5', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('3de00992-a3c2-4842-b3a9-cf4349cdc172', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('3deb0508-27a8-46b2-afd6-8a34e39f682d', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '37', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('3df0dbdc-85d0-4a22-815b-0387b2077391', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '7', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('3df897a7-75af-4185-bce9-2d2d7c4930e3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('3e082624-a94c-48e4-96f2-958c8996d090', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3e13f223-e003-4915-9588-3d0be8d1e4a5', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('3e27ea52-0521-4f3d-8cec-62154ebd4125', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '5', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('3e2bdfbe-9c6d-432e-812a-8e4362a226ce', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '425', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('3e58da23-9878-4e98-9a36-db2e33a28296', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '28', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3e6099e6-2e2c-4dab-a43c-f810f7ea8c4d', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('3e87777c-79ed-40bd-ac4a-239a92f1b8ef', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '30', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('3e9f3036-22b3-4844-ab3b-6da21655a624', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('3ea5a67a-f958-4fc6-b228-cf679418a927', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '8', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3ea6dcfb-389d-40ad-a112-e75445c600c6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '10', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('3ecfe220-9f67-437d-9fac-cd91e4f8e057', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '13', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3ed01423-bf84-4ac9-ba8e-7c2b9d900453', 'health', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('3efb8028-881d-46e5-9b31-271dd49cf600', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '3', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('3f005868-a9b1-432f-a7f9-e6575d76f4fa', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '16', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('3f166a96-d829-49d0-9a0d-02168c878e7d', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '17', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('3f245b49-683f-4c98-a934-da0a7986d524', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '257', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('3f2c4606-578e-4218-83af-feba3042c8a0', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('3f49a2ad-c7f3-48ff-872e-3a33c45779e9', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '5', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3f4be291-01e5-485f-8ffb-e888ba140e2f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '11', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('3f5e4e7d-f2df-43e5-b6ed-b304dbe310f8', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '101', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3f63c1c5-1718-497f-8289-dae4982a6f81', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('3f7dd94d-d166-4380-b51f-f0fc7f7929c9', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '8', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('3f944b5d-e6b9-4af4-a03c-d977fc29eb1e', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '7', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('3fece561-499e-48ea-9dc3-567aa2f4ca82', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('40069373-af48-4677-ac96-b08371f4cf3a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '14', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('40164dcf-9f15-4e81-aec7-541987c867bf', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '8', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('404cc66a-afd2-49db-b260-0c072d414120', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '7', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('405d1d0d-ac2a-40fb-a972-ea1f27913058', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('408fa118-45cb-43bb-9f57-80cd57eff511', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('40937e80-12cc-4c45-a66b-8f57e2629df6', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '26', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('40d756de-59e5-4cea-a54e-19c50a77b1c3', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '330', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('40e532e2-c483-43a0-80d0-40a570f866e2', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '5', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('40ec2bcf-fb3d-42be-bf94-aca513426f3f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '7', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('40ef9ea1-3c11-4040-bda3-f15fd082af33', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('41055695-adf7-45d6-9bd8-5f7cd18e500b', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('4118cdc0-c8ad-4950-8181-b07d76aedd7d', 'health', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('4145920d-e048-4073-b689-d51fd4c001e7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('414b0106-668c-4b33-8202-7f3f8eeaf046', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('414bd376-4aa8-4343-b480-cc5a6cc05ed0', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '6', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('414e6ffa-a8d7-41a2-8a87-908181dfc5c4', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '32', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('416de30a-c5e6-4c6e-81bc-d779e604d7eb', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '162', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('4186cb83-59c4-48f4-86f4-457dcf237646', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '8', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('4212ac24-b875-4985-be39-ccb67a8595df', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '8', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('42341b8d-25a2-40df-b537-99e0815644c1', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '36', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('423d6488-869d-4bae-81cb-9e5088434fe3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '5', '[类]com.xzh.view.controller.MemberController[方法]findHealthManager');
INSERT INTO `h_syslog` VALUES ('423e4c55-6dce-4395-a43d-895fcb1c4d75', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '10', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('424553db-9d50-42d7-990c-98a960f62889', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '4', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('425179e1-66b1-4a20-94e9-59c67d19bbc1', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/edit', '12', '[类]com.xzh.view.controller.PermissionController[方法]edit');
INSERT INTO `h_syslog` VALUES ('4272beaa-ee0f-4bc7-809d-cc12aa1ec25b', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '8', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('4283acb7-8fe2-460c-909a-6da3c3cadf63', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '14', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('42aa2a91-9940-4824-862c-9599f4cbf235', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '16', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('42af1e45-fc10-42c7-ade9-9fb83a5f2d3f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findCheckitemIdsByCheckgroupId', '3', '[类]com.xzh.view.controller.CheckGroupController[方法]findCheckitemIdsByCheckgroupId');
INSERT INTO `h_syslog` VALUES ('42da6fe3-d1a8-4196-bcca-96b1e9e6f515', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '29', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('42ef384e-5372-4ce0-b7b8-47a46969d3ac', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '32', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('43083117-8465-4216-b094-35e66d7cdc70', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '5', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('430ab58c-94ce-4238-9670-54e363b1287c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/addSport', '12', '[类]com.xzh.view.controller.SportController[方法]addSport');
INSERT INTO `h_syslog` VALUES ('434be019-6c41-40f4-9611-98b8b075f4fb', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '13', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('434e3122-bd7f-4c58-b289-2f435f0d73b6', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '23', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('436ec1cd-2a83-427f-b8a9-8acbfcb064d6', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '10', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('43719837-85ab-4cf9-8252-6650ffa1088d', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '10', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('437d57e2-3f95-4973-8dd4-404b03ca9572', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '21', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('437e2e10-17bc-4e50-81db-3fe7a993e4ea', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '8', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('438859c4-c5c6-4791-b427-128ca2e1d4e3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '19', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('43a0cefc-e7ad-426c-a792-d1193b0b54a5', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('43a7e8df-82b5-4c54-9fbf-e4409d661911', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '5', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('43c422f2-ba7a-4bed-b2ee-6fb029b09d5a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '7', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('43c4adfd-7611-428a-97fe-b23ca0d658a6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('43d21035-b21d-42ae-9027-59061ac3f974', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('43ef83f8-2b82-4ff9-b73c-6c34dcd5fc2f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '25', '[类]com.xzh.view.controller.CheckitemController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('4412c7b1-9a8a-448d-b76a-c01491f43d4e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '31', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('44530d59-20db-4424-b143-e821f3d0cc7b', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '8', '[类]com.xzh.view.controller.MenuController[方法]add');
INSERT INTO `h_syslog` VALUES ('445e07b2-1f8f-494f-beab-842cb7a27cb8', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('447f4000-e649-4505-8a67-7072b6a40b81', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('44883afb-7879-4494-9cb5-d1abecc126e0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '12', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('44973585-e5b2-4900-8bc8-536679ab8bd1', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '16', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('44adbf10-4ca4-469e-a359-47102432714c', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '8', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('44de04bd-bd4c-4e6b-9cec-e2ac23eacdd1', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('4516d59a-c88c-445a-a251-fe20d4119e66', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/edit', '12', '[类]com.xzh.view.controller.OrderController[方法]edit');
INSERT INTO `h_syslog` VALUES ('45578b39-73c1-42f9-ac4f-1d959804b317', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/menu/findRoleBymid', '7', '[类]com.xzh.view.controller.MenuController[方法]findRoleByRid');
INSERT INTO `h_syslog` VALUES ('45756ff6-1ff0-4270-9a56-15df24c3713f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '12', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('4592d6c1-b3a6-4b0f-b785-ae495bc5906b', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('459fe8a4-a6ba-4fb3-a3e5-4134d4d91b38', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '60', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('45a4a22e-79ec-440e-a580-18068a16b3ea', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '4', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('45ea32f8-e15d-40f6-99af-720cdfaf637c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('46044b9f-5a58-476b-a83f-a87847a0008f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('4615228b-ee7f-4c3b-ae78-4ef293bcc32f', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('461a8389-9d1b-4753-afce-556cc130d5a4', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('462a491c-a208-4d86-9a9e-85926dbad14c', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '0', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('46373843-f209-4ba0-bef5-b9802b26d83e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('46375ba3-5ff6-4891-a09f-999b3a6cedd9', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('463e5a2c-944f-484b-a395-0f164479dea8', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('466ddc8e-b106-4cdc-b608-acfffc069e85', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '310', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('466fb453-4bf2-4cb9-810d-f2a055077238', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '30', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('4682a56e-747c-44cc-ac2a-f3d8e3bfee39', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '31', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('4684e9d4-e6e0-4a23-9427-11d4fb494b53', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '17', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('46885633-5537-4535-a30c-fb973654d760', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/addMember', '15', '[类]com.xzh.view.controller.MemberController[方法]addMember');
INSERT INTO `h_syslog` VALUES ('469d39c8-d489-4148-a628-3b552426cfda', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('46e0281a-65be-4694-aad0-0b83f2ac5091', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('46e5be63-075a-4660-b6ef-735949656037', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '5', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('46f7cbb5-1cb7-45a6-8c81-930a534b6d28', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('470bd888-f8d3-4b7c-b681-09e0b071321a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '8', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('47148ece-d1f5-4b10-a752-239770421405', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '6', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('47204660-9a10-4a71-855a-a2d599dff914', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('4738a2e3-15a9-4f8d-a5b0-4988020df4c9', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '11', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('47420dbc-a2de-483d-b1b0-a48c0fcd4f91', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '8', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('47738e7c-9acd-40c9-822f-bbf9e7f53079', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findCheckitemIdsByCheckgroupId', '5', '[类]com.xzh.view.controller.CheckGroupController[方法]findCheckitemIdsByCheckgroupId');
INSERT INTO `h_syslog` VALUES ('47878cc6-036d-4954-8e28-caafd8e62f45', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('47a1de2b-e585-4e31-836c-31efb70878b0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/delete', '12', '[类]com.xzh.view.controller.CheckGroupController[方法]delete');
INSERT INTO `h_syslog` VALUES ('47a9b17c-9534-453e-bfdd-89d1cc9bc33c', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('47bc5903-e5b4-4b4d-9afd-c84a323b7517', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '12', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('47cbc06d-4d53-471b-9df9-ac658f1ffa53', 'admin', 'pighome', '2022-05-25', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '54', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('47d58001-e50e-4292-9030-b5f682c610ac', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '17', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('47ec30af-6f75-434e-a2a9-b6985c351fa4', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '14', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('47fa510f-05b7-47d5-b449-8378df978b70', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '185', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('481424a5-93e9-4b2c-b08f-0f09925ad0bf', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '4', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('4838f025-a32c-4b79-8bf1-351035470135', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '29', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('483ac620-6ad6-4ab6-b2da-809d62e07ed7', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '', '10', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('4862486f-b651-4953-a398-40a853dbe210', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '80', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('4871426a-218b-4a2c-8780-18e52286fd03', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('4879ff02-0ea2-4898-bedd-013c2f7bcd4b', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '5', '[类]com.xzh.view.controller.MemberController[方法]findHealthManager');
INSERT INTO `h_syslog` VALUES ('48a2918b-36d4-410b-a98c-22c1a271ddf0', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '34', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('48a53535-6db0-4239-8294-b952ee6dc6fa', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('48c4c42a-ab8b-4e44-bed8-8dadcd4f2702', 'health', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '10', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('48d42913-fa1c-43d0-b2cc-756cdcff858e', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '19', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('48f0e3d5-2471-4554-8d9c-d9dc70eeb8d2', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/addMember', '19', '[类]com.xzh.view.controller.MemberController[方法]addMember');
INSERT INTO `h_syslog` VALUES ('48f818e8-3767-4cd4-9232-b9b7c39fffe4', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('4914f3b4-0129-45b3-9ac4-d2156e5bc77c', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '14', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('491fa1cb-5894-4f0b-95d7-0d4a9bf449a9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '18', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('49528739-6412-43a4-9816-eccc9eb586e0', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '5', '[类]com.xzh.view.controller.MemberController[方法]findHealthManager');
INSERT INTO `h_syslog` VALUES ('495551ba-feed-4fe5-83c7-1b1313dbb703', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '14', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('497e994f-9fd0-4f2d-92b1-0e7e21b53c9f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '5', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('499dee7e-8c42-4048-959d-13184c44e087', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '7', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('49e026be-e803-45ba-8580-758009271f94', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '91', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('49e4aa18-e562-48b6-8fb7-45eced364198', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '13', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('49e623a1-5517-413e-961d-b70f8cc8e49e', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '11', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('49f79268-2689-4d87-9aaa-146edc040c4c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/food/findAllSport', '13', '[类]com.xzh.view.controller.FoodController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('4a3fe824-322a-442e-8536-55bbf254c383', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '8', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('4a409ff8-ac92-48e8-b8ef-95199e409b63', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '419', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('4a5475e2-a126-4aa6-82b8-7ad2b90a5028', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '18', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('4a65f2bb-f9fd-4c33-8d8a-b6c11726cc35', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('4a66ca71-679c-4787-adc7-2d1e58f30edc', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('4a6a273e-aba5-441e-a522-bee1a14a7750', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '5', '[类]com.xzh.view.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `h_syslog` VALUES ('4a7f5d67-73c7-40a3-a1f5-fc53810b8a86', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '', '12', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('4a937792-9d2f-46f1-ae43-3d39c6ded226', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '6', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('4a9d2d8c-9ee3-4e48-9a32-82007313f991', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '10', '[类]com.xzh.view.controller.UserController[方法]findAllRoles');
INSERT INTO `h_syslog` VALUES ('4a9ec943-82a3-49dc-bf80-aadd0a7bda0a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '14', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('4ab2906f-dd0b-4a1a-acb8-f357c1488631', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('4b04f26a-2a41-4160-82ba-408ee4d762ff', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '7', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('4b07cc0a-16f0-48e5-9d45-dbb85e6f2a8c', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '10', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('4b1ee8d6-f358-479f-aa30-ecae1a812a27', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/addMember', '19', '[类]com.xzh.view.controller.MemberController[方法]addMember');
INSERT INTO `h_syslog` VALUES ('4b58d040-bc26-49b8-96e9-9835ba221b16', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '8', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('4b610578-c966-421e-9b87-5673e68dedb1', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('4b7764e2-ad71-490d-8c2b-5f2cbcf6dd0c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '11', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('4b9e5022-d7e9-44cb-b3f0-0bf490ef767e', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '37', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('4bb99241-e25e-4b41-9da6-ba23600ea89e', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '3', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('4bc326fe-44aa-44bd-ad60-387d4412fd36', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '313', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('4bce44ed-0e11-492c-9ae0-b048871b5ae4', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '10', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('4c3e995d-3b91-43b2-9245-704b3cb48921', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '30', '[类]com.xzh.view.controller.UserController[方法]edit');
INSERT INTO `h_syslog` VALUES ('4c4fd383-15fd-4f57-9f8d-6c0f176bfec8', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '17', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('4c6fd6db-6d5f-4586-bd45-a400b80f2cea', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '11', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('4c990152-6f44-45db-8f94-bf2853195133', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '294', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('4d267a18-cf2f-41e3-b66a-b37f8857598c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('4d30d3f6-63df-4ad4-a320-929eb583ebd5', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/edit', '29', '[类]com.xzh.view.controller.CheckGroupController[方法]edit');
INSERT INTO `h_syslog` VALUES ('4d36a3fd-96e2-48a4-bdba-cce9336449f2', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('4d56f731-f962-4784-aa3f-aafe75f77454', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('4da12562-894b-463e-a10f-2965e9a77776', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findCheckitemIdsByCheckgroupId', '4', '[类]com.xzh.view.controller.CheckGroupController[方法]findCheckitemIdsByCheckgroupId');
INSERT INTO `h_syslog` VALUES ('4de5d8b7-70f6-422e-b6bf-86b410fd640a', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/addMember', '20', '[类]com.xzh.view.controller.MemberController[方法]addMember');
INSERT INTO `h_syslog` VALUES ('4de8ac6a-3704-4d96-a826-064f4a2716a3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '10', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('4e08a08e-a534-4344-83cb-617d4aef88ef', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '10', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('4e10ecee-7298-48bd-b1de-286723eddc35', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '11', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('4e5a5e0e-352a-44e8-965b-a971fb6bc25b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '', '12', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('4e5e03c7-d84f-4a98-ab9d-36d9aa5a1478', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '5', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('4e5e43ec-cdd9-423b-984a-5fdd11a75fa8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '5', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('4e69a968-b8c9-4a06-989d-3bb930a85891', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAllSetmeal', '30', '[类]com.xzh.view.controller.SetmealController[方法]findAllSetmeal');
INSERT INTO `h_syslog` VALUES ('4ec060d2-b391-49f0-a979-5a9dbda168cb', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '19', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('4ee44ed5-8406-4696-8967-f777b6a36a28', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '4', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('4ef22750-d176-43e4-a779-c803ac865e98', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '74', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('4ef63e6b-e453-4080-a071-a70b1c46c806', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('4efd6b40-ab74-46d5-8289-99d914ce93f4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '13', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('4f13e78d-4f38-4bf3-9968-f2bc7e113b29', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '307', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('4f263a74-2934-4df8-90f9-75ceba633ae0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '14', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('4f32a851-258b-4150-943e-447fee25fcd3', 'admin', 'pighome', '2022-05-25', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '14', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('4f503240-bb68-481a-a435-a76f58dd0f8c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '38', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('4fa3ec67-855d-4f3f-afc8-e671aa286ada', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('4fb6eb46-1a6e-47ac-8cb6-4e01419d527a', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '60023', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('4fbbbeca-dda7-46e3-8255-02f845537043', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '4', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('4fc7bb80-c03d-408b-91e9-798765f54b7e', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '15', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('4ff329e6-4bd3-4b97-8c1a-a956cdf88bcd', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '9', '[类]com.xzh.view.controller.MenuController[方法]add');
INSERT INTO `h_syslog` VALUES ('500ba7f4-8489-4ec6-a6b4-46d6ef90f6ed', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '0', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('50170b79-e586-4a7a-8ff2-bd83e1ab2ed2', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('50572d36-7558-435f-9468-132e470ac3fb', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '5', '[类]com.xzh.view.controller.RoleController[方法]findAllMenus');
INSERT INTO `h_syslog` VALUES ('50648a94-ce67-491c-88cd-8c1be2ff2979', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('5078513e-f7cc-45de-82ba-9e5e4180e85c', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '28', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5088fc90-d2d5-42f0-a020-df3696c2a1a9', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '19', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('50ad574f-af37-4722-8746-5e780cc944fd', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '7', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('50da0ced-2041-4138-b77d-88aea13ca3ad', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '249', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('50f6a540-760f-4683-8cd5-be54eacd769c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '42', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('51080a8a-b187-4e71-b2ca-a38511556341', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '7', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5108a172-8a49-4a6a-a8e1-e4695c0afb5d', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '12', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('510c7c4a-206d-4be9-9ea9-d2707f2d7b91', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '10', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('511af3b3-0e64-4590-bb20-1103616752c3', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '52', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('5147bfa8-db3b-4695-a89f-58e352bf9cf4', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '12', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('515c15bc-3d90-4670-9e72-73273a51e2cd', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('51c9a50a-f9e7-4e51-bf6c-3244fce4a6b1', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '402', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('527560bd-a5e8-4269-9ae9-6ec6e7cf175e', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('52a1edf1-b3e7-4a25-a765-df71f6947cc6', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('52b1da66-290a-44c5-86d5-0158eb66a95c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('52c3c519-5cf5-4fe7-9ce3-1af1d6e6a667', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('52f8397e-0732-45b4-add8-3cd6210932ce', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('5320d970-60f5-4e1c-ae50-e1453302fc94', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '11', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('538361b6-abc5-43e2-be4f-64d99ff34920', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '5', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('53b045d3-a8dc-4425-828c-31d7de4e265b', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '6', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('53cb3a4e-be97-4521-883e-c2a3ff98d606', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '12', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('53cc42d7-f59c-4406-a67e-2489b4a452fb', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '7', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('53e40c39-d63c-4d28-9daa-77d0d8c91041', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '7', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('53f1037f-02d4-43db-aa1d-152a785a9b65', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '28', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('540c5b17-b65c-4663-bc72-d9da88690b47', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '17', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5418b257-dd09-40b9-bcc9-9956e7e524e3', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '12', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('543da7ca-8577-4429-9caf-0366fcdfd90c', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '622', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('545003aa-850c-417b-8f93-c73c64ab7f8e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/add', '11', '[类]com.xzh.view.controller.CheckGroupController[方法]add');
INSERT INTO `h_syslog` VALUES ('545ba1a0-c8fa-40b1-899f-0251fa8db665', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('548ba028-f432-4723-b6dc-8ae3ac03d931', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '28', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('54d6c53f-5769-499a-b23b-053abc1eae73', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('54f14c59-671a-4253-9eb8-0cfbbb0a3e4a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('54fe3a05-24c2-4666-8a50-4acb018a00c9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '4', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('551d013d-3b30-47f8-b443-f5906a430d02', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '51', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('552bcbbe-04b8-4b1e-8ee0-28db336a6284', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '11', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('553dfaf4-0325-4d3f-82ae-b4385e14361a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '7', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('5550c904-9b14-46cd-bb5b-e5b24357069e', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '36', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('558270d6-1356-4a8e-988a-605723601a76', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '12', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5585530f-ec7c-43d1-b070-1699e1441d46', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '4', '[类]com.xzh.view.controller.UserController[方法]findAllRoles');
INSERT INTO `h_syslog` VALUES ('55ac058b-a420-4259-bc08-5478119bb6bd', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '17', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('56084934-d3f3-447f-83b4-ae64d7ab96dd', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '306', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('561d5b40-0db4-412a-80d3-604bb3aa998e', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/editOrderSettingByDate', '10', '[类]com.xzh.view.controller.OrderSettingController[方法]editOrderSettingByDate');
INSERT INTO `h_syslog` VALUES ('56201cb7-059f-421c-ae53-a58a875affab', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '6', '[类]com.xzh.view.controller.CheckitemController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('566bc4d8-9977-4d37-a8d3-be4a110a3604', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '10', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('568e5d99-ee07-4a91-90a7-569305e58fd8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '9', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('56e39fac-5cf2-4208-b1bc-48fcbc637dd7', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '15', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('56fd8082-48ad-47e0-a3b7-e1e32f542150', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '7', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('57003a71-a066-4c05-a97d-4317a4d729b8', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('5715f1c2-ab23-4920-8691-df266fe1a163', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '15', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('57288e00-e356-4c94-944e-a5e4b16ed3fa', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '7', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('57320fd2-19f8-40f7-b202-c4015e0c8cdb', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('573973d8-a54f-4c64-a632-196cb9e7368c', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '70', '[类]com.xzh.view.controller.MenuController[方法]add');
INSERT INTO `h_syslog` VALUES ('574b920b-3a58-4494-bca9-68fcd6060f39', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('57608422-2248-4a3b-a49c-8f3a4ec22786', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('5763a97b-0a81-481c-96d0-69d731489ee2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('576581f0-b9c4-44c2-b07f-a1cd93311195', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '0', '[类]com.xzh.view.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `h_syslog` VALUES ('57a365e2-58a8-4076-b052-e6c10cbbc8ad', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '7', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('57b91a68-5be5-4d56-b4cb-61e18168e2da', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('57dd272c-0aaf-47bd-9cc4-f23a96a705cb', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('57deeae3-2a49-4ca0-a5ba-a92c008642b4', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '23', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('57f9ed81-31c3-40bf-929f-607f7fd508ab', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('580045bf-6f9b-4297-885c-9c5e01c5ea74', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '10', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('583fa637-ba18-49d0-8f7c-c772b298a63e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/editOrderSettingByDate', '19', '[类]com.xzh.view.controller.OrderSettingController[方法]editOrderSettingByDate');
INSERT INTO `h_syslog` VALUES ('586d7e8b-adb5-4a67-b4c0-60c3785c3e7c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('5876d23a-b4ac-48c2-9a7a-7fff803181fe', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('5876e024-e754-4fa6-8e08-beaf70c65212', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('58c6b61a-acfe-49f6-9589-76a4c7692f76', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('58d4c7b6-d0bb-414a-b61b-4e14cc25248a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('58ef5993-31fe-4206-a03e-72122e597470', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '25', '[类]com.xzh.view.controller.MenuController[方法]add');
INSERT INTO `h_syslog` VALUES ('59408318-63dd-422a-99dc-a987f7048477', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '13', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('59419123-480b-4102-89c1-cc4eb68737e9', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('5953e3a8-c32b-4b22-8693-4f406a21faf5', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('595ddcd3-92af-4f3a-bdbb-6fc7c0a307d4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('5967a486-ce4b-4c40-8c46-9622665aa199', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '4', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('597159ef-d92a-4b27-a826-0533e4048131', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/sport/edit', '10', '[类]com.xzh.view.controller.SportController[方法]edit');
INSERT INTO `h_syslog` VALUES ('59cbf50f-d10d-4490-8d21-40600e0d815d', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '6', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('59f12d5f-8604-44be-a958-83f54333daed', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('5a21df28-9bdc-4d74-943f-c9c6550a0f5e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '11', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('5a244312-e2ed-47a4-bfd8-4ca4b532230a', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('5a2d6bc6-f951-4f61-88db-54e7e37251c1', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '7', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5a3f75da-6d48-49bd-ae66-f16b82d84661', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/food/findAllSport', '5', '[类]com.xzh.view.controller.FoodController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('5a44c096-507a-485c-8ed3-4a2b47956835', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '11', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('5a4e0352-e748-4234-b5d7-f8dc4ac0bd9f', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '430', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('5a8a64d5-6e1c-4a3c-b624-5094ff0bf07f', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '94', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('5a8fc755-5eaa-412f-bc9a-0ed49d3eb383', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('5a9805e1-c1c1-431d-9b7a-1c726c67262e', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '15', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('5a999be6-dc46-47cd-9515-7ef27164f130', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/add', '96', '[类]com.xzh.view.controller.UserController[方法]add');
INSERT INTO `h_syslog` VALUES ('5aa8fe1c-9892-4841-8766-a74ec1b80e78', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5aab02f4-89eb-4828-af68-8e8f08474227', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('5abff20a-ebd1-420e-ac93-611298114696', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('5acebd43-f9cd-4219-acd9-0405e88cd3c8', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '13', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5ad60a75-41dd-4bc7-abaa-363cd7f2d32f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '', '8', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('5ade5438-68ef-44d7-8971-c0b0595bc4b5', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('5adf0fb1-7f2e-4f99-8d92-33ffaf02a1cc', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '3', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('5ae37e2b-b951-4d25-bb58-0a1414304e3c', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '11', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('5ae975ed-0e24-426e-ab2a-6f7651a2b20b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('5af787eb-a0c3-495f-a3b5-4b8b5652c3d7', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '23', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('5afd58fd-3961-4535-a15f-a05ccf6c5dd1', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '20', '[类]com.xzh.view.controller.MenuController[方法]add');
INSERT INTO `h_syslog` VALUES ('5b04263e-a209-447b-86c8-eea2c9ec9c82', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '8', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5b13b403-864d-4406-a8f7-cccfc046ce73', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '31', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5b31b438-489f-4e4b-a393-2648f3580f68', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '7', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5b432fc2-753f-43e0-be28-6edda835c983', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('5b591934-3e11-4ebc-a6c7-1ff440208f5c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '13', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('5b6ee523-0eed-4f54-a488-b052c166f765', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '10', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5b7633ab-a2ce-40fd-ae93-64bd48475a2a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '3', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5b81aeaa-641e-4944-bf0b-d217b01b6625', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '8', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5b937f9c-e5aa-4485-b3ff-0ff82d1192be', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '8', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5bac87d4-6d53-41f9-952a-f0a59dcf9375', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '10', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5bb07488-79d9-48fe-8f49-20d98d28be61', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '4', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('5bc4de85-351d-44f9-9ab3-9927332b31e4', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5be2692a-13cd-4f06-b8a2-2ea5352b8fdb', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '4', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('5be6540f-16e4-431b-803e-bfd0dfc5f9d3', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '31', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('5bece479-1ec8-4ffb-a91e-0059618b4f4a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('5bff8aaa-6bff-4536-b5c7-f6476cf7f2ea', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('5c028eb1-8b51-4e97-8dae-f2ffa5d46c90', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '305', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('5c152f85-fda4-493b-bdad-deef910c3f4f', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '18', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('5c314dcd-431b-416f-8110-922d252a89cf', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '8', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('5c345339-f726-4e53-bf86-36a49967bb58', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '11', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5c6a9275-102e-4d39-8365-8e5be3a17505', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '', '9', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('5cb1bddd-4d54-4d6a-a19f-55c7d7c6e46e', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('5ccea972-4288-4229-adab-129c7c3b95f4', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('5cd02add-4517-415c-b092-e2ef35ed9dc4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '5', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('5cd344a0-d209-42c1-ad63-aa6bb1562bb5', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('5cfa0225-ee30-4b6a-884d-11da62e1dc82', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '9', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('5d116f95-f5d2-4032-8ab2-2b46621fde4a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('5d2b6d9d-4132-4b32-9c7c-b80d27595468', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('5d3f91d2-e358-43bb-adef-3ee75c4d9152', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '15', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5d6594ad-6091-4b57-83a5-36b46e0951e6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('5d6b1840-107b-4f6f-9690-b3c75b0204c0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('5d6c3044-3a01-4ebb-ace2-dbb834492d11', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('5d9e0610-9c5d-4fe3-a357-e896457103c7', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '376', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('5d9ee0e6-ae61-4e6a-8b24-6900d564ae8a', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '9', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('5daa1f5e-2a3d-4dd3-92d8-81fa5d7dd48f', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '18', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5dc8e2c9-666d-4f9d-961c-e30d970624a7', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '4', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('5dcf3dc7-b0d4-4ae1-9f2d-ed4790a06441', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '23', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5dd90112-e384-401d-862f-0cdcf9e218fb', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '5', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('5e0abaf1-b310-4326-85c0-1cc2b10a5b12', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '32', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('5e197bfd-a895-44af-b17c-87c38f80982a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '28', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5e22a6df-a34f-4b8d-90d9-a10126480934', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '16', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5e58ff04-f558-4d7f-9dd4-58464ae9b540', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '21', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('5e5bcef6-5594-4301-9982-dbe989772370', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '82', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5e6de397-9332-47da-8868-5709c22e5bfa', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '6', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('5e95dbae-86e4-40ec-8ea9-7b702d10bc20', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '50', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5eb54f06-c274-4889-81d8-f712393dc431', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '11', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('5f02965c-2832-4217-843f-8c790115e8b6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '11', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('5f17a6dc-8283-4e22-8078-d5caaa88174a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '8', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('5f17eb7f-5686-4de7-9b1b-9c6df4561c33', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('5f374c20-47ac-4c51-8751-56a2aac9172c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '3', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('5f3d193a-5921-47f6-8458-c87cb7b5e776', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('5f416946-bde1-48a2-b956-85959243bd7d', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('5f59b2e3-d82d-4698-92d5-251f7474976d', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '149', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('5f64a4fc-9fb6-415e-ad43-888746c87949', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '120', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('5f7aa0a9-ccbd-4daf-b70b-5c5ab5f3369a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('5fab5bfe-ec1d-4552-a96c-fce66c0e253f', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '20', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('5fc16bbd-ec16-4edf-9e7f-1ae02a8defc0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('5fd09911-7e0f-405c-a858-319cc84d2011', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '6', '[类]com.xzh.view.controller.MenuController[方法]add');
INSERT INTO `h_syslog` VALUES ('5fe55fb6-e5fc-4c60-abcb-b89ac7486f71', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('5ffdfa81-4bb2-453c-bcde-38ce54f0eb02', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '6', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6001eb78-5171-45f0-9780-779c296188e8', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '13', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('60049494-2f62-421f-b273-e6413f0f20b6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/delete', '13', '[类]com.xzh.view.controller.CheckGroupController[方法]delete');
INSERT INTO `h_syslog` VALUES ('600bb895-a63e-4a2a-a813-09151ee074b7', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '3', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('601b1272-0f35-45b2-b847-c2ac522d82a4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '299', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('60233566-23f9-4d5a-ac50-13a61aad95fa', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findOrderById', '11', '[类]com.xzh.view.controller.OrderController[方法]findOrderById');
INSERT INTO `h_syslog` VALUES ('602d7595-9e91-4fd9-8b2f-4c578ad1f6ef', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '48', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('604dec5b-adfa-43ac-ae56-d5b0f2ff1c81', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '7', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('609e24ed-797c-4180-b5b0-3bfa692cad60', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '78', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('60acc4bc-2b73-420f-84a1-2a49abc1b428', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '11', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('60c21440-0485-41bb-b85b-1b4db58cee3a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '12', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('60c7f977-34b1-4071-89a6-e444a09edb21', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '5', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('60d6a5e9-e16a-4457-996f-2028a837608a', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/editOrderSettingByDate', '13', '[类]com.xzh.view.controller.OrderSettingController[方法]editOrderSettingByDate');
INSERT INTO `h_syslog` VALUES ('60d9e4bc-1ba4-440b-a019-c32086e588d5', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '15', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('60f4b6c8-0607-454c-9f6b-ea2cb33f647e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('61043f31-887d-44cd-9152-94c383333bb1', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '7', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('610619ac-ad7e-47d6-90fa-00886162be75', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '5', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('610b8104-f8b0-4fcd-a485-920817a1ec39', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '7', '[类]com.xzh.view.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `h_syslog` VALUES ('61100260-83e5-40b9-a567-63e677294f3d', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '44', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('6129f849-10e9-4959-bfc2-b06ba0057088', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '6', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6154c496-f20b-42cc-8c27-d72e2164d872', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '8', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6192de74-8118-45cb-9e24-ca849569aa1a', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '6', '[类]com.xzh.view.controller.MemberController[方法]findHealthManager');
INSERT INTO `h_syslog` VALUES ('61aff778-c877-43cf-ba21-2b2e82ce108c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('61b143e0-a90e-4c1c-8b4a-3b1625dc6026', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '10', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('62046a9b-7223-49f1-be78-452dce18c207', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6210d389-5dd1-4136-ac56-bf3040de2339', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '13', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6227a8d5-e0f0-49ec-b393-497599ff254a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '7', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('622d38e3-9223-4fc1-97b5-3edd194d2edf', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '339', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('62c33de1-7f8b-4c48-9b9b-4df051e2e6e1', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '12', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('62ce67b5-d2ae-401f-9ee5-c6e05a79df84', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('62f6ae8f-7c81-44e7-9864-9cd52510b6c3', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '4', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('630079de-2c16-42e0-a7f1-b187a9fef3d7', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '9', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('6304051f-38ba-495c-8916-f6fb7cedee34', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '', '10', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('63112490-b710-4b42-951c-d5af14b7e0eb', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('6330a9dc-8e39-4865-9795-87f5ef5a1311', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '16', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6365bc73-e02b-464c-a5ac-861a6071cd03', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '513', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6378c35c-92f7-4f44-9b62-1c26910b5fa5', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '41', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('638d2ea4-74fb-4398-9c2d-17c19df677e7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '12', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('63b5bcec-1040-46a7-ba93-04da68231b5f', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '6', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('63c0c50c-9f10-4338-bfb9-c2c9e78d04f4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '17', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('63d9e6ed-5a12-4bc5-8bce-b5681b10e793', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '12', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('63fb1bf8-9d37-44ae-8d99-91ab178ba722', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '7', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('6410cb9b-0c4b-41f4-ba3e-afccbc4dd034', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '18', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('64339866-6e70-43f6-8f4f-f9d84ef8769b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('64353544-a429-4d48-b4d0-041690315ada', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('643d681c-05ab-48ce-abe9-8b714aee80a1', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('64561731-a5fd-444d-916f-c6609902cce4', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('645b1915-bdb1-4d23-a124-544f687062ec', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '4', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('64804ad6-d5f1-49ef-a859-98697304a32c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('649fb80d-f29a-4239-a23f-68ba01d84ce2', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '10', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('64a3b906-bb20-495d-bcd2-5cbd0af1e8b8', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '17', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('64b3b2c5-716e-4c2a-9e9d-8c6b2a30039b', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '303', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('64ded320-921e-4a89-b2f7-8ccee08992bc', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/edit', '8', '[类]com.xzh.view.controller.CheckGroupController[方法]edit');
INSERT INTO `h_syslog` VALUES ('64eeda82-3ee3-4a0c-88ca-7b31c1f37590', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '36', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('652d992a-4958-4d0f-ba31-b1fd4b6aef22', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '13', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('656485c9-ea2a-45ff-99f9-56d10ea59ca9', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '8', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('65872e1d-c3c6-43c6-8411-0e721a815f59', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '2', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('659947bf-157b-40aa-b3c6-f49ce7773aa6', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '6', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('659e2f0a-abd1-4de6-a4f9-9ff974160f19', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '253', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('65bcd294-82f0-4617-adc4-5a3677900de6', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('65f491d4-2ae0-41dc-9285-47e20243fc2f', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '7', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('65ff2895-c2fa-45d5-84eb-79ddba835ccf', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '6', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('6611f6d4-48b8-4915-9e78-a9534bcb7247', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '13', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('66164dc4-58a2-45c0-b91b-263fdacdaab8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '5', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('6624e85e-b8a7-4f03-9e0f-bc17b177279d', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('6628a4a7-152a-4bec-8108-e00e84d4df52', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '4', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('662df590-f1ab-4c4b-8bdc-5c750780e8eb', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('66384b3c-da73-4ff2-9126-58e2d1deff9d', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '17', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('665faa05-cf1b-46eb-8f15-ec245272a5cb', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '6', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('6688c026-69b5-4494-b6e7-8035fd1bb471', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '15', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('668a76d0-ca0b-4dff-9317-5177391b49ac', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '30', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('66994a91-07a1-426e-b0ba-6e54b5f49ec4', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '689', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('66f9b525-e2e9-4c2e-a583-bca8f6182e1c', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '4', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('67008fea-982f-457e-aacc-0a51368f297f', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('6711c2b7-92f9-4194-9196-d5644304a292', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckByStMealId/{setmealId}', '38', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckByStMealId');
INSERT INTO `h_syslog` VALUES ('67147857-651f-4a94-867c-4fcf043607f3', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '23', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('673b3533-f520-4f17-8635-67dc0626fdcb', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('674bc42f-00df-41a2-a9e5-4773d5bf343f', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '18', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('675b99b6-0495-4d00-b3ce-32d7fa9e1c73', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '6', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6764ee6a-40bc-4c12-9d0e-b7a9f9300274', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '15', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('677f7099-82cb-42aa-86d3-0042718e2530', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '13', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('67be5385-0052-4a2e-b7c8-0d67e0898520', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '8', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('67c55693-97cd-472b-8ad3-75695285dc40', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '29', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('67d4f47d-90fa-4f0d-90f2-1be58b621b9d', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '17', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('67df8ebc-85eb-4f1c-9944-82656621eae3', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '12', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('67fa4f9e-36b0-41a9-b0fd-fbc0165f3088', 'health3', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '21', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('68190035-ce24-48bb-9e91-66ea7da4adb8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '4', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('68224f17-ff5b-432d-92ce-f03ab09e7c2d', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('683a6b79-13ad-4300-ab85-08c3c7e41c49', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('6859a95b-9324-4faa-a2b4-2f104335e0ea', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '7', '[类]com.xzh.view.controller.MenuController[方法]add');
INSERT INTO `h_syslog` VALUES ('685d1aa4-887e-4add-aaca-5ddbbaa3fb2e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('6870f6a6-e4a0-4bf6-92dd-e3de504e2b30', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '7', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('68aa4280-01a1-4c38-a542-5883fb4a771c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '7', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('68ad83e5-5333-4fd7-a44e-62a82c4724b9', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('68e1a6ae-5dc7-43a5-b15d-19680100d8e2', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '10', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('68e4d5c2-7fa8-4bc8-b9ca-d91e06c3b48b', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('68f89e57-0418-4476-8ec9-a5142c6b1d27', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '16', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('693307d9-caae-487d-bed6-a7947569ee57', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '24', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('6945f987-ed45-46ba-a6dd-d150a267d03a', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '7', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('6970dc8e-4c44-453f-9d89-6723818ef4d2', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '25', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6976f213-e1c2-48f8-a19d-9161cc9c8e55', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '29', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('69822d81-4076-4e6c-8b98-698774112ddc', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('69841882-deff-4843-a805-43b8379fff35', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '19', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('698bf7d0-71c7-4330-963c-1548b8aff550', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '305', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('69a2935d-a181-4de6-aaba-430d5d4496a4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('69b04d8f-22d6-4e08-9837-ae4036521f2f', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findRoleBymid', '6', '[类]com.xzh.view.controller.MenuController[方法]findRoleByRid');
INSERT INTO `h_syslog` VALUES ('69e21ee4-048d-4d8a-bdf2-90d516576e7c', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '5', '[类]com.xzh.view.controller.RoleController[方法]findAllMenus');
INSERT INTO `h_syslog` VALUES ('69e46580-8afc-4bf5-9acb-18e46bc215f6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('69e9dd4a-1db2-44f6-bcb8-f8a1dd7a399a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('6a17c5de-65a8-4f2a-9e0d-ecc6668e82ee', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '13', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6a189df7-8dd8-4727-b78a-d73e809526f3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '16', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('6a19b154-d49b-478f-be85-c2a017abda2c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '4', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6a28cc82-1b9c-4283-bd0d-95e11584542a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('6a62da49-fbbb-45e0-9840-1de9285ef587', 'health', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '', '17', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('6a8243ff-6783-4f45-bfa2-aceaa91f3ff9', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '7', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('6a92a565-742b-4854-8266-15a5a545f96c', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '10', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6aa44b22-9fd6-444d-8c87-caba872f2995', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '8', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('6ad6ab24-7bd6-45b9-9aa8-4f6977c0b05c', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '28', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6adf2040-c4e3-416e-aed4-bcd21ca0e3f2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '5', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('6b2301fd-9527-438c-9eca-3bc5a8cd71ab', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/editMember', '9', '[类]com.xzh.view.controller.MemberController[方法]editMember');
INSERT INTO `h_syslog` VALUES ('6b4579a0-d2e1-4cb2-ad32-766002f4f5d4', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '7', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('6b5aba4a-9854-4b6c-b5c0-5de59dd57eab', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/editOrderSettingByDate', '16', '[类]com.xzh.view.controller.OrderSettingController[方法]editOrderSettingByDate');
INSERT INTO `h_syslog` VALUES ('6b724fae-a7f4-4183-addc-ac2a947491d0', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '7', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6be8ae2e-0a97-40ff-be49-4a79c2e81d65', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '3', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('6c126480-87e1-4a5e-aebb-7fb098ccb559', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '5', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('6c285e3f-23ab-4678-8cd2-eeffcfe586fe', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '8', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6c2e45cf-a0f2-49f4-adbb-9c422413533a', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6c3591a8-8d3c-4d3f-8598-12f9113776fb', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('6c6aeae1-8105-4813-ac0b-df25388db14e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '29', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('6c86eda6-284d-47bf-82f2-c04f06eec8e9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '7', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('6c8bb1c8-ccb7-4f3d-b4ca-9b2f6dd3d166', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '27', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('6caa484a-da58-4e9b-8b00-df807ec16905', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '22', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('6cdb33c1-91e0-4552-a497-15bacbce8453', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '385', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('6cf5e3e1-330a-4ba9-910d-a2754736e40f', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('6d0cc85b-158e-4800-b7b1-de4396d292c5', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('6d195105-bb6a-4a7d-a821-69a6264bac45', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6d384c1e-ac10-425a-9f84-6aab098598ff', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('6d4b5278-28a8-49cf-8c3f-574f1587d57c', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/add', '94', '[类]com.xzh.view.controller.UserController[方法]add');
INSERT INTO `h_syslog` VALUES ('6d5c5277-abf5-41c2-ade8-5d0206eb5b9b', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('6d8540e8-d6bf-48fa-b660-40337947c9b5', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '17', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6d863c84-e201-463a-aac3-b269938e5b14', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '4', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('6d90cfd1-8432-4559-a998-09151dbd42c6', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '42', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('6d9c118f-b7fd-4174-a4e3-6723204107dc', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '23', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('6dd6746f-35ec-4e33-ab1a-6e7865a5d3df', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('6dddb5e2-6b57-4f7c-9efb-088b7182e62a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '8', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6e273adf-cab3-43e9-8126-9da75ed90dd1', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '5', '[类]com.xzh.view.controller.MemberController[方法]findHealthManager');
INSERT INTO `h_syslog` VALUES ('6e44b736-7584-48d9-927f-5755b5ac7255', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6e4b35e1-3727-4da3-936c-e4707b9b37ef', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '19', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('6e5da10b-349c-4737-afff-0344f8be63d3', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('6e73b8b1-bc44-4a2f-9954-0e2889cc4323', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '60', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('6e8cb15f-2b77-4f18-9c8f-3aa04d8821ac', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '10', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('6e93eedf-b142-468d-be93-92f85d6829d0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '3', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('6eb46a9d-36ce-44db-82e4-7d572797910a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '10', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('6eb979ad-afe0-4be4-82e9-239ed7458658', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('6ec0ef92-c8cf-402d-8889-96b764ff7cef', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/add', '25', '[类]com.xzh.view.controller.CheckGroupController[方法]add');
INSERT INTO `h_syslog` VALUES ('6f2f7a84-55ee-4e64-a450-bbf72018a58f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '5', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6f369844-2597-45ef-ad4c-30ea5da9d12f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllFood', '9', '[类]com.xzh.view.controller.SportController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('6f395d22-2add-446d-8c39-0bf686048df0', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '8', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6f4d2829-2627-4ff1-9117-c7507f07345a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '10', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('6f55b730-0fd4-48f6-a9d3-dd564e141ac2', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '17', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('6f5fb2c2-7f30-4430-8ecf-0f98b3c88fbd', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '39', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('6f7d1c6f-2dcd-4068-9f1c-92ced249bca2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '6', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('6f916de8-c081-452e-aa35-08b6f07ad85e', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '17', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('6faa37ab-eafd-47a1-9402-9195eebb2187', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('6fca29b6-e305-4cf2-9ed8-cf1fea567e67', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('6fca8821-6eea-43e8-8fc8-8c5ed85eca7e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '12', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('6fde34c6-4f3e-4992-81f1-bab9619e7fd5', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '4', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('6fe8c33a-48ad-4c21-a11d-29f0434ecb0e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '23', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('701ac740-f95b-4155-9711-9529c1079a95', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '9', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('702b2e9f-05c4-4a28-b648-6f1ea94a79fa', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '15', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('703b2482-7057-42bb-b5c0-2043de582384', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '19', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('705f48e9-d3c5-4cb8-9dec-0bd2dd20b374', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('7062550b-ae67-46ad-837f-726743e139c7', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '8', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('7090f350-eae3-4132-95ab-37860fc27398', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '23', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('70a0675d-48ef-4a3c-a9f5-ba3980117cf4', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('70cfbf77-7fe1-48f4-ae04-94875e980834', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('70e15392-21f9-497c-aa82-5ae54af5e356', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '11', '[类]com.xzh.view.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `h_syslog` VALUES ('70f17afa-7bc9-4317-bf34-208d3b455cf8', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('70fe6b2a-7d97-4f37-960c-2b825d86823a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '18', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('71054c7d-af84-4b99-a9fa-499aab31e594', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '10', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('71074232-f21c-4fd8-a382-8baf9be3de92', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('710d34b6-8bf1-43fa-bc43-2d96c44a11bd', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '4', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('71123bad-ee78-4f5b-b619-ebf0eb39646a', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '13', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('715acbe3-d0aa-4562-817a-5904fc5cfddc', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '11', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('7188102e-14a3-4ee8-a667-81b7609aac68', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('71b24db6-b1b5-40ef-af97-a5314b101115', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '14', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('71dcf298-cad2-4b90-b594-2bc5f0ea86cb', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '6', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('72027f84-3ac9-40b6-9e11-380d3a0e71a8', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '8', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7214d252-017a-4282-bcb4-5eb935132960', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '8', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('72349cb6-e65d-4719-a63e-e2770bb5a77b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '4', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('723d6be5-ee09-445c-9e67-322fb7ab8ba8', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmealupload', '2903', '[类]com.xzh.view.controller.SetmealController[方法]upload');
INSERT INTO `h_syslog` VALUES ('72533355-35c1-4db6-adca-ac0e46585d4c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('72535671-1e6a-4834-a28b-d5640d44c506', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '18', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('7254165c-2685-43d0-a85d-165de6b62ee4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '27', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('725e9e11-f317-432a-9d53-2ee08a46c65b', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '6', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('72688399-5b6d-4393-91a3-63862802c13b', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '17', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('726c66aa-b67a-436d-94a4-af6f05f93e5f', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('7280eefc-f89d-4ef2-b744-ab968c7ed74f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '11', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('7284a2f9-c524-4b21-a656-43ef161b2327', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '5', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('72869872-1efd-41dc-8731-2e942e3af842', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '9', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('7288cf0c-b358-40a4-9ac3-405246396a0f', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '16', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('72af1ff6-70ee-4781-a19f-03450fac4c73', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '9', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('72c99fcb-6b19-44e4-9f3e-c191c7dcb0ec', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('72e3a5cb-0fee-471f-b764-d9e49121e031', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '6', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('730947e5-2db9-4d31-a84b-a2689d466988', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '6', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('730c9bdd-8aa8-4d48-a0fa-5d28a56e4449', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '11', '[类]com.xzh.view.controller.MenuController[方法]add');
INSERT INTO `h_syslog` VALUES ('73155423-0c86-45e0-ae83-907a52ae2bc9', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '6', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('73308b45-db7d-451a-8242-0965d8a8bfe2', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '14', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('733545df-8013-41c9-96bc-e5d7a35a8f0e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '29', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('73797c60-e21f-4eea-846d-a1253d5418c3', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '10', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('737d44b0-32da-46af-b14d-7a56bfabd066', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '4', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('739db9ea-d613-4f07-99ff-d7ec8b34a1a9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '9', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('73ce8b85-72ca-4e04-9d39-5489fa155613', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '5', '[类]com.xzh.view.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `h_syslog` VALUES ('73d3c0f3-ae93-4c47-8d01-c78575121665', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('73f634d3-2dc8-47aa-9ce6-28e8319053c9', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '5', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('73fdf410-2cb1-40d0-97f5-bd480d151943', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('74079678-1ba7-4c87-819e-7186c3c7f6a5', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('7409fd27-f90a-42ab-b97f-d4948374d437', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '398', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('74204e2a-c917-4e6a-ad90-b8e826378f42', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '23', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('743a50ec-6592-4614-9f6f-581024dad0e2', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '24', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('74529b5d-6eae-422d-a50d-4fd2968d6670', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '301', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('7475fab6-4693-4229-acce-0d6d8f902e82', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '394', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('74be02f1-c1ce-4037-bb56-0103853ee83b', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('75126e2f-5d8b-4141-aa9d-0a065404365a', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '11', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('75181cd5-7211-4504-94de-67aa6657ea29', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('752918da-f77c-422d-ad4f-b75f67ba8cd7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '14', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('7562a7d8-3106-4a63-ab5b-bf614b72f9e3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/edit', '6', '[类]com.xzh.view.controller.OrderController[方法]edit');
INSERT INTO `h_syslog` VALUES ('7564a7cc-a843-4d44-9326-fefab92e4dc0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('757a00c6-4f63-4fd8-b51b-8721c44bf8ef', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('759132bd-1818-439d-be88-ea8daa7b31b8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('7595f83f-f0e3-481f-ad2a-60cc79e73287', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '12', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7596dc2c-1fd5-456b-bc72-bb0b82993595', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '17', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('75a667de-0e59-4101-a782-07b829fec166', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '327', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('75b1cf8b-1d34-4c87-944b-9765adb4000d', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '10', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7607ace0-1905-4640-99fa-414978e4b785', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '34', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('761f4b28-12b5-40cb-9d9b-90417d08ac4d', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/delete', '13', '[类]com.xzh.view.controller.CheckitemController[方法]deltetByid');
INSERT INTO `h_syslog` VALUES ('762b4059-bd21-4670-9365-c0a7ed2f1ee5', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '8', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('762c2274-afe8-4b09-8b63-b80514392786', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '10', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('76395849-81c8-463a-b39a-2011be7015ef', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('763d56bc-1061-4621-b383-f29c0db3ad0d', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '47', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('76a2b2c0-4be2-486e-a50c-a2982fe9aae2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '5', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('76bcc6e8-35b2-4a75-a7ff-79727f4a14b3', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('76ccf999-7d53-4850-a4d2-215fa0202ee1', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('76d75227-6775-4e1f-af9a-36c5495dd366', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '19', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('770422ab-ec0d-45bc-a575-9a15c5619409', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '10', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('770d7c47-eb5a-4259-bfce-79facd49de10', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '11', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('771bcb52-add5-4126-9427-67a34e230464', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('772f9726-f329-4ccc-b92e-ebd622c6b275', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('7731ba41-6729-4975-8383-cd47cbc52f7f', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/delete', '10', '[类]com.xzh.view.controller.FoodController[方法]delete');
INSERT INTO `h_syslog` VALUES ('773d63a4-8378-4f52-b060-bd8820af9627', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('775755e4-4434-4cc8-be0b-d86ae6eb73c6', 'health', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('7761c9da-f0fe-4d2e-8738-955112dfc2da', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('776312fc-d709-4740-a38f-abca6372ddac', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('7782add6-2b37-48bf-88e2-08bd8a497227', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '7', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('77c4114f-6c03-4e22-8778-16c863407a2b', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '40', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('77dcd0c3-c2b5-49be-9918-f0b286a409f0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '3', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('77e46100-70a3-4e71-9afe-d1be52f266df', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '371', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('78151292-f98e-43bf-9544-450930311171', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '12', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('784702d5-2a4d-4052-a50c-b863da627b42', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '8', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('7863b20b-42f2-4329-a6b3-5ea332ae11c6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '7', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('78679189-c364-4faa-bb29-5158a6546c2f', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '6', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('7898bb22-7017-46f7-8032-81f6bd491ffb', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '32', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('78a33c24-8c07-4dd4-80c4-2c08abb89ca1', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('78afa9e5-defa-40e3-ac85-3faf4c4eae5e', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '6', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('78bd453e-3841-46ec-b11a-782904b98653', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '33', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('78da61ac-ac8e-4b94-b265-858bba5b9f4c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('78e64575-49fd-4f16-a93f-f6d397ec6664', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7911ea06-4363-4e1d-8c85-abc4fb281cfb', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '8', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7916e300-9e25-41d3-8a6f-e3590084c2e5', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAllSetmeal', '31', '[类]com.xzh.view.controller.SetmealController[方法]findAllSetmeal');
INSERT INTO `h_syslog` VALUES ('79218792-cbad-4010-8a16-9f6f680e4d90', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('79312ae2-5d04-4335-b021-ab309177a305', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '8', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('7935632c-d72d-4c5e-82bb-cb75f825b949', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '4', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('794575b6-4a44-42f7-aaab-12bd06a2c55a', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '0', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('79d80513-e844-4b14-8ce3-5516574e9ab0', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '3', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('7a08c19a-b01a-4f55-be1a-cc0ba11a356f', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('7a169678-1e1f-4f0d-a2c5-4a052a3c2d29', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/deletemenu', '15', '[类]com.xzh.view.controller.MenuController[方法]deletemenu');
INSERT INTO `h_syslog` VALUES ('7a2f9144-9e3e-4466-8c68-c8869a012901', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('7a30690c-69f1-4d69-8f08-9f1936a864ff', 'health', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('7ab75425-6061-4ff3-9aae-6c8be7a0f064', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7acf531e-10bd-4f18-bfe8-1f950843692a', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '7', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7ae15011-b43d-46b3-b66d-3e634239085d', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '10', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7ae8db0e-16b0-468d-9e2e-7bf34d36c701', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '13', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7b23dd29-9148-453f-920c-37a45eb89383', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '437', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('7b25fbd1-c11d-4d8e-8c7c-550374934711', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7b338508-1d7d-4d2b-acf9-92ef8669137f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/delete', '107', '[类]com.xzh.view.controller.SetmealController[方法]delete');
INSERT INTO `h_syslog` VALUES ('7b38ead2-d3c6-4ffd-9b01-16b42e85d691', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '12', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('7b572a73-0897-49c9-b6d3-13169edf8105', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '9', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('7b792b93-0ff8-4bea-951c-e18c5817bb4f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '83', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7b852b6d-b9b4-45f3-9b1e-80f76b078bdd', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('7b94eba6-a27b-436f-8fb4-ae37aefea811', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('7ba14b08-ad2c-4a1a-bac2-7fc393c1eef5', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '46', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7bb48719-d60b-4446-bbee-8cda6d0d5268', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7bd6d5eb-d67c-4a9a-8462-2a441ae61dff', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '5', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7beacd9a-a0c6-44c8-aa50-dfc506ca2a47', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('7c0a166a-0310-487e-8ce7-ed70206a148c', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('7c203509-602a-4452-a8b1-c3fa22989e0b', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '3', '[类]com.xzh.view.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `h_syslog` VALUES ('7c2ad376-129d-446f-a2e0-4cdd802cb4b8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('7c57dfc2-88c0-4e0a-a11e-8b46c1a6b395', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '10', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('7c601389-9bdd-497d-ae00-55a6525e827e', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findFoodById', '9', '[类]com.xzh.view.controller.FoodController[方法]findFoodById');
INSERT INTO `h_syslog` VALUES ('7c6b05d7-d5a1-49e4-968d-b3150a1fb839', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '14', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7c8b2533-3be1-4f8d-84b6-bf4b91f7bd1e', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '37', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('7c92ca83-0d9a-4ea0-81b2-7d9197c6494c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('7ccb5a84-4d1c-463c-9dfa-8603048ec926', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('7ccc749d-3497-424d-9b4f-1da0420ca321', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '7', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('7cec0a16-22a5-4eac-a11d-9c1f4e1d5a49', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/editOrderSettingByDate', '11', '[类]com.xzh.view.controller.OrderSettingController[方法]editOrderSettingByDate');
INSERT INTO `h_syslog` VALUES ('7ceffb78-8661-4122-993a-72a3dad1e74f', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '9', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('7d198c7d-9b68-4032-91a0-cfa0e914a11b', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('7d450c80-e08d-4b8f-9105-de1b824bbb8c', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '36', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('7d66ed99-ecf5-4b8e-9c36-b08f28a2ff12', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('7d8252ec-a14d-473b-ad63-0eb97c298767', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '29', '[类]com.xzh.view.controller.MenuController[方法]add');
INSERT INTO `h_syslog` VALUES ('7db6c0d0-e5cb-409b-a701-c24d380ba8f4', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '11', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7dcd4f0f-c4b6-4622-9cd8-9017ae0e6472', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('7dcdd1c5-5ea0-4608-8a6d-8d9782b8c933', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('7dd736f1-e1cd-49ec-a143-a8d8c09cb04e', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '18', '[类]com.xzh.view.controller.UserController[方法]quit');
INSERT INTO `h_syslog` VALUES ('7e086106-d924-466d-8f9c-445d5856701c', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '28', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('7e1d066f-cfac-4535-b850-9214819af5b2', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '9', '[类]com.xzh.view.controller.UserController[方法]findAllRoles');
INSERT INTO `h_syslog` VALUES ('7e347132-3724-4cab-a327-29b3d5a5b635', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '4', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('7e751916-75ca-4c9a-9710-650df8be8304', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('7eaf4fc6-bf18-4154-bf17-204ae3822aa1', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('7ecfef49-1b3c-4452-996e-3b6dff9864f1', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '16', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7ed57396-5cc8-4d6c-b6d2-8544bfd83611', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('7ee18b38-329d-48eb-a7a3-cbcfd84ec72f', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/menu/deletemenu', '13', '[类]com.xzh.view.controller.MenuController[方法]deletemenu');
INSERT INTO `h_syslog` VALUES ('7ee6fb8e-9a11-4325-bf7f-bfe858ceddae', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '95', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('7f0107ee-c2d9-4d5d-bb09-61f241f045a1', 'health', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('7f071113-2e56-48ea-9ffb-a61d9f54433c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '305', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('7f20e565-0a58-41a2-8f4d-829887b15392', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '7', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7f55cf92-a956-4369-b045-0ab222662bd7', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('7f658f42-1689-44b3-ad32-135ece084f5e', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckByStMealId/{setmealId}', '35', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckByStMealId');
INSERT INTO `h_syslog` VALUES ('7f667f22-1208-4bc9-9e89-e78d2068e463', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '', '8', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('7f7d8719-069b-43e5-acfd-86e257968ecd', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '8', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('7fdbf29f-80f8-4b61-937f-3ff55396e0fc', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('8014777a-8b2a-409a-8b82-1260b62dcbc5', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('807b0eab-27e0-40f9-be40-3d6d88b76b05', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '10', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('808d1ac7-24ca-4ae8-b257-aec3703144be', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '7', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('80987f05-eae9-4c89-823a-9e884a4d05fd', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '13', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('80a622d1-2767-4bb7-953a-5594d2d306db', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '8', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('80ad6d9c-5130-4547-834c-ebf2629fa214', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '500', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('80b3ba59-991c-4e43-9db7-9bf87a452993', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '9', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('80e759ea-7bb8-4b31-a7c1-6eae8653ee05', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '7', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('80fcfaa2-1b7d-4721-8220-4e9309d9ac02', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('81124639-f3fb-481b-8e1e-0121d85a7f6a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '6', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('81223a56-a43e-4753-a7e7-322ba730b5cb', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '13', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8129e2d1-eeff-404c-9344-8fdfea415ca7', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '0', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('81349fc6-9c15-449b-8fd5-86e29c202535', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '7', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('8184f8fc-5ea3-40c0-aa49-21515afa1ebb', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '8', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8190d339-2817-4961-a8dc-1bd4d76d6b95', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('81b27f9f-d564-41ff-bf86-f1ca9dbe2fb3', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '31', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('81ba0bcd-be4e-4de3-9bf4-7cc314e791ec', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '14', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('81cf80ee-6a00-4c2c-8fde-f1a7b1ec4bfa', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('81eae244-fb36-4ed6-975c-2f85beccd20d', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '5', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('81efaa30-949b-49a3-b26c-cf8e5d22c9ab', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('81f16428-44b6-486e-a36c-c7188a3886f3', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '39', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('82092e15-7002-4699-8e9f-115d88c8174c', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '46', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('82283990-d0a7-4e2a-95f3-c209fb513ee4', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '26', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('822c8a4f-908c-4358-9cc8-8a166cfbe3d8', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '8', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('822e3bff-5649-4aa0-a665-494274caaed7', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '7', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('824817ba-1340-4560-9969-20561d3573a1', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('82595052-1bba-4718-be8b-9430d922750a', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '17', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8265d078-792f-4331-bda8-5d0639020808', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '14', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('826d5449-b7ad-49fa-83b6-e9251674ff72', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '8', '[类]com.xzh.view.controller.RoleController[方法]findAllPermission');
INSERT INTO `h_syslog` VALUES ('827c1a5c-b977-45e7-929a-2d7a22275dd3', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '54', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('827d515b-4189-4b30-82d5-b7e99aa3ca3e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '9', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('82beea9f-4823-4415-b9a4-4e556486d8ac', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '7', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('8312fe7b-f117-431a-a63b-833eedbb50af', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '308', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('832ec719-6d89-4564-bb13-055a09ae4035', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/edit', '34', '[类]com.xzh.view.controller.SetmealController[方法]edit');
INSERT INTO `h_syslog` VALUES ('8333b6e5-127c-45ea-9049-1ca4fc3db6bf', 'admin', 'pighome', '2022-05-25', NULL, '0:0:0:0:0:0:0:1', '/orderupdateCheckReport/{orderId}', '61', '[类]com.xzh.view.controller.OrderController[方法]updateCheckReport');
INSERT INTO `h_syslog` VALUES ('833aca88-ae94-4dcc-abce-94cbbffc8444', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '53', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('834de05d-e7d0-4f7c-b006-eefc700ffdd9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('8351e00d-ea65-48dc-8e1c-a8e20b27a6b2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('836982e5-a478-4bf5-a141-66d1262041f9', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '4', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('83752000-4c53-4f80-89a8-e8f9eef01bf3', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '402', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('8376c672-429d-4a26-b610-0c0f135bf1cb', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '10', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('83b827b0-5f93-4bb9-977e-e353827bdc5f', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('83d5502d-551e-400a-ae0a-ec8d8af133c3', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/advice/add', '40', '[类]com.xzh.view.controller.AdviceController[方法]add');
INSERT INTO `h_syslog` VALUES ('83e145a1-6dba-485d-9aa7-73f644e3aff5', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('83efb315-e6b1-4037-a41a-931464d42e64', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '8', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('83f922ab-60a0-4ff8-9baf-47cb07eee5db', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '35', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('840d9eef-c57f-4c9c-b975-3b7a4ffc6177', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '7', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('842dbb62-6ed5-4941-967d-7c2eb9a59be8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '7', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('8442f1c1-bdff-40e4-8af2-0f27e89ebb9d', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/delete', '8', '[类]com.xzh.view.controller.PermissionController[方法]delete');
INSERT INTO `h_syslog` VALUES ('84565b89-78fb-4cae-ae74-4d0997643024', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '308', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('849b5584-cb1f-439c-a62e-4e9242ba68f2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('84bbfd70-18b5-44e0-809f-a530f0ab0d74', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('84f7a969-2da2-4b31-897b-0fc4acc30706', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '5', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('84fbfa63-a2a2-4b34-91ab-872df4b33880', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '291', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('8519cc47-ad4b-4f34-97ba-ceb3cd229ae1', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '15', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('853f98be-593b-45d3-988c-bf166cc6dc46', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '12', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('857223c0-85e3-45fb-a183-246bb6b1433d', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '10', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8588596f-ebd8-48e2-bc90-44f6238707d6', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '8', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8591f631-d7d9-49d0-833f-0681fd315fa0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('859929a8-73d3-4a46-945f-3b7ca794bf89', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('85d9f2c6-ea49-4e4d-8fe0-b54ae503b831', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '322', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('85f43d8f-85ed-46ed-8445-c799ff4d0eac', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '1', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('86017087-965b-4b81-b519-00766d7c54d1', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('860dfae0-70b1-407d-bef3-7d47381d22d7', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('863e8250-4fcd-4c37-a310-564bd10450a3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '5', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('8657341e-ad3f-4e41-9943-266598c43551', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8657e5d4-a45f-472d-a786-b42f738944f3', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '4', '[类]com.xzh.view.controller.UserController[方法]findAllRoles');
INSERT INTO `h_syslog` VALUES ('865a3a2a-6699-4706-9eef-1f89bf75dd6b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('8672d0fa-00c1-45c7-a216-d32f2f6cf226', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('86a8de9f-7e5b-49e4-a4a0-798aa102de1c', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '16', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('86ac2ae7-3a48-4aaf-9f8d-517076ab7a07', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '10', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('86afc14b-da3f-4051-9aa4-777f6975fb24', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('86bf533d-0b79-4163-b0da-96e2a99473fc', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '4', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('86d34c65-70cb-454c-a9b9-e06274f03860', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('86e93f76-0a4b-4bfb-8132-baa28f776608', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '15', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('86f339da-3a93-4799-9cf0-2db395ff074c', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('8726d685-e4ec-4efc-9d3d-1d50eef08ac6', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '27', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('874ce216-8d90-4a23-806e-92c150151d58', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '7', '[类]com.xzh.view.controller.MemberController[方法]findHealthManager');
INSERT INTO `h_syslog` VALUES ('8790beb9-b04d-41d4-93a3-939561c6c110', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '6', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('87928c68-6bd7-4dba-8648-078d26a05f14', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '17', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('87b34b52-28e1-4463-b175-5269588589ae', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '19', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('87b791ec-8c81-4fd3-a64d-17b465c12e80', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllFood', '6', '[类]com.xzh.view.controller.SportController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('87c4e49c-8a0a-43a1-9f7b-d927798053ab', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('87eb74ad-f78e-4891-8d38-b1cf87acd09f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('87f85995-fdea-4326-a7a9-bd34f3b83801', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '5', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('88183bbc-86e9-4e12-8034-25390a14d8e2', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '4', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('881ea1c2-6b6b-4401-9d83-6cdf61c6e531', 'admin', 'pighome', '2022-05-25', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '9', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('8828aa14-cf6e-4839-8eb4-20a70e15991a', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/edit', '41', '[类]com.xzh.view.controller.SetmealController[方法]edit');
INSERT INTO `h_syslog` VALUES ('883ed72a-1950-49f1-bb45-e0ecd8cdb5a3', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '40', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('88405a24-5fdf-473c-bacc-f58779d157ad', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('8844c5d0-90fa-4da3-8f01-9fb74a9b1e29', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/addSport', '14', '[类]com.xzh.view.controller.SportController[方法]addSport');
INSERT INTO `h_syslog` VALUES ('8852cfc8-6e9c-43b8-bcd7-4fb225694769', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '5', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('885f0430-2a83-456f-910b-5f826a20b442', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '27', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('886432f3-eaae-4181-8e9f-9ae90d67cccf', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '11', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8869f4e1-ec7d-465e-bc48-b044bbe4c5de', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('8890da28-e259-40d5-9579-223959f7ce2d', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '22', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('88971196-9ca2-4fb8-ae87-0e5800ae2d0c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '6', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('88ad7bab-1607-49af-bb7b-57496d954b79', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('88b0df10-58de-4439-b2fe-72e51938803a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '8', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('88b3bbf3-0e46-4d23-8ffd-4d1fb289c893', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('88cc16f6-ed84-4342-b6b2-a689ace25cfc', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '16', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('88df1127-8d74-4000-9c46-7b58b45a90a8', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '11', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('88f07f6d-db1e-4a15-89ab-cf509f81a30e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '4', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('89132cec-9cf7-4ca6-8207-1360621f7fb4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '12', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('8974b344-fb1d-49b2-8d0b-bc16950ec4bb', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('8983756b-0e5a-489b-87ac-471502d6be06', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '4', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('8992bed4-f49b-4736-8081-3fdaa163a0f6', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('89f51274-09bf-4b0c-9bf8-769d9e5309c2', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/advice/add', '16', '[类]com.xzh.view.controller.AdviceController[方法]add');
INSERT INTO `h_syslog` VALUES ('8a05652d-45cc-4ff7-9be9-10759bfda4b0', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('8a9c6c18-2aba-4e30-bff4-6e95dd8181c3', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8af4cb27-7824-44c6-bcf1-dc6263f62791', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '26', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('8af4fa72-b347-4b3c-8a69-7dce2424db98', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '7', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('8af654ab-a40a-4356-ad16-627373d3401d', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/edit', '25', '[类]com.xzh.view.controller.SetmealController[方法]edit');
INSERT INTO `h_syslog` VALUES ('8af6e526-86c3-43d6-9eb6-ba05c51f71c7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8b0036d2-5a9c-4934-b723-b0113db797c6', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '16', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('8b0ddf54-7b98-45f8-b3db-50594c8d5b1b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '4', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8b105d2e-d62e-4026-9e0e-d2f0d221696d', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '7', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('8b14afc8-05b5-46ed-9f9f-55ff2c291f19', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '6', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('8b1d6ff0-efda-4305-94ee-ebe04f9d8611', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('8b3f320b-ec10-43a5-9048-70fdf9348e43', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('8b458e59-2fd3-4592-94e0-34742cb5b081', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '14', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8b56d31b-43b8-4d7f-989f-19da5d37494d', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '7', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8b6e0c4c-2d34-47eb-be46-aa16e611fc24', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('8b9cd5c4-9b55-439f-a19f-d9e95ebd58d1', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '28', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('8bba685e-70e5-42bd-868d-d5251bc8273c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '430', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('8bd3e1b4-4833-47e2-9586-08c7aee9b196', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '13', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('8bdfff3d-9b12-4bc0-b5bd-3b0c71b4f1bb', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '4', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('8c03fb55-cb11-4b86-b783-679d96e42542', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8c2a56a1-4122-4f48-9240-ecfc19781915', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('8c30e658-ed04-4f39-9860-7e8925ced0d3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '4', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('8c388e0b-b9f5-4699-b434-e8897c896f53', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '46', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('8c4e488e-042d-4c57-9c51-f22bd0ee8278', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('8c7a777d-7b73-45ba-bd69-d703a1bfeff6', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAllSetmeal', '6', '[类]com.xzh.view.controller.SetmealController[方法]findAllSetmeal');
INSERT INTO `h_syslog` VALUES ('8cabadc5-6a79-45a0-aa07-1d4b04dd59f5', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('8cda092c-9e3a-471a-9e75-791e86a488bb', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '32', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('8ce55586-b11f-4d73-a472-2d646966bc28', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '14', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('8d093e18-8870-4ba0-acf8-55b1a2e801ea', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '15', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('8d29b918-abeb-4351-aeb4-a46326980d62', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '8', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('8d2ea403-94cb-47a3-ad29-e9da41a54fd7', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '5', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8d363f5e-e7f0-43ca-b83f-c739e3ad953c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('8d3d6863-c9e3-4c3b-9586-383bcd13b788', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '13', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8d4862bd-9a60-486e-a24f-99722fa9dbd8', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '59', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('8d82aa3b-c113-44dc-a76a-509137dc1db0', 'admin', 'pighome', '2022-05-25', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('8d9273f0-3905-4e86-8e27-53e0a553fbc3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('8db0dc75-b7c9-43da-a37b-a8b69c06bec2', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8dba0166-7b40-4fa7-a5fe-91060dfc4934', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '25', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('8e1d2746-bdfe-4f5a-963c-e7b05683f45f', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('8e88d39a-e5d4-446f-aa76-0e7171aac9ba', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '0', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('8e9d725b-f143-494b-a565-1d8f14de332e', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '4', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('8eaeec91-5473-480a-9a94-d4755ff61f19', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '6', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('8eb982ea-28db-4649-bd51-7f73a33c561b', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('8ebebc9a-bfea-4f6f-a11a-8a0e41d45f25', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('8efca739-4e32-4692-923f-8611b75b524c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '8', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8f0ebd03-9917-4bc7-9c8f-f13f4830d8ba', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '4', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('8f25f0d2-a882-4ffb-b5c5-165a69f07502', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '6', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('8f4d22cc-fcd1-4642-ba75-90da1d80fbff', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '5', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8f864e65-d8c7-4cf5-9a83-87676a1101cc', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '5', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('8f8ee6b5-3836-48ab-82f4-1826b6f7de39', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('8f9419b3-d87f-4dff-b265-0e0878d17291', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('8fbc5836-f188-40e2-aa2c-83986ba8d55c', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '6', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('8fd72d81-e476-4328-9f15-0fb8416d5eaf', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '19', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('902436ae-0367-4561-a80e-b2bf1d7b7e22', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('90446dd3-a530-43a7-86bb-b1775ab01052', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('90544761-1092-464a-813e-86028da663ac', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '4', '[类]com.xzh.view.controller.MemberController[方法]findHealthManager');
INSERT INTO `h_syslog` VALUES ('90674612-93ad-4fb3-b727-29214046ecc1', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('907883a8-36ba-4032-bf12-b4bfdcb09865', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('9082c831-0abf-4f1c-b328-bb47aee8af8d', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('909d5288-e0c4-4926-9f1a-a74eecf6a96b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('909eb308-9b2e-4f77-8efd-ba8b2ebcdf79', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findCheckitemIdsByCheckgroupId', '4', '[类]com.xzh.view.controller.CheckGroupController[方法]findCheckitemIdsByCheckgroupId');
INSERT INTO `h_syslog` VALUES ('90a2a70a-e1c6-4f26-9469-ed2d424095ad', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '10', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('90b2d7c8-155b-4558-889e-eaa42be57d1e', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '88', '[类]com.xzh.view.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `h_syslog` VALUES ('90b4f6df-4a0c-411a-ad13-db6a63255403', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '609', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('90ed2a32-5345-41db-8357-7a76ee6db34b', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/menu/deletemenu', '19', '[类]com.xzh.view.controller.MenuController[方法]deletemenu');
INSERT INTO `h_syslog` VALUES ('90f7baa6-1160-47d1-9c04-3abcc41122d6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '73', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('91132447-df8c-4f4d-97dc-029b64b165be', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '6', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('91138a32-33ed-4e99-bfcb-dbc307ad1ccf', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '12', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('911fb958-b735-49f0-82f1-827cb546d725', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('91227099-77a3-480d-a771-ee47c820366b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '13', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('9135890e-fefb-4e1f-a925-bcc26a98d079', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '4', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('9146a8bd-11f1-471e-86b1-53707d7fecd8', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('915a3ce2-b150-494d-bffb-a188a3c3bf9e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/food/findAllSport', '6', '[类]com.xzh.view.controller.FoodController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('917b59c5-6101-48eb-af13-a2efedf10c54', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('918c2dea-0acc-4928-87d5-2c376500a667', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '18', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('91a8e2a8-4889-4b85-8f41-ce2ffdef2e98', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/delete', '14', '[类]com.xzh.view.controller.SetmealController[方法]delete');
INSERT INTO `h_syslog` VALUES ('91b08a55-e754-48d9-a0a8-a3479fc7fb1f', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('91b584d4-f82b-4a29-8995-be6130fc4c86', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '31', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('91c68c9c-c5e3-4b5e-a59a-d9f054c1326d', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '433', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('91cb84a1-3526-41c0-8a4f-05a121f1fe22', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '23', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('91ddff08-c00e-4ead-b316-7d1c74ca72c9', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '17', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('91e35ce9-d897-44c6-ae86-bba2e94be577', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('91fbd7d6-510d-47a1-b7cf-d324237e353b', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '14', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('92057dd7-eb90-4496-851f-1f6d19d15870', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '400', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('9217e6e7-762d-42dc-939e-d77cf2abbde6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('922d9ce0-5cf4-4c95-808a-5429cf17ecc8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/food/findAllSport', '7', '[类]com.xzh.view.controller.FoodController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('922e2e1f-1e94-43bf-98d6-d6ac39709a83', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '16', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('92448edb-9130-4d24-b603-4713f1471ef2', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '100', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('927a1f45-cbb0-49b2-8be6-3f9190cb3051', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('929e0cca-9ade-45d9-9e14-5fecde239894', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('92b93ea5-0710-43e0-84f0-5dd413c35789', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '398', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('92c4bbf8-bd97-492d-bc0a-a4ada3337947', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '9', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('92cbb438-2237-47dd-934d-ce26c46e2963', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '6', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('931615e1-d7e8-4aae-93c2-e75709878459', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '9', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('93265501-99b7-4112-a44b-645a88fa7299', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('9327b0d4-e6dc-4494-b5ba-587dd03cd3fb', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('933b694a-bd76-4bd2-83fb-3e3edeb39e87', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('9345a326-23be-4c8d-bb79-4f996f7be089', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('936133d5-65c4-4a86-a587-957c74b61d5a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '7', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('936ba87f-04ef-42c4-8ae1-0dfc583bb170', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '0', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('93869598-a7e6-4433-b348-13c84f584a29', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '10', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('93b239a0-f47f-4290-918d-9f6be43e0569', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '5', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('93c47248-07f2-43c6-b6c4-f7671ed467cd', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '13', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('93dc77ab-dc7b-4f64-85b5-6f97d5903cba', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '6', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('93ead11b-52ba-4d91-89fa-64af1b4f3749', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '35', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('94034a80-6c10-45e7-9093-9ff71d844b4d', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '4', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('94214a6d-4c0c-45b6-859e-fd42cf34cffc', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '39', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('94271234-928b-4222-b842-68013909b476', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '7', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('9437087c-bcf4-48c1-9ebf-8636c03fa46d', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '4', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('945a6c1f-17ac-4a32-9e50-9bb67b9a0334', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '6', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('946b47be-908c-4d52-bb6b-de00040ba769', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '5', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('94929dda-291b-4796-93e0-2efb9a3dde89', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '435', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('949e4f07-27b2-4af4-8409-020e39c2361e', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '7', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('95a0ef30-c346-4ae1-903f-6a9c63f0ee6f', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '66', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('95a25b77-0bb1-462a-a317-1db6e11be23a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '40', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('95a92a61-834d-47bb-a4fd-4ce337216411', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '7', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('95af4566-ad16-4582-aeb4-5f4ee9d02402', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '5', '[类]com.xzh.view.controller.RoleController[方法]findAllMenus');
INSERT INTO `h_syslog` VALUES ('95b28830-c659-4da6-be9a-b4e4a423a15e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '10', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('95b3fe7c-cd13-4473-89d9-a3bac6ec6dce', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '', '18', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('95c47dd0-14a6-4408-a60d-5359e95ba766', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '76', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('95c9c048-f198-41fa-b263-eed1d9d51723', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '18', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('95fd1c90-afdd-4078-b401-92f5ebf2ca74', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '4', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('962527fa-058f-4868-a101-ce961acb7b94', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '16', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('96404ca0-08c3-4e82-b13c-4d935ace879c', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '8', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('96647138-1ccc-4bd9-a9dd-30fb68122efa', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '6', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('96ade27f-6c1e-4b41-be29-ad8c3063b19f', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '7', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('96b10bf8-f99b-499c-8ad0-caf0569c795f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/delete', '90', '[类]com.xzh.view.controller.SetmealController[方法]delete');
INSERT INTO `h_syslog` VALUES ('96b4fae8-3109-4afd-858d-631d1a4c68a2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('96caec6e-904a-4519-890f-4ad9af678ec8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '3', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('96ce48a8-4bd9-4035-84f2-7764ae1609ff', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '4', '[类]com.xzh.view.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `h_syslog` VALUES ('96f7f90e-b73b-4397-bb12-890441854fdf', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '389', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('970f41df-bcf1-4777-ba1e-c0a077ba32f3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '8', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('9720e5f8-d614-42d8-b64a-0546137e690c', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('9737b87c-0a30-44d8-bbfa-c5dd6acd27fc', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '240', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('974900b9-956c-4f4e-a9d5-780ef437d1d7', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('9759105e-cc04-4863-b17d-212e328c5ed7', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('97632831-b64d-4e50-95b7-8cd218c018eb', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findSportById', '7', '[类]com.xzh.view.controller.SportController[方法]findSportById');
INSERT INTO `h_syslog` VALUES ('9768461b-ba21-44a4-a8b9-3ec779740330', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '46', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('977c3c12-5018-401f-80fe-f0188c58c3ff', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('977f0678-82a5-4c5c-aa40-aa12dfefbb65', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/edit', '16', '[类]com.xzh.view.controller.OrderController[方法]edit');
INSERT INTO `h_syslog` VALUES ('97860028-4f27-4560-8999-0d3a6adc4e65', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('9789c39c-aaef-42d9-a931-d08ed44d36a2', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '16', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('9790134b-6766-46a8-97a5-9c371e905f77', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '333', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('97907802-f27d-4736-b06c-23d1fbd76c94', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '3', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('97f9ac06-0b42-4f5a-8f92-1c2cf7bfc2c4', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderupdateCheckReport/{orderId}', '25', '[类]com.xzh.view.controller.OrderController[方法]updateCheckReport');
INSERT INTO `h_syslog` VALUES ('9802fbf1-e732-44be-837e-9c9694ed0e68', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '8', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('984e21a8-1461-4aff-a0c4-b40f3739213a', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '7', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('986113d1-137b-424c-bdf5-2444c94195c3', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '7', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('988de36d-1de9-4e16-9951-19f8c27a0b65', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('9899f6ab-0a5d-4943-891e-6fe4652a417d', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '4', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('98a9dd5a-c850-4f3c-9c10-0ad4060b3e43', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllFood', '6', '[类]com.xzh.view.controller.SportController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('98c0e1c5-b750-415e-98ab-4e08db84057e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '458', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('98cbcd30-653d-4614-8470-695295ae3c50', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('98d80111-2b09-404e-8dce-3a6dba1abafd', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '5', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('98fafddd-e216-44ee-89d0-d949104d0ca1', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '11', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('99292381-9962-4d65-a778-b7dda9ede285', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '7', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('992b211d-4bed-4438-b5fb-86199b4f84a0', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '13', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('9945268a-954e-4117-9feb-e8970964df8e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '6', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('995cd793-76a2-4ead-8917-913f271346d1', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '5', '[类]com.xzh.view.controller.MemberController[方法]findHealthManager');
INSERT INTO `h_syslog` VALUES ('996feb13-a82e-41fd-be1f-7c9c3caa42ce', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/advice/add', '29', '[类]com.xzh.view.controller.AdviceController[方法]add');
INSERT INTO `h_syslog` VALUES ('998547a0-e5e5-43b4-a72b-90a2926650f2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '13', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('99901f42-34b3-49e8-a0c6-534ca61796cd', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('999b9769-2e8c-44b4-b986-52b8c28c35b5', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/add', '20', '[类]com.xzh.view.controller.SetmealController[方法]add');
INSERT INTO `h_syslog` VALUES ('99b0b4f9-dd6b-4115-b130-5799f843b9f0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/add', '10', '[类]com.xzh.view.controller.CheckGroupController[方法]add');
INSERT INTO `h_syslog` VALUES ('99b4dc60-4c87-4fb6-bbb9-d6c2edc2f2cf', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '16', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('99bf31c0-450b-4314-a073-890b7b5ac129', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('99cca74c-73b5-4fff-94be-e5d33d1b63b0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '7', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('99dfc5df-5249-4314-900d-a5d69975c1b6', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '6', '[类]com.xzh.view.controller.RoleController[方法]findAllPermission');
INSERT INTO `h_syslog` VALUES ('9a08ff4b-bda6-4250-82e0-6bed0162e293', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('9a1b84a6-aeed-4fb0-9a27-8e707797e229', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '28', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('9a4fb6d8-bdc1-41c9-93f3-f0e4e4ee8a72', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('9a5c4d9f-2aaf-4bc3-8b12-94f88048323c', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '10', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('9a7f825b-929f-44d2-97fa-6ad771e26d09', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '17', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('9a8fae2a-b4d9-42fb-b8ea-dedaa44593fc', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('9a95ba26-aa02-4317-a294-a92965552362', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('9ab2bd93-d464-428c-a380-205e6fefe142', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('9ab3be72-6a0c-43da-98a1-5eecadfe7885', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('9ace3ab6-cad3-4edd-a21e-b146f17edb5e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '4', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('9b50b55e-0b2c-4827-ac33-5a62a5735037', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '381', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('9b554c45-8b1e-4426-9239-bae303760849', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '', '15', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('9b65c444-9f6e-45b0-b841-93c30f9972e0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '10', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('9b6c4d33-4da6-43b5-acf9-d3d591faeaf9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findOrderById', '10', '[类]com.xzh.view.controller.OrderController[方法]findOrderById');
INSERT INTO `h_syslog` VALUES ('9b6e32fa-0255-4491-b09b-bce93371a470', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/edit', '37', '[类]com.xzh.view.controller.SetmealController[方法]edit');
INSERT INTO `h_syslog` VALUES ('9b880e1d-48ea-4600-ad0e-35ad76d88994', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '9', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('9badf4e8-151f-41fd-9e78-2941b1374732', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '4', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('9bc044eb-afd1-4df2-9371-d80b99cc5ab2', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '12', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('9bcb0721-1ca1-4fa8-828f-eb110ff1f7f2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '4', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('9bd5c8c2-7500-4763-acaf-d4502366cf33', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('9bf1e2f5-f721-433e-94b1-6b036e9efd2e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('9c128a72-74c9-4c3c-b245-b31fcdb96f64', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/editMember', '12', '[类]com.xzh.view.controller.MemberController[方法]editMember');
INSERT INTO `h_syslog` VALUES ('9c40c6f3-d7ee-4a5e-a9a7-943c3efb4c00', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/edit', '41', '[类]com.xzh.view.controller.SetmealController[方法]edit');
INSERT INTO `h_syslog` VALUES ('9cf61423-56e3-49d6-9fbe-6bc6ba32069f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/add', '17', '[类]com.xzh.view.controller.PermissionController[方法]add');
INSERT INTO `h_syslog` VALUES ('9cfe0ea3-6c66-4b14-897b-7a1ae2f916d5', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('9d0a6317-7710-45f5-8387-c298e05f3ac2', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '16', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('9d25c4ca-6be0-4ee2-af7c-60b19d0b0cda', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '81', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('9d383bb1-76cb-4a63-a467-eea454526e39', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('9dadaccc-4e5f-4062-b789-cf1538c4a942', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '5', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('9dc97bf3-79cb-49cf-a18f-0da145dfc621', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '27', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('9de9c1f9-7958-4ed9-b7b7-401a6d18d315', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('9df974ca-aedc-4b8c-adba-4713efbe0453', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '6', '[类]com.xzh.view.controller.MemberController[方法]findHealthManager');
INSERT INTO `h_syslog` VALUES ('9e0a97c4-1419-4ccf-80eb-eda53c0d2965', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('9e1b4537-29a8-44bb-a60a-0ae15bb70d6e', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '17', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('9e2014b0-b059-4007-9d8d-7ef76115919f', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '37', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('9e3535f3-8be9-4c37-bc10-1667d2a31290', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '3', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('9e4366b9-ab80-42b8-ac56-e8763a558d98', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '36', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('9e5ae207-ff6f-49e8-9402-f223c49699b3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '6', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('9e5f13aa-1de8-4d26-b4ab-e90b4052b631', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '4', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('9e68c098-1d6a-4d21-8052-11cb279e4ad9', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '4', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('9e9c08ca-8c32-42a1-9d39-436c866ff48f', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('9f0c0a21-39e9-4f8f-bab0-2d5570d251a9', 'health', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/food/findAllFood', '30', '[类]com.xzh.view.controller.FoodController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('9f0f2ff9-09ad-4f87-84db-579251750fd9', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('9f2a15b0-8db9-4954-8308-ff44e63f8a03', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '9', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('9f3ab149-df73-4448-824f-a362cb08ecfb', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('9f432b39-b3c6-4a95-8ee2-732ba00782d9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '7', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('9f63d276-e469-4540-9a8f-c136867bfaff', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '458', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('9f828959-817d-4b2f-91d7-72a6381ead55', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '389', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('9f98b25c-467c-4157-a8e3-295e753d7d33', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '31', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('a053c0ad-4aeb-4624-8ff9-e26635634ffc', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '10', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a0757e31-ac94-4c31-ba6c-5ead9a50a28f', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '24', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a08a3e36-f7a0-4cd6-ba1b-4b5b658eea03', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '11', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('a08f73f9-0ff0-441e-ba4e-99dfb759cab6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '16', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('a09177ac-393f-47cb-a7c2-120b2e742552', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('a0c45e94-833b-450e-9d11-c76440d39453', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '78', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('a0d14c9d-c95a-40f9-aeaa-4eae4f3a12b9', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/orderupdateCheckReport/{orderId}', '27', '[类]com.xzh.view.controller.OrderController[方法]updateCheckReport');
INSERT INTO `h_syslog` VALUES ('a1078aef-8dce-4cba-9356-1bc30ef0d419', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/edit', '17', '[类]com.xzh.view.controller.SportController[方法]edit');
INSERT INTO `h_syslog` VALUES ('a142babc-5e3b-4e5d-8c40-45637b9071c5', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '4', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('a149c432-1ffd-422e-a496-e0d43a8a01af', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '16', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a1a9c97c-3b21-4dfe-8829-f03d1dda25be', 'health', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '27', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('a1af7d5b-5c7e-4d7a-9b42-1e19a2dc150a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '3', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('a1be8678-66f7-4e73-927e-4eca0807a690', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '14', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('a21971b0-b63c-4c88-83f5-625dcae3cafc', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '10', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a239bae5-dd51-47b9-b0cf-416a6f2ed1c2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '12', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('a23c3465-d374-4d1f-ae5b-e7079c765447', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '11', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('a24afaad-0b46-47b7-a1cf-4eb813f36a8b', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '4', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('a24d3efe-10a1-4865-9226-ac738d8f74b6', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('a24f4b82-a20d-4a95-bf16-438e42d46218', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('a25d126d-9949-4a56-a001-6c50654720bb', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '15', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('a2635b0e-c972-41ad-b21b-88cfd90729b3', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '18', '[类]com.xzh.view.controller.UserController[方法]quit');
INSERT INTO `h_syslog` VALUES ('a29a6f65-996e-48df-9fa4-2c84837362f2', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '9', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('a29fe1ee-c9b7-4fd0-b123-8621e9498452', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a2a45699-2d2d-4d8e-b493-bbdaefebb91c', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('a2c200a2-d838-42e0-9b2c-b9568223f751', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('a2cbe720-775c-4698-bb17-ca7e650df977', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '35', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('a2edf8ec-98f1-4b9b-b11b-57d1b0394364', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('a2ef8db7-1872-40cb-b03c-083358504bd7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '5', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('a30b16a0-761b-488e-a946-28cdb4221e27', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a32aa0fc-3b96-4c28-bd24-c01b099e8ab4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '5', '[类]com.xzh.view.controller.CheckitemController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('a33a3352-56c6-4478-a705-e8efc1fe4996', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '59', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('a353aa89-42e0-4f7f-85b2-c64d6558f5ab', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '14', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a368e0ae-7804-4477-8937-b7fd61912ba5', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '15', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a38f97e7-d2fd-477e-8028-bc422658e60d', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '7', '[类]com.xzh.view.controller.MemberController[方法]findHealthManager');
INSERT INTO `h_syslog` VALUES ('a3934864-e668-4640-a7d7-eb2c24db3cd6', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '24', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('a3bb00f4-e590-44e1-97f1-537b277d272e', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmealupload', '2467', '[类]com.xzh.view.controller.SetmealController[方法]upload');
INSERT INTO `h_syslog` VALUES ('a3c73ab0-df18-4ff0-b570-82fe7a57ac73', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '', '19', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('a3d0e71b-ebe1-4529-84f9-d544c1ae0193', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '18', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('a3f3a6a4-ca17-409d-b0bf-68b8d5f687dd', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/food/delete', '11', '[类]com.xzh.view.controller.FoodController[方法]delete');
INSERT INTO `h_syslog` VALUES ('a4193007-3585-469b-bcf9-cd0625eec3f5', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('a428f029-8acb-4ba4-b06e-587d2275cef7', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('a448e657-24c4-40f6-b501-062fa76bc9d1', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '120', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('a458a640-a1f9-48e0-b8fe-fd61c6fe76d0', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '7', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a4cea24d-738d-4923-a20a-b042b226e577', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '304', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('a4f88f5a-ac6f-4695-9a31-222ca7cabb1c', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '6', '[类]com.xzh.view.controller.UserController[方法]findAllRoles');
INSERT INTO `h_syslog` VALUES ('a5053bbd-ece4-4269-892f-0a179caa418b', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a52ad8e8-f6d1-4edd-9f02-114e83984140', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/editOrderSettingByDate', '16', '[类]com.xzh.view.controller.OrderSettingController[方法]editOrderSettingByDate');
INSERT INTO `h_syslog` VALUES ('a560eaaa-5bd9-4119-8157-b5015de94575', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '6', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('a5777480-73dc-4cbc-902e-da9d46c1878d', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '28', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('a5873e6f-f794-45f2-a3c6-e194077e92e0', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '22', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a58ede48-264b-40fe-acb6-2c70713c7760', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '0', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('a5c4b645-9b8f-4ace-8e12-7e57b8b8d48f', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('a5d31db9-20f8-4192-9ed9-a5f7afcabd19', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '4', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('a5f350ce-a6a3-49bf-ab24-011e8519f5f2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '103', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('a5f938d8-8684-4fc2-81c7-9eec993bdebc', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/advice/add', '20', '[类]com.xzh.view.controller.AdviceController[方法]add');
INSERT INTO `h_syslog` VALUES ('a601fb84-3aa7-4847-82be-399f2352b465', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a60560df-ccd3-467b-a915-1a9bf917707a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '16', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('a61a8673-d1da-4258-80d2-75bdb7d8b474', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a61e47f7-dca9-4975-a5e5-7d2215bae767', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/food/findAllFood', '6', '[类]com.xzh.view.controller.FoodController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('a6333ef6-f1dc-4586-b9e7-e3ee942bd7e9', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '31', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a63f9ed1-7c0f-419b-a046-4a5c3774977f', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '84', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('a66bc276-b8c1-4958-82e5-e88699d455b1', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/edit', '9', '[类]com.xzh.view.controller.CheckitemController[方法]edit');
INSERT INTO `h_syslog` VALUES ('a6715420-1e0b-40db-9bb6-1bd2c6a5a419', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '', '18', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('a6716e7f-964b-4cb1-81b3-bdbcacb887e4', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '10', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('a678c66a-4605-4fa4-ab7f-fb52cb046195', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '22', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a684675e-a80f-46c6-8845-8aea248274e9', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '19', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a68eb997-a021-4311-84f5-27a8a4303e72', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('a69c285a-a5bb-4ce8-bc99-a98b7eaf70b2', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '25', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('a6cb0c86-1feb-4671-ba31-1c4ce4a7b7b6', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '386', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('a6cee0b2-1793-4250-9938-335e95b9253b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '16', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('a6cfc338-cf74-4a1f-ac9c-35382eafa78f', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('a6d69bc9-a168-4963-9ea0-bdee4fc4d7ab', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '13', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a6ebc5af-1747-451f-afdc-7760936bdca7', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('a711148c-6d31-4c97-88da-31c82dc5e8a3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '7', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('a788af05-bf96-4292-b108-a72e269d6df7', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '24', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a79f8777-8689-48cd-ab7f-448fa33cc0f2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/food/findAllSport', '6', '[类]com.xzh.view.controller.FoodController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('a7aff89d-843a-4c3e-8132-25d6124f2531', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('a7bf25b8-97d5-4e7e-9815-84fc495fcfa5', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('a7e40661-9a39-464a-bd78-136217265df8', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/editOrderSettingByDate', '22', '[类]com.xzh.view.controller.OrderSettingController[方法]editOrderSettingByDate');
INSERT INTO `h_syslog` VALUES ('a7f3df3e-0221-48e4-9d29-0880c8385148', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '17', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a7f53e2b-31f2-4e44-9768-d1dc4e192000', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '8', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a804143f-7515-4b93-8d54-e451fda805b1', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('a8207ecc-b6dd-4cef-80e7-d7c78db09c53', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '8', '[类]com.xzh.view.controller.AddressController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a82c751e-931f-49c3-9f28-5905383caf44', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '10', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('a86e44d9-9dd9-40d6-9d21-94bcbd826e86', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('a87a2580-684f-4967-a155-cac212b6ff6b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('a87bc1ab-e365-4664-9bc3-d5bc90cdb2c5', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findOrderById', '20', '[类]com.xzh.view.controller.OrderController[方法]findOrderById');
INSERT INTO `h_syslog` VALUES ('a88c4cfe-0e73-4881-a7e4-9605e26a4c88', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '13', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a8a8e293-7976-4160-87b6-55fbe67ac9c5', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '19', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('a8b57225-715e-4284-958e-2235cdae11aa', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '6', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('a8b963bd-edf6-4287-9c75-279a8a6ac9b1', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('a8be3f1e-86a9-433a-9bd5-6984aff94405', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '427', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a8c36c9e-2d89-41f0-93f5-9803f5634d80', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '11', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('a8e7dfdc-de5f-4abb-8de4-9245b06f88aa', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/addMember', '14', '[类]com.xzh.view.controller.MemberController[方法]addMember');
INSERT INTO `h_syslog` VALUES ('a9304e9c-0925-4cbc-812c-39d2e320dce7', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '14', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a93c9a7d-397f-4d58-9f15-4199024bdd00', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '153', '[类]com.xzh.view.controller.RoleController[方法]edit');
INSERT INTO `h_syslog` VALUES ('a94493aa-98a1-4175-bc8f-3e47471ed1ba', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '10', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a94e9066-2cfe-43a4-9215-fe9a093fed93', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '27', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('a953a868-a95f-43e1-a0b4-e0af37cc2a59', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '7', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a99a2a8d-8cd4-4d18-b367-789fe5a107ef', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('a99f2f7b-5a61-4c7c-aac9-0c60f72db99c', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '38', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('a9ccb23f-dd97-45cd-960d-d27195da362e', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '13', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('a9e46ae7-4ce1-4129-a577-0f3329fe702e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('a9ee9d26-a47b-4220-bd69-97e3c4d98b38', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '298', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('aa3b6441-3af9-407b-995b-a3d271071d16', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '315', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('aa57893c-48aa-4b06-bde5-858c864bfd36', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('aa89dfa1-7b0d-435b-9a1c-76ff44701ad2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '8', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('aa9058b5-7d1b-45d6-a5c9-ab7406549171', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '20', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('aa9e1c1e-37e2-47dc-a4b4-d48a8ad69732', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '28', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('aac0bf44-8ed7-47e1-bd26-81883e7ba66c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/food/findAllSport', '43', '[类]com.xzh.view.controller.FoodController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('aacb6d78-6ee8-4ed9-b210-e05851026440', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '6', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('aad39074-ce13-409d-9624-e8f99f042618', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '11', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('aad6cd38-3d57-4c63-845e-0e3e31c4448e', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '10', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ab17e007-5c22-47aa-b8a6-a8b7a3d8273d', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '83', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('ab224bc8-981d-421b-a167-394b6bfd3363', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('ab2db215-e365-47ba-bb21-062168e5ca6a', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '18', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ab5c4692-8ec3-4460-99e0-9c136bf7f8b9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '5', '[类]com.xzh.view.controller.MemberController[方法]findHealthManager');
INSERT INTO `h_syslog` VALUES ('ab5d4dd1-db33-4fc3-9068-f2bc3a02ae6d', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/edit', '24', '[类]com.xzh.view.controller.SetmealController[方法]edit');
INSERT INTO `h_syslog` VALUES ('ab5ea2ca-ff53-499c-996d-c7d8908cf5d1', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '37', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('ab859ce7-5306-4d55-87ec-b48cdb3fe51c', 'health', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/food/findAllFood', '30', '[类]com.xzh.view.controller.FoodController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('abc02855-5c34-49d6-bf5b-25bf632c6cd6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '4', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('ac0363ec-411a-44d4-9806-2a0b5fc45ba0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('ac0c7f2b-15b1-4e68-b489-6af246684f62', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '273', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ac29ed93-0faa-4746-95b7-f6dbf69a96bf', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '647', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('ac60c1ce-d991-4fbe-9f25-164d1c1fa622', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '10', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ac7786aa-5aaf-4b37-af24-2cb51def85f0', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ac79c7a0-5480-4e34-a63e-52e272d3ae05', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ac83c340-a118-44d7-ad01-d860cef61466', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '7', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('ac8d422d-cbb9-484b-ba63-9bbe285e309d', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '8', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ac901c98-a23d-4998-90aa-0778783b112d', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '12', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('aca37d61-6bf4-4aaa-92cc-4c3332433bdd', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '6', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('acba6d5d-23b4-48fe-94f1-b91568e89d3d', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '50', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('acef32f0-2a25-4a12-b89e-a513f92fe562', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ad08aaa3-9898-441a-b654-3e960ae3b18e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '10', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('ad097eac-ffe6-4f87-96e4-89386386083c', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '101', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('ad11eaa2-78a9-40e7-981b-81580da29687', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('ad1757b1-66ad-48b0-8da3-aac3c8de0241', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '6', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('ad41e5e6-846f-4caf-aba6-7d69abd4a42e', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '316', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('ad4c01a6-6f2a-4edd-8b03-38de82a4f651', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('ad60ef15-2f0e-40a8-80d2-7a7f7a2747ef', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '14', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ad6a4b25-d8b5-4a86-8bcb-c239eb54ebf5', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/editMember', '13', '[类]com.xzh.view.controller.MemberController[方法]editMember');
INSERT INTO `h_syslog` VALUES ('ad85b306-14b4-4ea3-bed6-92d2a3d9f5ca', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '25', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ad8ac200-3f93-49ec-b281-952ed8ef93d0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '20', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('ad9768a1-5001-4b6b-9f0f-59141dcaaac8', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '13', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ad98980e-b0a5-403e-b831-c4d3ce6fb0a6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '6', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('ad9d9949-7223-40b8-9a11-7c897ab6c02e', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '75', '[类]com.xzh.view.controller.RoleController[方法]edit');
INSERT INTO `h_syslog` VALUES ('ad9f8d1c-68be-464c-8812-40c82e323944', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '11', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('add15c4d-8ec9-48e0-8fa4-95ba2e2c0d16', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '36', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('ade73191-8957-445c-a113-3821c68c63d7', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '8', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('adecf764-2b31-4b76-909b-d325980700d7', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('adff163b-fad0-461b-9c00-e47f6c112bf8', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '9', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('ae0ce084-b17b-4585-aa85-a5b578e1871f', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('ae0e9b70-8285-49cf-ba00-ac91c925047c', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '12', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ae10a3b0-8a57-445f-8749-8a81a087688d', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('ae251f86-62a0-4810-ad87-77936fd54784', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('ae2b279e-efe2-479a-bcc5-4c2d32615158', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '7', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('ae60d173-c5d6-415e-b22d-a902b9776bf5', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '8', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('aeb912d6-cc80-461d-81c6-e8685000f189', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '8', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('aebb3d64-accf-47af-bf4a-55ece2293e1f', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '14', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('aed643b7-00f2-4e19-84a7-e4d067970962', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '3', '[类]com.xzh.view.controller.UserController[方法]findAllRoles');
INSERT INTO `h_syslog` VALUES ('af20990f-0f2a-401b-8ea9-169790833974', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllFood', '10', '[类]com.xzh.view.controller.SportController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('af5c4533-d219-40ef-941a-c17d68217750', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '16', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('af626beb-bde7-4913-9fca-bc8403c60c93', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '8', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('af677372-7cf6-4397-87e3-d8cb09c5d4ef', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('af7604fb-585b-4286-81c1-2206f84151c4', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '29', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('afc033fa-7a73-47f8-bc54-71f28ba8692a', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '5', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('afc1fdbe-fd46-4fb1-b472-0631c965fa42', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('afc22dd8-a894-48c5-8a05-119dabae2861', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '8', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('afc5d679-d5ca-4cea-9c30-2a9a3bad104e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '', '9', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('afe6eb55-7c87-4429-a7ce-bd6618f87ea3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '23', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('aff19362-ad99-46d6-aad2-a68fa78ddf40', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/food/addFood', '11', '[类]com.xzh.view.controller.FoodController[方法]addFood');
INSERT INTO `h_syslog` VALUES ('aff9a9e7-619e-4edc-ba08-bd9b23bfdf33', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '34', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b01b6edf-2281-4197-8cf1-5a54bfefd57f', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('b030adf2-c2a3-4dc0-81ff-93d523709bf4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '7', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('b07f725b-6b27-4a59-ba0d-1daa172dae46', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '7', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('b0bdcdfa-375c-400f-8536-002d72d24001', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findFoodById', '4', '[类]com.xzh.view.controller.FoodController[方法]findFoodById');
INSERT INTO `h_syslog` VALUES ('b0e59400-fa4e-4bd5-a4eb-b7062ee031a8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '316', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('b0f4e1f6-790e-4561-ae80-6444632fa369', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '7', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('b1955c4e-7a61-4b07-b87f-abe7e1d920f1', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '27', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('b19ea857-1e4b-4eca-9d92-81023f3bcef3', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '64', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('b1cddaba-be33-4fcf-b149-7c064b1e07f4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('b1d0d8c6-befc-408d-a3a2-e513d204b23d', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '28', '[类]com.xzh.view.controller.UserController[方法]quit');
INSERT INTO `h_syslog` VALUES ('b1f35c88-7cee-44b0-a990-80071b7cd25a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '9', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('b1fcda2b-94c0-442c-b525-4e5c827e59e5', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '28', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('b20f0169-9d3c-4ef5-b6ff-45e7c72773ea', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '7', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b22dbe02-9506-4786-9bad-cdf8a655e6d7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/edit', '31', '[类]com.xzh.view.controller.CheckGroupController[方法]edit');
INSERT INTO `h_syslog` VALUES ('b2423ead-61f1-4d4f-93d9-8adc134402c4', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '6', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('b25e59d9-34b9-4de6-aada-5096ea1206c7', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '20', '[类]com.xzh.view.controller.UserController[方法]quit');
INSERT INTO `h_syslog` VALUES ('b260000e-1ccb-42f5-880c-b9ba0f1989a4', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '35', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b26ed243-a40b-491f-a56d-6efa095b9d4d', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '13', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b271ebe8-8e61-4500-8ec9-87758316298c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '6', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b273ff32-6e93-4482-9d99-43dc8e26f133', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '10', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('b28c3370-452f-4ef7-b0f4-77750023e7cc', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/add', '15', '[类]com.xzh.view.controller.AdviceController[方法]add');
INSERT INTO `h_syslog` VALUES ('b28fbb5d-25f2-4228-930a-b7d79041ad91', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '13', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b2968de9-f4f1-42d7-b065-0903730efd68', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '29', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('b29e0a62-0ce8-4d4d-8945-2d5268b3fad0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '22', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('b29fb6b4-b56b-4057-81ad-94121d72d5e1', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '', '8', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('b2ae9875-28b9-4214-9b3f-4d3dc4adf2dc', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '7', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('b2aea97f-c10c-4b1b-ab17-b9b1a67f89d8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '10', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b2c2c850-b181-4a22-98a1-85e254ab91c9', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '13', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('b2cf21f7-f915-48e9-8ec5-722c23505ce8', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '32', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('b2d0d60c-98a9-4a43-b327-454283f31010', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllFood', '4', '[类]com.xzh.view.controller.SportController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('b2d79640-1f04-4da6-b8e3-abb8ddcc7ed5', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b2e1e562-63ee-4920-b4d8-e01c24716af8', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/edit', '13', '[类]com.xzh.view.controller.FoodController[方法]edit');
INSERT INTO `h_syslog` VALUES ('b2eada3e-9693-46e8-b6d7-3a0565175e65', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/food/findAllSport', '13', '[类]com.xzh.view.controller.FoodController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('b2eb7b6d-d1a2-4e7f-b012-61b57c5a6d5c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckByStMealId/{setmealId}', '34', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckByStMealId');
INSERT INTO `h_syslog` VALUES ('b2fb03dc-bf73-449b-927d-fc28841069ce', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b31787c1-3bb2-4131-b5f0-ce5e9287851b', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/edit', '17', '[类]com.xzh.view.controller.FoodController[方法]edit');
INSERT INTO `h_syslog` VALUES ('b33c8100-cfe3-4cdb-b8bd-2493671d76b0', 'health3', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '23', '[类]com.xzh.view.controller.UserController[方法]quit');
INSERT INTO `h_syslog` VALUES ('b346ee42-17ef-4e81-a04a-409ae02b4249', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('b34da0af-ec6d-4692-ba95-62b1e28828d7', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '386', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('b3829155-03b2-46b3-a759-8d760efc3311', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '10', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b39476e1-9ca1-43ea-84e7-c6f7b5596478', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b3991528-20e3-430f-ab19-a6021398a101', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '8', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b3aa4b49-623d-4361-a1f3-0277757cc149', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '10', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b3f072e1-521a-4d89-89cc-acc539de5045', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('b3f2b190-799d-44db-8f85-c998a825012e', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAllSetmeal', '37', '[类]com.xzh.view.controller.SetmealController[方法]findAllSetmeal');
INSERT INTO `h_syslog` VALUES ('b40248a5-e961-4eaf-bdb4-19f2ad423eae', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b42191e9-2c05-445f-9147-05341b082a07', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('b43bbcfb-0fa0-4357-86b4-b4a707b47d00', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b47508c4-ace9-40c6-a9f1-9cacd7b708e0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('b47b6637-ad7b-40d7-b901-052dd3bb3190', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '80', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('b4d08f94-765a-470d-8a8a-fc14f8e690f8', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '10', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b4f2641e-fc89-415d-b484-1e357b010be7', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '91', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b4f79705-a3e1-40b8-a5d5-5d89240e13aa', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '47', '[类]com.xzh.view.controller.MenuController[方法]add');
INSERT INTO `h_syslog` VALUES ('b50d79db-c11a-412d-b8dd-f9ec48d1dcc1', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '13', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b55ede8a-fa9c-479d-b656-839a7ab06fa8', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '19', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('b5811d3c-ad18-4e04-be30-83f23334494c', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('b58254b8-9835-46ec-8f33-0fa61fc3fcf5', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '22', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b5825e8e-f5a6-401c-8129-74acff8b50eb', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '10', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('b5913d6f-c880-4ca8-830f-78e714a8f810', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('b59fd9b8-092b-4a9d-8891-5991e09d39ec', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '17', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b5b2c24a-672d-4739-a88b-e137ac47fc1e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '16', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b5c0fa3a-f3cf-43bb-9226-df27c4f7c15a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('b5c83d53-e462-4e6f-9030-0c77dcc40c61', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '7', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b5e53acb-d74c-4639-b6f9-d143a4e14002', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '7', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b5eeba0d-a24c-42f9-8724-1f03c5b8c5f8', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '17', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('b612dc23-9df6-4a44-8b35-21aa14c6e4e5', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '17', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b64e811c-105e-427b-91e5-6a5f8973dc06', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '6', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('b66d816a-5dd9-4f89-a406-3df77a4739e6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '17', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b670f7d7-4141-4b94-9334-4059a2e7db3d', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '15', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b68623a0-578b-4fa1-ad72-2a19f20de3a3', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '32', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b69d57ea-5be3-42cb-8ff2-81bda8026b75', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '18', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b69dd36e-a09e-4b97-a5f7-41196362b86b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '308', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('b6a71749-3b47-45f9-a7bc-cad5e2df5c03', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '26', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('b71e2716-6cc0-45c3-89ce-ee3678fd3e8b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '4', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b7283fd1-af90-41a0-8534-c68d23c2c54e', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '35', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('b780da98-1071-4f80-9d8e-285e4faee2fb', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('b786d2d7-468d-4fdb-8f4e-3097f7164a44', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/food/findAllSport', '44', '[类]com.xzh.view.controller.FoodController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('b78cc43d-d9d5-411a-b5b0-8297e82bbbc9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b78eb938-0b8c-4ad6-a56e-27d7d568f53e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '30', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b7aba237-294e-4bbb-9fe0-78c7c3e773fc', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '6', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b7aea80c-469e-4497-baf1-8f44d16f8acd', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '5', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('b7b7a528-ede9-49a6-8ea4-3931d575e4e8', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('b7e1d571-081b-4398-b13f-59b1c8b1c4b9', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('b85bb932-945c-4424-bdbb-17ec936a2f8b', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '16', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b85e930b-aec8-42ef-9794-a254295b4ab6', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b8812e6f-6389-4968-a8ef-73561bbdb1a6', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '14', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('b8966e37-b55b-4616-95b0-85eb5ead1fcd', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '4', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('b8b03892-a533-4cbd-90e8-4a68553b16ec', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('b8c6202f-68cc-4c88-a3ef-3d7fe39c77f7', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '419', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('b8c95748-8187-4db0-8be5-f3e8547c95c1', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '8', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b8d28241-6b3e-410a-8f61-8855a19a0a2a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '84', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('b8d6dc17-d3b4-496f-a923-b391c731fe0e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '20', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('b8fc8eb9-b1ca-4a4a-8400-45a91ee50bcb', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '94', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('b90f7f6b-bb8d-40e1-86b2-16e6a66f7e17', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '4', '[类]com.xzh.view.controller.UserController[方法]findAllRoles');
INSERT INTO `h_syslog` VALUES ('b926aec3-bdf1-450c-97fd-f26e8933748c', 'health', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '17', '[类]com.xzh.view.controller.UserController[方法]quit');
INSERT INTO `h_syslog` VALUES ('b94242e2-8fae-422d-adae-12e5416f4bce', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/delete', '8', '[类]com.xzh.view.controller.PermissionController[方法]delete');
INSERT INTO `h_syslog` VALUES ('b9829cc6-b499-4d5e-a6fe-f2bc55647800', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '10', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('b98a98f4-9efb-46ce-857b-a5e1ee7f34af', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '17', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b9a51890-88bd-4856-bc63-5d4dd81e7c2e', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '22', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b9ac3976-f0c5-444b-8dd5-db5c6772e5b6', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '10', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('b9b1ab39-719b-4605-86c4-91251b91bc37', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '5', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('b9c3764a-e295-40cd-805e-4d5258650199', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '79', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('b9e80f62-76bb-43cb-bbcf-67d7dfcbc75b', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '7', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('ba0281ee-cb1d-4456-ae02-441261e07241', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '7', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ba097d62-4485-4fcb-93bd-59eae898551d', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '22', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('ba256010-8b3a-4ece-a03e-53f25dd3a6e8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('ba2f531c-79e8-4eb1-92a3-2d310e4cb9ab', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '11', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ba390572-9643-4799-b0a4-e7a7c0dedc3a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '7', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ba696388-8eb4-4fdf-bbd4-85f28e5c289b', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('ba76c091-e923-4f59-9d40-444eb8d37ef4', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findRoleBymid', '16', '[类]com.xzh.view.controller.MenuController[方法]findRoleByRid');
INSERT INTO `h_syslog` VALUES ('baa7603c-4917-4964-bfb7-d4091fe50965', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '21', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('baaf4654-9796-40e1-a02e-78bf7fd919a9', 'admin', 'pighome', '2022-05-25', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '8', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('babf36ac-e908-45eb-b521-98de246b9d57', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '11', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('bb50e3a7-2c6d-4236-8fca-3f684dfb7563', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '8', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('bbc61a50-3b7d-482a-ba8d-775d70e4758e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/advice/add', '28', '[类]com.xzh.view.controller.AdviceController[方法]add');
INSERT INTO `h_syslog` VALUES ('bbcdad7f-4363-42e1-9a04-ef33f9d194fa', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '30', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('bbdbb94e-a88a-498e-a968-86d803c96070', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('bbdd60bc-2576-4248-9ae3-559164b9806f', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '39', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('bbe3489d-90ab-4b09-8a7e-88ec5cf7f5c3', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '112', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('bbebee54-44d4-42db-9e0d-53c065dfd1b4', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '17', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('bc04d5c7-c8ed-4704-9e8b-4697a83af0c1', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/orderupdateCheckReport/{orderId}', '24', '[类]com.xzh.view.controller.OrderController[方法]updateCheckReport');
INSERT INTO `h_syslog` VALUES ('bc08238d-c625-4e9a-86de-477c7d1c2d03', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '7', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('bc14a914-731c-4ee1-8627-62675cf285be', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '3', '[类]com.xzh.view.controller.UserController[方法]findAllRoles');
INSERT INTO `h_syslog` VALUES ('bc3900c9-9572-4bb9-9cfa-01bdafb07d62', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('bc61e87f-b3f4-4801-91d4-0c1d865a1061', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '15', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('bc774943-c153-4944-b8f1-97f86344ccd0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/delete', '8', '[类]com.xzh.view.controller.SportController[方法]delete');
INSERT INTO `h_syslog` VALUES ('bc92fba1-4c13-4f7d-bc46-d109631a0504', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '5', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('bc978279-8a50-468f-bfee-b7b4ec22e22f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '14', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('bcb061db-9061-426b-b1b9-8846163b1b46', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '17', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('bcbf909e-bb72-4ec6-a6d1-0de11b324a16', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '8', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('bcd52ce5-8074-4fa9-a659-97ff246060d5', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('bcd98036-142d-4880-a0d0-2ecc3c8f3e47', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '7', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('bce1bffa-bfe7-40bb-b261-522671506da3', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '34', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('bce1c03b-03b9-4621-813a-768dccd0475c', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('bce5f645-eb24-495d-9b65-19416ef1a21b', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('bcf9af4f-f104-4e9e-970a-ca7859f8a3a3', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('bd152fe8-bcda-4e61-916c-ca17de91e001', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('bd1678a3-e5f2-40ae-a1c7-c4043e26a176', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '12', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('bd1a2f65-597c-44df-a42a-528c32ba3d34', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('bd1befe9-c10a-4967-bfe0-9b401b838ddf', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('bd40ccbe-8014-4891-868d-58935dfc2718', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('bdc6eb47-4b58-47b7-bcb1-f78fc4f2e218', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('bdc97fd7-866e-486b-9b9d-270d4ff36016', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '10', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('bdf1e34b-d761-4f89-940e-2686673f034e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderupdateCheckReport/{orderId}', '18', '[类]com.xzh.view.controller.OrderController[方法]updateCheckReport');
INSERT INTO `h_syslog` VALUES ('be27a7dc-bbeb-4647-aa7c-2694e13c51f0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('be5a79fd-92ed-4212-b0af-9e1f3ba8ae64', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '15', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('be5ab8df-05ab-4c87-ba50-a8fb94bfad1a', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmealupload', '1189', '[类]com.xzh.view.controller.SetmealController[方法]upload');
INSERT INTO `h_syslog` VALUES ('be85cb6a-3452-475f-ab96-f46b1ffe2d88', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '21', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('bea8746a-c0e1-46a1-88ca-26b0c4c06326', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '7', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('bece6035-0d5f-464a-b3ba-b1fae63d8206', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '23', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('beddb456-be4e-42a7-99ec-53f63f14068f', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '21', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('bede88bd-3d6e-47c9-a32c-53d65e19b4b8', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '11', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('bf14ec16-0ced-4208-9d95-01da7ebe4ff4', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '17', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('bf16fdf5-f87e-47a7-b29e-461015eb7eed', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '15', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('bf27b9eb-f13f-40e7-a62b-388de8ae3ce0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('bf5e6194-691f-4154-8d48-b104024ec48d', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '13', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('bf6dd251-4866-4d02-920f-278c0a89a281', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/findSportById', '6', '[类]com.xzh.view.controller.SportController[方法]findSportById');
INSERT INTO `h_syslog` VALUES ('bf76b877-fa5d-4d3f-a4d1-119d839245c2', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '7', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('bf9117c4-92a0-4b91-8dd9-59f5ede32b9a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('bfccce66-955c-4a91-a603-b2eb9d012420', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '4', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('bfdedc3a-d1f9-40f1-9501-d4de85740677', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('c002c914-ec81-4b9c-981e-d9e87dd553a3', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('c0305af2-1b28-4d02-b2fe-95255bc31520', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '14', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('c0474478-4396-42b5-b38f-464aff4ee618', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '5', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('c04c4fd6-2013-44e5-84cf-fb365438cd38', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '16', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c05a4a04-adb3-4999-990d-3017ee79b7aa', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('c06a617b-3e9e-44a5-bf25-795538491c1c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '16', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c06bac7f-9505-4911-b46a-3e9a1be95a54', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '26', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('c07b99af-e81f-4849-af3b-f2f766c779cb', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c0ea1dfe-61b8-4efa-bfd8-1449eb88e858', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '11', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c11799ed-2910-48b8-84da-9c31408dadb0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c128f1e4-25c4-457e-92a4-548c5ecc1248', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '4', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('c1684beb-1834-4f9f-9653-c7d0ec17ecd3', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '4', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('c175f2e1-dc63-4e7c-b045-c2339e6808de', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '13', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c1840f48-a39a-4d65-97b4-336f6845b319', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '15', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('c1997d10-67c1-496e-8817-0289b1505fe5', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('c19d4a9f-82d7-4a3e-89c8-8518bc2f8e38', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '10', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c1c521e6-a43c-4c9f-ba06-f23e5c7a530c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '', '10', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('c206523a-bf41-471c-a930-34ca1912f8c9', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '5', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('c23a82a6-b3c7-40b6-9905-425ae437bdd4', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c24b3916-9f51-46d0-8bcf-f29e9cd060bc', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '26', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('c273d70c-8a19-414a-aff3-e1ec239ef464', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '12', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c278c030-260e-46e4-9f9c-8a9235ed9ba8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '4', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c2b3f075-8c45-4aa8-99d4-fc50092eceaf', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c2c8d500-6110-447b-9c43-c3f7219aa243', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '17', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('c2ed0851-0f58-4f73-b643-406f1a2a74c0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllFood', '10', '[类]com.xzh.view.controller.SportController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('c30bbaf5-519d-4ff2-85be-7bf72e4c4c6b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '16', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('c333f77c-ee72-4b1b-88ac-0e44d7751a66', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('c36680b3-6fe6-4371-a25c-2e6db4b7bbb7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '4', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c37c164e-78af-494d-bdef-8b57a25fb6b5', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '10', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('c3a34927-5d74-40c8-94f0-315d94ecafd0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '9', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('c3ab71bc-0bb1-481d-850f-f9c29a6a194a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('c3fc1e06-13d1-403a-8273-a1faaf3cc061', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '6', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c3ff39aa-9b2b-434b-bb86-1376fa3b3655', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '323', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('c3ffc16e-c0a3-429c-baf5-9b077ed10837', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('c41bd2cf-f524-4ec6-957f-c9e7b6e94bca', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('c43f77a1-625a-4d2c-b89a-bdabdfb2f877', 'health3', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('c4451418-8aca-45fc-8b4e-8819f7a41b26', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '7', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c45d6caa-8a9d-4929-ba14-a48fd8432d96', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '11', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('c45f3b42-e655-4c89-84f9-68f69600a9d4', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '18', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('c47921da-7ade-4365-ba9b-1bb30d3d4d7f', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '9', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('c47f45c9-5e00-437d-abe3-02773d6d457f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/food/findFoodById', '6', '[类]com.xzh.view.controller.FoodController[方法]findFoodById');
INSERT INTO `h_syslog` VALUES ('c4d31416-16a7-4c16-9d7c-10f38df87419', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/add', '31', '[类]com.xzh.view.controller.AdviceController[方法]add');
INSERT INTO `h_syslog` VALUES ('c4d47a15-ef0a-4404-ba7a-03ddf2d106bd', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '22', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('c4e9815d-f2ee-4786-bc2d-09fcb20727db', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('c5100743-bae9-4706-bd24-ad6af1763dd1', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '', '11', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('c539fdf8-e090-4006-b4aa-254094064c66', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '27', '[类]com.xzh.view.controller.MenuController[方法]add');
INSERT INTO `h_syslog` VALUES ('c555b0c3-47ce-49be-b721-53983e5546ef', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAllSetmeal', '8', '[类]com.xzh.view.controller.SetmealController[方法]findAllSetmeal');
INSERT INTO `h_syslog` VALUES ('c56b30b8-6157-4b6c-a8cf-956244fbb6e7', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '18', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('c57cdf23-bd15-4082-817b-70c9ff14815c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '16', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('c59978f4-d9da-4f27-a1c3-9922d6e0bfd2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c5f91a2c-857a-47c3-ad87-02855f85e1f3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '4', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c5fc7b3f-c4e5-45e2-af84-92789084f57c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '14', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('c633400d-f9cf-4b3a-85cd-4bff4887d3d4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('c6518736-52da-4876-9333-407f01195d42', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c6554f91-9936-4eab-a77c-0316954bad30', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '88', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c68b0c5a-2337-43b9-abd5-90cfd358ce64', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '4', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('c6a609dc-c519-4c6d-8712-85025bb2d04b', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '12', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c6a60eac-7716-42d9-a308-4300dbda1dc2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '8', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('c6a68f2a-8c17-4494-b3b9-148f0d9633f6', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '8', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('c6db33c8-0db3-4614-924d-982b58c156c4', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '328', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('c6e2f6a9-26ed-4c4a-a854-956d0955e77a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/food/findFoodById', '8', '[类]com.xzh.view.controller.FoodController[方法]findFoodById');
INSERT INTO `h_syslog` VALUES ('c718d430-2137-40eb-bc78-e788af489657', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '6', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c722e03f-f1fe-4d99-8bb8-1f921d82a5b9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c74ec7b6-ee70-4e42-aa2c-c5b738246bfe', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '376', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('c7762443-8a80-457a-8e0e-3d08b458d139', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/food/findAllSport', '5', '[类]com.xzh.view.controller.FoodController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('c7c2937a-2941-4753-ad37-8eddadf0c191', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('c7fae644-6422-4794-ace8-e2f748816b59', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c7fd80b9-f195-4aca-aa94-11653092c34d', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '5', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('c8017faa-9cc4-49cb-9f73-84e0b7b6ef02', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '6', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('c814a793-59af-47a2-9dd7-0afc6783c6f1', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('c8245feb-2641-40a9-867b-eb09aca9c01c', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '16', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c85bbd7c-6bd3-4392-829d-83b101395cc0', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '403', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('c881a909-8245-4517-ac1f-0b10aa83dee3', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '17', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c893ed5b-82fd-4fe3-af8f-0f83e1c89c33', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '22', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c8e81502-b3f9-4470-ab47-babff6f3ad0f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('c90d51d0-bbb7-47c2-82e3-f1cead609f64', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '20', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c93e3b2b-95df-42c0-b0b6-6604dc38bbc3', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('c93ffa07-6e9d-4a6e-815e-2f1c5a42d75d', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c96599e1-031b-4a36-9c6b-38578017e89e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '8', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('c97a36f2-41b2-4d41-954a-619ee3dd7fd5', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('c9abe2a3-2049-407f-9527-ceecdb651b04', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '19', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c9ad35f8-d261-46f9-9d88-044fe1b8bea1', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '20', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c9adc800-c2b3-439f-aa51-b8c3f9697a37', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '46', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('c9b9c7a9-f8e3-4a4b-8697-8981e692cb69', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '0', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('c9c125ef-704c-4a49-b1f2-e9580e82c1c9', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '4', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('c9e6002e-350f-4de7-88f5-d832c309f947', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('c9fed11c-19d9-4796-b392-41b1d4d4d1fd', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '301', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('ca33b670-a0b9-49e2-800d-b3b4b72df690', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '305', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('ca51b4e6-50be-488e-8446-1be6d4c12eea', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('ca84b4b4-3375-4ae0-84c2-40b7b63838aa', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '18', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ca889070-2614-471d-b005-518cf871659f', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '3', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('cb17fc2e-7841-4799-8cfc-207870bf581e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '7', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('cb2597e7-32ac-4c45-b3e1-d9cbe291ed7f', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '13', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('cb9b98d5-acc9-4318-b823-2874db9aa24a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('cbb4e17a-2c65-44cd-97db-bd894482d888', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '42', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('cbbd3b36-4750-4c89-b858-d5057ae6b42d', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/add', '29', '[类]com.xzh.view.controller.AdviceController[方法]add');
INSERT INTO `h_syslog` VALUES ('cbd1ef96-491c-4555-9590-c9c49bdf9022', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('cbe7bf8d-c0cd-4e37-9003-b60b4e0eefc7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '3', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('cc25e84c-b16b-469b-9550-3c09158b775e', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '10', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('cc2c05bf-5029-4bd3-b8b2-84d54ff37101', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '30', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('cc414b2d-428b-4545-9147-c5fa9d30f765', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '19', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('cc576c39-e548-47b5-be11-166d0d48102f', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '22', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('cc65536e-9d7e-48e3-9d60-5b69e95975cb', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '12', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('cc65f4b1-c9ae-410c-a33c-9233c0f77131', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '34', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('cc70209a-c495-493b-8995-85eadf03dde3', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '15', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('cca67e79-547c-4fd4-9278-bac30ab0dddc', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('ccaba0d4-b45f-4d9e-866f-12fff60fd434', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '5', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('ccc07bd1-3325-4682-a906-d16abe653b6d', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findCheckitemIdsByCheckgroupId', '4', '[类]com.xzh.view.controller.CheckGroupController[方法]findCheckitemIdsByCheckgroupId');
INSERT INTO `h_syslog` VALUES ('ccc9e964-7f01-477a-952d-936385e03235', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '4', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('ccff5b61-8c94-4ee6-a58c-70bfcf82e2c4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('cd07154c-108c-486c-967c-52a7069695b7', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '10', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('cd756e78-a9db-4bb4-9485-c87b780c4c14', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '17', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('cdb059ea-c64c-49cf-9016-79bdcd87fa49', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '7', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('cdeaa525-e2ce-4279-8fb8-61306ea68c3e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findCheckitemIdsByCheckgroupId', '6', '[类]com.xzh.view.controller.CheckGroupController[方法]findCheckitemIdsByCheckgroupId');
INSERT INTO `h_syslog` VALUES ('cdeeda60-f4dc-416f-879b-521e6a196a7f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '9', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('ce13ab6a-4cd1-4679-8074-d2ed71ae989f', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '12', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ce40f3e6-1c81-43cb-8dd3-c2cafad39735', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '28', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('ce79a7fc-7424-4c24-8d52-a9d572acdaf2', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '341', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('ce96fec5-b367-4f80-9e3b-ee398af48e48', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '6', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ce9ab603-c111-4c7a-91ab-515dfd502cdb', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '26', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('ce9b71a7-0787-4c97-8b2d-cb232a90b650', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '25', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('cec43243-6313-49d5-883c-a7286ddc0357', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '33', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('cec923db-4f34-471a-aaa6-bb7d99c05ce3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('ced2d44d-4e95-4c4b-966e-253ad5285c00', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '6', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('cedda181-febf-475c-b2b6-a28837bba00c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '75', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('cee8ea1f-d4b5-4930-b04c-f945bec5af82', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '0', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ceea32ac-1f0c-4f6b-89d1-4700935f9be8', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('ceeb0be2-6858-4eae-aa17-6dd638f2ef53', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('cefd6640-08e9-4773-bcb1-669d22f6b725', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '5', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('cf2beda2-0344-4e3c-aeb3-ba7ba5f84657', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '33', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('cf3d7c4b-ba0b-47dd-b539-18de62b470c0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '14', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('cf787b39-99df-421b-a224-0104f07c2c97', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '12', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('cf794d41-13c1-496d-9326-8b37d689785a', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/edit', '13', '[类]com.xzh.view.controller.FoodController[方法]edit');
INSERT INTO `h_syslog` VALUES ('cf8361df-87bb-441b-b69a-691bf577943b', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkitem/add', '20', '[类]com.xzh.view.controller.CheckitemController[方法]add');
INSERT INTO `h_syslog` VALUES ('cf931a6e-d7e0-43e1-b38a-351558b09db2', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '292', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('cf9c644b-123d-4dbc-8e3d-1744acc1ebc5', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('cfadd0ac-6e9f-475b-9ecd-262a029587f2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '', '10', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('cfd30f3b-31f6-4d43-a69b-91c1f29e4552', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '17', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('cfe5422a-5f6d-4517-995c-222b86b38fe7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '17', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('cff81353-682a-4ca1-85e4-1eee79faabd5', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('d014efef-7b11-4eca-81d3-4c90702677c0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '17', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d02713a4-7302-4b23-9f8c-14432d9d876e', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '10', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d02f1cf6-b7df-4ac0-a4f5-243bfed8893d', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('d03c1059-e5f2-4ca3-b2f2-5a2c715f45be', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '3', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('d05da0cc-6c6d-4906-963d-322569202bbf', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '4', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d0638e67-0178-4cb2-b092-0614bcf5c8d1', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '8', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d068a186-e5da-408c-905e-679d8ccb503a', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('d0cd29e2-f283-4b74-9035-17e6a90823ee', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d0e37ba9-407d-41df-bfa1-2f7b60fc3317', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/edit', '13', '[类]com.xzh.view.controller.CheckGroupController[方法]edit');
INSERT INTO `h_syslog` VALUES ('d0e71fd7-e3f3-468c-aec9-33a21c781e7f', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '14', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('d0eec38a-c07c-4ce6-84e3-b0cd906f7b2f', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '', '9', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('d0efde22-0543-48e8-994f-76d55341f5a8', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('d105c8ac-189f-4310-99e5-04c6aaa7fbd3', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '14', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d130d359-4374-40f0-9139-247c3b3cf1db', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '13', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('d131cda1-6ec9-4430-afa9-cf5b5bd1352c', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('d191f9fb-39f0-4d11-b22d-1f7cb4e34175', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findCheckitemIdsByCheckgroupId', '0', '[类]com.xzh.view.controller.CheckGroupController[方法]findCheckitemIdsByCheckgroupId');
INSERT INTO `h_syslog` VALUES ('d1dbf07f-edbb-4b6b-b980-705793d045a0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('d1ff8160-2cf8-4b54-9007-42f7c38f16da', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '17', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('d2025d40-4802-48fb-9645-63c1904af5fc', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/member/addMember', '12', '[类]com.xzh.view.controller.MemberController[方法]addMember');
INSERT INTO `h_syslog` VALUES ('d226af4e-841d-40aa-a73a-f4410a10287e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('d2380332-2408-4cc2-bd68-087a5a1e5325', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('d241de32-6f5f-4802-a52d-148d70713b46', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '18', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d24d7bc8-5876-4014-8fe2-43aed137a12c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '42', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('d25827ca-b58f-4d0d-bbae-6e95fad87969', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '48', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d27ee24f-3c52-4495-9d56-7cb9222c54d4', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '7', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d2be571b-2acb-4d81-837b-2b4c99f00dff', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '10', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('d2c8e3ec-db91-4b98-94aa-20793353296b', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '0', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('d2ec2fce-3404-48b0-bb02-03eb642244aa', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '7', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('d2edf425-246f-4913-be60-e01b50354e8f', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d309c9af-9adf-45a1-9af4-633368b0e0b0', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '68', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d30bdeea-40b6-4868-ab0b-d5bc3faceb3e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '31', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d30c1ee2-aebe-4bf7-b3ba-dea3ccd7f39d', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '0', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('d32ea660-5c46-44d4-8352-3e06dc11212d', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '13', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d361d3d1-77bb-441b-bf58-f5695ce558d1', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '16', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('d37160ea-e472-4694-b424-c909cd01c860', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '6', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d395f55a-72f0-4373-9cce-d36e2fb36081', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '6', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d3bff2ca-f68c-4cd7-92a7-82e55ad741e9', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '25', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('d3d9eaae-9dde-428b-9fb0-cc4920d70eef', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '30', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('d40df0ed-fe55-477d-8bb7-05b2d484c631', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '18', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d4100e58-4bd0-4fb0-b524-d2c97321563b', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '6', '[类]com.xzh.view.controller.RoleController[方法]findAllMenus');
INSERT INTO `h_syslog` VALUES ('d42ecf21-f869-468e-93e9-86a9928a2af3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('d433c26e-dc5f-4e8d-969d-2c9a71793263', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '20', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('d492aa21-4599-424c-95c6-fc0db4c8d857', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/sport/edit', '17', '[类]com.xzh.view.controller.SportController[方法]edit');
INSERT INTO `h_syslog` VALUES ('d4a77b1f-6c85-435f-95d1-33c7dae44963', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('d4f4a3e3-dccc-429b-8224-00e5d54b1dc4', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '4', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('d503c7ad-06c8-4606-b44a-a103daa628f5', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '64', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d50df30a-4913-45e2-9f15-dc5e17e82288', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '336', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('d5115a3f-ba61-4e24-ad69-5b121dadfeac', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '0', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('d52baae0-bd4e-4963-86a1-15c9514e5a4f', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '315', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('d57362f8-84d6-47a0-92c8-9c2b4549482d', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d574d642-ace2-4aab-a8b6-6d2ddd4fdd98', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '10', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('d5a68707-e7b4-460c-b0fa-9a6f34f83ad1', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('d5b15f79-20f8-42ec-8aeb-cfe561f77430', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '7', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('d5e9ebdb-0abf-4fc0-b1ce-33d112c0792b', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '0', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('d60dfbdc-4970-47db-9560-5a833202c84f', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d613e586-cfd9-4c03-9996-4ef974cc480f', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '15', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('d6149a10-150f-487f-a2de-bd600a0b27ff', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/editMember', '20', '[类]com.xzh.view.controller.MemberController[方法]editMember');
INSERT INTO `h_syslog` VALUES ('d628aacc-5397-45b5-b599-ce3874b7122e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '12', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('d6342e9d-4288-486b-9b45-bc2cc4da869f', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '6', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('d64be1d2-e93d-4418-93c2-6a59592a251b', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('d651465f-a487-4a7b-86cd-dbb2c419c45c', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '14', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('d6663b6e-c5ca-4316-bf8d-8a0ba2915098', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '34', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('d66a86a5-d6bb-44da-b49f-e90693ae0d89', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '4', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('d6993371-bfbe-43b8-9a1a-4c78fabf71a9', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/add', '107', '[类]com.xzh.view.controller.UserController[方法]add');
INSERT INTO `h_syslog` VALUES ('d6d09d8b-16e5-42a7-950d-a0cbee439e77', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('d6d85ad2-009a-4a0d-8343-d32347bc6bf3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('d6dc7339-43a1-4097-8cc7-ed81874516df', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '396', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('d6e12603-7c03-409b-ad0d-1ef7f9030bf4', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '12', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('d701bd00-68fc-4912-9878-8268b36dab15', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('d74ff04c-e924-4c7a-9de3-c00ce2645716', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '3', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d782b3b5-1e52-4e07-b00c-7319543bf406', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('d786281d-ad6d-4ce3-a551-eea91a8a984a', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '18', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('d78aeedb-c9d0-4a04-8ee1-051645b998db', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '2', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('d78e27b0-3f16-4c1c-8bb9-0eef13fd41c6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '17', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('d79cc86b-c4e2-48a4-bf8e-9f2b93f02777', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('d7dd6fb0-39d7-479e-9240-5626c2e39352', 'admin', 'pighome', '2022-05-25', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('d7e33132-735d-4211-9356-a0e03de99542', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('d7f5ef94-e91a-400f-8c02-dc533a33f554', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '17', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d8019058-7b20-4cb2-98eb-a1608bb0da20', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '12', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('d81dbe47-8cad-4344-949a-ad8d467cec00', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '17', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('d81e02eb-805f-4182-9468-8ea0c25b550a', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '314', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('d850ed09-20d2-4793-8882-482788eccd94', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('d8582a3c-8658-4eb4-9556-70ed2b297a5e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '9', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('d86a186c-5fbb-494f-95e1-92ae856ae9c2', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '8', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d871556d-055d-42e4-881e-2aeb6d7d0069', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('d88728e4-177c-44ac-83ae-51c1bec8898f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '5', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('d891da31-6f1e-4001-b6a4-3709b663ba96', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '7', '[类]com.xzh.view.controller.MenuController[方法]add');
INSERT INTO `h_syslog` VALUES ('d8ab4f5a-2765-45ba-8717-6dcc9be72ae4', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '12', '[类]com.xzh.view.controller.RoleController[方法]findAllMenus');
INSERT INTO `h_syslog` VALUES ('d8ac0445-1cdd-463b-b6e0-477fb8fcf052', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '10', '[类]com.xzh.view.controller.RoleController[方法]findAllPermission');
INSERT INTO `h_syslog` VALUES ('d8af3048-b440-47db-ae79-e80a2cee1708', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '7', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('d8d41c0b-f38b-44c2-ad89-f5e92dcb9ea9', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d8e51b35-ac16-498e-8544-dc5994a853d3', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '10', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('d8fa6042-33cc-4fc8-9256-d32683be55b8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/edit', '34', '[类]com.xzh.view.controller.CheckGroupController[方法]edit');
INSERT INTO `h_syslog` VALUES ('d92e3438-2085-4000-80ce-4ff1fac4acc2', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '5', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d92f1663-b41d-433f-a024-2dc264dfbfd0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '19', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('d95ea698-6cd3-40b0-b7ed-30af873ec68a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('d9684f15-6650-448c-9524-858a7a003ca9', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/edit', '28', '[类]com.xzh.view.controller.SetmealController[方法]edit');
INSERT INTO `h_syslog` VALUES ('d97f8330-b3d5-46f3-ab00-a4a9b148f526', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('d984acfe-1f5b-4622-9e4e-a4c6772c1ae4', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '27', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d98cc86f-51b5-40f5-abfd-a42283d8db69', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '7', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('d98e5290-5d39-4e8d-b572-a4c044b246f4', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '5', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('d9b4900d-e3da-4749-b21b-3e5b1cfc28e6', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('d9c5694b-e373-4c27-9124-771dd8381588', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '38', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('d9f620cd-53c1-4913-a450-6e70e85ddd6d', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/food/findAllFood', '32', '[类]com.xzh.view.controller.FoodController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('d9f7fe0e-ff1b-4f2e-9c55-820d20c9f6a5', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/edit', '30', '[类]com.xzh.view.controller.SetmealController[方法]edit');
INSERT INTO `h_syslog` VALUES ('da03076a-6a38-4444-bc0e-35ced53664b9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/add', '42', '[类]com.xzh.view.controller.SetmealController[方法]add');
INSERT INTO `h_syslog` VALUES ('da0d8fbb-83cc-4670-a746-f4c6e6b9d6f6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '5', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('da38ac79-8801-495f-8f41-113ae26b3626', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '7', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('da49cf31-ec1d-4740-92ad-e23b8d81b33a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('da7aa062-c797-45ab-be7f-a3840ff5c489', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '23', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('da8585be-0a14-4b38-b67f-be5fea1e3911', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('da92f4d1-acd3-4167-9bee-4fd657e4fe95', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '291', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('da92f9fe-8a6d-4721-afcd-8710690f854b', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '7', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('daa23039-8281-4a0e-9567-9a0af29f514a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('daa3b64e-547d-472a-a49b-01ef22812dad', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '5', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('dabf83f3-b8b1-438d-927c-c45abc78336a', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/setmealupload', '1815', '[类]com.xzh.view.controller.SetmealController[方法]upload');
INSERT INTO `h_syslog` VALUES ('dac7d04e-93a9-4a2e-9327-368f6272a78e', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '54', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('dae1dea8-bdc1-4e6e-a51f-fbc72cfbb021', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '46', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('daf9217f-297a-4307-8b20-ca2ecf961faf', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('db471327-8531-4c56-9513-c8eebdf76b29', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('db4af1f7-e957-4635-8547-77cd547c6fd9', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '33', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('db62f593-5360-46ff-81df-e099ecdf24ba', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '320', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('db99dc9d-5bd4-479a-8bbc-50c3a2cadabe', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '5', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('dba9b9d0-3071-49ed-b59c-2df3df83b348', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '31', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('dbc83546-4e25-4045-8475-b07d787bc7a4', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '11', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('dbd9ab9b-4bef-4532-8aaf-4b16b6266399', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '14', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('dbddad3b-595a-42ca-883e-05f1afad3aab', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '6', '[类]com.xzh.view.controller.MemberController[方法]findHealthManager');
INSERT INTO `h_syslog` VALUES ('dbf3a755-f68a-48a5-a8a0-86bc925803ee', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '8', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('dc01feb5-2f07-4e7b-8387-bb0ce3dc273f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '10', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('dc10360c-8dfd-42f7-addc-3c47a42469a2', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '13', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('dc74ba36-9aa7-4d96-bf18-d6fa5e9ec1f1', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '53', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('dc97210e-d519-44da-b392-cd691d9ab645', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '394', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('dcd015cd-7187-4c9e-9066-9e9fc67f4390', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('dce03c51-ea4c-485a-924a-40313fc062de', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('dcf210b0-9d19-4c0d-b546-65174ae009ea', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('dd39dce5-06a1-4259-bc6d-2de4f4d6c8c5', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('dd4ed65d-e6aa-41d5-ba47-67de6bf3cbf4', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('dd7fecc6-beaf-42da-9f84-1b3319ada342', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '3', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('dd81ef82-3282-47d7-a53a-9e835945a4a1', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '8', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('dd8bf4f5-16b0-452b-b66a-7913f1e8c0cc', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '9', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('dda0364e-3f76-4b35-9005-19d3eac20214', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('ddbf0381-a17f-4ec3-a722-ef764b27e992', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '32', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ddd525af-29e9-4d7c-ab5d-9a43e36131fd', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '140', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('ddf898a2-91d2-4981-af6d-c68ba8b116b6', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '391', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('de5f6e65-7145-4b34-97fa-1375c9b9daa0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '10', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('de93169d-7295-4ced-9437-5fd782b3f84c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('dea9cd61-67e7-4f12-ae52-3e8a97c1402a', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '7', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('deadfde2-3a50-458b-873c-7c66be460e3b', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('dedabf3c-75be-429b-8147-a0af26db5c65', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('df133425-02a3-4456-9610-3bc187e88da7', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '11', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('df3457f8-b348-48fe-97f8-32583686c8a1', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '13', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('df504f45-c3e0-4fc7-a6e5-7957e62fefea', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '8', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('df5a5371-dad6-4a3b-959a-850b2abe33cd', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/food/edit', '12', '[类]com.xzh.view.controller.FoodController[方法]edit');
INSERT INTO `h_syslog` VALUES ('df6539a4-a14d-4f70-9601-431d0074b92b', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '70', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('df7618a9-6c39-4c01-a555-83231b9f4bbf', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '6', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('df9d4ebc-fef4-43fc-b17b-a25342e7f13c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/add', '10', '[类]com.xzh.view.controller.AdviceController[方法]add');
INSERT INTO `h_syslog` VALUES ('dfab936e-8e4a-42a3-99c8-b3242d38f277', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '34', '[类]com.xzh.view.controller.AddressController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('dfada50f-6dbe-4d56-9204-84e2ded16849', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '6', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('dfdadaeb-7b7c-469d-9252-7ac14f2dcf96', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '9', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('dfeb3657-6324-4e41-942a-3fa158b8833f', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '11', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e014db35-cf3c-47b6-8671-4e7e0e32728d', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e0166620-1537-4b62-b364-e6df6f044737', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '15', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e02f9194-5d02-46a8-87f1-0d6d78cfbcfa', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '4', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('e0333cc0-8bf4-48fc-9cfd-c19eb6f1161c', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('e04feb81-e219-4307-9dc9-96786b57a221', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '8', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e0618d7f-2cca-4750-80a3-a540838cf44d', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/editOrderSettingByDate', '10', '[类]com.xzh.view.controller.OrderSettingController[方法]editOrderSettingByDate');
INSERT INTO `h_syslog` VALUES ('e0734102-1a60-4a8d-9450-f27764cbc8a4', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('e07f9631-c0d4-499e-9a5d-6e7edd7260d7', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '10', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e08f47d1-469c-4a71-ae48-e29dd6871d5a', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '4', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('e0966fb7-415a-43ab-b7db-e494b2f09ff0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '4', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('e0c8ed78-85bd-4c67-99d7-738c7c326c65', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '301', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('e0e70c89-58cd-4ce8-9af6-1d724a59ce7a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '22', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e0ebeb76-14f3-4805-93fa-713f3c547b4f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '8', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('e100b6e6-7263-4fb5-851d-254b920d09b5', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('e11daed0-76d3-4298-96a2-cd36b60e5e05', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('e1243075-e7a0-42d1-a425-3e091225beba', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '9', '[类]com.xzh.view.controller.MenuController[方法]add');
INSERT INTO `h_syslog` VALUES ('e12443d7-fe57-4aa3-9d26-5ee5003b8d59', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('e15fa6ad-d56d-496b-8a2d-976fa185f3f2', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/editOrderSettingByDate', '16', '[类]com.xzh.view.controller.OrderSettingController[方法]editOrderSettingByDate');
INSERT INTO `h_syslog` VALUES ('e1654d08-19b5-40f7-8679-77730e406c19', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '19', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('e176167a-0775-44a1-aac0-3238b8760484', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('e18071a0-df75-4931-a92e-5b137218ea25', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('e182a2f8-65d1-4dd8-85ee-e2dd718168d3', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '35', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('e19592db-9bc8-4ff2-a462-d044dbaa3ab9', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('e1ac4311-7795-4bba-8f06-cffd75d5ee4d', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '30', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('e1b0e842-0e3b-495d-99b9-a15c8d9aea57', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '297', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('e1b1a548-ad8c-4233-86c9-c958222a8507', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '23', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('e1c95728-4703-4f08-9522-ff087843f8cc', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('e1ca1ca3-6ea8-4e77-a1c4-0ac2fe411e4a', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '15', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e1daa4ef-ea27-4047-90da-8ec5672944da', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '17', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('e1f5f4a3-6cbf-4d12-bae7-f40e9f4c5ffe', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '8', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('e2073d5f-3ac0-47b4-af62-b5f017b3e079', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '5', '[类]com.xzh.view.controller.MemberController[方法]findHealthManager');
INSERT INTO `h_syslog` VALUES ('e21ef033-bb37-4bd8-b07a-4ad57148d419', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth/{date}', '10', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('e22dafd8-6a1e-44fa-b81e-f04abda8eb32', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e2382636-8812-4160-bfdb-afb3bda29344', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '11', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e262bef1-6cc9-4c0f-9f5c-7054cb7da9d8', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '24', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('e277cc77-88ad-4f61-9ffb-3846e5f12d4d', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '34', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('e28d6bf0-d81b-45d0-8556-ab428cfa320c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '4', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e2a98ab1-78b3-48b0-b87f-ae8518cdbf8f', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '6', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('e2bd11d3-7956-41bd-8c7e-99c58449e9e4', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '346', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('e2c483b5-c943-4108-a801-8d642e339a5c', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('e2da87e4-afd6-4dde-bcf3-74ad1fb9cbd0', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderupdateCheckReport/{orderId}', '12', '[类]com.xzh.view.controller.OrderController[方法]updateCheckReport');
INSERT INTO `h_syslog` VALUES ('e2dda060-9594-4f5c-af8f-0d1875618416', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '38', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('e2e994b0-456b-4763-ae71-73a94cd8d9e7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '307', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('e3056686-ca15-4d91-841a-cf4ed32f8112', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '10', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('e32a8145-537b-4d9e-a292-29491d508c5f', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '366', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('e32ff88c-763a-4159-912f-fe423d4c2c58', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('e335106e-e4ef-4d67-a52f-78f0ed4d4b9d', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e3849bc2-df7b-4830-b2ec-e6fefc5aebd4', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '5', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('e3915eaa-bdda-4fad-aafd-701b64d39f6a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/edit', '39', '[类]com.xzh.view.controller.SetmealController[方法]edit');
INSERT INTO `h_syslog` VALUES ('e3951323-5627-4bb8-9fc9-87aae85be8af', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '12', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('e39b346c-16b3-48a8-9541-92efe7a8ff50', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '18', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e39f8006-bd9b-4762-b7b8-1055ab117e16', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '23', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('e3b5f45e-0b88-4dd7-9560-10d036b064fb', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '16', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e3eca4a9-b0ee-4647-8fd6-80eb46858100', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '8', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('e3ece84a-68f1-4a8c-8dfb-47ac51134a12', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '293', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('e3f058e7-905a-4a17-8222-8a98072e7fd8', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '8', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e408d2cd-d0fe-4cd6-8e68-b22e1fdd8273', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '14', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('e412a411-af50-4053-83de-2362901c71db', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '18', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('e4260b79-a38a-4992-b64c-d786c5402842', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('e440185a-0fd2-4645-a7a4-f6fa4f3bb2a5', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('e440ce52-cc7b-49d6-9c5b-b479a3cb23b6', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderupdateCheckReport/{orderId}', '20', '[类]com.xzh.view.controller.OrderController[方法]updateCheckReport');
INSERT INTO `h_syslog` VALUES ('e443dedc-876e-443a-a0ca-612ec619d08c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('e448b426-e6ab-4315-8c67-feead7f04e4e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('e4704c09-e1fa-4696-b914-e705ac3c5bd9', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '6', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('e4728bc6-6c9f-4159-848d-a04b16da1aca', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '10', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('e47455fa-edf4-4ec5-be53-fe3543e50148', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '29', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('e47a91b1-e3f9-418d-b452-519df9571b1b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/editOrderSettingByDate', '7', '[类]com.xzh.view.controller.OrderSettingController[方法]editOrderSettingByDate');
INSERT INTO `h_syslog` VALUES ('e47cda77-6972-42d9-bb9d-d060903146f1', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '625', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('e48c47f2-b063-4b44-b25a-904151a2475a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '8', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e4b3ef19-ce27-494c-a0a1-77edbcc72ec4', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('e4f3bd90-bb90-436e-80ce-ae5f02e64792', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '404', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('e52104c2-c670-4278-b3f4-7701bcfc061b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('e56aaa1b-6259-4d84-8d17-7a55b6eabf2b', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/food/findAllFood', '24', '[类]com.xzh.view.controller.FoodController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('e56f6f0e-1807-498b-87a1-ed30b3a7c690', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '14', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('e5a95a08-d717-47f1-8ca4-9a4afe695804', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e5cafb75-a489-4e50-a1bf-c2555c39992b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '11', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('e5df4cfa-358c-415c-bb23-bf8a138dfba8', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '7', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('e5e5a2d2-4c10-4ff4-b3d9-e9d47d457909', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/editOrderSettingByDate', '12', '[类]com.xzh.view.controller.OrderSettingController[方法]editOrderSettingByDate');
INSERT INTO `h_syslog` VALUES ('e5fe75b8-1666-4d1c-ad7c-7f85d1437d34', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '6', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('e6181dfe-f590-4344-8ad0-31f2678b2462', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '16', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('e629c272-d861-4528-a144-8e0c487b25d2', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e62ac5f2-83bc-4677-8cba-f6ad01274a98', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '10', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('e63020e5-8a9a-4c48-9888-9f3bec3996df', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/menu/findRoleBymid', '9', '[类]com.xzh.view.controller.MenuController[方法]findRoleByRid');
INSERT INTO `h_syslog` VALUES ('e651deaf-5f49-4a89-9077-879f18443c9c', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '13', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e658daec-e29e-4886-a1ca-4006c0d7fba3', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '22', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e6636e3f-9dde-49f3-945d-7f564d03a911', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '17', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e6760147-3b33-49b4-932c-49188eae7f86', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '3', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e67f346c-7fa1-47f9-af41-ac219bfc4524', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAllSetmeal', '7', '[类]com.xzh.view.controller.SetmealController[方法]findAllSetmeal');
INSERT INTO `h_syslog` VALUES ('e695164a-1932-4b92-b873-4e920a413c27', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '10', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('e6bbc67d-ffee-4b01-9055-c405e6685903', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/delete', '11', '[类]com.xzh.view.controller.CheckGroupController[方法]delete');
INSERT INTO `h_syslog` VALUES ('e737a123-4ab3-489b-b751-d501b2420d94', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('e7baad80-2ff3-47c1-a85c-13aea95dab12', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '3', '[类]com.xzh.view.controller.UserController[方法]findAllRoles');
INSERT INTO `h_syslog` VALUES ('e7cc8fd2-6cc8-4653-afc3-b154563a6f3e', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '11', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('e7db7c94-ebd9-4d90-801b-b4007ad03ae5', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '65', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('e7dc60b9-9a6a-48f2-9669-0b95c211974c', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '10', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e7ed9e17-daab-496c-a2fd-91fe28de3674', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '80', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e824fc41-5914-498a-a644-379807e5d7eb', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderupdateCheckReport/{orderId}', '20', '[类]com.xzh.view.controller.OrderController[方法]updateCheckReport');
INSERT INTO `h_syslog` VALUES ('e8387501-e02b-49ee-ace1-2c648bba45b8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/add', '10', '[类]com.xzh.view.controller.AdviceController[方法]add');
INSERT INTO `h_syslog` VALUES ('e8391d07-f208-4e71-8943-80e63b7bed67', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '41', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('e8419f2b-9023-4d31-adc9-7e325ebdfae2', 'health', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('e84b5102-4ed7-41f1-be23-afd3c9867879', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckByStMealId/{setmealId}', '60', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckByStMealId');
INSERT INTO `h_syslog` VALUES ('e854ef12-c35e-490b-8bb3-07a23d1e9e21', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '4', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('e8584d7d-df79-4dfc-8782-99a02964de5e', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '14', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('e86244d9-5510-4a1e-8958-8e17b407f10c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '7', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e88a885e-69ad-45da-b586-be75056e9132', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '14', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e8946b6e-c35d-47af-866c-24615fb25d5b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('e8a78e93-590f-4b76-9164-c728d551b6e1', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '268', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('e8e649c2-ef24-4f18-b481-10d1f7b3a8ae', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '9', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e8fcbcf6-d68d-4404-a2d9-73a18cc8bf88', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '7', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e91123c8-aff9-468c-9545-31dc5efad751', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '16', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e92e66f1-f33f-4963-971f-d08f9854cd71', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('e932e1c8-b11b-4c3a-b6d8-7d02878725d7', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '11', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('e93416c1-7ca3-4d35-8127-ebe83360c4be', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '', '8', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('e94e296e-179c-4ae9-8b97-22dc60d4f17e', 'admin', 'pighome', '2022-05-25', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '30', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('e9834b60-8614-4d15-bf95-05a6e0c0334f', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '7', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e9870e7b-b787-4618-91f0-ad840c839afd', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e98c4afe-58c7-40d4-9e96-72fafcc0ee84', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '10', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e98ec38b-9ac4-4c2b-a568-1d8adfaf7c41', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '11', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e9a1b1a4-588c-44f2-aa84-6dcfcd051fbb', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '7', '[类]com.xzh.view.controller.UserController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('e9c4a246-cf67-4917-a2e7-d2eb1039eb36', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('e9d6aedd-acae-4259-bb29-e3b2069f8e94', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '6', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('e9dd3e7e-3673-4d88-ab3f-544d4e77606b', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('e9eff088-12b4-48a3-805c-183a6cfbdf4f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('e9f82490-5f05-4469-9573-301c95073d03', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '5', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('ea0185b4-5bfd-4ea2-9e25-b46bfe0128c4', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '11', '[类]com.xzh.view.controller.RoleController[方法]findAllPermission');
INSERT INTO `h_syslog` VALUES ('ea0ccd32-56e4-4b52-a885-18d1dac2eb3b', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '16', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('ea3cff47-085b-41b6-a315-c83b435a0d75', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('ea43f907-d1a3-4687-bf8d-2e66ca3b8f1c', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '6', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('ea4a50e1-86fe-4876-9c2e-4f26986b08f4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '13', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('ea5ffe3e-139a-4376-bc4d-91fa33c02121', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '6', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('ea614518-f790-4abc-aa21-795bc6f78a48', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('eadf4705-7d20-4047-95c3-e14b138bd122', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/food/findAllFood', '23', '[类]com.xzh.view.controller.FoodController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('eb198d4f-8966-4744-85e1-33d5e1cdaa47', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '6', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('eb53d41c-7dfe-422e-bd98-7e8ec26c70ce', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '4', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('eb691be7-0701-4e01-a3cc-07d9e78a6e5a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('eb77fa67-b4be-4019-a398-90b75f64bcc9', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('eb85252d-2af5-4174-8145-499f6f7b9acf', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '10', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('eb927019-bae1-4838-ab57-df23794d15c8', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '104', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('eb94d5c7-8df4-4bff-935f-feba7aaa3505', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '10', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ebaa158b-91ee-41f1-9e9c-3e220127bc84', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '4', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('ec0c0d3a-e208-4c1f-aae8-da648af1b2a0', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '31', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('ec0d30d6-c6c5-4a6f-96f1-de1fe82bef5e', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('ec1001b8-e428-4c60-b674-0eb01bd93cb9', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '43', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('ec10b688-6f94-421c-a6d8-86313f271586', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '27', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ec10e5fd-81c6-4139-a88b-33deb6f2cf9c', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '6', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('ec401258-c44e-48f7-82ec-616f76911d00', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '31', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ec416830-741a-40a3-afab-6e0a863f81b5', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '44', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('ec57e5ca-6f1d-4055-9c33-0847afddf059', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '20', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('ec63e631-9ebb-4248-a107-dcf58d1b7e73', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAllSetmeal', '4', '[类]com.xzh.view.controller.SetmealController[方法]findAllSetmeal');
INSERT INTO `h_syslog` VALUES ('ec867c2d-d8ac-4808-8a3e-d99137b33ace', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '26', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('ec90bf57-bc15-4f89-9fdc-143bb5b286bd', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '26', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ec92cc12-89fa-426e-b359-1e4e9aacb0d6', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('ec98af88-a24c-4dbf-9fec-8affdd8d20ec', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '21', '[类]com.xzh.view.controller.MenuController[方法]add');
INSERT INTO `h_syslog` VALUES ('ec9e6e32-a781-4b02-bbbd-36b0001d16de', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '5', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('eca3893d-8a19-4aae-b0de-9c1cb161f65d', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('eca73bb9-f8d1-4e10-82f3-0541a6525b9d', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/member/editMember', '18', '[类]com.xzh.view.controller.MemberController[方法]editMember');
INSERT INTO `h_syslog` VALUES ('ecb77040-d9c7-41d2-b438-3d5646b1b659', 'admin', 'pighome', '2022-05-25', NULL, '0:0:0:0:0:0:0:1', '', '16', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('ecc163d5-c3a2-4e38-9e17-cc8d8623f74e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('ecc26280-8e5d-4b58-b437-3a9ec75a3458', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '5', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('ecd4edd8-c1fc-493f-8c32-3287d5dfdf26', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('ece7bcee-ef7e-4eec-84a3-a2dc92848efb', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '19', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('ecfc41ab-1eff-4301-aa46-1316eec3e4c1', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '19', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('ed04fb56-e775-48f1-9309-0312692f5fe6', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '22', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('ed141ac9-be62-48e1-a545-097ffb59d855', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '59', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('ed55fa24-c031-4d08-99fb-d38377738b59', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '56', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ed68a7db-9775-4840-9419-53b702752fc6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '8', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('ed8a86fe-9a37-4cd2-ac7a-7fd1187f1aab', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '7', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('ed8d4506-77c4-4a1f-8e02-b241836e2e95', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '7', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('edb63ad0-dda7-465c-a3fc-b1a7fc3ce82b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '5', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('edbd27b9-55ab-4ef4-801b-5312f6a83ad0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '13', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('edcac54f-d24d-45d0-980d-41442d7c933f', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '35', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('edd7a06e-bfa4-442a-9949-b510992acaab', 'health', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('ede6c1b8-9043-43c3-9630-cafdb85c85a3', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('edf28013-487b-439f-bfde-12b5a3d085ac', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('edffdb1d-29d5-4a3f-a751-c589f9f60aa4', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '5', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('ee31d52a-b071-48ac-ad38-8acad8abd83c', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('ee4ae0c7-5521-4ba7-ad8c-8eb540d5ef69', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '11', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ee5a236c-bc19-45c0-a44f-27136eb0fdbf', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '56', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('ee5ba58e-8170-455e-9414-07f4bfb8f4c8', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('eea69383-6a67-4e79-9540-d610e702f7be', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '13', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('eeb5c7ae-fee0-44ed-9f20-f36b632264a5', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '10', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('eec1745a-db8d-4db6-aaf7-adf905dd781e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('eec95800-8d6e-455c-bf23-ff72ea75b880', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '6', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('eee0d708-8fb3-42eb-b3e0-4c18c53c681b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '351', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('eef42ed8-0693-4f21-a01a-5802dc42d9c4', 'admin', 'pighome', '2022-05-25', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '34', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('ef0a1a9d-f627-4ba4-9b07-bb426e43371a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findRoleByPmId', '20', '[类]com.xzh.view.controller.PermissionController[方法]findRoleByPmId');
INSERT INTO `h_syslog` VALUES ('ef43f5ff-5af8-4ae1-9d72-f6aaee5d46e0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('ef472d02-cfba-468c-9028-37d6885ffc4a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '16', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ef5a7f0f-1eb7-4990-a159-626c66c22e58', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '4', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('ef5f186a-98a4-48dc-9723-d1b50313508f', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '3', '[类]com.xzh.view.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `h_syslog` VALUES ('ef6544dd-422b-409d-9ec8-6ee454858d8b', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '9', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ef7420aa-0385-4005-8d8d-773848488327', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '62', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ef7e5291-d561-40d7-894c-c684fb5a5b01', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '58', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('efbed12f-938a-402c-b138-c9a92fa39ac0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('efcc1fc2-1a07-41d4-a905-de3600fab630', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('efd04009-185a-47c0-8329-3f7698cead50', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('efdb961e-4bae-4ca7-a6d2-0f2fbafaec74', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '5', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('efde3196-7101-4da9-9a3e-dfd6b78a1481', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('efed62ea-28ae-45b1-b93d-ba9d25c96337', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '15', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('f0227fd2-b1f8-4b82-860d-ed42d9c9b6d9', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('f030780d-eaa9-461f-94c5-3ddb95684252', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '31', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f035a4e8-c110-4eb5-bd9c-072e1cd97c29', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('f0428025-047d-463f-bf69-be3e62a7ad7a', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/add', '10', '[类]com.xzh.view.controller.CheckitemController[方法]add');
INSERT INTO `h_syslog` VALUES ('f0452562-f694-48a8-b1fd-71621d7a0d5b', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '72', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f0556e65-1b60-4dce-b0df-cec6d380db7a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '438', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('f059562f-3106-4b79-9c9e-035414a4dce0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('f05b8e01-a59f-45f0-bb2f-d301764f9baa', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '12', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f0b95057-ed90-4929-bfaf-087404333e9c', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/sport/findSportById', '7', '[类]com.xzh.view.controller.SportController[方法]findSportById');
INSERT INTO `h_syslog` VALUES ('f0c38503-edeb-4151-95ce-9c80f4ce8ecb', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '14', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('f0caca95-ce8f-4d7a-8482-b9ab00c73b69', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '23', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('f0d1833a-7034-42c1-83ef-a4ec91becbe0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '6', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f0f2769d-8c2a-47de-b93e-b8a7c0aaed3b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f13403f5-1798-4d9f-9db8-76719816f44a', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '5', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('f1481f92-7c0b-40da-934c-12971a0b431f', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '384', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('f1722f38-6a76-4d4c-a4e1-8749c54fe7cb', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('f17373ce-261b-40a0-895e-77b76d228dd3', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '29', '[类]com.xzh.view.controller.UserController[方法]edit');
INSERT INTO `h_syslog` VALUES ('f1c397a5-5637-4a3e-af61-903d23ff5233', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/addFood', '20', '[类]com.xzh.view.controller.FoodController[方法]addFood');
INSERT INTO `h_syslog` VALUES ('f1d9e24a-f8aa-458e-b5bb-5b57bd6a7d1e', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '19', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('f1f4f99f-d3ce-42e7-a238-364c4b85b927', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/edit', '18', '[类]com.xzh.view.controller.FoodController[方法]edit');
INSERT INTO `h_syslog` VALUES ('f1f97e37-3c78-4a7b-9198-a4b122efafd6', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '0', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('f205a256-f5ba-4c4c-aed0-8ff146f848c1', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('f21ff409-ee5d-4a8d-80b9-ef455b782ccc', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('f22858f6-db21-4e78-91df-3f3ddb99f628', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '22', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('f22decc9-83f5-4312-ba89-7eadc3d0dbec', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '33', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('f234e1a6-106c-4112-b0b1-71208dc76b47', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '5', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('f25f2620-99c8-4aef-aff3-ee34be8d4154', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '17', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f260eb69-912d-49b6-a11b-3347bb8cc57a', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '24', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('f27d94f6-b662-4409-99ea-b0c3e4770436', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f2c764cd-8e83-4df9-9ff8-8f93ea51bd5d', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '24', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f2cf0ce7-5ba1-4285-a9eb-4ef79cde6f68', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '8', '[类]com.xzh.view.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `h_syslog` VALUES ('f2fac8ce-248a-4d91-92bc-cc6a86740efe', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '29', '[类]com.xzh.view.controller.PermissionController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f2fbc5e4-5dd7-46a0-b053-27b835b44e49', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '7', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('f3031b95-0556-41a9-906c-4f2d831d4577', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '25', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('f3054ed4-31b6-40f2-a2d3-7b42c8ef8ca1', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '26', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f32091b6-01f6-474b-9f0d-8c42a250877c', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '0', '[类]com.xzh.view.controller.MenuController[方法]edit');
INSERT INTO `h_syslog` VALUES ('f326fe72-79c9-4fd2-9795-48ac42b5c2c7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '20', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f332e444-ae02-423b-ba62-e926152388c6', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '', '20', '[类]com.xzh.view.controller.BookingController[方法]statusEdit');
INSERT INTO `h_syslog` VALUES ('f365e0e6-1acd-4832-b390-4c071a3ffc82', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '24', '[类]com.xzh.view.controller.UserController[方法]quit');
INSERT INTO `h_syslog` VALUES ('f374c681-c340-4882-8590-57272f7bf541', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '8', '[类]com.xzh.view.controller.LogSpuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f37a4207-03d4-49f0-9d2b-b895bf100f6c', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '7', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('f38829e1-68ee-4e86-bb02-f20314b92aca', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f39d1242-512b-4379-8d96-635597a426b4', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage', '4', '[类]com.xzh.view.controller.CheckGroupController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f3cd47e0-477f-446a-a0cd-e89027338dba', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('f3da4fbd-2c86-4979-a4fa-1c48549c4016', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/findSportById', '4', '[类]com.xzh.view.controller.SportController[方法]findSportById');
INSERT INTO `h_syslog` VALUES ('f405978e-b376-4f9e-8980-9ac33c21bb08', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '24', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f423a58a-eec0-4d7e-b95f-16ecebd09ea5', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '4', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('f4781efc-b503-4514-9092-ccca07b9eb38', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '15', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('f4cece2d-4b53-42b2-af3a-4265a711ccec', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '22', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('f4cf12b2-7db6-443e-bcad-3b21e8e0f596', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f4e15a45-58dd-4522-b84e-9629119dadfd', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('f4ef8dbd-3435-41da-a515-e6e43da2d147', 'health', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/advice/add', '15', '[类]com.xzh.view.controller.AdviceController[方法]add');
INSERT INTO `h_syslog` VALUES ('f4fff47f-a1dd-48da-b708-8eb6aaefe81e', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '5', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f543262d-82a5-4754-8d9b-e8378ab71725', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '11', '[类]com.xzh.view.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `h_syslog` VALUES ('f5475457-b3be-4698-b657-c5e05eac0358', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '47', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('f5690f05-5b37-4c59-a5d6-6551f5e06e5a', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '8', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('f57c6ed6-d9be-4681-8c25-f8031900180e', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '8', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('f583ebf1-6297-4217-b8bb-95e3c1606399', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '8', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('f58baf87-d053-41e5-b6f1-620a4ad5e800', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '4', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('f5c6bc24-088d-4b5e-96c6-ac5b37e9f921', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '6', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('f5cb6af8-8bbb-43cf-9b6a-bb2d67657650', 'admin', 'pighome', '2022-05-25', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('f5ea73df-720f-4cfa-b5ea-b532b69c7b49', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '8', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('f5f4d6eb-915b-41f3-b982-b97e7ca37cb6', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '11', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f606b63e-40a9-4044-b858-5c7d2e645c77', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f609678d-4601-41ef-9806-be101aae079f', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '11', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f630440e-c0bf-45d5-9c8b-53a7cfb9c384', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('f6389a83-0452-49c9-9642-210d33360818', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '299', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('f645c12f-28a3-4d79-8f47-18457906b359', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '11', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f65d087c-101c-4fa9-9d70-4c3bba6a0fba', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('f65e0f21-8748-42fe-893b-9469057a2d24', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('f6706a6f-97d9-4f63-bba3-8fd4d1dc22b5', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('f6869a94-c285-4f31-98d4-f170a7e5bcff', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '10', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f68d93d4-5456-4f87-9cf3-1fdf0e4ffdc7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '5', '[类]com.xzh.view.controller.ReportController[方法]getSetmealReport');
INSERT INTO `h_syslog` VALUES ('f69e0a31-32b1-4632-b3bf-ec29e7d820ed', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '9', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f6ac47d6-fb6f-4ca2-95d7-ed7f647719dc', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '19', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('f6afbd7f-868c-411a-ab60-6f8207e3c9a8', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '4', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('f6c7dffa-3865-4c92-9f62-ada00353d28e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('f6dde914-ba9e-4747-9653-b6f8499178f0', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '13', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('f6e24d4e-92ee-40ec-a39f-5dfc583ffad4', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '13', '[类]com.xzh.view.controller.CheckitemController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('f704a838-269a-4176-b15e-64bd2079eac3', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('f7170ce5-8890-47e7-b2df-2f9d80aba6fb', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '5', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('f721dfd5-9320-46e3-9b1c-20d0dc50605e', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '16', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('f72f2a4a-b4ce-48bf-8924-e61da6e95778', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '33', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('f77adc50-69e6-436e-aeec-7b53f08986b0', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '7', '[类]com.xzh.view.controller.SportController[方法]findAllSport');
INSERT INTO `h_syslog` VALUES ('f787c144-cc04-4037-9b93-e05c80a6053c', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '8', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('f78b6eff-0ad6-44fe-919b-29af956d4d36', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '6', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('f7a5fee3-8304-43cb-8e7d-7a987ac994ef', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '3', '[类]com.xzh.view.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `h_syslog` VALUES ('f7be448d-20fd-4180-aa8c-0e60d27bebf7', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '15', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('f7e5033d-00da-4b00-9f34-090701683363', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '15', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('f7f90b99-245e-456b-8a7c-35fcfbc5a831', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '5', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('f8214fab-7028-4f21-bff8-3b8c647d1855', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '13', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('f823ad49-313a-460f-af61-3183cf98f557', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('f8841a00-3c32-4351-8a25-9e35e9b0f62b', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '10', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f88cbd6b-6965-433a-8a16-cae716fa2810', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '20', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('f88da8e3-f62d-4258-b12e-5fec76aad8e2', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '21', '[类]com.xzh.view.controller.UserController[方法]quit');
INSERT INTO `h_syslog` VALUES ('f8a593f0-aa5b-4d32-8099-b2ecfe74458b', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '15', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f8d6136b-47ba-4165-a962-2206e005972c', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f8ee548d-3e00-4903-a278-3befd52da06a', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '7', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f8f26b28-cfe7-4c46-bc23-16990c250c3f', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/edit', '5', '[类]com.xzh.view.controller.OrderController[方法]edit');
INSERT INTO `h_syslog` VALUES ('f912417e-f4d8-45a0-8416-c35743b0baea', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '5', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('f9450d64-c421-433c-8efc-1bb3824cbd81', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '50', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('f94ec06e-8287-45bf-a030-6d1c8a58dbb9', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '475', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('f96cc76a-41a5-41a8-9a66-b965cc413318', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '10', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('f9bf4c28-9c08-4888-8b45-a02ef464e32b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '5', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('f9cf7565-be96-4faa-8128-acef101403b4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/setmeal/delete', '63', '[类]com.xzh.view.controller.SetmealController[方法]delete');
INSERT INTO `h_syslog` VALUES ('f9d1fe07-fff9-49e1-b506-09306d74783e', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '6', '[类]com.xzh.view.controller.RoleController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('f9d62199-8d16-4787-91ad-203ce1e1a6c9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '12', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('f9eec68d-ae91-4c28-bc4c-a7d5caf9fc9b', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('fa31041c-de6d-4290-95ba-40c6c0f96883', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findById', '6', '[类]com.xzh.view.controller.CheckGroupController[方法]findById');
INSERT INTO `h_syslog` VALUES ('fa466416-b203-4dc0-a97c-d9c760458fdc', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '4', '[类]com.xzh.view.controller.MemberController[方法]findHealthManager');
INSERT INTO `h_syslog` VALUES ('fa4f4c8a-fe85-471f-9807-8f546206fad9', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '5', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('fa582f8b-f6e1-4d5f-8cd5-8fc84ef17028', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '63', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('fa62713b-b58f-46e4-93ff-664d1c4ee4e2', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('fa7778f4-c127-4877-b3e9-7b92cbbeea10', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '4', '[类]com.xzh.view.controller.SetmealController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('fa792663-25ca-4ebe-b87c-be20a3fd94ab', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('fa792fb0-d301-4bb6-8009-26e7e9177b17', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '96', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('fa94d93f-2e40-49cc-b785-6a2dca181ce0', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '16', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('fabb0ac0-51bb-4c9c-a988-58a45f10a9e5', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '666', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('fabf9335-3e9e-429c-8c15-c3f1fb08bd68', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/food/findAllFood', '19', '[类]com.xzh.view.controller.FoodController[方法]findAllFood');
INSERT INTO `h_syslog` VALUES ('fb1476c7-432e-4788-aa7a-c22778b122c9', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '19', '[类]com.xzh.view.controller.MemberController[方法]deleteMember');
INSERT INTO `h_syslog` VALUES ('fb39b150-e828-4cc3-9fb5-680c24b1e0cd', 'health', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '44', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('fb41545f-9d16-4492-aef1-cf2a5ab3b675', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '37', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('fb5e878b-ef96-4d78-b0e2-b45e3df919ed', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '10', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('fb7dade6-8a41-4aec-a69b-5a3cd45362e7', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '6', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('fb9feba7-e461-4f5b-b79d-6f6ab69f2ba8', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '6', '[类]com.xzh.view.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `h_syslog` VALUES ('fbb288eb-aba6-49ef-b1ac-27a10b668a4e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '8', '[类]com.xzh.view.controller.OrderController[方法]delete');
INSERT INTO `h_syslog` VALUES ('fbc07f61-62e1-4304-bc8a-7601274faae9', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '5', '[类]com.xzh.view.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `h_syslog` VALUES ('fbe49a19-a4f2-425e-8170-c5fa9fab5647', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '377', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('fc06d512-ab90-439e-b3ce-e343057e5e83', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('fc08eb52-979a-4eab-95a1-6d7ec6d86408', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '4', '[类]com.xzh.view.controller.CheckGroupController[方法]findAll');
INSERT INTO `h_syslog` VALUES ('fc23ab8f-b1c4-477c-a490-380c11d2e196', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberReport', '42', '[类]com.xzh.view.controller.ReportController[方法]getMemberReport');
INSERT INTO `h_syslog` VALUES ('fc80f1db-28a9-407b-b0ae-ad407c52ec1f', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindAllCheckBySetMealId/{setmealId}', '30', '[类]com.xzh.view.controller.OrderController[方法]findAllCheckBySetMealId');
INSERT INTO `h_syslog` VALUES ('fc966a56-e63d-4040-acca-1970225e794e', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '7', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('fcc17311-a272-490d-955d-ad5991e64d95', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('fcf66210-de7d-4084-bf97-37aa5e10567d', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage', '48', '[类]com.xzh.view.controller.CheckitemController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('fcfe8056-767b-4ecb-95d9-ae94963b2762', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '8', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('fd01372d-3774-4677-8873-e449a4ad2cae', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '5', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('fd670dfd-332b-4a5c-a0e3-8269bfd313ae', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '6', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('fd7f0054-074d-461a-a846-ba4313096ec4', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findSetmealIdsByOrderId', '10', '[类]com.xzh.view.controller.OrderController[方法]findSetmealIdsByOrderId');
INSERT INTO `h_syslog` VALUES ('fd886db1-7b0d-4745-a3f1-f0903588d561', 'admin', 'pighome', '2022-05-30', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '7', '[类]com.xzh.view.controller.SportController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('fd978adf-710c-4afc-b96d-e8d0dc9f6ec6', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '6', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('fd9bcea7-77a9-4866-8adc-094093c7d181', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '5', '[类]com.xzh.view.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `h_syslog` VALUES ('fdb15685-191c-47d8-a1e6-7d2fded205c3', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '0', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('fdb1de05-ccea-4d0c-9786-286a7c9c4e4e', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '5', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('fdd8d8f6-744d-4fe9-b38b-8c6a5e59301e', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '5', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('fdebe9fc-90ae-47c3-a1ec-25c5bbd2c5d9', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('fe1b395c-3ebf-4506-9b65-1d82c221b4d6', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '22', '[类]com.xzh.view.controller.MenuController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('fe2789a7-70cf-4903-bd30-74deec5587e8', 'admin', 'pighome', '2022-05-20', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '7', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('fe297171-ae48-44ce-a6d8-624511933a29', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '71', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('fe41f6f0-4d31-44f4-abef-0b9cee25194e', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '5', '[类]com.xzh.view.controller.UserController[方法]getAllMenus');
INSERT INTO `h_syslog` VALUES ('fe623650-9c49-4e1b-aa47-5275c40b8394', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '11', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('feb2ff0c-d36c-4ceb-b41b-b9bcbdedc1de', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '300', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('fee48757-2eb5-401b-914f-bccf38d940d7', 'admin', 'pighome', '2022-05-18', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '442', '[类]com.xzh.view.controller.MenuController[方法]findAllMenu');
INSERT INTO `h_syslog` VALUES ('fef785d4-8865-4ac0-b598-baed5345b75b', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '8', '[类]com.xzh.view.controller.FoodController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ff2380d6-dfeb-4cca-82b1-a168e58a81ec', 'admin', 'pighome', '2022-06-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '10', '[类]com.xzh.view.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `h_syslog` VALUES ('ff459e35-026f-4c5b-9a07-45a168f91f3f', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ff99b63a-d761-4181-89fb-308e238f0662', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.xzh.view.controller.UserController[方法]getUsername');
INSERT INTO `h_syslog` VALUES ('ff9d035d-bb89-4271-9832-5585bb1e5869', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '6', '[类]com.xzh.view.controller.RoleController[方法]findAllMenus');
INSERT INTO `h_syslog` VALUES ('ffa15254-a028-40bc-89ab-64a8ea242a56', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '5', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('ffb14261-f617-4c25-81bd-933b773af25d', 'admin', 'pighome', '2022-05-31', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '4', '[类]com.xzh.view.controller.MemberController[方法]findMemberById');
INSERT INTO `h_syslog` VALUES ('ffcf0b3a-f7b1-4e25-9f47-da9a48263630', 'admin', 'pighome', '2022-05-19', NULL, '0:0:0:0:0:0:0:1', '/orderfindCheckReportByOrderId/{orderId}', '6', '[类]com.xzh.view.controller.OrderController[方法]findCheckReportByOrderId');
INSERT INTO `h_syslog` VALUES ('ffd1fc84-9030-4856-a472-05ab5dc6f520', 'admin', 'pighome', '2022-05-29', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/add', '14', '[类]com.xzh.view.controller.CheckGroupController[方法]add');
INSERT INTO `h_syslog` VALUES ('fff521d1-d2a2-42e8-9a30-f70ff4d71708', 'admin', 'pighome', '2022-06-01', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '12', '[类]com.xzh.view.controller.MemberController[方法]findPage');
INSERT INTO `h_syslog` VALUES ('ffffbb62-0d13-4e94-a97f-d7e3512e042d', 'admin', 'pighome', '2022-05-24', NULL, '0:0:0:0:0:0:0:1', '/setmeal/edit', '32', '[类]com.xzh.view.controller.SetmealController[方法]edit');

-- ----------------------------
-- Table structure for h_user
-- ----------------------------
DROP TABLE IF EXISTS `h_user`;
CREATE TABLE `h_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `station` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_user
-- ----------------------------
INSERT INTO `h_user` VALUES (1, 'admin', '$2a$10$lya0nknIY2Ms3ZeUM.rnc.Q2s7R6Eb0FGgmDqFIyfnIOaR88yOlm2', '18342986091', '0', '2000-09-29', NULL, '1');
INSERT INTO `h_user` VALUES (18, 'health', '$2a$10$wNOSATCKFA.L36v6iPyGbe7mCE37fK2zQg8gX5uEmQQsrolJzRfkO', '18342986091', '0', '2022-05-03', NULL, '0');
INSERT INTO `h_user` VALUES (19, 'health2', '$2a$10$CYS.bHWWwglpt20pZpC8z.PoLWOW0wrXNTxAtY4GN3Ad.ctKCLKBq', '18342986093', '0', '2022-05-01', NULL, NULL);
INSERT INTO `h_user` VALUES (20, 'health3', '$2a$10$jjy7lDPZ5Uts90xp42Tz5.gZFuFGkfQOQyyRXoX4J3HuE8NZuHUIG', '18342986094', '1', '2017-05-14', NULL, '0');

-- ----------------------------
-- Table structure for h_user_role
-- ----------------------------
DROP TABLE IF EXISTS `h_user_role`;
CREATE TABLE `h_user_role`  (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FK_Reference_8`(`role_id`) USING BTREE,
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`user_id`) REFERENCES `h_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`role_id`) REFERENCES `h_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of h_user_role
-- ----------------------------
INSERT INTO `h_user_role` VALUES (1, 1);
INSERT INTO `h_user_role` VALUES (1, 23);
INSERT INTO `h_user_role` VALUES (18, 23);
INSERT INTO `h_user_role` VALUES (19, 23);
INSERT INTO `h_user_role` VALUES (20, 23);

SET FOREIGN_KEY_CHECKS = 1;
