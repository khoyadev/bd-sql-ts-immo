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
-- Table structure for table `agences`
--

DROP TABLE IF EXISTS `agences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agences` (
  `id_agence` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_agence`)
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
-- Table structure for table `appartement`
--

DROP TABLE IF EXISTS `appartement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appartement` (
  `id_appartement` int NOT NULL AUTO_INCREMENT,
  `num_appartement` varchar(100) DEFAULT NULL,
  `nombre_piece` int NOT NULL,
  `surface` varchar(100) DEFAULT NULL,
  `montant` int NOT NULL,
  `id_immeuble` int DEFAULT NULL,
  PRIMARY KEY (`id_appartement`),
  UNIQUE KEY `num_appartement` (`num_appartement`),
  KEY `id_immeuble` (`id_immeuble`),
  CONSTRAINT `appartement_ibfk_1` FOREIGN KEY (`id_immeuble`) REFERENCES `immeuble` (`id_immeuble`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartement`
--

LOCK TABLES `appartement` WRITE;
/*!40000 ALTER TABLE `appartement` DISABLE KEYS */;
/*!40000 ALTER TABLE `appartement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `immeuble`
--

DROP TABLE IF EXISTS `immeuble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `immeuble` (
  `id_immeuble` int NOT NULL AUTO_INCREMENT,
  `num_immeuble` varchar(100) DEFAULT NULL,
  `nombre_piece` int NOT NULL,
  `surface` varchar(100) DEFAULT NULL,
  `montant` int NOT NULL,
  `id_propriete` int DEFAULT NULL,
  PRIMARY KEY (`id_immeuble`),
  UNIQUE KEY `num_immeuble` (`num_immeuble`),
  KEY `id_propriete` (`id_propriete`),
  CONSTRAINT `immeuble_ibfk_1` FOREIGN KEY (`id_propriete`) REFERENCES `propriete` (`id_propriete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `immeuble`
--

LOCK TABLES `immeuble` WRITE;
/*!40000 ALTER TABLE `immeuble` DISABLE KEYS */;
/*!40000 ALTER TABLE `immeuble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magasin`
--

DROP TABLE IF EXISTS `magasin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magasin` (
  `id_magasin` int NOT NULL AUTO_INCREMENT,
  `surface` int NOT NULL,
  `montant` int NOT NULL,
  `id_propriete` int DEFAULT NULL,
  PRIMARY KEY (`id_magasin`),
  KEY `id_propriete` (`id_propriete`),
  CONSTRAINT `magasin_ibfk_1` FOREIGN KEY (`id_propriete`) REFERENCES `propriete` (`id_propriete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magasin`
--

LOCK TABLES `magasin` WRITE;
/*!40000 ALTER TABLE `magasin` DISABLE KEYS */;
/*!40000 ALTER TABLE `magasin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proprietaire`
--

DROP TABLE IF EXISTS `proprietaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proprietaire` (
  `id_proprietaire` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `date_naissance` varchar(100) DEFAULT NULL,
  `lieu_naissance` varchar(100) DEFAULT NULL,
  `sexe` enum('M','F') DEFAULT NULL,
  PRIMARY KEY (`id_proprietaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proprietaire`
--

LOCK TABLES `proprietaire` WRITE;
/*!40000 ALTER TABLE `proprietaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `proprietaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propriete`
--

DROP TABLE IF EXISTS `propriete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propriete` (
  `id_propriete` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `taux_prestation` int NOT NULL,
  PRIMARY KEY (`id_propriete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propriete`
--

LOCK TABLES `propriete` WRITE;
/*!40000 ALTER TABLE `propriete` DISABLE KEYS */;
/*!40000 ALTER TABLE `propriete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propriete_proprietaire`
--

DROP TABLE IF EXISTS `propriete_proprietaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propriete_proprietaire` (
  `id_propriete_proprietaire` int NOT NULL AUTO_INCREMENT,
  `id_propriete` int DEFAULT NULL,
  `id_proprietaire` int DEFAULT NULL,
  PRIMARY KEY (`id_propriete_proprietaire`),
  KEY `id_propriete` (`id_propriete`),
  KEY `id_proprietaire` (`id_proprietaire`),
  CONSTRAINT `propriete_proprietaire_ibfk_1` FOREIGN KEY (`id_propriete`) REFERENCES `propriete` (`id_propriete`),
  CONSTRAINT `propriete_proprietaire_ibfk_2` FOREIGN KEY (`id_proprietaire`) REFERENCES `proprietaire` (`id_proprietaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propriete_proprietaire`
--

LOCK TABLES `propriete_proprietaire` WRITE;
/*!40000 ALTER TABLE `propriete_proprietaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `propriete_proprietaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio`
--

DROP TABLE IF EXISTS `studio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studio` (
  `id_studio` int NOT NULL AUTO_INCREMENT,
  `num_studio` varchar(100) DEFAULT NULL,
  `nombre_piece` int NOT NULL,
  `surface` varchar(100) DEFAULT NULL,
  `montant` int NOT NULL,
  `id_immeuble` int DEFAULT NULL,
  PRIMARY KEY (`id_studio`),
  UNIQUE KEY `num_studio` (`num_studio`),
  KEY `id_immeuble` (`id_immeuble`),
  CONSTRAINT `studio_ibfk_1` FOREIGN KEY (`id_immeuble`) REFERENCES `immeuble` (`id_immeuble`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio`
--

LOCK TABLES `studio` WRITE;
/*!40000 ALTER TABLE `studio` DISABLE KEYS */;
/*!40000 ALTER TABLE `studio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `villa`
--

DROP TABLE IF EXISTS `villa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `villa` (
  `id_villa` int NOT NULL AUTO_INCREMENT,
  `nom_villa` int NOT NULL,
  `nombre_piece` int NOT NULL,
  `surface` int NOT NULL,
  `montant` int NOT NULL,
  `id_propriete` int DEFAULT NULL,
  PRIMARY KEY (`id_villa`),
  KEY `id_propriete` (`id_propriete`),
  CONSTRAINT `villa_ibfk_1` FOREIGN KEY (`id_propriete`) REFERENCES `propriete` (`id_propriete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villa`
--

LOCK TABLES `villa` WRITE;
/*!40000 ALTER TABLE `villa` DISABLE KEYS */;
/*!40000 ALTER TABLE `villa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-24 11:04:01
