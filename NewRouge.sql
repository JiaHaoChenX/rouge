drop database if exists rouge;
create database rouge charset utf8;
use rouge;
-- 账号类型 
CREATE TABLE `accountType` (
`atid` int NOT NULL AUTO_INCREMENT COMMENT '账号类型编号' ,
`atname` varchar(20) NOT NULL COMMENT '类型名称' ,
PRIMARY KEY (`atid`)
)ENGINE=InnoDB AUTO_INCREMENT=1000;

INSERT INTO accountType(atname) VALUES
('管理员'),
('会员用户'),
('普通用户');

-- 账号
CREATE TABLE `account` (
 aid  varchar(20) NOT NULL COMMENT '账号' ,
 apassword  varchar(260) NOT NULL COMMENT '密码' ,
 atid int NOT NULL COMMENT '账号类型编号' ,
 astatic int NOT NULL DEFAULT 1 COMMENT '0代表冻结，1代表活跃' ,
PRIMARY KEY (aid),
FOREIGN KEY(atid) REFERENCES accountType(atid)
)ENGINE=InnoDB AUTO_INCREMENT=1000;

INSERT into account(aid,apassword,atid,astatic) VALUES
('admin',MD5('admin'),1000,1),
('zhangshang',MD5('a'),1002,1),
('lisi',MD5('b'),1002,1),
('wanwu',MD5('c'),1002,1),
('zhaoliu',MD5('d'),1002,0),
('tianqi',MD5('e'),1002,0),
('rows',MD5('d'),1002,0),
('jack',MD5('g'),1002,1),
('tom',MD5('h'),1002,1),
('chenduxiu',MD5('e'),1002,0),
('wanfugui',MD5('d'),1002,0),
('chord',MD5('000410'),1001,1),
('chenjiahao',MD5('000214'),1002,1),
('niubihh',MD5('niubihh'),1001,1);


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
)ENGINE=InnoDB AUTO_INCREMENT=1;

INSERT INTO `user`(aid,uidentityid,uname,umail,uphone,uportrait) VALUES
('admin','43062120000204907X','陈佳豪','JHaoC@qq.com','15073034644','admin.jpg'),
('zhangshang','43062120000204907x','a','a@qq.com','15073034644','a.jpg'),
('lisi','43062120000204907x','b','b@qq.com','15073034644','b.jpg'),
('wanwu','43062120000204907x','c','c@qq.com','15073034644','c.jpg'),
('zhaoliu','43062120000204907x','d','d@qq.com','15073034644','d.jpg'),
('tianqi','43062120000204907x','e','e@qq.com','15073034644','e.jpg'),
('rows','43062120000204907x','f','f@qq.com','15073034644','f.jpg'),
('jack','43062120000204907x','g','g@qq.com','15073034644','g.jpg'),
('tom','43062120000204907x','h','h@qq.com','15073034644','h.jpg'),
('chenduxiu','43062120000204907x','i','i@qq.com','15073034644','i.jpg'),
('wanfugui','43062120000204907x','j','j@qq.com','15073034644','j.jpg'),
('chord','430523200004103540','陈小连','3207595430@qq.com','15919267047','chord.jpg'),
('chenjiahao','43062120000204907x','陈佳豪','472674014@qq.com','15073034644','chenjiahao.jpg'),
('niubihh','43062120000204907x','陈佳豪','JHaoC@qq.com','15073034644','niubihh.jpg');

-- 商品类型 
CREATE TABLE `commodityType` (
`comtid` int NOT NULL AUTO_INCREMENT COMMENT '商品类型编号',
`comtname` varchar(20) NOT NULL COMMENT '类型名称' ,
PRIMARY KEY (`comtid`)
)ENGINE=InnoDB AUTO_INCREMENT=1;


INSERT INTO `commodityType`(comtname) VALUES
('口红'),
('粉底'),
('腮红'),
('护肤'),
('眼影');
select * from commodityType;

-- 商品
CREATE TABLE `commodity` (
`comid` int NOT NULL AUTO_INCREMENT COMMENT '主键编号',
 comname varchar(160) NOT NULL COMMENT '商品名称',
 comtid  int NOT NULL COMMENT '商品类型编号' ,
 comprice DOUBLE NOT NULL COMMENT '商品价格',
 comproduce varchar(1000) NOT NULL COMMENT '商品详细描述',
 comstatic int NOT NULL DEFAULT 1 COMMENT '0代表下架，1代表销售' ,
 cominventory int NOT NULL COMMENT '库存' ,
PRIMARY KEY (comid),
FOREIGN KEY(comtid) REFERENCES commodityType(comtid)
)ENGINE=InnoDB AUTO_INCREMENT=1000;

