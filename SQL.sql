create database light_mall;

use light_mall;

-- 用户表 user
create table user (
                      uid varchar(64) not null comment '用户id',
                      uname varchar(64) not null comment '用户名',
                      upassword varchar(64) not null comment '用户密码',
                      ugender varchar(12) default null comment '性别',
                      uemail varchar(64) default null comment '电子邮箱',
                      uphone varchar(64) default null comment '电话',
                      uaddress varchar(1024) default null comment '收货地址',
                      ustatus varchar(12) not null comment '身份权限',  -- 1表示管理员，0表示普通用户
                      primary key(uid)
)engine=InnoDB default charset=utf8;
insert into user values
("1", '张一', '123', '男', '12345678@qq.com', '1', '广东省肇庆市端州区', '0'),
("2", '张二', '123', '男', '12345678@qq.com', '12', '广东省肇庆市端州区', '0'),
("3", '张三', '123', '男', '12345678@qq.com', '123', '广东省肇庆市端州区', '0'),
("4", '张四', '123', '男', '12345678@qq.com', '1234', '广东省肇庆市端州区', '0'),
("5", '张五', '123', '男', '12345678@qq.com', '12345', '广东省肇庆市端州区', '0'),
("admin", '李四', '123', '女', '12345678@qq.com', '123456', '广东省肇庆市端州区', '1');

