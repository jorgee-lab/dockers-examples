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
CREATE TABLE `users` (
  `id_user` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `is_admin` boolean not null default 0,
  `date_reg` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `bot-trading`.status;
CREATE TABLE `status` (
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
ALTER TABLE signals_trading
ADD COLUMN temporality VARCHAR(15) AFTER signal_name;

ALTER TABLE signals_trading
ADD COLUMN symbol VARCHAR(30) AFTER id_signal;

DROP TABLE IF EXISTS `bot-trading`.alerts;
CREATE TABLE `alerts` (
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
CREATE TABLE `reports` (
  `id_report` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `symbol` varchar(30) NOT NULL,
  `temporality` varchar(15) NOT NULL,
  `price` DOUBLE NULL,
  `support_resistance` VARCHAR(500) NULL,
  `url_doc` VARCHAR(200) NOT NULL,
  `date_reg` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_report`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

INSERT INTO bot_configuration(prop_name, prop_value, description)VALUES('hour_send_report', '17:40', 'Horario en los que se envian los reportes diarios');
INSERT INTO bot_configuration(prop_name, prop_value, description)VALUES('token_telegram', '5938062429:AAE9AZbfTLJOQF14_as0BQ5TUjUCQjou5gQ', 'Token de autenticacion de Telegram');
INSERT INTO bot_configuration(prop_name, prop_value, description)VALUES('chat_idtelegram', '1713932199', 'Id del chat de Telegram');

############################26-01-2023
INSERT INTO `bot-trading`.bot_configuration(prop_name, prop_value, description)VALUES('symbols_report', 'BTCUSDT,ETHUSDT,BNBUSDT,ADAUSDT', 'Simbolos a los que se les generará reportes diarios');
