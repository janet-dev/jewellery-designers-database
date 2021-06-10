-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: silversmithUK
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `title` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `building_number` varchar(5) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `country` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Red','Mike','Mr','mike.red@gmail.com','44 7870 133426','5','Bristol','BS1 2TD','UK'),(2,'Green','Andrea','Ms','agreen@hotmail.com','44 7442 923458','448','London','E17 6XS','UK'),(3,'Blue','Janet','Miss','blue-spike@gmail.com','44 7871 121166','365','Dudley','DY11 4HK','UK'),(4,'Purple','Fred','Ms','purple-fred@outlook.com','44 7438 802322','12','London','SW2 5GB','UK'),(5,'Magenta','Sami','Ms','magentas@yahoo.com','44 7221 802322','24','York','YK21 0IE','UK'),(6,'Ochre','Jake','Mr','jochre@mail.com','38 7734 219023','31','Koln','55322','Germany'),(7,'Yellow','Mariam','Dr','yellow-mar@aol.com','44 7557 212596','60','Swansea','SN21 5CZ','UK'),(8,'Blue','Helen','Mrs','helen_blue@hotmail.com','44 7871 702618','112','Ely','CB21 8NL','UK'),(9,'Orange','Becca','Miss','bex.orange@hello.com','44 7973 159427','6b','Glasgow','G7 2FB','UK'),(10,'Orange','Steve','Mr','sorange@take.com','44 7973 159426','6b','Glasgow','G7 2FB','UK'),(11,'Pink','Val','Mrs','pinkie@free.com','44 7823 359352','87','Berwick','BW7 9TW','UK');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_customer_update` BEFORE UPDATE ON `customer` FOR EACH ROW INSERT INTO customer_audit
 SET action = 'update',
     building_number = OLD.building_number,
     city = OLD.city,
     postcode = OLD.postcode,
     changedat = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer_audit`
--

DROP TABLE IF EXISTS `customer_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_audit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `building_number` varchar(5) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `changedat` datetime DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_audit`
--

LOCK TABLES `customer_audit` WRITE;
/*!40000 ALTER TABLE `customer_audit` DISABLE KEYS */;
INSERT INTO `customer_audit` VALUES (1,'42','Dundee','DD1 1DB','2021-06-07 15:28:05','update'),(2,'42','Dundee','DD1 1DB','2021-06-07 15:30:05','update'),(3,'6b','Glasgow','G7 2FB','2021-06-07 15:32:18','update'),(4,'6b','Glasgow','G7 2FB','2021-06-07 15:32:37','update'),(5,'42','Dundee','DD1 1DB','2021-06-07 15:32:47','update');
/*!40000 ALTER TABLE `customer_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_inv`
--

DROP TABLE IF EXISTS `customer_inv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_inv` (
  `bill` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `purchase` int NOT NULL,
  `amount` float NOT NULL,
  `period` varchar(3) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `refund` tinyint(1) NOT NULL,
  PRIMARY KEY (`bill`),
  KEY `fk_id` (`id`),
  KEY `fk_purchase` (`purchase`),
  CONSTRAINT `fk_id` FOREIGN KEY (`id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_purchase` FOREIGN KEY (`purchase`) REFERENCES `stock` (`SKU`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_inv`
--

