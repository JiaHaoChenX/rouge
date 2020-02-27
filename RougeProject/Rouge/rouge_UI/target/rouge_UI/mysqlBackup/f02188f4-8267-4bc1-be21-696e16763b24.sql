-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: rouge
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account` (
  `aid` varchar(20) NOT NULL COMMENT '账号',
  `apassword` varchar(260) NOT NULL COMMENT '密码',
  `atid` int(11) NOT NULL COMMENT '账号类型编号',
  `astatic` int(11) NOT NULL DEFAULT '1' COMMENT '0代表冻结�?1代表活跃',
  PRIMARY KEY (`aid`),
  KEY `atid` (`atid`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`atid`) REFERENCES `accounttype` (`atid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('admin','21232f297a57a5a743894a0e4a801fc3',1000,1),('chenduxiu','e1671797c52e15f763380b45e841ec32',1002,0),('chenjiahao','fc2e7b296b15f7df388a7f0d3303808c',1002,1),('chord','c2ba5900473ce33669f377ce47794cc7',1001,1),('jack','b2f5ff47436671b6e533d8dc3614845d',1002,1),('lisi','92eb5ffee6ae2fec3ad71c777531578f',1002,1),('niubihh','867d306be4f9f84cca3f5e2713eb1f52',1001,1),('rows','8277e0910d750195b448797616e091ad',1002,0),('tianqi','e1671797c52e15f763380b45e841ec32',1002,0),('tom','2510c39011c5be704182423e3a695e91',1002,1),('wanfugui','8277e0910d750195b448797616e091ad',1002,0),('wanwu','4a8a08f09d37b73795649038408b5f33',1002,1),('zhangshang','0cc175b9c0f1b6a831c399e269772661',1002,1),('zhaoliu','8277e0910d750195b448797616e091ad',1002,0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounttype`
--

DROP TABLE IF EXISTS `accounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accounttype` (
  `atid` int(11) NOT NULL AUTO_INCREMENT COMMENT '账号类型编号',
  `atname` varchar(20) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`atid`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounttype`
--

LOCK TABLES `accounttype` WRITE;
/*!40000 ALTER TABLE `accounttype` DISABLE KEYS */;
INSERT INTO `accounttype` VALUES (1000,'管理�?'),(1001,'会员用户'),(1002,'普�?�用�?');
/*!40000 ALTER TABLE `accounttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup`
--

DROP TABLE IF EXISTS `backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `backup` (
  `backupid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `backupidname` varchar(200) NOT NULL COMMENT '备份名称',
  `refundTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '备份时间',
  `Remarks` varchar(600) NOT NULL COMMENT '备注',
  PRIMARY KEY (`backupid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup`
--

LOCK TABLES `backup` WRITE;
/*!40000 ALTER TABLE `backup` DISABLE KEYS */;
INSERT INTO `backup` VALUES (1,'f02188f4-8267-4bc1-be21-696e16763b24','2019-01-11 01:14:07','');
/*!40000 ALTER TABLE `backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collect`
--

DROP TABLE IF EXISTS `collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `collect` (
  `collectid` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏编号',
  `aid` varchar(20) NOT NULL COMMENT '关联账号',
  `comid` int(11) NOT NULL COMMENT '关联商品',
  PRIMARY KEY (`collectid`),
  KEY `aid` (`aid`),
  KEY `comid` (`comid`),
  CONSTRAINT `collect_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `account` (`aid`),
  CONSTRAINT `collect_ibfk_2` FOREIGN KEY (`comid`) REFERENCES `commodity` (`comid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comcolor`
--

DROP TABLE IF EXISTS `comcolor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comcolor` (
  `comcolorid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `comid` int(11) NOT NULL COMMENT '关联商品编号',
  `color` varchar(100) NOT NULL COMMENT '颜色',
  PRIMARY KEY (`comcolorid`),
  KEY `comid` (`comid`),
  CONSTRAINT `comcolor_ibfk_1` FOREIGN KEY (`comid`) REFERENCES `commodity` (`comid`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comcolor`
--

LOCK TABLES `comcolor` WRITE;
/*!40000 ALTER TABLE `comcolor` DISABLE KEYS */;
INSERT INTO `comcolor` VALUES (1,1000,'#FF739B'),(2,1000,'#FF2446'),(3,1000,'#FF7A14'),(4,1000,'#FF1C4D'),(5,1001,'#F08885'),(6,1001,'#F0800'),(7,1001,'#F08995'),(8,1001,'#F0900'),(9,1002,'#FADCDC'),(10,1003,'#F28F9B'),(11,1003,'#D17A6F'),(12,1003,'#F07C6E'),(13,1003,'#EF7771'),(14,1004,'#FF739B'),(15,1004,'#FF2446'),(16,1004,'#FF7A14'),(17,1004,'#FF1C4D'),(18,1005,'#F08885'),(19,1005,'#F0800'),(20,1005,'#F08995'),(21,1005,'#F0900'),(22,1006,'#FADCDC'),(23,1007,'#F28F9B'),(24,1007,'#D17A6F'),(25,1007,'#F07C6E'),(26,1007,'#EF7771'),(27,1008,'#FF739B'),(28,1008,'#FF2446'),(29,1008,'#FF7A14'),(30,1008,'#FF1C4D'),(31,1009,'#F08885'),(32,1009,'#F0800'),(33,1009,'#F08995'),(34,1009,'#F0900'),(35,1010,'#FADCDC'),(36,1011,'#F28F9B'),(37,1011,'#D17A6F'),(38,1011,'#F07C6E'),(39,1011,'#EF7771'),(40,1012,'#FF739B'),(41,1012,'#FF2446'),(42,1012,'#FF7A14'),(43,1012,'#FF1C4D'),(44,1013,'#F08885'),(45,1013,'#F0800'),(46,1013,'#F08995'),(47,1013,'#F0900'),(48,1014,'#FADCDC'),(49,1014,'#F28F9B'),(50,1014,'#D17A6F'),(51,1014,'#F07C6E'),(52,1014,'#EF7771'),(53,1015,'#FF739B'),(54,1015,'#FF2446'),(55,1015,'#FF7A14'),(56,1015,'#FF1C4D'),(57,1016,'#F08885'),(58,1016,'#F0800'),(59,1016,'#F08995'),(60,1016,'#F0900'),(61,1017,'#FADCDC'),(62,1018,'#F28F9B'),(63,1018,'#D17A6F'),(64,1018,'#F07C6E'),(65,1018,'#EF7771'),(66,1019,'#FF739B'),(67,1019,'#FF2446'),(68,1019,'#FF7A14'),(69,1019,'#FF1C4D'),(70,1020,'#FF739B'),(71,1020,'#FF2446'),(72,1020,'#FF7A14'),(73,1020,'#FF1C4D'),(74,1021,'#DFB5A0'),(75,1021,'#E3BCA1'),(76,1021,'#DCB5A9'),(77,1021,'#CD9E84'),(78,1022,'#E7D6CA'),(79,1021,'#FF739B'),(80,1021,'#FF2446'),(81,1021,'#FF7A14'),(82,1021,'#FF1C4D'),(83,1022,'#DFB5A0'),(84,1022,'#E3BCA1'),(85,1022,'#DCB5A9'),(86,1022,'#CD9E84'),(87,1023,'#FF739B'),(88,1023,'#FF2446'),(89,1023,'#FF7A14'),(90,1023,'#FF1C4D'),(91,1024,'#DFB5A0'),(92,1024,'#E3BCA1'),(93,1024,'#DCB5A9'),(94,1024,'#CD9E84'),(95,1025,'#E7D6CA'),(96,1026,'#DFB5A0'),(97,1026,'#E3BCA1'),(98,1026,'#DCB5A9'),(99,1026,'#CD9E84'),(100,1027,'#FF739B'),(101,1027,'#FF2446'),(102,1027,'#FF7A14'),(103,1027,'#FF1C4D'),(104,1028,'#DFB5A0'),(105,1028,'#E3BCA1'),(106,1028,'#DCB5A9'),(107,1028,'#CD9E84'),(108,1029,'#E7D6CA'),(109,1030,'#FF739B'),(110,1030,'#FF2446'),(111,1030,'#FF7A14'),(112,1030,'#FF1C4D'),(113,1031,'#DFB5A0'),(114,1031,'#E3BCA1'),(115,1031,'#DCB5A9'),(116,1031,'#CD9E84');
/*!40000 ALTER TABLE `comcolor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comdescribe`
--

DROP TABLE IF EXISTS `comdescribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comdescribe` (
  `comdescribeid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `comid` int(11) NOT NULL COMMENT '关联商品编号',
  `img` varchar(600) NOT NULL COMMENT '图片',
  `video` varchar(600) NOT NULL COMMENT '视频',
  `proposal` varchar(600) NOT NULL COMMENT '建议上妆',
  `formula` varchar(600) NOT NULL COMMENT '配方',
  `diyparam` varchar(1000) NOT NULL COMMENT '自定义描�?',
  PRIMARY KEY (`comdescribeid`),
  KEY `comid` (`comid`),
  CONSTRAINT `comdescribe_ibfk_1` FOREIGN KEY (`comid`) REFERENCES `commodity` (`comid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comdescribe`
--

LOCK TABLES `comdescribe` WRITE;
/*!40000 ALTER TABLE `comdescribe` DISABLE KEYS */;
INSERT INTO `comdescribe` VALUES (1,1000,'../../comdescribe_img/a1.png','../../comdescribe_Mp4/a1.mp4','�?系列高订唇膏色彩呈现舒悦而诱惑的缎光感妆效�??','四款高订色彩，大胆的时尚宣言：四款高订色彩，充满惊喜。一个充满前卫高订色彩的精粹系列，�?�让您尽情感受拍摄时尚大片的兴奋，大胆与前卫。Rouge烈艳蓝金唇膏的舒悦配方，无论是哑光感还是缎光感妆效，为您带来舒悦享受及色彩�?�加入特别�?�护唇�?�成分组合，滋润、持妆�??','{\"english\":\"凝脂恒久气垫粉底\",\"describe\":\"Rouge首款锁妆气垫\",\"weight\":\"3\"}'),(2,1001,'../../comdescribe_img/b1.png','../../comdescribe_Mp4/b1.mp4','想要色彩大胆、妆效持久，可先用Rouge唇线笔勾勒轮廓并�?涂打底�?�接�?再使用全新Rouge烈艳蓝金液唇膏，独特设计的唇刷，确保沾取适当用量，轻松上手�??','全新Rouge烈艳蓝金液唇膏，运用专业级技艺调配矿物蜡、微硅粉�?*与精华油，顺滑易涂，大胆结合看似矛盾的多元唇妆元素，赋予双唇充满力量感的色彩。矿物蜡指微晶蜡，微硅粉末指硅石粉末','{\"english\":\"POISON METAL\",\"describe\":\"摇滚哑光、经典缎光�?�电光\",\"weight\":\"3\"}'),(3,1002,'../../comdescribe_img/c1.png','../../comdescribe_Mp4/c1.mp4','使用唇膏前作为打底使用，丰盈滋润双唇；或在唇膏之后使用，增添丰盈亮泽。每日早晚单独使用，加强对唇部的护理.','专业级配方蕴含胶原质，融合�?�明质酸，双唇更显柔滑滋润�?�日复一日，为双唇营造感性的丰润效果�?','{\"english\":\"#Best Seller\",\"describe\":\"魅惑丰唇蜜\",\"weight\":\"3\"}'),(4,1003,'../../comdescribe_img/d1.png','../../comdescribe_Mp4/d1.mp4','柔滑而流畅的质地，无缝帖服双唇，提供令人惊喜的舒适上妆体验�?�水润凝胶内芯与同色系唇膏色彩同时上妆，呈献唇膏与釉亮表层的结合妆效�?','水润凝胶内芯富蕴三种闪亮精华油�?�舒悦感油脂赋予柔滑而流畅的质地，开启崭新的奢悦感官享受。舒缓�?�油脂帮助滋润唇部，而保护�?�油脂提高颜色附�?度，更长久持妆�??','{\"english\":\"#Best Seller\",\"describe\":\"魅惑丰唇蜜\",\"weight\":\"3\"}'),(5,1005,'../../comdescribe_img/a1.png','../../comdescribe_Mp4/a1.mp4','�?系列高订唇膏色彩呈现舒悦而诱惑的缎光感妆效�??','四款高订色彩，大胆的时尚宣言：四款高订色彩，充满惊喜。一个充满前卫高订色彩的精粹系列，�?�让您尽情感受拍摄时尚大片的兴奋，大胆与前卫。Rouge烈艳蓝金唇膏的舒悦配方，无论是哑光感还是缎光感妆效，为您带来舒悦享受及色彩�?�加入特别�?�护唇�?�成分组合，滋润、持妆�??','{\"english\":\"凝脂恒久气垫粉底\",\"describe\":\"Rouge首款锁妆气垫\",\"weight\":\"3\"}'),(6,1006,'../../comdescribe_img/b1.png','../../comdescribe_Mp4/b1.mp4','想要色彩大胆、妆效持久，可先用Rouge唇线笔勾勒轮廓并�?涂打底�?�接�?再使用全新Rouge烈艳蓝金液唇膏，独特设计的唇刷，确保沾取适当用量，轻松上手�??','全新Rouge烈艳蓝金液唇膏，运用专业级技艺调配矿物蜡、微硅粉�?*与精华油，顺滑易涂，大胆结合看似矛盾的多元唇妆元素，赋予双唇充满力量感的色彩。矿物蜡指微晶蜡，微硅粉末指硅石粉末','{\"english\":\"POISON METAL\",\"describe\":\"摇滚哑光、经典缎光�?�电光\",\"weight\":\"3\"}'),(7,1007,'../../comdescribe_img/c1.png','../../comdescribe_Mp4/c1.mp4','使用唇膏前作为打底使用，丰盈滋润双唇；或在唇膏之后使用，增添丰盈亮泽。每日早晚单独使用，加强对唇部的护理.','专业级配方蕴含胶原质，融合�?�明质酸，双唇更显柔滑滋润�?�日复一日，为双唇营造感性的丰润效果�?','{\"english\":\"#Best Seller\",\"describe\":\"魅惑丰唇蜜\",\"weight\":\"3\"}'),(8,1008,'../../comdescribe_img/d1.png','../../comdescribe_Mp4/d1.mp4','柔滑而流畅的质地，无缝帖服双唇，提供令人惊喜的舒适上妆体验�?�水润凝胶内芯与同色系唇膏色彩同时上妆，呈献唇膏与釉亮表层的结合妆效�?','水润凝胶内芯富蕴三种闪亮精华油�?�舒悦感油脂赋予柔滑而流畅的质地，开启崭新的奢悦感官享受。舒缓�?�油脂帮助滋润唇部，而保护�?�油脂提高颜色附�?度，更长久持妆�??','{\"english\":\"#Best Seller\",\"describe\":\"魅惑丰唇蜜\",\"weight\":\"3\"}'),(9,1009,'../../comdescribe_img/a1.png','../../comdescribe_Mp4/a1.mp4','�?系列高订唇膏色彩呈现舒悦而诱惑的缎光感妆效�??','四款高订色彩，大胆的时尚宣言：四款高订色彩，充满惊喜。一个充满前卫高订色彩的精粹系列，�?�让您尽情感受拍摄时尚大片的兴奋，大胆与前卫。Rouge烈艳蓝金唇膏的舒悦配方，无论是哑光感还是缎光感妆效，为您带来舒悦享受及色彩�?�加入特别�?�护唇�?�成分组合，滋润、持妆�??','{\"english\":\"凝脂恒久气垫粉底\",\"describe\":\"Rouge首款锁妆气垫\",\"weight\":\"3\"}'),(10,1010,'../../comdescribe_img/b1.png','../../comdescribe_Mp4/b1.mp4','想要色彩大胆、妆效持久，可先用Rouge唇线笔勾勒轮廓并�?涂打底�?�接�?再使用全新Rouge烈艳蓝金液唇膏，独特设计的唇刷，确保沾取适当用量，轻松上手�??','全新Rouge烈艳蓝金液唇膏，运用专业级技艺调配矿物蜡、微硅粉�?*与精华油，顺滑易涂，大胆结合看似矛盾的多元唇妆元素，赋予双唇充满力量感的色彩。矿物蜡指微晶蜡，微硅粉末指硅石粉末','{\"english\":\"POISON METAL\",\"describe\":\"摇滚哑光、经典缎光�?�电光\",\"weight\":\"3\"}'),(11,1011,'../../comdescribe_img/c1.png','../../comdescribe_Mp4/c1.mp4','使用唇膏前作为打底使用，丰盈滋润双唇；或在唇膏之后使用，增添丰盈亮泽。每日早晚单独使用，加强对唇部的护理.','专业级配方蕴含胶原质，融合�?�明质酸，双唇更显柔滑滋润�?�日复一日，为双唇营造感性的丰润效果�?','{\"english\":\"#Best Seller\",\"describe\":\"魅惑丰唇蜜\",\"weight\":\"3\"}'),(12,1012,'../../comdescribe_img/d1.png','../../comdescribe_Mp4/d1.mp4','柔滑而流畅的质地，无缝帖服双唇，提供令人惊喜的舒适上妆体验�?�水润凝胶内芯与同色系唇膏色彩同时上妆，呈献唇膏与釉亮表层的结合妆效�?','水润凝胶内芯富蕴三种闪亮精华油�?�舒悦感油脂赋予柔滑而流畅的质地，开启崭新的奢悦感官享受。舒缓�?�油脂帮助滋润唇部，而保护�?�油脂提高颜色附�?度，更长久持妆�??','{\"english\":\"#Best Seller\",\"describe\":\"魅惑丰唇蜜\",\"weight\":\"3\"}'),(13,1013,'../../comdescribe_img/a1.png','../../comdescribe_Mp4/a1.mp4','�?系列高订唇膏色彩呈现舒悦而诱惑的缎光感妆效�??','四款高订色彩，大胆的时尚宣言：四款高订色彩，充满惊喜。一个充满前卫高订色彩的精粹系列，�?�让您尽情感受拍摄时尚大片的兴奋，大胆与前卫。Rouge烈艳蓝金唇膏的舒悦配方，无论是哑光感还是缎光感妆效，为您带来舒悦享受及色彩�?�加入特别�?�护唇�?�成分组合，滋润、持妆�??','{\"english\":\"凝脂恒久气垫粉底\",\"describe\":\"Rouge首款锁妆气垫\",\"weight\":\"3\"}'),(14,1014,'../../comdescribe_img/b1.png','../../comdescribe_Mp4/b1.mp4','想要色彩大胆、妆效持久，可先用Rouge唇线笔勾勒轮廓并�?涂打底�?�接�?再使用全新Rouge烈艳蓝金液唇膏，独特设计的唇刷，确保沾取适当用量，轻松上手�??','全新Rouge烈艳蓝金液唇膏，运用专业级技艺调配矿物蜡、微硅粉�?*与精华油，顺滑易涂，大胆结合看似矛盾的多元唇妆元素，赋予双唇充满力量感的色彩。矿物蜡指微晶蜡，微硅粉末指硅石粉末','{\"english\":\"POISON METAL\",\"describe\":\"摇滚哑光、经典缎光�?�电光\",\"weight\":\"3\"}'),(15,1015,'../../comdescribe_img/c1.png','../../comdescribe_Mp4/c1.mp4','使用唇膏前作为打底使用，丰盈滋润双唇；或在唇膏之后使用，增添丰盈亮泽。每日早晚单独使用，加强对唇部的护理.','专业级配方蕴含胶原质，融合�?�明质酸，双唇更显柔滑滋润�?�日复一日，为双唇营造感性的丰润效果�?','{\"english\":\"#Best Seller\",\"describe\":\"魅惑丰唇蜜\",\"weight\":\"3\"}'),(16,1016,'../../comdescribe_img/d1.png','../../comdescribe_Mp4/d1.mp4','柔滑而流畅的质地，无缝帖服双唇，提供令人惊喜的舒适上妆体验�?�水润凝胶内芯与同色系唇膏色彩同时上妆，呈献唇膏与釉亮表层的结合妆效�?','水润凝胶内芯富蕴三种闪亮精华油�?�舒悦感油脂赋予柔滑而流畅的质地，开启崭新的奢悦感官享受。舒缓�?�油脂帮助滋润唇部，而保护�?�油脂提高颜色附�?度，更长久持妆�??','{\"english\":\"#Best Seller\",\"describe\":\"魅惑丰唇蜜\",\"weight\":\"3\"}'),(17,1017,'../../comdescribe_img/a1.png','../../comdescribe_Mp4/a1.mp4','�?系列高订唇膏色彩呈现舒悦而诱惑的缎光感妆效�??','四款高订色彩，大胆的时尚宣言：四款高订色彩，充满惊喜。一个充满前卫高订色彩的精粹系列，�?�让您尽情感受拍摄时尚大片的兴奋，大胆与前卫。Rouge烈艳蓝金唇膏的舒悦配方，无论是哑光感还是缎光感妆效，为您带来舒悦享受及色彩�?�加入特别�?�护唇�?�成分组合，滋润、持妆�??','{\"english\":\"凝脂恒久气垫粉底\",\"describe\":\"Rouge首款锁妆气垫\",\"weight\":\"3\"}'),(18,1018,'../../comdescribe_img/b1.png','../../comdescribe_Mp4/b1.mp4','想要色彩大胆、妆效持久，可先用Rouge唇线笔勾勒轮廓并�?涂打底�?�接�?再使用全新Rouge烈艳蓝金液唇膏，独特设计的唇刷，确保沾取适当用量，轻松上手�??','全新Rouge烈艳蓝金液唇膏，运用专业级技艺调配矿物蜡、微硅粉�?*与精华油，顺滑易涂，大胆结合看似矛盾的多元唇妆元素，赋予双唇充满力量感的色彩。矿物蜡指微晶蜡，微硅粉末指硅石粉末','{\"english\":\"POISON METAL\",\"describe\":\"摇滚哑光、经典缎光�?�电光\",\"weight\":\"3\"}'),(19,1019,'../../comdescribe_img/c1.png','../../comdescribe_Mp4/c1.mp4','使用唇膏前作为打底使用，丰盈滋润双唇；或在唇膏之后使用，增添丰盈亮泽。每日早晚单独使用，加强对唇部的护理.','专业级配方蕴含胶原质，融合�?�明质酸，双唇更显柔滑滋润�?�日复一日，为双唇营造感性的丰润效果�?','{\"english\":\"#Best Seller\",\"describe\":\"魅惑丰唇蜜\",\"weight\":\"3\"}'),(20,1020,'../../comdescribe_img/aa1.png','../../comdescribe_Mp4/aa1.mp4','于晨间护肤流程后使用，并可用于随行补妆，尽享令人迷恋的清新感受！','- 创新微孔呼吸气垫科技：每次开启使用时，皆可完好保存配方中的粉底因子与护肤能量。创新�?�锁妆�?�科�?：让底妆长时间保持原色，妆面持久如新。即使在高温潮湿等恶劣环境中，依然出色持妆�?�蕴含细致护肤精萃：日复�?日，直击毛孔与出油等肌肤问题，帮助减少油光，隐匿瑕疵，令肤质愈加细腻�?','{\"english\":\"凝脂恒久气垫粉底\",\"describe\":\"底妆加锁，定格立体哑�? - 替换芯\",\"weight\":\"3\"}'),(21,1021,'../../comdescribe_img/bb1.png','../../comdescribe_Mp4/bb1.mp4','Dior迪奥美妍中心研发，创新双重色彩因子：瑰丽多彩因子，饱满色泽，细腻修色、轻透匀�?。玫瑰光彩因子，赋予底妆玫瑰花瓣般的丝缎光泽。轻盈奢润质地，细润亲肤，舒悦沁融，不同环境�?3依然妆效持久','格兰维尔玫瑰的故事，始于法国诺曼底海边�?�迪奥先生童年故居旁的格兰维尔峭壁�?�一株玫瑰，无惧严酷气�?�，瑰丽清新，傲然盛放�??','{\"english\":\"Rouge花蜜活颜丝悦玫瑰气垫粉底\",\"describe\":\"玫瑰气垫粉底\",\"weight\":\"3\"}'),(22,1022,'../../comdescribe_img/cc1.png','../../comdescribe_Mp4/cc1.mp4','Dior迪奥美妍中心研发，创新双重色彩因子：瑰丽多彩因子，饱满色泽，细腻修色、轻透匀�?。玫瑰光彩因子，赋予底妆玫瑰花瓣般的丝缎光泽。轻盈奢润质地，细润亲肤，舒悦沁融，不同环境�?3依然妆效持久','格兰维尔玫瑰的故事，始于法国诺曼底海边�?�迪奥先生童年故居旁的格兰维尔峭壁�?�一株玫瑰，无惧严酷气�?�，瑰丽清新，傲然盛放�??','{\"english\":\"Rouge凝脂恒久卓越蜜粉\",\"describe\":\"克丽丝汀迪奥凝脂恒久蜜粉 \",\"weight\":\"3\"}'),(23,1023,'../../comdescribe_img/bb1.png','../../comdescribe_Mp4/bb1.mp4','Dior迪奥美妍中心研发，创新双重色彩因子：瑰丽多彩因子，饱满色泽，细腻修色、轻透匀�?。玫瑰光彩因子，赋予底妆玫瑰花瓣般的丝缎光泽。轻盈奢润质地，细润亲肤，舒悦沁融，不同环境�?3依然妆效持久','格兰维尔玫瑰的故事，始于法国诺曼底海边�?�迪奥先生童年故居旁的格兰维尔峭壁�?�一株玫瑰，无惧严酷气�?�，瑰丽清新，傲然盛放�??','{\"english\":\"Rouge花蜜活颜丝悦玫瑰气垫粉底\",\"describe\":\"玫瑰气垫粉底\",\"weight\":\"3\"}'),(24,1024,'../../comdescribe_img/aa1.png','../../comdescribe_Mp4/aa1.mp4','于晨间护肤流程后使用，并可用于随行补妆，尽享令人迷恋的清新感受！','- 创新微孔呼吸气垫科技：每次开启使用时，皆可完好保存配方中的粉底因子与护肤能量。创新�?�锁妆�?�科�?：让底妆长时间保持原色，妆面持久如新。即使在高温潮湿等恶劣环境中，依然出色持妆�?�蕴含细致护肤精萃：日复�?日，直击毛孔与出油等肌肤问题，帮助减少油光，隐匿瑕疵，令肤质愈加细腻�?','{\"english\":\"凝脂恒久气垫粉底\",\"describe\":\"底妆加锁，定格立体哑�? - 替换芯\",\"weight\":\"3\"}'),(25,1025,'../../comdescribe_img/cc1.png','../../comdescribe_Mp4/cc1.mp4','Dior迪奥美妍中心研发，创新双重色彩因子：瑰丽多彩因子，饱满色泽，细腻修色、轻透匀�?。玫瑰光彩因子，赋予底妆玫瑰花瓣般的丝缎光泽。轻盈奢润质地，细润亲肤，舒悦沁融，不同环境�?3依然妆效持久','格兰维尔玫瑰的故事，始于法国诺曼底海边�?�迪奥先生童年故居旁的格兰维尔峭壁�?�一株玫瑰，无惧严酷气�?�，瑰丽清新，傲然盛放�??','{\"english\":\"Rouge凝脂恒久卓越蜜粉\",\"describe\":\"克丽丝汀迪奥凝脂恒久蜜粉 \",\"weight\":\"3\"}'),(26,1026,'../../comdescribe_img/bb1.png','../../comdescribe_Mp4/bb1.mp4','Dior迪奥美妍中心研发，创新双重色彩因子：瑰丽多彩因子，饱满色泽，细腻修色、轻透匀�?。玫瑰光彩因子，赋予底妆玫瑰花瓣般的丝缎光泽。轻盈奢润质地，细润亲肤，舒悦沁融，不同环境�?3依然妆效持久','格兰维尔玫瑰的故事，始于法国诺曼底海边�?�迪奥先生童年故居旁的格兰维尔峭壁�?�一株玫瑰，无惧严酷气�?�，瑰丽清新，傲然盛放�??','{\"english\":\"Rouge花蜜活颜丝悦玫瑰气垫粉底\",\"describe\":\"玫瑰气垫粉底\",\"weight\":\"3\"}'),(27,1027,'../../comdescribe_img/aa1.png','../../comdescribe_Mp4/aa1.mp4','于晨间护肤流程后使用，并可用于随行补妆，尽享令人迷恋的清新感受！','- 创新微孔呼吸气垫科技：每次开启使用时，皆可完好保存配方中的粉底因子与护肤能量。创新�?�锁妆�?�科�?：让底妆长时间保持原色，妆面持久如新。即使在高温潮湿等恶劣环境中，依然出色持妆�?�蕴含细致护肤精萃：日复�?日，直击毛孔与出油等肌肤问题，帮助减少油光，隐匿瑕疵，令肤质愈加细腻�?','{\"english\":\"凝脂恒久气垫粉底\",\"describe\":\"底妆加锁，定格立体哑�? - 替换芯\",\"weight\":\"3\"}'),(28,1028,'../../comdescribe_img/cc1.png','../../comdescribe_Mp4/cc1.mp4','Dior迪奥美妍中心研发，创新双重色彩因子：瑰丽多彩因子，饱满色泽，细腻修色、轻透匀�?。玫瑰光彩因子，赋予底妆玫瑰花瓣般的丝缎光泽。轻盈奢润质地，细润亲肤，舒悦沁融，不同环境�?3依然妆效持久','格兰维尔玫瑰的故事，始于法国诺曼底海边�?�迪奥先生童年故居旁的格兰维尔峭壁�?�一株玫瑰，无惧严酷气�?�，瑰丽清新，傲然盛放�??','{\"english\":\"Rouge凝脂恒久卓越蜜粉\",\"describe\":\"克丽丝汀迪奥凝脂恒久蜜粉 \",\"weight\":\"3\"}'),(29,1029,'../../comdescribe_img/bb1.png','../../comdescribe_Mp4/bb1.mp4','Dior迪奥美妍中心研发，创新双重色彩因子：瑰丽多彩因子，饱满色泽，细腻修色、轻透匀�?。玫瑰光彩因子，赋予底妆玫瑰花瓣般的丝缎光泽。轻盈奢润质地，细润亲肤，舒悦沁融，不同环境�?3依然妆效持久','格兰维尔玫瑰的故事，始于法国诺曼底海边�?�迪奥先生童年故居旁的格兰维尔峭壁�?�一株玫瑰，无惧严酷气�?�，瑰丽清新，傲然盛放�??','{\"english\":\"Rouge花蜜活颜丝悦玫瑰气垫粉底\",\"describe\":\"玫瑰气垫粉底\",\"weight\":\"3\"}'),(30,1030,'../../comdescribe_img/aa1.png','../../comdescribe_Mp4/aa1.mp4','于晨间护肤流程后使用，并可用于随行补妆，尽享令人迷恋的清新感受！','- 创新微孔呼吸气垫科技：每次开启使用时，皆可完好保存配方中的粉底因子与护肤能量。创新�?�锁妆�?�科�?：让底妆长时间保持原色，妆面持久如新。即使在高温潮湿等恶劣环境中，依然出色持妆�?�蕴含细致护肤精萃：日复�?日，直击毛孔与出油等肌肤问题，帮助减少油光，隐匿瑕疵，令肤质愈加细腻�?','{\"english\":\"凝脂恒久气垫粉底\",\"describe\":\"底妆加锁，定格立体哑�? - 替换芯\",\"weight\":\"3\"}'),(31,1031,'../../comdescribe_img/cc1.png','../../comdescribe_Mp4/cc1.mp4','Dior迪奥美妍中心研发，创新双重色彩因子：瑰丽多彩因子，饱满色泽，细腻修色、轻透匀�?。玫瑰光彩因子，赋予底妆玫瑰花瓣般的丝缎光泽。轻盈奢润质地，细润亲肤，舒悦沁融，不同环境�?3依然妆效持久','格兰维尔玫瑰的故事，始于法国诺曼底海边�?�迪奥先生童年故居旁的格兰维尔峭壁�?�一株玫瑰，无惧严酷气�?�，瑰丽清新，傲然盛放�??','{\"english\":\"Rouge凝脂恒久卓越蜜粉\",\"describe\":\"克丽丝汀迪奥凝脂恒久蜜粉 \",\"weight\":\"3\"}');
/*!40000 ALTER TABLE `comdescribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comdiscount`
--

DROP TABLE IF EXISTS `comdiscount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comdiscount` (
  `comdisid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `comid` int(11) NOT NULL COMMENT '商品编号',
  `discount` double NOT NULL COMMENT '折扣',
  PRIMARY KEY (`comdisid`),
  KEY `comid` (`comid`),
  CONSTRAINT `comdiscount_ibfk_1` FOREIGN KEY (`comid`) REFERENCES `commodity` (`comid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comdiscount`
--

LOCK TABLES `comdiscount` WRITE;
/*!40000 ALTER TABLE `comdiscount` DISABLE KEYS */;
INSERT INTO `comdiscount` VALUES (1,1001,9),(2,1001,9),(3,1005,9),(4,1008,9),(5,1004,9),(6,1011,9),(7,1016,9);
/*!40000 ALTER TABLE `comdiscount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `commentid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `aid` varchar(20) NOT NULL COMMENT '关联账号',
  `comid` int(11) NOT NULL COMMENT '关联商品',
  `content` varchar(240) NOT NULL COMMENT '内容',
  `grade` int(100) NOT NULL COMMENT '打分',
  `commentimg` varchar(160) NOT NULL COMMENT '图片',
  PRIMARY KEY (`commentid`),
  KEY `aid` (`aid`),
  KEY `comid` (`comid`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `account` (`aid`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`comid`) REFERENCES `commodity` (`comid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodity`
--

DROP TABLE IF EXISTS `commodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commodity` (
  `comid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `comname` varchar(160) NOT NULL COMMENT '商品名称',
  `comtid` int(11) NOT NULL COMMENT '商品类型编号',
  `comprice` double NOT NULL COMMENT '商品价格',
  `comproduce` varchar(1000) NOT NULL COMMENT '商品详细描述',
  `comstatic` int(11) NOT NULL DEFAULT '1' COMMENT '0代表下架�?1代表�?�?',
  `cominventory` int(11) NOT NULL COMMENT '库存',
  PRIMARY KEY (`comid`),
  KEY `comtid` (`comtid`),
  CONSTRAINT `commodity_ibfk_1` FOREIGN KEY (`comtid`) REFERENCES `commoditytype` (`comtid`)
) ENGINE=InnoDB AUTO_INCREMENT=1033 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity`
--

LOCK TABLES `commodity` WRITE;
/*!40000 ALTER TABLE `commodity` DISABLE KEYS */;
INSERT INTO `commodity` VALUES (1000,'魅惑釉唇�?',1,300,'高订色彩，缎光妆效，Rouge烈艳蓝金唇膏持色舒�?�配方，为女性带来美妙的享受�? 经典红色系�?�热烈珊瑚红、热情欢乐的粉色系�?�浪漫迷人的紫红，以及一系列前卫色彩，呈献唇妆惊喜�?? 这款唇膏暗藏玄机的迪奥全新金属外壳具有非凡吸引力：为了彰显一抹个性奢华魅力，唇膏盖内皆以Rouge的经典迷人色彩�?��??#传奇红唇�?#999）的色彩装点�?',1,7),(1001,'Rouge烈艳蓝金液唇�?',1,300,'Rouge烈艳蓝金唇膏再度突破创意，推出首�?4种妆效的液�?�唇膏：摇滚哑光、经典缎光�?�电光金属�?�丝绒裸妆�?? 唇彩般轻盈舒适，唇膏般细腻顺滑，高遮盖力，超持妆显色�?',1,4),(1002,'Rouge魅惑唇膏系列 丰唇�?',1,300,'专业级配方蕴含胶原质，融合�?�明质酸，双唇更显柔滑滋润�?�日复一日，为双唇营造感性的丰润效果�?',1,3),(1003,'Rouge魅惑唇膏',1,300,'Dior迪奥引领唇妆新纪元，推出革命性唇膏臻品，每次上妆，水润凝胶内芯的釉亮妆效皆令双唇绽现超非凡镜面光泽�?�唇膏中央，刻印CD字母图案的水润凝胶内芯贯穿整个唇膏膏体�?�涂抹上唇，Dior迪奥魅惑唇膏的釉亮表层妆效，为双唇更添炫亮光泽，牢固唇膏色彩，为双唇带来令人难以置信的舒悦妆感�??',1,3),(1004,'Rouge烈艳蓝金液唇�?',1,300,'烈艳蓝金液唇膏再度创新配方，延续舒悦质地的同时，持色持久，轻松玩转哑光�?�缎光和金属3种惊艳妆�?',0,0),(1005,'魅惑釉唇�?',1,300,'高订色彩，缎光妆效，Rouge烈艳蓝金唇膏持色舒�?�配方，为女性带来美妙的享受�? 经典红色系�?�热烈珊瑚红、热情欢乐的粉色系�?�浪漫迷人的紫红，以及一系列前卫色彩，呈献唇妆惊喜�?? 这款唇膏暗藏玄机的迪奥全新金属外壳具有非凡吸引力：为了彰显一抹个性奢华魅力，唇膏盖内皆以Rouge的经典迷人色彩�?��??#传奇红唇�?#999）的色彩装点�?',1,7),(1006,'Rouge烈艳蓝金液唇�?',1,300,'Rouge烈艳蓝金唇膏再度突破创意，推出首�?4种妆效的液�?�唇膏：摇滚哑光、经典缎光�?�电光金属�?�丝绒裸妆�?? 唇彩般轻盈舒适，唇膏般细腻顺滑，高遮盖力，超持妆显色�?',1,4),(1007,'Rouge魅惑唇膏系列 丰唇�?',1,300,'专业级配方蕴含胶原质，融合�?�明质酸，双唇更显柔滑滋润�?�日复一日，为双唇营造感性的丰润效果�?',1,3),(1008,'Rouge魅惑唇膏',1,300,'Dior迪奥引领唇妆新纪元，推出革命性唇膏臻品，每次上妆，水润凝胶内芯的釉亮妆效皆令双唇绽现超非凡镜面光泽�?�唇膏中央，刻印CD字母图案的水润凝胶内芯贯穿整个唇膏膏体�?�涂抹上唇，Dior迪奥魅惑唇膏的釉亮表层妆效，为双唇更添炫亮光泽，牢固唇膏色彩，为双唇带来令人难以置信的舒悦妆感�??',1,3),(1009,'Rouge烈艳蓝金液唇�?',1,300,'烈艳蓝金液唇膏再度创新配方，延续舒悦质地的同时，持色持久，轻松玩转哑光�?�缎光和金属3种惊艳妆�?',0,0),(1010,'魅惑釉唇�?',1,300,'高订色彩，缎光妆效，Rouge烈艳蓝金唇膏持色舒�?�配方，为女性带来美妙的享受�? 经典红色系�?�热烈珊瑚红、热情欢乐的粉色系�?�浪漫迷人的紫红，以及一系列前卫色彩，呈献唇妆惊喜�?? 这款唇膏暗藏玄机的迪奥全新金属外壳具有非凡吸引力：为了彰显一抹个性奢华魅力，唇膏盖内皆以Rouge的经典迷人色彩�?��??#传奇红唇�?#999）的色彩装点�?',1,7),(1011,'Rouge烈艳蓝金液唇�?',1,300,'Rouge烈艳蓝金唇膏再度突破创意，推出首�?4种妆效的液�?�唇膏：摇滚哑光、经典缎光�?�电光金属�?�丝绒裸妆�?? 唇彩般轻盈舒适，唇膏般细腻顺滑，高遮盖力，超持妆显色�?',1,4),(1012,'Rouge魅惑唇膏系列 丰唇�?',1,300,'专业级配方蕴含胶原质，融合�?�明质酸，双唇更显柔滑滋润�?�日复一日，为双唇营造感性的丰润效果�?',1,3),(1013,'Rouge魅惑唇膏',1,300,'Dior迪奥引领唇妆新纪元，推出革命性唇膏臻品，每次上妆，水润凝胶内芯的釉亮妆效皆令双唇绽现超非凡镜面光泽�?�唇膏中央，刻印CD字母图案的水润凝胶内芯贯穿整个唇膏膏体�?�涂抹上唇，Dior迪奥魅惑唇膏的釉亮表层妆效，为双唇更添炫亮光泽，牢固唇膏色彩，为双唇带来令人难以置信的舒悦妆感�??',1,3),(1014,'Rouge烈艳蓝金液唇�?',1,300,'烈艳蓝金液唇膏再度创新配方，延续舒悦质地的同时，持色持久，轻松玩转哑光�?�缎光和金属3种惊艳妆�?',0,0),(1015,'魅惑釉唇�?',1,300,'高订色彩，缎光妆效，Rouge烈艳蓝金唇膏持色舒�?�配方，为女性带来美妙的享受�? 经典红色系�?�热烈珊瑚红、热情欢乐的粉色系�?�浪漫迷人的紫红，以及一系列前卫色彩，呈献唇妆惊喜�?? 这款唇膏暗藏玄机的迪奥全新金属外壳具有非凡吸引力：为了彰显一抹个性奢华魅力，唇膏盖内皆以Rouge的经典迷人色彩�?��??#传奇红唇�?#999）的色彩装点�?',1,7),(1016,'Rouge烈艳蓝金液唇�?',1,300,'Rouge烈艳蓝金唇膏再度突破创意，推出首�?4种妆效的液�?�唇膏：摇滚哑光、经典缎光�?�电光金属�?�丝绒裸妆�?? 唇彩般轻盈舒适，唇膏般细腻顺滑，高遮盖力，超持妆显色�?',1,4),(1017,'Rouge魅惑唇膏系列 丰唇�?',1,300,'专业级配方蕴含胶原质，融合�?�明质酸，双唇更显柔滑滋润�?�日复一日，为双唇营造感性的丰润效果�?',1,3),(1018,'Rouge魅惑唇膏',1,300,'Dior迪奥引领唇妆新纪元，推出革命性唇膏臻品，每次上妆，水润凝胶内芯的釉亮妆效皆令双唇绽现超非凡镜面光泽�?�唇膏中央，刻印CD字母图案的水润凝胶内芯贯穿整个唇膏膏体�?�涂抹上唇，Dior迪奥魅惑唇膏的釉亮表层妆效，为双唇更添炫亮光泽，牢固唇膏色彩，为双唇带来令人难以置信的舒悦妆感�??',1,3),(1019,'Rouge烈艳蓝金液唇�?',1,300,'烈艳蓝金液唇膏再度创新配方，延续舒悦质地的同时，持色持久，轻松玩转哑光�?�缎光和金属3种惊艳妆�?',0,0),(1020,'Rouge凝脂恒久气垫粉底',2,320,'Rouge全新锁妆气垫，清新柔润质地结合极为细腻的哑雾因子，如同一抹轻透薄纱，修饰隐匿肌肤瑕疵，瞬间打造立体哑光�?? *注册名：Rouge凝脂恒久气垫粉底 Rouge秉承美丽、真挚的品牌理念，同时崇尚环保，提供替换芯可供�?�购�? 替换芯可单独选购�?',1,7),(1021,'Rouge花蜜活颜丝悦',2,790,'Rouge花蜜玫瑰气垫1�?500片玫瑰花�?2的奢焕能量，凝萃于迪奥新�?代气垫粉底之中，即拍即养，便携随行，缔�?�细润无瑕妆效�??',1,2),(1022,'Rouge凝脂恒久卓越蜜粉',2,520,'作为完妆步骤，使用Dior迪奥凝脂恒久卓越蜜粉，打造更加持久的哑光妆效�? 轻盈质地，百搭色调，如同为肌肤披上一层薄纱�?��??',1,2),(1023,'Rouge凝脂恒久气垫粉底',2,320,'Rouge全新锁妆气垫，清新柔润质地结合极为细腻的哑雾因子，如同一抹轻透薄纱，修饰隐匿肌肤瑕疵，瞬间打造立体哑光�?? *注册名：Rouge凝脂恒久气垫粉底 Rouge秉承美丽、真挚的品牌理念，同时崇尚环保，提供替换芯可供�?�购�? 替换芯可单独选购�?',1,7),(1024,'Rouge凝脂恒久卓越蜜粉',2,520,'作为完妆步骤，使用Dior迪奥凝脂恒久卓越蜜粉，打造更加持久的哑光妆效�? 轻盈质地，百搭色调，如同为肌肤披上一层薄纱�?��??',1,2),(1025,'Rouge花蜜活颜丝悦',2,790,'Rouge花蜜玫瑰气垫1�?500片玫瑰花�?2的奢焕能量，凝萃于迪奥新�?代气垫粉底之中，即拍即养，便携随行，缔�?�细润无瑕妆效�??',1,2),(1026,'Rouge凝脂恒久卓越蜜粉',2,520,'作为完妆步骤，使用Dior迪奥凝脂恒久卓越蜜粉，打造更加持久的哑光妆效�? 轻盈质地，百搭色调，如同为肌肤披上一层薄纱�?��??',1,2),(1027,'Rouge凝脂恒久气垫粉底',2,320,'Rouge全新锁妆气垫，清新柔润质地结合极为细腻的哑雾因子，如同一抹轻透薄纱，修饰隐匿肌肤瑕疵，瞬间打造立体哑光�?? *注册名：Rouge凝脂恒久气垫粉底 Rouge秉承美丽、真挚的品牌理念，同时崇尚环保，提供替换芯可供�?�购�? 替换芯可单独选购�?',1,7),(1028,'Rouge凝脂恒久卓越蜜粉',2,520,'作为完妆步骤，使用Dior迪奥凝脂恒久卓越蜜粉，打造更加持久的哑光妆效�? 轻盈质地，百搭色调，如同为肌肤披上一层薄纱�?��??',1,2),(1029,'Rouge凝脂恒久卓越蜜粉',2,520,'作为完妆步骤，使用Dior迪奥凝脂恒久卓越蜜粉，打造更加持久的哑光妆效�? 轻盈质地，百搭色调，如同为肌肤披上一层薄纱�?��??',1,2),(1030,'Rouge凝脂恒久气垫粉底',2,320,'Rouge全新锁妆气垫，清新柔润质地结合极为细腻的哑雾因子，如同一抹轻透薄纱，修饰隐匿肌肤瑕疵，瞬间打造立体哑光�?? *注册名：Rouge凝脂恒久气垫粉底 Rouge秉承美丽、真挚的品牌理念，同时崇尚环保，提供替换芯可供�?�购�? 替换芯可单独选购�?',1,7),(1031,'Rouge凝脂恒久卓越蜜粉',2,520,'作为完妆步骤，使用Dior迪奥凝脂恒久卓越蜜粉，打造更加持久的哑光妆效�? 轻盈质地，百搭色调，如同为肌肤披上一层薄纱�?��??',1,2),(1032,'Rouge口红',1,240,'<img src=\"/attached/image/20190110/20190110152858_595.jpg\" alt=\"\" />',1,3);
/*!40000 ALTER TABLE `commodity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodityimg`
--

DROP TABLE IF EXISTS `commodityimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commodityimg` (
  `comiid` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `comid` int(11) NOT NULL COMMENT '商品编号',
  `imgpath` varchar(1000) NOT NULL COMMENT '图片路径',
  PRIMARY KEY (`comiid`),
  KEY `comid` (`comid`),
  CONSTRAINT `commodityimg_ibfk_1` FOREIGN KEY (`comid`) REFERENCES `commodity` (`comid`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodityimg`
--

LOCK TABLES `commodityimg` WRITE;
/*!40000 ALTER TABLE `commodityimg` DISABLE KEYS */;
INSERT INTO `commodityimg` VALUES (1,1000,'a1.jpg'),(2,1000,'a2.jpg'),(3,1000,'a3.jpg'),(4,1000,'a5.jpg'),(5,1000,'a6.jpg'),(6,1000,'a7.jpg'),(7,1001,'b1.jpg'),(8,1001,'b2.jpg'),(9,1001,'b3.jpg'),(10,1001,'b5.jpg'),(11,1001,'b6.jpg'),(12,1001,'b7.jpg'),(13,1002,'c1.jpg'),(14,1002,'c2.jpg'),(15,1002,'c3.jpg'),(16,1002,'c5.jpg'),(17,1002,'c6.jpg'),(18,1003,'d1.jpg'),(19,1004,'e1.jpg'),(20,1004,'e2.jpg'),(21,1004,'e3.jpg'),(22,1004,'e4.jpg'),(23,1005,'a1.jpg'),(24,1005,'a2.jpg'),(25,1005,'a3.jpg'),(26,1005,'a5.jpg'),(27,1005,'a6.jpg'),(28,1005,'a7.jpg'),(29,1006,'b1.jpg'),(30,1006,'b2.jpg'),(31,1006,'b3.jpg'),(32,1006,'b5.jpg'),(33,1006,'b6.jpg'),(34,1006,'b7.jpg'),(35,1007,'c1.jpg'),(36,1007,'c2.jpg'),(37,1007,'c3.jpg'),(38,1007,'c5.jpg'),(39,1007,'c6.jpg'),(40,1008,'d1.jpg'),(41,1008,'e1.jpg'),(42,1008,'e2.jpg'),(43,1008,'e3.jpg'),(44,1008,'e4.jpg'),(45,1009,'a1.jpg'),(46,1009,'a2.jpg'),(47,1009,'a3.jpg'),(48,1009,'a5.jpg'),(49,1009,'a6.jpg'),(50,1009,'a7.jpg'),(51,1009,'b1.jpg'),(52,1009,'b2.jpg'),(53,1009,'b3.jpg'),(54,1009,'b5.jpg'),(55,1009,'b6.jpg'),(56,1009,'b7.jpg'),(57,1010,'c1.jpg'),(58,1010,'c2.jpg'),(59,1010,'c3.jpg'),(60,1010,'c5.jpg'),(61,1010,'c6.jpg'),(62,1011,'d1.jpg'),(63,1011,'e1.jpg'),(64,1011,'e2.jpg'),(65,1011,'e3.jpg'),(66,1011,'e4.jpg'),(67,1012,'a1.jpg'),(68,1012,'a2.jpg'),(69,1012,'a3.jpg'),(70,1012,'a5.jpg'),(71,1012,'a6.jpg'),(72,1012,'a7.jpg'),(73,1012,'b1.jpg'),(74,1012,'b2.jpg'),(75,1012,'b3.jpg'),(76,1012,'b5.jpg'),(77,1012,'b6.jpg'),(78,1012,'b7.jpg'),(79,1012,'c1.jpg'),(80,1012,'c2.jpg'),(81,1012,'c3.jpg'),(82,1012,'c5.jpg'),(83,1012,'c6.jpg'),(84,1013,'d1.jpg'),(85,1013,'e1.jpg'),(86,1013,'e2.jpg'),(87,1013,'e3.jpg'),(88,1013,'e4.jpg'),(89,1014,'a1.jpg'),(90,1014,'a2.jpg'),(91,1014,'a3.jpg'),(92,1014,'a5.jpg'),(93,1015,'a6.jpg'),(94,1015,'a7.jpg'),(95,1015,'b1.jpg'),(96,1015,'b2.jpg'),(97,1015,'b3.jpg'),(98,1016,'b5.jpg'),(99,1016,'b6.jpg'),(100,1016,'b7.jpg'),(101,1016,'c1.jpg'),(102,1017,'c2.jpg'),(103,1017,'c3.jpg'),(104,1017,'c5.jpg'),(105,1017,'c6.jpg'),(106,1018,'d1.jpg'),(107,1018,'e1.jpg'),(108,1018,'e2.jpg'),(109,1018,'e3.jpg'),(110,1019,'e4.jpg'),(111,1020,'aa1.jpg'),(112,1020,'aa2.jpg'),(113,1020,'aa3.jpg'),(114,1020,'aa4.jpg'),(115,1021,'bb1.jpg'),(116,1021,'bb2.jpg'),(117,1022,'cc1.jpg'),(118,1023,'aa1.jpg'),(119,1023,'aa2.jpg'),(120,1024,'aa3.jpg'),(121,1024,'aa4.jpg'),(122,1024,'bb1.jpg'),(123,1024,'bb2.jpg'),(124,1025,'cc1.jpg'),(125,1025,'aa1.jpg'),(126,1025,'aa2.jpg'),(127,1026,'aa3.jpg'),(128,1026,'aa4.jpg'),(129,1026,'bb1.jpg'),(130,1026,'bb2.jpg'),(131,1027,'cc1.jpg'),(132,1027,'aa1.jpg'),(133,1027,'aa2.jpg'),(134,1027,'aa3.jpg'),(135,1028,'aa4.jpg'),(136,1028,'bb1.jpg'),(137,1028,'bb2.jpg'),(138,1029,'cc1.jpg'),(139,1029,'aa3.jpg'),(140,1029,'aa4.jpg'),(141,1030,'bb1.jpg'),(142,1030,'bb2.jpg'),(143,1031,'cc1.jpg'),(144,1031,'bb1.jpg'),(145,1031,'bb2.jpg'),(146,1031,'cc1.jpg'),(147,1032,'4d11ee33-7b93-4047-ab54-ad509d5ddedb.jpg'),(148,1032,'78f0f0d6-ea22-47c8-9c6b-658d390fc2ac.jpg'),(149,1032,'8184b29b-9c90-400a-90c6-b894c6de54e4.jpg'),(150,1032,'879e8b20-3458-440d-9f6b-595ad8097e63.jpg'),(151,1032,'5e4ca970-84ab-45d7-9014-0dcb09f4b90c.jpg'),(152,1032,'d4fc69c0-afdb-409c-8a2c-f5e2ea4e2872.jpg'),(153,1032,'71d2fbe2-6b9d-416a-a364-45e97c707b0c.jpg'),(154,1032,'2f152f2d-5d76-43ee-8aa2-67ea7607b38b.jpg'),(155,1032,'0ced667d-f6fe-4461-a6ea-d6aab0effc9b.jpg');
/*!40000 ALTER TABLE `commodityimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commoditytype`
--

DROP TABLE IF EXISTS `commoditytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commoditytype` (
  `comtid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品类型编号',
  `comtname` varchar(20) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`comtid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commoditytype`
--

LOCK TABLES `commoditytype` WRITE;
/*!40000 ALTER TABLE `commoditytype` DISABLE KEYS */;
INSERT INTO `commoditytype` VALUES (1,'口红'),(2,'粉底'),(3,'腮红'),(4,'护肤'),(5,'眼影');
/*!40000 ALTER TABLE `commoditytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comreserve`
--

DROP TABLE IF EXISTS `comreserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comreserve` (
  `crid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `orderid` int(11) NOT NULL COMMENT '关联订单编号',
  `comid` int(11) NOT NULL COMMENT '关联商品',
  `crcount` int(11) NOT NULL DEFAULT '1' COMMENT '商品的个�?',
  `comcolorid` int(11) NOT NULL COMMENT '关联商品颜色',
  `comsizeid` int(11) DEFAULT NULL COMMENT '关联商品尺寸',
  PRIMARY KEY (`crid`),
  KEY `orderid` (`orderid`),
  KEY `comid` (`comid`),
  KEY `comcolorid` (`comcolorid`),
  KEY `comsizeid` (`comsizeid`),
  CONSTRAINT `comreserve_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `order` (`orderid`),
  CONSTRAINT `comreserve_ibfk_2` FOREIGN KEY (`comid`) REFERENCES `commodity` (`comid`),
  CONSTRAINT `comreserve_ibfk_3` FOREIGN KEY (`comcolorid`) REFERENCES `comcolor` (`comcolorid`),
  CONSTRAINT `comreserve_ibfk_4` FOREIGN KEY (`comsizeid`) REFERENCES `comsize` (`comsizeid`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comreserve`
--

LOCK TABLES `comreserve` WRITE;
/*!40000 ALTER TABLE `comreserve` DISABLE KEYS */;
INSERT INTO `comreserve` VALUES (1,1,1000,1,1,NULL),(2,1,1001,2,1,NULL),(3,1,1003,1,1,NULL),(4,1,1008,1,1,NULL),(5,2,1000,1,1,NULL),(6,2,1001,2,1,NULL),(7,2,1003,1,1,NULL),(8,2,1008,1,1,NULL),(9,3,1000,1,1,NULL),(10,3,1001,2,1,NULL),(11,3,1003,1,1,NULL),(12,3,1008,1,1,NULL),(13,1,1000,1,1,NULL),(14,1,1000,1,1,NULL),(15,1,1000,1,1,NULL),(17,1,1000,1,1,NULL),(20,1,1000,1,1,NULL),(26,15,1000,1,1,NULL),(27,15,1000,1,1,NULL),(28,15,1000,1,1,NULL),(31,19,1011,2,1,NULL),(32,19,1001,2,1,NULL),(33,19,1028,1,1,NULL),(34,20,1011,2,1,NULL),(35,20,1001,2,1,NULL),(36,20,1028,1,1,NULL),(37,21,1011,2,1,NULL),(38,21,1001,2,1,NULL),(39,21,1028,1,1,NULL),(40,22,1011,2,1,NULL),(41,22,1001,2,1,NULL),(42,22,1028,1,1,NULL),(43,24,1011,2,1,NULL),(44,24,1001,2,1,NULL),(45,24,1028,1,1,NULL),(46,25,1011,2,1,NULL),(47,25,1001,2,1,NULL),(48,25,1028,1,1,NULL),(49,26,1011,2,1,NULL),(50,26,1001,2,1,NULL),(51,26,1028,1,1,NULL),(52,27,1011,2,1,NULL),(53,27,1001,2,1,NULL),(54,27,1028,1,1,NULL),(55,40,1028,1,1,NULL),(56,41,1011,2,1,NULL),(57,41,1001,2,1,NULL),(58,41,1028,1,1,NULL),(59,42,1011,2,1,NULL),(60,42,1001,2,1,NULL),(61,42,1028,1,1,NULL),(62,43,1011,2,1,NULL),(63,43,1001,2,1,NULL),(64,43,1028,1,1,NULL),(65,44,1011,2,1,NULL),(66,44,1001,2,1,NULL),(67,44,1028,1,1,NULL),(68,45,1011,2,1,NULL),(69,45,1001,2,1,NULL),(70,45,1028,1,1,NULL),(71,46,1011,2,1,NULL),(72,46,1001,2,1,NULL),(73,46,1028,1,1,NULL),(74,47,1011,2,1,NULL),(75,47,1001,2,1,NULL),(76,47,1028,1,1,NULL),(77,48,1011,2,1,NULL),(78,48,1001,2,1,NULL),(79,48,1028,1,1,NULL),(80,49,1011,2,1,NULL),(81,49,1001,2,1,NULL),(82,49,1028,1,1,NULL),(83,50,1011,2,1,NULL),(84,50,1001,2,1,NULL),(85,50,1028,1,1,NULL),(86,51,1011,2,1,NULL),(87,51,1001,2,1,NULL),(88,51,1028,1,1,NULL),(89,52,1011,2,1,NULL),(90,52,1001,2,1,NULL),(91,52,1028,1,1,NULL),(92,53,1011,2,1,NULL),(93,53,1001,2,1,NULL),(94,53,1028,1,1,NULL),(95,54,1011,2,1,NULL),(96,54,1001,2,1,NULL),(97,54,1028,1,1,NULL),(98,55,1011,2,1,NULL),(99,55,1001,2,1,NULL),(100,55,1028,1,1,NULL),(101,56,1011,2,1,NULL),(102,56,1001,2,1,NULL),(103,56,1028,1,1,NULL),(104,57,1011,2,1,NULL),(105,57,1001,2,1,NULL),(106,57,1028,1,1,NULL),(107,58,1011,2,1,NULL),(108,58,1001,2,1,NULL),(109,58,1028,1,1,NULL),(110,59,1011,2,1,NULL),(111,59,1001,2,1,NULL),(112,59,1028,1,1,NULL),(113,60,1011,2,1,NULL),(114,60,1001,2,1,NULL),(115,60,1028,1,1,NULL),(116,61,1011,2,1,NULL),(117,61,1001,2,1,NULL),(118,61,1028,1,1,NULL),(119,62,1011,2,1,NULL),(120,62,1001,2,1,NULL),(121,62,1028,1,1,NULL),(122,63,1011,2,1,NULL),(123,63,1001,2,1,NULL),(124,63,1028,1,1,NULL),(125,64,1011,2,1,NULL),(126,64,1001,2,1,NULL),(127,64,1028,1,1,NULL),(128,65,1011,2,1,NULL),(129,65,1001,2,1,NULL),(130,65,1028,1,1,NULL),(131,66,1011,2,1,NULL),(132,66,1001,2,1,NULL),(133,66,1028,1,1,NULL),(134,67,1011,2,1,NULL),(135,67,1001,2,1,NULL),(136,67,1028,1,1,NULL),(137,68,1011,2,1,NULL),(138,68,1001,2,1,NULL),(139,68,1028,1,1,NULL),(140,69,1011,2,1,NULL),(141,69,1001,2,1,NULL),(142,69,1028,1,1,NULL),(143,70,1011,2,1,NULL),(144,70,1001,2,1,NULL),(145,70,1028,1,1,NULL),(146,71,1011,2,1,NULL),(147,71,1001,2,1,NULL),(148,71,1028,1,1,NULL),(149,72,1011,2,1,NULL),(150,72,1001,2,1,NULL),(151,72,1028,1,1,NULL),(152,73,1011,2,1,NULL),(153,73,1001,2,1,NULL),(154,73,1028,1,1,NULL),(155,74,1011,2,1,NULL),(156,74,1001,2,1,NULL),(157,74,1028,1,1,NULL),(158,75,1011,2,1,NULL),(159,75,1001,2,1,NULL),(160,75,1028,1,1,NULL),(161,76,1011,2,1,NULL),(162,76,1001,2,1,NULL),(163,76,1028,1,1,NULL),(164,77,1011,2,1,NULL),(165,77,1001,2,1,NULL),(166,77,1028,1,1,NULL),(167,78,1011,2,1,NULL),(168,78,1001,2,1,NULL),(169,78,1028,1,1,NULL),(170,79,1011,2,1,NULL),(171,79,1001,2,1,NULL),(172,79,1028,1,1,NULL),(173,80,1011,2,1,NULL),(174,80,1001,2,1,NULL),(175,80,1028,1,1,NULL),(176,81,1011,2,1,NULL),(177,81,1001,2,1,NULL),(178,81,1028,1,1,NULL),(179,82,1011,2,1,NULL),(180,82,1001,2,1,NULL),(181,82,1028,1,1,NULL),(182,83,1011,2,1,NULL),(183,83,1001,2,1,NULL),(184,83,1028,1,1,NULL),(185,84,1011,2,1,NULL),(186,84,1001,2,1,NULL),(187,84,1028,1,1,NULL),(188,85,1011,2,1,NULL),(189,85,1001,2,1,NULL),(190,85,1028,1,1,NULL),(191,86,1011,2,1,NULL),(192,86,1001,2,1,NULL),(193,86,1028,1,1,NULL),(194,87,1001,2,1,NULL),(195,87,1028,1,1,NULL),(196,88,1011,2,1,NULL),(197,88,1001,2,1,NULL),(198,88,1028,1,1,NULL),(199,89,1011,2,1,NULL),(200,89,1001,2,1,NULL),(201,89,1028,1,1,NULL),(202,90,1011,2,1,NULL),(203,90,1001,2,1,NULL),(204,90,1028,1,1,NULL),(205,91,1011,2,1,NULL),(206,91,1001,2,1,NULL),(207,91,1028,1,1,NULL),(208,92,1001,1,1,NULL),(209,93,1001,1,1,NULL),(210,94,1001,1,1,NULL),(211,95,1020,1,1,NULL),(212,96,1020,1,1,NULL),(213,97,1001,1,1,NULL),(214,97,1020,1,1,NULL),(215,98,1000,5,1,NULL);
/*!40000 ALTER TABLE `comreserve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comsize`
--

DROP TABLE IF EXISTS `comsize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comsize` (
  `comsizeid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `comid` int(11) NOT NULL COMMENT '关联商品编号',
  `size` varchar(600) NOT NULL COMMENT '尺寸',
  PRIMARY KEY (`comsizeid`),
  KEY `comid` (`comid`),
  CONSTRAINT `comsize_ibfk_1` FOREIGN KEY (`comid`) REFERENCES `commodity` (`comid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comsize`
--

LOCK TABLES `comsize` WRITE;
/*!40000 ALTER TABLE `comsize` DISABLE KEYS */;
INSERT INTO `comsize` VALUES (1,1000,'0'),(2,1001,'0'),(3,1002,'0'),(4,1003,'0'),(5,1004,'0'),(6,1005,'0'),(7,1005,'0'),(8,1007,'0'),(9,1008,'0'),(10,1009,'0'),(11,1010,'0'),(12,1011,'0'),(13,1012,'0'),(14,1013,'0'),(15,1014,'0'),(16,1015,'0'),(17,1016,'0'),(18,1017,'0'),(19,1018,'0'),(20,1019,'0'),(21,1020,'0'),(22,1021,'0'),(23,1022,'0'),(24,1021,'0'),(25,1022,'0'),(26,1023,'0'),(27,1024,'0'),(28,1025,'0'),(29,1026,'0'),(30,1027,'0'),(31,1028,'0'),(32,1029,'0'),(33,1030,'0'),(34,1031,'0');
/*!40000 ALTER TABLE `comsize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `aid` varchar(20) NOT NULL COMMENT '关联账号',
  `siteid` int(11) NOT NULL COMMENT '关联地址',
  `sitepurchase` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '购买时间',
  `orderMoney` double NOT NULL COMMENT '金额',
  `orderRemark` varchar(600) DEFAULT NULL COMMENT '备注',
  `comPending` int(11) NOT NULL DEFAULT '1' COMMENT '0代表无效�?1代表有效',
  `comstatic` int(11) NOT NULL DEFAULT '0' COMMENT '0代表未付款，1代表付款',
  `DeliverStatic` int(11) NOT NULL DEFAULT '0' COMMENT '0代表未发货，1代表发货',
  `ReceivablesStatic` int(11) NOT NULL DEFAULT '0' COMMENT '0代表为收货，1代表未收�?',
  PRIMARY KEY (`orderid`),
  KEY `siteid` (`siteid`),
  KEY `aid` (`aid`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`siteid`) REFERENCES `site` (`siteid`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `account` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'niubihh',1,'2019-01-02 12:12:42',0,'',1,1,1,1),(2,'chord',1,'2019-01-02 12:12:42',0,'',1,0,0,0),(3,'chenjiahao',1,'2019-01-02 12:12:42',0,'',1,1,1,1),(4,'admin',1,'2019-01-07 02:58:13',0,'',1,0,0,0),(5,'niubihh',1,'2019-01-07 08:22:00',0,'',1,0,0,0),(6,'niubihh',1,'2019-01-07 09:50:22',0,'',1,0,0,0),(7,'niubihh',1,'2019-01-07 11:10:54',0,'',1,0,0,0),(8,'niubihh',1,'2019-01-07 11:13:22',0,'',1,0,0,0),(9,'niubihh',1,'2019-01-07 12:33:09',0,'',1,0,0,0),(10,'niubihh',1,'2019-01-07 12:36:20',0,'',1,0,0,0),(11,'niubihh',1,'2019-01-07 23:20:53',0,'',1,0,0,0),(12,'niubihh',1,'2019-01-07 23:23:01',0,'',1,0,0,0),(13,'niubihh',1,'2019-01-07 23:34:34',0,'',1,0,0,0),(14,'niubihh',1,'2019-01-07 23:36:28',0,'',1,0,0,0),(15,'niubihh',1,'2019-01-07 23:38:04',0,'',1,0,0,0),(16,'niubihh',1,'2019-01-08 00:06:09',0,'',1,0,0,0),(17,'niubihh',1,'2019-01-08 00:09:18',0,'',1,0,0,0),(18,'niubihh',1,'2019-01-08 00:14:20',0,'',1,0,0,0),(19,'niubihh',1,'2019-01-08 00:14:34',0,'',1,0,0,0),(20,'niubihh',1,'2019-01-08 00:15:20',0,'',1,0,0,0),(21,'niubihh',1,'2019-01-08 00:31:59',0,'',1,0,0,0),(22,'niubihh',1,'2019-01-08 00:36:31',0,'',1,0,0,0),(23,'niubihh',1,'2019-01-08 00:51:05',1000,'加�??',1,0,0,0),(24,'niubihh',1,'2019-01-08 01:07:52',0,'',1,0,0,0),(25,'niubihh',1,'2019-01-08 01:10:27',0,'',1,0,0,0),(26,'niubihh',1,'2019-01-08 01:30:25',0,'',1,0,0,0),(27,'niubihh',1,'2019-01-08 01:31:50',0,'',1,0,0,0),(28,'niubihh',1,'2019-01-08 01:34:14',0,'',1,0,0,0),(29,'niubihh',1,'2019-01-08 01:34:15',0,'',1,0,0,0),(30,'niubihh',1,'2019-01-08 01:34:15',0,'',1,0,0,0),(31,'niubihh',1,'2019-01-08 01:34:16',0,'',1,0,0,0),(32,'niubihh',1,'2019-01-08 01:34:16',0,'',1,0,0,0),(33,'niubihh',1,'2019-01-08 01:34:16',0,'',1,0,0,0),(34,'niubihh',1,'2019-01-08 01:34:38',0,'',1,0,0,0),(35,'niubihh',1,'2019-01-08 01:34:39',0,'',1,0,0,0),(36,'niubihh',1,'2019-01-08 01:34:41',0,'',1,0,0,0),(37,'niubihh',1,'2019-01-08 01:34:41',0,'',1,0,0,0),(38,'niubihh',1,'2019-01-08 01:34:41',0,'',1,0,0,0),(39,'niubihh',1,'2019-01-08 01:34:41',0,'',1,0,0,0),(40,'niubihh',1,'2019-01-08 01:36:03',0,'',1,0,0,0),(41,'niubihh',1,'2019-01-08 01:38:40',0,'',1,0,0,0),(42,'niubihh',1,'2019-01-08 01:40:31',1720,'',1,0,0,0),(43,'niubihh',1,'2019-01-08 01:45:03',1720,'',1,0,0,0),(44,'niubihh',1,'2019-01-08 01:45:27',1720,'',1,0,0,0),(45,'niubihh',1,'2019-01-08 01:45:52',1720,'',1,0,0,0),(46,'niubihh',1,'2019-01-08 01:45:52',1720,'',1,0,0,0),(47,'niubihh',1,'2019-01-08 01:46:02',1720,'',1,0,0,0),(48,'niubihh',1,'2019-01-08 01:46:45',1720,'',1,0,0,0),(49,'niubihh',1,'2019-01-08 01:47:36',1720,'',1,0,0,0),(50,'niubihh',1,'2019-01-08 01:48:14',1720,'',1,0,0,0),(51,'niubihh',1,'2019-01-08 01:51:22',1720,'',1,0,0,0),(52,'niubihh',1,'2019-01-08 01:52:37',1720,'',1,0,0,0),(53,'niubihh',1,'2019-01-08 01:59:24',1720,'',1,0,0,0),(54,'niubihh',1,'2019-01-08 02:06:29',1720,'',1,0,0,0),(55,'niubihh',1,'2019-01-08 02:08:51',1720,'',1,0,0,0),(56,'niubihh',1,'2019-01-08 02:16:20',1720,'',1,0,0,0),(57,'niubihh',1,'2019-01-08 02:18:07',1720,'',1,0,0,0),(58,'niubihh',1,'2019-01-08 02:21:24',1720,'',1,0,0,0),(59,'niubihh',1,'2019-01-08 02:22:22',1720,'',1,0,0,0),(60,'niubihh',1,'2019-01-08 02:22:53',1720,'',1,0,0,0),(61,'niubihh',1,'2019-01-08 02:24:22',1720,'',1,0,0,0),(62,'niubihh',1,'2019-01-08 02:24:57',1720,'',1,0,0,0),(63,'niubihh',1,'2019-01-08 02:25:41',1720,'',1,0,0,0),(64,'niubihh',1,'2019-01-08 02:29:32',1720,'',1,0,0,0),(65,'niubihh',1,'2019-01-08 02:30:03',1720,'',1,0,0,0),(66,'niubihh',1,'2019-01-08 02:31:34',1720,'',1,0,0,0),(67,'niubihh',1,'2019-01-08 02:31:51',1720,'',1,0,0,0),(68,'niubihh',1,'2019-01-08 03:35:42',1720,'',1,0,0,0),(69,'niubihh',1,'2019-01-08 03:37:29',1720,'',1,0,0,0),(70,'niubihh',1,'2019-01-08 03:37:53',1720,'',1,0,0,0),(71,'niubihh',1,'2019-01-08 03:39:26',1720,'',1,0,0,0),(72,'niubihh',1,'2019-01-08 03:40:58',1720,'',1,0,0,0),(73,'niubihh',1,'2019-01-08 03:41:03',1720,'',1,0,0,0),(74,'niubihh',1,'2019-01-08 03:41:07',1720,'',1,0,0,0),(75,'niubihh',1,'2019-01-08 07:06:42',1720,'',1,0,0,0),(76,'niubihh',2,'2019-01-08 07:10:04',1720,'麻烦快一点发�? 挺�?�的',1,1,0,0),(77,'niubihh',1,'2019-01-08 07:11:17',1720,'',1,0,0,0),(78,'niubihh',1,'2019-01-08 07:12:45',1720,'',1,0,0,0),(79,'niubihh',2,'2019-01-08 07:13:19',1720,'加�??',1,1,0,0),(80,'niubihh',1,'2019-01-08 07:40:10',1720,'',1,0,0,0),(81,'niubihh',1,'2019-01-08 07:41:53',1720,'',1,0,0,0),(82,'niubihh',1,'2019-01-08 07:45:43',1720,'',1,0,0,0),(83,'niubihh',1,'2019-01-08 07:49:54',1720,'',1,0,0,0),(84,'niubihh',1,'2019-01-08 07:54:27',1720,'',1,0,0,0),(85,'niubihh',1,'2019-01-08 07:56:32',1720,'备注：麻烦快�?�?',1,1,0,0),(86,'niubihh',1,'2019-01-08 07:58:00',1720,'备注�?',1,1,0,0),(87,'niubihh',1,'2019-01-08 08:04:07',1720,'备注：加急噢',1,1,0,0),(88,'niubihh',1,'2019-01-08 08:09:09',1720,'备注�?',1,1,0,0),(89,'niubihh',1,'2019-01-08 08:23:10',1720,'备注�?',1,1,0,0),(90,'niubihh',1,'2019-01-08 08:24:16',1720,'',1,0,0,0),(91,'niubihh',1,'2019-01-08 08:24:40',1720,'',1,0,0,0),(92,'niubihh',1,'2019-01-08 09:34:46',300,'备注：加急噢！！',1,1,0,0),(93,'niubihh',1,'2019-01-08 09:35:44',300,'备注�?',1,1,0,0),(94,'niubihh',1,'2019-01-08 09:36:48',300,'备注�?',1,1,0,0),(95,'niubihh',1,'2019-01-08 09:38:27',320,'备注�?',1,1,1,1),(96,'niubihh',1,'2019-01-08 09:39:52',320,'备注�?',1,1,1,1),(97,'niubihh',1,'2019-01-08 09:47:45',620,'备注：加�?',1,1,1,1),(98,'niubihh',2,'2019-01-10 02:43:38',1500,'备注�?',1,1,0,0);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund`
--

DROP TABLE IF EXISTS `refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `refund` (
  `refundid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `orderid` int(11) NOT NULL COMMENT '关联订单编号',
  `refundMoney` double NOT NULL COMMENT '�?款金�?',
  `refundRemark` varchar(600) NOT NULL COMMENT '�?款备�?',
  `refundstatic` int(11) NOT NULL DEFAULT '0' COMMENT '是否同意�?�? 0代表未处理，1代表同意 2代表不同�?',
  `refundTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�?款时�?',
  `refundMerchantRemark` varchar(600) NOT NULL COMMENT '商家备注',
  PRIMARY KEY (`refundid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `refund_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `order` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcar`
--

DROP TABLE IF EXISTS `shoppingcar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shoppingcar` (
  `scarid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `aid` varchar(20) NOT NULL COMMENT '关联账号',
  `comid` int(11) NOT NULL COMMENT '关联商品',
  `comsizeid` int(11) NOT NULL COMMENT '关联尺寸',
  `comcolorid` int(11) NOT NULL COMMENT '关联颜色',
  `scarcount` int(11) NOT NULL DEFAULT '1' COMMENT '商品的个�?',
  PRIMARY KEY (`scarid`),
  KEY `aid` (`aid`),
  KEY `comid` (`comid`),
  KEY `comsizeid` (`comsizeid`),
  KEY `comcolorid` (`comcolorid`),
  CONSTRAINT `shoppingcar_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `account` (`aid`),
  CONSTRAINT `shoppingcar_ibfk_2` FOREIGN KEY (`comid`) REFERENCES `commodity` (`comid`),
  CONSTRAINT `shoppingcar_ibfk_3` FOREIGN KEY (`comsizeid`) REFERENCES `comsize` (`comsizeid`),
  CONSTRAINT `shoppingcar_ibfk_4` FOREIGN KEY (`comcolorid`) REFERENCES `comcolor` (`comcolorid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcar`
--

LOCK TABLES `shoppingcar` WRITE;
/*!40000 ALTER TABLE `shoppingcar` DISABLE KEYS */;
INSERT INTO `shoppingcar` VALUES (22,'niubihh',1001,1,1,1);
/*!40000 ALTER TABLE `shoppingcar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `site` (
  `siteid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `aid` varchar(20) NOT NULL COMMENT '关联账号',
  `sitename` varchar(20) NOT NULL COMMENT '收件人姓�?',
  `sitephone` varchar(11) NOT NULL COMMENT '电话',
  `siteprovince` varchar(100) NOT NULL COMMENT '�?',
  `sitecity` varchar(100) NOT NULL COMMENT '�?',
  `sitecounty` varchar(100) NOT NULL COMMENT '�?',
  `sitedetailed` varchar(240) NOT NULL COMMENT '地址详细',
  PRIMARY KEY (`siteid`),
  KEY `aid` (`aid`),
  CONSTRAINT `site_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `account` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,'niubihh','陈佳�?','15073034644','广东�?','珠海�?','斗门�?','白蕉南路29号南方it学院'),(2,'niubihh','陈佳�?','15073034644','湖南�?','岳阳�?','岳阳�?','张古英镇绕村');
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `aid` varchar(20) NOT NULL COMMENT '账号',
  `uidentityid` char(18) NOT NULL COMMENT '身份�?',
  `uname` varchar(20) NOT NULL COMMENT '姓名',
  `umail` varchar(20) NOT NULL COMMENT '邮箱',
  `uphone` varchar(20) NOT NULL COMMENT '手机',
  `uportrait` varchar(160) NOT NULL COMMENT '头像',
  PRIMARY KEY (`uid`),
  KEY `aid` (`aid`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `account` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','43062120000204907X','陈佳�?','JHaoC@qq.com','15073034644','admin.jpg'),(2,'zhangshang','43062120000204907x','a','a@qq.com','15073034644','a.jpg'),(3,'lisi','43062120000204907x','b','b@qq.com','15073034644','b.jpg'),(4,'wanwu','43062120000204907x','c','c@qq.com','15073034644','c.jpg'),(5,'zhaoliu','43062120000204907x','d','d@qq.com','15073034644','d.jpg'),(6,'tianqi','43062120000204907x','e','e@qq.com','15073034644','e.jpg'),(7,'rows','43062120000204907x','f','f@qq.com','15073034644','f.jpg'),(8,'jack','43062120000204907x','g','g@qq.com','15073034644','g.jpg'),(9,'tom','43062120000204907x','h','h@qq.com','15073034644','h.jpg'),(10,'chenduxiu','43062120000204907x','i','i@qq.com','15073034644','i.jpg'),(11,'wanfugui','43062120000204907x','j','j@qq.com','15073034644','j.jpg'),(12,'chord','430523200004103540','陈小�?','3207595430@qq.com','15919267047','chord.jpg'),(13,'chenjiahao','43062120000204907x','陈佳�?','472674014@qq.com','15073034644','chenjiahao.jpg'),(14,'niubihh','43062120000204907x','陈佳�?','JHaoC@qq.com','15073034644','niubihh.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-11  9:14:08
