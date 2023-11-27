-- MySQL dump 10.13  Distrib 8.2.0, for Linux (x86_64)
--
-- Host: localhost    Database: bot-trading
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bot_configuration`
--
CREATE Database `bot-trading`;
USE `bot-trading`;
DROP TABLE IF EXISTS `bot-trading`.bot_configuration;
CREATE TABLE `bot-trading`.bot_configuration (
    prop_name varchar(50) NOT NULL PRIMARY KEY,
    prop_value varchar(255),
    description varchar(255),
    date_reg TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO `bot-trading`.bot_configuration(prop_name, prop_value, description)VALUES('minutes', '1', 'Cantidad de minutos a esperar por cada consulta por temporalidad');
INSERT INTO `bot-trading`.bot_configuration(prop_name, prop_value, description)VALUES('interval_time_request_fast', '4h', 'Temporalidad de consultas para el symbol');
INSERT INTO `bot-trading`.bot_configuration(prop_name, prop_value, description)VALUES('limit_up', '70', 'Limite superior RSI');
INSERT INTO `bot-trading`.bot_configuration(prop_name, prop_value, description)VALUES('limit_down', '30', 'Limite Inferior RSI');
INSERT INTO `bot-trading`.bot_configuration(prop_name, prop_value, description)VALUES('tolerancia', '0.01', 'Tolerancia de precios en señales');
INSERT INTO `bot-trading`.bot_configuration(prop_name, prop_value, description)VALUES('min_score', '100', 'Score minimo antes de enviar una señal');
INSERT INTO `bot-trading`.bot_configuration(prop_name, prop_value, description)VALUES('symbol_list', '^VIX:,^GSPC:,BTC,ETH,ADA,BNB', 'Simbolos a analizar');
INSERT INTO `bot-trading`.bot_configuration(prop_name, prop_value, description)VALUES('intervals', '1h,4h,1d', 'Intervalos a analizar');
INSERT INTO `bot-trading`.bot_configuration(prop_name, prop_value, description)VALUES('origen', 'Desarrollo', 'Sistema desde donde se origina la señal');


DROP TABLE IF EXISTS `bot-trading`.signals_trading;
CREATE TABLE `bot-trading`.`signals_trading` (
  `id_signal` MEDIUMINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `signal_name` VARCHAR(200) NOT NULL,
  `analysis` VARCHAR(200) NOT NULL,
  `score` INT,
  `indicators` JSON DEFAULT NULL,
  `url_doc` VARCHAR(200) NOT NULL,
  date_reg TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_signal`)
) ENGINE=INNODB;

DROP TABLE IF EXISTS `bot-trading`.users;
CREATE TABLE `bot-trading`.`users` (
  `id_user` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `is_admin` boolean not null default 0,
  `date_reg` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `bot-trading`.status;
CREATE TABLE `bot-trading`.`status` (
  `id_status` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `prop_status` varchar(200) NOT NULL,
  `value_status` varchar(200) NOT NULL,
  `msg` varchar(500) NULL,
  `date_reg` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

INSERT INTO `bot-trading`.status
(prop_status, value_status, date_reg)
VALUES('HEART_BEAT', 'OK', CURRENT_TIMESTAMP);


INSERT INTO `bot-trading`.status
(prop_status, value_status, date_reg)
VALUES('INIT_BOT', 'OK', CURRENT_TIMESTAMP);

INSERT INTO `bot-trading`.status
(prop_status, value_status, date_reg)
VALUES('BOT_ERROR', 'OK', CURRENT_TIMESTAMP);

INSERT INTO `bot-trading`.status
(prop_status, value_status, date_reg)
VALUES('LAST_REPORT_DAILY', 'OK', CURRENT_TIMESTAMP);

############################20-12-2022
ALTER TABLE `bot-trading`.signals_trading
ADD COLUMN temporality VARCHAR(15) AFTER signal_name;

ALTER TABLE `bot-trading`.signals_trading
ADD COLUMN symbol VARCHAR(30) AFTER id_signal;

DROP TABLE IF EXISTS `bot-trading`.alerts;
CREATE TABLE `bot-trading`.`alerts` (
  `id_alert` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `symbol` varchar(30) NOT NULL,
  `temporality` varchar(15) NOT NULL,
  `price` DOUBLE NULL,
  `sent` boolean not null default 0,
  `date_reg` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_alert`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

############################21-12-2022
DROP TABLE IF EXISTS `bot-trading`.reports;
CREATE TABLE `bot-trading`.reports (
  `id_report` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `symbol` varchar(30) NOT NULL,
  `temporality` varchar(15) NOT NULL,
  `price` DOUBLE NULL,
  `support_resistance` VARCHAR(500) NULL,
  `url_doc` VARCHAR(200) NOT NULL,
  `date_reg` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_report`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

INSERT INTO `bot-trading`.bot_configuration(prop_name, prop_value, description)VALUES('hour_send_report', '17:40', 'Horario en los que se envian los reportes diarios');
INSERT INTO `bot-trading`.bot_configuration(prop_name, prop_value, description)VALUES('token_telegram', '5938062429:AAE9AZbfTLJOQF14_as0BQ5TUjUCQjou5gQ', 'Token de autenticacion de Telegram');
INSERT INTO `bot-trading`.bot_configuration(prop_name, prop_value, description)VALUES('chat_idtelegram', '1713932199', 'Id del chat de Telegram');

############################26-01-2023
INSERT INTO `bot-trading`.bot_configuration(prop_name, prop_value, description)VALUES('symbols_report', 'BTCUSDT,ETHUSDT,BNBUSDT,ADAUSDT', 'Simbolos a los que se les generará reportes diarios');
INSERT INTO `bot-trading`.users(id_user, name, email, password, is_admin, date_reg) VALUES(1, 'Juan Ramirez', 'juan.a.ramirez.lopez@gmail.com', 'pbkdf2:sha256:260000$l7qudJ9QYh1MUq01$b915ee7446a99e8da0604368d818dd4bf13a588e908dd7c26dd530c23e3380f7', 1, '2022-12-19 09:44:52');
INSERT INTO `bot-trading`.bot_configuration(prop_name, prop_value, description)VALUES('token_git', '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', 'Token con el que se subirá los pdf del grafico analizado a GIT');