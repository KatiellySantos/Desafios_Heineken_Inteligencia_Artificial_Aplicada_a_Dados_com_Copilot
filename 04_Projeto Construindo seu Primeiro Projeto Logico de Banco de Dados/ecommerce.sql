-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: ecommerce
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
-- Table structure for table `avaliacoesprodutos`
--

DROP TABLE IF EXISTS `avaliacoesprodutos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacoesprodutos` (
  `id_avaliacoesprodutos` int NOT NULL,
  `nota` int NOT NULL,
  `comentario` tinytext,
  `produtos_idprodutos` int DEFAULT NULL,
  `usuarios_idusuarios` int DEFAULT NULL,
  PRIMARY KEY (`id_avaliacoesprodutos`),
  KEY `produtos_idprodutos` (`produtos_idprodutos`),
  KEY `usuarios_idusuarios` (`usuarios_idusuarios`),
  CONSTRAINT `avaliacoesprodutos_ibfk_1` FOREIGN KEY (`produtos_idprodutos`) REFERENCES `produtos` (`id_produtos`),
  CONSTRAINT `avaliacoesprodutos_ibfk_2` FOREIGN KEY (`usuarios_idusuarios`) REFERENCES `usuarios` (`idusuarios`),
  CONSTRAINT `avaliacoesprodutos_chk_1` CHECK ((`nota` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacoesprodutos`
--

LOCK TABLES `avaliacoesprodutos` WRITE;
/*!40000 ALTER TABLE `avaliacoesprodutos` DISABLE KEYS */;
INSERT INTO `avaliacoesprodutos` VALUES (1,5,'Produto excelente!',1,1),(2,4,'Atendeu às expectativas.',2,2),(3,3,'Bom, mas poderia ser melhor.',3,3),(4,5,'Ótimo produto, recomendo!',4,4),(5,2,'Deixou a desejar.',5,5),(6,4,'Muito bom, gostei!',6,6),(7,3,'Funciona bem, mas há opções melhores.',7,7),(8,5,'Perfeito!',8,8),(9,4,'Boa relação custo-benefício.',9,9),(10,2,'Não vale o preço.',10,10);
/*!40000 ALTER TABLE `avaliacoesprodutos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriasprodutos`
--

DROP TABLE IF EXISTS `categoriasprodutos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoriasprodutos` (
  `id_categoriasprodutos` int NOT NULL,
  `nome_categoria` varchar(100) NOT NULL,
  `produtos_idprodutos` int DEFAULT NULL,
  PRIMARY KEY (`id_categoriasprodutos`),
  KEY `produtos_idprodutos` (`produtos_idprodutos`),
  CONSTRAINT `categoriasprodutos_ibfk_1` FOREIGN KEY (`produtos_idprodutos`) REFERENCES `produtos` (`id_produtos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriasprodutos`
--

LOCK TABLES `categoriasprodutos` WRITE;
/*!40000 ALTER TABLE `categoriasprodutos` DISABLE KEYS */;
INSERT INTO `categoriasprodutos` VALUES (1,'Eletrônicos',1),(2,'Tecnologia',2),(3,'Eletrodomésticos',3),(4,'TVs',4),(5,'Ferramentas',5),(6,'Eletrodomésticos',6),(7,'Cafeteiras',7),(8,'Eletrodomésticos',8),(9,'Ventilação',9),(10,'Cozinha',10);
/*!40000 ALTER TABLE `categoriasprodutos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuponsdesconto`
--

DROP TABLE IF EXISTS `cuponsdesconto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuponsdesconto` (
  `idcuponsdesconto` int NOT NULL,
  `codigo_cupom` varchar(50) NOT NULL,
  `desconto` decimal(5,2) NOT NULL,
  `validade` date NOT NULL,
  PRIMARY KEY (`idcuponsdesconto`),
  UNIQUE KEY `codigo_cupom` (`codigo_cupom`),
  CONSTRAINT `cuponsdesconto_chk_1` CHECK ((`desconto` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuponsdesconto`
--

LOCK TABLES `cuponsdesconto` WRITE;
/*!40000 ALTER TABLE `cuponsdesconto` DISABLE KEYS */;
INSERT INTO `cuponsdesconto` VALUES (1,'DESC10',10.00,'2025-12-31'),(2,'PROMO20',20.00,'2025-11-30'),(3,'FRETE50',50.00,'2025-10-15'),(4,'CUPOM30',30.00,'2025-09-01'),(5,'SALE25',25.00,'2025-12-25'),(6,'BLACKFRI',15.00,'2025-11-29'),(7,'ANO2025',5.00,'2025-12-31'),(8,'VIP40',40.00,'2025-08-20'),(9,'NATAL50',50.00,'2025-12-24'),(10,'NEWYEAR',10.00,'2026-01-01');
/*!40000 ALTER TABLE `cuponsdesconto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuponsusados`
--

DROP TABLE IF EXISTS `cuponsusados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuponsusados` (
  `idcuponsusados` int NOT NULL,
  `idcuponsdesconto` int DEFAULT NULL,
  `idusuarios` int DEFAULT NULL,
  `idpedidos` int DEFAULT NULL,
  PRIMARY KEY (`idcuponsusados`),
  KEY `idcuponsdesconto` (`idcuponsdesconto`),
  KEY `idusuarios` (`idusuarios`),
  KEY `idpedidos` (`idpedidos`),
  CONSTRAINT `cuponsusados_ibfk_1` FOREIGN KEY (`idcuponsdesconto`) REFERENCES `cuponsdesconto` (`idcuponsdesconto`),
  CONSTRAINT `cuponsusados_ibfk_2` FOREIGN KEY (`idusuarios`) REFERENCES `usuarios` (`idusuarios`),
  CONSTRAINT `cuponsusados_ibfk_3` FOREIGN KEY (`idpedidos`) REFERENCES `pedidos` (`id_pedidos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuponsusados`
--

LOCK TABLES `cuponsusados` WRITE;
/*!40000 ALTER TABLE `cuponsusados` DISABLE KEYS */;
INSERT INTO `cuponsusados` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,3),(4,4,4,4),(5,5,5,5),(6,6,6,6),(7,7,7,7),(8,8,8,8),(9,9,9,9),(10,10,10,10);
/*!40000 ALTER TABLE `cuponsusados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucoes`
--

DROP TABLE IF EXISTS `devolucoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devolucoes` (
  `iddevolucoes` int NOT NULL,
  `idpedidos` int DEFAULT NULL,
  `motivo_devolucao` varchar(255) NOT NULL,
  `data_devolucao` datetime NOT NULL,
  PRIMARY KEY (`iddevolucoes`),
  KEY `idpedidos` (`idpedidos`),
  CONSTRAINT `devolucoes_ibfk_1` FOREIGN KEY (`idpedidos`) REFERENCES `pedidos` (`id_pedidos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucoes`
--

LOCK TABLES `devolucoes` WRITE;
/*!40000 ALTER TABLE `devolucoes` DISABLE KEYS */;
INSERT INTO `devolucoes` VALUES (1,3,'Produto danificado','2025-03-16 10:00:00'),(2,9,'Pedido incorreto','2025-03-12 14:30:00'),(3,6,'Produto não atendeu as expectativas','2025-03-13 08:15:00'),(4,4,'Atraso na entrega','2025-03-11 17:45:00'),(5,7,'Produto com defeito de fábrica','2025-03-10 20:30:00'),(6,2,'Arrependimento de compra','2025-03-09 09:00:00'),(7,5,'Troca por tamanho errado','2025-03-08 12:00:00'),(8,10,'Produto faltando','2025-03-14 11:30:00'),(9,8,'Cor não correspondente','2025-03-15 16:45:00'),(10,1,'Pedido incompleto','2025-03-17 18:00:00');
/*!40000 ALTER TABLE `devolucoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecosusuarios`
--

DROP TABLE IF EXISTS `enderecosusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecosusuarios` (
  `idenderecosusuarios` int NOT NULL,
  `idusuarios` int DEFAULT NULL,
  `endereco_usuario` varchar(255) NOT NULL,
  PRIMARY KEY (`idenderecosusuarios`),
  KEY `idusuarios` (`idusuarios`),
  CONSTRAINT `enderecosusuarios_ibfk_1` FOREIGN KEY (`idusuarios`) REFERENCES `usuarios` (`idusuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecosusuarios`
--

LOCK TABLES `enderecosusuarios` WRITE;
/*!40000 ALTER TABLE `enderecosusuarios` DISABLE KEYS */;
INSERT INTO `enderecosusuarios` VALUES (1,1,'Rua das Flores, 123'),(2,2,'Av. Brasil, 500'),(3,3,'Rua Alegre, 456'),(4,4,'Praça da Paz, 789'),(5,5,'Rua do Sol, 321'),(6,6,'Av. Central, 789'),(7,7,'Rua do Mar, 456'),(8,8,'Rua da Esperança, 888'),(9,9,'Rua do Parque, 321'),(10,10,'Av. Nova, 654');
/*!40000 ALTER TABLE `enderecosusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoques`
--

DROP TABLE IF EXISTS `estoques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoques` (
  `idestoques` int NOT NULL,
  `idprodutos` int DEFAULT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`idestoques`),
  KEY `idprodutos` (`idprodutos`),
  CONSTRAINT `estoques_ibfk_1` FOREIGN KEY (`idprodutos`) REFERENCES `produtos` (`id_produtos`),
  CONSTRAINT `estoques_chk_1` CHECK ((`quantidade` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoques`
--

LOCK TABLES `estoques` WRITE;
/*!40000 ALTER TABLE `estoques` DISABLE KEYS */;
INSERT INTO `estoques` VALUES (1,1,45),(2,2,140),(3,3,15),(4,4,70),(5,5,30),(6,6,20),(7,7,40),(8,8,25),(9,9,95),(10,10,55);
/*!40000 ALTER TABLE `estoques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedores` (
  `idfornecedores` int NOT NULL,
  `nome_fornecedor` varchar(100) NOT NULL,
  `email_fornecedor` varchar(100) NOT NULL,
  `telefone_fornecedor` varchar(20) DEFAULT NULL,
  `endereco_fornecedor` varchar(255) DEFAULT NULL,
  `documento_fornecedor` varchar(20) NOT NULL,
  PRIMARY KEY (`idfornecedores`),
  UNIQUE KEY `email_fornecedor` (`email_fornecedor`),
  UNIQUE KEY `documento_fornecedor` (`documento_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` VALUES (1,'Fornecedor A','fornecedor.a@email.com','(85) 99988-7766','Rua Industrial, 123','01.234.567/0001-89'),(2,'Fornecedor B','fornecedor.b@email.com','(85) 98877-6655','Av. Comercial, 456','02.345.678/0001-90'),(3,'Fornecedor C','fornecedor.c@email.com','(85) 97766-5544','Rua Empresarial, 789','03.456.789/0001-91'),(4,'Fornecedor D','fornecedor.d@email.com','(85) 96655-4433','Av. Negócios, 101','04.567.890/0001-92'),(5,'Fornecedor E','fornecedor.e@email.com','(85) 95544-3322','Rua do Comércio, 202','05.678.901/0001-93'),(6,'Fornecedor F','fornecedor.f@email.com','(85) 94433-2211','Av. Indústria, 303','06.789.012/0001-94'),(7,'Fornecedor G','fornecedor.g@email.com','(85) 93322-1100','Rua Corporativa, 404','07.890.123/0001-95'),(8,'Fornecedor H','fornecedor.h@email.com','(85) 92211-0099','Av. Comercial, 505','08.901.234/0001-96'),(9,'Fornecedor I','fornecedor.i@email.com','(85) 91100-9988','Rua Logística, 606','09.012.345/0001-97'),(10,'Fornecedor J','fornecedor.j@email.com','(85) 90099-8877','Av. Transporte, 707','10.123.456/0001-98');
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedoresprodutos`
--

DROP TABLE IF EXISTS `fornecedoresprodutos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedoresprodutos` (
  `idfornecedoresprodutos` int NOT NULL,
  `idfornecedores` int DEFAULT NULL,
  `idprodutos` int DEFAULT NULL,
  PRIMARY KEY (`idfornecedoresprodutos`),
  KEY `idfornecedores` (`idfornecedores`),
  KEY `idprodutos` (`idprodutos`),
  CONSTRAINT `fornecedoresprodutos_ibfk_1` FOREIGN KEY (`idfornecedores`) REFERENCES `fornecedores` (`idfornecedores`),
  CONSTRAINT `fornecedoresprodutos_ibfk_2` FOREIGN KEY (`idprodutos`) REFERENCES `produtos` (`id_produtos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedoresprodutos`
--

LOCK TABLES `fornecedoresprodutos` WRITE;
/*!40000 ALTER TABLE `fornecedoresprodutos` DISABLE KEYS */;
INSERT INTO `fornecedoresprodutos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,1,6),(7,2,7),(8,3,8),(9,4,9),(10,5,10);
/*!40000 ALTER TABLE `fornecedoresprodutos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itenspedido`
--

DROP TABLE IF EXISTS `itenspedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itenspedido` (
  `id_itenspedido` int NOT NULL,
  `quantidade` int NOT NULL,
  `preco_total` decimal(10,2) NOT NULL,
  `pedidos_idpedidos` int DEFAULT NULL,
  `produtos_idprodutos` int DEFAULT NULL,
  PRIMARY KEY (`id_itenspedido`),
  KEY `pedidos_idpedidos` (`pedidos_idpedidos`),
  KEY `produtos_idprodutos` (`produtos_idprodutos`),
  CONSTRAINT `itenspedido_ibfk_1` FOREIGN KEY (`pedidos_idpedidos`) REFERENCES `pedidos` (`id_pedidos`),
  CONSTRAINT `itenspedido_ibfk_2` FOREIGN KEY (`produtos_idprodutos`) REFERENCES `produtos` (`id_produtos`),
  CONSTRAINT `itenspedido_chk_1` CHECK ((`quantidade` > 0)),
  CONSTRAINT `itenspedido_chk_2` CHECK ((`preco_total` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itenspedido`
--

LOCK TABLES `itenspedido` WRITE;
/*!40000 ALTER TABLE `itenspedido` DISABLE KEYS */;
INSERT INTO `itenspedido` VALUES (1,2,7999.98,1,1),(2,1,1999.90,2,2),(3,1,2799.00,3,3),(4,3,8999.97,4,4),(5,1,499.99,5,5),(6,2,1799.80,6,6),(7,1,299.99,7,7),(8,1,699.90,8,8),(9,2,399.80,9,9),(10,3,389.70,10,10);
/*!40000 ALTER TABLE `itenspedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamentos`
--

DROP TABLE IF EXISTS `pagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamentos` (
  `idpagamentos` int NOT NULL,
  `idpedidos` int DEFAULT NULL,
  `valor_pagamento` decimal(10,2) NOT NULL,
  `metodo_pagamento` enum('cartao de credito','boleto bancario','pix') NOT NULL,
  `data_pagamento` datetime NOT NULL,
  PRIMARY KEY (`idpagamentos`),
  KEY `idpedidos` (`idpedidos`),
  CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`idpedidos`) REFERENCES `pedidos` (`id_pedidos`),
  CONSTRAINT `pagamentos_chk_1` CHECK ((`valor_pagamento` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamentos`
--

LOCK TABLES `pagamentos` WRITE;
/*!40000 ALTER TABLE `pagamentos` DISABLE KEYS */;
INSERT INTO `pagamentos` VALUES (1,1,8029.98,'cartao de credito','2025-03-17 12:00:00'),(2,2,2019.90,'pix','2025-03-16 15:00:00'),(3,3,0.00,'boleto bancario','2025-03-15 10:00:00'),(4,4,9014.97,'cartao de credito','2025-03-14 18:00:00'),(5,5,534.99,'pix','2025-03-13 13:00:00'),(6,6,1809.80,'boleto bancario','2025-03-12 09:00:00'),(7,7,349.99,'cartao de credito','2025-03-11 21:00:00'),(8,8,739.90,'pix','2025-03-10 17:00:00'),(9,9,0.00,'boleto bancario','2025-03-09 19:00:00'),(10,10,414.70,'cartao de credito','2025-03-08 12:00:00');
/*!40000 ALTER TABLE `pagamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedidos` int NOT NULL,
  `data_pedido` datetime NOT NULL,
  `status_pedido` varchar(50) NOT NULL,
  `frete` decimal(10,2) NOT NULL,
  `usuarios_idusuarios` int DEFAULT NULL,
  PRIMARY KEY (`id_pedidos`),
  KEY `usuarios_idusuarios` (`usuarios_idusuarios`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`usuarios_idusuarios`) REFERENCES `usuarios` (`idusuarios`),
  CONSTRAINT `pedidos_chk_1` CHECK ((`frete` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2025-03-17 10:00:00','Entregue',30.00,1),(2,'2025-03-16 14:30:00','Aguardando pagamento',20.00,2),(3,'2025-03-15 09:00:00','Cancelado',25.00,3),(4,'2025-03-14 17:45:00','Processando',15.00,4),(5,'2025-03-13 12:00:00','Enviado',35.00,5),(6,'2025-03-12 08:15:00','Entregue',10.00,6),(7,'2025-03-11 20:30:00','Processando',50.00,7),(8,'2025-03-10 16:45:00','Enviado',40.00,8),(9,'2025-03-09 18:00:00','Cancelado',0.00,9),(10,'2025-03-08 11:30:00','Aguardando pagamento',25.00,10);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id_produtos` int NOT NULL,
  `nome_produto` varchar(100) NOT NULL,
  `descricao_produto` tinytext,
  `preco_produto` decimal(10,2) NOT NULL,
  `quantidade_estoque` int NOT NULL,
  `vendedores_idvendedores` int DEFAULT NULL,
  `fornecedores_idfornecedores` int DEFAULT NULL,
  PRIMARY KEY (`id_produtos`),
  KEY `vendedores_idvendedores` (`vendedores_idvendedores`),
  KEY `fornecedores_idfornecedores` (`fornecedores_idfornecedores`),
  CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`vendedores_idvendedores`) REFERENCES `vendedores` (`idvendedores`),
  CONSTRAINT `produtos_ibfk_2` FOREIGN KEY (`fornecedores_idfornecedores`) REFERENCES `fornecedores` (`idfornecedores`),
  CONSTRAINT `produtos_chk_1` CHECK ((`preco_produto` >= 0)),
  CONSTRAINT `produtos_chk_2` CHECK ((`quantidade_estoque` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Notebook Dell','Notebook de última geração',3999.99,50,1,1),(2,'Smartphone Samsung','Celular com câmera avançada',1999.90,150,2,2),(3,'Geladeira Brastemp','Refrigerador Frost Free',2799.00,20,3,3),(4,'TV LG 55\"','Smart TV 4K Ultra HD',2999.99,80,4,4),(5,'Furadeira Bosch','Furadeira com 500W de potência',499.99,35,5,5),(6,'Fogão 4 bocas','Fogão com acendimento automático',899.90,25,6,1),(7,'Cafeteira Expresso','Cafeteira com função programável',299.99,45,7,2),(8,'Micro-ondas Electrolux','Micro-ondas 20L',699.90,30,8,3),(9,'Ventilador Arno','Ventilador silencioso',199.90,100,9,4),(10,'Liquidificador Mondial','Liquidificador potente',129.90,60,10,5);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtoscategoria`
--

DROP TABLE IF EXISTS `produtoscategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtoscategoria` (
  `idprodutoscategoria` int NOT NULL,
  `idprodutos` int DEFAULT NULL,
  `idcategoriasprodutos` int DEFAULT NULL,
  PRIMARY KEY (`idprodutoscategoria`),
  KEY `idprodutos` (`idprodutos`),
  KEY `idcategoriasprodutos` (`idcategoriasprodutos`),
  CONSTRAINT `produtoscategoria_ibfk_1` FOREIGN KEY (`idprodutos`) REFERENCES `produtos` (`id_produtos`),
  CONSTRAINT `produtoscategoria_ibfk_2` FOREIGN KEY (`idcategoriasprodutos`) REFERENCES `categoriasprodutos` (`id_categoriasprodutos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtoscategoria`
--

LOCK TABLES `produtoscategoria` WRITE;
/*!40000 ALTER TABLE `produtoscategoria` DISABLE KEYS */;
INSERT INTO `produtoscategoria` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `produtoscategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idusuarios` int NOT NULL,
  `nome_cliente` varchar(100) NOT NULL,
  `email_cliente` varchar(100) NOT NULL,
  `telefone_cliente` varchar(20) DEFAULT NULL,
  `endereco_cliente` varchar(255) DEFAULT NULL,
  `senha_cliente` varchar(15) NOT NULL,
  `documento_cliente` varchar(20) NOT NULL,
  PRIMARY KEY (`idusuarios`),
  UNIQUE KEY `email_cliente` (`email_cliente`),
  UNIQUE KEY `documento_cliente` (`documento_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Ana Clara Martins','ana.martins@email.com','(85) 91234-5678','Rua das Flores, 123','senha123','123.456.789-00'),(2,'João Silva','joao.silva@email.com','(85) 93456-7890','Av. Brasil, 500','senha456','987.654.321-99'),(3,'Maria Souza','maria.souza@email.com','(85) 94567-8901','Rua Alegre, 456','maria2025','567.890.123-11'),(4,'Pedro Lima','pedro.lima@email.com','(85) 95678-9012','Praça da Paz, 789','pedro789','876.543.210-22'),(5,'Camila Almeida','camila.almeida@email.com','(85) 96789-0123','Rua do Sol, 321','camila001','345.678.901-33'),(6,'Lucas Ferreira','lucas.ferreira@email.com','(85) 97890-6543','Av. Central, 789','lucas789','234.567.890-44'),(7,'Fernanda Costa','fernanda.costa@email.com','(85) 98901-2345','Rua do Mar, 456','fernanda123','789.012.345-55'),(8,'Rafael Oliveira','rafael.oliveira@email.com','(85) 90123-4567','Rua da Esperança, 888','rafael456','890.123.456-66'),(9,'Juliana Ribeiro','juliana.ribeiro@email.com','(85) 91234-6789','Rua do Parque, 321','juliana789','901.234.567-77'),(10,'Marcelo Nunes','marcelo.nunes@email.com','(85) 92345-7890','Av. Nova, 654','marcelo001','012.345.678-88');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `idvendedores` int NOT NULL,
  `nome_vendedor` varchar(100) NOT NULL,
  `email_vendedor` varchar(100) NOT NULL,
  `telefone_vendedor` varchar(20) DEFAULT NULL,
  `tipo_documento` enum('cpf','cnpj') NOT NULL,
  `numero_documento` varchar(20) NOT NULL,
  PRIMARY KEY (`idvendedores`),
  UNIQUE KEY `email_vendedor` (`email_vendedor`),
  UNIQUE KEY `numero_documento` (`numero_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,'Gabriel Santos','gabriel@email.com','(85) 99887-7766','cpf','123.321.456-78'),(2,'Rafaela Moura','rafaela@email.com','(85) 98765-4321','cnpj','09.876.543/0001-99'),(3,'Hugo Menezes','hugo@email.com','(85) 98765-1111','cpf','345.678.987-65'),(4,'Leticia Vieira','leticia@email.com','(85) 93456-3322','cnpj','12.345.678/0001-66'),(5,'Carla Andrade','carla@email.com','(85) 96543-2109','cpf','987.654.321-10'),(6,'Renato Farias','renato@email.com','(85) 95678-3344','cnpj','21.098.765/0001-33'),(7,'Debora Lima','debora@email.com','(85) 97654-2211','cpf','654.321.987-55'),(8,'Eduardo Souza','eduardo@email.com','(85) 98765-4433','cnpj','34.567.890/0001-22'),(9,'Patricia Duarte','patricia@email.com','(85) 91234-1122','cpf','876.543.210-77'),(10,'Felipe Carvalho','felipe@email.com','(85) 92345-3322','cnpj','56.789.012/0001-99');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-17 14:06:26
