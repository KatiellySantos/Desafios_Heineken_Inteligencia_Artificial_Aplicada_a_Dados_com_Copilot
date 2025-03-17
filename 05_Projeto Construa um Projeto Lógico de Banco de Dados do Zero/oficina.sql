-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: oficina
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idclientes` int NOT NULL,
  `nome_cliente` varchar(100) DEFAULT NULL,
  `endereco_cliente` varchar(255) DEFAULT NULL,
  `telefone_cliente` varchar(20) DEFAULT NULL,
  `email_cliente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idclientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'João Silva','Rua das Palmeiras, 123','(85) 91234-5678','joao.silva@email.com'),(2,'Maria Oliveira','Av. das Flores, 456','(85) 93456-7890','maria.oliveira@email.com'),(3,'Pedro Lima','Rua do Sol, 789','(85) 94567-8901','pedro.lima@email.com'),(4,'Ana Souza','Av. Brasil, 101','(85) 95678-9012','ana.souza@email.com'),(5,'Carlos Ferreira','Rua do Norte, 202','(85) 96789-0123','carlos.ferreira@email.com'),(6,'Juliana Costa','Rua da Paz, 303','(85) 97890-1234','juliana.costa@email.com'),(7,'Lucas Martins','Av. Central, 404','(85) 98901-2345','lucas.martins@email.com'),(8,'Fernanda Mendes','Rua Nova, 505','(85) 90123-3456','fernanda.mendes@email.com'),(9,'Rafael Silva','Av. Oeste, 606','(85) 91234-4567','rafael.silva@email.com'),(10,'Camila Dias','Rua Leste, 707','(85) 92345-5678','camila.dias@email.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe_mecanicos`
--

DROP TABLE IF EXISTS `equipe_mecanicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe_mecanicos` (
  `idequipemecanicos` int NOT NULL,
  `equipes_idequipes` int DEFAULT NULL,
  `mecanicos_idmecanicos` int DEFAULT NULL,
  PRIMARY KEY (`idequipemecanicos`),
  KEY `equipes_idequipes` (`equipes_idequipes`),
  KEY `mecanicos_idmecanicos` (`mecanicos_idmecanicos`),
  CONSTRAINT `equipe_mecanicos_ibfk_1` FOREIGN KEY (`equipes_idequipes`) REFERENCES `equipes` (`idequipes`),
  CONSTRAINT `equipe_mecanicos_ibfk_2` FOREIGN KEY (`mecanicos_idmecanicos`) REFERENCES `mecanicos` (`idmecanicos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe_mecanicos`
--

LOCK TABLES `equipe_mecanicos` WRITE;
/*!40000 ALTER TABLE `equipe_mecanicos` DISABLE KEYS */;
INSERT INTO `equipe_mecanicos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `equipe_mecanicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipes`
--

DROP TABLE IF EXISTS `equipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipes` (
  `idequipes` int NOT NULL,
  `nome_equipe` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idequipes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipes`
--

LOCK TABLES `equipes` WRITE;
/*!40000 ALTER TABLE `equipes` DISABLE KEYS */;
INSERT INTO `equipes` VALUES (1,'Equipe Alpha'),(2,'Equipe Beta'),(3,'Equipe Gamma'),(4,'Equipe Delta'),(5,'Equipe Omega'),(6,'Equipe Sigma'),(7,'Equipe Zeta'),(8,'Equipe Kappa'),(9,'Equipe Theta'),(10,'Equipe Epsilon');
/*!40000 ALTER TABLE `equipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_os`
--

DROP TABLE IF EXISTS `itens_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_os` (
  `iditens_os` int NOT NULL,
  `servico_idservico` int DEFAULT NULL,
  `pecas_idpecas` int DEFAULT NULL,
  `ordens_de_servicos_idordens_de_servicos` int DEFAULT NULL,
  PRIMARY KEY (`iditens_os`),
  KEY `servico_idservico` (`servico_idservico`),
  KEY `pecas_idpecas` (`pecas_idpecas`),
  KEY `ordens_de_servicos_idordens_de_servicos` (`ordens_de_servicos_idordens_de_servicos`),
  CONSTRAINT `itens_os_ibfk_1` FOREIGN KEY (`servico_idservico`) REFERENCES `servico` (`idservico`),
  CONSTRAINT `itens_os_ibfk_2` FOREIGN KEY (`pecas_idpecas`) REFERENCES `pecas` (`idpecas`),
  CONSTRAINT `itens_os_ibfk_3` FOREIGN KEY (`ordens_de_servicos_idordens_de_servicos`) REFERENCES `ordens_de_servicos` (`idordens_de_servicos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_os`
--

LOCK TABLES `itens_os` WRITE;
/*!40000 ALTER TABLE `itens_os` DISABLE KEYS */;
INSERT INTO `itens_os` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,3),(4,4,4,4),(5,5,5,5),(6,6,6,6),(7,7,7,7),(8,8,8,8),(9,9,9,9),(10,10,10,10);
/*!40000 ALTER TABLE `itens_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanicos`
--

DROP TABLE IF EXISTS `mecanicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanicos` (
  `idmecanicos` int NOT NULL,
  `nome_mecanico` varchar(100) DEFAULT NULL,
  `endereco_mecanico` varchar(255) DEFAULT NULL,
  `telefone_mecanico` varchar(20) DEFAULT NULL,
  `email_mecanico` varchar(100) DEFAULT NULL,
  `especialidade_mecanico` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idmecanicos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanicos`
--

LOCK TABLES `mecanicos` WRITE;
/*!40000 ALTER TABLE `mecanicos` DISABLE KEYS */;
INSERT INTO `mecanicos` VALUES (1,'Carlos Andrade','Rua Industrial, 123','(85) 98765-4321','carlos.andrade@email.com','Suspensão'),(2,'Fernanda Ribeiro','Av. Técnica, 456','(85) 97654-3210','fernanda.ribeiro@email.com','Freios'),(3,'Ricardo Mendes','Rua Mecânica, 789','(85) 96543-2109','ricardo.mendes@email.com','Motor'),(4,'Juliana Souza','Av. Automóvel, 101','(85) 95432-1098','juliana.souza@email.com','Elétrica'),(5,'Marcos Silva','Rua Oficina, 202','(85) 94321-0987','marcos.silva@email.com','Transmissão'),(6,'Ana Lima','Av. Veículos, 303','(85) 93210-9876','ana.lima@email.com','Pintura'),(7,'Rafael Costa','Rua Reparos, 404','(85) 92109-8765','rafael.costa@email.com','Diagnóstico'),(8,'Camila Farias','Av. Restauração, 505','(85) 91098-7654','camila.farias@email.com','Pneus'),(9,'Lucas Pereira','Rua Manutenção, 606','(85) 90987-6543','lucas.pereira@email.com','Refrigeração'),(10,'Bianca Alves','Av. Ajustes, 707','(85) 90876-5432','bianca.alves@email.com','Ar-condicionado');
/*!40000 ALTER TABLE `mecanicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordens_de_servicos`
--

DROP TABLE IF EXISTS `ordens_de_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordens_de_servicos` (
  `idordens_de_servicos` int NOT NULL,
  `data_emissao` datetime DEFAULT NULL,
  `valor_servico` decimal(10,2) DEFAULT NULL,
  `status_servico` varchar(50) DEFAULT NULL,
  `data_conclusao` datetime DEFAULT NULL,
  `veiculos_idveiculos` int DEFAULT NULL,
  `equipes_idequipes` int DEFAULT NULL,
  `observacoes` text,
  PRIMARY KEY (`idordens_de_servicos`),
  KEY `veiculos_idveiculos` (`veiculos_idveiculos`),
  KEY `equipes_idequipes` (`equipes_idequipes`),
  CONSTRAINT `ordens_de_servicos_ibfk_1` FOREIGN KEY (`veiculos_idveiculos`) REFERENCES `veiculos` (`idveiculos`),
  CONSTRAINT `ordens_de_servicos_ibfk_2` FOREIGN KEY (`equipes_idequipes`) REFERENCES `equipes` (`idequipes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordens_de_servicos`
--

LOCK TABLES `ordens_de_servicos` WRITE;
/*!40000 ALTER TABLE `ordens_de_servicos` DISABLE KEYS */;
INSERT INTO `ordens_de_servicos` VALUES (1,'2025-03-01 08:00:00',1500.00,'Concluído','2025-03-03 17:00:00',1,1,'Troca de óleo e revisão geral'),(2,'2025-03-05 10:30:00',800.00,'Em andamento',NULL,2,2,'Troca de pneus'),(3,'2025-03-08 09:00:00',1200.00,'Concluído','2025-03-10 18:00:00',3,3,'Manutenção no sistema de freios'),(4,'2025-03-11 14:15:00',2500.00,'Concluído','2025-03-13 20:00:00',4,4,'Reparos na transmissão'),(5,'2025-03-14 16:45:00',900.00,'Cancelado',NULL,5,5,'Cliente desistiu do serviço'),(6,'2025-03-18 11:00:00',2000.00,'Aguardando pagamento',NULL,6,6,'Revisão completa'),(7,'2025-03-21 13:30:00',700.00,'Concluído','2025-03-22 19:00:00',7,7,'Substituição de bateria'),(8,'2025-03-23 09:45:00',1600.00,'Em andamento',NULL,8,8,'Reparos elétricos'),(9,'2025-03-26 12:00:00',500.00,'Concluído','2025-03-27 16:00:00',9,9,'Balanceamento'),(10,'2025-03-29 15:00:00',1000.00,'Concluído','2025-03-30 18:00:00',10,10,'Revisão de motor');
/*!40000 ALTER TABLE `ordens_de_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecas`
--

DROP TABLE IF EXISTS `pecas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecas` (
  `idpecas` int NOT NULL,
  `descricao_peca` text,
  `valor_peca` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idpecas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecas`
--

LOCK TABLES `pecas` WRITE;
/*!40000 ALTER TABLE `pecas` DISABLE KEYS */;
INSERT INTO `pecas` VALUES (1,'Filtro de óleo',50.00),(2,'Velas de ignição',120.00),(3,'Pastilhas de freio',300.00),(4,'Amortecedor traseiro',450.00),(5,'Correia dentada',200.00),(6,'Farol dianteiro',600.00),(7,'Radiador',800.00),(8,'Bateria automotiva',450.00),(9,'Jogo de pneus',1600.00),(10,'Filtro de ar',75.00);
/*!40000 ALTER TABLE `pecas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `idservico` int NOT NULL,
  `descricao_servico` text,
  `valor_mao_de_obra` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idservico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (1,'Troca de óleo',150.00),(2,'Balanceamento e alinhamento',200.00),(3,'Substituição de pastilhas de freio',300.00),(4,'Reparos na suspensão',500.00),(5,'Revisão geral',1000.00),(6,'Reparos no motor',1200.00),(7,'Reparos elétricos',800.00),(8,'Troca de bateria',250.00),(9,'Manutenção na transmissão',1500.00),(10,'Instalação de acessórios',300.00);
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculos`
--

DROP TABLE IF EXISTS `veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculos` (
  `idveiculos` int NOT NULL,
  `placa_veiculo` varchar(10) DEFAULT NULL,
  `modelo_veiculo` varchar(100) DEFAULT NULL,
  `ano_veiculo` int DEFAULT NULL,
  `cor_veiculo` varchar(50) DEFAULT NULL,
  `tipo_combustivel` varchar(50) DEFAULT NULL,
  `clientes_idclientes` int DEFAULT NULL,
  PRIMARY KEY (`idveiculos`),
  KEY `clientes_idclientes` (`clientes_idclientes`),
  CONSTRAINT `veiculos_ibfk_1` FOREIGN KEY (`clientes_idclientes`) REFERENCES `clientes` (`idclientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculos`
--

LOCK TABLES `veiculos` WRITE;
/*!40000 ALTER TABLE `veiculos` DISABLE KEYS */;
INSERT INTO `veiculos` VALUES (1,'ABC1234','Ford Fiesta',2018,'Branco','Gasolina',1),(2,'DEF5678','Chevrolet Onix',2020,'Prata','Flex',2),(3,'GHI9012','Toyota Corolla',2019,'Preto','Gasolina',3),(4,'JKL3456','Honda Civic',2021,'Cinza','Flex',4),(5,'MNO7890','Jeep Compass',2022,'Azul','Diesel',5),(6,'PQR1234','Volkswagen Golf',2017,'Vermelho','Gasolina',6),(7,'STU5678','Fiat Argo',2020,'Branco','Flex',7),(8,'VWX9012','Renault Kwid',2023,'Amarelo','Gasolina',8),(9,'YZA3456','Hyundai HB20',2018,'Preto','Flex',9),(10,'BCD7890','Nissan Kicks',2021,'Prata','Diesel',10);
/*!40000 ALTER TABLE `veiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-17 14:19:05
