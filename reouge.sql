drop table if exists accountType;
drop table if exists account;
drop table if exists `user`;
drop table if exists commodityType;
drop table if exists commodity;
drop table if exists site;
drop table if exists `order`;
drop table if exists `comreserve`;
drop table if exists shoppingcar;
drop table if exists collect;
drop table if exists `comment`;


-- 账号类型 
CREATE TABLE `accountType` (
`atid` int NOT NULL AUTO_INCREMENT COMMENT '账号类型编号' ,
`atname` varchar(20) NOT NULL COMMENT '类型名称' ,
PRIMARY KEY (`atid`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
;
INSERT INTO accountType(atname) VALUES
('管理员'),
('会员用户'),
('普通用户')
SELECT * FROM accountType

DELETE FROM accounttype WHERE atid in(4,5,6)
DELETE FROM accounttype WHERE atid ( 7 , 8 ) 

-- 账号
CREATE TABLE `account` (
 aid  varchar(20) NOT NULL COMMENT '账号' ,
 apassword  varchar(260) NOT NULL COMMENT '密码' ,
 atid int NOT NULL COMMENT '账号类型编号' ,
 astatic int NOT NULL DEFAULT 1 COMMENT '0代表冻结，1代表活跃' ,
PRIMARY KEY (aid),
FOREIGN KEY(atid) REFERENCES accountType(atid)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
;
INSERT into account(aid,apassword,atid,astatic) VALUES('e',MD5('admin'),1,1),
('f',MD5('123456'),3,1),
('g',MD5('123456'),3,0),
('h',MD5('686868'),2,0)
SELECT * FROM account


SELECT * FROM account 

UPDATE account set atid=2 ,aid='lisi' WHERE aid='lisi'

SELECT COUNT(*) FROM account WHERE apassword=MD5('admin') and aid='admin'

-- 用户信息 
CREATE TABLE `user` (
`uid` int NOT NULL AUTO_INCREMENT COMMENT '主键' ,
 aid varchar(20) NOT NULL COMMENT '账号' ,
 uidentityid  char(18) NOT NULL COMMENT '身份证' ,
 uname varchar(20) NOT NULL COMMENT '姓名' ,
 umail varchar(20) NOT NULL COMMENT '邮箱' ,
 uphone varchar(20) NOT NULL COMMENT '手机' ,
 uportrait varchar(160) NOT NULL COMMENT '头像' ,
PRIMARY KEY (uid),
FOREIGN KEY(aid) REFERENCES account(aid)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `user`(aid,uidentityid,uname,umail,uphone,uportrait) VALUES
('a','43062120000204907X','陈佳豪','JHaoC@qq.com','15073034644','admin.jpg'),
('b','43062120000204907x','牛逼哄哄','niubihh@qq.com','15073034644','niubihh.jpg'),
('c','43062120000204907x','牛逼哄哄','niubihh@qq.com','15073034644','niubihh.jpg'),

('d','43062120000204907x','牛逼哄哄','niubihh@qq.com','15073034644','niubihh.jpg'),

('e','43062120000204907x','牛逼哄哄','niubihh@qq.com','15073034644','niubihh.jpg'),

('f','43062120000204907x','牛逼哄哄','niubihh@qq.com','15073034644','niubihh.jpg'),

('g','43062120000204907x','牛逼哄哄','niubihh@qq.com','15073034644','niubihh.jpg'),
('h','43062120000204907x','牛逼哄哄','niubihh@qq.com','15073034644','niubihh.jpg')

UPDATE  `user` SET  uidentityid='1086',uname='niubihh' ,umail='10086@qq.com',uphone='10086',uportrait='10086.jpg' WHERE aid='niubihh'

DELETE FROM  `user` WHERE uid=4
SELECT * FROM `user`

-- 商品类型 
CREATE TABLE `commodityType` (
`comtid` int NOT NULL AUTO_INCREMENT COMMENT '商品类型编号',
`comtname` varchar(20) NOT NULL COMMENT '类型名称' ,
PRIMARY KEY (`comtid`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


INSERT INTO `commodityType`(comtname) VALUES
('口红'),
('粉底'),
('腮红'),
('护肤'),
('眼影')
SELECT * FROM commodityType

-- 商品
CREATE TABLE `commodity` (
`comid` int NOT NULL AUTO_INCREMENT COMMENT '主键编号' ,
 comname varchar(160) NOT NULL COMMENT '商品名称' ,
 comtid  int NOT NULL COMMENT '商品类型编号' ,
 comprice DOUBLE NOT NULL COMMENT '商品价格',
-- comimg varchar(160) NOT NULL COMMENT '商品图片' ,
 comproduce varchar(1000) NOT NULL COMMENT '商品详细描述',
 comstatic int NOT NULL DEFAULT 1 COMMENT '0代表下架，1代表销售' ,
 cominventory int NOT NULL COMMENT '库存' ,
PRIMARY KEY (comid),
FOREIGN KEY(comtid) REFERENCES commodityType(comtid)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `commodity`(comname,comtid,comprice,comproduce,comstatic,cominventory) VALUES
('魅惑釉唇膏',1,260.5,'全新魅惑釉唇膏',0,12),
('后台彩妆双用粉底液',2,400,'后台彩妆双用粉底液是彩妆师的秘密武器，可随心叠加，自由定制遮盖力，打造从自然到无瑕的专业级底妆。',DEFAULT,3),
('五色眼影',5,600,'经典五色眼影，以专业级彩妆技艺融合高订色彩，打造魅惑美眸。前所未有的灵感创意，更胜以往的浓郁色泽，多种妆效随心变幻，层叠搭配出自我表达的无限可能。',0,6)
SELECT * FROM commodity
SELECT comid, comname, commodity.comtid, comprice, comproduce, comstatic, cominventory, comtname FROM commodity INNER JOIN commoditytype ON commodity.comid = commoditytype.comtid 

UPDATE commodity SET comname='魅力',comtid=2,comprice=432.1,comproduce='魅力无限',comstatic=DEFAULT,cominventory=12 WHERE comid=4

-- 商品图片
CREATE TABLE `commodityImg`(
`comiid` int NOT NULL AUTO_INCREMENT COMMENT '图片编号',
`comid` int NOT NULL COMMENT '图片编号' ,
`imgpath` varchar(20) NOT NULL COMMENT '图片路径',
PRIMARY KEY (`comiid`),
FOREIGN KEY(comid) REFERENCES commodity(comid)
)
INSERT INTO `commodityImg`(comid,imgpath) VALUES
(1,'1.jpg'),
(1,'2.jpg'),
(1,'3.jpg'),
(2,'5.jpg'),
(3,'6.jpg'),
(3,'7.jpg')
SELECT * FROM commodityImg


-- 地址
CREATE TABLE `site` (
`siteid` int NOT NULL AUTO_INCREMENT COMMENT '主键编号' ,
 aid varchar(20) NOT NULL COMMENT '关联账号' ,
 sitename  varchar(20) NOT NULL COMMENT '收件人姓名' ,
 sitephone VARCHAR(11) NOT NULL COMMENT '电话' ,
 siteprovince varchar(100) NOT NULL COMMENT '省' ,
 sitecity varchar(100) NOT NULL COMMENT '市' ,
 sitecounty varchar(100) NOT NULL COMMENT '县' ,
 sitedetailed varchar(240) NOT NULL COMMENT '地址详细' ,
PRIMARY KEY (siteid),
FOREIGN KEY(aid) REFERENCES account(aid)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `site`(aid,sitename,sitephone,siteprovince,sitecity,sitecounty,sitedetailed) VALUES
('admin','陈佳豪','15073034644','广东省','珠海市','斗门区','白蕉南路29号南方it学院')

UPDATE site SET sitename='1',sitephone='1',siteprovince='1',sitecity='1',sitecounty='1',sitedetailed='1' WHERE  siteid=1

SELECT * FROM site WHERE aid='admin'

-- 购物车
CREATE TABLE `shoppingcar` (
`scarid` int NOT NULL AUTO_INCREMENT COMMENT '主键编号',
 aid varchar(20) NOT NULL COMMENT '关联账号',
 comid  int NOT NULL COMMENT '关联商品',
 scarcount  int  NOT NULL DEFAULT 1 COMMENT '商品的个数',
PRIMARY KEY (scarid),
FOREIGN KEY(aid) REFERENCES account(aid),
FOREIGN KEY(comid) REFERENCES commodity(comid)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `shoppingcar`(aid,comid,scarcount) VALUES
('admin',1,2),
('admin',2,1),
('admin',3,1)

INSERT INTO `shoppingcar`(aid,comid,scarcount) VALUES
('niubihh',1,2),
('niubihh',2,1),
('niubihh',3,1)

DELETE FROM shoppingcar WHERE scarid=13
DELETE FROM shoppingcar WHERE scarid=14
DELETE FROM shoppingcar WHERE scarid=15

SELECT * FROM shoppingcar where aid='niubihh'


-- 订单
CREATE TABLE `order` (
`orderid` int NOT NULL AUTO_INCREMENT COMMENT '订单编号' ,
 aid varchar(20) NOT NULL COMMENT '关联账号' ,
 siteid  int NOT NULL COMMENT '关联地址' ,
 sitepurchase TIMESTAMP default now() comment '购买时间',
 orderMoney DOUBLE NOT NULL comment '金额',
 orderRemark varchar(600)  NOT NULL comment '备注',
 comstatic int NOT NULL DEFAULT 0 COMMENT '0代表未付款，1代表付款' ,
PRIMARY KEY (orderid),
FOREIGN KEY(siteid) REFERENCES site(siteid),
FOREIGN KEY(aid) REFERENCES account(aid)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

UPDATE `order` set  siteid=1,sitepurchase=DEFAULT,orderMoney=100,orderRemark='加急',comstatic=0 WHERE orderid=1

SELECT * FROM `order` where orderid=1

   INSERT INTO `order`(aid,siteid,sitepurchase,orderMoney,orderRemark,comstatic) VALUES
  ('admin',1,DEFAULT,0,'',DEFAULT)

INSERT INTO `order`(aid,siteid,sitepurchase,orderMoney,orderRemark,comstatic) VALUES
('admin',1,DEFAULT,0,"",DEFAULT)


INSERT INTO `order`(aid,siteid,sitepurchase,orderMoney,orderRemark,comstatic) VALUES
('niubihh',1,DEFAULT,0,"",DEFAULT)





SELECT * FROM `comreserve` cr INNER JOIN `order` o on cr.orderid=o.orderid WHERE o.aid='admin'

-- 预订单表
CREATE TABLE `comreserve` (
`crid` int NOT NULL AUTO_INCREMENT COMMENT '主键编号' ,
 orderid int NOT NULL COMMENT '关联订单编号',
 comid  int NOT NULL COMMENT '关联商品',
 crcount  int  NOT NULL DEFAULT 1 COMMENT '商品的个数' ,
PRIMARY KEY (crid),
FOREIGN KEY(orderid) REFERENCES `order`(orderid),
FOREIGN KEY(comid) REFERENCES commodity(comid)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `comreserve`(orderid,comid,crcount) VALUES
(1,1,2),
(1,2,1),
(1,3,1)
INSERT INTO `comreserve`(orderid,comid,crcount) VALUES
(2,1,2),
(2,2,1),
(2,3,1)

SELECT * from comreserve 



-- 收藏
CREATE TABLE `collect` (
`collectid` int NOT NULL AUTO_INCREMENT COMMENT '收藏编号' ,
 aid varchar(20) NOT NULL COMMENT '关联账号' ,
 comid  int NOT NULL COMMENT '关联商品' ,
PRIMARY KEY (collectid),
FOREIGN KEY(aid) REFERENCES account(aid),
FOREIGN KEY(comid) REFERENCES commodity(comid)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
INSERT INTO `collect`(aid,comid) VALUES
('admin',1),
('admin',2),
('admin',3)
INSERT INTO `collect`(aid,comid) VALUES
('niubihh',1),
('niubihh',2)
SELECT * FROM collect WHERE aid='admin'


-- 评论
CREATE TABLE `comment` (
`commentid`  int NOT NULL AUTO_INCREMENT COMMENT '评论编号' ,
 aid varchar(20) NOT NULL COMMENT '关联账号' ,
 comid  int NOT NULL COMMENT '关联商品',
`content`  varchar(240) NOT NULL COMMENT '内容' ,
`grade`  int(100) NOT NULL COMMENT '打分' ,
 commentimg varchar(160) NOT NULL COMMENT '图片' ,
PRIMARY KEY (`commentid`),
foreign key(`aid`)references account(`aid`),
FOREIGN KEY(comid) REFERENCES commodity(comid)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
INSERT INTO `comment`(aid,comid,content,grade,commentimg) VALUES
('admin',1,'非常的nice',10,'abc.jpg'),
('niubihh',1,'非常的nice',10,'abc.jpg')
 
SELECT* FROM `comment` WHERE aid='admin' and comid=1

UPDATE `comment` SET content='非常的不错!' ,grade=10,commentimg='nice.jpg' WHERE commentid=7

DELETE FROM `comment` WHERE commentid =8  AND 
