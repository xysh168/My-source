SET NAMES UTF8;
DROP DATABASE IF EXISTS darryring;
CREATE DATABASE darryring CHARSET=UTF8;
USE darryring;
/**省份表**/
CREATE TABLE provinces(
	proId INT PRIMARY KEY,
	proName VARCHAR(16)
);
/**城市表**/
CREATE TABLE cities(
	cid INT PRIMARY KEY,
	cname VARCHAR(16),
	proId INT
);
/**系列表**/
CREATE TABLE series(
	serieId INT PRIMARY KEY AUTO_INCREMENT,
	serieName VARCHAR(16)
);
/**店铺表**/
CREATE TABLE shops(
	sid INT PRIMARY KEY,
	title VARCHAR(64),
	province VARCHAR(16),
	proId INT,
	city VARCHAR(16),
	cid INT,
	sname VARCHAR(32),
	address VARCHAR(256),
	openingHours VARCHAR(32),
	hotline VARCHAR(16),
	shopPic VARCHAR(256)
);
/**店铺图片表**/
CREATE TABLE shoppic(
    picId INT PRIMARY KEY AUTO_INCREMENT,
    sid INT,
    sm VARCHAR(128),
    md VARCHAR(128),
    lg VARCHAR(128)
);
/**店铺列表轮播表**/
CREATE TABLE shoplist_carousel(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    ref VARCHAR(32),
    img VARCHAR(128),
    title VARCHAR(128),
    href VARCHAR(128),
    isuse VARCHAR(8)
);
/**戒指详情表**/

CREATE TABLE ringdetail(
    rid INT PRIMARY KEY AUTO_INCREMENT,
    classify VARCHAR(16),
    ringid VARCHAR(8),
    neatness VARCHAR(8),
    price INT,
    ringcz VARCHAR(16),
    series VARCHAR(64),
    color VARCHAR(8),
    minorcz VARCHAR(8),
    mainsize INT,
    cut VARCHAR(8),
    minornum VARCHAR(8),
    maincz VARCHAR(8),
    minorweight VARCHAR(16),
    mainnum VARCHAR(8),
    measure VARCHAR(32),
    mainweight VARCHAR(8),
    minorshape VARCHAR(8),
    shape VARCHAR(8),
    polish VARCHAR(8),
    balance VARCHAR(8),
    light VARCHAR(8),
    handiwork VARCHAR(32),
    refsize VARCHAR(128),
    comment INT
);
/**店铺详情表**/

create table shopdetail(
	SDid INT PRIMARY KEY AUTO_INCREMENT,
	sid INT,
	title VARCHAR(64),
	ordernum VARCHAR(16),
	description VARCHAR(1024),
	longitude INT,
	latitude INT,
	detailPic VARCHAR(2048)
);
/**戒指图片表**/

CREATE TABLE ringspic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  rid INT,		      #戒指编号
  lg VARCHAR(128),            #大图片路径
  md VARCHAR(128),            #中图片路径
  sm VARCHAR(128)             #小图片路径
);
/**用户表**/

CREATE TABLE `user` (
  `uid` int(11) NOT NULL auto_increment,
  `uname` varchar(32) default NULL,
  `upwd` varchar(32) default NULL,
  `email` varchar(64) default NULL,
  `phone` varchar(16) default NULL,
  `avatar` varchar(128) default NULL,
  `user_name` varchar(32) default NULL,
  `gender` int(11) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

/**收货地址信息**/
CREATE TABLE receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名
  is_default BOOLEAN          #是否为当前用户的默认收货地址
);
insert into receiver_address values(null,4,"秦小雅","辽宁省","沈阳市","皇姑区","黄河北大街128号",18629086442,null,710109,null,1);
insert into receiver_address values(null,1,"李四","陕西省","西安市","碑林区","体育场北路2115号",18629013374,null,710109,null,1);

