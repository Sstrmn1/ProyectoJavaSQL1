CREATE DATABASE  IF NOT EXISTS `bd_genolab` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
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
  `descripcion` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `concentracion` float DEFAULT NULL,
  `codigo` varchar(15) COLLATE utf8mb3_spanish_ci NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_articulo`),
  UNIQUE KEY `id_articulo_UNIQUE` (`id_articulo`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `fk_articulo_ffarmaceutica_idx` (`id_ffarmaceutica`),
  CONSTRAINT `fk_articulo_ffarmaceutica` FOREIGN KEY (`id_ffarmaceutica`) REFERENCES `forma_farmaceutica` (`id_ffarmaceutica`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (1,1,'Amoxicilina 500mg',500,'AMOX001',_binary ''),(2,2,'Complejo B 2ml',2,'CB001',_binary ''),(3,1,'Paracetamol 500mg',500,'PARA001',_binary ''),(4,3,'Vitamina C 5ml',5,'VITC001',_binary '');
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
  `nombre` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `tipo_documento` varchar(45) COLLATE utf8mb3_spanish_ci NOT NULL,
  `numero_documento` varchar(45) COLLATE utf8mb3_spanish_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8mb3_spanish_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `id_cliente_UNIQUE` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan Ramos','NIT','123456789','555-1234','juan.ramos@example.com',_binary ''),(2,'Jose Perez','NIT','987654321','555-5678','jose.perez@example.com',_binary ''),(3,'Ana Fernandez','NIT','456789012','555-9012','ana.fernandez@example.com',_binary '');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `iddireccion` int NOT NULL AUTO_INCREMENT,
  `id_distrito` int NOT NULL,
  `id_cliente` int NOT NULL,
  `calle` varchar(55) COLLATE utf8mb3_spanish_ci NOT NULL,
  `numero` varchar(45) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `oficina` varchar(45) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`iddireccion`),
  UNIQUE KEY `iddireccion_UNIQUE` (`iddireccion`),
  KEY `fk_direccion_cliente_idx` (`id_cliente`),
  KEY `fk_direccion_distrito_idx` (`id_distrito`),
  CONSTRAINT `fk_direccion_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_direccion_distrito` FOREIGN KEY (`id_distrito`) REFERENCES `distrito` (`id_distrito`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,1,1,'Calle A','123','Oficina 1',_binary ''),(2,2,2,'Avenida B','456','Oficina 2',_binary ''),(3,3,3,'Calle C','789','Oficina 3',_binary '');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distrito`
--

DROP TABLE IF EXISTS `distrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distrito` (
  `id_distrito` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(75) COLLATE utf8mb3_spanish_ci NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_distrito`),
  UNIQUE KEY `id_distrito_UNIQUE` (`id_distrito`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distrito`
--

LOCK TABLES `distrito` WRITE;
/*!40000 ALTER TABLE `distrito` DISABLE KEYS */;
INSERT INTO `distrito` VALUES (1,'Cochabamba',_binary ''),(2,'La Paz',_binary ''),(3,'Santa Cruz',_binary '');
/*!40000 ALTER TABLE `distrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `idempresa` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) COLLATE utf8mb3_spanish_ci NOT NULL,
  `nit` varchar(45) COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`idempresa`),
  UNIQUE KEY `idempresa_UNIQUE` (`idempresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'GenoLab','5624634');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
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
  `codigo_autorizacion` varchar(45) COLLATE utf8mb3_spanish_ci NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_factura`),
  KEY `fk_factura_orden_idx` (`id_orden`),
  CONSTRAINT `fk_factura_orden` FOREIGN KEY (`id_orden`) REFERENCES `orden_de_venta` (`id_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,1,'AUT001','2023-11-13 18:46:34',_binary ''),(2,2,'AUT002','2023-11-13 18:46:34',_binary ''),(3,3,'AUT003','2023-11-13 18:46:34',_binary '');
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
  `descripcion` varchar(40) COLLATE utf8mb3_spanish_ci NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_ffarmaceutica`),
  UNIQUE KEY `id_ffarmaceutica_UNIQUE` (`id_ffarmaceutica`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_farmaceutica`
--

LOCK TABLES `forma_farmaceutica` WRITE;
/*!40000 ALTER TABLE `forma_farmaceutica` DISABLE KEYS */;
INSERT INTO `forma_farmaceutica` VALUES (1,'Comprimido',_binary ''),(2,'Cápsula',_binary ''),(3,'Inyectable',_binary '');
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
  `nombre` varchar(75) COLLATE utf8mb3_spanish_ci NOT NULL,
  `procedencia` varchar(75) COLLATE utf8mb3_spanish_ci NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_laboratorio`),
  UNIQUE KEY `id_laboratorio_UNIQUE` (`id_laboratorio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratorio`
--

LOCK TABLES `laboratorio` WRITE;
/*!40000 ALTER TABLE `laboratorio` DISABLE KEYS */;
INSERT INTO `laboratorio` VALUES (1,'Sinochem','China',_binary ''),(2,'Ningbo','China',_binary ''),(3,'Laboratorios Chile','Chile',_binary '');
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
  `codigo` varchar(20) COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id_lote`),
  UNIQUE KEY `id_lote_UNIQUE` (`id_lote`),
  KEY `fk_lote_articulo_idx` (`id_articulo`),
  KEY `fk_lote_laboratorio_idx` (`id_laboratorio`),
  CONSTRAINT `fk_lote_articulo` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_articulo`),
  CONSTRAINT `fk_lote_laboratorio` FOREIGN KEY (`id_laboratorio`) REFERENCES `laboratorio` (`id_laboratorio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