LOCK TABLES `customer_inv` WRITE;
/*!40000 ALTER TABLE `customer_inv` DISABLE KEYS */;
INSERT INTO `customer_inv` VALUES (1,8,5,55,'jan',1,0),(2,1,1,135,'feb',0,0),(3,5,9,25,'feb',1,0),(4,4,11,56,'mar',1,0),(5,11,19,12,'apr',1,0),(6,6,3,90,'apr',1,0),(7,2,14,30,'may',1,1),(8,1,13,72,'may',0,0),(9,4,16,20,'jun',1,0),(10,10,18,12,'jun',1,0),(11,7,10,15,'oct',1,0),(12,7,6,20,'dec',1,0),(13,9,8,30,'dec',1,0),(14,3,12,60,'dec',1,0);
/*!40000 ALTER TABLE `customer_inv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `design`
--

DROP TABLE IF EXISTS `design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `design` (
  `id` int NOT NULL AUTO_INCREMENT,
  `SKU` int DEFAULT NULL,
  `Category` varchar(50) NOT NULL,
  `Base` varchar(20) NOT NULL,
  `Purity` int DEFAULT NULL,
  `Finish` varchar(20) DEFAULT NULL,
  `Gems` varchar(20) DEFAULT NULL,
  `Recycled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_SKU` (`SKU`),
  CONSTRAINT `fk_SKU` FOREIGN KEY (`SKU`) REFERENCES `stock` (`SKU`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design`
--

LOCK TABLES `design` WRITE;
/*!40000 ALTER TABLE `design` DISABLE KEYS */;
INSERT INTO `design` VALUES (1,16,'Earrings','Silver',925,'Acrylic',NULL,1),(2,20,'Earrings','Silver',925,'Acrylic',NULL,1),(3,17,'Earrings','Aluminium',0,'Original',NULL,1),(4,6,'Bangle','Perspex',0,'Texture',NULL,1),(5,12,'Brooch','Copper',0,'Enamel',NULL,0),(6,4,'Bangle','Silver',925,'Texture','Glass',1),(7,13,'Necklace','Silver',925,'Brush',NULL,1),(8,18,'Earrings','Aluminium',0,'Original',NULL,1),(9,19,'Earrings','Aluminium',0,'Original',NULL,1),(10,15,'Earrings','Silver',925,'Brush',NULL,1),(11,14,'Earrings','Gold',10,'Brush','Gold',1),(12,5,'Bangle','Silver',925,'Texture',NULL,1),(13,7,'Pendant','Silver',925,'Acrylic',NULL,0),(14,11,'Pendant','Copper',0,'Enamel',NULL,0),(15,10,'Pendant','Copper',0,'Texture',NULL,0),(16,1,'Ring','Silver',925,'Mirror','Blue Topaz',0),(17,3,'Ring','Silver',925,'Brush','Orange CZ',0),(18,8,'Pendant','Silver',999,'Texture',NULL,1),(19,9,'Pendant','Perspex',0,'Mirror',NULL,0),(20,2,'Ring','Silver',925,'Texture',NULL,1);
/*!40000 ALTER TABLE `design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nonPayment`
--

DROP TABLE IF EXISTS `nonPayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nonPayment` (
  `surname` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `title` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nonPayment`
--

LOCK TABLES `nonPayment` WRITE;
/*!40000 ALTER TABLE `nonPayment` DISABLE KEYS */;
INSERT INTO `nonPayment` VALUES ('Red','Mike','Mr','mike.red@gmail.com','44 7870 133426'),('Red','Mike','Mr','mike.red@gmail.com','44 7870 133426'),('Red','Mike','Mr','mike.red@gmail.com','44 7870 133426');
/*!40000 ALTER TABLE `nonPayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `SKU` int NOT NULL AUTO_INCREMENT,
  `Item` varchar(50) NOT NULL,
  `Shop` varchar(50) NOT NULL,
  `Price` float NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`SKU`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'Silver Tension Ring','website',135,3),(2,'Silver Adjustible Ring','website',15,1),(3,'Silver Collet Set Ring','website',90,1),(4,'Silver Adjustible Bangle','website',30,4),(5,'Silver Cuff Bangle','website',55,1),(6,'Neon Yellow Cuff Bangle','website',20,6),(7,'Silver Pink Splash Pendant','gallery',30,2),(8,'Pure Silver Abstract Pendant','website',30,3),(9,'Neon Pink Orange Eve Pendant','website',25,1),(10,'Copper Domed Pendant','website',15,7),(11,'Snow Flowers Enamelled Pendant','gallery',56,1),(12,'Domed Enamelled Red Abstract Brooch','gallery',60,1),(13,'Handmade Silver Chain','gallery',72,1),(14,'10ct Gold Casting Grain Studs','gallery',30,1),(15,'Silver Unisex Circle Studs','gallery',15,3),(16,'Pink Circle Studs','gallery',20,1),(17,'Upcycled Brew Dog Blue Earrings','Warwick',12,5),(18,'Upcycled Brew Dog Purple Earrings','Warwick',12,1),(19,'Upcycled Brew Dog Green Earrings','Warwick',12,2),(20,'Black & White Unisex Cube Studs','website',15,2);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `ref` int NOT NULL AUTO_INCREMENT,
  `company` varchar(50) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `base` varchar(50) DEFAULT NULL,
  `coating` varchar(50) DEFAULT NULL,
  `stones` varchar(50) DEFAULT NULL,
  `readyMade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Cooksongold','UK','Silver',NULL,NULL,NULL),(2,'Cooksongold','UK','Gold',NULL,NULL,NULL),(3,'Cooksongold','UK',NULL,NULL,NULL,'Chain'),(4,'Kernow Craft','UK',NULL,NULL,'Gems',NULL),(5,'Kernow Craft','UK','Copper',NULL,NULL,NULL),(6,'Amazon','UK',NULL,NULL,NULL,'Findings'),(7,'Amazon','UK',NULL,'Acrylic',NULL,NULL),(8,'Warm Glass','UK',NULL,NULL,'Glass',NULL),(9,'Warm Glass','UK',NULL,'Enamel',NULL,NULL),(10,'Green Cast','Italy','Perspex',NULL,NULL,NULL),(11,'Metal Clay Co','UK','Silver Clay',NULL,NULL,NULL),(12,'Brew Dog','UK','Aluminium',NULL,NULL,NULL);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_inv`
--

DROP TABLE IF EXISTS `supplier_inv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_inv` (
  `invoice` int NOT NULL AUTO_INCREMENT,
  `ref` int NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `refund` tinyint(1) NOT NULL,
  PRIMARY KEY (`invoice`),
  KEY `fk_ref` (`ref`),
  CONSTRAINT `fk_ref` FOREIGN KEY (`ref`) REFERENCES `supplier` (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_inv`
--

LOCK TABLES `supplier_inv` WRITE;
/*!40000 ALTER TABLE `supplier_inv` DISABLE KEYS */;
INSERT INTO `supplier_inv` VALUES (1,8,155.00,1,0),(2,1,1135.00,0,0),(3,5,125.00,1,0),(4,4,157.00,1,0),(5,11,112.00,1,0),(6,6,190.00,1,0),(7,2,130.00,1,1),(8,1,172.00,0,0),(9,4,120.00,1,0),(10,10,112.00,1,0),(11,7,115.00,1,0),(12,7,121.00,1,0),(13,9,256.00,1,0),(14,3,160.00,1,0);
/*!40000 ALTER TABLE `supplier_inv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_customer`
--

DROP TABLE IF EXISTS `vw_customer`;
/*!50001 DROP VIEW IF EXISTS `vw_customer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_customer` AS SELECT 
 1 AS `title`,
 1 AS `first_name`,
 1 AS `surname`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_design`
--

DROP TABLE IF EXISTS `vw_design`;
/*!50001 DROP VIEW IF EXISTS `vw_design`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_design` AS SELECT 
 1 AS `SKU`,
 1 AS `Category`,
 1 AS `Finish`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_stock_design`
--

DROP TABLE IF EXISTS `vw_stock_design`;
/*!50001 DROP VIEW IF EXISTS `vw_stock_design`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_stock_design` AS SELECT 
 1 AS `SKU`,
 1 AS `Shop`,
 1 AS `Category`,
 1 AS `city`,
 1 AS `period`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_customer`
--

/*!50001 DROP VIEW IF EXISTS `vw_customer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customer` AS select `customer`.`title` AS `title`,`customer`.`first_name` AS `first_name`,`customer`.`surname` AS `surname`,`customer`.`email` AS `email` from `customer` where (`customer`.`postcode` like 'G%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_design`
--

/*!50001 DROP VIEW IF EXISTS `vw_design`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_design` AS select `design`.`SKU` AS `SKU`,`design`.`Category` AS `Category`,`design`.`Finish` AS `Finish` from `design` where (`design`.`Recycled` = true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_stock_design`
--

/*!50001 DROP VIEW IF EXISTS `vw_stock_design`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_stock_design` AS select `st`.`SKU` AS `SKU`,`st`.`Shop` AS `Shop`,`d`.`Category` AS `Category`,`c`.`city` AS `city`,`cinv`.`period` AS `period` from (((`customer_inv` `cinv` join `customer` `c` on((`cinv`.`id` = `c`.`id`))) join `stock` `st` on((`cinv`.`purchase` = `st`.`SKU`))) join `design` `d` on((`cinv`.`purchase` = `d`.`SKU`))) where (`d`.`Recycled` = true) order by `cinv`.`period` */;
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

-- Dump completed on 2021-06-09 10:22:48