/**购物车条目**/
CREATE TABLE shoppingcart(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  rid INT,   #戒指编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);
insert into shoppingcart values(null,4,2,1,true);
insert into shoppingcart values(null,4,6,1,false);
insert into shoppingcart values(null,4,12,1,true);
insert into shoppingcart values(null,4,1,1,false);
insert into shoppingcart values(null,1,2,1,true);
insert into shoppingcart values(null,1,6,1,false);

/**用户订单**/

CREATE TABLE userOrder(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  rid INT,                #商品编号
  address_id VARCHAR(256),
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
);                        #AUTO_INCREMENT=10000000

insert into userOrder values(null,4,1,1,1,null,null,null,null);
insert into userOrder values(null,1,2,2,2,null,null,null,null);


-- /**用户订单详情**/
-- CREATE TABLE order_detail(
--   did INT PRIMARY KEY AUTO_INCREMENT,
--   order_id INT,           #订单编号
--   rid INT,         #产品编号
--   count INT               #购买数量
-- );

INSERT INTO `user` VALUES ('1', 'dingding', '123456', 'ding@qq.com', '13511011000', 'img/avatar/default.png', '丁春秋', '0');
INSERT INTO `user` VALUES ('2', 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '当当喵', '1');
INSERT INTO `user` VALUES ('3', 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1');
INSERT INTO `user` VALUES ('4', 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');
INSERT INTO `user` VALUES ('5', '1111', '111111', '441977193@qq.com', '18357100796', null, null, null);
INSERT INTO `user` VALUES ('6', 'ABCD', '123456', '123@qq.com', '13538894495', null, null, null);
INSERT INTO `user` VALUES ('7', 'mohk', '123456', '11@qq.com', '13512312312', null, null, null);
INSERT INTO `user` VALUES ('8', '121123', 'w13945128995', '491000888@qq.com', '13213389258', null, null, null);
INSERT INTO `user` VALUES ('9', '555555', '5555555', '55555555@163.com', '13400000000', null, null, null);
INSERT INTO `user` VALUES ('10', 'xuyong', '123456', '123456789@qq.com', '15525623622', null, null, null);
INSERT INTO `user` VALUES ('11', 'admin', 'cxy930123', 'mail@xingyu1993.cn', '13580510164', null, null, null);
INSERT INTO `user` VALUES ('12', 'siyongbo', '900427', '616188545@qq.com', '18447103998', null, null, null);
INSERT INTO `user` VALUES ('13', 'qwerty', '123456', '1091256014@qq.com', '15617152367', null, null, null);
INSERT INTO `user` VALUES ('14', 'dingziqiang', '456456', '996534706@qq.com', '15567502520', null, null, null);
INSERT INTO `user` VALUES ('15', 'hdb2264068', 'huang123', '471062503@qq.com', '18898405759', null, null, null);
INSERT INTO `user` VALUES ('16', 'wenhua', '654321', 'liwenhua@tedu.cn', '15012345678', null, null, null);
INSERT INTO `user` VALUES ('17', '<img>', 'cxy930123', 'mail@xingyu1993.cn.1', '11111111111', null, null, null);
INSERT INTO `user` VALUES ('18', '</body>', 'cxy930123', 'mail@xingyu1993.cn.2', '22222222222', null, null, null);
INSERT INTO `user` VALUES ('19', '<img src=@>', 'cxy930123', 'mail@xingyu1993.cn.3', '33333333333', null, null, null);
INSERT INTO `user` VALUES ('20', '气航航', 'wyh961130', '1419591926@qq.com', '15927204115', null, null, null);
INSERT INTO `user` VALUES ('21', 'Jessy', 'ac210921', '123456@qq.com', '13523456789', null, null, null);
INSERT INTO `user` VALUES ('22', 'yuanxf', '123456', 'yuanxf@tedu.cn', '13537763301', null, null, null);
INSERT INTO `user` VALUES ('23', '查安军', '025520', '27514172112@qq.com', '18158899905', null, null, null);
INSERT INTO `user` VALUES ('24', '123456', '123456', '123456@1.com', '13815668132', null, null, null);
INSERT INTO `user` VALUES ('25', '1234', '111111', '734713428@qq.com', '18061920422', null, null, null);
INSERT INTO `user` VALUES ('26', 'qwe12345', '123123', '1191769510@qq.com', '15234010643', null, null, null);
INSERT INTO `user` VALUES ('27', '海贼王', '5124457', 'hxxcrocky@qq.com', '18826450879', null, null, null);
INSERT INTO `user` VALUES ('28', 'hanrufuyun00', 'hanrufuyun11', '458205630@qq.com', '13853114827', null, null, null);
INSERT INTO `user` VALUES ('29', 'li999999', 'li999999', 'limingdir@163.com', '18557512341', null, null, null);
INSERT INTO `user` VALUES ('30', '111111111111', '123456', '1057631733@qq.com', '15275106677', null, null, null);
INSERT INTO `user` VALUES ('31', 'tom', '123456', 'tom@tedu.cn', '13801234568', null, null, null);
INSERT INTO `user` VALUES ('32', 'zhouzhi', '123456', '2206344145@qq.com', '17600587478', null, null, null);
INSERT INTO `user` VALUES ('33', 'juleck', '123456', 'wuhaofushan@sina.com', '12345678901', null, null, null);
INSERT INTO `user` VALUES ('34', 'yangtao', '123456', '250737026@qq.com', '18256953222', null, null, null);
INSERT INTO `user` VALUES ('35', 'tarena', '123456', '783664829@qq.com', '17711625897', null, null, null);
INSERT INTO `user` VALUES ('36', 'xiaobai', 'xx527603', '1196465493@qq.com', '13980312111', null, 'lulu', '0');
INSERT INTO `user` VALUES ('37', '璐璐lu', '546521ll', '1273447080@qq.com', '15892761793', null, null, null);
INSERT INTO `user` VALUES ('38', '胖王二二', 'woaidoubi1.', '1179524522@qq.com', '13269195181', null, '', '0');
INSERT INTO `user` VALUES ('39', 'Yeye ', '123456', '1610608370@qq.com', '15062394551', null, null, null);
INSERT INTO `user` VALUES ('40', 'lsj', '123456', '11324564879@qq.com', '13156467891', null, null, null);
INSERT INTO `user` VALUES ('41', 'lsj', '123456', '11324564879@qq.com', '13156467891', null, null, null);
INSERT INTO `user` VALUES ('42', 'lsj', '123456', '11324564879@qq.com', '13156467891', null, null, null);
INSERT INTO `user` VALUES ('43', 'lsj', '123456', '11324564879@qq.com', '13156467891', null, null, null);
INSERT INTO `user` VALUES ('44', 'lsj', '123456', '11324564879@qq.com', '13156467891', null, null, null);
INSERT INTO `user` VALUES ('45', 'hjh', '958030', 'hjh@126.com', '17812344567', null, null, null);
INSERT INTO `user` VALUES ('46', 'ewq', '123456', '1234567890@qq.com', '12345678909', null, null, null);
INSERT INTO `user` VALUES ('47', 'pipi', '123456', '78@qq.com', '12367889993', null, null, null);
INSERT INTO `user` VALUES ('48', 'Lovica', '309418727', '1684707021@qq.com', '18435130456', null, null, null);
INSERT INTO `user` VALUES ('49', 'htt0908', '19920908', '418720482@qq.com', '15244691033', null, null, null);
INSERT INTO `user` VALUES ('50', 'SUXUEMEI', '123456', 'SUXUEMEI@qq.com', '15817338974', null, null, null);
INSERT INTO `user` VALUES ('51', 'zhong', '123456', '123456789@126.com', '13120211111', null, null, null);
INSERT INTO `user` VALUES ('52', '金豆豆', '123456789', '1170363143@qq.com', '15738619097', null, null, null);
INSERT INTO `user` VALUES ('53', 'wangjunfei', '123456', '396225880@qq.com', '13205935797', null, null, null);
INSERT INTO `user` VALUES ('54', 'gijhglkhglkh', '123456', 'sjksfj@fjdh.com', '15698765423', null, null, null);
INSERT INTO `user` VALUES ('55', 'zuiyd1314', 'zuiyh1994', '528396697@qq.com', '15927843908', null, null, null);
INSERT INTO `user` VALUES ('56', 'xiaoming123', '123456', '54646@qq.com', '13553688534', null, null, null);
INSERT INTO `user` VALUES ('57', 'yuanzhi', '123456', '270096123@qq.com', '15962573639', null, null, null);
INSERT INTO `user` VALUES ('58', 'fengkuang11', 'fengkuang113', '1135779768@qq.com', '18559132247', null, null, null);
INSERT INTO `user` VALUES ('59', 'fengkuang', '123456', '113577976@qq.com', '18559132248', null, null, null);
INSERT INTO `user` VALUES ('60', 'yxzaaa', '123456', '2280517552@qq.com', '13716225357', null, null, null);
INSERT INTO `user` VALUES ('61', 'linlei0001', '58874439', '876056078@qq.com', '13390922939', null, null, null);
INSERT INTO `user` VALUES ('62', 'superman', '1314520', '904202099@qq.com', '12345678910', null, null, null);
INSERT INTO `user` VALUES ('63', 'tom222', '123456', '1@163.com', '13456789012', null, null, null);
INSERT INTO `user` VALUES ('64', 'tom1234', '123456', '2@163.com', '13423456789', null, null, null);
INSERT INTO `user` VALUES ('65', 'Liyu123', 'asd8520', '812544715@qq.com', '18911743412', null, '左天', '1');
INSERT INTO `user` VALUES ('66', 'Liyu123', 'asd8520', '812544715@qq.com', '18911743412', null, null, null);
INSERT INTO `user` VALUES ('67', '李白李白', '123456', '125365@163.com', '13986273022', null, null, null);
INSERT INTO `user` VALUES ('68', 'dingdong', '123456', '15194898156@qq.com', '15112316516', null, null, null);
INSERT INTO `user` VALUES ('69', 'wenjinhua', '236239', '461677613@qq.com', '13516574786', null, null, null);
INSERT INTO `user` VALUES ('70', 'thebigleg', '1a4b2c8d5e7f', '1352951609@qq.com', '13572508752', null, null, null);
INSERT INTO `user` VALUES ('71', 'zhangsan', 'add123456', 'add@qq.com', '12234324223', null, null, null);
INSERT INTO `user` VALUES ('72', '高渐离', '123456', '935263676@qq.com', '18352501250', null, null, null);
INSERT INTO `user` VALUES ('73', 'lifan', '123456', '18092034652@163.com', '18092933456', null, null, null);
INSERT INTO `user` VALUES ('74', 'zhangsan99', '123456zs', '876987366@qq.com', '13934721892', null, null, null);
INSERT INTO `user` VALUES ('75', 'tingDING', '123456', '12345678@qq.com', '13548525468', null, null, null);
INSERT INTO `user` VALUES ('76', 'dongdong', '123456', 'wenhua@taqobao.com', '13946585968', null, null, null);
INSERT INTO `user` VALUES ('77', 'weiyiwei', '123456', '598475405@qq.com', '15923741956', null, '韦祎伟', '1');
INSERT INTO `user` VALUES ('78', '落英缤纷赋酒诗', 'sAberTime050', '857464657@qq.com', '17727420979', null, null, null);
INSERT INTO `user` VALUES ('79', 'xiaoming1234', '123456', '4564564564@qq.com', '15269188535', null, null, null);
INSERT INTO `user` VALUES ('80', 'loonchao', '123456', '850248873@qq.com', '13548729051', null, null, null);
INSERT INTO `user` VALUES ('81', 'hushuang', '123456', '850248813@qq.com', '15802507525', null, null, null);
INSERT INTO `user` VALUES ('82', 'test713', '2017713', '12458148@qq.com', '13596542654', null, null, null);
INSERT INTO `user` VALUES ('83', 'fhr9588', '000009588', '111111111@qq.com', '12345666666', null, null, null);
INSERT INTO `user` VALUES ('84', 'baibaidexue', '13809024377', '408130701@qq.com', '18301973827', null, null, null);
INSERT INTO `user` VALUES ('85', 'tom10', '123456', '123@163.com', '12323456', null, null, null);
INSERT INTO `user` VALUES ('86', '12121', '121212', '516898@qq.com', '15163222922', null, null, null);
INSERT INTO `user` VALUES ('87', 'qwer', 'qwer123', '519808982@qq.com', '15163222923', null, null, null);
INSERT INTO `user` VALUES ('88', '芳芳。。', '111111', '627265@qq.com', '17704622223', null, null, null);
INSERT INTO `user` VALUES ('89', 'smm123456', '963852741', '974255093@qq.com', '15098807312', null, null, null);
INSERT INTO `user` VALUES ('90', 'Wenhua.Li', 'libenka', 'wenhua.li@tedu.cn', '13912345678', null, null, null);


INSERT INTO ringspic VALUES(null,'1','img/ringlist/rings/lg/1509692104.jpg','img/ringlist/rings/md/1509692104.jpg','img/ringlist/rings/sm/1509692104.jpg');
INSERT INTO ringspic VALUES(null,'1','img/ringlist/rings/lg/1470291672.jpg','img/ringlist/rings/md/1470291672.jpg','img/ringlist/rings/sm/1470291672.jpg');
INSERT INTO ringspic VALUES(null,'1','img/ringlist/rings/lg/1470291689.jpg','img/ringlist/rings/md/1470291689.jpg','img/ringlist/rings/sm/1470291689.jpg');
INSERT INTO ringspic VALUES(null,'1','img/ringlist/rings/lg/1470291695.jpg','img/ringlist/rings/md/1470291695.jpg','img/ringlist/rings/sm/1470291695.jpg');
INSERT INTO ringspic VALUES(null,'1','img/ringlist/rings/lg/1470291756.jpg','img/ringlist/rings/md/1470291756.jpg','img/ringlist/rings/sm/1470291756.jpg');
INSERT INTO ringspic VALUES(null,'1','img/ringlist/rings/lg/1470291741.jpg','img/ringlist/rings/md/1470291741.jpg','img/ringlist/rings/sm/1470291741.jpg');
INSERT INTO ringspic VALUES(null,'1','img/ringlist/rings/lg/1470291709.jpg','img/ringlist/rings/md/1470291709.jpg','img/ringlist/rings/sm/1470291709.jpg');
INSERT INTO ringspic VALUES(null,'1','img/ringlist/rings/lg/1470291773.jpg','img/ringlist/rings/md/1470291773.jpg','img/ringlist/rings/sm/1470291773.jpg');
INSERT INTO ringspic VALUES(null,'1','img/ringlist/rings/lg/1470291723.jpg','img/ringlist/rings/md/1470291723.jpg','img/ringlist/rings/sm/1470291723.jpg');
INSERT INTO ringspic VALUES(null,'1','img/ringlist/rings/lg/1470291771.jpg','img/ringlist/rings/md/1470291771.jpg','img/ringlist/rings/sm/1470291771.jpg');

INSERT INTO ringspic VALUES(null,'2','img/ringlist/rings/lg/1509964641.jpg','img/ringlist/rings/md/1509964641.jpg','img/ringlist/rings/sm/1509964641.jpg');
INSERT INTO ringspic VALUES(null,'2','img/ringlist/rings/lg/1509964657.jpg','img/ringlist/rings/md/1509964657.jpg','img/ringlist/rings/sm/1509964657.jpg');
INSERT INTO ringspic VALUES(null,'2','img/ringlist/rings/lg/1509964815.jpg','img/ringlist/rings/md/1509964815.jpg','img/ringlist/rings/sm/1509964815.jpg');
INSERT INTO ringspic VALUES(null,'2','img/ringlist/rings/lg/1509964884.jpg','img/ringlist/rings/md/1509964884.jpg','img/ringlist/rings/sm/1509964884.jpg');

INSERT INTO ringspic VALUES(null,'3','img/ringlist/rings/lg/1487737016.jpg','img/ringlist/rings/md/1487737016.jpg','img/ringlist/rings/sm/1487737016.jpg');
INSERT INTO ringspic VALUES(null,'3','img/ringlist/rings/lg/1470281442.jpg','img/ringlist/rings/md/1470281442.jpg','img/ringlist/rings/sm/1470281442.jpg');
INSERT INTO ringspic VALUES(null,'3','img/ringlist/rings/lg/1470281447.jpg','img/ringlist/rings/md/1470281447.jpg','img/ringlist/rings/sm/1470281447.jpg');
INSERT INTO ringspic VALUES(null,'3','img/ringlist/rings/lg/1470281437.jpg','img/ringlist/rings/md/1470281437.jpg','img/ringlist/rings/sm/1470281437.jpg');

INSERT INTO ringspic VALUES(null,'4','img/ringlist/rings/lg/1489571757.jpg','img/ringlist/rings/md/1489571757.jpg','img/ringlist/rings/sm/1489571757.jpg');
INSERT INTO ringspic VALUES(null,'4','img/ringlist/rings/lg/1481182302.jpg','img/ringlist/rings/md/1481182302.jpg','img/ringlist/rings/sm/1481182302.jpg');
INSERT INTO ringspic VALUES(null,'4','img/ringlist/rings/lg/1481182308.jpg','img/ringlist/rings/md/1481182308.jpg','img/ringlist/rings/sm/1481182308.jpg');
INSERT INTO ringspic VALUES(null,'4','img/ringlist/rings/lg/1481182321.jpg','img/ringlist/rings/md/1481182321.jpg','img/ringlist/rings/sm/1481182321.jpg');

INSERT INTO ringspic VALUES(null,'5','img/ringlist/rings/lg/1492745083.jpg','img/ringlist/rings/md/1492745083.jpg','img/ringlist/rings/sm/1492745083.jpg');
INSERT INTO ringspic VALUES(null,'5','img/ringlist/rings/lg/1492745090.jpg','img/ringlist/rings/md/1492745090.jpg','img/ringlist/rings/sm/1492745090.jpg');
INSERT INTO ringspic VALUES(null,'5','img/ringlist/rings/lg/1492745100.jpg','img/ringlist/rings/md/1492745100.jpg','img/ringlist/rings/sm/1492745100.jpg');
INSERT INTO ringspic VALUES(null,'5','img/ringlist/rings/lg/1492745071.jpg','img/ringlist/rings/md/1492745071.jpg','img/ringlist/rings/sm/1492745071.jpg');

INSERT INTO ringspic VALUES(null,'6','img/ringlist/rings/lg/1495616910.jpg','img/ringlist/rings/md/1495616910.jpg','img/ringlist/rings/sm/1495616910.jpg');
INSERT INTO ringspic VALUES(null,'6','img/ringlist/rings/lg/1495616916.jpg','img/ringlist/rings/md/1495616916.jpg','img/ringlist/rings/sm/1495616916.jpg');
INSERT INTO ringspic VALUES(null,'6','img/ringlist/rings/lg/1495616927.jpg','img/ringlist/rings/md/1495616927.jpg','img/ringlist/rings/sm/1495616927.jpg');
INSERT INTO ringspic VALUES(null,'6','img/ringlist/rings/lg/1495616922.jpg','img/ringlist/rings/md/1495616922.jpg','img/ringlist/rings/sm/1495616922.jpg');

INSERT INTO ringspic VALUES(null,'7','img/ringlist/rings/lg/1501497993.jpg','img/ringlist/rings/md/1501497993.jpg','img/ringlist/rings/sm/1501497993.jpg');
INSERT INTO ringspic VALUES(null,'7','img/ringlist/rings/lg/1501497979.jpg','img/ringlist/rings/md/1501497979.jpg','img/ringlist/rings/sm/1501497979.jpg');
INSERT INTO ringspic VALUES(null,'7','img/ringlist/rings/lg/1501497984.jpg','img/ringlist/rings/md/1501497984.jpg','img/ringlist/rings/sm/1501497984.jpg');
INSERT INTO ringspic VALUES(null,'7','img/ringlist/rings/lg/1501497997.jpg','img/ringlist/rings/md/1501497997.jpg','img/ringlist/rings/sm/1501497997.jpg');

INSERT INTO ringspic VALUES(null,'8','img/ringlist/rings/lg/1509692818.jpg','img/ringlist/rings/md/1509692818.jpg','img/ringlist/rings/sm/1509692818.jpg');
INSERT INTO ringspic VALUES(null,'8','img/ringlist/rings/lg/1509692822.jpg','img/ringlist/rings/md/1509692822.jpg','img/ringlist/rings/sm/1509692822.jpg');
INSERT INTO ringspic VALUES(null,'8','img/ringlist/rings/lg/1509692833.jpg','img/ringlist/rings/md/1509692833.jpg','img/ringlist/rings/sm/1509692833.jpg');
INSERT INTO ringspic VALUES(null,'8','img/ringlist/rings/lg/1509692845.jpg','img/ringlist/rings/md/1509692845.jpg','img/ringlist/rings/sm/1509692845.jpg');

INSERT INTO ringspic VALUES(null,'9','img/ringlist/rings/lg/1509691429.jpg','img/ringlist/rings/md/1509691429.jpg','img/ringlist/rings/sm/1509691429.jpg');
INSERT INTO ringspic VALUES(null,'9','img/ringlist/rings/lg/1509691446.jpg','img/ringlist/rings/md/1509691446.jpg','img/ringlist/rings/sm/1509691446.jpg');
INSERT INTO ringspic VALUES(null,'9','img/ringlist/rings/lg/1509691454.jpg','img/ringlist/rings/md/1509691454.jpg','img/ringlist/rings/sm/1509691454.jpg');
INSERT INTO ringspic VALUES(null,'9','img/ringlist/rings/lg/1509691458.jpg','img/ringlist/rings/md/1509691458.jpg','img/ringlist/rings/sm/1509691458.jpg');

INSERT INTO ringspic VALUES(null,'10','img/ringlist/rings/lg/1509692818.jpg','img/ringlist/rings/md/1509692818.jpg','img/ringlist/rings/sm/1509692818.jpg');
INSERT INTO ringspic VALUES(null,'11','img/ringlist/rings/lg/1509964641.jpg','img/ringlist/rings/md/1509964641.jpg','img/ringlist/rings/sm/1509964641.jpg');
INSERT INTO ringspic VALUES(null,'12','img/ringlist/rings/lg/1514865321.jpg','img/ringlist/rings/md/1514865321.jpg','img/ringlist/rings/sm/1514865321.jpg');
INSERT INTO ringspic VALUES(null,'13','img/ringlist/rings/lg/1486707266.png','img/ringlist/rings/md/1486707266.png','img/ringlist/rings/sm/1486707266.png');
INSERT INTO ringspic VALUES(null,'14','img/ringlist/rings/lg/1486708709.png','img/ringlist/rings/md/1486708709.png','img/ringlist/rings/sm/1486708709.png');
INSERT INTO ringspic VALUES(null,'15','img/ringlist/rings/lg/1487737016.jpg','img/ringlist/rings/md/1487737016.jpg','img/ringlist/rings/sm/1487737016.jpg');
INSERT INTO ringspic VALUES(null,'16','img/ringlist/rings/lg/1489571757.jpg','img/ringlist/rings/md/1489571757.jpg','img/ringlist/rings/sm/1489571757.jpg');
INSERT INTO ringspic VALUES(null,'17','img/ringlist/rings/lg/1492745071.jpg','img/ringlist/rings/md/1492745071.jpg','img/ringlist/rings/sm/1492745071.jpg');
INSERT INTO ringspic VALUES(null,'18','img/ringlist/rings/lg/1495616910.jpg','img/ringlist/rings/md/1495616910.jpg','img/ringlist/rings/sm/1495616910.jpg');
INSERT INTO ringspic VALUES(null,'19','img/ringlist/rings/lg/1501497993.jpg','img/ringlist/rings/md/1501497993.jpg','img/ringlist/rings/sm/1501497993.jpg');
INSERT INTO ringspic VALUES(null,'20','img/ringlist/rings/lg/1509688552.jpg','img/ringlist/rings/md/1509688552.jpg','img/ringlist/rings/sm/1509688552.jpg');
INSERT INTO ringspic VALUES(null,'21','img/ringlist/rings/lg/1509691429.jpg','img/ringlist/rings/md/1509691429.jpg','img/ringlist/rings/sm/1509691429.jpg');
INSERT INTO ringspic VALUES(null,'22','img/ringlist/rings/lg/1509692818.jpg','img/ringlist/rings/md/1509692818.jpg','img/ringlist/rings/sm/1509692818.jpg');
INSERT INTO ringspic VALUES(null,'23','img/ringlist/rings/lg/1509964641.jpg','img/ringlist/rings/md/1509964641.jpg','img/ringlist/rings/sm/1509964641.jpg');
INSERT INTO ringspic VALUES(null,'24','img/ringlist/rings/lg/1514865321.jpg','img/ringlist/rings/md/1514865321.jpg','img/ringlist/rings/sm/1514865321.jpg');
INSERT INTO ringspic VALUES(null,'25','img/ringlist/rings/lg/1486707266.png','img/ringlist/rings/md/1486707266.png','img/ringlist/rings/sm/1486707266.png');
INSERT INTO ringspic VALUES(null,'26','img/ringlist/rings/lg/1486708709.png','img/ringlist/rings/md/1486708709.png','img/ringlist/rings/sm/1486708709.png');
INSERT INTO ringspic VALUES(null,'27','img/ringlist/rings/lg/1487737016.jpg','img/ringlist/rings/md/1487737016.jpg','img/ringlist/rings/sm/1487737016.jpg');
INSERT INTO ringspic VALUES(null,'28','img/ringlist/rings/lg/1489571757.jpg','img/ringlist/rings/md/1489571757.jpg','img/ringlist/rings/sm/1489571757.jpg');
INSERT INTO ringspic VALUES(null,'29','img/ringlist/rings/lg/1492745071.jpg','img/ringlist/rings/md/1492745071.jpg','img/ringlist/rings/sm/1492745071.jpg');
INSERT INTO ringspic VALUES(null,'30','img/ringlist/rings/lg/1495616910.jpg','img/ringlist/rings/md/1495616910.jpg','img/ringlist/rings/sm/1495616910.jpg');
INSERT INTO ringspic VALUES(null,'31','img/ringlist/rings/lg/1501497993.jpg','img/ringlist/rings/md/1501497993.jpg','img/ringlist/rings/sm/1501497993.jpg');
INSERT INTO ringspic VALUES(null,'32','img/ringlist/rings/lg/1509688552.jpg','img/ringlist/rings/md/1509688552.jpg','img/ringlist/rings/sm/1509688552.jpg');
INSERT INTO ringspic VALUES(null,'33','img/ringlist/rings/lg/1509691429.jpg','img/ringlist/rings/md/1509691429.jpg','img/ringlist/rings/sm/1509691429.jpg');
INSERT INTO ringspic VALUES(null,'34','img/ringlist/rings/lg/1509692818.jpg','img/ringlist/rings/md/1509692818.jpg','img/ringlist/rings/sm/1509692818.jpg');
INSERT INTO ringspic VALUES(null,'35','img/ringlist/rings/lg/1509964641.jpg','img/ringlist/rings/md/1509964641.jpg','img/ringlist/rings/sm/1509964641.jpg');
INSERT INTO ringspic VALUES(null,'36','img/ringlist/rings/lg/1514865321.jpg','img/ringlist/rings/md/1514865321.jpg','img/ringlist/rings/sm/1514865321.jpg');
INSERT INTO ringspic VALUES(null,'37','img/ringlist/rings/lg/1486707266.png','img/ringlist/rings/md/1486707266.png','img/ringlist/rings/sm/1486707266.png');
INSERT INTO ringspic VALUES(null,'38','img/ringlist/rings/lg/1486708709.png','img/ringlist/rings/md/1486708709.png','img/ringlist/rings/sm/1486708709.png');
INSERT INTO ringspic VALUES(null,'39','img/ringlist/rings/lg/1487737016.jpg','img/ringlist/rings/md/1487737016.jpg','img/ringlist/rings/sm/1487737016.jpg');
INSERT INTO ringspic VALUES(null,'40','img/ringlist/rings/lg/1489571757.jpg','img/ringlist/rings/md/1489571757.jpg','img/ringlist/rings/sm/1489571757.jpg');
INSERT INTO ringspic VALUES(null,'41','img/ringlist/rings/lg/1492745071.jpg','img/ringlist/rings/md/1492745071.jpg','img/ringlist/rings/sm/1492745071.jpg');
INSERT INTO ringspic VALUES(null,'42','img/ringlist/rings/lg/1495616910.jpg','img/ringlist/rings/md/1495616910.jpg','img/ringlist/rings/sm/1495616910.jpg');
INSERT INTO ringspic VALUES(null,'43','img/ringlist/rings/lg/1501497993.jpg','img/ringlist/rings/md/1501497993.jpg','img/ringlist/rings/sm/1501497993.jpg');
INSERT INTO ringspic VALUES(null,'44','img/ringlist/rings/lg/1509688552.jpg','img/ringlist/rings/md/1509688552.jpg','img/ringlist/rings/sm/1509688552.jpg');
INSERT INTO ringspic VALUES(null,'45','img/ringlist/rings/lg/1509691429.jpg','img/ringlist/rings/md/1509691429.jpg','img/ringlist/rings/sm/1509691429.jpg');
INSERT INTO ringspic VALUES(null,'46','img/ringlist/rings/lg/1509692818.jpg','img/ringlist/rings/md/1509692818.jpg','img/ringlist/rings/sm/1509692818.jpg');
INSERT INTO ringspic VALUES(null,'47','img/ringlist/rings/lg/1509964641.jpg','img/ringlist/rings/md/1509964641.jpg','img/ringlist/rings/sm/1509964641.jpg');
INSERT INTO ringspic VALUES(null,'48','img/ringlist/rings/lg/1514865321.jpg','img/ringlist/rings/md/1514865321.jpg','img/ringlist/rings/sm/1514865321.jpg');
INSERT INTO ringspic VALUES(null,'49','img/ringlist/rings/lg/1509964641.jpg','img/ringlist/rings/md/1509964641.jpg','img/ringlist/rings/sm/1509964641.jpg');
INSERT INTO ringspic VALUES(null,'50','img/ringlist/rings/lg/1514865321.jpg','img/ringlist/rings/md/1514865321.jpg','img/ringlist/rings/sm/1514865321.jpg');
INSERT INTO ringspic VALUES(null,'51','img/ringlist/rings/lg/1486707266.png','img/ringlist/rings/md/1486707266.png','img/ringlist/rings/sm/1486707266.png');
INSERT INTO ringspic VALUES(null,'52','img/ringlist/rings/lg/1486708709.png','img/ringlist/rings/md/1486708709.png','img/ringlist/rings/sm/1486708709.png');
INSERT INTO ringspic VALUES(null,'53','img/ringlist/rings/lg/1487737016.jpg','img/ringlist/rings/md/1487737016.jpg','img/ringlist/rings/sm/1487737016.jpg');
INSERT INTO ringspic VALUES(null,'54','img/ringlist/rings/lg/1489571757.jpg','img/ringlist/rings/md/1489571757.jpg','img/ringlist/rings/sm/1489571757.jpg');
INSERT INTO ringspic VALUES(null,'55','img/ringlist/rings/lg/1492745071.jpg','img/ringlist/rings/md/1492745071.jpg','img/ringlist/rings/sm/1492745071.jpg');
INSERT INTO ringspic VALUES(null,'56','img/ringlist/rings/lg/1495616910.jpg','img/ringlist/rings/md/1495616910.jpg','img/ringlist/rings/sm/1495616910.jpg');
INSERT INTO ringspic VALUES(null,'57','img/ringlist/rings/lg/1501497993.jpg','img/ringlist/rings/md/1501497993.jpg','img/ringlist/rings/sm/1501497993.jpg');
INSERT INTO ringspic VALUES(null,'58','img/ringlist/rings/lg/1509688552.jpg','img/ringlist/rings/md/1509688552.jpg','img/ringlist/rings/sm/1509688552.jpg');
INSERT INTO ringspic VALUES(null,'59','img/ringlist/rings/lg/1509691429.jpg','img/ringlist/rings/md/1509691429.jpg','img/ringlist/rings/sm/1509691429.jpg');
INSERT INTO ringspic VALUES(null,'60','img/ringlist/rings/lg/1509692818.jpg','img/ringlist/rings/md/1509692818.jpg','img/ringlist/rings/sm/1509692818.jpg');
INSERT INTO ringspic VALUES(null,'61','img/ringlist/rings/lg/1509964641.jpg','img/ringlist/rings/md/1509964641.jpg','img/ringlist/rings/sm/1509964641.jpg');
INSERT INTO ringspic VALUES(null,'62','img/ringlist/rings/lg/1514865321.jpg','img/ringlist/rings/md/1514865321.jpg','img/ringlist/rings/sm/1514865321.jpg');


INSERT INTO shoplist_carousel VALUES(NULL,'shoplist-banner','img/shoplist/banner/15105685685a09727863a41.jpg','店铺页轮播1','#','1');
INSERT INTO shoplist_carousel VALUES(NULL,'shoplist-banner','img/shoplist/banner/15133321585a339dbe6d9d7.jpg','店铺页轮播2','#','0');
INSERT INTO shoplist_carousel VALUES(NULL,'shoplist-banner','img/shoplist/banner/149855289859521a42b3035.jpg','店铺页轮播3','#','1');
INSERT INTO shoplist_carousel VALUES(NULL,'shoplist-banner','img/shoplist/banner/15153969015a531f2536afa.jpg','店铺页轮播4','#','1');

INSERT INTO shoplist_carousel VALUES(NULL,'ringlist-banner','img/ringlist/banner/1492511360.jpg','商品页轮播1','#','1');
INSERT INTO shoplist_carousel VALUES(NULL,'ringlist-banner','img/ringlist/banner/150607235559c4d7231ca93.jpg','商品页轮播2','#','1');
INSERT INTO shoplist_carousel VALUES(NULL,'ringlist-banner','img/ringlist/banner/150813419559e44d336a993.jpg','商品页轮播3','#','1');
INSERT INTO shoplist_carousel VALUES(NULL,'ringlist-banner','img/ringlist/banner/14955312165923fed00bb27.jpg','商品页轮播4','#','1');
INSERT INTO shoplist_carousel VALUES(NULL,'ringlist-banner','img/ringlist/banner/14955312695923ff059d862.jpg','商品页轮播4','#','1');


INSERT INTO shops VALUES('10100101','深圳-来福士广场店','广东','101','深圳','101001','深圳-来福士广场店-中国','深圳市南山区南海大道2163号来福士广场01层14号','10:00-22:00（节假日照常接待）','0755-2692 2265','img/shoplist/shops/md/150466737759af66f1a25d4.jpg');
INSERT INTO shops VALUES('10100102','广州-中信广场店','广东','101','广州','101002','广州-中信广场店-中国','广东省广州市天河区天河北路233号中信广场中天购物城商场134-135单元（林和西地铁站 D出口）','10:00-22:00（节假日照常接待）','020-3883 6315','img/shoplist/shops/md/15100218655a011ae9e5664.jpg');
INSERT INTO shops VALUES('10100103','深圳-壹方城店','广东','101','深圳','101001','深圳-壹方城店-中国','深圳市宝安区创业二路与新湖路交汇西南处壹方城L1层022号','10:00-22:00（节假日照常接待）','0755-29601314','img/shoplist/shops/md/150466742559af672109df3.jpg');
INSERT INTO shops VALUES('10100104','东莞-长安万科广场店','广东','101','东莞','101003','东莞-长安万科广场店-中国','东莞市长安镇长安万科广场一楼L1-034号铺','10:00-22:00（节假日照常接待）','0769-22888676','img/shoplist/shops/md/150529219159b8ef9f84af3.jpg');
INSERT INTO shops VALUES('10100105','惠州-华贸天地店','广东','101','惠州','101004','惠州-华贸天地店-中国','惠州市江北区文昌一路9号华贸天地一层1125B号铺位','10:00-22:00（节假日照常接待）','0752-2522520','img/shoplist/shops/md/150580523859c0c3b6de9de.jpg');
INSERT INTO shops VALUES('10100106','东莞-汇一城店','广东','101','东莞','101003','东莞-汇一城店-中国','广东省东莞市南城区鸿福路200号第一国际汇一城1号裙一层B1120A','10:00-22:00（节假日照常接待）','0769-2288 6520','img/shoplist/shops/md/150485557859b2461a45977.jpg');
INSERT INTO shops VALUES('10100107','广州-正佳广场店','广东','101','广州','101002','广州-正佳广场店-中国','广州市天河区正佳广场一楼1F-1C091a号铺位','10:00-22:00（节假日照常接待）','020-89810400','img/shoplist/shops/md/150944617359f8521d03e26.jpg');
INSERT INTO shops VALUES('10100108','佛山-万科广场店','广东','101','佛山','101005','佛山-万科广场店-中国','广东省佛山市南海区桂澜中路万科广场一层中庭M-106-1号','10:00-22:00（节假日照常接待）','0757-8626 4003','img/shoplist/shops/md/150485599259b247b899a0c.jpg');
INSERT INTO shops VALUES('10100109','湛江-金沙湾店','广东','101','湛江','101006','湛江-金沙湾店-中国','广东省湛江市赤坎区观海北路8号万象金沙湾广场一层01-05','（节假日照常接待）','400-01-13520','img/shoplist/shops/md/15133268725a3389188f0af.jpg');
INSERT INTO shops VALUES('10100110','南京-建邺万达广场店','江苏','102','南京','101007','南京-建邺万达广场店-中国','南京市建邺区江东中路98号万达广场室内步行街一层128号商铺','10:00-22:00（节假日照常接待）','025-84513520',null);
INSERT INTO shops VALUES('10100111','南京-景枫kingmo店','江苏','102','南京','101007','南京-景枫kingmo店-中国','南京市江宁区双龙大道1698号F1-D2','10:00-22:00（节假日照常接待）','025-52713520',null);
INSERT INTO shops VALUES('10100112','南京-印象汇店','江苏','102','南京','101007','南京-印象汇店-中国','南京市浦口区大桥北路58号南京印象汇 01-07B铺位','10:00-22:00（节假日照常接待）','025-58213520',null);
INSERT INTO shops VALUES('10100113','南京-1912店','江苏','102','南京','101007','南京-1912店-中国','江苏省南京市 长江路288号1912街区A17号楼一层','10:00-22:00（节假日照常接待）','025-8361 3520',null);
INSERT INTO shops VALUES('10100114','南京-金茂汇店','江苏','102','南京','101007','南京-金茂汇店-中国','江苏省南京市鼓楼区中央路201号金茂汇购物中心1层L115A-L115B铺','10:00-22:00（节假日照常接待）','025-8441 3520',null);
INSERT INTO shops VALUES('10100115','无锡-恒隆广场店','江苏','102','无锡','101008','无锡-恒隆广场店-中国','江苏省无锡市崇安区 人民中路139号无锡恒隆广场商场2楼207号店铺','10:00-22:00（节假日照常接待）','0510-8101 3520',null);
INSERT INTO shops VALUES('10100116','无锡-宜家荟聚店','江苏','102','无锡','101008','无锡-宜家荟聚店-中国','无锡市锡山区团结中路3号宜家荟聚购物中心L2-109（CK旁边）','10:00-22:00（节假日照常接待）','0510-88258520',null);
INSERT INTO shops VALUES('10100117','常州-吾悦国际广场店','江苏','102','常州','101009','常州-吾悦国际广场店-中国','江苏省常州市钟楼区延陵西路123号吾悦国际广场A座一楼5-130','10:00-21:30（节假日照常接待）','0519-8681 3520',null);
INSERT INTO shops VALUES('10100118','盐城-万达广场店','江苏','102','盐城','101010','盐城-万达广场店-中国','盐城市盐都区西环路与腾飞路交叉口东南角盐城万达广场','10:00-21:30（节假日照常接待）','0515-8991 3520',null);
INSERT INTO shops VALUES('10100119','苏州-美罗百货店','江苏','102','苏州','101011','苏州-美罗百货店-中国','江苏省苏州市平江区观前街245美罗商城北一楼','10:00-22:00（节假日照常接待）','0512-6841 3520',null);
INSERT INTO shops VALUES('10100120','南通-圆融广场店','江苏','102','南通','101012','南通-圆融广场店-中国','江苏省南通市崇川区工农南路57号圆融广场一层108号铺','10:00-22:00（节假日照常接待）','0513-8911 3520',null);
INSERT INTO shops VALUES('10100121','宜兴-万达广场店','江苏','102','宜兴','101013','宜兴-万达广场店-中国','宜兴市东虹东路550号1059号','10:00-22:00（节假日照常接待）','0510-87331521',null);
INSERT INTO shops VALUES('10100122','无锡-海岸城店','江苏','102','无锡','101008','无锡-海岸城店-中国','无锡市滨湖区太湖新城立信大道海岸城1楼155号铺位','10:00-22:00（节假日照常接待）','0510-68509520',null);
INSERT INTO shops VALUES('10100123','苏州-狮山天街店','江苏','102','苏州','101011','苏州-狮山天街店-中国','江苏省苏州市虎丘区高新区塔园路181号狮山天街生活广场1F-09（近4号门）','10:00-22:00（节假日照常接待）','0512-67244520',null);
INSERT INTO shops VALUES('10100124','徐州-云龙万达广场店','江苏','102','徐州','101014','徐州-云龙万达广场店-中国','徐州市云龙区和平大道58号徐州云龙万达广场一层步行街区域1003铺位','10:00-21:30（节假日照常接待）','0516-83662997',null);
INSERT INTO shops VALUES('10100125','苏州-中心店','江苏','102','苏州','101011','苏州-中心店-中国','江苏省苏州市工业园区苏州中心广场5幢L1层（A）01-48号','10:00-22:00（节假日照常接待）','0512-69881520',null);
INSERT INTO shops VALUES('10100126','镇江-苏宁广场店','江苏','102','镇江','101015','镇江-苏宁广场店-中国','江苏省镇江市京口区中山东路189号1F123号','（节假日照常接待）','400-01-13520',null);
INSERT INTO shops VALUES('10100127','上海-淮海中路店','上海','103','上海','101016','上海-淮海中路店-中国','上海市黄浦区淮海中路806号1楼','10:00-22:00（节假日照常接待）','021-5401 8520',null);
INSERT INTO shops VALUES('10100128','上海-瑞虹天地店','上海','103','上海','101016','上海-瑞虹天地店-中国','上海市虹口区瑞虹路188号瑞虹天地月亮湾一层09室','10:00-22:00（节假日照常接待）','021-65057520',null);
INSERT INTO shops VALUES('10100129','上海-来福士广场店','上海','103','上海','101016','上海-来福士广场店-中国','上海市长宁路1123号长宁来福士广场1层中庭','10:00-22:00（节假日照常接待）','021-6093 4520',null);
INSERT INTO shops VALUES('10100130','上海-香港广场店','上海','103','上海','101016','上海-香港广场店-中国','上海市黄浦区淮海中路282号香港广场商场北座NL1-09B室','10:00-22:00（节假日照常接待）','021-6314 0533',null);
INSERT INTO shops VALUES('10100131','上海-浦东正大广场店','上海','103','上海','101016','上海-浦东正大广场店-中国','上海市浦东新区陆家嘴西路168号正大广场1楼GF10号','10:00-22:00（节假日照常接待）','021-50913520',null);
INSERT INTO shops VALUES('10100132','上海-五角场万达店','上海','103','上海','101016','上海-五角场万达店-中国','上海市杨浦区五角场万达广场B1021号','10:00-22:00（节假日照常接待）','021-35073350',null);
INSERT INTO shops VALUES('10100133','上海-宝山龙湖天街店','上海','103','上海','101016','上海-宝山龙湖天街店-中国','上海市宝山区龙湖宝山天街1F18&19 ','（节假日照常接待）','021-56152029',null);
INSERT INTO shops VALUES('10100134','哈尔滨-红博会展购物中心店','黑龙江','104','哈尔滨','101017','哈尔滨-红博会展购物中心店-中国','哈尔滨南岗区红旗大街301号','（节假日照常接待）','400-01-13520',null);
INSERT INTO shops VALUES('10100135','哈尔滨-西城红场店','黑龙江','104','哈尔滨','101017','哈尔滨-西城红场店-中国','哈尔滨市南岗区哈西大街299号西城红场生活港1F','（节假日照常接待）','400-01-13520',null);
INSERT INTO shops VALUES('10100136','哈尔滨-金太阳店','黑龙江','104','哈尔滨','101017','哈尔滨-金太阳店-中国','黑龙江省哈尔滨市 道里区地段街128号金太阳索菲亚精品城一层B区18号（7号门）','9:30-21:00（节假日照常接待）','0451-8681 3520',null);
INSERT INTO shops VALUES('10100137','大庆-新玛特店','黑龙江','104','大庆','101018','大庆-新玛特店-中国','大庆市萨尔图区东风新村纬二路39号新玛特购物休闲广场 Darry Ring珠宝','9：00-20:30（节假日照常接待）','0459-6150520',null);
INSERT INTO shops VALUES('10100138','北京-世贸天阶店','北京','105','北京','101019','北京-世贸天阶店-中国','北京市朝阳区光华路9号世贸天阶南街一层L136','10:00-22:00（节假日照常接待）','010-5206 1062',null);
INSERT INTO shops VALUES('10100139','北京-银泰in88店','北京','105','北京','101019','北京-银泰in88店-中国','北京市东城区王府井大街88号银泰百货in88 1幢地上二层L211号商铺','10:00 -22:00（节假日照常接待）','010-5978 5521',null);
INSERT INTO shops VALUES('10100140','北京-SOHO店','北京','105','北京','101019','北京-SOHO店-中国','北京市东城区东二环 朝阳门桥银河SOHO中心B座负一层2-109（朝阳门地铁站G出口)','9:00-22:00（节假日照常接待）','010-5957 6758',null);
INSERT INTO shops VALUES('10100141','北京-东方新天地店','北京','105','北京','101019','北京-东方新天地店-中国','北京市东城区东长安街1号北京东方广场东方新天地商场UG层A106A&B店铺','10:00-22:00（节假日照常接待）','010-85181890',null);
INSERT INTO shops VALUES('10100142','北京-银泰中心国贸店','北京','105','北京','101019','北京-银泰中心国贸店-中国','北京市朝阳区建国门外大街2号北京银泰中心地下一层B54号',' 10:00-21:30（节假日照常接待）','010-85172520',null);
INSERT INTO shops VALUES('10100143','天津-银河购物中心店','天津','106','天津','101020','天津-银河购物中心店-中国','天津市河西区乐园道9号天津银河国际购物中心二层L2-026-2，027-1（店铺号）','10:00-22:00（节假日照常接待）','022-83887521',null);
INSERT INTO shops VALUES('10100144','天津-津湾广场店','天津','106','天津','101020','天津-津湾广场店-中国','天津市和平区津湾广场1号楼1-04号','10:00-22:00（节假日照常接待）','157 1226 2820',null);
INSERT INTO shops VALUES('10100145','天津-爱琴海店','天津','106','天津','101020','天津-爱琴海店-中国','天津市河东区津滨大道160号一层147号','10:00-22:00（节假日照常接待）','022-24666816',null);
INSERT INTO shops VALUES('10100146','石家庄-乐汇城店','河北','107','石家庄','101021','石家庄-乐汇城店-中国','河北省石家庄市长安区中山东路11号乐汇城一层w11号铺','10:00-21:30（节假日照常接待）','0311-6678 3520',null);
INSERT INTO shops VALUES('10100147','唐山-银泰城店','河北','107','唐山','101022','唐山-银泰城店-中国','河北省唐山市路南区新华西道2-4号银泰城B馆F107号商铺','9:30-21:30（节假日照常接待）','0315-3791 520',null);
INSERT INTO shops VALUES('10100148','邯郸-勒泰城店','河北','107','邯郸','101023','邯郸-勒泰城店-中国','邯郸市丛台区陵西大街与人民路交叉口勒泰中心F1层F1-02','（节假日照常接待）','400-01-13520',null);
INSERT INTO shops VALUES('10100149','太原-梅园百盛店','山西','108','太原','101024','太原-梅园百盛店-中国','山西省太原市 小店区亲贤街189号梅园百盛一层','10:00-22:00（节假日照常接待）','0351-8067 121',null);
INSERT INTO shops VALUES('10100150','呼和浩特-维多利店','内蒙古','109','呼和浩特','101025','呼和浩特-维多利店-中国','内蒙古自治区呼和浩特市回民区中山西路1号维多利时代城L1-014','9:30-20:30（节假日照常接待）','0471-5314 139',null);
INSERT INTO shops VALUES('10100151','鄂尔多斯-每天百货店','内蒙古','109','鄂尔多斯','101026','鄂尔多斯-每天百货店-中国','内蒙古鄂尔多斯东胜区伊金霍洛东街3号每天百货都市一楼','9：00-21：00（节假日照常接待）','0477- 8323520',null);
INSERT INTO shops VALUES('10100152','包头-维多利店','内蒙古','109','包头','101027','包头-维多利店-中国','内蒙古自治区包头市昆都仑区钢铁大街96号维多利商厦TOMMY位置','（节假日照常接待）','400-01-13520',null);
INSERT INTO shops VALUES('10100153','大连-凯丹广场店','辽宁','110','大连','101028','大连-凯丹广场店-中国','辽宁省大连市中山区 长江东路96号凯丹广场一层01号店铺','9:30-21:00（节假日照常接待）','0411-3974 0521',null);
INSERT INTO shops VALUES('10100154','沈阳-中街恒隆店','辽宁','110','沈阳','101029','沈阳-中街恒隆店-中国','辽宁省沈阳市沈河区中街路128号皇城恒隆广场商场148-1号铺位','10:00-22:00（节假日照常接待）','024-3150 8520',null);
INSERT INTO shops VALUES('10100155','大连-恒隆广场店','辽宁','110','大连','101028','大连-恒隆广场店-中国','辽宁省大连市西岗区五四路66号大连恒隆广场商场253b号铺位','9:30-21:00（节假日照常接待）','0411-8281 3521',null);
INSERT INTO shops VALUES('10100156','沈阳-市府恒隆店','辽宁','110','沈阳','101029','沈阳-市府恒隆店-中国','辽宁省沈阳市沈河区青年大街1号市府恒隆广场商场三层325号铺位','10:00-21:30（节假日照常接待）','024-3195 8520',null);
INSERT INTO shops VALUES('10100157','大连-柏威年店','辽宁','110','大连','101028','大连-柏威年店-中国','大连市中山区中山路129号-3一层1029号','9：30-21：30（节假日照常接待）','0411-83010521',null);
INSERT INTO shops VALUES('10100158','锦州-万达广场店','辽宁','110','锦州','101030','锦州-万达广场店-中国','辽宁省锦州市太和区科技路21号万达广场F1-1028','10:00-21:30（节假日照常接待）','0416-3883521',null);
INSERT INTO shops VALUES('10100159','鞍山-新玛特店','辽宁','110','鞍山','101031','鞍山-新玛特店-中国','辽宁省鞍山市铁东区胜利南路42号大商新玛特一层名品区戴瑞珠宝','9:30-21:00（节假日照常接待）','0412-2657520',null);
INSERT INTO shops VALUES('10100160','长春-活力城店','吉林','111','长春','101032','长春-活力城店-中国','吉林省长春市南关区重庆路88号活力城1层106铺位','10:00-21:30（节假日照常接待）','0431-8191 1520',null);
INSERT INTO shops VALUES('10100161','吉林-万达广场店','吉林','111','吉林','101033','吉林-万达广场店-中国','吉林市昌邑区吉林大街与林荫路交汇处','10:00-22:00（节假日照常接待）','0432-65120520',null);
INSERT INTO shops VALUES('10100162','绍兴-上虞万达广场店','浙江','112','绍兴','101034','绍兴-上虞万达广场店-中国','浙江省绍兴市上虞区称山北路399号上虞万达广场1056铺位','10:00-22:00（节假日照常接待）','0575-82963520',null);
INSERT INTO shops VALUES('10100163','温州-龙湾万达店','浙江','112','温州','101035','温州-龙湾万达店-中国','温州龙湾区永中街道永定路1188号1062铺位','10:00-22:00（节假日照常接待）','0577-8613 5209',null);
INSERT INTO shops VALUES('10100164','杭州-龙湖金沙天街店','浙江','112','杭州','101036','杭州-龙湖金沙天街店-中国','杭州经济开发区金沙大道560号龙湖金沙天街购物中心1F-09','10:00-22:00（节假日照常接待）','0571-86982520',null);
INSERT INTO shops VALUES('10100165','杭州-利星名品广场店','浙江','112','杭州','101036','杭州-利星名品广场店-中国','浙江省杭州市平海路124号利星名品广场1楼','10:00-22:00（节假日照常接待）','0571-8656 9520',null);
INSERT INTO shops VALUES('10100166','杭州-星光大道店','浙江','112','杭州','101036','杭州-星光大道店-中国','浙江省杭州市滨江区滨盛路1766号星光大道二期一层L146','10:00-22:00（节假日照常接待）','0571-8696 1076',null);
INSERT INTO shops VALUES('10100167','台州-万达广场店','浙江','112','台州','101037','台州-万达广场店-中国','台州市椒江区开发大道799号台州经开万达广场1003铺','10:00-22:00（节假日照常接待）','0576-88020520',null);
INSERT INTO shops VALUES('10100168','宁波-和义大道店','浙江','112','宁波','101038','宁波-和义大道店-中国','浙江省宁波市海曙区 和义路78号和义大道购物中心C区一层1048c号商铺','10:00-22:00（节假日照常接待）','0574-8701 3520',null);
INSERT INTO shops VALUES('10100169','温州-财富购物中心店','浙江','112','温州','101035','温州-财富购物中心店-中国','浙江省温州市鹿城区车站大道路577号财富购物中心负一楼','10:00-22:00（节假日照常接待）','0577-8800 7661',null);
INSERT INTO shops VALUES('10100170','金华-万达广场店','浙江','112','金华','101039','金华-万达广场店-中国','浙江省金华市李渔路300号万达广场室内步行街一层1032号商铺','10:00-22:00（节假日照常接待）','0579-8215 6075',null);
INSERT INTO shops VALUES('10100171','余姚-万达广场店','浙江','112','余姚','101040','余姚-万达广场店-中国','余姚市四明西路855号余姚万达广场1033C铺','10:00-22:00（节假日照常接待）','0574-62713520',null);
INSERT INTO shops VALUES('10100172','杭州-下城新天地店','浙江','112','杭州','101036','杭州-下城新天地店-中国','杭州市下城区长浜路和新天地街交叉口新天地中心1F-L107','10:00-22:00（节假日照常接待）','0571-85175205',null);
INSERT INTO shops VALUES('10100173','嘉兴-万达广场店','浙江','112','嘉兴','101041','嘉兴-万达广场店-中国','浙江省嘉兴市南湖区广益路1108号万达广场1025号铺','10:00-22:00（节假日照常接待）','0573-83525202',null);
INSERT INTO shops VALUES('10100174','衢州-万达店','浙江','112','衢州','101042','衢州-万达店-中国','衢州市柯城区浙西大道323号一层1015号','10:00-22:00（节假日照常接待）','0570-8030908',null);
INSERT INTO shops VALUES('10100175','绍兴-柯桥万达店','浙江','112','绍兴','101034','绍兴-柯桥万达店-中国','绍兴市柯桥区钱陶公路799号一层','1003A10:00-22:00（节假日照常接待）','0575-88755207',null);
INSERT INTO shops VALUES('10100176','杭州-上城in77店','浙江','112','杭州','101036','杭州-上城in77店-中国','杭州市上城区延安路239号122室','10:00-22:00（节假日照常接待）','0571-81996808',null);
INSERT INTO shops VALUES('10100177','合肥-万象城店','安徽','113','合肥','101043','合肥-万象城店-中国','安徽省合肥市政务区潜山路与习友路交叉口万象城第B1层B126号商铺DR体验店','10:00-22:00（节假日照常接待）','0551-6421 3520',null);
INSERT INTO shops VALUES('10100178','芜湖-银泰城店','安徽','113','芜湖','101044','芜湖-银泰城店-中国','芜湖市弋江区利民西路189号','10:00-21:30（节假日照常接待）','0553-5113520',null);
INSERT INTO shops VALUES('10100179','蚌埠-银泰城店','安徽','113','蚌埠','101045','蚌埠-银泰城店-中国','安徽省蚌埠市蚌山区东海大道4000号银泰城1-42铺位','（节假日照常接待）','400-01-13520',null);
INSERT INTO shops VALUES('10100180','厦门-JFC品尚中心店','福建','114','夏门','101046','厦门-JFC品尚中心店-中国','福建省厦门市思明区环岛东路1701号JFC品尚中心项目A馆L1楼A-L1-10B号商铺','10:00-21:30（节假日照常接待）','0592-5122 520',null);
INSERT INTO shops VALUES('10100181','福州-泰禾城市广场店','福建','114','福州','101047','福州-泰禾城市广场店-中国','福州市晋安区岳峰镇竹屿路6号东二环泰禾城市广场商业中心22号楼负一层B121',' 10:00-22:00（节假日照常接待）','0591-83549520',null);
INSERT INTO shops VALUES('10100182','福州-世欧广场店','福建','114','福州','101047','福州-世欧广场店-中国','福建省福州市晋安区世欧广场南区119号','10:00-22:00（节假日照常接待）','0591-8738 8521',null);
INSERT INTO shops VALUES('10100183','厦门-SM城市广场店','福建','114','厦门','101048','厦门-SM城市广场店-中国','福建省厦门市湖里区嘉禾路SM城市广场一期SM百货一楼','10:00-22:00（节假日照常接待）','0592-5634 220',null);
INSERT INTO shops VALUES('10100184','泉州-东海泰禾广场店','福建','114','泉州','101049','泉州-东海泰禾广场店-中国','福建省泉州市丰泽区东海街道泰禾广场1号楼L117商铺 ','10:00-22:00（节假日照常接待）','0595－22171314',null);
INSERT INTO shops VALUES('10100185','南昌-T16购物中心店','江西','115','南昌','101050','南昌-T16购物中心店-中国','江西省南昌市红谷滩新区庐山南大道369号T.16购物中心一层L1-24','10:00-22:00（节假日照常接待）','0791-8863 3520',null);
INSERT INTO shops VALUES('10100186','赣州-万象城店','江西','115','赣州','101051','赣州-万象城店-中国','江西省赣州市章贡区登峰大道8号华润万象城169店铺','10:00~22:00（节假日照常接待）','0797-8131520',null);
INSERT INTO shops VALUES('10100187','山东-淄博万象汇店','山东','116','淄博','101052','山东-淄博万象汇店-中国','山东省淄博市张店区金晶大道66号华润万象汇第一层第L166b号','10:00-22:00（节假日照常接待）','0533--2188520',null);
INSERT INTO shops VALUES('10100188','青岛-金狮广场店','山东','116','青岛','101053','青岛-金狮广场店-中国','山东省青岛市崂山区香港东路195号乙金狮广场L1-35','10:00-21:30（节假日照常接待）','0532-5572 6520',null);
INSERT INTO shops VALUES('10100189','济南-恒隆广场店','山东','116','济南','101054','济南-恒隆广场店-中国','山东省济南市 历下区泉城路188号恒隆广场一层109铺','10:00-22:00（节假日照常接待）','0531-5556 1520',null);
INSERT INTO shops VALUES('10100190','济南-贵和领秀城店','山东','116','济南','101054','济南-贵和领秀城店-中国','济南市二环南路与英雄山路交叉口F1-014-3','10:00-22:00（节假日照常接待）','0531-88713521',null);
INSERT INTO shops VALUES('10100191','青岛-万象城店','山东','116','青岛','101053','青岛-万象城店-中国','青岛市市南区6号甲、6号乙华润中心万象城第[ L2 ]层第[ 247 ]号商铺','10:00-22:00（节假日照常接待）','0532-55575520',null);
INSERT INTO shops VALUES('10100192','临沂-和谐广场店','山东','116','临沂','101055','临沂-和谐广场店-中国','山东省临沂市兰山区解放路158号和谐广场一层125A室','09:30-21:30（节假日照常接待）','0539-3125520',null);
INSERT INTO shops VALUES('10100193','烟台-大悦城店','山东','116','烟台','101056','烟台-大悦城店-中国','山东省烟台市芝罘区北马路150号烟台大悦城1F-33','10:00-22:00（节假日照常接待）','0535-6287521',null);
INSERT INTO shops VALUES('10100194','潍坊-万达广场店','山东','116','潍坊','101057','潍坊-万达广场店-中国','山东省潍坊市奎文区鸢飞路958号万达广场一层1019B','09:00-22:00（节假日照常接待）','0536-8113520',null);
INSERT INTO shops VALUES('10100195','济宁-万达广场店','山东','116','济宁','101058','济宁-万达广场店-中国','济宁太白东路55号万达商场一层1027铺','10:00-22:00（节假日照常接待）','0537-3203521',null);
INSERT INTO shops VALUES('10100196','郑州-大商金博大店','河南','117','郑州','101059','郑州-大商金博大店-中国','河南省郑州市二七区二七路200号 大商新玛特购物广场金博大店一层珠宝区','9:30-21:30（节假日照常接待）','0371-63213520',null);
INSERT INTO shops VALUES('10100197','郑州-大商国贸店','河南','117','郑州','101059','郑州-大商国贸店-中国','河南省郑州市金水区花园路大商新玛特国贸总店一楼珠宝区B5','10:00-21:30（节假日照常接待）','0371-6368 5215',null);
INSERT INTO shops VALUES('10100198','平顶山-鹰城世贸店','河南','117','平顶山','101060','平顶山-鹰城世贸店-中国','河南省平顶山市卫东区开源路与大众路交叉口鹰城世贸7.1视界购物中心','9:30-21:30（节假日照常接待）','0375－2552520',null);
INSERT INTO shops VALUES('10100199','武汉-凯德西城店','湖北','118','武汉','101061','武汉-凯德西城店-中国','武汉市硚口区解放大道18号凯德西城01-02B','10:00-22:00（节假日照常接待）','027-8375 5520',null);
INSERT INTO shops VALUES('10100200','武汉-风情街店','湖北','118','武汉','101061','武汉-风情街店-中国','湖北省武汉市洪山区 光谷意大利风情街5号楼一层51021号','9:00-22:00（节假日照常接待）','027-8768 8895',null);
INSERT INTO shops VALUES('10100201','武汉-壹方购物中心店','湖北','118','武汉','101061','武汉-壹方购物中心店-中国','湖北省武汉市江岸区中山大道1515号壹方购物中心2层商40单元（2-40）','10:00-22:00（节假日照常接待）','027-8291 3520',null);
INSERT INTO shops VALUES('10100202','宜昌-大洋百货店','湖北','118','宜昌','101062','宜昌-大洋百货店-中国','湖北省宜昌市西陵区夷陵大道56号宜昌大洋百货','9:30-22:00（节假日照常接待）','0717-6378 124',null);
INSERT INTO shops VALUES('10100204','香港-尖沙咀店','香港','119','香港','101063','香港-尖沙咀店','香港九龙尖沙咀弥敦道63号 i SQUARE 国际广场地铁H出口6B号店铺','10:30-21:00(节假日照常接待)','（+852）2367 7389',null);
INSERT INTO shops VALUES('10100205','西安-王府井店','陕西','120','西安','101064','西安-王府井店','陕西省西安市碑林区南关正街88号王府井百货南馆二层2F03-a铺','10：00-22：00(节假日照常接待)','029-8522 5086',null);
INSERT INTO shops VALUES('10100206','宝鸡-银泰城店','陕西','120','宝鸡','101065','宝鸡-银泰城店','陕西省宝鸡市金台大道宝鸡银泰城购物中心（国金中心旁）一楼1-34-2 铺位','10:00-21:30(节假日照常接待)','0917-3392189',null);
INSERT INTO shops VALUES('10100207','西安-中大国际店','陕西','120','西安','101064','西安-中大国际店','陕西省西安市雁塔区高新路中大国际商业中心3楼L315','10:00-22:00(节假日照常接待)','029-88443128',null);
INSERT INTO shops VALUES('10100208','咸阳-财富中心店','陕西','120','咸阳','101066','咸阳-财富中心店','陕西省咸阳市秦都区人民中路与秦皇路十字东南角财富购物中心一楼1F-008A','10:00-22:00(节假日照常接待)','029-33241413',null);


INSERT INTO provinces VALUES('101','广东');
INSERT INTO provinces VALUES('102','江苏');
INSERT INTO provinces VALUES('103','上海');
INSERT INTO provinces VALUES('104','黑龙江');
INSERT INTO provinces VALUES('105','北京');
INSERT INTO provinces VALUES('106','天津');
INSERT INTO provinces VALUES('107','河北');
INSERT INTO provinces VALUES('108','山西');
INSERT INTO provinces VALUES('109','内蒙古');
INSERT INTO provinces VALUES('110','辽宁');
INSERT INTO provinces VALUES('111','吉林');
INSERT INTO provinces VALUES('112','浙江');
INSERT INTO provinces VALUES('113','安徽');
INSERT INTO provinces VALUES('114','福建');
INSERT INTO provinces VALUES('115','江西');
INSERT INTO provinces VALUES('116','山东');
INSERT INTO provinces VALUES('117','河南');
INSERT INTO provinces VALUES('118','湖北');
INSERT INTO provinces VALUES('119','香港');
INSERT INTO provinces VALUES('120','陕西');
INSERT INTO provinces VALUES('121','湖南');
INSERT INTO provinces VALUES('122','四川');
INSERT INTO provinces VALUES('123','重庆');
INSERT INTO provinces VALUES('124','海南');
INSERT INTO provinces VALUES('125','广西');
INSERT INTO provinces VALUES('126','贵州');
INSERT INTO provinces VALUES('127','云南');
INSERT INTO provinces VALUES('128','甘肃');
INSERT INTO provinces VALUES('129','青海');
INSERT INTO provinces VALUES('130','宁夏');
INSERT INTO provinces VALUES('131','新疆');

INSERT INTO cities VALUES('101001','深圳','101');
INSERT INTO cities VALUES('101002','广州','101');
INSERT INTO cities VALUES('101003','东莞','101');
INSERT INTO cities VALUES('101004','惠州','101');
INSERT INTO cities VALUES('101005','佛山','101');
INSERT INTO cities VALUES('101006','湛江','101');
INSERT INTO cities VALUES('101007','南京','102');
INSERT INTO cities VALUES('101008','无锡','102');
INSERT INTO cities VALUES('101009','常州','102');
INSERT INTO cities VALUES('101010','盐城','102');
INSERT INTO cities VALUES('101011','苏州','102');
INSERT INTO cities VALUES('101012','南通','102');
INSERT INTO cities VALUES('101013','宜兴','102');
INSERT INTO cities VALUES('101014','徐州','102');
INSERT INTO cities VALUES('101015','镇江','102');
INSERT INTO cities VALUES('101016','上海','103');
INSERT INTO cities VALUES('101017','哈尔滨','104');
INSERT INTO cities VALUES('101018','大庆','104');
INSERT INTO cities VALUES('101019','北京','105');
INSERT INTO cities VALUES('101020','天津','106');
INSERT INTO cities VALUES('101021','石家庄','107');
INSERT INTO cities VALUES('101022','唐山','107');
INSERT INTO cities VALUES('101023','邯郸','107');
INSERT INTO cities VALUES('101024','太原','108');
INSERT INTO cities VALUES('101025','呼和浩特','109');
INSERT INTO cities VALUES('101026','鄂尔多斯','109');
INSERT INTO cities VALUES('101027','包头','109');
INSERT INTO cities VALUES('101028','大连','110');
INSERT INTO cities VALUES('101029','沈阳','110');
INSERT INTO cities VALUES('101030','锦州','110');
INSERT INTO cities VALUES('101031','鞍山','110');
INSERT INTO cities VALUES('101032','长春','111');
INSERT INTO cities VALUES('101033','吉林','111');
INSERT INTO cities VALUES('101034','绍兴','112');
INSERT INTO cities VALUES('101035','温州','112');
INSERT INTO cities VALUES('101036','杭州','112');
INSERT INTO cities VALUES('101037','台州','112');
INSERT INTO cities VALUES('101038','宁波','112');
INSERT INTO cities VALUES('101039','金华','112');
INSERT INTO cities VALUES('101040','余姚','112');
INSERT INTO cities VALUES('101041','嘉兴','112');
INSERT INTO cities VALUES('101042','衢州','112');
INSERT INTO cities VALUES('101043','合肥','113');
INSERT INTO cities VALUES('101044','芜湖','113');
INSERT INTO cities VALUES('101045','蚌埠','113');
INSERT INTO cities VALUES('101047','福州','114');
INSERT INTO cities VALUES('101048','厦门','114');
INSERT INTO cities VALUES('101049','泉州','114');
INSERT INTO cities VALUES('101050','南昌','115');
INSERT INTO cities VALUES('101051','赣州','115');
INSERT INTO cities VALUES('101052','淄博','116');
INSERT INTO cities VALUES('101053','青岛','116');
INSERT INTO cities VALUES('101054','济南','116');
INSERT INTO cities VALUES('101055','临沂','116');
INSERT INTO cities VALUES('101056','烟台','116');
INSERT INTO cities VALUES('101057','潍坊','116');
INSERT INTO cities VALUES('101058','济宁','116');
INSERT INTO cities VALUES('101059','郑州','117');
INSERT INTO cities VALUES('101060','平顶山','117');
INSERT INTO cities VALUES('101061','武汉','118');
INSERT INTO cities VALUES('101062','宜昌','118');
INSERT INTO cities VALUES('101063','香港','119');
INSERT INTO cities VALUES('101064','西安','120');
INSERT INTO cities VALUES('101065','宝鸡','120');
INSERT INTO cities VALUES('101066','咸阳','120');
INSERT INTO cities VALUES('101067','长沙','120');
INSERT INTO cities VALUES('101068','湘潭','120');
INSERT INTO cities VALUES('101069','衡阳','121');
INSERT INTO cities VALUES('101070','南宁','125');
INSERT INTO cities VALUES('101071','海口','124');
INSERT INTO cities VALUES('101072','重庆','123');
INSERT INTO cities VALUES('101073','成都','122');
INSERT INTO cities VALUES('101074','南充','122');
INSERT INTO cities VALUES('101075','贵阳','126');
INSERT INTO cities VALUES('101076','昆明','127');
INSERT INTO cities VALUES('101077','兰州','128');
INSERT INTO cities VALUES('101078','西宁','129');
INSERT INTO cities VALUES('101079','银川','130');
INSERT INTO cities VALUES('101080','乌鲁木齐','131');

insert into ringdetail values("2","求婚钻戒","A16001","SI1","33749","白18K金","LOVE LINE","H","钻石","50","VG","90","钻石","22.2-28.2分","1","客订，手寸可改","50分","圆形","圆形","VG","VG","STG","null","null","37");
insert into ringdetail values("8","求婚钻戒","A06003","VS2","30949","白18K金","TRUE LOVE","J","钻石","100","VG","68","钻石","56-64分","1","客订，手寸可改","100分","圆形","圆形","VG","VG","STG","null","null","15");
insert into ringdetail values("9","求婚钻戒","A09003","VS1","13989","白18K金","SWEETY","F","钻石","30","VG","16","钻石","10-13分","1","客订，手寸可改","30分","圆形","圆形","VG","VG","NON","null","null","1708");
insert into ringdetail values("10","求婚钻戒","A06004","VS2","32399","白18K金","TRUE LOVE","F","钻石","40","VG","24","钻石","24-29分","1","客订，手寸可改","40分","圆形","圆形","VG","VG","STG","null","null","250");
insert into ringdetail values("11","求婚钻戒","A04003","VS2","88199","白18K金","I SWEAR","J","钻石","50","EX","12","钻石","12-14分","1","客订，手寸可改","50分","圆形","圆形","VG","VG","STG","null","null","1708");
insert into ringdetail values("12","求婚钻戒","J10098","VS2","16549","白18K金","LOCK FOREVER","G","钻石","50","VG","13","钻石","10-13分","1","客订，手寸可改","50分","圆形","圆形","VG","VG","STG","null","null","8");
insert into ringdetail values("19","求婚钻戒","A06004","SI1","30309","白18K金","TRUE LOVE","H","钻石","20","null","24","钻石","19-25分","1","客订，手寸可改","20分","圆形","圆形","null","null","null","null","null","5");
insert into ringdetail values("21","求婚钻戒","J10084","IF","13689","PT950","WITH YOU","D","钻石","30","EX","1","钻石","3分","1","客订，手寸可改","30分","圆形","圆形","EX","EX","NON","null","null","35");
insert into ringdetail values("22","求婚钻戒","A16022","SI1","22999","白18K金","WEDDING","I-J","钻石","15","null","8","钻石","18.4-23分","1","客订，手寸可改","15分","圆形","圆形","null","null","null","null","花头宽：7.2mm，戒臂：1.9mm","5");
insert into ringdetail values("23","求婚钻戒","J10093","IF","32659","PT950","WITH YOU","D","钻石","30","EX","2","钻石","6分","1","客订，手寸可改","30分","圆形","圆形","EX","EX","NON","null","null","36");
insert into ringdetail values("24","求婚钻戒","A16023","SI1","29979","白18K金","WEDDING","I-J","钻石","13","null","8","钻石","18.4-23分","1","客订，手寸可改","13分","圆形","圆形","null","null","null","null","花头宽：6.5mm，戒臂：2.8mm","88");
insert into ringdetail values("3","求婚钻戒","A05001","VS1","3099","白18K金","JUST YOU","F","null","30","VG","null","钻石","null","1","客订，手寸可改","30分","null","圆形","VG","VG","NON","null","null","4");
insert into ringdetail values("4","求婚钻戒","A07001","VS2","9299","白18K金","BELIEVE","G","null","50","EX","null","钻石","null","1","客订，手寸可改","50分","null","圆形","EX","EX","NON","六爪爪镶","戒臂直径1.95MM","61");
insert into ringdetail values("13","求婚钻戒","A07001","VS1","6939","白18K金","BELIEVE","F","null","30","VG","null","钻石","null","1","客订，手寸可改","30分","null","圆形","VG","VG","NON","六爪爪镶","戒臂直径1.95MM","135");
insert into ringdetail values("15","求婚钻戒","A07001","SI1","34999","白18K金","BELIEVE","G","null","70","VG","null","钻石","null","1","客订，手寸可改","70分","null","圆形","VG","VG","STG","null","null","4");
insert into ringdetail values("17","求婚钻戒","A07001","SI1","6500","白18K金","BELIEVE","I-J","null","18","null","null","钻石","null","1","客订，手寸可改","18分","null","圆形","null","null","null","六爪爪镶","戒臂直径1.95MM","52");
insert into ringdetail values("18","求婚钻戒","J10082","SI1","5099","白18K金","SWEETY","H","null","20","null","null","钻石","null","1","客订，手寸可改","8分","null","圆形","null","null","null","六爪爪镶","戒臂直径1.95MM","2704");
insert into ringdetail values("20","求婚钻戒","A16008","SI1","5400","白18K金","ENDLESS LOVE","H","null","20","null","null","钻石","null","1","客订，手寸可改","20分","null","圆形","null","null","null","光金、爪镶","面最宽：3.5mm，腰宽：2.2mm","36");
insert into ringdetail values("25","求婚钻戒","A16001","SI1","33749","白18K金","LOVE LINE","H","钻石","50","VG","90","钻石","22.2-28.2分","1","客订，手寸可改","50分","圆形","圆形","VG","VG","STG","null","null","37");
insert into ringdetail values("27","求婚钻戒","A06003","VS2","30949","白18K金","TRUE LOVE","J","钻石","100","VG","68","钻石","56-64分","1","客订，手寸可改","100分","圆形","圆形","VG","VG","STG","null","null","15");
insert into ringdetail values("28","求婚钻戒","A09003","VS1","13989","白18K金","SWEETY","F","钻石","30","VG","16","钻石","10-13分","1","客订，手寸可改","30分","圆形","圆形","VG","VG","NON","null","null","1708");
insert into ringdetail values("29","求婚钻戒","A06004","VS2","32399","白18K金","TRUE LOVE","F","钻石","40","VG","24","钻石","24-29分","1","客订，手寸可改","40分","圆形","圆形","VG","VG","STG","null","null","250");
insert into ringdetail values("30","求婚钻戒","A04003","VS2","88199","白18K金","I SWEAR","J","钻石","50","EX","12","钻石","12-14分","1","客订，手寸可改","50分","圆形","圆形","VG","VG","STG","null","null","1708");
insert into ringdetail values("31","求婚钻戒","J10098","VS2","16549","白18K金","LOCK FOREVER","G","钻石","50","VG","13","钻石","10-13分","1","客订，手寸可改","50分","圆形","圆形","VG","VG","STG","null","null","8");
insert into ringdetail values("36","求婚钻戒","A06004","SI1","30309","白18K金","TRUE LOVE","H","钻石","20","null","24","钻石","19-25分","1","客订，手寸可改","20分","圆形","圆形","null","null","null","null","null","5");
insert into ringdetail values("37","求婚钻戒","J10084","IF","13689","PT950","WITH YOU","D","钻石","30","EX","1","钻石","3分","1","客订，手寸可改","30分","圆形","圆形","EX","EX","NON","null","null","35");
insert into ringdetail values("38","求婚钻戒","A16022","SI1","22999","白18K金","WEDDING","I-J","钻石","15","null","8","钻石","18.4-23分","1","客订，手寸可改","15分","圆形","圆形","null","null","null","null","花头宽：7.2mm，戒臂：1.9mm","5");
insert into ringdetail values("39","求婚钻戒","J10093","IF","32659","PT950","WITH YOU","D","钻石","30","EX","2","钻石","6分","1","客订，手寸可改","30分","圆形","圆形","EX","EX","NON","null","null","36");
insert into ringdetail values("40","求婚钻戒","A16023","SI1","29979","白18K金","WEDDING","I-J","钻石","13","null","8","钻石","18.4-23分","1","客订，手寸可改","13分","圆形","圆形","null","null","null","null","花头宽：6.5mm，戒臂：2.8mm","88");
insert into ringdetail values("42","求婚钻戒","A05001","VS1","3099","白18K金","JUST YOU","F","null","30","VG","null","钻石","null","1","客订，手寸可改","30分","null","圆形","VG","VG","NON","null","null","4");
insert into ringdetail values("43","求婚钻戒","A07001","VS2","9299","白18K金","BELIEVE","G","null","50","EX","null","钻石","null","1","客订，手寸可改","50分","null","圆形","EX","EX","NON","六爪爪镶","戒臂直径1.95MM","61");
insert into ringdetail values("44","求婚钻戒","A07001","VS1","6939","白18K金","BELIEVE","F","null","30","VG","null","钻石","null","1","客订，手寸可改","30分","null","圆形","VG","VG","NON","六爪爪镶","戒臂直径1.95MM","135");
insert into ringdetail values("45","求婚钻戒","A07001","SI1","34999","白18K金","BELIEVE","G","null","70","VG","null","钻石","null","1","客订，手寸可改","70分","null","圆形","VG","VG","STG","null","null","4");
insert into ringdetail values("46","求婚钻戒","A07001","SI1","6500","白18K金","BELIEVE","I-J","null","18","null","null","钻石","null","1","客订，手寸可改","18分","null","圆形","null","null","null","六爪爪镶","戒臂直径1.95MM","52");
insert into ringdetail values("47","求婚钻戒","J10082","SI1","16478","白18K金","SWEETY","H","null","50","null","null","钻石","null","1","客订，手寸可改","8分","null","圆形","null","null","null","六爪爪镶","戒臂直径1.95MM","2704");
insert into ringdetail values("48","求婚钻戒","A16008","SI1","5400","白18K金","ENDLESS LOVE","H","null","20","null","null","钻石","null","1","客订，手寸可改","20分","null","圆形","null","null","null","光金、爪镶","面最宽：3.5mm，腰宽：2.2mm","36");
insert into ringdetail values("50","求婚钻戒","A05001","VS1","3099","白18K金","JUST YOU","F","null","30","VG","null","钻石","null","1","客订，手寸可改","30分","null","圆形","VG","VG","NON","null","null","4");
insert into ringdetail values("51","求婚钻戒","A07001","VS2","9299","白18K金","BELIEVE","G","null","50","EX","null","钻石","null","1","客订，手寸可改","50分","null","圆形","EX","EX","NON","六爪爪镶","戒臂直径1.95MM","61");
insert into ringdetail values("52","求婚钻戒","A07001","VS1","6939","白18K金","BELIEVE","F","null","30","VG","null","钻石","null","1","客订，手寸可改","30分","null","圆形","VG","VG","NON","六爪爪镶","戒臂直径1.95MM","135");
insert into ringdetail values("53","求婚钻戒","A07001","SI1","34999","白18K金","BELIEVE","G","null","70","VG","null","钻石","null","1","客订，手寸可改","70分","null","圆形","VG","VG","STG","null","null","4");
insert into ringdetail values("54","求婚钻戒","A07001","SI1","6500","白18K金","BELIEVE","I-J","null","18","null","null","钻石","null","1","客订，手寸可改","18分","null","圆形","null","null","null","六爪爪镶","戒臂直径1.95MM","52");
insert into ringdetail values("55","求婚钻戒","J10082","SI1","45099","白18K金","SWEETY","H","null","80","null","null","钻石","null","1","客订，手寸可改","8分","null","圆形","null","null","null","六爪爪镶","戒臂直径1.95MM","2704");
insert into ringdetail values("56","求婚钻戒","A16008","SI1","5400","白18K金","ENDLESS LOVE","H","null","20","null","null","钻石","null","1","客订，手寸可改","20分","null","圆形","null","null","null","光金、爪镶","面最宽：3.5mm，腰宽：2.2mm","36");
insert into ringdetail values("57","求婚钻戒","A03002","VS2","18949","白18K金","MY HEART","H","钻石","40","null","28","钻石","32-37.4分","1","客订，手寸可改","50分","圆形","心形","null","null","null","null","null","5");
insert into ringdetail values("58","求婚钻戒","A16019","SI1","24657","PT950","MY HEART","E","钻石","70","null","38","钻石","13-18分","1","客订，手寸可改","50分","圆形","心形","null","null","null","微镶、包镶、光金","花头大小9.2mm*10.8mm 戒臂宽：2.5mm","39");
insert into ringdetail values("32","求婚钻戒","A03003","VS2","29549","白18K金","MY HEART","F","钻石","100","null","74","钻石","77-83.8分","1","客订，手寸可改","100分","圆形","心形","null","null","null","null","null","97");
insert into ringdetail values("33","求婚钻戒","A03002","SI1","81099","PT950","MY HEART","H","钻石","100","null","26","钻石","25-28分","1","客订，手寸可改","35分","圆形","心形","null","null","null","null","null","20");
insert into ringdetail values("34","求婚钻戒","A03002","VS2","16089","白18K金","MY HEART","D","钻石","50","null","28","钻石","32-37.4分","1","客订，手寸可改","50分","圆形","心形","null","null","null","null","null","5");
insert into ringdetail values("35","求婚钻戒","A16019","SI1","21119","PT950","MY HEART","H","钻石","50","null","38","钻石","13-18分","1","客订，手寸可改","50分","圆形","心形","null","null","null","微镶、包镶、光金","花头大小9.2mm*10.8mm 戒臂宽：2.5mm","39");
insert into ringdetail values("5","求婚钻戒","A03003","VS2","29549","白18K金","MY HEART","F","钻石","60","null","74","钻石","77-83.8分","1","客订，手寸可改","100分","圆形","心形","null","null","null","null","null","97");
insert into ringdetail values("6","求婚钻戒","A03002","SI1","81099","白18K金","MY HEART","H","钻石","80","null","26","钻石","25-28分","1","客订，手寸可改","35分","圆形","心形","null","null","null","null","null","20");
insert into ringdetail values("16","求婚钻戒","A03002","VS2","16089","PT950","MY HEART","D","钻石","50","null","28","钻石","32-37.4分","1","客订，手寸可改","50分","圆形","心形","null","null","null","null","null","5");
insert into ringdetail values("14","求婚钻戒","A16019","SI1","21119","白18K金","MY HEART","H","钻石","60","null","38","钻石","13-18分","1","客订，手寸可改","50分","圆形","心形","null","null","null","微镶、包镶、光金","花头大小9.2mm*10.8mm 戒臂宽：2.5mm","39");
insert into ringdetail values("7","求婚钻戒","A02003","VS2","13689","白18K金","FOREVER","G","钻石","50","VG","28","钻石","8-12分","1","客订，手寸可改","50分","圆形","圆形","VG","VG","STG","null","null","1708");
insert into ringdetail values("49","求婚钻戒","A02001","VS1","26743","PT950","FOREVER","H","null","80","VG","null","钻石","null","1","客订，手寸可改","80分","null","圆形","VG","VG","NON","null","null","250");
insert into ringdetail values("41","求婚钻戒","A02001","VS1","4999","白18K金","FOREVER","G","null","30","VG","null","钻石","null","1","客订，手寸可改","30分","null","圆形","VG","VG","NON","null","null","250");
insert into ringdetail values("26","求婚钻戒","A02003","VS2","13689","PT950","FOREVER","F","钻石","50","VG","28","钻石","8-12分","1","客订，手寸可改","50分","圆形","圆形","VG","VG","STG","null","null","1708");
insert into ringdetail values("1","求婚钻戒","A02001","VS1","9742","白18K金","FOREVER","F","null","40","VG","null","钻石","null","1","客订，手寸可改","40分","null","圆形","VG","VG","NON","null","null","250");
insert into ringdetail values("59","求婚钻戒","A02003","VS2","13689","白18K金","FOREVER","G","钻石","50","VG","28","钻石","8-12分","1","客订，手寸可改","50分","圆形","圆形","VG","VG","STG","null","null","1708");
insert into ringdetail values("60","求婚钻戒","A02001","VS1","89456","PT950","FOREVER","F","null","100","VG","null","钻石","null","1","客订，手寸可改","100分","null","圆形","VG","VG","NON","null","null","250");
insert into ringdetail values("61","求婚钻戒","A02001","VS1","7699","白18K金","FOREVER","E","null","30","VG","null","钻石","null","1","客订，手寸可改","30分","null","圆形","VG","VG","NON","null","null","250");
insert into ringdetail values("62","求婚钻戒","A02003","VS2","113689","PT950","FOREVER","D","钻石","90","VG","28","钻石","8-12分","1","客订，手寸可改","90分","圆形","圆形","VG","VG","STG","null","null","1708");
insert into ringdetail values("63","求婚钻戒","A02001","VS1","18699","白18K金","FOREVER","H","null","70","VG","null","钻石","null","1","客订，手寸可改","70分","null","圆形","VG","VG","NON","null","null","250");



INSERT INTO shopdetail VALUES(null,"10100101","深圳-来福士广场店","13512","Darry Ring深圳来福士广场店坐落于景观大道南海大道与创业路交汇处。来福士广场毗邻城市绿洲——南山购物公园，三面海湾环绕，青山、海风、花艺、华灯的相遇相融，绘出文艺而奢华、自然而时尚的都市繁景。DR以全新形象入驻繁华，中世纪教堂风格的穹顶，玫瑰金线条缠绕的花亭，透净玻璃柜中的花枝，可依季节放入不同花瓣的背景墙，让来到这里的DR族，拥有最唯美浪漫的体验。",0,0,null);
INSERT INTO shopdetail VALUES(null,"10100103","深圳-壹方城店","5647","Darry Ring深圳壹方城店落址于宝安区创业二路与新湖路交汇处。DR以全新形象入驻，色彩斑斓的花瓣墙衬托满室芬芳灿烂，如恋人之间烂漫多彩的勃勃爱情；透净玻璃柜中摇曳生姿的蝴蝶兰，如恋人心中百转千回的悠悠情愫；穹顶之上氤氲而开的无尽星河，如恋人眼中绵延不尽的浓浓爱意；墙上定格的爱情影像，如恋人们心照不宣的默默坚守。于此，戴上DR，开启一生的浪漫童话。",0,0,null);
INSERT INTO shopdetail VALUES(null,"10100105","惠州-华贸天地店","1124","Darry Ring惠州店落址于惠城区华贸天地，邻近清新怡人的东沙江公园。在温柔的海风和清脆的蝉鸣中，DR化身成了典雅端庄的女子，怀揣着粉色浪漫的少女心事，首次踏入这座休闲惬意的小城。洁净如洗的地面，璀璨夺目的钻石，温婉流转的灯光，赏心悦目的搭配，每一处小细节都体现着DR对至臻至美，至纯至净的追求。于此，签下真爱契约，一生无悔，风雨同舟。",0,0,null);
INSERT INTO shopdetail VALUES(null,"10100106","东莞-汇一城店","624","Darry Ring东莞店坐落于南城区的第一国际•汇一城，裙楼组合的大型商业板块，汇聚影院、溜冰场、百货、美食等，繁盛而有趣。不远处的旗峰公园，绿意满眸，鸟鸣清脆，都市的华美，遇见自然的清新雅致，就像每一对DR族恋人的相遇相知，浪漫而舒心，而恋人间最美好的浪漫，莫过于来到Darry Ring，在这纯白的真爱殿堂，静静挑选一生一枚的钻戒，戴于食指，约定一辈子的相守。",0,0,null);
INSERT INTO shopdetail VALUES(null,"10100108","佛山-万科广场店","8567","Darry Ring佛山万科广场店坐落于南海区的万科广场，于华灯星布的千灯湖公园之南。月明星灿，忽遇梦中人，恍如“蓦然回首，那人却在灯火阑珊处”的浪漫，自此相知相恋，在悠悠禅城，于祖庙许下白头偕老的虔诚愿望；于南风古灶筑一对相赠彼此的陶；于逢简水乡享受两个人的诗意人生；于纯净素雅的Darry Ring，戴上此生一枚的戒指，把这相依相伴的一生，过成一首最浪漫的诗。",0,0,null);
INSERT INTO shopdetail VALUES(null,"10100109","湛江-金沙湾店","1124","DR湛江金沙湾店江河碧海蓝天，见证湛蓝纯净爱恋。DR湛江店坐落于观海北路，与不远处的滨湖公园恰到好处地呼应着，在旖旎海风的轻抚中，DR以纯爱风格入驻，带来浪漫真爱故事。店铺风格素净大气，DR纯粹真爱白色主题彰显格调，黛绿色的门楼别致清新，与这座纯净的海滨城市相得益彰。坚定的原石、纯洁的蝴蝶兰祝福着一生唯一的美好爱情，店内每个细节都透露出别出心裁的浪漫元素。透净的玻璃柜中陈列着寓意丰富的DR作品，每一种款式，都有着独特的故事，等待有缘人的倾听。墙上定格着明星DR族们温馨浪漫的爱情影像，加入DR族，信仰真爱。祝福到店的恋人们：无惧纷繁复杂，坚守一生唯一。到店tips公交站：金沙湾广场站、会展中心站、金沙湾观海长廊站、海湾路中站下车后，步行1-3分钟，即可抵达万象金沙湾广场，DR湛江店位于一层01-05",0,0,null);
INSERT INTO shopdetail VALUES(null,"10100107","广州-正佳广场店","3248","DR广州正佳广场店在这座城市遇见很多人，唯有你令我一见倾心。DR广州正佳广场店落址于天河区，在高楼大厦的环绕中歌颂着一生唯一的浪漫爱情。店铺轻奢大气，以高雅的白色和清新的黛绿为主色调。一抹素白彰显无暇，一袭黛绿凸显雅致。店内陈列饱含情意设计的DR作品，每一款都拥有独特寓意，等待开启一段浪漫童话。舒适的洽谈区可供客户休憩，清新的色调，柔软的座椅，为每位客户提供极致周到的服务。象征纯洁爱情的蝴蝶兰恰到好处的点缀着，祝福着每一位到店的恋人能拥有极致浪漫的爱情。",0,0,null);
INSERT INTO shopdetail VALUES(null,"10100102","广州-中信广场店","6459","DR广州中信广场店，花城里的一抹素白，热闹繁华中坚守的平淡真爱DR广州中信广场店落址于天河区中心的“天河飘绢”是情侣们约会的绝佳去处玫瑰金镶嵌的玻璃门，具有神圣庄严感能让你下一秒就从璀璨的霓虹中走入纯净的DR世界店内装潢以典雅白和玫瑰金搭配典雅白如爱之初心，玫瑰金如爱之华美店内陈列着饱含情意的DR设计作品每一款，都有着美好的寓意，见证着一生唯一的浪漫爱情舒适座椅可供客户休憩为每一位到店的DR族提供细致周到的服务到店tips乘坐地铁3号线，到达林和西站，D出口步行约两分钟，抵达中天购物城，DR广州中信广场店的店铺号为134-135 ",0,0,"img/shoplist/shops/lg/1510021525.jpg*img/shoplist/shops/lg/1510021927.jpg*img/shoplist/shops/lg/1510021938.jpg*img/shoplist/shops/lg/1510021970.jpg*img/shoplist/shops/lg/1510022003.jpg");
INSERT INTO shopdetail VALUES(null,"10100204","香港-尖沙咀店","756","DR香港尖沙咀店店铺由国际著名设计大师，恩爱伉俪罗灵杰和龙慧祺设计取灵感于无穷符号“∞”，象征无限真爱DR香港尖沙咀店坐落于iSQUARE 国际广场长长的弥敦道给恋人一起走过一辈子的美好寓意不远处的维多利亚港带来了更多浪漫气息店内装修尽显低调中的奢华丝带般绵延的无限符号祝福着到店的恋人爱意无穷，浪漫永恒所有家居均是特别定制用精致的细节为到店DR族带去极致的浪漫服务到店TIPS乘坐地铁荃湾线抵达尖沙咀站H出口步行约两分钟，至弥敦道63号i SQUARE 国际广场6B号店铺—DR香港尖沙咀店",0,0,"img/shoplist/shops/lg/1504602129.jpg*img/shoplist/shops/lg/1504602161.jpg*img/shoplist/shops/lg/1504602335.jpg*img/shoplist/shops/lg/1504602404.jpg*img/shoplist/shops/lg/1510022003.jpg");
INSERT INTO shopdetail VALUES(null,"10100104","东莞-长安万科广场店","5869","DR东莞长安万科店于繁盛热闹的购物中心，邂逅一生唯一的浪漫爱情。DR东莞长安万科店落址于长安镇的长青南路祝福着这座城市中长情至永恒的爱情。玫瑰金镶嵌的玻璃门，具有神圣威仪感，能让你下一秒就从浮华的霓虹中走入纯净的DR世界。白色主题配以玫瑰金的点缀，尊贵中不失精致，典雅中不失甜美。店铺全新引入原石元素，寓意着从一而终，相伴到老的坚贞爱情。店内所有家居均是特别定制，柔软的座椅，精致的爱情墙，于细节中突显极致追求。到店tips乘坐长安2路或5路，抵达万科广场东站步行约两分钟，即可到达万科广场，DR东莞长安万科店位于一楼L1-034号铺",0,0,null);

ALTER TABLE shops add COLUMN orderEnter INT not null default '100';
ALTER TABLE ringdetail add COLUMN saled INT not null default '4236';

#ALTER TABLE shoplist_carousel ADD isuse ENUM('0','1') NOT NULL  DEFAULT '1';
ALTER TABLE ringdetail ADD ishotsales ENUM('0','1') NOT NULL  DEFAULT '0';
ALTER TABLE ringdetail ADD ismembersales ENUM('0','1') NOT NULL  DEFAULT '0';

#update shoplist_carousel set isuse='0' where cid='2';
update ringdetail set ishotsales='1' where rid='1';
update ringdetail set ishotsales='1' where rid='2';
update ringdetail set ishotsales='1' where rid='3';
update ringdetail set ishotsales='1' where rid='4';
update ringdetail set ishotsales='1' where rid='11';
update ringdetail set ishotsales='1' where rid='12';
update ringdetail set ishotsales='1' where rid='13';
update ringdetail set ishotsales='1' where rid='14';
update ringdetail set ishotsales='1' where rid='31';
update ringdetail set ishotsales='1' where rid='32';
update ringdetail set ishotsales='1' where rid='33';
update ringdetail set ishotsales='1' where rid='34';

update ringdetail set ismembersales='1' where rid='24';
update ringdetail set ismembersales='1' where rid='23';
update ringdetail set ismembersales='1' where rid='22';
update ringdetail set ismembersales='1' where rid='21';


INSERT INTO series VALUES(null,"MY HEART");
INSERT INTO series VALUES(null,"LOCK FOREVER");
INSERT INTO series VALUES(null,"FOREVER");
INSERT INTO series VALUES(null,"BELIEVE");
INSERT INTO series VALUES(null,"LOVE LINE");
INSERT INTO series VALUES(null,"TRUE LOVE");
INSERT INTO series VALUES(null,"JUST YOU");
INSERT INTO series VALUES(null,"WITH YOU");
INSERT INTO series VALUES(null,"PRINCESS");
INSERT INTO series VALUES(null,"I SWEAR");
INSERT INTO series VALUES(null,"SWEETY");
INSERT INTO series VALUES(null,"ENDLESS LOVE");
INSERT INTO series VALUES(null,"WEDDING");