INSERT INTO `commodity`(comname,comtid,comprice,comproduce,comstatic,cominventory) VALUES
('魅惑釉唇膏',1,300,'高订色彩，缎光妆效，Rouge烈艳蓝金唇膏持色舒适配方，为女性带来美妙的享受。 经典红色系、热烈珊瑚红、热情欢乐的粉色系、浪漫迷人的紫红，以及一系列前卫色彩，呈献唇妆惊喜。 这款唇膏暗藏玄机的迪奥全新金属外壳具有非凡吸引力：为了彰显一抹个性奢华魅力，唇膏盖内皆以Rouge的经典迷人色彩——#传奇红唇（#999）的色彩装点。',DEFAULT,7),
('Rouge烈艳蓝金液唇膏',1,300,'Rouge烈艳蓝金唇膏再度突破创意，推出首款4种妆效的液态唇膏：摇滚哑光、经典缎光、电光金属、丝绒裸妆。 唇彩般轻盈舒适，唇膏般细腻顺滑，高遮盖力，超持妆显色。',DEFAULT,4),
('Rouge魅惑唇膏系列 丰唇蜜',1,300,'专业级配方蕴含胶原质，融合透明质酸，双唇更显柔滑滋润。日复一日，为双唇营造感性的丰润效果。',DEFAULT,3),
('Rouge魅惑唇膏',1,300,'Dior迪奥引领唇妆新纪元，推出革命性唇膏臻品，每次上妆，水润凝胶内芯的釉亮妆效皆令双唇绽现超非凡镜面光泽。唇膏中央，刻印CD字母图案的水润凝胶内芯贯穿整个唇膏膏体。涂抹上唇，Dior迪奥魅惑唇膏的釉亮表层妆效，为双唇更添炫亮光泽，牢固唇膏色彩，为双唇带来令人难以置信的舒悦妆感。',DEFAULT,3),
('Rouge烈艳蓝金液唇膏',1,300,'烈艳蓝金液唇膏再度创新配方，延续舒悦质地的同时，持色持久，轻松玩转哑光、缎光和金属3种惊艳妆效',0,0),
('魅惑釉唇膏',1,300,'高订色彩，缎光妆效，Rouge烈艳蓝金唇膏持色舒适配方，为女性带来美妙的享受。 经典红色系、热烈珊瑚红、热情欢乐的粉色系、浪漫迷人的紫红，以及一系列前卫色彩，呈献唇妆惊喜。 这款唇膏暗藏玄机的迪奥全新金属外壳具有非凡吸引力：为了彰显一抹个性奢华魅力，唇膏盖内皆以Rouge的经典迷人色彩——#传奇红唇（#999）的色彩装点。',DEFAULT,7),
('Rouge烈艳蓝金液唇膏',1,300,'Rouge烈艳蓝金唇膏再度突破创意，推出首款4种妆效的液态唇膏：摇滚哑光、经典缎光、电光金属、丝绒裸妆。 唇彩般轻盈舒适，唇膏般细腻顺滑，高遮盖力，超持妆显色。',DEFAULT,4),
('Rouge魅惑唇膏系列 丰唇蜜',1,300,'专业级配方蕴含胶原质，融合透明质酸，双唇更显柔滑滋润。日复一日，为双唇营造感性的丰润效果。',DEFAULT,3),
('Rouge魅惑唇膏',1,300,'Dior迪奥引领唇妆新纪元，推出革命性唇膏臻品，每次上妆，水润凝胶内芯的釉亮妆效皆令双唇绽现超非凡镜面光泽。唇膏中央，刻印CD字母图案的水润凝胶内芯贯穿整个唇膏膏体。涂抹上唇，Dior迪奥魅惑唇膏的釉亮表层妆效，为双唇更添炫亮光泽，牢固唇膏色彩，为双唇带来令人难以置信的舒悦妆感。',DEFAULT,3),
('Rouge烈艳蓝金液唇膏',1,300,'烈艳蓝金液唇膏再度创新配方，延续舒悦质地的同时，持色持久，轻松玩转哑光、缎光和金属3种惊艳妆效',0,0),
('魅惑釉唇膏',1,300,'高订色彩，缎光妆效，Rouge烈艳蓝金唇膏持色舒适配方，为女性带来美妙的享受。 经典红色系、热烈珊瑚红、热情欢乐的粉色系、浪漫迷人的紫红，以及一系列前卫色彩，呈献唇妆惊喜。 这款唇膏暗藏玄机的迪奥全新金属外壳具有非凡吸引力：为了彰显一抹个性奢华魅力，唇膏盖内皆以Rouge的经典迷人色彩——#传奇红唇（#999）的色彩装点。',DEFAULT,7),
('Rouge烈艳蓝金液唇膏',1,300,'Rouge烈艳蓝金唇膏再度突破创意，推出首款4种妆效的液态唇膏：摇滚哑光、经典缎光、电光金属、丝绒裸妆。 唇彩般轻盈舒适，唇膏般细腻顺滑，高遮盖力，超持妆显色。',DEFAULT,4),
('Rouge魅惑唇膏系列 丰唇蜜',1,300,'专业级配方蕴含胶原质，融合透明质酸，双唇更显柔滑滋润。日复一日，为双唇营造感性的丰润效果。',DEFAULT,3),
('Rouge魅惑唇膏',1,300,'Dior迪奥引领唇妆新纪元，推出革命性唇膏臻品，每次上妆，水润凝胶内芯的釉亮妆效皆令双唇绽现超非凡镜面光泽。唇膏中央，刻印CD字母图案的水润凝胶内芯贯穿整个唇膏膏体。涂抹上唇，Dior迪奥魅惑唇膏的釉亮表层妆效，为双唇更添炫亮光泽，牢固唇膏色彩，为双唇带来令人难以置信的舒悦妆感。',DEFAULT,3),
('Rouge烈艳蓝金液唇膏',1,300,'烈艳蓝金液唇膏再度创新配方，延续舒悦质地的同时，持色持久，轻松玩转哑光、缎光和金属3种惊艳妆效',0,0),
('魅惑釉唇膏',1,300,'高订色彩，缎光妆效，Rouge烈艳蓝金唇膏持色舒适配方，为女性带来美妙的享受。 经典红色系、热烈珊瑚红、热情欢乐的粉色系、浪漫迷人的紫红，以及一系列前卫色彩，呈献唇妆惊喜。 这款唇膏暗藏玄机的迪奥全新金属外壳具有非凡吸引力：为了彰显一抹个性奢华魅力，唇膏盖内皆以Rouge的经典迷人色彩——#传奇红唇（#999）的色彩装点。',DEFAULT,7),
('Rouge烈艳蓝金液唇膏',1,300,'Rouge烈艳蓝金唇膏再度突破创意，推出首款4种妆效的液态唇膏：摇滚哑光、经典缎光、电光金属、丝绒裸妆。 唇彩般轻盈舒适，唇膏般细腻顺滑，高遮盖力，超持妆显色。',DEFAULT,4),
('Rouge魅惑唇膏系列 丰唇蜜',1,300,'专业级配方蕴含胶原质，融合透明质酸，双唇更显柔滑滋润。日复一日，为双唇营造感性的丰润效果。',DEFAULT,3),
('Rouge魅惑唇膏',1,300,'Dior迪奥引领唇妆新纪元，推出革命性唇膏臻品，每次上妆，水润凝胶内芯的釉亮妆效皆令双唇绽现超非凡镜面光泽。唇膏中央，刻印CD字母图案的水润凝胶内芯贯穿整个唇膏膏体。涂抹上唇，Dior迪奥魅惑唇膏的釉亮表层妆效，为双唇更添炫亮光泽，牢固唇膏色彩，为双唇带来令人难以置信的舒悦妆感。',DEFAULT,3),
('Rouge烈艳蓝金液唇膏',1,300,'烈艳蓝金液唇膏再度创新配方，延续舒悦质地的同时，持色持久，轻松玩转哑光、缎光和金属3种惊艳妆效',0,0);


INSERT INTO `commodity`(comname,comtid,comprice,comproduce,comstatic,cominventory) VALUES
('Rouge凝脂恒久气垫粉底',2,320,'Rouge全新锁妆气垫，清新柔润质地结合极为细腻的哑雾因子，如同一抹轻透薄纱，修饰隐匿肌肤瑕疵，瞬间打造立体哑光。 *注册名：Rouge凝脂恒久气垫粉底 Rouge秉承美丽、真挚的品牌理念，同时崇尚环保，提供替换芯可供选购。 替换芯可单独选购。',DEFAULT,7),
('Rouge花蜜活颜丝悦',2,790,'Rouge花蜜玫瑰气垫1，500片玫瑰花瓣2的奢焕能量，凝萃于迪奥新一代气垫粉底之中，即拍即养，便携随行，缔造细润无瑕妆效。',DEFAULT,2),
('Rouge凝脂恒久卓越蜜粉',2,520,'作为完妆步骤，使用Dior迪奥凝脂恒久卓越蜜粉，打造更加持久的哑光妆效。 轻盈质地，百搭色调，如同为肌肤披上一层薄纱。。',DEFAULT,2),
('Rouge凝脂恒久气垫粉底',2,320,'Rouge全新锁妆气垫，清新柔润质地结合极为细腻的哑雾因子，如同一抹轻透薄纱，修饰隐匿肌肤瑕疵，瞬间打造立体哑光。 *注册名：Rouge凝脂恒久气垫粉底 Rouge秉承美丽、真挚的品牌理念，同时崇尚环保，提供替换芯可供选购。 替换芯可单独选购。',DEFAULT,7),
('Rouge凝脂恒久卓越蜜粉',2,520,'作为完妆步骤，使用Dior迪奥凝脂恒久卓越蜜粉，打造更加持久的哑光妆效。 轻盈质地，百搭色调，如同为肌肤披上一层薄纱。。',DEFAULT,2),
('Rouge花蜜活颜丝悦',2,790,'Rouge花蜜玫瑰气垫1，500片玫瑰花瓣2的奢焕能量，凝萃于迪奥新一代气垫粉底之中，即拍即养，便携随行，缔造细润无瑕妆效。',DEFAULT,2),
('Rouge凝脂恒久卓越蜜粉',2,520,'作为完妆步骤，使用Dior迪奥凝脂恒久卓越蜜粉，打造更加持久的哑光妆效。 轻盈质地，百搭色调，如同为肌肤披上一层薄纱。。',DEFAULT,2),
('Rouge凝脂恒久气垫粉底',2,320,'Rouge全新锁妆气垫，清新柔润质地结合极为细腻的哑雾因子，如同一抹轻透薄纱，修饰隐匿肌肤瑕疵，瞬间打造立体哑光。 *注册名：Rouge凝脂恒久气垫粉底 Rouge秉承美丽、真挚的品牌理念，同时崇尚环保，提供替换芯可供选购。 替换芯可单独选购。',DEFAULT,7),
('Rouge凝脂恒久卓越蜜粉',2,520,'作为完妆步骤，使用Dior迪奥凝脂恒久卓越蜜粉，打造更加持久的哑光妆效。 轻盈质地，百搭色调，如同为肌肤披上一层薄纱。。',DEFAULT,2),
('Rouge凝脂恒久卓越蜜粉',2,520,'作为完妆步骤，使用Dior迪奥凝脂恒久卓越蜜粉，打造更加持久的哑光妆效。 轻盈质地，百搭色调，如同为肌肤披上一层薄纱。。',DEFAULT,2),
('Rouge凝脂恒久气垫粉底',2,320,'Rouge全新锁妆气垫，清新柔润质地结合极为细腻的哑雾因子，如同一抹轻透薄纱，修饰隐匿肌肤瑕疵，瞬间打造立体哑光。 *注册名：Rouge凝脂恒久气垫粉底 Rouge秉承美丽、真挚的品牌理念，同时崇尚环保，提供替换芯可供选购。 替换芯可单独选购。',DEFAULT,7),
('Rouge凝脂恒久卓越蜜粉',2,520,'作为完妆步骤，使用Dior迪奥凝脂恒久卓越蜜粉，打造更加持久的哑光妆效。 轻盈质地，百搭色调，如同为肌肤披上一层薄纱。。',DEFAULT,2);




