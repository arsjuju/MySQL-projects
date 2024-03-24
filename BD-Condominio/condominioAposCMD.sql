-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: condominio
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
-- Current Database: `condominio`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `condominio` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `condominio`;

--
-- Table structure for table `morador`
--

DROP TABLE IF EXISTS `morador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `morador` (
  `CPF` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Telefone` int(11) NOT NULL,
  `Unidade_numUnidade` int(11) NOT NULL,
  `dataViagem` date NOT NULL DEFAULT '2023-05-12',
  PRIMARY KEY (`CPF`),
  KEY `fk_Morador_Unidade_idx` (`Unidade_numUnidade`),
  CONSTRAINT `fk_Morador_Unidade` FOREIGN KEY (`Unidade_numUnidade`) REFERENCES `unidade` (`numUnidade`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `morador`
--

LOCK TABLES `morador` WRITE;
/*!40000 ALTER TABLE `morador` DISABLE KEYS */;
INSERT INTO `morador` (`CPF`, `Nome`, `Telefone`, `Unidade_numUnidade`, `dataViagem`) VALUES (555555555,'Renato',125896347,3,'2024-02-12');
/*!40000 ALTER TABLE `morador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos`
--

DROP TABLE IF EXISTS `servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicos` (
  `Descricao` varchar(45) NOT NULL,
  `Data` date NOT NULL,
  `Valor` double NOT NULL,
  `Unidade_numUnidade` int(11) NOT NULL,
  PRIMARY KEY (`Descricao`),
  KEY `fk_Servicos_Unidade1_idx` (`Unidade_numUnidade`),
  CONSTRAINT `fk_Servicos_Unidade1` FOREIGN KEY (`Unidade_numUnidade`) REFERENCES `unidade` (`numUnidade`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos`
--

LOCK TABLES `servicos` WRITE;
/*!40000 ALTER TABLE `servicos` DISABLE KEYS */;
INSERT INTO `servicos` (`Descricao`, `Data`, `Valor`, `Unidade_numUnidade`) VALUES ('Avaliação de Riscos','2024-01-01',150,3),('Limpeza Profunda','2023-11-30',350,1),('Manutenção Preventiva','2023-12-07',750,2);
/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sindico`
--

DROP TABLE IF EXISTS `sindico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sindico` (
  `CPF` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Telefone` int(11) NOT NULL,
  PRIMARY KEY (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sindico`
--

LOCK TABLES `sindico` WRITE;
/*!40000 ALTER TABLE `sindico` DISABLE KEYS */;
INSERT INTO `sindico` (`CPF`, `Nome`, `Telefone`) VALUES (111111111,'Daniel',123456789),(222222222,'Roberta',234567891),(333333333,'Lucio',987456321);
/*!40000 ALTER TABLE `sindico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade`
--

DROP TABLE IF EXISTS `unidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidade` (
  `numUnidade` int(11) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `proprietario` varchar(45) NOT NULL,
  `Sindico_CPF` int(11) NOT NULL,
  PRIMARY KEY (`numUnidade`),
  KEY `fk_Unidade_Sindico1_idx` (`Sindico_CPF`),
  CONSTRAINT `fk_Unidade_Sindico1` FOREIGN KEY (`Sindico_CPF`) REFERENCES `sindico` (`CPF`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade`
--

LOCK TABLES `unidade` WRITE;
/*!40000 ALTER TABLE `unidade` DISABLE KEYS */;
INSERT INTO `unidade` (`numUnidade`, `endereco`, `proprietario`, `Sindico_CPF`) VALUES (1,'A01','Rebeca',111111111),(2,'C03','Regina',333333333),(3,'B01','Renato',222222222);
/*!40000 ALTER TABLE `unidade` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-04 21:56:03
