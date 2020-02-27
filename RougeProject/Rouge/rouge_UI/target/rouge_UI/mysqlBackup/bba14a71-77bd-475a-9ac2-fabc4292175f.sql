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
INSERT INTO `account` VALUES ('a','21232f297a57a5a743894a0e4a801fc3',1,1),('admin','21232f297a57a5a743894a0e4a801fc3',1,1),('b','e10adc3949ba59abbe56e057f20f883e',3,1),('c','e10adc3949ba59abbe56e057f20f883e',3,0),('d','d352079b056a133a60c1f3091437fe23',2,0),('e','e10adc3949ba59abbe56e057f20f883e',3,0),('f','d352079b056a133a60c1f3091437fe23',2,0),('g','e10adc3949ba59abbe56e057f20f883e',3,0),('h','d352079b056a133a60c1f3091437fe23',2,0),('niubihh','d352079b056a133a60c1f3091437fe23',2,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounttype`
--

LOCK TABLES `accounttype` WRITE;
/*!40000 ALTER TABLE `accounttype` DISABLE KEYS */;
INSERT INTO `accounttype` VALUES (1,'管理�?'),(2,'会员用户'),(3,'普�?�用�?');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup`
--

LOCK TABLES `backup` WRITE;
/*!40000 ALTER TABLE `backup` DISABLE KEYS */;
INSERT INTO `backup` VALUES (1,'niubihh.sql','2018-12-16 13:29:19',''),(2,'bba14a71-77bd-475a-9ac2-fabc4292175f','2018-12-17 00:15:57','');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
INSERT INTO `collect` VALUES (1,'admin',1),(2,'admin',2),(3,'admin',3),(4,'niubihh',1),(5,'niubihh',2);
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (5,'admin',1,'非常的nice',10,'abc.jpg'),(6,'niubihh',1,'非常的nice',10,'abc.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity`
--

LOCK TABLES `commodity` WRITE;
/*!40000 ALTER TABLE `commodity` DISABLE KEYS */;
INSERT INTO `commodity` VALUES (1,'魅惑釉唇�?',1,260.5,'全新魅惑釉唇�?',0,12),(2,'后台彩妆双用粉底�?',2,400,'后台彩妆双用粉底液是彩妆师的秘密武器，可随心叠加，自由定制遮盖力，打造从自然到无瑕的专业级底妆�??',1,3),(3,'五色眼影',5,600,'经典五色眼影，以专业级彩妆技艺融合高订色彩，打�?�魅惑美眸�?�前�?未有的灵感创意，更胜以往的浓郁色泽，多种妆效随心变幻，层叠搭配出自我表达的无限可能�??',0,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodityimg`
--

LOCK TABLES `commodityimg` WRITE;
/*!40000 ALTER TABLE `commodityimg` DISABLE KEYS */;
INSERT INTO `commodityimg` VALUES (1,1,'1.jpg'),(2,1,'2.jpg'),(3,1,'3.jpg'),(4,2,'5.jpg'),(5,3,'6.jpg'),(6,3,'7.jpg');
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
  PRIMARY KEY (`crid`),
  KEY `orderid` (`orderid`),
  KEY `comid` (`comid`),
  CONSTRAINT `comreserve_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `order` (`orderid`),
  CONSTRAINT `comreserve_ibfk_2` FOREIGN KEY (`comid`) REFERENCES `commodity` (`comid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comreserve`
--

LOCK TABLES `comreserve` WRITE;
/*!40000 ALTER TABLE `comreserve` DISABLE KEYS */;
INSERT INTO `comreserve` VALUES (1,1,1,2),(2,1,2,1),(3,1,3,1),(4,2,1,2),(5,2,2,1),(6,2,3,1);
/*!40000 ALTER TABLE `comreserve` ENABLE KEYS */;
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
  `orderRemark` varchar(600) NOT NULL COMMENT '备注',
  `comstatic` int(11) NOT NULL DEFAULT '0' COMMENT '0代表未付款，1代表付款',
  PRIMARY KEY (`orderid`),
  KEY `siteid` (`siteid`),
  KEY `aid` (`aid`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`siteid`) REFERENCES `site` (`siteid`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `account` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'admin',1,'2018-12-16 13:29:18',0,'',0),(2,'admin',1,'2018-12-16 13:29:18',0,'',0),(3,'niubihh',1,'2018-12-16 13:29:18',0,'',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
INSERT INTO `refund` VALUES (1,1,0,'',0,'2018-12-16 13:29:18','');
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
  `scarcount` int(11) NOT NULL DEFAULT '1' COMMENT '商品的个�?',
  PRIMARY KEY (`scarid`),
  KEY `aid` (`aid`),
  KEY `comid` (`comid`),
  CONSTRAINT `shoppingcar_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `account` (`aid`),
  CONSTRAINT `shoppingcar_ibfk_2` FOREIGN KEY (`comid`) REFERENCES `commodity` (`comid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcar`
--

LOCK TABLES `shoppingcar` WRITE;
/*!40000 ALTER TABLE `shoppingcar` DISABLE KEYS */;
INSERT INTO `shoppingcar` VALUES (1,'admin',1,2),(2,'admin',2,1),(3,'admin',3,1),(4,'niubihh',1,2),(5,'niubihh',2,1),(6,'niubihh',3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,'admin','陈佳�?','15073034644','广东�?','珠海�?','斗门�?','白蕉南路29号南方it学院');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','43062120000204907X','陈佳�?','JHaoC@qq.com','15073034644','admin.jpg'),(2,'a','43062120000204907X','陈佳�?','JHaoC@qq.com','15073034644','admin.jpg'),(3,'b','43062120000204907x','牛�?�哄�?','niubihh@qq.com','15073034644','niubihh.jpg'),(4,'c','43062120000204907x','牛�?�哄�?','niubihh@qq.com','15073034644','niubihh.jpg'),(5,'d','43062120000204907x','牛�?�哄�?','niubihh@qq.com','15073034644','niubihh.jpg'),(6,'e','43062120000204907x','牛�?�哄�?','niubihh@qq.com','15073034644','niubihh.jpg'),(7,'f','43062120000204907x','牛�?�哄�?','niubihh@qq.com','15073034644','niubihh.jpg'),(8,'g','43062120000204907x','牛�?�哄�?','niubihh@qq.com','15073034644','niubihh.jpg'),(9,'h','43062120000204907x','牛�?�哄�?','niubihh@qq.com','15073034644','niubihh.jpg'),(10,'niubihh','43062120000204907x','牛�?�哄�?','niubihh@qq.com','15073034644','niubihh.jpg');
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

-- Dump completed on 2018-12-17  8:15:58