-- 商品图片
CREATE TABLE `commodityImg`(
`comiid` int NOT NULL AUTO_INCREMENT COMMENT '图片编号',
`comid` int NOT NULL COMMENT '商品编号' ,
`imgpath` varchar(1000) NOT NULL COMMENT '图片路径',
PRIMARY KEY (`comiid`),
FOREIGN KEY(comid) REFERENCES commodity(comid)
)ENGINE=InnoDB AUTO_INCREMENT=1;

INSERT INTO `commodityImg`(comid,imgpath) VALUES
(1000,'a1.jpg'),
(1000,'a2.jpg'),
(1000,'a3.jpg'),
(1000,'a5.jpg'),
(1000,'a6.jpg'),
(1000,'a7.jpg'),
(1001,'b1.jpg'),
(1001,'b2.jpg'),
(1001,'b3.jpg'),
(1001,'b5.jpg'),
(1001,'b6.jpg'),
(1001,'b7.jpg'),
(1002,'c1.jpg'),
(1002,'c2.jpg'),
(1002,'c3.jpg'),
(1002,'c5.jpg'),
(1002,'c6.jpg'),
(1003,'d1.jpg'),
(1004,'e1.jpg'),
(1004,'e2.jpg'),
(1004,'e3.jpg'),
(1004,'e4.jpg'),
(1005,'a1.jpg'),
(1005,'a2.jpg'),
(1005,'a3.jpg'),
(1005,'a5.jpg'),
(1005,'a6.jpg'),
(1005,'a7.jpg'),
(1006,'b1.jpg'),
(1006,'b2.jpg'),
(1006,'b3.jpg'),
(1006,'b5.jpg'),
(1006,'b6.jpg'),
(1006,'b7.jpg'),
(1007,'c1.jpg'),
(1007,'c2.jpg'),
(1007,'c3.jpg'),
(1007,'c5.jpg'),
(1007,'c6.jpg'),
(1008,'d1.jpg'),
(1008,'e1.jpg'),
(1008,'e2.jpg'),
(1008,'e3.jpg'),
(1008,'e4.jpg'),
(1009,'a1.jpg'),
(1009,'a2.jpg'),
(1009,'a3.jpg'),
(1009,'a5.jpg'),
(1009,'a6.jpg'),
(1009,'a7.jpg'),
(1009,'b1.jpg'),
(1009,'b2.jpg'),
(1009,'b3.jpg'),
(1009,'b5.jpg'),
(1009,'b6.jpg'),
(1009,'b7.jpg'),
(1010,'c1.jpg'),
(1010,'c2.jpg'),
(1010,'c3.jpg'),
(1010,'c5.jpg'),
(1010,'c6.jpg'),
(1011,'d1.jpg'),
(1011,'e1.jpg'),
(1011,'e2.jpg'),
(1011,'e3.jpg'),
(1011,'e4.jpg'),
(1012,'a1.jpg'),
(1012,'a2.jpg'),
(1012,'a3.jpg'),
(1012,'a5.jpg'),
(1012,'a6.jpg'),
(1012,'a7.jpg'),
(1012,'b1.jpg'),
(1012,'b2.jpg'),
(1012,'b3.jpg'),
(1012,'b5.jpg'),
(1012,'b6.jpg'),
(1012,'b7.jpg'),
(1012,'c1.jpg'),
(1012,'c2.jpg'),
(1012,'c3.jpg'),
(1012,'c5.jpg'),
(1012,'c6.jpg'),
(1013,'d1.jpg'),
(1013,'e1.jpg'),
(1013,'e2.jpg'),
(1013,'e3.jpg'),
(1013,'e4.jpg'),
(1014,'a1.jpg'),
(1014,'a2.jpg'),
(1014,'a3.jpg'),
(1014,'a5.jpg'),
(1015,'a6.jpg'),
(1015,'a7.jpg'),
(1015,'b1.jpg'),
(1015,'b2.jpg'),
(1015,'b3.jpg'),
(1016,'b5.jpg'),
(1016,'b6.jpg'),
(1016,'b7.jpg'),
(1016,'c1.jpg'),
(1017,'c2.jpg'),
(1017,'c3.jpg'),
(1017,'c5.jpg'),
(1017,'c6.jpg'),
(1018,'d1.jpg'),
(1018,'e1.jpg'),
(1018,'e2.jpg'),
(1018,'e3.jpg'),
(1019,'e4.jpg');

INSERT INTO `commodityImg`(comid,imgpath) VALUES
(1020,'aa1.jpg'),
(1020,'aa2.jpg'),
(1020,'aa3.jpg'),
(1020,'aa4.jpg'),
(1021,'bb1.jpg'),
(1021,'bb2.jpg'),
(1022,'cc1.jpg'),
(1023,'aa1.jpg'),
(1023,'aa2.jpg'),
(1024,'aa3.jpg'),
(1024,'aa4.jpg'),
(1024,'bb1.jpg'),
(1024,'bb2.jpg'),
(1025,'cc1.jpg'),
(1025,'aa1.jpg'),
(1025,'aa2.jpg'),
(1026,'aa3.jpg'),
(1026,'aa4.jpg'),
(1026,'bb1.jpg'),
(1026,'bb2.jpg'),
(1027,'cc1.jpg'),
(1027,'aa1.jpg'),
(1027,'aa2.jpg'),
(1027,'aa3.jpg'),
(1028,'aa4.jpg'),
(1028,'bb1.jpg'),
(1028,'bb2.jpg'),
(1029,'cc1.jpg'),
(1029,'aa3.jpg'),
(1029,'aa4.jpg'),
(1030,'bb1.jpg'),
(1030,'bb2.jpg'),
(1031,'cc1.jpg'),
(1031,'bb1.jpg'),
(1031,'bb2.jpg'),
(1031,'cc1.jpg');

