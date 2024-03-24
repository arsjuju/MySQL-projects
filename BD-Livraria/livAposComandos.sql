-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: livraria
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
-- Current Database: `livraria`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `livraria` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `livraria`;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autor` (
  `idAutor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `nacionalidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idAutor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` (`idAutor`, `nome`, `nacionalidade`) VALUES (1,'Daniel','Brasileiro'),(2,'Janaína','Brasileira'),(3,'Ketlen','Brasileira');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`idCliente`, `nome`, `endereco`, `email`) VALUES (1,'Fernando','Ceilândia','fernandocontato@gmail.com'),(2,'Micaella','Recanto das Emas','raposas1234@gmail.com'),(3,'Victor','Recife','krovictor@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editora`
--

DROP TABLE IF EXISTS `editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editora` (
  `idEditora` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `localizacao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idEditora`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` (`idEditora`, `nome`, `localizacao`) VALUES (1,'Saraiva','São Paulo'),(2,'Leitura','Distrito Federal'),(3,'Recanto dos Livros','Asa Sul');
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `idFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `dataViagem` date NOT NULL DEFAULT '2023-06-12',
  PRIMARY KEY (`idFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` (`idFuncionario`, `nome`, `cargo`, `dataViagem`) VALUES (1,'André','Vendedor de Livros','2023-12-15'),(2,'Jacob','Recepcionista em Livraria','2023-12-15'),(3,'Juliana','Gerente de Livraria','2023-12-15');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livro` (
  `ISBN` varchar(20) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `anoPublicacao` int(11) DEFAULT NULL,
  `preco` int(11) DEFAULT NULL,
  `Autor_idAutor` int(11) NOT NULL,
  `Editora_idEditora` int(11) NOT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `fk_Livro_Autor1_idx` (`Autor_idAutor`),
  KEY `fk_Livro_Editora1_idx` (`Editora_idEditora`),
  CONSTRAINT `fk_Livro_Autor1` FOREIGN KEY (`Autor_idAutor`) REFERENCES `autor` (`idAutor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Livro_Editora1` FOREIGN KEY (`Editora_idEditora`) REFERENCES `editora` (`idEditora`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` (`ISBN`, `titulo`, `anoPublicacao`, `preco`, `Autor_idAutor`, `Editora_idEditora`) VALUES ('853591112X','O Menino do Pijama Listrado',2007,38,2,1);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `numeroPedido` int(11) NOT NULL AUTO_INCREMENT,
  `dataPedido` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `clienteID` int(11) NOT NULL,
  `funcionarioID` int(11) NOT NULL,
  PRIMARY KEY (`numeroPedido`),
  KEY `fk_Pedido_Cliente1` (`clienteID`),
  KEY `fk_Pedido_Funcionario1` (`funcionarioID`),
  CONSTRAINT `fk_Pedido_Cliente1` FOREIGN KEY (`clienteID`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Pedido_Funcionario1` FOREIGN KEY (`funcionarioID`) REFERENCES `funcionario` (`idFuncionario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` (`numeroPedido`, `dataPedido`, `total`, `clienteID`, `funcionarioID`) VALUES (1,'2023-12-01',43,3,1),(2,'2023-12-24',51,2,1),(3,'2024-01-03',38,1,1);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_livro`
--

DROP TABLE IF EXISTS `pedido_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido_livro` (
  `numeroPedido` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`numeroPedido`,`ISBN`),
  KEY `fk_Pedido_Livro_Livro1` (`ISBN`),
  CONSTRAINT `fk_Pedido_Livro_Livro1` FOREIGN KEY (`ISBN`) REFERENCES `livro` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Pedido_Livro_Pedido1` FOREIGN KEY (`numeroPedido`) REFERENCES `pedido` (`numeroPedido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_livro`
--

LOCK TABLES `pedido_livro` WRITE;
/*!40000 ALTER TABLE `pedido_livro` DISABLE KEYS */;
INSERT INTO `pedido_livro` (`numeroPedido`, `ISBN`, `quantidade`) VALUES (3,'853591112X',1);
/*!40000 ALTER TABLE `pedido_livro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-04 21:08:47
