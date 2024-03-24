-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: floricultura
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
-- Current Database: `floricultura`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `floricultura` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `floricultura`;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `Funcionario_matricula` int(11) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  KEY `fk_Cliente_Funcionario_idx` (`Funcionario_matricula`),
  CONSTRAINT `fk_Cliente_Funcionario` FOREIGN KEY (`Funcionario_matricula`) REFERENCES `funcionario` (`matricula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`idCliente`, `cpf`, `nome`, `Funcionario_matricula`) VALUES (1,'11111111111','Pedro da Silva',101010),(2,'22222222222','Luis Gomes',202020),(3,'33333333333','Maria de Jesus',303030);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `Cliente_idCliente` int(11) NOT NULL,
  `Flores_idFlores` int(11) NOT NULL,
  PRIMARY KEY (`Cliente_idCliente`,`Flores_idFlores`),
  KEY `fk_Cliente_has_Flores_Flores1_idx` (`Flores_idFlores`),
  KEY `fk_Cliente_has_Flores_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_Cliente_has_Flores_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Cliente_has_Flores_Flores1` FOREIGN KEY (`Flores_idFlores`) REFERENCES `flores` (`idFlores`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` (`Cliente_idCliente`, `Flores_idFlores`) VALUES (2,3),(3,4);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribuicao`
--

DROP TABLE IF EXISTS `distribuicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribuicao` (
  `Flores_idFlores` int(11) NOT NULL,
  `Fornecedor_idFornecedor` int(11) NOT NULL,
  PRIMARY KEY (`Flores_idFlores`,`Fornecedor_idFornecedor`),
  KEY `fk_Flores_has_Fornecedor_Fornecedor1_idx` (`Fornecedor_idFornecedor`),
  KEY `fk_Flores_has_Fornecedor_Flores1_idx` (`Flores_idFlores`),
  CONSTRAINT `fk_Flores_has_Fornecedor_Flores1` FOREIGN KEY (`Flores_idFlores`) REFERENCES `flores` (`idFlores`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Flores_has_Fornecedor_Fornecedor1` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribuicao`
--

LOCK TABLES `distribuicao` WRITE;
/*!40000 ALTER TABLE `distribuicao` DISABLE KEYS */;
INSERT INTO `distribuicao` (`Flores_idFlores`, `Fornecedor_idFornecedor`) VALUES (3,2),(4,1);
/*!40000 ALTER TABLE `distribuicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregas`
--

DROP TABLE IF EXISTS `entregas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entregas` (
  `idEntregas` int(11) NOT NULL,
  `produto` varchar(45) NOT NULL,
  `local` varchar(45) NOT NULL,
  `Funcionario_matricula` int(11) NOT NULL,
  `dataViagem` date NOT NULL DEFAULT '2023-12-05',
  PRIMARY KEY (`idEntregas`),
  KEY `fk_Entregas_Funcionario1_idx` (`Funcionario_matricula`),
  CONSTRAINT `fk_Entregas_Funcionario1` FOREIGN KEY (`Funcionario_matricula`) REFERENCES `funcionario` (`matricula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas`
--

LOCK TABLES `entregas` WRITE;
/*!40000 ALTER TABLE `entregas` DISABLE KEYS */;
INSERT INTO `entregas` (`idEntregas`, `produto`, `local`, `Funcionario_matricula`, `dataViagem`) VALUES (1,'Rosas','Rua 5 casa 5',101010,'2023-12-05'),(2,'margarida','Rua 6 casa 7',202020,'2023-12-05'),(3,'Orquidea','Rua 7 casa 6',303030,'2023-12-05');
/*!40000 ALTER TABLE `entregas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flores`
--

DROP TABLE IF EXISTS `flores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flores` (
  `idFlores` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `valorVenda` double DEFAULT NULL,
  PRIMARY KEY (`idFlores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flores`
--

LOCK TABLES `flores` WRITE;
/*!40000 ALTER TABLE `flores` DISABLE KEYS */;
INSERT INTO `flores` (`idFlores`, `nome`, `valorVenda`) VALUES (3,'Tulipas',25.5),(4,'Margaridas',25.1);
/*!40000 ALTER TABLE `flores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `Funcionario_matricula` int(11) NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  KEY `fk_Fornecedor_Funcionario1_idx` (`Funcionario_matricula`),
  CONSTRAINT `fk_Fornecedor_Funcionario1` FOREIGN KEY (`Funcionario_matricula`) REFERENCES `funcionario` (`matricula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` (`idFornecedor`, `nome`, `telefone`, `Funcionario_matricula`) VALUES (1,'Flores do Sul','3005-6622',101010),(2,'Terra das Flores','2010-2255',101010),(3,'Magia das Flores','5544-7788',202020);
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` (`matricula`, `nome`, `endereco`) VALUES (101010,'Eric Oliveira','Rua 1 casa 2'),(202020,'Laura da Silva','Rua 2 casa 1'),(303030,'Felipe de Azevedo','Rua 3 casa 4');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendas` (
  `Flores_idFlores` int(11) NOT NULL,
  `Funcionario_matricula` int(11) NOT NULL,
  PRIMARY KEY (`Flores_idFlores`,`Funcionario_matricula`),
  KEY `fk_Flores_has_Funcionario_Funcionario1_idx` (`Funcionario_matricula`),
  KEY `fk_Flores_has_Funcionario_Flores1_idx` (`Flores_idFlores`),
  CONSTRAINT `fk_Flores_has_Funcionario_Flores1` FOREIGN KEY (`Flores_idFlores`) REFERENCES `flores` (`idFlores`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Flores_has_Funcionario_Funcionario1` FOREIGN KEY (`Funcionario_matricula`) REFERENCES `funcionario` (`matricula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` (`Flores_idFlores`, `Funcionario_matricula`) VALUES (3,303030),(4,101010);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-06 11:39:13