-- 商品折扣
CREATE TABLE `comdiscount`(
`comdisid` int NOT NULL AUTO_INCREMENT COMMENT '编号',
`comid` int NOT NULL COMMENT '商品编号' ,
`discount` DOUBLE NOT NULL COMMENT '折扣',
PRIMARY KEY (`comdisid`),
FOREIGN KEY(comid) REFERENCES commodity(comid)
);

INSERT into comdiscount(comid,discount) values(1001,9);

INSERT into comdiscount(comid,discount) values(1001,9),(1005,9),(1008,9),(1004,9),(1011,9),(1016,9);


-- 商品描述表
CREATE TABLE `comdescribe` (
`comdescribeid` int NOT NULL AUTO_INCREMENT COMMENT '编号' ,
 comid int NOT NULL COMMENT '关联商品编号' ,
 img varchar(600)  NOT NULL comment '图片',
 video varchar(600)  NOT NULL comment '视频',
 proposal varchar(600)  NOT NULL comment '建议上妆',
 formula varchar(600)  NOT NULL comment '配方',
 diyparam varchar(1000)  NOT NULL comment '自定义描述',
PRIMARY KEY (comdescribeid),
FOREIGN KEY(comid) REFERENCES `commodity`(comid)
)ENGINE=InnoDB AUTO_INCREMENT=1;

