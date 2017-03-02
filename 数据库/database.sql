BEGIN;
--
-- Create model Advertisement
--
CREATE TABLE `advertisement` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `info` varchar(128) NOT NULL, `fee` double precision NOT NULL DEFAULT 0, `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP);
--
-- Create model Line
--
CREATE TABLE `line` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `startplace` varchar(32) NULL, `endplace` varchar(32) NULL, `center` varchar(256) NULL, `createtime` datetime NULL, `remark` varchar(128) NOT NULL);
--
-- Create model Orders
--
CREATE TABLE `orders` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `starttime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP, `endtime` datetime NULL, `startplace` varchar(32) NULL, `endplace` varchar(32) NULL, `fee` double precision NOT NULL DEFAULT 0, `score` integer NOT NULL DEFAULT 0, `accepttime` datetime NULL, `finishtime` datetime NULL, `remark` varchar(256) NOT NULL, `status` tinyint NOT NULL DEFAULT 0);
--
-- Create model Service
--
CREATE TABLE `service` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP, `remark` varchar(512) NOT NULL, `score` integer NOT NULL DEFAULT -1);
--
-- Create model Truck
--
CREATE TABLE `truck` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `no` varchar(18) NOT NULL, `loads` double precision NOT NULL DEFAULT 0, `width` double precision NOT NULL DEFAULT 0, `heigth` double precision NOT NULL DEFAULT 0, `length` double precision NOT NULL DEFAULT 0, `type` tinyint NOT NULL DEFAULT 0, `moreinfo` varchar(256) NULL, `remark` varchar(32) NULL);
--
-- Create model User
--
CREATE TABLE `user` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `account` char(11) NOT NULL, `name` varchar(128) NULL DEFAULT '无名', `pre_login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP, `signup_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP, `token` varchar(64) NULL, `type` tinyint NOT NULL DEFAULT 0);
--
-- Create model Lessee
--
CREATE TABLE `lessee` (`id` integer NOT NULL PRIMARY KEY, `position_x` double precision NOT NULL DEFAULT 0, `position_y` double precision NOT NULL DEFAULT 0, `score` integer NOT NULL DEFAULT 0, `password` varchar(256) NOT NULL, `realname` varchar(128) NOT NULL, `ci` varchar(18) NULL);
--
-- Create model Rental
--
CREATE TABLE `rental` (`id` integer NOT NULL PRIMARY KEY, `position_x` double precision NOT NULL DEFAULT 0, `position_y` double precision NOT NULL DEFAULT 0, `score` integer NOT NULL DEFAULT 0);
--
-- Add field customer to service
--
ALTER TABLE `service` ADD COLUMN `customer` integer NOT NULL;
ALTER TABLE `service` ALTER COLUMN `customer` DROP DEFAULT;
--
-- Add field offer to service
--
ALTER TABLE `service` ADD COLUMN `offer` integer NOT NULL;
ALTER TABLE `service` ALTER COLUMN `offer` DROP DEFAULT;
--
-- Add field lessee to truck
--
ALTER TABLE `truck` ADD COLUMN `lessee` integer NOT NULL;
ALTER TABLE `truck` ALTER COLUMN `lessee` DROP DEFAULT;
--
-- Add field lessee to orders
--
ALTER TABLE `orders` ADD COLUMN `lessee` integer NULL;
ALTER TABLE `orders` ALTER COLUMN `lessee` DROP DEFAULT;
--
-- Add field rental to orders
--
ALTER TABLE `orders` ADD COLUMN `rental` integer NOT NULL;
ALTER TABLE `orders` ALTER COLUMN `rental` DROP DEFAULT;
--
-- Add field lessee to line
--
ALTER TABLE `line` ADD COLUMN `lessee` integer NULL;
ALTER TABLE `line` ALTER COLUMN `lessee` DROP DEFAULT;
--
-- Add field rental to line
--
ALTER TABLE `line` ADD COLUMN `rental` integer NOT NULL;
ALTER TABLE `line` ALTER COLUMN `rental` DROP DEFAULT;
ALTER TABLE `lessee` ADD CONSTRAINT `lessee_id_f302d73c_fk_user_id` FOREIGN KEY (`id`) REFERENCES `user` (`id`);
ALTER TABLE `rental` ADD CONSTRAINT `rental_id_2783c06e_fk_user_id` FOREIGN KEY (`id`) REFERENCES `user` (`id`);
ALTER TABLE `service` ADD CONSTRAINT `service_customer_63f90d6c_fk_user_id` FOREIGN KEY (`customer`) REFERENCES `user` (`id`);
ALTER TABLE `service` ADD CONSTRAINT `service_offer_71ceaea7_fk_auth_user_id` FOREIGN KEY (`offer`) REFERENCES `auth_user` (`id`);
ALTER TABLE `truck` ADD CONSTRAINT `truck_lessee_6afe9da3_fk_lessee_id` FOREIGN KEY (`lessee`) REFERENCES `lessee` (`id`);
ALTER TABLE `orders` ADD CONSTRAINT `orders_lessee_5966d8d7_fk_lessee_id` FOREIGN KEY (`lessee`) REFERENCES `lessee` (`id`);
ALTER TABLE `orders` ADD CONSTRAINT `orders_rental_613f13c3_fk_rental_id` FOREIGN KEY (`rental`) REFERENCES `rental` (`id`);
ALTER TABLE `line` ADD CONSTRAINT `line_lessee_34f44738_fk_lessee_id` FOREIGN KEY (`lessee`) REFERENCES `lessee` (`id`);
ALTER TABLE `line` ADD CONSTRAINT `line_rental_53529158_fk_rental_id` FOREIGN KEY (`rental`) REFERENCES `rental` (`id`);
COMMIT;
