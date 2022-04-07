-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.10-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for rms
CREATE DATABASE IF NOT EXISTS `rms` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `rms`;

-- Dumping structure for table rms.brand_mas
CREATE TABLE IF NOT EXISTS `brand_mas` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf32;

-- Dumping data for table rms.brand_mas: ~3 rows (approximately)
/*!40000 ALTER TABLE `brand_mas` DISABLE KEYS */;
INSERT INTO `brand_mas` (`brand_id`, `brand_name`) VALUES
	(1, 'HP'),
	(2, 'Dell'),
	(3, 'Lenovo');
/*!40000 ALTER TABLE `brand_mas` ENABLE KEYS */;

-- Dumping structure for table rms.dummy
CREATE TABLE IF NOT EXISTS `dummy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` tinyint(4) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cpu_sno` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dummy_mas_dept` (`dept_id`),
  CONSTRAINT `FK_dummy_mas_dept` FOREIGN KEY (`dept_id`) REFERENCES `mas_dept` (`dept_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf32;

-- Dumping data for table rms.dummy: ~2 rows (approximately)
/*!40000 ALTER TABLE `dummy` DISABLE KEYS */;
INSERT INTO `dummy` (`id`, `dept_id`, `user_id`, `cpu_sno`) VALUES
	(50, 3, 2, 'c5'),
	(51, NULL, NULL, NULL);
/*!40000 ALTER TABLE `dummy` ENABLE KEYS */;

-- Dumping structure for table rms.hardware_mas
CREATE TABLE IF NOT EXISTS `hardware_mas` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`h_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf32;

-- Dumping data for table rms.hardware_mas: ~5 rows (approximately)
/*!40000 ALTER TABLE `hardware_mas` DISABLE KEYS */;
INSERT INTO `hardware_mas` (`h_id`, `h_name`) VALUES
	(1, 'laptop'),
	(2, 'tablet'),
	(3, 'printer'),
	(4, 'hub'),
	(5, 'desktop');
/*!40000 ALTER TABLE `hardware_mas` ENABLE KEYS */;

-- Dumping structure for table rms.issued_details
CREATE TABLE IF NOT EXISTS `issued_details` (
  `issued_to` int(11) DEFAULT NULL,
  `issued_date` date DEFAULT NULL,
  `marked_no` varchar(50) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `status_id` tinyint(4) DEFAULT NULL,
  `ilocation` tinyint(4) DEFAULT NULL,
  `i_form_no` varchar(50) DEFAULT NULL,
  `g_form_no` varchar(50) DEFAULT NULL,
  KEY `user_fk2` (`issued_to`),
  KEY `FK_issued_details_status_mas` (`status_id`),
  KEY `FK_issued_details_stock_receive_mas` (`stock_id`),
  CONSTRAINT `FK_issued_details_status_mas` FOREIGN KEY (`status_id`) REFERENCES `status_mas` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_issued_details_stock_receive_mas` FOREIGN KEY (`stock_id`) REFERENCES `stock_receive_mas` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_fk2` FOREIGN KEY (`issued_to`) REFERENCES `mas_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- Dumping data for table rms.issued_details: ~9 rows (approximately)
/*!40000 ALTER TABLE `issued_details` DISABLE KEYS */;
INSERT INTO `issued_details` (`issued_to`, `issued_date`, `marked_no`, `remark`, `stock_id`, `status_id`, `ilocation`, `i_form_no`, `g_form_no`) VALUES
	(27, '2022-04-05', 'm101', 'r101', 1, 2, NULL, 'i101', NULL),
	(28, '2022-04-07', 'm101', 'r101', 2, 2, NULL, NULL, NULL),
	(29, '2022-04-13', NULL, NULL, 2, 2, NULL, NULL, NULL),
	(30, '2022-04-20', NULL, NULL, 2, 2, NULL, NULL, NULL),
	(31, '2022-04-21', NULL, NULL, 6, NULL, NULL, NULL, NULL),
	(30, '2022-04-20', NULL, NULL, 6, 2, NULL, NULL, NULL),
	(36, '2022-04-15', NULL, NULL, 29, NULL, NULL, NULL, NULL),
	(32, '2022-04-21', NULL, NULL, 29, NULL, NULL, NULL, NULL),
	(28, '2022-04-16', 'm100', NULL, 29, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `issued_details` ENABLE KEYS */;

-- Dumping structure for table rms.issued_form_db
CREATE TABLE IF NOT EXISTS `issued_form_db` (
  `user_id` int(11) DEFAULT NULL,
  `issued_date` date DEFAULT NULL,
  `marked_no` varchar(50) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `i_form_no` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.issued_form_db: ~0 rows (approximately)
/*!40000 ALTER TABLE `issued_form_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `issued_form_db` ENABLE KEYS */;

-- Dumping structure for table rms.map_app_user
CREATE TABLE IF NOT EXISTS `map_app_user` (
  `app_id` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  KEY `FK_map_app_user_mas_app` (`app_id`),
  KEY `FK_map_app_user_mas_user` (`user_id`),
  CONSTRAINT `FK_map_app_user_mas_app` FOREIGN KEY (`app_id`) REFERENCES `mas_app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_map_app_user_mas_user` FOREIGN KEY (`user_id`) REFERENCES `mas_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.map_app_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `map_app_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_app_user` ENABLE KEYS */;

-- Dumping structure for table rms.map_emp_wo
CREATE TABLE IF NOT EXISTS `map_emp_wo` (
  `user_id` int(11) DEFAULT NULL,
  `wo_details_id` tinyint(4) DEFAULT NULL,
  KEY `FK_map_emp_wo_mas_user` (`user_id`),
  KEY `FK_map_emp_wo_mas_wo_details` (`wo_details_id`),
  CONSTRAINT `FK_map_emp_wo_mas_user` FOREIGN KEY (`user_id`) REFERENCES `mas_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_map_emp_wo_mas_wo_details` FOREIGN KEY (`wo_details_id`) REFERENCES `mas_wo_details` (`wo_details_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.map_emp_wo: ~0 rows (approximately)
/*!40000 ALTER TABLE `map_emp_wo` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_emp_wo` ENABLE KEYS */;

-- Dumping structure for table rms.mas_app
CREATE TABLE IF NOT EXISTS `mas_app` (
  `app_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(100) NOT NULL,
  `plateform_id` tinyint(4) DEFAULT NULL,
  `server_id` tinyint(4) DEFAULT NULL,
  `dept_code` tinyint(4) NOT NULL,
  `public_ip` varchar(20) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `platform_version` varchar(50) DEFAULT NULL,
  `ssl_expiry` date DEFAULT NULL,
  PRIMARY KEY (`app_id`),
  KEY `FK__mas_dept` (`dept_code`),
  KEY `FK_mas_app_mas_plateform` (`plateform_id`),
  KEY `FK_mas_app_mas_server` (`server_id`),
  CONSTRAINT `FK__mas_dept` FOREIGN KEY (`dept_code`) REFERENCES `mas_dept` (`dept_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_mas_app_mas_plateform` FOREIGN KEY (`plateform_id`) REFERENCES `mas_plateform` (`plateform_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_mas_app_mas_server` FOREIGN KEY (`server_id`) REFERENCES `mas_server` (`server_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_app: ~29 rows (approximately)
/*!40000 ALTER TABLE `mas_app` DISABLE KEYS */;
INSERT INTO `mas_app` (`app_id`, `app_name`, `plateform_id`, `server_id`, `dept_code`, `public_ip`, `url`, `platform_version`, `ssl_expiry`) VALUES
	(10, 'Agriportal ', 2, 11, 3, '164.100.113.104', 'agriportal.cg.nic.in', '4.0', '2022-06-27'),
	(11, 'Agri Budget', 3, 8, 3, '164.100.113.104', 'http://agriportal.cg.nic.in/agribudget/', '7.1', NULL),
	(12, 'Geo Tag', 2, 11, 3, '164.100.113.104', 'https://agriportal.cg.nic.in/geotag/', '4.0', NULL),
	(13, 'Agrikosh', 1, 3, 3, '164.100.113.102', 'https://agrikosh.cg.nic.in', '6', NULL),
	(14, 'NGGB', 1, 5, 3, '164.100.113.103', 'https://nggb.cg.nic.in/', '6', NULL),
	(15, 'Agrilicense', 3, 12, 3, '164.100.113.104', 'https://agriportal.cg.nic.in/Agrilicense/', '7.1', NULL),
	(16, 'Agrisubsidy', 2, 13, 3, '164.100.113.104', 'https://agriportal.cg.nic.in/agrisubsidy/', '1.5', NULL),
	(17, 'Hortibudget', 3, 8, 22, '164.100.113.104', 'https://agriportal.cg.nic.in/hortibudget/', '7.2', NULL),
	(18, 'Fishmis', 3, 8, 23, '164.100.113.104', 'https://agriportal.cg.nic.in/fishmis/', '7.2', NULL),
	(19, 'Vetmis 2.0', 2, 11, 24, '164.100.113.104', 'https://agriportal.cg.nic.in/vetmis/vetmis2/', '4.0', NULL),
	(20, 'ISS', 2, 11, 24, '164.100.113.104', 'https://agriportal.cg.nic.in/iss', '1.0', NULL),
	(21, 'CG DIISA', 2, 11, 24, '164.100.113.104', 'https://agriportal.cg.nic.in/diisa/', '1.4', NULL),
	(22, 'Mandi Trade', 2, 13, 20, '164.100.113.104', 'https://agriportal.cg.nic.in/manditrade/', '1.0', NULL),
	(23, 'AgriMandi', 2, 13, 20, '164.100.113.104', 'https://agriportal.cg.nic.in/agrimandi/', '1.0', NULL),
	(24, 'HealthFacility', 2, 14, 1, '164.100.150.66', 'https://cg.nic.in/health/healthfacility/', '1.4', NULL),
	(25, 'Programonitoring', 2, 14, 1, '164.100.150.66', 'https://cg.nic.in/health/programonitoring', '1.4', NULL),
	(26, 'DHRS', 2, 14, 1, '164.100.150.66', 'https://cg.nic.in/health/dhrs/', '2.0', NULL),
	(27, 'Mitanin Incentive Payment System', 1, 7, 1, '164.100.113.109', 'https://mips.cg.nic.in/', '12', NULL),
	(28, 'Monitoring of Court Cases', 2, 14, 1, '	164.100.150.66', 'https://cg.nic.in/health/mocc/', '4.0', NULL),
	(29, 'Bio Medical Waste Management System ', 2, 14, 1, '164.100.150.66', 'https://cg.nic.in/health/bmwm/', '3.0', NULL),
	(30, '  Private Hospital Reporting System', 2, 14, 1, '164.100.150.66', 'https://cg.nic.in/health/privatehospitalreporting/', '4.0', NULL),
	(31, 'Nutrition Rehabilitation Center', 2, 14, 1, '164.100.150.66', 'https://cg.nic.in/health/nrc', '2.0', NULL),
	(32, 'Human Resource MIS', 2, 14, 1, '164.100.150.66', 'https://cg.nic.in/health/hrmis', '4.0', NULL),
	(33, 'NPCDCS', 2, 14, 1, '164.100.150.66', 'https://cg.nic.in/health/ncd/', '4.0', NULL),
	(34, 'Kayakalp', 2, 14, 1, '164.100.150.66', 'https://cg.nic.in/health/kayakalp/', '4.0', NULL),
	(35, 'National Oral Health Programme', 2, 14, 1, '164.100.150.66', 'https://cg.nic.in/health/nohpmr', '4.0', NULL),
	(36, 'File Monitoring System', 2, 14, 1, '164.100.150.66', 'https://cg.nic.in/health/fts/', '4.0', NULL),
	(37, 'Old Covid 19 Monitoring System ', 2, 14, 1, '164.100.150.66', 'https://cg.nic.in/health/covid19', '4.0', NULL),
	(38, 'leprosy', 2, 14, 1, '164.100.150.66', 'https://cg.nic.in/health/leprosy/', '4.0', NULL);
/*!40000 ALTER TABLE `mas_app` ENABLE KEYS */;

-- Dumping structure for table rms.mas_core
CREATE TABLE IF NOT EXISTS `mas_core` (
  `physical_core` tinyint(4) NOT NULL,
  PRIMARY KEY (`physical_core`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_core: ~5 rows (approximately)
/*!40000 ALTER TABLE `mas_core` DISABLE KEYS */;
INSERT INTO `mas_core` (`physical_core`) VALUES
	(2),
	(4),
	(6),
	(8),
	(10);
/*!40000 ALTER TABLE `mas_core` ENABLE KEYS */;

-- Dumping structure for table rms.mas_db
CREATE TABLE IF NOT EXISTS `mas_db` (
  `db_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `db_name` varchar(50) NOT NULL DEFAULT '0',
  `db_type` varchar(50) NOT NULL DEFAULT '0',
  `app_id` tinyint(4) DEFAULT NULL,
  `dept_code` tinyint(4) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `server_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`db_id`),
  KEY `FK_mas_db_mas_app` (`app_id`),
  KEY `FK_mas_db_mas_dept` (`dept_code`),
  KEY `FK_mas_db_mas_user` (`user_id`),
  KEY `FK_mas_db_mas_server` (`server_id`),
  CONSTRAINT `FK_mas_db_mas_app` FOREIGN KEY (`app_id`) REFERENCES `mas_app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_mas_db_mas_dept` FOREIGN KEY (`dept_code`) REFERENCES `mas_dept` (`dept_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_mas_db_mas_server` FOREIGN KEY (`server_id`) REFERENCES `mas_server` (`server_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_mas_db_mas_user` FOREIGN KEY (`user_id`) REFERENCES `mas_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_db: ~0 rows (approximately)
/*!40000 ALTER TABLE `mas_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `mas_db` ENABLE KEYS */;

-- Dumping structure for table rms.mas_db_type
CREATE TABLE IF NOT EXISTS `mas_db_type` (
  `db_type` varchar(50) NOT NULL,
  PRIMARY KEY (`db_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_db_type: ~4 rows (approximately)
/*!40000 ALTER TABLE `mas_db_type` DISABLE KEYS */;
INSERT INTO `mas_db_type` (`db_type`) VALUES
	('mariadb'),
	('mysql'),
	('postgresql'),
	('sql server');
/*!40000 ALTER TABLE `mas_db_type` ENABLE KEYS */;

-- Dumping structure for table rms.mas_dept
CREATE TABLE IF NOT EXISTS `mas_dept` (
  `dept_code` tinyint(4) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) NOT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dept_code`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_dept: ~4 rows (approximately)
/*!40000 ALTER TABLE `mas_dept` DISABLE KEYS */;
INSERT INTO `mas_dept` (`dept_code`, `dept_name`, `remarks`) VALUES
	(1, 'Health and family welfare', 'Health'),
	(2, 'Land Records', 'used for Land records related to farmers'),
	(3, 'Directorate of Agriculture', 'Related to Agriculture'),
	(4, 'NHM', 'National Health Mission');
/*!40000 ALTER TABLE `mas_dept` ENABLE KEYS */;

-- Dumping structure for table rms.mas_designation
CREATE TABLE IF NOT EXISTS `mas_designation` (
  `design_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `design_type` varchar(100) NOT NULL,
  PRIMARY KEY (`design_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_designation: ~2 rows (approximately)
/*!40000 ALTER TABLE `mas_designation` DISABLE KEYS */;
INSERT INTO `mas_designation` (`design_id`, `design_type`) VALUES
	(1, 'Software Application Support Engineer'),
	(2, 'Senior Software Application Support Engineer');
/*!40000 ALTER TABLE `mas_designation` ENABLE KEYS */;

-- Dumping structure for table rms.mas_diskspace
CREATE TABLE IF NOT EXISTS `mas_diskspace` (
  `disk_space` varchar(10) NOT NULL,
  PRIMARY KEY (`disk_space`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_diskspace: ~4 rows (approximately)
/*!40000 ALTER TABLE `mas_diskspace` DISABLE KEYS */;
INSERT INTO `mas_diskspace` (`disk_space`) VALUES
	('1 TB'),
	('2 TB'),
	('250 GB'),
	('500 GB');
/*!40000 ALTER TABLE `mas_diskspace` ENABLE KEYS */;

-- Dumping structure for table rms.mas_emp_type
CREATE TABLE IF NOT EXISTS `mas_emp_type` (
  `emp_type_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `emp_type` varchar(10) NOT NULL,
  PRIMARY KEY (`emp_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_emp_type: ~3 rows (approximately)
/*!40000 ALTER TABLE `mas_emp_type` DISABLE KEYS */;
INSERT INTO `mas_emp_type` (`emp_type_id`, `emp_type`) VALUES
	(1, 'NICSI'),
	(2, 'BECIL'),
	(3, 'NHM');
/*!40000 ALTER TABLE `mas_emp_type` ENABLE KEYS */;

-- Dumping structure for table rms.mas_linux_version
CREATE TABLE IF NOT EXISTS `mas_linux_version` (
  `version` varchar(50) NOT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_linux_version: ~6 rows (approximately)
/*!40000 ALTER TABLE `mas_linux_version` DISABLE KEYS */;
INSERT INTO `mas_linux_version` (`version`) VALUES
	('CentOS Linux 3'),
	('CentOS Linux 4'),
	('CentOS Linux 5'),
	('CentOS Linux 6'),
	('CentOS Linux 7.0-1406'),
	('CentOS Linux 8.0-1905');
/*!40000 ALTER TABLE `mas_linux_version` ENABLE KEYS */;

-- Dumping structure for table rms.mas_machine_type
CREATE TABLE IF NOT EXISTS `mas_machine_type` (
  `machine_type` varchar(20) NOT NULL,
  PRIMARY KEY (`machine_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_machine_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `mas_machine_type` DISABLE KEYS */;
INSERT INTO `mas_machine_type` (`machine_type`) VALUES
	('Physical'),
	('VM');
/*!40000 ALTER TABLE `mas_machine_type` ENABLE KEYS */;

-- Dumping structure for table rms.mas_model
CREATE TABLE IF NOT EXISTS `mas_model` (
  `model` varchar(20) NOT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_model: ~2 rows (approximately)
/*!40000 ALTER TABLE `mas_model` DISABLE KEYS */;
INSERT INTO `mas_model` (`model`) VALUES
	('DELL'),
	('HP');
/*!40000 ALTER TABLE `mas_model` ENABLE KEYS */;

-- Dumping structure for table rms.mas_os
CREATE TABLE IF NOT EXISTS `mas_os` (
  `os` varchar(20) NOT NULL,
  PRIMARY KEY (`os`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_os: ~2 rows (approximately)
/*!40000 ALTER TABLE `mas_os` DISABLE KEYS */;
INSERT INTO `mas_os` (`os`) VALUES
	('CentOS'),
	('Windows');
/*!40000 ALTER TABLE `mas_os` ENABLE KEYS */;

-- Dumping structure for table rms.mas_plateform
CREATE TABLE IF NOT EXISTS `mas_plateform` (
  `plateform_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `plateform_name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`plateform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_plateform: ~3 rows (approximately)
/*!40000 ALTER TABLE `mas_plateform` DISABLE KEYS */;
INSERT INTO `mas_plateform` (`plateform_id`, `plateform_name`) VALUES
	(1, 'Angular'),
	(2, 'ASP.NET'),
	(3, 'PHP');
/*!40000 ALTER TABLE `mas_plateform` ENABLE KEYS */;

-- Dumping structure for table rms.mas_ram
CREATE TABLE IF NOT EXISTS `mas_ram` (
  `ram` varchar(10) NOT NULL,
  PRIMARY KEY (`ram`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_ram: ~5 rows (approximately)
/*!40000 ALTER TABLE `mas_ram` DISABLE KEYS */;
INSERT INTO `mas_ram` (`ram`) VALUES
	('12 GB'),
	('16 GB'),
	('2 GB'),
	('4 GB'),
	('8 GB');
/*!40000 ALTER TABLE `mas_ram` ENABLE KEYS */;

-- Dumping structure for table rms.mas_server
CREATE TABLE IF NOT EXISTS `mas_server` (
  `server_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `server_ip` varchar(50) NOT NULL DEFAULT '',
  `os` varchar(20) NOT NULL DEFAULT '',
  `machine_type` varchar(50) NOT NULL DEFAULT '',
  `ram` varchar(10) NOT NULL DEFAULT '0',
  `physical_core` tinyint(4) NOT NULL DEFAULT 0,
  `model` varchar(20) NOT NULL DEFAULT '0',
  `disk_space` varchar(20) NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL,
  `dept_code` tinyint(4) DEFAULT NULL,
  `va` char(1) DEFAULT NULL,
  `va_score` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`server_id`),
  KEY `FK_mas_server_mas_os` (`os`),
  KEY `FK_mas_server_mas_dept` (`dept_code`),
  CONSTRAINT `FK_mas_server_mas_dept` FOREIGN KEY (`dept_code`) REFERENCES `mas_dept` (`dept_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_mas_server_mas_os` FOREIGN KEY (`os`) REFERENCES `mas_os` (`os`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_server: ~14 rows (approximately)
/*!40000 ALTER TABLE `mas_server` DISABLE KEYS */;
INSERT INTO `mas_server` (`server_id`, `server_ip`, `os`, `machine_type`, `ram`, `physical_core`, `model`, `disk_space`, `version`, `dept_code`, `va`, `va_score`) VALUES
	(1, '10.132.2.168', 'Windows', 'VM', '8 GB', 6, 'HP', '1 TB', 'Windows Server 2012 (R2)', 1, 'N', NULL),
	(2, '10.132.0.137', 'Windows', 'Physical', '256 GB', 40, 'HP', '4.5 TB', 'Windows Server 2016', 1, 'N', NULL),
	(3, '10.132.0.133', 'CentOS', 'VM', '2GB', 4, 'HP', '200GB', 'CentOS Linux 7.0-1406', 1, NULL, NULL),
	(4, '10.132.0.139', 'CentOS', 'VM', '2GB', 4, 'HP', '200GB', 'CentOS Linux 7.0-1406', 1, NULL, NULL),
	(5, '10.132.0.207', 'CentOS', 'VM', '1GB', 1, 'HP', '200GB', 'CentOS Linux 7.0-1406', 1, NULL, NULL),
	(6, '10.132.0.201', 'CentOS', 'VM', '32GB', 32, 'HP', '200GB', 'CentOS Linux 7.0-1406', 1, NULL, NULL),
	(7, '10.132.0.209', 'CentOS', 'VM', '4GB', 2, 'HP', '200GB', 'CentOS Linux 7.0-1406', 1, NULL, NULL),
	(8, '10.132.0.203', 'CentOS', 'VM', '2GB', 1, 'HP', '200GB', 'CentOS Linux 7.0-1406', 1, NULL, NULL),
	(9, '10.132.0.204', 'CentOS', 'VM', '4GB', 4, 'HP', '200GB', 'CentOS Linux 7.0-1406', 1, NULL, NULL),
	(10, '10.132.33.175', 'Windows', 'VM', '4 GB', 2, 'DELL', '80 GB', 'Windows Server 2019', 4, 'Y', 99),
	(11, '10.132.0.134', 'Windows', 'VM', '16 GB', 16, 'HP', '300 GB', 'Windows Server 2016', 3, 'N', NULL),
	(12, '10.132.0.199', 'CentOS', 'VM', '4 GB', 2, 'HP', '20 GB', 'CentOS Linux 7.0-1406', 3, 'N', NULL),
	(13, '10.132.0.208', 'Windows', 'VM', '8 GB', 8, 'HP', '200 GB', 'Windows Server 2012 ', 3, 'N', NULL),
	(14, '10.132.0.135', 'Windows', 'VM', '16 GB', 4, 'HP', '100 GB', 'Windows Server 2012 (R2)', 1, 'N', NULL);
/*!40000 ALTER TABLE `mas_server` ENABLE KEYS */;

-- Dumping structure for table rms.mas_user
CREATE TABLE IF NOT EXISTS `mas_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dept_code` tinyint(4) DEFAULT NULL,
  `mobile_no` bigint(10) NOT NULL,
  `email_id` varchar(50) NOT NULL DEFAULT '',
  `emp_type_id` tinyint(2) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `resigning_date` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `machine_ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `dept_code` (`dept_code`),
  KEY `FK_mas_user_mas_emp_type` (`emp_type_id`),
  CONSTRAINT `FK_mas_user_mas_emp_type` FOREIGN KEY (`emp_type_id`) REFERENCES `mas_emp_type` (`emp_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dept_code` FOREIGN KEY (`dept_code`) REFERENCES `mas_dept` (`dept_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_user: ~16 rows (approximately)
/*!40000 ALTER TABLE `mas_user` DISABLE KEYS */;
INSERT INTO `mas_user` (`user_id`, `name`, `dept_code`, `mobile_no`, `email_id`, `emp_type_id`, `joining_date`, `resigning_date`, `address`, `machine_ip`) VALUES
	(27, 'DEVENDRA CHANDRAKAR ', 4, 9098542380, 'chandrakardr@gmail.com ', 1, '2018-01-11', NULL, 'vill- Farhada,kosrangi kharoara Raipur 493225', NULL),
	(28, 'KAMAL KISHORE ', 4, 8871952002, 'kamalKishore518@gmail.com ', 1, '2018-12-05', NULL, 'Mahadev ghat, Raipur 492013', NULL),
	(29, 'SHIVA MANHAR ', 3, 9098704107, 'shivamanhar@gmail.com', 1, '2018-11-27', NULL, 'Garm jarveJaijaipur, Chattisghar,495690', NULL),
	(30, 'SHUBHAM ROY ', 21, 9630744005, 'shubh.0609sep@gmail.com ', 1, '2021-10-01', NULL, 'FALT NO.804 BLOCK.A  VIP HEIGHTS SADDU Raipur ', NULL),
	(31, 'LOKESH KUMAR CHAWADA ', 4, 8120061699, 'lokeshchawada@gmail.com ', 1, '2013-11-01', NULL, NULL, '10.132.36.114'),
	(32, 'ABHISHEK KUMAR ', 4, 7587762255, 'abhisheksr72@gmail.com', 3, '2013-04-16', NULL, 'WOLFFOT.WATIKA KATHADHI POLT Na.99 KATHADHI ', NULL),
	(33, 'ANURANG KUMAR ', 1, 8965820968, 'anuragdhiwar928@gmail.com', NULL, '2021-10-20', NULL, 'NEAR,DURGA TEMPLE.KOSA,JAJGIR-CHAPA (C.G).495663', NULL),
	(34, 'AJAY KUMAR ', 19, 9755653738, 'ajaykumar974@gmail.com', 1, '2021-06-01', NULL, 'H.NO-346,WARD-17,.PATHARRIPARA  C.S.E.B KORBA (EAST)(C.G) 494334', NULL),
	(35, 'RUKHSAR MIRJA ', 4, 7000644061, 'rukhsarmirja757@gmail.com', 3, '2021-10-11', NULL, 'H.NO-19/4.JAIL COLONY,MG WORD DIST JAIL KANKER (C.G)494334', NULL),
	(36, 'SANDEEP TIWARI ', 4, 7415313383, 'sandeep706@gmail.com', 3, '2021-10-08', NULL, 'SECTOR-3 STREET NO-15 PROFERSSER COLONY SUMERU MATH RAIPUR (.C.G)', NULL),
	(37, 'GESHWAR KUMAR DHANKAR ', 4, 7566427457, 'geshwardhankar@gmail.com', 3, '2021-12-09', NULL, '92/KM.AWASPARA ,PURI TEH-CHARAMA,DIST-KANKER 494337', NULL),
	(38, 'ABHIJEET MUKHERJEE', 1, 9827884606, 'abhijeet.2301@gmail.com', 3, '2021-12-02', NULL, 'H,NO 4309,WORD 60,RAVATPURA PHASE-2,RAIPUR (C.G)', NULL),
	(39, 'PRITAM KUMAR TANDAN ', 4, 9926130834, 'pritamtandan@gmail.com', 3, '2021-10-12', NULL, 'C/O PANNNALA, NERRIDIH,BARBANDA MANDHAR, RAIPUR.MANDHAR,CHHRHJH .493111', NULL),
	(40, 'DEEPAK DHEEWAR ', 4, 9993039522, 'deewar.deepak82@gmail.com', 3, '2021-07-31', NULL, 'VIP,CITY SHDDU,RAIPUR 492001', NULL),
	(41, 'ANURAG KUMAR ', 1, 8965820968, 'anuragdhiwar928@gmail.com ', 3, '2021-10-20', NULL, 'NEAR,DURA TEMPLE KOSA JANJGIR CHAMPA (C.G) 495663', NULL),
	(42, 'VIJAY KUMAR VSTRAKAR ', 1, 9752680725, 'vijaykumarvastrakar@gmail.com', 3, '2021-09-04', NULL, 'VILL& P.O-GOTORA DIST-BILASPUR ', NULL);
/*!40000 ALTER TABLE `mas_user` ENABLE KEYS */;

-- Dumping structure for table rms.mas_vendor
CREATE TABLE IF NOT EXISTS `mas_vendor` (
  `vendor_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(50) NOT NULL DEFAULT '',
  `contact_person` varchar(50) NOT NULL DEFAULT '',
  `contact_no.` varchar(12) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_vendor: ~10 rows (approximately)
/*!40000 ALTER TABLE `mas_vendor` DISABLE KEYS */;
INSERT INTO `mas_vendor` (`vendor_id`, `vendor_name`, `contact_person`, `contact_no.`, `email_id`) VALUES
	(1, 'Aeologic Technologies Pvt. Ltd.', 'Vikrant Kumar', '9873759782 ', 'vikrant@aeologic.com'),
	(2, 'Akal Information Systems Ltd', 'K D Singh ', '9015881167', 'kdsingh@akalinfosys.com'),
	(3, 'Collabera Technologies Private', 'Kushan Kella', '8200297549', 'kushan.kella@collabera.com'),
	(4, 'Dev Information Technology Limited', 'Sunil Yadav ', '9313999652', 'sunil.yadav@devitpl.com'),
	(5, 'Geostat Informatics India Private', 'Shivani Singh ', '9654974025', 'shivani@geostat.in'),
	(6, 'NetProphets Cyberworks Private', 'Ashish Chauhan', '9212230524', 'ashish.chauhan@npglobal.in'),
	(7, 'Nippon Data Systems Ltd.', 'Mukesh Pratap Singh ', '9717181852', 'mukesh.singh@nippondata.com'),
	(8, 'Pioneer E Solutions Pvt. Ltd.', 'Puneet Sharma', '9555993534', 'support@pioneeresolutions.in'),
	(9, 'SISL Infotech Pvt. Ltd', 'Gaurav Arora', '9212444199 ', 'sislsales@sislinfotech.com'),
	(10, 'Velocis Systems Pvt. Ltd', 'Rahul Rajput', '9990686602 ', 'rahul.rajput@velocis.in');
/*!40000 ALTER TABLE `mas_vendor` ENABLE KEYS */;

-- Dumping structure for table rms.mas_win_version
CREATE TABLE IF NOT EXISTS `mas_win_version` (
  `version` varchar(50) NOT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_win_version: ~12 rows (approximately)
/*!40000 ALTER TABLE `mas_win_version` DISABLE KEYS */;
INSERT INTO `mas_win_version` (`version`) VALUES
	('Windows NT 3.51'),
	('Windows NT 4.0'),
	('Windows Server 2000'),
	('Windows Server 2003 '),
	('Windows Server 2003 (R2)'),
	('Windows Server 2008 '),
	('Windows Server 2008 (R2)'),
	('Windows Server 2012 '),
	('Windows Server 2012 (R2)'),
	('Windows Server 2016'),
	('Windows Server 2019'),
	('Windows Server 2022');
/*!40000 ALTER TABLE `mas_win_version` ENABLE KEYS */;

-- Dumping structure for table rms.mas_workorder
CREATE TABLE IF NOT EXISTS `mas_workorder` (
  `dept_code` tinyint(4) DEFAULT NULL,
  `project_no` varchar(50) NOT NULL,
  `project_name` varchar(50) NOT NULL,
  `vendor_id` tinyint(4) DEFAULT NULL,
  `work_order_no` varchar(50) NOT NULL,
  `work_order_location` varchar(100) DEFAULT NULL,
  `pi` varchar(50) DEFAULT NULL,
  `pi_location` varchar(50) DEFAULT NULL,
  `pef` varchar(50) DEFAULT NULL,
  `pef_location` varchar(50) DEFAULT NULL,
  KEY `FK_mas_workorder_mas_vendor` (`vendor_id`),
  CONSTRAINT `FK_mas_workorder_mas_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `mas_vendor` (`vendor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_workorder: ~4 rows (approximately)
/*!40000 ALTER TABLE `mas_workorder` DISABLE KEYS */;
INSERT INTO `mas_workorder` (`dept_code`, `project_no`, `project_name`, `vendor_id`, `work_order_no`, `work_order_location`, `pi`, `pi_location`, `pef`, `pef_location`) VALUES
	(1, 'S180034MPCG', 'National Health Mission, Raipur', 8, 'M2105147', 'work_order/file-1645615889614.PDF', 'PMPCG212303', 'pi/file-1645616108190.PDF', ' NS-116/2797', 'pef/file-1645616194915.pdf'),
	(17, '3124124', 'Agriculture project', 3, '24114124', 'work_order/file-1646042221019.pdf', '234255254', 'pi/file-1646042520113.pdf', '24234254', 'pef/file-1646042528286.pdf'),
	(1, 'S180034MPCG', 'National Health Mission, Raipur', 8, 'M2105147', 'work_order/file-1645615889614.PDF', 'PMPCG212303', 'pi/file-1645616108190.PDF', ' NS-116/2797', 'pef/file-1645616194915.pdf'),
	(17, '3124124', 'Agriculture project', 3, '24114124', 'work_order/file-1646042221019.pdf', '234255254', 'pi/file-1646042520113.pdf', '24234254', 'pef/file-1646042528286.pdf');
/*!40000 ALTER TABLE `mas_workorder` ENABLE KEYS */;

-- Dumping structure for table rms.mas_wo_details
CREATE TABLE IF NOT EXISTS `mas_wo_details` (
  `wo_details_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `work_order_no` varchar(50) NOT NULL DEFAULT '0',
  `design_id` tinyint(4) DEFAULT NULL,
  `work_order_from` date NOT NULL,
  `work_order_to` date NOT NULL,
  PRIMARY KEY (`wo_details_id`),
  KEY `FK_mas_wo_details_mas_designation` (`design_id`),
  CONSTRAINT `FK_mas_wo_details_mas_designation` FOREIGN KEY (`design_id`) REFERENCES `mas_designation` (`design_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rms.mas_wo_details: ~7 rows (approximately)
/*!40000 ALTER TABLE `mas_wo_details` DISABLE KEYS */;
INSERT INTO `mas_wo_details` (`wo_details_id`, `work_order_no`, `design_id`, `work_order_from`, `work_order_to`) VALUES
	(11, 'M2105147', 1, '2021-10-11', '2022-10-10'),
	(12, 'M2105147', 1, '2021-10-08', '2022-10-07'),
	(13, 'M2105147', 1, '2021-10-12', '2022-10-11'),
	(14, 'M2105147', 1, '2021-12-09', '2022-12-08'),
	(15, 'M2105147', 2, '2021-10-13', '2022-10-12'),
	(16, '24114124', 2, '2022-02-03', '2022-02-25'),
	(17, '24114124', 1, '2022-02-25', '2022-02-28');
/*!40000 ALTER TABLE `mas_wo_details` ENABLE KEYS */;

-- Dumping structure for table rms.returned_stock_details
CREATE TABLE IF NOT EXISTS `returned_stock_details` (
  `stock_id` int(11) DEFAULT NULL,
  `serial_no` varchar(50) DEFAULT NULL,
  `dept_id` varchar(50) DEFAULT NULL,
  `was_issued_to` varchar(50) DEFAULT NULL,
  `returned_date` date DEFAULT NULL,
  `status_id` char(16) DEFAULT NULL,
  KEY `stock_id` (`stock_id`),
  CONSTRAINT `FK1_stock_id5` FOREIGN KEY (`stock_id`) REFERENCES `stock_receive_mas` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- Dumping data for table rms.returned_stock_details: ~5 rows (approximately)
/*!40000 ALTER TABLE `returned_stock_details` DISABLE KEYS */;
INSERT INTO `returned_stock_details` (`stock_id`, `serial_no`, `dept_id`, `was_issued_to`, `returned_date`, `status_id`) VALUES
	(1, NULL, NULL, NULL, NULL, NULL),
	(1, 'm1', 'Health and family welfare', 'DEVENDRA CHANDRAKAR ', NULL, NULL),
	(1, 'm1', 'Health and family welfare', 'DEVENDRA CHANDRAKAR ', NULL, NULL),
	(2, 'm2', 'Land Records', 'SHIVA MANHAR ', NULL, NULL),
	(2, 'm2', 'Land Records', 'SHIVA MANHAR ', NULL, NULL);
/*!40000 ALTER TABLE `returned_stock_details` ENABLE KEYS */;

-- Dumping structure for table rms.status_mas
CREATE TABLE IF NOT EXISTS `status_mas` (
  `status_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `status_name` char(12) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf32;

-- Dumping data for table rms.status_mas: ~6 rows (approximately)
/*!40000 ALTER TABLE `status_mas` DISABLE KEYS */;
INSERT INTO `status_mas` (`status_id`, `status_name`) VALUES
	(1, 'Received'),
	(2, 'Issued'),
	(3, 'Released'),
	(4, 'Transferred'),
	(5, 'Returned'),
	(6, 'Idle');
/*!40000 ALTER TABLE `status_mas` ENABLE KEYS */;

-- Dumping structure for table rms.stock_db
CREATE TABLE IF NOT EXISTS `stock_db` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept` tinyint(4) DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `cpu_sno` varchar(50) DEFAULT NULL,
  `monitor_sno` varchar(50) DEFAULT NULL,
  `keyboard_sno` varchar(50) DEFAULT NULL,
  `mouse_sno` varchar(50) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `issued_to` int(11) DEFAULT NULL,
  `issued_date` date DEFAULT NULL,
  `marked_no` varchar(50) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `i_form_no` varchar(50) DEFAULT NULL,
  `g_form_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `fk_brand` (`brand_id`),
  KEY `issued_to` (`issued_to`),
  CONSTRAINT `fk_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand_mas` (`brand_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `issued_to` FOREIGN KEY (`issued_to`) REFERENCES `user_mas` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf32;

-- Dumping data for table rms.stock_db: ~7 rows (approximately)
/*!40000 ALTER TABLE `stock_db` DISABLE KEYS */;
INSERT INTO `stock_db` (`stock_id`, `dept`, `received_date`, `cpu_sno`, `monitor_sno`, `keyboard_sno`, `mouse_sno`, `brand_id`, `issued_to`, `issued_date`, `marked_no`, `remark`, `i_form_no`, `g_form_no`) VALUES
	(35, 8, '2022-02-16', 'c101', 'm101', 'k101', 'm101', 2, 15, '2022-02-23', 'm101', 'marked', 'i101', 'g101'),
	(36, 1, '2022-02-10', 'c001', 'm001', 'k001', 'm001', 2, 16, '2022-02-17', 'm001', 'edited', 'i001', 'g001'),
	(37, 1, '2022-02-10', 'c002', 'm002', 'k002', 'm002', 1, 7, '2022-02-17', 'm002', 'success', 'i00200', 'g002'),
	(38, 6, '2022-02-16', 'c005', NULL, NULL, NULL, 3, 2, '2022-02-10', 'm005', 'added m005', NULL, NULL),
	(39, 8, '2022-02-17', 'c006', NULL, NULL, NULL, 3, 15, '2022-02-23', NULL, 'Submitted to rohit', NULL, NULL),
	(40, 1, '2022-02-10', 'c1', 'm1', 'k1', 'm1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
	(41, NULL, '2022-02-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `stock_db` ENABLE KEYS */;

-- Dumping structure for table rms.stock_receive_mas
CREATE TABLE IF NOT EXISTS `stock_receive_mas` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` tinyint(4) DEFAULT NULL,
  `hardware_id` int(11) DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `cpu_sno` varchar(50) DEFAULT NULL,
  `monitor_sno` varchar(50) DEFAULT NULL,
  `keyboard_sno` varchar(50) DEFAULT NULL,
  `mouse_sno` varchar(50) DEFAULT NULL,
  `make_model_id` int(11) DEFAULT NULL,
  `status_id` varchar(50) DEFAULT NULL,
  `i_form_no` varchar(50) DEFAULT NULL,
  `ilocation` varchar(50) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `dept_fk` (`dept_id`),
  KEY `hardware_fk` (`hardware_id`),
  KEY `status_fk` (`status_id`),
  KEY `make_model` (`make_model_id`) USING BTREE,
  CONSTRAINT `dept_fk` FOREIGN KEY (`dept_id`) REFERENCES `mas_dept` (`dept_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hardware_fk` FOREIGN KEY (`hardware_id`) REFERENCES `hardware_mas` (`h_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `make_model` FOREIGN KEY (`make_model_id`) REFERENCES `brand_mas` (`brand_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf32;

-- Dumping data for table rms.stock_receive_mas: ~6 rows (approximately)
/*!40000 ALTER TABLE `stock_receive_mas` DISABLE KEYS */;
INSERT INTO `stock_receive_mas` (`stock_id`, `dept_id`, `hardware_id`, `received_date`, `cpu_sno`, `monitor_sno`, `keyboard_sno`, `mouse_sno`, `make_model_id`, `status_id`, `i_form_no`, `ilocation`, `remarks`) VALUES
	(1, 1, 1, '2022-02-07', 'c1', 'm1', 'k1', 'm1', 1, '1', NULL, NULL, NULL),
	(2, 2, 3, '2022-02-11', 'c2', 'm2', 'k2', 'm2', 2, '2', NULL, NULL, NULL),
	(3, 1, 2, '2022-02-17', 'cc', 'mm', 'kk', 'mm', 2, '1', NULL, NULL, NULL),
	(4, 3, 3, '2022-02-11', 'jj', 'mm', 'kk', 'nn', 3, '1', NULL, NULL, NULL),
	(6, 3, 3, '2022-02-25', NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL),
	(29, 4, 4, '2022-04-13', NULL, 'ss33', NULL, NULL, 2, NULL, 'ii88', NULL, 'rr66');
/*!40000 ALTER TABLE `stock_receive_mas` ENABLE KEYS */;

-- Dumping structure for table rms.stock_transaction_details
CREATE TABLE IF NOT EXISTS `stock_transaction_details` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) DEFAULT NULL,
  `status` date DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `stock_fk` (`stock_id`),
  CONSTRAINT `stock_fk` FOREIGN KEY (`stock_id`) REFERENCES `stock_db` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- Dumping data for table rms.stock_transaction_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `stock_transaction_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_transaction_details` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