insert into comdescribe(comid,img,video,proposal,formula,diyparam) values
(1000,'../../comdescribe_img/a1.png','../../comdescribe_Mp4/a1.mp4','一系列高订唇膏色彩呈现舒悦而诱惑的缎光感妆效。','四款高订色彩，大胆的时尚宣言：四款高订色彩，充满惊喜。一个充满前卫高订色彩的精粹系列，“让您尽情感受拍摄时尚大片的兴奋，大胆与前卫。Rouge烈艳蓝金唇膏的舒悦配方，无论是哑光感还是缎光感妆效，为您带来舒悦享受及色彩。加入特别“护唇”成分组合，滋润、持妆。','{"english":"凝脂恒久气垫粉底","describe":"Rouge首款锁妆气垫","weight":"3"}'),
(1001,'../../comdescribe_img/b1.png','../../comdescribe_Mp4/b1.mp4','想要色彩大胆、妆效持久，可先用Rouge唇线笔勾勒轮廓并匀涂打底。接着再使用全新Rouge烈艳蓝金液唇膏，独特设计的唇刷，确保沾取适当用量，轻松上手。','全新Rouge烈艳蓝金液唇膏，运用专业级技艺调配矿物蜡、微硅粉末*与精华油，顺滑易涂，大胆结合看似矛盾的多元唇妆元素，赋予双唇充满力量感的色彩。矿物蜡指微晶蜡，微硅粉末指硅石粉末','{"english":"POISON METAL","describe":"摇滚哑光、经典缎光、电光","weight":"3"}'),
(1002,'../../comdescribe_img/c1.png','../../comdescribe_Mp4/c1.mp4','使用唇膏前作为打底使用，丰盈滋润双唇；或在唇膏之后使用，增添丰盈亮泽。每日早晚单独使用，加强对唇部的护理.','专业级配方蕴含胶原质，融合透明质酸，双唇更显柔滑滋润。日复一日，为双唇营造感性的丰润效果。','{"english":"#Best Seller","describe":"魅惑丰唇蜜","weight":"3"}'),
(1003,'../../comdescribe_img/d1.png','../../comdescribe_Mp4/d1.mp4','柔滑而流畅的质地，无缝帖服双唇，提供令人惊喜的舒适上妆体验。水润凝胶内芯与同色系唇膏色彩同时上妆，呈献唇膏与釉亮表层的结合妆效。','水润凝胶内芯富蕴三种闪亮精华油。舒悦感油脂赋予柔滑而流畅的质地，开启崭新的奢悦感官享受。舒缓性油脂帮助滋润唇部，而保护性油脂提高颜色附着度，更长久持妆。','{"english":"#Best Seller","describe":"魅惑丰唇蜜","weight":"3"}'),
(1005,'../../comdescribe_img/a1.png','../../comdescribe_Mp4/a1.mp4','一系列高订唇膏色彩呈现舒悦而诱惑的缎光感妆效。','四款高订色彩，大胆的时尚宣言：四款高订色彩，充满惊喜。一个充满前卫高订色彩的精粹系列，“让您尽情感受拍摄时尚大片的兴奋，大胆与前卫。Rouge烈艳蓝金唇膏的舒悦配方，无论是哑光感还是缎光感妆效，为您带来舒悦享受及色彩。加入特别“护唇”成分组合，滋润、持妆。','{"english":"凝脂恒久气垫粉底","describe":"Rouge首款锁妆气垫","weight":"3"}'),
(1006,'../../comdescribe_img/b1.png','../../comdescribe_Mp4/b1.mp4','想要色彩大胆、妆效持久，可先用Rouge唇线笔勾勒轮廓并匀涂打底。接着再使用全新Rouge烈艳蓝金液唇膏，独特设计的唇刷，确保沾取适当用量，轻松上手。','全新Rouge烈艳蓝金液唇膏，运用专业级技艺调配矿物蜡、微硅粉末*与精华油，顺滑易涂，大胆结合看似矛盾的多元唇妆元素，赋予双唇充满力量感的色彩。矿物蜡指微晶蜡，微硅粉末指硅石粉末','{"english":"POISON METAL","describe":"摇滚哑光、经典缎光、电光","weight":"3"}'),
(1007,'../../comdescribe_img/c1.png','../../comdescribe_Mp4/c1.mp4','使用唇膏前作为打底使用，丰盈滋润双唇；或在唇膏之后使用，增添丰盈亮泽。每日早晚单独使用，加强对唇部的护理.','专业级配方蕴含胶原质，融合透明质酸，双唇更显柔滑滋润。日复一日，为双唇营造感性的丰润效果。','{"english":"#Best Seller","describe":"魅惑丰唇蜜","weight":"3"}'),
(1008,'../../comdescribe_img/d1.png','../../comdescribe_Mp4/d1.mp4','柔滑而流畅的质地，无缝帖服双唇，提供令人惊喜的舒适上妆体验。水润凝胶内芯与同色系唇膏色彩同时上妆，呈献唇膏与釉亮表层的结合妆效。','水润凝胶内芯富蕴三种闪亮精华油。舒悦感油脂赋予柔滑而流畅的质地，开启崭新的奢悦感官享受。舒缓性油脂帮助滋润唇部，而保护性油脂提高颜色附着度，更长久持妆。','{"english":"#Best Seller","describe":"魅惑丰唇蜜","weight":"3"}'),
(1009,'../../comdescribe_img/a1.png','../../comdescribe_Mp4/a1.mp4','一系列高订唇膏色彩呈现舒悦而诱惑的缎光感妆效。','四款高订色彩，大胆的时尚宣言：四款高订色彩，充满惊喜。一个充满前卫高订色彩的精粹系列，“让您尽情感受拍摄时尚大片的兴奋，大胆与前卫。Rouge烈艳蓝金唇膏的舒悦配方，无论是哑光感还是缎光感妆效，为您带来舒悦享受及色彩。加入特别“护唇”成分组合，滋润、持妆。','{"english":"凝脂恒久气垫粉底","describe":"Rouge首款锁妆气垫","weight":"3"}'),
(1010,'../../comdescribe_img/b1.png','../../comdescribe_Mp4/b1.mp4','想要色彩大胆、妆效持久，可先用Rouge唇线笔勾勒轮廓并匀涂打底。接着再使用全新Rouge烈艳蓝金液唇膏，独特设计的唇刷，确保沾取适当用量，轻松上手。','全新Rouge烈艳蓝金液唇膏，运用专业级技艺调配矿物蜡、微硅粉末*与精华油，顺滑易涂，大胆结合看似矛盾的多元唇妆元素，赋予双唇充满力量感的色彩。矿物蜡指微晶蜡，微硅粉末指硅石粉末','{"english":"POISON METAL","describe":"摇滚哑光、经典缎光、电光","weight":"3"}'),
(1011,'../../comdescribe_img/c1.png','../../comdescribe_Mp4/c1.mp4','使用唇膏前作为打底使用，丰盈滋润双唇；或在唇膏之后使用，增添丰盈亮泽。每日早晚单独使用，加强对唇部的护理.','专业级配方蕴含胶原质，融合透明质酸，双唇更显柔滑滋润。日复一日，为双唇营造感性的丰润效果。','{"english":"#Best Seller","describe":"魅惑丰唇蜜","weight":"3"}'),
(1012,'../../comdescribe_img/d1.png','../../comdescribe_Mp4/d1.mp4','柔滑而流畅的质地，无缝帖服双唇，提供令人惊喜的舒适上妆体验。水润凝胶内芯与同色系唇膏色彩同时上妆，呈献唇膏与釉亮表层的结合妆效。','水润凝胶内芯富蕴三种闪亮精华油。舒悦感油脂赋予柔滑而流畅的质地，开启崭新的奢悦感官享受。舒缓性油脂帮助滋润唇部，而保护性油脂提高颜色附着度，更长久持妆。','{"english":"#Best Seller","describe":"魅惑丰唇蜜","weight":"3"}'),
(1013,'../../comdescribe_img/a1.png','../../comdescribe_Mp4/a1.mp4','一系列高订唇膏色彩呈现舒悦而诱惑的缎光感妆效。','四款高订色彩，大胆的时尚宣言：四款高订色彩，充满惊喜。一个充满前卫高订色彩的精粹系列，“让您尽情感受拍摄时尚大片的兴奋，大胆与前卫。Rouge烈艳蓝金唇膏的舒悦配方，无论是哑光感还是缎光感妆效，为您带来舒悦享受及色彩。加入特别“护唇”成分组合，滋润、持妆。','{"english":"凝脂恒久气垫粉底","describe":"Rouge首款锁妆气垫","weight":"3"}'),
(1014,'../../comdescribe_img/b1.png','../../comdescribe_Mp4/b1.mp4','想要色彩大胆、妆效持久，可先用Rouge唇线笔勾勒轮廓并匀涂打底。接着再使用全新Rouge烈艳蓝金液唇膏，独特设计的唇刷，确保沾取适当用量，轻松上手。','全新Rouge烈艳蓝金液唇膏，运用专业级技艺调配矿物蜡、微硅粉末*与精华油，顺滑易涂，大胆结合看似矛盾的多元唇妆元素，赋予双唇充满力量感的色彩。矿物蜡指微晶蜡，微硅粉末指硅石粉末','{"english":"POISON METAL","describe":"摇滚哑光、经典缎光、电光","weight":"3"}'),
(1015,'../../comdescribe_img/c1.png','../../comdescribe_Mp4/c1.mp4','使用唇膏前作为打底使用，丰盈滋润双唇；或在唇膏之后使用，增添丰盈亮泽。每日早晚单独使用，加强对唇部的护理.','专业级配方蕴含胶原质，融合透明质酸，双唇更显柔滑滋润。日复一日，为双唇营造感性的丰润效果。','{"english":"#Best Seller","describe":"魅惑丰唇蜜","weight":"3"}'),
(1016,'../../comdescribe_img/d1.png','../../comdescribe_Mp4/d1.mp4','柔滑而流畅的质地，无缝帖服双唇，提供令人惊喜的舒适上妆体验。水润凝胶内芯与同色系唇膏色彩同时上妆，呈献唇膏与釉亮表层的结合妆效。','水润凝胶内芯富蕴三种闪亮精华油。舒悦感油脂赋予柔滑而流畅的质地，开启崭新的奢悦感官享受。舒缓性油脂帮助滋润唇部，而保护性油脂提高颜色附着度，更长久持妆。','{"english":"#Best Seller","describe":"魅惑丰唇蜜","weight":"3"}'),
(1017,'../../comdescribe_img/a1.png','../../comdescribe_Mp4/a1.mp4','一系列高订唇膏色彩呈现舒悦而诱惑的缎光感妆效。','四款高订色彩，大胆的时尚宣言：四款高订色彩，充满惊喜。一个充满前卫高订色彩的精粹系列，“让您尽情感受拍摄时尚大片的兴奋，大胆与前卫。Rouge烈艳蓝金唇膏的舒悦配方，无论是哑光感还是缎光感妆效，为您带来舒悦享受及色彩。加入特别“护唇”成分组合，滋润、持妆。','{"english":"凝脂恒久气垫粉底","describe":"Rouge首款锁妆气垫","weight":"3"}'),
(1018,'../../comdescribe_img/b1.png','../../comdescribe_Mp4/b1.mp4','想要色彩大胆、妆效持久，可先用Rouge唇线笔勾勒轮廓并匀涂打底。接着再使用全新Rouge烈艳蓝金液唇膏，独特设计的唇刷，确保沾取适当用量，轻松上手。','全新Rouge烈艳蓝金液唇膏，运用专业级技艺调配矿物蜡、微硅粉末*与精华油，顺滑易涂，大胆结合看似矛盾的多元唇妆元素，赋予双唇充满力量感的色彩。矿物蜡指微晶蜡，微硅粉末指硅石粉末','{"english":"POISON METAL","describe":"摇滚哑光、经典缎光、电光","weight":"3"}'),
(1019,'../../comdescribe_img/c1.png','../../comdescribe_Mp4/c1.mp4','使用唇膏前作为打底使用，丰盈滋润双唇；或在唇膏之后使用，增添丰盈亮泽。每日早晚单独使用，加强对唇部的护理.','专业级配方蕴含胶原质，融合透明质酸，双唇更显柔滑滋润。日复一日，为双唇营造感性的丰润效果。','{"english":"#Best Seller","describe":"魅惑丰唇蜜","weight":"3"}');


