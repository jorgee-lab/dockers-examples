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
DROP TABLE IF EXISTS `bot_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bot_configuration` (
  `prop_name` varchar(50) NOT NULL,
  `prop_value` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_reg` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`prop_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bot_configuration`
--

LOCK TABLES `bot_configuration` WRITE;
/*!40000 ALTER TABLE `bot_configuration` DISABLE KEYS */;
INSERT INTO `bot_configuration` VALUES ('interval_time_request_fast','4h','Temporalidad de consultas para el symbol','2023-11-25 03:40:13'),('intervals','1h,4h,1d','Intervalos a analizar','2023-11-25 03:40:13'),('limit_down','30','Limite Inferior RSI','2023-11-25 03:40:13'),('limit_up','70','Limite superior RSI','2023-11-25 03:40:13'),('min_score','100','Score minimo antes de enviar una seÃ±al','2023-11-25 03:40:13'),('minutes','1','Cantidad de minutos a esperar por cada consulta por temporalidad','2023-11-25 03:40:13'),('origen','Desarrollo','Sistema desde donde se origina la seÃ±al','2023-11-25 03:40:13'),('symbol_list','^VIX:,^GSPC:,BTC,ETH,ADA,BNB','Simbolos a analizar','2023-11-25 03:40:13'),('symbols_report','BTCUSDT,ETHUSDT,BNBUSDT,ADAUSDT','Simbolos a los que se les generarÃ¡ reportes diarios','2023-11-25 03:40:13'),('tolerancia','0.01','Tolerancia de precios en seÃ±ales','2023-11-25 03:40:13');
/*!40000 ALTER TABLE `bot_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signals_trading`
--

DROP TABLE IF EXISTS `signals_trading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signals_trading` (
  `id_signal` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `signal_name` varchar(200) NOT NULL,
  `analysis` varchar(200) NOT NULL,
  `score` int DEFAULT NULL,
  `indicators` json DEFAULT NULL,
  `url_doc` varchar(200) NOT NULL,
  `date_reg` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_signal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signals_trading`
--

LOCK TABLES `signals_trading` WRITE;
/*!40000 ALTER TABLE `signals_trading` DISABLE KEYS */;
/*!40000 ALTER TABLE `signals_trading` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-25  3:43:53
