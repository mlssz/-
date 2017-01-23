-- 2017-1-23 14:35 create by oeli

create database haoyun;

create user 'haoyun'@'%' identified by 'isdfucsdiufsd566@3figdfsuhgi@ewfheiw_ksjfdgbdfsigibgigur6IHBIUI';

grant all privileges on *.* to 'haoyun'@'%';

use haoyun;

create table user
(
    u_id int primary key auto_increment,
    u_account char(11) not null,
    u_name varchar(128) default '无名',
    u_time datetime not null default now(),
    u_token varchar(64),
    u_type tinyint not null default 0
)character set utf8 engine=InnoDB;

create table rental
(
    u_id int not null,
    u_position varchar(128),
    u_score int not null default 0
)character set utf8 engine=InnoDB;

create table lessee
(
    u_id int not null,
    u_position varchar(128),
    u_score int not null default 0,
    u_realname varchar(128) not null,
    u_ci varchar(18) not null
)character set utf8 engine=InnoDB;

create table admin
(
    u_id int not null,
    u_class int not null default 0
)character set utf8 engine=InnoDB;

create table order
(
    o_id int primary key auto_increment,
    o_rental int not null,
    o_lessee int,
    o_starttime datetime,
    o_endtime datetime,
    o_startplace varchar(32),
    o_endplace varchar(32),
    o_fee int default 0,
    o_score int default 0,
    o_accepttime datetime,
    o_finishtime datetime,
    o_remark varchar(256),
    o_status tinyint default 0
)character set utf8 engine=InnoDB;

create table line
(
    l_id int primary key auto_increment,
    l_lessee int,
    l_rental int,
    l_startplace varchar(32),
    l_endplace varchar(32),
    l_center varchar(256),
    l_createtime datetime,
    l_remark varchar(128)
)character set utf8 engine=InnoDB;

create table truck
(
    t_id int primary key auto_increment,
    t_lessee int not null,
    t_no varchar(18),
    t_load int default 0,
    t_length int default 0,
    t_width int default 0,
    t_height int default 0,
    t_type default 0,
    t_modelinfo varchar(256),
    t_remark varchar(32)
)character set utf8 engine=InnoDB;

create table advertisement
(
    a_id int primary key auto_increment,
    a_info varchar(128),
    a_fee int default 0,
    a_time datetime default now()
)character set utf8 engine=InnoDB;

create table service
(
    s_id int primary key auto_increment,
    s_offer int not null,
    s_customer int not null,
    s_time datetime default now(),
    s_remark varchar(512),
    s_score int default -1
)character set utf8 engine=InnoDB;