insert into comdescribe(comid,img,video,proposal,formula,diyparam) values
(1020,'../../comdescribe_img/aa1.png','../../comdescribe_Mp4/aa1.mp4','于晨间护肤流程后使用，并可用于随行补妆，尽享令人迷恋的清新感受！','- 创新微孔呼吸气垫科技：每次开启使用时，皆可完好保存配方中的粉底因子与护肤能量。创新“锁妆”科技：让底妆长时间保持原色，妆面持久如新。即使在高温潮湿等恶劣环境中，依然出色持妆。蕴含细致护肤精萃：日复一日，直击毛孔与出油等肌肤问题，帮助减少油光，隐匿瑕疵，令肤质愈加细腻。','{"english":"凝脂恒久气垫粉底","describe":"底妆加锁，定格立体哑光 - 替换芯","weight":"3"}'),
(1021,'../../comdescribe_img/bb1.png','../../comdescribe_Mp4/bb1.mp4','Dior迪奥美妍中心研发，创新双重色彩因子：瑰丽多彩因子，饱满色泽，细腻修色、轻透匀净。玫瑰光彩因子，赋予底妆玫瑰花瓣般的丝缎光泽。轻盈奢润质地，细润亲肤，舒悦沁融，不同环境下3依然妆效持久','格兰维尔玫瑰的故事，始于法国诺曼底海边、迪奥先生童年故居旁的格兰维尔峭壁。一株玫瑰，无惧严酷气候，瑰丽清新，傲然盛放。','{"english":"Rouge花蜜活颜丝悦玫瑰气垫粉底","describe":"玫瑰气垫粉底","weight":"3"}'),
(1022,'../../comdescribe_img/cc1.png','../../comdescribe_Mp4/cc1.mp4','Dior迪奥美妍中心研发，创新双重色彩因子：瑰丽多彩因子，饱满色泽，细腻修色、轻透匀净。玫瑰光彩因子，赋予底妆玫瑰花瓣般的丝缎光泽。轻盈奢润质地，细润亲肤，舒悦沁融，不同环境下3依然妆效持久','格兰维尔玫瑰的故事，始于法国诺曼底海边、迪奥先生童年故居旁的格兰维尔峭壁。一株玫瑰，无惧严酷气候，瑰丽清新，傲然盛放。','{"english":"Rouge凝脂恒久卓越蜜粉","describe":"克丽丝汀迪奥凝脂恒久蜜粉 ","weight":"3"}'),
(1023,'../../comdescribe_img/bb1.png','../../comdescribe_Mp4/bb1.mp4','Dior迪奥美妍中心研发，创新双重色彩因子：瑰丽多彩因子，饱满色泽，细腻修色、轻透匀净。玫瑰光彩因子，赋予底妆玫瑰花瓣般的丝缎光泽。轻盈奢润质地，细润亲肤，舒悦沁融，不同环境下3依然妆效持久','格兰维尔玫瑰的故事，始于法国诺曼底海边、迪奥先生童年故居旁的格兰维尔峭壁。一株玫瑰，无惧严酷气候，瑰丽清新，傲然盛放。','{"english":"Rouge花蜜活颜丝悦玫瑰气垫粉底","describe":"玫瑰气垫粉底","weight":"3"}'),
(1024,'../../comdescribe_img/aa1.png','../../comdescribe_Mp4/aa1.mp4','于晨间护肤流程后使用，并可用于随行补妆，尽享令人迷恋的清新感受！','- 创新微孔呼吸气垫科技：每次开启使用时，皆可完好保存配方中的粉底因子与护肤能量。创新“锁妆”科技：让底妆长时间保持原色，妆面持久如新。即使在高温潮湿等恶劣环境中，依然出色持妆。蕴含细致护肤精萃：日复一日，直击毛孔与出油等肌肤问题，帮助减少油光，隐匿瑕疵，令肤质愈加细腻。','{"english":"凝脂恒久气垫粉底","describe":"底妆加锁，定格立体哑光 - 替换芯","weight":"3"}'),
(1025,'../../comdescribe_img/cc1.png','../../comdescribe_Mp4/cc1.mp4','Dior迪奥美妍中心研发，创新双重色彩因子：瑰丽多彩因子，饱满色泽，细腻修色、轻透匀净。玫瑰光彩因子，赋予底妆玫瑰花瓣般的丝缎光泽。轻盈奢润质地，细润亲肤，舒悦沁融，不同环境下3依然妆效持久','格兰维尔玫瑰的故事，始于法国诺曼底海边、迪奥先生童年故居旁的格兰维尔峭壁。一株玫瑰，无惧严酷气候，瑰丽清新，傲然盛放。','{"english":"Rouge凝脂恒久卓越蜜粉","describe":"克丽丝汀迪奥凝脂恒久蜜粉 ","weight":"3"}'),
(1026,'../../comdescribe_img/bb1.png','../../comdescribe_Mp4/bb1.mp4','Dior迪奥美妍中心研发，创新双重色彩因子：瑰丽多彩因子，饱满色泽，细腻修色、轻透匀净。玫瑰光彩因子，赋予底妆玫瑰花瓣般的丝缎光泽。轻盈奢润质地，细润亲肤，舒悦沁融，不同环境下3依然妆效持久','格兰维尔玫瑰的故事，始于法国诺曼底海边、迪奥先生童年故居旁的格兰维尔峭壁。一株玫瑰，无惧严酷气候，瑰丽清新，傲然盛放。','{"english":"Rouge花蜜活颜丝悦玫瑰气垫粉底","describe":"玫瑰气垫粉底","weight":"3"}'),
(1027,'../../comdescribe_img/aa1.png','../../comdescribe_Mp4/aa1.mp4','于晨间护肤流程后使用，并可用于随行补妆，尽享令人迷恋的清新感受！','- 创新微孔呼吸气垫科技：每次开启使用时，皆可完好保存配方中的粉底因子与护肤能量。创新“锁妆”科技：让底妆长时间保持原色，妆面持久如新。即使在高温潮湿等恶劣环境中，依然出色持妆。蕴含细致护肤精萃：日复一日，直击毛孔与出油等肌肤问题，帮助减少油光，隐匿瑕疵，令肤质愈加细腻。','{"english":"凝脂恒久气垫粉底","describe":"底妆加锁，定格立体哑光 - 替换芯","weight":"3"}'),
(1028,'../../comdescribe_img/cc1.png','../../comdescribe_Mp4/cc1.mp4','Dior迪奥美妍中心研发，创新双重色彩因子：瑰丽多彩因子，饱满色泽，细腻修色、轻透匀净。玫瑰光彩因子，赋予底妆玫瑰花瓣般的丝缎光泽。轻盈奢润质地，细润亲肤，舒悦沁融，不同环境下3依然妆效持久','格兰维尔玫瑰的故事，始于法国诺曼底海边、迪奥先生童年故居旁的格兰维尔峭壁。一株玫瑰，无惧严酷气候，瑰丽清新，傲然盛放。','{"english":"Rouge凝脂恒久卓越蜜粉","describe":"克丽丝汀迪奥凝脂恒久蜜粉 ","weight":"3"}'),
(1029,'../../comdescribe_img/bb1.png','../../comdescribe_Mp4/bb1.mp4','Dior迪奥美妍中心研发，创新双重色彩因子：瑰丽多彩因子，饱满色泽，细腻修色、轻透匀净。玫瑰光彩因子，赋予底妆玫瑰花瓣般的丝缎光泽。轻盈奢润质地，细润亲肤，舒悦沁融，不同环境下3依然妆效持久','格兰维尔玫瑰的故事，始于法国诺曼底海边、迪奥先生童年故居旁的格兰维尔峭壁。一株玫瑰，无惧严酷气候，瑰丽清新，傲然盛放。','{"english":"Rouge花蜜活颜丝悦玫瑰气垫粉底","describe":"玫瑰气垫粉底","weight":"3"}'),
(1030,'../../comdescribe_img/aa1.png','../../comdescribe_Mp4/aa1.mp4','于晨间护肤流程后使用，并可用于随行补妆，尽享令人迷恋的清新感受！','- 创新微孔呼吸气垫科技：每次开启使用时，皆可完好保存配方中的粉底因子与护肤能量。创新“锁妆”科技：让底妆长时间保持原色，妆面持久如新。即使在高温潮湿等恶劣环境中，依然出色持妆。蕴含细致护肤精萃：日复一日，直击毛孔与出油等肌肤问题，帮助减少油光，隐匿瑕疵，令肤质愈加细腻。','{"english":"凝脂恒久气垫粉底","describe":"底妆加锁，定格立体哑光 - 替换芯","weight":"3"}'),
(1031,'../../comdescribe_img/cc1.png','../../comdescribe_Mp4/cc1.mp4','Dior迪奥美妍中心研发，创新双重色彩因子：瑰丽多彩因子，饱满色泽，细腻修色、轻透匀净。玫瑰光彩因子，赋予底妆玫瑰花瓣般的丝缎光泽。轻盈奢润质地，细润亲肤，舒悦沁融，不同环境下3依然妆效持久','格兰维尔玫瑰的故事，始于法国诺曼底海边、迪奥先生童年故居旁的格兰维尔峭壁。一株玫瑰，无惧严酷气候，瑰丽清新，傲然盛放。','{"english":"Rouge凝脂恒久卓越蜜粉","describe":"克丽丝汀迪奥凝脂恒久蜜粉 ","weight":"3"}');
-- 颜色表
CREATE TABLE `comcolor` (
`comcolorid` int NOT NULL AUTO_INCREMENT COMMENT '编号' ,
 comid int NOT NULL COMMENT '关联商品编号' ,
 color varchar(100)  NOT NULL comment '颜色',
PRIMARY KEY (comcolorid),
FOREIGN KEY(comid) REFERENCES `commodity`(comid)
)ENGINE=InnoDB AUTO_INCREMENT=1;

