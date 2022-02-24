-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: TsImmo
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

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
-- Table structure for table `Villa`
--

DROP TABLE IF EXISTS `Villa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Villa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_villa` int NOT NULL,
  `nombre_piece` int NOT NULL,
  `surface` int NOT NULL,
  `montant` int NOT NULL,
  `id_propriete` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_propriete` (`id_propriete`),
  CONSTRAINT `Villa_ibfk_1` FOREIGN KEY (`id_propriete`) REFERENCES `proprietes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Villa`
--

LOCK TABLES `Villa` WRITE;
/*!40000 ALTER TABLE `Villa` DISABLE KEYS */;
/*!40000 ALTER TABLE `Villa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agences`
--

DROP TABLE IF EXISTS `agences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agences`
--

LOCK TABLES `agences` WRITE;
/*!40000 ALTER TABLE `agences` DISABLE KEYS */;
/*!40000 ALTER TABLE `agences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appartements`
--

DROP TABLE IF EXISTS `appartements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appartements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num_appartement` varchar(100) DEFAULT NULL,
  `nombre_piece` int NOT NULL,
  `surface` varchar(100) DEFAULT NULL,
  `montant` int NOT NULL,
  `id_immeuble` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `num_appartement` (`num_appartement`),
  KEY `id_immeuble` (`id_immeuble`),
  CONSTRAINT `appartements_ibfk_1` FOREIGN KEY (`id_immeuble`) REFERENCES `immeubles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartements`
--

LOCK TABLES `appartements` WRITE;
/*!40000 ALTER TABLE `appartements` DISABLE KEYS */;
/*!40000 ALTER TABLE `appartements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `immeubles`
--

DROP TABLE IF EXISTS `immeubles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `immeubles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num_immeuble` varchar(100) DEFAULT NULL,
  `nombre_piece` int NOT NULL,
  `surface` varchar(100) DEFAULT NULL,
  `montant` int NOT NULL,
  `id_propriete` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `num_immeuble` (`num_immeuble`),
  KEY `id_propriete` (`id_propriete`),
  CONSTRAINT `immeubles_ibfk_1` FOREIGN KEY (`id_propriete`) REFERENCES `proprietes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `immeubles`
--

LOCK TABLES `immeubles` WRITE;
/*!40000 ALTER TABLE `immeubles` DISABLE KEYS */;
/*!40000 ALTER TABLE `immeubles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magasins`
--

DROP TABLE IF EXISTS `magasins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magasins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `surface` int NOT NULL,
  `montant` int NOT NULL,
  `id_propriete` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_propriete` (`id_propriete`),
  CONSTRAINT `magasins_ibfk_1` FOREIGN KEY (`id_propriete`) REFERENCES `proprietes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magasins`
--

LOCK TABLES `magasins` WRITE;
/*!40000 ALTER TABLE `magasins` DISABLE KEYS */;
/*!40000 ALTER TABLE `magasins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proprietaires`
--

DROP TABLE IF EXISTS `proprietaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proprietaires` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `date_naissance` varchar(100) DEFAULT NULL,
  `lieu_naissance` varchar(100) DEFAULT NULL,
  `sexe` enum('M','F') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proprietaires`
--

LOCK TABLES `proprietaires` WRITE;
/*!40000 ALTER TABLE `proprietaires` DISABLE KEYS */;
/*!40000 ALTER TABLE `proprietaires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propriete_proprietaires`
--

DROP TABLE IF EXISTS `propriete_proprietaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propriete_proprietaires` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_propriete` int DEFAULT NULL,
  `id_proprietaire` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_propriete` (`id_propriete`),
  KEY `id_proprietaire` (`id_proprietaire`),
  CONSTRAINT `propriete_proprietaires_ibfk_1` FOREIGN KEY (`id_propriete`) REFERENCES `proprietes` (`id`),
  CONSTRAINT `propriete_proprietaires_ibfk_2` FOREIGN KEY (`id_proprietaire`) REFERENCES `proprietaires` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propriete_proprietaires`
--

LOCK TABLES `propriete_proprietaires` WRITE;
/*!40000 ALTER TABLE `propriete_proprietaires` DISABLE KEYS */;
/*!40000 ALTER TABLE `propriete_proprietaires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proprietes`
--

DROP TABLE IF EXISTS `proprietes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proprietes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `taux_prestation` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proprietes`
--

LOCK TABLES `proprietes` WRITE;
/*!40000 ALTER TABLE `proprietes` DISABLE KEYS */;
/*!40000 ALTER TABLE `proprietes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studios`
--

DROP TABLE IF EXISTS `studios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num_studio` varchar(100) DEFAULT NULL,
  `nombre_piece` int NOT NULL,
  `surface` varchar(100) DEFAULT NULL,
  `montant` int NOT NULL,
  `id_immeuble` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `num_studio` (`num_studio`),
  KEY `id_immeuble` (`id_immeuble`),
  CONSTRAINT `studios_ibfk_1` FOREIGN KEY (`id_immeuble`) REFERENCES `immeubles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studios`
--

LOCK TABLES `studios` WRITE;
/*!40000 ALTER TABLE `studios` DISABLE KEYS */;
/*!40000 ALTER TABLE `studios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-24 10:20:10
