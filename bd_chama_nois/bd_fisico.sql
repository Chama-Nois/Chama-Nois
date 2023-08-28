CREATE DATABASE  IF NOT EXISTS `chama_nois` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `chama_nois`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: chama_nois
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `candidatos`
--

DROP TABLE IF EXISTS `candidatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidatos` (
  `candidato_id` varchar(10) NOT NULL,
  `contratacao_id` varchar(10) DEFAULT NULL,
  `cpf` char(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(13) NOT NULL,
  `email` varchar(100) NOT NULL,
  `rg` varchar(12) NOT NULL,
  PRIMARY KEY (`candidato_id`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `rg` (`rg`),
  KEY `contratacao_id` (`contratacao_id`),
  CONSTRAINT `candidatos_ibfk_1` FOREIGN KEY (`contratacao_id`) REFERENCES `contratacoes` (`contratacao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidatos`
--

LOCK TABLES `candidatos` WRITE;
/*!40000 ALTER TABLE `candidatos` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratacoes`
--

DROP TABLE IF EXISTS `contratacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratacoes` (
  `contratacao_id` varchar(10) NOT NULL,
  `data_inicio` datetime NOT NULL,
  `desempenho` varchar(255) NOT NULL,
  `observações` varchar(255) NOT NULL,
  `beneficios` varchar(255) NOT NULL,
  PRIMARY KEY (`contratacao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratacoes`
--

LOCK TABLES `contratacoes` WRITE;
/*!40000 ALTER TABLE `contratacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `empresa_id` varchar(10) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `cnpj` char(14) NOT NULL,
  `telefone` varchar(13) NOT NULL,
  `email` varchar(100) NOT NULL,
  `horario_inicio` datetime NOT NULL,
  `horario_termino` datetime NOT NULL,
  `avaliacao` varchar(2) NOT NULL,
  PRIMARY KEY (`empresa_id`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas_entregadores`
--

DROP TABLE IF EXISTS `empresas_entregadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas_entregadores` (
  `empresas_entregadores_id` varchar(10) NOT NULL,
  `entregador_id` varchar(10) DEFAULT NULL,
  `empresa_id` varchar(10) DEFAULT NULL,
  `horario_contato` datetime NOT NULL,
  `horario_recebimento` datetime NOT NULL,
  `taxa_entrega` decimal(3,0) NOT NULL,
  PRIMARY KEY (`empresas_entregadores_id`),
  KEY `entregador_id` (`entregador_id`),
  KEY `empresa_id` (`empresa_id`),
  CONSTRAINT `empresas_entregadores_ibfk_1` FOREIGN KEY (`entregador_id`) REFERENCES `entregadores` (`entregador_id`),
  CONSTRAINT `empresas_entregadores_ibfk_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas_entregadores`
--

LOCK TABLES `empresas_entregadores` WRITE;
/*!40000 ALTER TABLE `empresas_entregadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresas_entregadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregadores`
--

DROP TABLE IF EXISTS `entregadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregadores` (
  `entregador_id` varchar(10) NOT NULL,
  `periferia_id` varchar(10) DEFAULT NULL,
  `cpf` char(11) NOT NULL,
  `rg` varchar(12) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(13) NOT NULL,
  `info_veiculo` varchar(100) NOT NULL,
  `avaliacao_media` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`entregador_id`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `rg` (`rg`),
  KEY `periferia_id` (`periferia_id`),
  CONSTRAINT `entregadores_ibfk_1` FOREIGN KEY (`periferia_id`) REFERENCES `periferias` (`periferia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregadores`
--

LOCK TABLES `entregadores` WRITE;
/*!40000 ALTER TABLE `entregadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `entregadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregadores_usuarios`
--

DROP TABLE IF EXISTS `entregadores_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregadores_usuarios` (
  `entregadores_usuarios_id` varchar(10) NOT NULL,
  `usuario_id` varchar(10) DEFAULT NULL,
  `entregador_id` varchar(10) DEFAULT NULL,
  `horario_entrega` datetime NOT NULL,
  `avaliacao` varchar(2) NOT NULL,
  PRIMARY KEY (`entregadores_usuarios_id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `entregador_id` (`entregador_id`),
  CONSTRAINT `entregadores_usuarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`),
  CONSTRAINT `entregadores_usuarios_ibfk_2` FOREIGN KEY (`entregador_id`) REFERENCES `entregadores` (`entregador_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregadores_usuarios`
--

LOCK TABLES `entregadores_usuarios` WRITE;
/*!40000 ALTER TABLE `entregadores_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `entregadores_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menor_aprendiz`
--

DROP TABLE IF EXISTS `menor_aprendiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menor_aprendiz` (
  `menor_aprendiz_id` varchar(10) NOT NULL,
  `periferia_id` varchar(10) DEFAULT NULL,
  `cpf` char(11) NOT NULL,
  `rg` varchar(12) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `idade` char(2) NOT NULL,
  `data_inicio` datetime NOT NULL,
  `escola` varchar(100) NOT NULL,
  `turno_escolar` varchar(5) NOT NULL,
  PRIMARY KEY (`menor_aprendiz_id`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `rg` (`rg`),
  KEY `periferia_id` (`periferia_id`),
  CONSTRAINT `menor_aprendiz_ibfk_1` FOREIGN KEY (`periferia_id`) REFERENCES `periferias` (`periferia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menor_aprendiz`
--

LOCK TABLES `menor_aprendiz` WRITE;
/*!40000 ALTER TABLE `menor_aprendiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `menor_aprendiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oportunidades`
--

DROP TABLE IF EXISTS `oportunidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oportunidades` (
  `oportunidade_id` varchar(10) NOT NULL,
  `cargo` varchar(30) NOT NULL,
  `salario` decimal(7,2) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`oportunidade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidades`
--

LOCK TABLES `oportunidades` WRITE;
/*!40000 ALTER TABLE `oportunidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `oportunidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oportunidades_candidatos`
--

DROP TABLE IF EXISTS `oportunidades_candidatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oportunidades_candidatos` (
  `oportunidades_candidatos_id` varchar(10) NOT NULL,
  `candidato_id` varchar(10) DEFAULT NULL,
  `oportunidade_id` varchar(10) DEFAULT NULL,
  `data_candidatura` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`oportunidades_candidatos_id`),
  KEY `candidato_id` (`candidato_id`),
  KEY `oportunidade_id` (`oportunidade_id`),
  CONSTRAINT `oportunidades_candidatos_ibfk_1` FOREIGN KEY (`candidato_id`) REFERENCES `candidatos` (`candidato_id`),
  CONSTRAINT `oportunidades_candidatos_ibfk_2` FOREIGN KEY (`oportunidade_id`) REFERENCES `oportunidades` (`oportunidade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidades_candidatos`
--

LOCK TABLES `oportunidades_candidatos` WRITE;
/*!40000 ALTER TABLE `oportunidades_candidatos` DISABLE KEYS */;
/*!40000 ALTER TABLE `oportunidades_candidatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oportunidades_contratacoes`
--

DROP TABLE IF EXISTS `oportunidades_contratacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oportunidades_contratacoes` (
  `oportunidades_contratacoes_id` varchar(10) NOT NULL,
  `contratacao_id` varchar(10) DEFAULT NULL,
  `oportunidade_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`oportunidades_contratacoes_id`),
  KEY `contratacao_id` (`contratacao_id`),
  KEY `oportunidade_id` (`oportunidade_id`),
  CONSTRAINT `oportunidades_contratacoes_ibfk_1` FOREIGN KEY (`contratacao_id`) REFERENCES `contratacoes` (`contratacao_id`),
  CONSTRAINT `oportunidades_contratacoes_ibfk_2` FOREIGN KEY (`oportunidade_id`) REFERENCES `oportunidades` (`oportunidade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidades_contratacoes`
--

LOCK TABLES `oportunidades_contratacoes` WRITE;
/*!40000 ALTER TABLE `oportunidades_contratacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oportunidades_contratacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parcerias_externas`
--

DROP TABLE IF EXISTS `parcerias_externas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parcerias_externas` (
  `parcerias_id` varchar(10) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(13) NOT NULL,
  `email` varchar(100) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`parcerias_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parcerias_externas`
--

LOCK TABLES `parcerias_externas` WRITE;
/*!40000 ALTER TABLE `parcerias_externas` DISABLE KEYS */;
/*!40000 ALTER TABLE `parcerias_externas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periferias`
--

DROP TABLE IF EXISTS `periferias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periferias` (
  `periferia_id` varchar(10) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `localizacao` varchar(100) NOT NULL,
  `populacao` bigint(20) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`periferia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periferias`
--

LOCK TABLES `periferias` WRITE;
/*!40000 ALTER TABLE `periferias` DISABLE KEYS */;
/*!40000 ALTER TABLE `periferias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periferias_empresas`
--

DROP TABLE IF EXISTS `periferias_empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periferias_empresas` (
  `periferias_empresas_id` varchar(10) NOT NULL,
  `periferia_id` varchar(10) DEFAULT NULL,
  `empresa_id` varchar(10) DEFAULT NULL,
  `tipo_relacao` varchar(100) NOT NULL,
  PRIMARY KEY (`periferias_empresas_id`),
  KEY `periferia_id` (`periferia_id`),
  KEY `empresa_id` (`empresa_id`),
  CONSTRAINT `periferias_empresas_ibfk_1` FOREIGN KEY (`periferia_id`) REFERENCES `periferias` (`periferia_id`),
  CONSTRAINT `periferias_empresas_ibfk_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periferias_empresas`
--

LOCK TABLES `periferias_empresas` WRITE;
/*!40000 ALTER TABLE `periferias_empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `periferias_empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periferias_oportunidades`
--

DROP TABLE IF EXISTS `periferias_oportunidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periferias_oportunidades` (
  `periferias_oportunidades_id` varchar(10) NOT NULL,
  `periferia_id` varchar(10) DEFAULT NULL,
  `oportunidade_id` varchar(10) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`periferias_oportunidades_id`),
  KEY `periferia_id` (`periferia_id`),
  KEY `oportunidade_id` (`oportunidade_id`),
  CONSTRAINT `periferias_oportunidades_ibfk_1` FOREIGN KEY (`periferia_id`) REFERENCES `periferias` (`periferia_id`),
  CONSTRAINT `periferias_oportunidades_ibfk_2` FOREIGN KEY (`oportunidade_id`) REFERENCES `oportunidades` (`oportunidade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periferias_oportunidades`
--

LOCK TABLES `periferias_oportunidades` WRITE;
/*!40000 ALTER TABLE `periferias_oportunidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `periferias_oportunidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periferias_parcerias`
--

DROP TABLE IF EXISTS `periferias_parcerias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periferias_parcerias` (
  `periferias_parcerias_id` varchar(10) NOT NULL,
  `parcerias_id` varchar(10) DEFAULT NULL,
  `periferia_id` varchar(10) DEFAULT NULL,
  `data_inicio` datetime NOT NULL,
  `benificio` varchar(255) NOT NULL,
  PRIMARY KEY (`periferias_parcerias_id`),
  KEY `parcerias_id` (`parcerias_id`),
  KEY `periferia_id` (`periferia_id`),
  CONSTRAINT `periferias_parcerias_ibfk_1` FOREIGN KEY (`parcerias_id`) REFERENCES `parcerias_externas` (`parcerias_id`),
  CONSTRAINT `periferias_parcerias_ibfk_2` FOREIGN KEY (`periferia_id`) REFERENCES `periferias` (`periferia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periferias_parcerias`
--

LOCK TABLES `periferias_parcerias` WRITE;
/*!40000 ALTER TABLE `periferias_parcerias` DISABLE KEYS */;
/*!40000 ALTER TABLE `periferias_parcerias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `produto_id` varchar(10) NOT NULL,
  `empresa_id` varchar(10) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `preco` decimal(9,2) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `avaliacao` varchar(2) NOT NULL,
  PRIMARY KEY (`produto_id`),
  KEY `empresa_id` (`empresa_id`),
  CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `usuario_id` varchar(10) NOT NULL,
  `periferia_id` varchar(10) DEFAULT NULL,
  `cpf` char(11) NOT NULL,
  `rg` varchar(12) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(13) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `preferencias` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `rg` (`rg`),
  KEY `periferia_id` (`periferia_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`periferia_id`) REFERENCES `periferias` (`periferia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-28  9:03:38
