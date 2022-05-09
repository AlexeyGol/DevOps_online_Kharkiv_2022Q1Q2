-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: devopswinter2022
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

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
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `division` (
  `division` varchar(15) NOT NULL,
  `super_num` int DEFAULT NULL,
  `location` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`division`),
  KEY `super_num` (`super_num`),
  CONSTRAINT `division_ibfk_1` FOREIGN KEY (`super_num`) REFERENCES `employee` (`empl_num`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES ('A101',1,'Kharkiv'),('A102',2,'Kharkiv'),('A103',3,'Kiev'),('A104',4,'Dnepr'),('A105',5,'Odessa');
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `empl_num` int NOT NULL,
  `surname` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `date_of_hire` date DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `division` varchar(20) DEFAULT NULL,
  `super_num` int DEFAULT NULL,
  PRIMARY KEY (`empl_num`),
  KEY `super_num` (`super_num`),
  KEY `division` (`division`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`super_num`) REFERENCES `employee` (`empl_num`) ON DELETE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`division`) REFERENCES `division` (`division`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Risoviy','Alex','1978-05-05','2008-10-22','M',115000,'A101',NULL),(2,'Krasovicky','Ruslan','1990-09-25','2021-10-22','M',90000,'A102',1),(3,'Gladkaya','Elena','1992-10-11','2022-02-22','F',98500,'A103',2),(4,'Osnovanskaya','Renata','1989-06-15','2016-07-24','F',86000,'A104',1),(5,'Stolko','Maksim','1991-07-18','2018-04-14','M',60000,'A105',4),(6,'Karnayx','Aleksandra','1990-01-11','2016-08-11','F',70000,'A103',3),(7,'Zelen','Michail','1988-02-15','2018-11-02','M',44000,'A104',4),(8,'Kapelyh','Aleksandr','1991-04-25','2019-01-12','M',82000,'A103',3);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `client_id` int NOT NULL,
  `project_id` varchar(15) NOT NULL,
  `super_num` int DEFAULT NULL,
  `division` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`client_id`,`project_id`),
  KEY `super_num` (`super_num`),
  KEY `division` (`division`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`super_num`) REFERENCES `employee` (`empl_num`) ON DELETE SET NULL,
  CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`division`) REFERENCES `division` (`division`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (7754317,'project1',1,'A101'),(7754318,'superproject',1,'A101'),(7754319,'project_sale',2,'A102'),(7754320,'project_NY',3,'A103');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-09  5:31:27
