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


-- �˺����� 
CREATE TABLE `accountType` (
`atid` int NOT NULL AUTO_INCREMENT COMMENT '�˺����ͱ��' ,
`atname` varchar(20) NOT NULL COMMENT '��������' ,
PRIMARY KEY (`atid`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
;
INSERT INTO accountType(atname) VALUES
('����Ա'),
('��Ա�û�'),
('��ͨ�û�')
SELECT * FROM accountType

DELETE FROM accounttype WHERE atid in(4,5,6)
DELETE FROM accounttype WHERE atid ( 7 , 8 ) 

-- �˺�
CREATE TABLE `account` (
 aid  varchar(20) NOT NULL COMMENT '�˺�' ,
 apassword  varchar(260) NOT NULL COMMENT '����' ,
 atid int NOT NULL COMMENT '�˺����ͱ��' ,
 astatic int NOT NULL DEFAULT 1 COMMENT '0�����ᣬ1�����Ծ' ,
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

-- �û���Ϣ 
CREATE TABLE `user` (
`uid` int NOT NULL AUTO_INCREMENT COMMENT '����' ,
 aid varchar(20) NOT NULL COMMENT '�˺�' ,
 uidentityid  char(18) NOT NULL COMMENT '���֤' ,
 uname varchar(20) NOT NULL COMMENT '����' ,
 umail varchar(20) NOT NULL COMMENT '����' ,
 uphone varchar(20) NOT NULL COMMENT '�ֻ�' ,
 uportrait varchar(160) NOT NULL COMMENT 'ͷ��' ,
PRIMARY KEY (uid),
FOREIGN KEY(aid) REFERENCES account(aid)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `user`(aid,uidentityid,uname,umail,uphone,uportrait) VALUES
('a','43062120000204907X','�¼Ѻ�','JHaoC@qq.com','15073034644','admin.jpg'),
('b','43062120000204907x','ţ�ƺ��','niubihh@qq.com','15073034644','niubihh.jpg'),
('c','43062120000204907x','ţ�ƺ��','niubihh@qq.com','15073034644','niubihh.jpg'),

('d','43062120000204907x','ţ�ƺ��','niubihh@qq.com','15073034644','niubihh.jpg'),

('e','43062120000204907x','ţ�ƺ��','niubihh@qq.com','15073034644','niubihh.jpg'),

('f','43062120000204907x','ţ�ƺ��','niubihh@qq.com','15073034644','niubihh.jpg'),

('g','43062120000204907x','ţ�ƺ��','niubihh@qq.com','15073034644','niubihh.jpg'),
('h','43062120000204907x','ţ�ƺ��','niubihh@qq.com','15073034644','niubihh.jpg')

UPDATE  `user` SET  uidentityid='1086',uname='niubihh' ,umail='10086@qq.com',uphone='10086',uportrait='10086.jpg' WHERE aid='niubihh'

DELETE FROM  `user` WHERE uid=4
SELECT * FROM `user`

-- ��Ʒ���� 
CREATE TABLE `commodityType` (
`comtid` int NOT NULL AUTO_INCREMENT COMMENT '��Ʒ���ͱ��',
`comtname` varchar(20) NOT NULL COMMENT '��������' ,
PRIMARY KEY (`comtid`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


INSERT INTO `commodityType`(comtname) VALUES
('�ں�'),
('�۵�'),
('����'),
('����'),
('��Ӱ')
SELECT * FROM commodityType

-- ��Ʒ
CREATE TABLE `commodity` (
`comid` int NOT NULL AUTO_INCREMENT COMMENT '�������' ,
 comname varchar(160) NOT NULL COMMENT '��Ʒ����' ,
 comtid  int NOT NULL COMMENT '��Ʒ���ͱ��' ,
 comprice DOUBLE NOT NULL COMMENT '��Ʒ�۸�',
-- comimg varchar(160) NOT NULL COMMENT '��ƷͼƬ' ,
 comproduce varchar(1000) NOT NULL COMMENT '��Ʒ��ϸ����',
 comstatic int NOT NULL DEFAULT 1 COMMENT '0�����¼ܣ�1��������' ,
 cominventory int NOT NULL COMMENT '���' ,
PRIMARY KEY (comid),
FOREIGN KEY(comtid) REFERENCES commodityType(comtid)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `commodity`(comname,comtid,comprice,comproduce,comstatic,cominventory) VALUES
('�Ȼ��Դ���',1,260.5,'ȫ���Ȼ��Դ���',0,12),
('��̨��ױ˫�÷۵�Һ',2,400,'��̨��ױ˫�÷۵�Һ�ǲ�ױʦ�����������������ĵ��ӣ����ɶ����ڸ������������Ȼ����覵�רҵ����ױ��',DEFAULT,3),
('��ɫ��Ӱ',5,600,'������ɫ��Ӱ����רҵ����ױ�����ںϸ߶�ɫ�ʣ������Ȼ�������ǰ��δ�е���д��⣬��ʤ������Ũ��ɫ�󣬶���ױЧ���ı�ã������������ұ������޿��ܡ�',0,6)
SELECT * FROM commodity
SELECT comid, comname, commodity.comtid, comprice, comproduce, comstatic, cominventory, comtname FROM commodity INNER JOIN commoditytype ON commodity.comid = commoditytype.comtid 

UPDATE commodity SET comname='����',comtid=2,comprice=432.1,comproduce='��������',comstatic=DEFAULT,cominventory=12 WHERE comid=4

-- ��ƷͼƬ
CREATE TABLE `commodityImg`(
`comiid` int NOT NULL AUTO_INCREMENT COMMENT 'ͼƬ���',
`comid` int NOT NULL COMMENT 'ͼƬ���' ,
`imgpath` varchar(20) NOT NULL COMMENT 'ͼƬ·��',
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


-- ��ַ
CREATE TABLE `site` (
`siteid` int NOT NULL AUTO_INCREMENT COMMENT '�������' ,
 aid varchar(20) NOT NULL COMMENT '�����˺�' ,
 sitename  varchar(20) NOT NULL COMMENT '�ռ�������' ,
 sitephone VARCHAR(11) NOT NULL COMMENT '�绰' ,
 siteprovince varchar(100) NOT NULL COMMENT 'ʡ' ,
 sitecity varchar(100) NOT NULL COMMENT '��' ,
 sitecounty varchar(100) NOT NULL COMMENT '��' ,
 sitedetailed varchar(240) NOT NULL COMMENT '��ַ��ϸ' ,
PRIMARY KEY (siteid),
FOREIGN KEY(aid) REFERENCES account(aid)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `site`(aid,sitename,sitephone,siteprovince,sitecity,sitecounty,sitedetailed) VALUES
('admin','�¼Ѻ�','15073034644','�㶫ʡ','�麣��','������','�׽���·29���Ϸ�itѧԺ')

UPDATE site SET sitename='1',sitephone='1',siteprovince='1',sitecity='1',sitecounty='1',sitedetailed='1' WHERE  siteid=1

SELECT * FROM site WHERE aid='admin'

-- ���ﳵ
CREATE TABLE `shoppingcar` (
`scarid` int NOT NULL AUTO_INCREMENT COMMENT '�������',
 aid varchar(20) NOT NULL COMMENT '�����˺�',
 comid  int NOT NULL COMMENT '������Ʒ',
 scarcount  int  NOT NULL DEFAULT 1 COMMENT '��Ʒ�ĸ���',
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


-- ����
CREATE TABLE `order` (
`orderid` int NOT NULL AUTO_INCREMENT COMMENT '�������' ,
 aid varchar(20) NOT NULL COMMENT '�����˺�' ,
 siteid  int NOT NULL COMMENT '������ַ' ,
 sitepurchase TIMESTAMP default now() comment '����ʱ��',
 orderMoney DOUBLE NOT NULL comment '���',
 orderRemark varchar(600)  NOT NULL comment '��ע',
 comstatic int NOT NULL DEFAULT 0 COMMENT '0����δ���1������' ,
PRIMARY KEY (orderid),
FOREIGN KEY(siteid) REFERENCES site(siteid),
FOREIGN KEY(aid) REFERENCES account(aid)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

UPDATE `order` set  siteid=1,sitepurchase=DEFAULT,orderMoney=100,orderRemark='�Ӽ�',comstatic=0 WHERE orderid=1

SELECT * FROM `order` where orderid=1

   INSERT INTO `order`(aid,siteid,sitepurchase,orderMoney,orderRemark,comstatic) VALUES
  ('admin',1,DEFAULT,0,'',DEFAULT)

INSERT INTO `order`(aid,siteid,sitepurchase,orderMoney,orderRemark,comstatic) VALUES
('admin',1,DEFAULT,0,"",DEFAULT)


INSERT INTO `order`(aid,siteid,sitepurchase,orderMoney,orderRemark,comstatic) VALUES
('niubihh',1,DEFAULT,0,"",DEFAULT)





SELECT * FROM `comreserve` cr INNER JOIN `order` o on cr.orderid=o.orderid WHERE o.aid='admin'

-- Ԥ������
CREATE TABLE `comreserve` (
`crid` int NOT NULL AUTO_INCREMENT COMMENT '�������' ,
 orderid int NOT NULL COMMENT '�����������',
 comid  int NOT NULL COMMENT '������Ʒ',
 crcount  int  NOT NULL DEFAULT 1 COMMENT '��Ʒ�ĸ���' ,
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



-- �ղ�
CREATE TABLE `collect` (
`collectid` int NOT NULL AUTO_INCREMENT COMMENT '�ղر��' ,
 aid varchar(20) NOT NULL COMMENT '�����˺�' ,
 comid  int NOT NULL COMMENT '������Ʒ' ,
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


-- ����
CREATE TABLE `comment` (
`commentid`  int NOT NULL AUTO_INCREMENT COMMENT '���۱��' ,
 aid varchar(20) NOT NULL COMMENT '�����˺�' ,
 comid  int NOT NULL COMMENT '������Ʒ',
`content`  varchar(240) NOT NULL COMMENT '����' ,
`grade`  int(100) NOT NULL COMMENT '���' ,
 commentimg varchar(160) NOT NULL COMMENT 'ͼƬ' ,
PRIMARY KEY (`commentid`),
foreign key(`aid`)references account(`aid`),
FOREIGN KEY(comid) REFERENCES commodity(comid)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
INSERT INTO `comment`(aid,comid,content,grade,commentimg) VALUES
('admin',1,'�ǳ���nice',10,'abc.jpg'),
('niubihh',1,'�ǳ���nice',10,'abc.jpg')
 
SELECT* FROM `comment` WHERE aid='admin' and comid=1

UPDATE `comment` SET content='�ǳ��Ĳ���!' ,grade=10,commentimg='nice.jpg' WHERE commentid=7

DELETE FROM `comment` WHERE commentid =8  AND 
