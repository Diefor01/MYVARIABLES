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
-- Table structure for table `Equipment`
--

DROP TABLE IF EXISTS `Equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipment` (
  `idEquipment` int(11) NOT NULL AUTO_INCREMENT,
  `Equipment_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`idEquipment`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipment`
--

LOCK TABLES `Equipment` WRITE;
/*!40000 ALTER TABLE `Equipment` DISABLE KEYS */;
INSERT INTO `Equipment` VALUES (1,'Analog_01'),(2,'Analog_Valve_01'),(3,'Booster_01'),(4,'Charge_Pump_01'),(5,'Chemical_Drum_01'),(6,'Circulating_Pump_01'),(7,'Communications_01'),(8,'Comp_Header_01'),(9,'Dehydrator_01'),(10,'Enclosure_01'),(11,'Digital_Equipment_01'),(12,'Filter_Separator_01'),(13,'Flare_KOD_01'),(14,'Flare_Pilot_01'),(15,'Fuel_Header_01'),(16,'Generator_01'),(17,'GL_Compressor_01'),(18,'Glycol_01'),(19,'Gun_Barrel_01'),(20,'H2S_01'),(21,'Header_01'),(22,'Hydrocyclone_01'),(23,'Injection_Pump_01'),(24,'Inlet_Manifold_01'),(25,'Inlet_Pump_01'),(26,'Inlet_Separator_01'),(27,'Instrument_Air_01'),(28,'LACT_01'),(29,'Liquid_Recovery_01'),(30,'Lp_Compresor_01'),(31,'MCC_01'),(32,'Meter_Skid_01'),(33,'Meters_01'),(34,'Methanol_Tank_01'),(35,'Oil_Circ_Pump_01'),(36,'Oil_Pump_01'),(37,'Oil_Tank_01'),(38,'Outlet_Manifold_01'),(39,'Outlet_Pump_01'),(40,'Pipeline_01'),(41,'PLC_01'),(42,'Prod_Separator_2Phase_01'),(43,'Prod_Separator_3Phase_01'),(44,'Reboiler_01'),(45,'Repeater_01'),(46,'RIO_01'),(47,'Sales_Manifold_01'),(48,'Scrubber_01'),(49,'Shutdown_01'),(50,'Skid_01'),(51,'Slug_Catcher_01'),(52,'Spillover_Tank_01'),(53,'Stabilizer_01'),(54,'Sump_Pump_01'),(55,'TEG_01'),(56,'Test_Separator_01'),(57,'Transformer_01'),(58,'UPS_01'),(59,'VCU_01'),(60,'VRT_01'),(61,'VRT_Water_Pump_01'),(62,'VRU_01'),(63,'Water_Cric_Pump_01'),(64,'Water_Header_01'),(65,'Water_Pump_01'),(66,'Water_Tank_01'),(67,'WellHead_01');
/*!40000 ALTER TABLE `Equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Function_Area`
--

DROP TABLE IF EXISTS `Function_Area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Function_Area` (
  `idAreas` int(11) NOT NULL AUTO_INCREMENT,
  `Function_Area_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`idAreas`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Function_Area`
--

LOCK TABLES `Function_Area` WRITE;
/*!40000 ALTER TABLE `Function_Area` DISABLE KEYS */;
INSERT INTO `Function_Area` VALUES (1,'Storage'),(2,'Pump'),(3,'Separation'),(4,'Compressor'),(5,'Disposal'),(6,'Pipeline'),(7,'Communication'),(8,'Production'),(9,'Control_Bulding'),(10,'Flare'),(11,'LACT'),(12,'Chemical');
/*!40000 ALTER TABLE `Function_Area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventory`
--

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inventory` (
  `idPath` int(11) NOT NULL AUTO_INCREMENT,
  `Function_Area` int(11) NOT NULL,
  `Equipment` int(11) NOT NULL,
  `Module` int(11) NOT NULL,
  `Pointt` int(11) NOT NULL,
  PRIMARY KEY (`idPath`),
  KEY `FK_FA_idx` (`Function_Area`),
  KEY `FK_EQ_idx` (`Equipment`),
  KEY `FK_MO_idx` (`Module`),
  KEY `FK_PO_idx` (`Pointt`),
  CONSTRAINT `FK_EQ` FOREIGN KEY (`Equipment`) REFERENCES `Equipment` (`idEquipment`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_FA` FOREIGN KEY (`Function_Area`) REFERENCES `Function_Area` (`idAreas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MO` FOREIGN KEY (`Module`) REFERENCES `Modules` (`idModules`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PO` FOREIGN KEY (`Pointt`) REFERENCES `Points` (`idPoint`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory`
--

LOCK TABLES `Inventory` WRITE;
/*!40000 ALTER TABLE `Inventory` DISABLE KEYS */;
INSERT INTO `Inventory` VALUES (1,1,1,1,1),(2,2,39,70,6),(3,3,56,32,9),(4,3,43,58,10);
/*!40000 ALTER TABLE `Inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Modules`
--

DROP TABLE IF EXISTS `Modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Modules` (
  `idModules` int(11) NOT NULL AUTO_INCREMENT,
  `Modules_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`idModules`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Modules`
--

LOCK TABLES `Modules` WRITE;
/*!40000 ALTER TABLE `Modules` DISABLE KEYS */;
INSERT INTO `Modules` VALUES (1,'AIT_01'),(2,'AC_Power_01'),(3,'Analog_01'),(4,'Battery_01'),(5,'Blower_01'),(6,'BMS_01'),(7,'Breaker_01'),(8,'Bypass_01'),(9,'ESD_01'),(10,'Fan_01'),(11,'FCV_01'),(12,'FIC_01'),(13,'FIT_01'),(14,'Fire_Detector_01'),(15,'FIT_Gas_01'),(16,'FIT_Injection_01'),(17,'FIT_Oil_01'),(18,'FIT_Inlet_01'),(19,'FIT_Liquid_01'),(20,'FIT_Suct_01'),(21,'FIT_Water_01'),(22,'Gas_Compressor_01'),(23,'HSR_01'),(24,'HVAC_01'),(25,'Inlet_Valve_01'),(26,'IO_Health_01'),(27,'Kimark_01'),(28,'LCV_01'),(29,'LCV_Oil_01'),(30,'LCV_Water_01'),(31,'LIC_01'),(32,'LIT_01'),(33,'LIT_Oil_01'),(34,'LIT_Water_01'),(35,'LSH_01'),(36,'LSH_Oil_01'),(37,'LSH_Water_01'),(38,'LSH_Scrubber_01'),(39,'LSHH_01'),(40,'LSHH_Oil_01'),(41,'LSHH_Water_01'),(42,'LSHH_Scrubber_01'),(43,'LSL_01'),(44,'LSL_Oil_01'),(45,'LSL_Water_01'),(46,'LSL_Scruber_01'),(47,'LSLL_01'),(48,'LSLL_Water_01'),(49,'LSLL_Oil_01'),(50,'LSLL_Scrubber_01'),(51,'Oil_Pump_01'),(52,'Water_Pump_01'),(53,'PCV_01'),(54,'PCV_Gas_01'),(55,'PCV_Inlet_01'),(56,'PDIT_01'),(57,'PIC_01'),(58,'PIT_01'),(59,'PIT_Disch_01'),(60,'PIT_Suct_01'),(61,'PIT_Gas_01'),(62,'PIT_Inlet_01'),(63,'PIT_Manumatic_01'),(64,'PIT_Oil_01'),(65,'PIT_Water_01'),(66,'PSH_01'),(67,'PSHH_01'),(68,'PSL_01'),(69,'PSLL_01'),(70,'Pump_01'),(71,'SDV_01'),(72,'Shutdown_01'),(73,'SOV_01'),(74,'TIT_01'),(75,'VDF_01'),(76,'Well_01'),(77,'VIT_Comp_01'),(78,'PLC'),(79,'SW_01');
/*!40000 ALTER TABLE `Modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Points`
--

DROP TABLE IF EXISTS `Points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Points` (
  `idPoint` int(11) NOT NULL AUTO_INCREMENT,
  `Point_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`idPoint`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Points`
--

LOCK TABLES `Points` WRITE;
/*!40000 ALTER TABLE `Points` DISABLE KEYS */;
INSERT INTO `Points` VALUES (1,'ALM'),(2,'AUTO'),(3,'COMM_FAIL'),(4,'CONTROL_PANEL'),(5,'FAIL'),(6,'HOA_AUTO'),(7,'HOA_HAND'),(8,'HOA_OFF'),(9,'PV'),(10,'HH_ALM'),(11,'H_ALM'),(12,'LL_ALM'),(13,'L_ALM'),(14,'HH_SP'),(15,'H_SP'),(16,'LL_SP'),(17,'L_SP'),(18,'MAINT'),(19,'FAULT'),(20,'ZLC'),(21,'ZLO'),(22,'COMM_FAIL'),(23,'RUNNING'),(24,'STOPPING'),(25,'ALM');
/*!40000 ALTER TABLE `Points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_area_equipo_modulo_punto`
--

DROP TABLE IF EXISTS `vista_area_equipo_modulo_punto`;
/*!50001 DROP VIEW IF EXISTS `vista_area_equipo_modulo_punto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_area_equipo_modulo_punto` AS SELECT 
 1 AS `Area`,
 1 AS `Equipo`,
 1 AS `Modulo`,
 1 AS `Punto`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'credicel_Myvariable'
--

--
-- Dumping routines for database 'credicel_Myvariable'
--
/*!50003 DROP FUNCTION IF EXISTS `GetInventarioByEquipoYArea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`credicel_mysql_estudiantes_ago24`@`%` FUNCTION `GetInventarioByEquipoYArea`(IdEquipment INT, IdAreas INT) RETURNS int(11)
BEGIN
    RETURN
    (
        SELECT 
            i.IdPath, 
            e.Equipment_Name AS NombreEquipo, 
            a.Function_Area_Name AS NombreArea, 
            m.Modules_Name AS NombreModulo, 
            p.Point_Name AS NombrePunto
        FROM Inventory i
        JOIN Equipment e ON i.Equipment = e.IdEquipment
        JOIN Areas a ON i.Function_Area = a.IdAreas
        JOIN Modulos m ON i.Module = m.IdModules
        JOIN Puntos p ON i.Pointt = p.IdPoint
        WHERE i.Equipment = IdEquipo
          AND i.Function_Area = IdArea
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_area_equipo_modulo_punto`
--

/*!50001 DROP VIEW IF EXISTS `vista_area_equipo_modulo_punto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`credicel_mysql_estudiantes_ago24`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_area_equipo_modulo_punto` AS select `a`.`Function_Area_Name` AS `Area`,`e`.`Equipment_Name` AS `Equipo`,`m`.`Modules_Name` AS `Modulo`,`p`.`Point_Name` AS `Punto` from (((`Function_Area` `a` join `Equipment` `e` on(`a`.`idAreas` = `e`.`idEquipment`)) join `Modules` `m` on(`e`.`idEquipment` = `m`.`idModules`)) join `Points` `p` on(`m`.`idModules` = `p`.`idPoint`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-07 21:11:03
