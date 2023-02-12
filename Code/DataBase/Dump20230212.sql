-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: easycharge
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business` (
  `idbusiness` int NOT NULL AUTO_INCREMENT,
  `user_username` varchar(45) NOT NULL,
  `business_name` varchar(45) NOT NULL,
  `business_address` varchar(45) NOT NULL,
  `ad` varchar(300) NOT NULL,
  PRIMARY KEY (`idbusiness`,`user_username`),
  KEY `fk_business_general_user1_idx` (`user_username`),
  CONSTRAINT `fk_business_general_user1` FOREIGN KEY (`user_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` VALUES (1,'perla','perla bistrot','via dei sette metri 12','Try perla bistrot! Use the promo code PERL4 for a 15% discount!'),(2,'teo','teo cafe','via anagnina 123','Try teo cafe! Use the promo code T30 for a 10% discount!');
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_has_charging_station`
--

DROP TABLE IF EXISTS `business_has_charging_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_has_charging_station` (
  `business_idbusiness` int NOT NULL,
  `charging_station_idcharging_station` varchar(50) NOT NULL,
  PRIMARY KEY (`business_idbusiness`,`charging_station_idcharging_station`),
  KEY `fk_business_has_charging_station_charging_station1_idx` (`charging_station_idcharging_station`),
  KEY `fk_business_has_charging_station_business1_idx` (`business_idbusiness`),
  CONSTRAINT `fk_business_has_charging_station_business1` FOREIGN KEY (`business_idbusiness`) REFERENCES `business` (`idbusiness`),
  CONSTRAINT `fk_business_has_charging_station_charging_station1` FOREIGN KEY (`charging_station_idcharging_station`) REFERENCES `charging_station` (`idcharging_station`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_has_charging_station`
--

LOCK TABLES `business_has_charging_station` WRITE;
/*!40000 ALTER TABLE `business_has_charging_station` DISABLE KEYS */;
INSERT INTO `business_has_charging_station` VALUES (1,'380009042448465'),(1,'380009042448796'),(2,'380009042448796'),(2,'380009042909023'),(2,'380009042934673');
/*!40000 ALTER TABLE `business_has_charging_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `car_model` varchar(45) NOT NULL,
  `rnge` varchar(45) NOT NULL,
  `capacity` varchar(45) NOT NULL,
  `connector_connectorType` varchar(45) NOT NULL,
  PRIMARY KEY (`car_model`,`connector_connectorType`),
  KEY `fk_car_connector1_idx` (`connector_connectorType`),
  CONSTRAINT `fk_car_connector1` FOREIGN KEY (`connector_connectorType`) REFERENCES `connector` (`connectorType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES ('Audi e-tron GT','488','93.4','IEC62196Type3'),('Mercedes EQS 450+','725','108','IEC62196Type3'),('Tesla Model 3 Standard','491','60','IEC62196Type2'),('Tesla Model S Plaid','628','95','IEC62196Type2');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charging_station`
--

DROP TABLE IF EXISTS `charging_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charging_station` (
  `idcharging_station` varchar(50) NOT NULL,
  PRIMARY KEY (`idcharging_station`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_station`
--

LOCK TABLES `charging_station` WRITE;
/*!40000 ALTER TABLE `charging_station` DISABLE KEYS */;
INSERT INTO `charging_station` VALUES ('123456789'),('276009024215428'),('380008000025883'),('380009041345921'),('380009041526479'),('380009042448465'),('380009042448796'),('380009042866123'),('380009042866515'),('380009042867032'),('380009042886844'),('380009042908042'),('380009042909023'),('380009042914097'),('380009042914951'),('380009042929651'),('380009042930308'),('380009042930649'),('380009042934673'),('380009042935381'),('380009042935405'),('380009042935430');
/*!40000 ALTER TABLE `charging_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charging_station_has_connector`
--

DROP TABLE IF EXISTS `charging_station_has_connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charging_station_has_connector` (
  `charging_station_idcharging_station` varchar(50) NOT NULL,
  `connector_connectorType` varchar(45) NOT NULL,
  PRIMARY KEY (`charging_station_idcharging_station`,`connector_connectorType`),
  KEY `fk_charging_station_has_connector_connector1_idx` (`connector_connectorType`),
  KEY `fk_charging_station_has_connector_charging_station1_idx` (`charging_station_idcharging_station`),
  CONSTRAINT `fk_charging_station_has_connector_charging_station1` FOREIGN KEY (`charging_station_idcharging_station`) REFERENCES `charging_station` (`idcharging_station`),
  CONSTRAINT `fk_charging_station_has_connector_connector1` FOREIGN KEY (`connector_connectorType`) REFERENCES `connector` (`connectorType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_station_has_connector`
--

LOCK TABLES `charging_station_has_connector` WRITE;
/*!40000 ALTER TABLE `charging_station_has_connector` DISABLE KEYS */;
/*!40000 ALTER TABLE `charging_station_has_connector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connector`
--

DROP TABLE IF EXISTS `connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connector` (
  `connectorType` varchar(45) NOT NULL,
  `ratedPowerKW` int DEFAULT NULL,
  `voltageV` int DEFAULT NULL,
  `currentA` int DEFAULT NULL,
  `currentType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`connectorType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connector`
--

LOCK TABLES `connector` WRITE;
/*!40000 ALTER TABLE `connector` DISABLE KEYS */;
INSERT INTO `connector` VALUES ('IEC62196Type2',NULL,NULL,NULL,NULL),('IEC62196Type3',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `connector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `user_username` varchar(45) NOT NULL,
  `charging_station_idcharging_station` varchar(50) NOT NULL,
  PRIMARY KEY (`user_username`,`charging_station_idcharging_station`),
  KEY `fk_user_has_charging_station_charging_station1_idx` (`charging_station_idcharging_station`),
  KEY `fk_user_has_charging_station_user1_idx` (`user_username`),
  CONSTRAINT `fk_user_has_charging_station_charging_station1` FOREIGN KEY (`charging_station_idcharging_station`) REFERENCES `charging_station` (`idcharging_station`),
  CONSTRAINT `fk_user_has_charging_station_user1` FOREIGN KEY (`user_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES ('niko','380009042866123'),('niko','380009042930308'),('spillo','276009024215428'),('spillo','380008000025883'),('spillo','380009042448465'),('spillo','380009042866123'),('spillo','380009042867032'),('spillo','380009042886844'),('spillo','380009042934673'),('spillo','380009042935381');
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point`
--

DROP TABLE IF EXISTS `point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point` (
  `giver_username` varchar(45) NOT NULL,
  `report_charging_station_idcharging_station` varchar(50) NOT NULL,
  `report_user_username` varchar(45) NOT NULL,
  `report_date` date NOT NULL,
  PRIMARY KEY (`report_charging_station_idcharging_station`,`report_user_username`,`report_date`),
  CONSTRAINT `fk_point_report1` FOREIGN KEY (`report_charging_station_idcharging_station`, `report_user_username`, `report_date`) REFERENCES `report` (`charging_station_idcharging_station`, `user_username`, `date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point`
--

LOCK TABLES `point` WRITE;
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
INSERT INTO `point` VALUES ('simone','380009041345921','spillo','2023-01-06'),('spillo','380009041526479','niko','2022-12-07'),('spillo','380009042914951','niko','2022-12-07');
/*!40000 ALTER TABLE `point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `charging_station_idcharging_station` varchar(50) NOT NULL,
  `user_username` varchar(45) NOT NULL,
  `comment` varchar(120) NOT NULL,
  `date` date NOT NULL,
  `point` int NOT NULL,
  PRIMARY KEY (`charging_station_idcharging_station`,`user_username`,`date`),
  KEY `fk_report_user1_idx` (`user_username`),
  CONSTRAINT `fk_report_charging_station1` FOREIGN KEY (`charging_station_idcharging_station`) REFERENCES `charging_station` (`idcharging_station`),
  CONSTRAINT `fk_report_user1` FOREIGN KEY (`user_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES ('380009041345921','spillo','Colonnina all\'interno del parcheggio dell\'ikea, è fuori servizio.','2023-01-06',1),('380009041345921','spillo','Stanno facendo i lavori davanti questa colonnina.','2023-02-03',0),('380009041526479','niko','non funziona','2022-12-07',4),('380009042448796','spillo','niko ha rotto tutto!','2022-12-13',0),('380009042448796','spillo','out of service','2023-02-11',0),('380009042867032','spillo','not available','2023-02-11',0),('380009042909023','spillo','out of service','2023-02-11',0),('380009042914951','niko','fuori servizio','2022-12-07',1),('380009042930649','spillo','sono fuori servizio','2023-01-11',0),('380009042935430','spillo','out of service','2023-02-11',0);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `user_username` varchar(45) NOT NULL,
  `trip_name` varchar(45) NOT NULL,
  PRIMARY KEY (`user_username`,`trip_name`),
  CONSTRAINT `fk_trip_user1` FOREIGN KEY (`user_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip_has_charging_station`
--

DROP TABLE IF EXISTS `trip_has_charging_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip_has_charging_station` (
  `trip_user_username` varchar(45) NOT NULL,
  `trip_trip_name` varchar(45) NOT NULL,
  `charging_station_idcharging_station` varchar(50) NOT NULL,
  PRIMARY KEY (`trip_user_username`,`trip_trip_name`,`charging_station_idcharging_station`),
  KEY `fk_trip_has_charging_station_charging_station1_idx` (`charging_station_idcharging_station`),
  KEY `fk_trip_has_charging_station_trip1_idx` (`trip_user_username`,`trip_trip_name`),
  CONSTRAINT `fk_trip_has_charging_station_charging_station1` FOREIGN KEY (`charging_station_idcharging_station`) REFERENCES `charging_station` (`idcharging_station`),
  CONSTRAINT `fk_trip_has_charging_station_trip1` FOREIGN KEY (`trip_user_username`, `trip_trip_name`) REFERENCES `trip` (`user_username`, `trip_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip_has_charging_station`
--

LOCK TABLES `trip_has_charging_station` WRITE;
/*!40000 ALTER TABLE `trip_has_charging_station` DISABLE KEYS */;
/*!40000 ALTER TABLE `trip_has_charging_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  `car_car_model` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('matisse','951c4202ebc69207fe8f7a04599dae8a','matisse@mail.it','user','Audi e-tron GT'),('miriana','d8cb78d5b91cf5725381e19dbde9593f','miriana@mail.it','user','Audi e-tron GT'),('nigel','27db41c5450aedffb560ecd99b5538d4','nigel@mail.it','user','Tesla Model S Plaid'),('niko','8e6c71cfc9bbd41e1cac7c01d2482517','niko@spillomail.it','user','Mercedes EQS 450+'),('perla','8a6e994673a6219e81fa6aa8eace93d1','perla@mail.it','business',NULL),('simone','47eb752bac1c08c75e30d9624b3e58b7','simone@mail.it','user','Tesla Model S Plaid'),('spillo','59d3416408001d5506f4bef89e33816e','spillo@spillomail.it','user','Tesla Model S Plaid'),('teo','e827aa1ed78e96a113182dce12143f9f','teo@mail.it','business',NULL),('ulisse','de3be8059cbe234147fd8b281d0fa42c','ulisse@mail.it','business',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-12 10:50:44