insert into comcolor(comid,color) values
(1000,'#FF739B'),(1000,'#FF2446'),(1000,'#FF7A14'),(1000,'#FF1C4D'),
(1001,'#F08885'),(1001,'#F0800'),(1001,'#F08995'),(1001,'#F0900'),
(1002,'#FADCDC'),
(1003,'#F28F9B'),(1003,'#D17A6F'),(1003,'#F07C6E'),(1003,'#EF7771');


insert into comcolor(comid,color) values
(1004,'#FF739B'),(1004,'#FF2446'),(1004,'#FF7A14'),(1004,'#FF1C4D'),
(1005,'#F08885'),(1005,'#F0800'),(1005,'#F08995'),(1005,'#F0900'),
(1006,'#FADCDC'),
(1007,'#F28F9B'),(1007,'#D17A6F'),(1007,'#F07C6E'),(1007,'#EF7771'),
(1008,'#FF739B'),(1008,'#FF2446'),(1008,'#FF7A14'),(1008,'#FF1C4D'),
(1009,'#F08885'),(1009,'#F0800'),(1009,'#F08995'),(1009,'#F0900'),
(1010,'#FADCDC'),
(1011,'#F28F9B'),(1011,'#D17A6F'),(1011,'#F07C6E'),(1011,'#EF7771'),
(1012,'#FF739B'),(1012,'#FF2446'),(1012,'#FF7A14'),(1012,'#FF1C4D'),
(1013,'#F08885'),(1013,'#F0800'),(1013,'#F08995'),(1013,'#F0900'),
(1014,'#FADCDC'),
(1014,'#F28F9B'),(1014,'#D17A6F'),(1014,'#F07C6E'),(1014,'#EF7771'),
(1015,'#FF739B'),(1015,'#FF2446'),(1015,'#FF7A14'),(1015,'#FF1C4D'),
(1016,'#F08885'),(1016,'#F0800'),(1016,'#F08995'),(1016,'#F0900'),
(1017,'#FADCDC'),
(1018,'#F28F9B'),(1018,'#D17A6F'),(1018,'#F07C6E'),(1018,'#EF7771'),
(1019,'#FF739B'),(1019,'#FF2446'),(1019,'#FF7A14'),(1019,'#FF1C4D');

insert into comcolor(comid,color) values
(1020,'#FF739B'),(1020,'#FF2446'),(1020,'#FF7A14'),(1020,'#FF1C4D'),
(1021,'#DFB5A0'),(1021,'#E3BCA1'),(1021,'#DCB5A9'),(1021,'#CD9E84'),
(1022,'#E7D6CA'),
(1021,'#FF739B'),(1021,'#FF2446'),(1021,'#FF7A14'),(1021,'#FF1C4D'),
(1022,'#DFB5A0'),(1022,'#E3BCA1'),(1022,'#DCB5A9'),(1022,'#CD9E84'),
(1023,'#FF739B'),(1023,'#FF2446'),(1023,'#FF7A14'),(1023,'#FF1C4D'),
(1024,'#DFB5A0'),(1024,'#E3BCA1'),(1024,'#DCB5A9'),(1024,'#CD9E84'),
(1025,'#E7D6CA'),
(1026,'#DFB5A0'),(1026,'#E3BCA1'),(1026,'#DCB5A9'),(1026,'#CD9E84'),
(1027,'#FF739B'),(1027,'#FF2446'),(1027,'#FF7A14'),(1027,'#FF1C4D'),
(1028,'#DFB5A0'),(1028,'#E3BCA1'),(1028,'#DCB5A9'),(1028,'#CD9E84'),
(1029,'#E7D6CA'),
(1030,'#FF739B'),(1030,'#FF2446'),(1030,'#FF7A14'),(1030,'#FF1C4D'),
(1031,'#DFB5A0'),(1031,'#E3BCA1'),(1031,'#DCB5A9'),(1031,'#CD9E84');



-- 尺寸表
CREATE TABLE `comsize` (
`comsizeid` int NOT NULL AUTO_INCREMENT COMMENT '编号' ,
 comid int NOT NULL COMMENT '关联商品编号' ,
 size varchar(600)  NOT NULL comment '尺寸',
PRIMARY KEY (comsizeid),
FOREIGN KEY(comid) REFERENCES `commodity`(comid)
)ENGINE=InnoDB AUTO_INCREMENT=1;
insert into comsize(comid,size) values(1000,'0');
insert into comsize(comid,size) values(1001,'0');
insert into comsize(comid,size) values(1002,'0');
insert into comsize(comid,size) values(1003,'0');
insert into comsize(comid,size) values(1004,'0');
insert into comsize(comid,size) values(1005,'0');
insert into comsize(comid,size) values(1005,'0');
insert into comsize(comid,size) values(1007,'0');
insert into comsize(comid,size) values(1008,'0');
insert into comsize(comid,size) values(1009,'0');
insert into comsize(comid,size) values(1010,'0');
insert into comsize(comid,size) values(1011,'0');
insert into comsize(comid,size) values(1012,'0');
insert into comsize(comid,size) values(1013,'0');
insert into comsize(comid,size) values(1014,'0');
insert into comsize(comid,size) values(1015,'0');
insert into comsize(comid,size) values(1016,'0');
insert into comsize(comid,size) values(1017,'0');
insert into comsize(comid,size) values(1018,'0');
insert into comsize(comid,size) values(1019,'0');
insert into comsize(comid,size) values(1020,'0');
insert into comsize(comid,size) values(1021,'0');
insert into comsize(comid,size) values(1022,'0');
insert into comsize(comid,size) values(1021,'0');
insert into comsize(comid,size) values(1022,'0');
insert into comsize(comid,size) values(1023,'0');
insert into comsize(comid,size) values(1024,'0');
insert into comsize(comid,size) values(1025,'0');
insert into comsize(comid,size) values(1026,'0');
insert into comsize(comid,size) values(1027,'0');
insert into comsize(comid,size) values(1028,'0');
insert into comsize(comid,size) values(1029,'0');
insert into comsize(comid,size) values(1030,'0');
insert into comsize(comid,size) values(1031,'0');
SELECT * FROM comsize;


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
)ENGINE=InnoDB AUTO_INCREMENT=1 ;
INSERT INTO `site`(aid,sitename,sitephone,siteprovince,sitecity,sitecounty,sitedetailed) VALUES
('niubihh','陈佳豪','15073034644','广东省','珠海市','斗门区','白蕉南路29号南方it学院');