-- 商品表
create table product (
                         pid int(64) not null auto_increment comment '商品ID',
                         pname varchar(64) not null comment '商品名',
                         pdes varchar(1024) default null comment '商品描述',
                         price double(10,2) not null comment '商品价格',
                         stock int(64) not null comment '商品库存',
                         pclass varchar(64) 	not null comment '商品种类',
                         picture varchar(200) 	default null comment '商品图片',
                         primary key(pid)
)engine=InnoDB default charset=utf8;
insert into product values
(null, '吸顶灯1', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吸顶灯', 'x1.png'),
(null, '吸顶灯2', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吸顶灯', 'x2.png'),
(null, '吸顶灯3', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吸顶灯', 'x1.png'),
(null, '吸顶灯4', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吸顶灯', 'x2.png'),
(null, '吸顶灯5', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吸顶灯', 'x1.png'),
(null, '吸顶灯6', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吸顶灯', 'x2.png'),
(null, '吸顶灯7', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吸顶灯', 'x1.png'),
(null, '吸顶灯8', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吸顶灯', 'x2.png'),
(null, '吸顶灯9', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吸顶灯', 'x1.png'),
(null, '吸顶灯10', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吸顶灯', 'x2.png'),
(null, '吸顶灯11', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吸顶灯', 'x1.png'),
(null, '吸顶灯12', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吸顶灯', 'x2.png'),
(null, '吸顶灯13', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吸顶灯', 'x1.png'),
(null, '吸顶灯14', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吸顶灯', 'x2.png'),
(null, '吸顶灯15', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吸顶灯', 'x1.png'),
(null, '吸顶灯16', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吸顶灯', 'x2.png'),
(null, '台灯1', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '台灯', 't1.png'),
(null, '台灯2', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '台灯', 't2.png'),
(null, '台灯3', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '台灯', 't3.png'),
(null, '台灯4', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '台灯', 't1.png'),
(null, '台灯5', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '台灯', 't2.png'),
(null, '台灯6', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '台灯', 't3.png'),
(null, '台灯7', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '台灯', 't1.png'),
(null, '台灯8', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '台灯', 't2.png'),
(null, '台灯9', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '台灯', 't3.png'),
(null, '台灯10', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '台灯', 't1.png'),
(null, '台灯11', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '台灯', 't2.png'),
(null, '台灯12', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '台灯', 't3.png'),
(null, '台灯13', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '台灯', 't1.png'),
(null, '台灯14', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '台灯', 't2.png'),
(null, '台灯15', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '台灯', 't3.png'),
(null, '落地灯1', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '落地灯', 'l1.png'),
(null, '落地灯2', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '落地灯', 'l2.png'),
(null, '落地灯3', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '落地灯', 'l3.png'),
(null, '落地灯4', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '落地灯', 'l4.png'),
(null, '落地灯5', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '落地灯', 'l1.png'),
(null, '落地灯6', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '落地灯', 'l2.png'),
(null, '落地灯7', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '落地灯', 'l3.png'),
(null, '落地灯8', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '落地灯', 'l4.png'),
(null, '落地灯9', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '落地灯', 'l1.png'),
(null, '落地灯10', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '落地灯', 'l2.png'),
(null, '落地灯11', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '落地灯', 'l3.png'),
(null, '落地灯12', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '落地灯', 'l4.png'),
(null, '落地灯13', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '落地灯', 'l1.png'),
(null, '落地灯14', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '落地灯', 'l2.png'),
(null, '落地灯15', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '落地灯', 'l3.png'),
(null, '落地灯16', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '落地灯', 'l4.png'),
(null, '吊灯1', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吊灯', 'd1.png'),
(null, '吊灯2', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吊灯', 'd2.png'),
(null, '吊灯3', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吊灯', 'd3.png'),
(null, '吊灯4', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吊灯', 'd1.png'),
(null, '吊灯5', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吊灯', 'd2.png'),
(null, '吊灯6', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吊灯', 'd3.png'),
(null, '吊灯7', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吊灯', 'd1.png'),
(null, '吊灯8', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吊灯', 'd2.png'),
(null, '吊灯9', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吊灯', 'd3.png'),
(null, '吊灯10', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吊灯', 'd1.png'),
(null, '吊灯11', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吊灯', 'd2.png'),
(null, '吊灯12', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吊灯', 'd3.png'),
(null, '吊灯13', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吊灯', 'd1.png'),
(null, '吊灯14', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吊灯', 'd2.png'),
(null, '吊灯15', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '吊灯', 'd3.png'),
(null, '壁灯1', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '壁灯', 'b1.png'),
(null, '壁灯2', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '壁灯', 'b2.png'),
(null, '壁灯3', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '壁灯', 'b3.png'),
(null, '壁灯4', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '壁灯', 'b1.png'),
(null, '壁灯5', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '壁灯', 'b2.png'),
(null, '壁灯6', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '壁灯', 'b3.png'),
(null, '壁灯7', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '壁灯', 'b1.png'),
(null, '壁灯8', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '壁灯', 'b2.png'),
(null, '壁灯9', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '壁灯', 'b3.png'),
(null, '壁灯10', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '壁灯', 'b1.png'),
(null, '壁灯11', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '壁灯', 'b2.png'),
(null, '壁灯12', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '壁灯', 'b3.png'),
(null, '壁灯13', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '壁灯', 'b1.png'),
(null, '壁灯14', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '壁灯', 'b2.png'),
(null, '壁灯15', '白天黑夜都精彩---灯光的爱,就在身边', 100, 1000, '壁灯', 'b3.png');

-- 购物车
create table car (
                     cid int(64) not null auto_increment comment '购物车id',
                     quantity int(64) default null comment '购买数量',
                     pid int(64) default null comment '商品id',
                     uid int(64) default null comment '用户id',
                     primary key(cid)
)engine=InnoDB default charset=utf8;

-- 订单表
create table `order` (
                         oid varchar(64) not null comment '订单id',
                         oprice double(10, 2) default null comment '订单金额',
                         otime varchar(64) default null comment '订单创建时间',
                         ostatus varchar(12) not null comment '订单处理状态',
    -- 0：未支付，1：未发货，2：发货了，3：收货了
                         uid int(64) not null comment '用户id',
                         primary key(oid)
)engine=InnoDB default charset=utf8;

-- 创建一个订单商品表，一个订单商品表记录对应一个商品
create table `order_product` (
                                 opid int(64) not null auto_increment comment '订单商品表id',
                                 oid varchar(64) not null comment '订单表id',
                                 quantity int(64) default null comment '购买数量',
                                 pid	int(64) not null comment '商品id',
                                 primary key(opid)
)engine=InnoDB default charset=utf8;