INSERT INTO `lote` VALUES (1,1,1,'2023-11-01','2024-11-01',494000,0.50,_binary '','LOTE001'),(2,2,2,'2023-11-01','2024-11-01',494000,0.40,_binary '','LOTE002'),(3,3,1,'2023-11-01','2024-11-01',485000,0.30,_binary '','LOTE003'),(4,4,3,'2023-11-01','2024-11-01',495000,0.20,_binary '','LOTE004');
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
  `id_cliente` int NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `importe_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `fk_orden_usuario_idx` (`id_usuario`),
  KEY `fk_orden_cliente_idx` (`id_cliente`),
  CONSTRAINT `fk_orden_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_orden_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_de_venta`
--

LOCK TABLES `orden_de_venta` WRITE;
/*!40000 ALTER TABLE `orden_de_venta` DISABLE KEYS */;
INSERT INTO `orden_de_venta` VALUES (1,1,2,'2023-11-13 18:46:34',3800.00),(2,2,2,'2023-11-13 18:46:34',3700.00),(3,3,2,'2023-11-13 18:46:34',3400.00);
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
  `id_empresa` int NOT NULL,
  `nombre` varchar(60) COLLATE utf8mb3_spanish_ci NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_rol`),
  KEY `fk_rol_empresa_idx` (`id_empresa`),
  CONSTRAINT `fk_rol_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`idempresa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,1,'Administrador',_binary ''),(2,1,'Ventas',_binary ''),(3,1,'Regencia Farmaceutica',_binary ''),(4,1,'Almacenes',_binary '');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
INSERT INTO `transaccion` VALUES (1,1,1,6000,'2023-11-13 18:46:34'),(2,2,1,2000,'2023-11-13 18:46:34'),(3,2,2,4000,'2023-11-13 18:46:34'),(4,3,2,7000,'2023-11-13 18:46:34'),(5,3,3,8000,'2023-11-13 18:46:34'),(6,4,3,5000,'2023-11-13 18:46:34');
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
  `password` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `ci` varchar(20) COLLATE utf8mb3_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `foto` varchar(70) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `idusuario_UNIQUE` (`id_usuario`),
  KEY `fk_usuario_rol_idx` (`id_rol`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'password_admin','Carlos','López','123456','carlos.lopez@example.com','1990-01-01',NULL,_binary ''),(2,2,'password_ventas','Sofía','González','789012','sofia.gonzalez@example.com','1992-05-15',NULL,_binary ''),(3,3,'password_regencia','Miguel','Martínez','345678','miguel.martinez@example.com','1985-08-20',NULL,_binary ''),(4,4,'password_almacenes','Laura','Ruiz','901234','laura.ruiz@example.com','1988-11-10',NULL,_binary '');
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

-- Dump completed on 2023-11-13 18:47:12
