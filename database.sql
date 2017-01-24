-- 2017-1-23 14:35 create by oeli
-- 2017-1-24 20:22 drop by mephis
-- 2017-1-24 20:22 create by mephis

BEGIN;
--
-- Create model Advertisement
--
CREATE TABLE `advertisement` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `info` varchar(128) NOT NULL, `fee` double precision NOT NULL, `time` date NOT NULL);
--
-- Create model Orders
--
CREATE TABLE `orders` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `starttime` date NOT NULL, `endtime` date NULL, `startplace` varchar(32) NULL, `endplace` varchar(32) NULL, `fee` double precision NOT NULL, `score` integer NOT NULL, `accepttime` date NULL, `finishtime` date NULL, `remark` varchar(256) NOT NULL, `status` tinyint NOT NULL);
--
-- Create model Service
--
CREATE TABLE `service` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `time` date NOT NULL, `remark` varchar(512) NOT NULL, `score` integer NOT NULL);
--
-- Create model Truck
--
CREATE TABLE `truck` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `no` varchar(18) NOT NULL, `load` double precision NOT NULL, `width` double precision NOT NULL, `heigth` double precision NOT NULL, `length` double precision NOT NULL, `type` tinyint NOT NULL, `modelinfo` varchar(256) NULL, `remark` varchar(32) NULL);
--
-- Create model User
--
CREATE TABLE `user` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `account` char(11) NOT NULL, `name` varchar(128) NULL, `signup_time` date NOT NULL, `token` varchar(64) NULL, `type` tinyint NOT NULL);
--
-- Create model Lessee
--
CREATE TABLE `lessee` (`id` integer NOT NULL PRIMARY KEY, `position` varchar(128) NULL, `score` integer NOT NULL, `realname` varchar(128) NOT NULL, `ci` varchar(18) NULL);
--
-- Create model Rental
--
CREATE TABLE `rental` (`id` integer NOT NULL PRIMARY KEY, `position` varchar(128) NULL, `score` integer NOT NULL);
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
ALTER TABLE `lessee` ADD CONSTRAINT `lessee_id_f302d73c_fk_user_id` FOREIGN KEY (`id`) REFERENCES `user` (`id`);
ALTER TABLE `rental` ADD CONSTRAINT `rental_id_2783c06e_fk_user_id` FOREIGN KEY (`id`) REFERENCES `user` (`id`);
ALTER TABLE `service` ADD CONSTRAINT `service_customer_63f90d6c_fk_user_id` FOREIGN KEY (`customer`) REFERENCES `user` (`id`);
ALTER TABLE `service` ADD CONSTRAINT `service_offer_71ceaea7_fk_auth_user_id` FOREIGN KEY (`offer`) REFERENCES `auth_user` (`id`);
ALTER TABLE `truck` ADD CONSTRAINT `truck_lessee_6afe9da3_fk_lessee_id` FOREIGN KEY (`lessee`) REFERENCES `lessee` (`id`);
ALTER TABLE `orders` ADD CONSTRAINT `orders_lessee_16123ec4_fk_lessee_id` FOREIGN KEY (`lessee`) REFERENCES `lessee` (`id`);
ALTER TABLE `orders` ADD CONSTRAINT `orders_rental_f069b145_fk_rental_id` FOREIGN KEY (`rental`) REFERENCES `rental` (`id`);
COMMIT;