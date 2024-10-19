CREATE DATABASE  IF NOT EXISTS `credicel_Myvariable` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `credicel_Myvariable`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 190.90.160.172    Database: credicel_Myvariable
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.19-MariaDB-cll-lve

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
-- Table structure for table `ClassParameter`
--

DROP TABLE IF EXISTS `ClassParameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClassParameter` (
  `idClassParameter` int(11) NOT NULL AUTO_INCREMENT,
  `Class` varchar(45) NOT NULL,
  `Parameter` varchar(45) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idClassParameter`),
  UNIQUE KEY `idClassParameter_UNIQUE` (`idClassParameter`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClassParameter`
--

LOCK TABLES `ClassParameter` WRITE;
/*!40000 ALTER TABLE `ClassParameter` DISABLE KEYS */;
INSERT INTO `ClassParameter` VALUES (1,'Control_Module\\Analog_Transmitter','Well','IDF Only'),(2,'Control_Module\\Analog_Transmitter','Battery','IDF Only'),(3,'','',NULL),(4,'','',NULL);
/*!40000 ALTER TABLE `ClassParameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClassPoint`
--

DROP TABLE IF EXISTS `ClassPoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClassPoint` (
  `idClassPoint` int(11) NOT NULL AUTO_INCREMENT,
  `ControlModuleClass` varchar(45) NOT NULL,
  `Tag` varchar(45) NOT NULL,
  `PointClass` varchar(45) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idClassPoint`),
  UNIQUE KEY `idClassPoint_UNIQUE` (`idClassPoint`),
  KEY `FK_MODULE_idx` (`ControlModuleClass`),
  CONSTRAINT `FK_MODULE` FOREIGN KEY (`ControlModuleClass`) REFERENCES `ControlModule` (`ModuleClass`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClassPoint`
--

LOCK TABLES `ClassPoint` WRITE;
/*!40000 ALTER TABLE `ClassPoint` DISABLE KEYS */;
INSERT INTO `ClassPoint` VALUES (1,'Control_Module\\Analog_Transmitter','PV','Point\\Analog_#','Process Value');
/*!40000 ALTER TABLE `ClassPoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ControlModule`
--

DROP TABLE IF EXISTS `ControlModule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ControlModule` (
  `idClassParameters` int(11) NOT NULL AUTO_INCREMENT,
  `FuntionalArea` varchar(45) NOT NULL,
  `Equipment` varchar(45) NOT NULL,
  `Module` varchar(45) NOT NULL,
  `EquipmentClass` varchar(45) NOT NULL,
  `ModuleClass` varchar(45) NOT NULL,
  PRIMARY KEY (`idClassParameters`),
  UNIQUE KEY `idClassParameters_UNIQUE` (`idClassParameters`),
  KEY `FK_Module_idx` (`ModuleClass`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ControlModule`
--

LOCK TABLES `ControlModule` WRITE;
/*!40000 ALTER TABLE `ControlModule` DISABLE KEYS */;
INSERT INTO `ControlModule` VALUES (1,'Separation_Area','Test_Separator_01','LIT_01','Equipment\\Separation_Area\\Test_Separator','Control_Module\\Analog_Transmitter');
/*!40000 ALTER TABLE `ControlModule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-18 20:50:25