INSERT INTO `site`(aid,sitename,sitephone,siteprovince,sitecity,sitecounty,sitedetailed) VALUES
('niubihh','陈佳豪','15073034644','湖南省','岳阳市','岳阳县','张古英镇绕村');

select *  from site;

-- 购物车
CREATE TABLE `shoppingcar` (
`scarid` int NOT NULL AUTO_INCREMENT COMMENT '主键编号',
 aid varchar(20) NOT NULL COMMENT '关联账号',
 comid  int NOT NULL COMMENT '关联商品',
 comsizeid int NOT NULL COMMENT '关联尺寸',
 comcolorid int NOT NULL COMMENT '关联颜色',
 scarcount  int  NOT NULL DEFAULT 1 COMMENT '商品的个数',
PRIMARY KEY (scarid),
FOREIGN KEY(aid) REFERENCES account(aid),
FOREIGN KEY(comid) REFERENCES commodity(comid),
FOREIGN KEY(comsizeid) REFERENCES comsize(comsizeid),
FOREIGN KEY(comcolorid) REFERENCES comcolor(comcolorid)
)ENGINE=InnoDB AUTO_INCREMENT=1;


INSERT INTO `shoppingcar`(aid,comid,comsizeid,comcolorid,scarcount) VALUES('niubihh',1000,1,1,1);
INSERT INTO `shoppingcar`(aid,comid,comsizeid,comcolorid,scarcount) VALUES('niubihh',1020,1,1,1);

-- 订单
CREATE TABLE `order` (
`orderid` int NOT NULL AUTO_INCREMENT COMMENT '订单编号' ,
 aid varchar(20) NOT NULL COMMENT '关联账号' ,
 siteid  int NOT NULL COMMENT '关联地址' ,
 sitepurchase TIMESTAMP default now() comment '购买时间',
 orderMoney DOUBLE NOT NULL comment '金额',
 orderRemark varchar(600)  comment '备注',
 comPending int NOT NULL DEFAULT 1 COMMENT '0代表无效，1代表有效' ,
 comstatic int NOT NULL DEFAULT 0 COMMENT '0代表未付款，1代表付款' ,
 DeliverStatic int NOT NULL DEFAULT 0 COMMENT '0代表未发货，1代表发货' ,
 ReceivablesStatic int NOT NULL DEFAULT 0 COMMENT '0代表为收货，1代表未收货' ,
PRIMARY KEY (orderid),
FOREIGN KEY(siteid) REFERENCES site(siteid),
FOREIGN KEY(aid) REFERENCES account(aid)
)ENGINE=InnoDB AUTO_INCREMENT=1;

select * from `order`;

update `order` set comPending=0, comstatic=0,DeliverStatic=0,ReceivablesStatic=0 where orderid=50;

insert into `order`(aid,siteid,sitepurchase,orderMoney,orderRemark,comPending,comstatic,DeliverStatic,ReceivablesStatic) values
('niubihh','1',default,'0','',1,1,1,1);


insert into `order`(aid,siteid,sitepurchase,orderMoney,orderRemark,comPending,comstatic,DeliverStatic,ReceivablesStatic) values
('chord','1',default,'0','',default,default,default,default);


insert into `order`(aid,siteid,sitepurchase,orderMoney,orderRemark,comPending,comstatic,DeliverStatic,ReceivablesStatic) values
('chenjiahao','1',default,'0','',1,1,1,1);


-- 预订单表
CREATE TABLE `comreserve` (
`crid` int NOT NULL AUTO_INCREMENT COMMENT '主键编号' ,
 orderid int NOT NULL COMMENT '关联订单编号',
 comid  int NOT NULL COMMENT '关联商品',
 crcount  int  NOT NULL DEFAULT 1 COMMENT '商品的个数' ,
 comcolorid  int NOT NULL COMMENT '关联商品颜色',
 comsizeid  int  COMMENT '关联商品尺寸',
PRIMARY KEY (crid),
FOREIGN KEY(orderid) REFERENCES `order`(orderid),
FOREIGN KEY(comid) REFERENCES commodity(comid),
FOREIGN KEY(comcolorid) REFERENCES comcolor(comcolorid),
FOREIGN KEY(comsizeid) REFERENCES comsize(comsizeid)
)ENGINE=InnoDB AUTO_INCREMENT=1;

insert into  comreserve(orderid,comid,crcount,comcolorid) values  
(1,1000,1,1)
,(1,1001,2,1)
,(1,1003,1,1)
,(1,1008,1,1);

insert into  comreserve(orderid,comid,crcount,comcolorid) values  
(2,1000,1,1)
,(2,1001,2,1)
,(2,1003,1,1)
,(2,1008,1,1);


insert into  comreserve(orderid,comid,crcount,comcolorid) values  
(3,1000,1,1)
,(3,1001,2,1)
,(3,1003,1,1)
,(3,1008,1,1);
-- 退款表
CREATE TABLE `refund` (
`refundid` int NOT NULL AUTO_INCREMENT COMMENT '编号' ,
 orderid int NOT NULL COMMENT '关联订单编号' ,
 refundMoney DOUBLE NOT NULL comment '退款金额',
 refundRemark varchar(600)  NOT NULL comment '退款备注',
 refundstatic int NOT NULL DEFAULT 0 COMMENT '是否同意退款 0代表未处理，1代表同意 2代表不同意' ,
 refundTime TIMESTAMP default now() comment '退款时间',
 refundMerchantRemark varchar(600)  NOT NULL comment '商家备注',
PRIMARY KEY (refundid),
FOREIGN KEY(orderid) REFERENCES `order`(orderid)
)ENGINE=InnoDB AUTO_INCREMENT=1;

-- 收藏
CREATE TABLE `collect` (
`collectid` int NOT NULL AUTO_INCREMENT COMMENT '收藏编号' ,
 aid varchar(20) NOT NULL COMMENT '关联账号' ,
 comid  int NOT NULL COMMENT '关联商品' ,
PRIMARY KEY (collectid),
FOREIGN KEY(aid) REFERENCES account(aid),
FOREIGN KEY(comid) REFERENCES commodity(comid)
)ENGINE=InnoDB AUTO_INCREMENT=1;
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
)ENGINE=InnoDB AUTO_INCREMENT=1;

#备份表 
CREATE TABLE `backup` (
`backupid` int NOT NULL AUTO_INCREMENT COMMENT '编号' ,
 backupidname  varchar(200) NOT NULL COMMENT '备份名称' ,
 refundTime TIMESTAMP default now() comment '备份时间',
 Remarks varchar(600)  NOT NULL comment '备注',
PRIMARY KEY (backupid)
)ENGINE=InnoDB AUTO_INCREMENT=1;



