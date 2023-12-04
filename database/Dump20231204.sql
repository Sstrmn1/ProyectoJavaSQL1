CREATE DATABASE  IF NOT EXISTS `bd_genolab` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_genolab`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_genolab
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulo` (
  `id_articulo` int NOT NULL AUTO_INCREMENT,
  `id_ffarmaceutica` int NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `concentracion` float DEFAULT NULL,
  `codigo` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_articulo`),
  UNIQUE KEY `id_articulo_UNIQUE` (`id_articulo`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `fk_articulo_ffarmaceutica_idx` (`id_ffarmaceutica`),
  CONSTRAINT `fk_articulo_ffarmaceutica` FOREIGN KEY (`id_ffarmaceutica`) REFERENCES `forma_farmaceutica` (`id_ffarmaceutica`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (1,1,'Amoxicilina 500mg',500,'AMOX001',_binary ''),(2,2,'Complejo B 2ml',2,'CB001',_binary ''),(3,1,'Paracetamol 500mg',500,'PARA001',_binary ''),(4,3,'Vitamina C 5ml',5,'VITC001',_binary ''),(5,3,'DEXAMETASONA',8,'IDEXA8',_binary ''),(6,3,'DICLOFENACO',75,'IDIC75',_binary '\0'),(7,3,'Fluconazol',100,'IFLUC100',_binary ''),(8,2,'AZITROMICINA',250,'CAZIT250',_binary ''),(9,1,'ATORVASTATINA',20,'CATOR20',_binary '');
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tipo_documento` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `numero_documento` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `telefono` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `id_cliente_UNIQUE` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan Ramos','NIT','123456789','555-1234','juan.ramos@example.com',_binary ''),(2,'Jose Perez','NIT','987654321','555-5678','jose.perez@example.com',_binary ''),(3,'Ana Fernandez','NIT','456789012','555-9012','ana.fernandez@example.com',_binary ''),(4,'Fabio Camacho','CI','539843','74482092','fc.11@gmail.com',_binary ''),(5,'Carlos Lopez','NIT','453235','75423453','cf@hotmail.com',_binary ''),(6,'Maria Miranda','NIT','543246742','75889653','mm@gmail.com',_binary ''),(7,'Jorge Borda','NIT','546423','76356324','jb@gmail.com',_binary ''),(8,'Alvaro Cornejo','NIT','6780456','78356313','ac@gmail.com',_binary ''),(9,'Daniela Arandia','NIT','78343346','69843245','da@gmail.com',_binary ''),(10,'Jose Luis Mejia','NIT','7455442','76923532','jmm@gmail.com',_binary '');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distrito`
--

DROP TABLE IF EXISTS `distrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distrito` (
  `id_distrito` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_distrito`),
  UNIQUE KEY `id_distrito_UNIQUE` (`id_distrito`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distrito`
--

LOCK TABLES `distrito` WRITE;
/*!40000 ALTER TABLE `distrito` DISABLE KEYS */;
INSERT INTO `distrito` VALUES (1,'Cochabamba',_binary ''),(2,'La Paz',_binary ''),(3,'Santa Cruz',_binary ''),(4,'Trinidad',_binary ''),(5,'El Alto',_binary ''),(6,'Montero',_binary ''),(7,'Oruro',_binary ''),(8,'Potosi',_binary ''),(9,'Sucre',_binary ''),(10,'Tarija',_binary '');
/*!40000 ALTER TABLE `distrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_orden` int NOT NULL,
  `codigo_autorizacion` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `id_factura_UNIQUE` (`id_factura`),
  KEY `fk_factura_orden_idx` (`id_orden`),
  CONSTRAINT `fk_factura_orden` FOREIGN KEY (`id_orden`) REFERENCES `orden_de_venta` (`id_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,1,'AUT001','2023-11-15 20:37:26',_binary ''),(2,2,'AUT002','2023-11-15 20:37:26',_binary ''),(3,3,'AUT003','2023-11-15 20:37:26',_binary ''),(11,11,'AUT001','2023-11-25 12:20:40',_binary ''),(12,12,'AUT002','2023-11-25 12:20:40',_binary ''),(13,13,'AUT001','2023-11-25 12:20:40',_binary ''),(14,14,'AUT002','2023-11-25 12:20:40',_binary ''),(15,15,'AUT001','2023-11-25 12:20:40',_binary ''),(16,16,'AUT002','2023-11-25 12:20:40',_binary ''),(17,10,'AUT001','2023-11-25 12:20:40',_binary '');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_farmaceutica`
--

DROP TABLE IF EXISTS `forma_farmaceutica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_farmaceutica` (
  `id_ffarmaceutica` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_ffarmaceutica`),
  UNIQUE KEY `id_ffarmaceutica_UNIQUE` (`id_ffarmaceutica`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_farmaceutica`
--

LOCK TABLES `forma_farmaceutica` WRITE;
/*!40000 ALTER TABLE `forma_farmaceutica` DISABLE KEYS */;
INSERT INTO `forma_farmaceutica` VALUES (1,'Comprimido',_binary ''),(2,'Cápsula',_binary ''),(3,'Inyectable',_binary ''),(4,'Polvo Inyectable',_binary ''),(5,'Dispositivo Medico no invasivo',_binary ''),(6,'Dispositivo Medico invasivo',_binary ''),(7,'Gel',_binary ''),(8,'Crema',_binary ''),(9,'Reactivo',_binary ''),(10,'Aerosol',_binary '');
/*!40000 ALTER TABLE `forma_farmaceutica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratorio`
--

DROP TABLE IF EXISTS `laboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratorio` (
  `id_laboratorio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `procedencia` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_laboratorio`),
  UNIQUE KEY `id_laboratorio_UNIQUE` (`id_laboratorio`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratorio`
--

LOCK TABLES `laboratorio` WRITE;
/*!40000 ALTER TABLE `laboratorio` DISABLE KEYS */;
INSERT INTO `laboratorio` VALUES (1,'Sinochem','China',_binary ''),(2,'Ningbo','China',_binary ''),(3,'Laboratorios Chile','Chile',_binary ''),(4,'Bayer','Alemania',_binary ''),(5,'Actimed','Chile',_binary ''),(6,'Genoma Lab','Peru',_binary ''),(7,'Nanjing','China',_binary ''),(8,'Figma','Brasil',_binary ''),(9,'J&J','Estados Unidos',_binary ''),(10,'Moderna','Estados Unidos',_binary ''),(11,'Vita','Bolivia',_binary '');
/*!40000 ALTER TABLE `laboratorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lote` (
  `id_lote` int NOT NULL AUTO_INCREMENT,
  `id_articulo` int NOT NULL,
  `id_laboratorio` int NOT NULL,
  `fecha_fabricacion` date NOT NULL,
  `fecha_expiracion` date NOT NULL,
  `stock` int NOT NULL,
  `precio_unitario` decimal(5,2) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `codigo` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id_lote`),
  UNIQUE KEY `id_lote_UNIQUE` (`id_lote`),
  KEY `fk_lote_articulo_idx` (`id_articulo`),
  KEY `fk_lote_laboratorio_idx` (`id_laboratorio`),
  CONSTRAINT `fk_lote_articulo` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_articulo`),
  CONSTRAINT `fk_lote_laboratorio` FOREIGN KEY (`id_laboratorio`) REFERENCES `laboratorio` (`id_laboratorio`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
INSERT INTO `lote` VALUES (1,1,1,'2023-11-01','2024-11-01',494000,0.50,_binary '','LOTE001'),(2,2,2,'2019-07-15','2024-12-25',494006,0.40,_binary '','LOTE002'),(3,3,1,'2023-11-01','2024-11-01',485000,0.30,_binary '','LOTE003'),(4,4,3,'2023-11-01','2024-11-01',495000,0.20,_binary '','LOTE004'),(17,5,9,'2023-11-01','2024-11-01',1000000,0.50,_binary '','234325'),(18,6,8,'2023-11-01','2024-11-01',200000,0.40,_binary '','253454'),(19,7,7,'2023-11-01','2024-11-01',600000,0.30,_binary '','2385565'),(20,8,6,'2023-11-01','2024-11-01',700000,0.20,_binary '','235434'),(21,9,5,'2023-11-01','2024-11-01',600000,0.30,_binary '','236564'),(22,4,4,'2023-11-01','2024-11-01',700000,0.20,_binary '','235456'),(23,5,5,'2020-01-01','2020-01-01',50000,0.50,_binary '','20002'),(24,7,4,'2020-03-09','2020-08-19',40000,0.50,_binary '','20fluxo');
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_de_venta`
--

DROP TABLE IF EXISTS `orden_de_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_de_venta` (
  `id_orden` int NOT NULL AUTO_INCREMENT,
  `id_sucursal` int NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `importe_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_orden`),
  UNIQUE KEY `id_orden_UNIQUE` (`id_orden`),
  KEY `fk_orden_usuario_idx` (`id_usuario`),
  KEY `fk_orden_sucursal_idx` (`id_sucursal`),
  CONSTRAINT `fk_orden_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`),
  CONSTRAINT `fk_orden_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_de_venta`
--

LOCK TABLES `orden_de_venta` WRITE;
/*!40000 ALTER TABLE `orden_de_venta` DISABLE KEYS */;
INSERT INTO `orden_de_venta` VALUES (1,1,2,'2023-11-15 20:37:26',3800.00),(2,2,2,'2023-11-15 20:37:26',3700.00),(3,3,2,'2023-11-15 20:37:26',3400.00),(10,4,2,'2023-11-25 12:14:43',NULL),(11,5,2,'2023-11-25 12:14:43',NULL),(12,6,2,'2023-11-25 12:14:43',NULL),(13,7,2,'2023-11-25 12:14:43',NULL),(14,8,2,'2023-11-25 12:14:43',NULL),(15,9,2,'2023-11-25 12:14:43',NULL),(16,1,2,'2023-11-25 12:14:43',NULL);
/*!40000 ALTER TABLE `orden_de_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `id_rol_UNIQUE` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador',_binary ''),(2,'Ventas',_binary ''),(3,'Regencia Farmaceutica',_binary ''),(4,'Almacenes',_binary '\0'),(5,'Secretaria',_binary ''),(6,'Jefatura comercial',_binary ''),(7,'Gerencia fincanciera',_binary ''),(8,'Jefatura almacenes',_binary ''),(9,'Gerencia general',_binary ''),(10,'Contabilidad',_binary '');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `id_sucursal` int NOT NULL AUTO_INCREMENT,
  `id_distrito` int NOT NULL,
  `id_cliente` int NOT NULL,
  `calle` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `numero` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `oficina` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_sucursal`),
  UNIQUE KEY `iddireccion_UNIQUE` (`id_sucursal`),
  KEY `fk_direccion_cliente_idx` (`id_cliente`),
  KEY `fk_direccion_distrito_idx` (`id_distrito`),
  CONSTRAINT `fk_sucursal_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_sucursal_distrito` FOREIGN KEY (`id_distrito`) REFERENCES `distrito` (`id_distrito`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,1,1,'Blanco galindo','150','8',_binary ''),(2,2,2,'Avenida B','456','Oficina 2',_binary ''),(3,3,3,'Calle C','789','Oficina 3',_binary ''),(4,1,3,'Blanco galindo','150','5',_binary ''),(5,2,4,'Gaspar jurado','450','301',_binary ''),(6,1,5,'Calle 3','32','3',_binary ''),(7,5,9,'6 de marzo ','43254','102',_binary ''),(8,1,10,'Beijing','312','',_binary ''),(9,1,5,'Libertador','3234','8',_binary ''),(10,2,9,'Zabaleta','231','',_binary '');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion` (
  `id_transaccion` int NOT NULL AUTO_INCREMENT,
  `id_lote` int NOT NULL,
  `id_orden` int NOT NULL,
  `cantidad` int NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_transaccion`),
  UNIQUE KEY `id_transaccion_UNIQUE` (`id_transaccion`),
  KEY `fk_transaccion_lote_idx` (`id_lote`),
  KEY `fk_transaccion_orden_idx` (`id_orden`),
  CONSTRAINT `fk_transaccion_lote` FOREIGN KEY (`id_lote`) REFERENCES `lote` (`id_lote`),
  CONSTRAINT `fk_transaccion_orden` FOREIGN KEY (`id_orden`) REFERENCES `orden_de_venta` (`id_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
INSERT INTO `transaccion` VALUES (1,1,1,6000,'2023-11-15 20:37:26'),(2,2,1,2000,'2023-11-15 20:37:26'),(3,2,2,4000,'2023-11-15 20:37:26'),(4,3,2,7000,'2023-11-15 20:37:26'),(5,3,3,8000,'2023-11-15 20:37:26'),(6,4,3,5000,'2023-11-15 20:37:26'),(16,17,10,200,'2023-11-25 12:17:37'),(17,18,11,300,'2023-11-25 12:17:37'),(18,19,12,4000,'2023-11-25 12:17:37'),(19,20,13,6000,'2023-11-25 12:17:37'),(20,21,14,5500,'2023-11-25 12:17:37'),(21,22,15,1300,'2023-11-25 12:17:37'),(22,17,16,400,'2023-11-25 12:17:37'),(23,1,10,7500,'2023-11-25 12:17:37'),(24,2,3,5000,'2023-11-25 12:17:37');
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_rol` int NOT NULL,
  `password` varchar(100) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `apellido` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ci` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `foto` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `idusuario_UNIQUE` (`id_usuario`),
  KEY `fk_usuario_rol_idx` (`id_rol`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'password_admin','Carlos','López','123456','carlos.lopez@example.com','1990-01-01',NULL,_binary ''),(2,2,'d48ee5605a96058f8cff125cc115d1bbd6ad5ed75fa0b0b010b333e4359a0e9f','Sofía','González','789012','sofia.gonzalez@example.com','1992-05-15',NULL,_binary ''),(3,4,'7034412857505b86d9d1e268a656cf44a89e266b767bd3ebae624936a92534fe','Miguel','Martínez','345678','miguel.martinez@example.com','1985-08-14',NULL,_binary ''),(4,5,'35669191c32a9cfb532e5d79b09f2b0926c0faf27e7543f1fbe433bd94ae78d7','Laura','Ruiz','901234','laura.ruiz@example.com','1983-11-10',NULL,_binary ''),(5,3,'0bde0b648e414e6dcc7cb229c36b02178d4f9a0ae0ed199d56223dd83fcdf876','Alan','Camacho','r432432','43q@gmail.com','1991-01-16',NULL,_binary '\0'),(6,4,'password_admin','Carlos','Lópes','123456','carlos.lopez@example.com','1990-01-17',NULL,_binary '\0'),(7,7,'a5f643933b06668a9f74e6a6d378d41da76b4a7048fbabfd493c005eb2547a2e','Eduardo','Torrez','432543','et@gmail.com','1970-01-01',NULL,_binary ''),(8,6,'643432','Hector','Fernandez','745342','hf@gmail.com','1977-01-13',NULL,_binary ''),(9,2,'432542','Patricia','Lopez','546553','pl@gmail.com','1992-05-13',NULL,_binary ''),(10,2,'7ae06b158091b3a46c1986c835d2465a099859c0616ebff86b0995a22cd7d888','Gerardo','Peralta','543432','gp@gmail.com','1970-01-01',NULL,_binary ''),(11,10,'35669191c32a9cfb532e5d79b09f2b0926c0faf27e7543f1fbe433bd94ae78d7','fabio','camacho','43245','fc11@proton.org','1970-01-01',NULL,_binary ''),(12,4,'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79','Jorge','Fernandez','53134','jf@gmail.com','1970-01-01',NULL,_binary ''),(13,4,'holamundo','Pepe','Pena','53463','pp@gmail.com','1970-06-23','Pepe53463.jpg',_binary '\0');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-04 18:35:34
