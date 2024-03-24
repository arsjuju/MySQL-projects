-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Clinica
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
-- Current Database: `Clinica`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `clinica` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `Clinica`;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta` (
  `idConsulta` int(11) NOT NULL,
  `DataConsulta` date DEFAULT NULL,
  `HoraConsulta` time DEFAULT NULL,
  `Observacoes` text DEFAULT NULL,
  `Paciente_idPaciente` int(11) NOT NULL,
  `Medico_idMedico` int(11) NOT NULL,
  PRIMARY KEY (`idConsulta`),
  KEY `fk_Consulta_Paciente_idx` (`Paciente_idPaciente`),
  KEY `fk_Consulta_Medico1_idx` (`Medico_idMedico`),
  CONSTRAINT `fk_Consulta_Medico1` FOREIGN KEY (`Medico_idMedico`) REFERENCES `medico` (`idMedico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Consulta_Paciente` FOREIGN KEY (`Paciente_idPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` (`idConsulta`, `DataConsulta`, `HoraConsulta`, `Observacoes`, `Paciente_idPaciente`, `Medico_idMedico`) VALUES (1,'2023-12-05','15:00:00','Suspeita de Pneumonia',1,1),(2,'2023-12-20','09:00:00','Paciente com Depressão, familiares são um assunto sensível',2,2),(3,'2024-01-04','16:00:00','Miopia e Astigmatismo, Grau: 6',3,3);
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exame`
--

DROP TABLE IF EXISTS `exame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exame` (
  `idExame` int(11) NOT NULL,
  `TipoExame` varchar(45) DEFAULT NULL,
  `Resultado` text DEFAULT NULL,
  `Observacoes` varchar(45) DEFAULT NULL,
  `Medico_idMedico` int(11) NOT NULL,
  `Paciente_idPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idExame`),
  KEY `fk_Exame_Medico1_idx` (`Medico_idMedico`),
  KEY `fk_Exame_Paciente1_idx` (`Paciente_idPaciente`),
  CONSTRAINT `fk_Exame_Medico1` FOREIGN KEY (`Medico_idMedico`) REFERENCES `medico` (`idMedico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Exame_Paciente1` FOREIGN KEY (`Paciente_idPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exame`
--

LOCK TABLES `exame` WRITE;
/*!40000 ALTER TABLE `exame` DISABLE KEYS */;
INSERT INTO `exame` (`idExame`, `TipoExame`, `Resultado`, `Observacoes`, `Medico_idMedico`, `Paciente_idPaciente`) VALUES (1,'Exame de Raio-X do Tórax','Positivo Pneumonia','Paciente com a doença estabilizada no momento',1,1),(2,'Avaliação Psicológica','Positivo Depressão e Ansiedade','Paciente com pensamentos suicidas',2,2),(3,'Exame de Refração Ocular','Grau Miopia: 6, Grau Astigmatismo: 1,50','Paciente com o grau aumentando frequentemente',3,3);
/*!40000 ALTER TABLE `exame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico` (
  `idMedico` int(11) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Especialidade` varchar(45) DEFAULT NULL,
  `CRM` varchar(45) DEFAULT NULL,
  `Telefone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMedico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` (`idMedico`, `Nome`, `Especialidade`, `CRM`, `Telefone`) VALUES (1,'Antônio','Pediatra','7758','987564133'),(2,'Rafaela','Psicóloga','4489','956987423'),(3,'José','Oftalmologista','2247','966358742');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `idPaciente` int(11) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `DataNascimento` date DEFAULT NULL,
  `Sexo` varchar(45) DEFAULT NULL,
  `Endereco` varchar(250) DEFAULT NULL,
  `Telefone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPaciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` (`idPaciente`, `Nome`, `DataNascimento`, `Sexo`, `Endereco`, `Telefone`) VALUES (1,'Enzo','2016-07-06','Masculino','Q 200 Conjunto 4 Ceilândia','987458265'),(2,'Yasmin','2006-05-12','Feminino','Q 204 Conjunto 2 Recanto das Emas','977456321'),(3,'Maria','0000-00-00','Feminino','QS 8 Pistão Sul','9875564223');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-02 14:13:28
