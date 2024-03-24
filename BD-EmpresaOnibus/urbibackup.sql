-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: urbi
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `urbi`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `urbi` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `urbi`;

--
-- Table structure for table `motorista`
--

DROP TABLE IF EXISTS `motorista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motorista` (
  `idMotorista` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idMotorista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motorista`
--

LOCK TABLES `motorista` WRITE;
/*!40000 ALTER TABLE `motorista` DISABLE KEYS */;
INSERT INTO `motorista` (`idMotorista`, `nome`, `cpf`, `telefone`) VALUES (1,'Fábio','20202020','123456789'),(2,'Marcelo','303030','234569871'),(3,'Neilton','404040','356498721');
/*!40000 ALTER TABLE `motorista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rota`
--

DROP TABLE IF EXISTS `rota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rota` (
  `idRota` int(11) NOT NULL,
  `origem` varchar(255) DEFAULT NULL,
  `destino` varchar(255) DEFAULT NULL,
  `distancia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rota`
--

LOCK TABLES `rota` WRITE;
/*!40000 ALTER TABLE `rota` DISABLE KEYS */;
INSERT INTO `rota` (`idRota`, `origem`, `destino`, `distancia`) VALUES (1,'Brasília','São Paulo',873),(2,'Recanto das Emas','Sobradinho',47),(3,'Taguatinga','Santa Maria',32);
/*!40000 ALTER TABLE `rota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viagem`
--

DROP TABLE IF EXISTS `viagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viagem` (
  `idViagem` int(11) NOT NULL,
  `dataViagem` date DEFAULT NULL,
  `horaPartida` time DEFAULT NULL,
  `Motorista_idMotorista` int(11) NOT NULL,
  `Rota_idRota` int(11) NOT NULL,
  `Ônibus_idÔnibus` int(11) NOT NULL,
  PRIMARY KEY (`idViagem`),
  KEY `fk_Viagem_Motorista1_idx` (`Motorista_idMotorista`),
  KEY `fk_Viagem_Rota1_idx` (`Rota_idRota`),
  KEY `fk_Viagem_Ônibus1_idx` (`Ônibus_idÔnibus`),
  CONSTRAINT `fk_Viagem_Motorista1` FOREIGN KEY (`Motorista_idMotorista`) REFERENCES `motorista` (`idMotorista`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Viagem_Rota1` FOREIGN KEY (`Rota_idRota`) REFERENCES `rota` (`idRota`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Viagem_Ônibus1` FOREIGN KEY (`Ônibus_idÔnibus`) REFERENCES `ônibus` (`idÔnibus`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viagem`
--

LOCK TABLES `viagem` WRITE;
/*!40000 ALTER TABLE `viagem` DISABLE KEYS */;
INSERT INTO `viagem` (`idViagem`, `dataViagem`, `horaPartida`, `Motorista_idMotorista`, `Rota_idRota`, `Ônibus_idÔnibus`) VALUES (1,'2023-12-20','15:15:00',1,1,1),(2,'2024-02-11','07:30:00',2,2,2),(3,'2024-03-12','08:30:00',3,3,3);
/*!40000 ALTER TABLE `viagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ônibus`
--

DROP TABLE IF EXISTS `ônibus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ônibus` (
  `idÔnibus` int(11) NOT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `placa` varchar(15) DEFAULT NULL,
  `anoFabricacao` year(4) DEFAULT NULL,
  PRIMARY KEY (`idÔnibus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ônibus`
--

LOCK TABLES `ônibus` WRITE;
/*!40000 ALTER TABLE `ônibus` DISABLE KEYS */;
INSERT INTO `ônibus` (`idÔnibus`, `modelo`, `placa`, `anoFabricacao`) VALUES (1,'AEC','1234567',2013),(2,'ASC','235614',2019),(3,'ALASA','632541',2007);
/*!40000 ALTER TABLE `ônibus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-05 21:12:54
