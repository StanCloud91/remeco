-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: remeco
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `contraseña` varchar(100) NOT NULL,
  `estado` bit(1) NOT NULL,
  `id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKtk4yna9cqo54xshjc9dpgbmc8` FOREIGN KEY (`id`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('1245',_binary '',1),('5678',_binary '',2),('1245',_binary '',3);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `estado` bit(1) NOT NULL,
  `fecha_actualizacion` datetime(6) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `numero_cuenta` varchar(20) NOT NULL,
  `saldo` decimal(15,2) NOT NULL,
  `tipo_cuenta` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK7h7mqvcau3mcl0mbrkdrt7fnh` (`numero_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES (1,1,_binary '','2025-07-28 04:58:18.304254','2025-07-28 04:28:41.726501','478758',1425.00,'AHORROS'),(2,2,_binary '','2025-07-28 04:59:03.580412','2025-07-28 04:29:54.906411','225487',700.00,'CORRIENTE'),(3,3,_binary '','2025-07-28 04:59:36.622605','2025-07-28 04:30:25.113595','495878',150.00,'AHORROS'),(4,2,_binary '','2025-07-28 05:00:05.271089','2025-07-28 04:30:54.220556','496825',0.00,'AHORROS'),(5,1,_binary '','2025-07-28 04:41:43.583133','2025-07-28 04:41:43.583133','585545',1000.00,'CORRIENTE'),(6,1,_binary '','2025-07-28 04:47:52.120282','2025-07-28 04:47:52.120282','123456',60.00,'AHORROS');
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha` datetime(6) NOT NULL,
  `saldo` decimal(15,2) NOT NULL,
  `tipo_movimiento` varchar(255) NOT NULL,
  `valor` decimal(15,2) NOT NULL,
  `cuenta_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4moe88hxuohcysas5h70mdc09` (`cuenta_id`),
  CONSTRAINT `FK4moe88hxuohcysas5h70mdc09` FOREIGN KEY (`cuenta_id`) REFERENCES `cuentas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES (1,'Retiro de 575','2025-07-28 04:58:18.257263',1425.00,'RETIRO',575.00,1),(2,'Deposito de 600','2025-07-28 04:59:03.578951',700.00,'DEPOSITO',600.00,2),(3,'Deposito de 150','2025-07-28 04:59:36.620090',150.00,'DEPOSITO',150.00,3),(4,'Retiro de 540','2025-07-28 05:00:05.268701',0.00,'RETIRO',540.00,4);
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `direccion` varchar(200) NOT NULL,
  `edad` int NOT NULL,
  `fecha_actualizacion` datetime(6) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `genero` varchar(255) NOT NULL,
  `identificacion` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKdpxdn543sbyt8xkvsqha0l1li` (`identificacion`),
  CONSTRAINT `personas_chk_1` CHECK (((`edad` >= 0) and (`edad` <= 150)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Otavalo sn y principal ',30,'2025-07-28 04:17:03.173720','2025-07-28 04:17:03.173720','MASCULINO','1234567890','Jose Lema','098254785'),(2,'Amazonas y NNUU ',30,'2025-07-28 04:20:18.727352','2025-07-28 04:20:18.727352','FEMENINO','1234567891','Marianela Montalvo','097548965'),(3,'13 junio y Equinoccial',30,'2025-07-28 04:21:07.174954','2025-07-28 04:21:07.174954','MASCULINO','1234567892','Juan Osorio','098874587');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-28  2:42:09
