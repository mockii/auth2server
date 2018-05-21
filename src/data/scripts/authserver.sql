/*

SQLyog Ultimate v8.55 
MySQL - 5.7.20 : Database - auth_mockii

*********************************************************************

*/



/*!40101 SET NAMES utf8 */;



/*!40101 SET SQL_MODE=''*/;



/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`auth_mockii` /*!40100 DEFAULT CHARACTER SET latin1 */;



USE `auth_mockii`;



/*Table structure for table `account` */



DROP TABLE IF EXISTS `account`;



CREATE TABLE `account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) DEFAULT NULL,
  `username` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



/*Table structure for table `clientdetails` */



DROP TABLE IF EXISTS `clientdetails`;



CREATE TABLE `clientdetails` (
  `appId` varchar(255) NOT NULL,
  `resourceIds` varchar(255) DEFAULT NULL,
  `appSecret` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `grantTypes` varchar(255) DEFAULT NULL,
  `redirectUrl` varchar(255) DEFAULT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additionalInformation` varchar(4096) DEFAULT NULL,
  `autoApproveScopes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`appId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Table structure for table `oauth_access_token` */



DROP TABLE IF EXISTS `oauth_access_token`;



CREATE TABLE `oauth_access_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` mediumblob,
  `authentication_id` varchar(255) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `authentication` mediumblob,
  `refresh_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Table structure for table `oauth_approvals` */



DROP TABLE IF EXISTS `oauth_approvals`;



CREATE TABLE `oauth_approvals` (
  `userId` varchar(255) DEFAULT NULL,
  `clientId` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `expiresAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastModifiedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Table structure for table `oauth_client_details` */



DROP TABLE IF EXISTS `oauth_client_details`;



CREATE TABLE `oauth_client_details` (
  `client_id` varchar(255) NOT NULL,
  `resource_ids` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `authorized_grant_types` varchar(255) DEFAULT NULL,
  `web_server_redirect_uri` varchar(255) DEFAULT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Table structure for table `oauth_client_token` */



DROP TABLE IF EXISTS `oauth_client_token`;



CREATE TABLE `oauth_client_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` mediumblob,
  `authentication_id` varchar(255) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Table structure for table `oauth_code` */



DROP TABLE IF EXISTS `oauth_code`;



CREATE TABLE `oauth_code` (
  `code` varchar(255) DEFAULT NULL,
  `authentication` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Table structure for table `oauth_refresh_token` */



DROP TABLE IF EXISTS `oauth_refresh_token`;



CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` mediumblob,
  `authentication` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;



CREATE TABLE `auth_mockii`.`USERS` (
  `USER_ID` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `USER_NAME` VARCHAR(45) NOT NULL COMMENT '',
  `FIRST_NAME` VARCHAR(45) NOT NULL COMMENT '',
  `MIDDLE_NAME` VARCHAR(45) NULL COMMENT '',
  `LAST_NAME` VARCHAR(45) NOT NULL COMMENT '',
  `ALIAS_NAME` VARCHAR(45) NULL COMMENT '',
  `PHONE_NUM` VARCHAR(10) NULL COMMENT '',
  `EMAIL_ID` VARCHAR(45) NULL COMMENT '',
  `CREATED_BY` VARCHAR(45) NOT NULL COMMENT '',
  `CREATED_DATE` DATETIME NOT NULL COMMENT '',
  `MODIFIED_BY` VARCHAR(45) NULL COMMENT '',
  `MODIFIED_DATE` DATETIME NULL COMMENT '',
  `USER_COUNTRY` VARCHAR(45) NULL COMMENT '',
  `PASSWORD` VARCHAR(15) BINARY NOT NULL COMMENT '',
  PRIMARY KEY (`USER_ID`)  COMMENT '',
  UNIQUE INDEX `USER_ID_UNIQUE` (`USER_ID` ASC)  COMMENT '') ENGINE=InnoDB DEFAULT CHARSET=latin1;

