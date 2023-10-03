-- MySQL dump 10.13  Distrib 8.1.0, for macos13 (arm64)
--
-- Host: localhost    Database: PROJECT3_BLOOD_DONATION_SYSTEM
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `BloodBank`
--

DROP TABLE IF EXISTS `BloodBank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BloodBank` (
  `BloodBankName` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `DonorName` varchar(255) DEFAULT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`BloodBankName`),
  KEY `DonorName` (`DonorName`),
  CONSTRAINT `bloodbank_ibfk_1` FOREIGN KEY (`DonorName`) REFERENCES `Donor` (`DonorName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BloodBank`
--

LOCK TABLES `BloodBank` WRITE;
/*!40000 ALTER TABLE `BloodBank` DISABLE KEYS */;
INSERT INTO `BloodBank` VALUES ('City Blood Bank','123 Oak Ave','Sristi Raut','555-111-2222'),('Community Blood Center','456 Elm St','Sarah Brown','555-222-3333'),('County Blood Services','202 Birch St','Shreya Poudel','555-555-6666'),('National Blood Center','101 Maple St','Susan White','555-444-5555'),('Regional Blood Bank','789 Pine St','Robert Lee','555-333-4444');
/*!40000 ALTER TABLE `BloodBank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Donor`
--

DROP TABLE IF EXISTS `Donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Donor` (
  `DonorId` int NOT NULL,
  `DonorName` varchar(255) DEFAULT NULL,
  `BloodGroup` varchar(5) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`DonorId`),
  UNIQUE KEY `UC_DonorName` (`DonorName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Donor`
--

LOCK TABLES `Donor` WRITE;
/*!40000 ALTER TABLE `Donor` DISABLE KEYS */;
INSERT INTO `Donor` VALUES (1,'Sarah Brown','A+','123 Main St','555-123-4567'),(2,'Robert Lee','B-','456 Elm St','555-987-6543'),(3,'Susan White','O+','789 Oak St','555-321-7890'),(4,'Sristi Raut','AB+','101 Pine St','555-555-5555'),(5,'Shreya Poudel','O-','422 N Dakota','984-123-8877');
/*!40000 ALTER TABLE `Donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patient` (
  `PatientId` int NOT NULL,
  `PatientName` varchar(255) DEFAULT NULL,
  `BloodGroup` varchar(5) DEFAULT NULL,
  `PatientDisease` varchar(255) DEFAULT NULL,
  `DonorId` int DEFAULT NULL,
  PRIMARY KEY (`PatientId`),
  KEY `DonorId` (`DonorId`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`DonorId`) REFERENCES `Donor` (`DonorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient` VALUES (1,'John Doe','A+','None',1),(2,'Jane Smith','B-','Hypertension',2),(3,'Michael Johnson','O+','Diabetes',3),(5,'KC Santosh','O-','Asthma',5),(6,'Srijana Raut','O-','Diabetes',5);
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patientview`
--

DROP TABLE IF EXISTS `patientview`;
/*!50001 DROP VIEW IF EXISTS `patientview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patientview` AS SELECT 
 1 AS `PatientId`,
 1 AS `PatientName`,
 1 AS `BloodGroup`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `patientview`
--

/*!50001 DROP VIEW IF EXISTS `patientview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patientview` AS select `patient`.`PatientId` AS `PatientId`,`patient`.`PatientName` AS `PatientName`,`patient`.`BloodGroup` AS `BloodGroup` from `patient` */;
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

-- Dump completed on 2023-10-02  9:43:13
