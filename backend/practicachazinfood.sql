-- MySQL dump 10.13  Distrib 8.4.10, for Linux (x86_64)
--
-- Host: localhost    Database: chazinfood
-- ------------------------------------------------------
-- Server version	8.4.10-0ubuntu0.26.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adicion`
--

DROP TABLE IF EXISTS `adicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adicion` (
  `idAdicion` int NOT NULL AUTO_INCREMENT,
  `idInsumo` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idAdicion`),
  KEY `FK_AdicionInsumo` (`idInsumo`),
  CONSTRAINT `FK_AdicionInsumo` FOREIGN KEY (`idInsumo`) REFERENCES `insumo` (`idInsumo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adicion`
--

LOCK TABLES `adicion` WRITE;
/*!40000 ALTER TABLE `adicion` DISABLE KEYS */;
/*!40000 ALTER TABLE `adicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriainsumo`
--

DROP TABLE IF EXISTS `categoriainsumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoriainsumo` (
  `idCategoriaInsumo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint DEFAULT '1',
  PRIMARY KEY (`idCategoriaInsumo`),
  UNIQUE KEY `UK_CategoriaInsumo` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriainsumo`
--

LOCK TABLES `categoriainsumo` WRITE;
/*!40000 ALTER TABLE `categoriainsumo` DISABLE KEYS */;
INSERT INTO `categoriainsumo` VALUES (1,'Lácteos',NULL,1),(2,'Pan',NULL,1),(3,'Verduras',NULL,1),(4,'Salsas',NULL,1),(5,'Bebidas',NULL,1),(6,'Verduras Especiales',NULL,1),(7,'Salsas y Condimentos',NULL,1),(8,'Cereales','Choco Chrispis, Zucaritas, Frut Loops',1),(9,'Carnes','Res, Cerdo, Frias',1);
/*!40000 ALTER TABLE `categoriainsumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriaproducto`
--

DROP TABLE IF EXISTS `categoriaproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoriaproducto` (
  `idCategoriaProducto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idCategoriaProducto`),
  UNIQUE KEY `UK_CategoriaProducto` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriaproducto`
--

LOCK TABLES `categoriaproducto` WRITE;
/*!40000 ALTER TABLE `categoriaproducto` DISABLE KEYS */;
INSERT INTO `categoriaproducto` VALUES (1,'Hamburguesas',NULL,1),(2,'Perros Calientes',NULL,1),(3,'Bebidas',NULL,1),(4,'Combos',NULL,1),(5,'Pizzas',NULL,1);
/*!40000 ALTER TABLE `categoriaproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `UK_Cliente_Usuario` (`idUsuario`),
  KEY `IDX_ClienteUsuario` (`idUsuario`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (2,'Avenida Siempre Viva 742',12),(3,'Cl. 21 #80 21, Belén, Medellín',10),(4,'Calle Falsa 123',6),(5,'Calle 10 # 5-20',7),(6,'Avenida 33 # 80-10',9),(7,'Calle 45a #36a - 35',2),(8,'Callev35a #58b- 56',3),(10,'Calle 50a #45b - 60',11),(12,'',5),(13,'Calle 34B #112C - 54',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `idCompra` int NOT NULL AUTO_INCREMENT,
  `idProveedor` int NOT NULL,
  `fechaCompra` datetime DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(12,2) NOT NULL,
  `estado` enum('PENDIENTE','RECIBIDA','CANCELADA') COLLATE utf8mb4_unicode_ci DEFAULT 'RECIBIDA',
  PRIMARY KEY (`idCompra`),
  KEY `IDX_CompraProveedor` (`idProveedor`),
  CONSTRAINT `FK_CompraProveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descuento`
--

DROP TABLE IF EXISTS `descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descuento` (
  `idDescuento` int NOT NULL AUTO_INCREMENT,
  `idEvento` int NOT NULL,
  `nombreDescuento` varchar(120) NOT NULL,
  `tipoDescuento` enum('PORCENTAJE','VALOR FIJO') NOT NULL,
  `porcentaje` decimal(5,2) DEFAULT NULL,
  `valorFijo` decimal(10,2) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idDescuento`),
  KEY `IDX_DescuentoEvento` (`idEvento`),
  CONSTRAINT `FK_Descuento_Evento` FOREIGN KEY (`idEvento`) REFERENCES `evento` (`idEvento`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descuento`
--

LOCK TABLES `descuento` WRITE;
/*!40000 ALTER TABLE `descuento` DISABLE KEYS */;
/*!40000 ALTER TABLE `descuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallecomprainsumo`
--

DROP TABLE IF EXISTS `detallecomprainsumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallecomprainsumo` (
  `idDetalleCompra` int NOT NULL AUTO_INCREMENT,
  `idCompra` int NOT NULL,
  `idInsumo` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  PRIMARY KEY (`idDetalleCompra`),
  KEY `IDX_DetalleCompra` (`idCompra`),
  KEY `IDX_DetalleCompraInsumo` (`idInsumo`),
  CONSTRAINT `FK_DetalleCompra` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idCompra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DetalleCompraInsumo` FOREIGN KEY (`idInsumo`) REFERENCES `insumo` (`idInsumo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallecomprainsumo`
--

LOCK TABLES `detallecomprainsumo` WRITE;
/*!40000 ALTER TABLE `detallecomprainsumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallecomprainsumo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_EntradaInventario` AFTER INSERT ON `detallecomprainsumo` FOR EACH ROW BEGIN

    UPDATE insumo
    SET stock = stock + NEW.cantidad
    WHERE idInsumo = NEW.idInsumo;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detallefichainsumo`
--

DROP TABLE IF EXISTS `detallefichainsumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallefichainsumo` (
  `idDetalleFicha` int NOT NULL AUTO_INCREMENT,
  `idFichaTecnica` int NOT NULL,
  `idInsumo` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idDetalleFicha`),
  KEY `IDX_DetalleFichaTecnica` (`idFichaTecnica`),
  KEY `IDX_DetalleFichaInsumo` (`idInsumo`),
  CONSTRAINT `FK_DetalleFicha` FOREIGN KEY (`idFichaTecnica`) REFERENCES `fichatecnica` (`idFichaTecnica`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DetalleFichaInsumo` FOREIGN KEY (`idInsumo`) REFERENCES `insumo` (`idInsumo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallefichainsumo`
--

LOCK TABLES `detallefichainsumo` WRITE;
/*!40000 ALTER TABLE `detallefichainsumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallefichainsumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleinsumopreparadoinsumo`
--

DROP TABLE IF EXISTS `detalleinsumopreparadoinsumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleinsumopreparadoinsumo` (
  `idDetalle` int NOT NULL AUTO_INCREMENT,
  `idPreparado` int NOT NULL,
  `idInsumo` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `unidadMedida` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idDetalle`),
  KEY `fk_detalle_preparado` (`idPreparado`),
  KEY `fk_detalle_insumo_normal` (`idInsumo`),
  CONSTRAINT `fk_detalle_insumo_normal` FOREIGN KEY (`idInsumo`) REFERENCES `insumo` (`idInsumo`) ON DELETE CASCADE,
  CONSTRAINT `fk_detalle_preparado` FOREIGN KEY (`idPreparado`) REFERENCES `insumopreparado` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleinsumopreparadoinsumo`
--

LOCK TABLES `detalleinsumopreparadoinsumo` WRITE;
/*!40000 ALTER TABLE `detalleinsumopreparadoinsumo` DISABLE KEYS */;
INSERT INTO `detalleinsumopreparadoinsumo` VALUES (37,1,2,1.00,'paq',800.00);
/*!40000 ALTER TABLE `detalleinsumopreparadoinsumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleventaadicion`
--

DROP TABLE IF EXISTS `detalleventaadicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleventaadicion` (
  `idDetalleVentaAdicion` int NOT NULL AUTO_INCREMENT,
  `idDetalleVenta` int NOT NULL,
  `idAdicion` int NOT NULL,
  `cantidad` int DEFAULT '1',
  `precio` decimal(10,2) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  PRIMARY KEY (`idDetalleVentaAdicion`),
  KEY `IDX_DetalleVentaAdicion` (`idDetalleVenta`),
  KEY `IDX_Adicion` (`idAdicion`),
  CONSTRAINT `FK_DetalleVentaAdicion` FOREIGN KEY (`idDetalleVenta`) REFERENCES `detalleventaproducto` (`idDetalleVenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DetalleVentaAdicion2` FOREIGN KEY (`idAdicion`) REFERENCES `adicion` (`idAdicion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleventaadicion`
--

LOCK TABLES `detalleventaadicion` WRITE;
/*!40000 ALTER TABLE `detalleventaadicion` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleventaadicion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_AdicionesInventario` AFTER INSERT ON `detalleventaadicion` FOR EACH ROW BEGIN
    UPDATE insumo
    SET stock = stock - NEW.cantidad
    WHERE idInsumo = (
        SELECT idInsumo
        FROM adicion
        WHERE idAdicion = NEW.idAdicion
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalleventaproducto`
--

DROP TABLE IF EXISTS `detalleventaproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleventaproducto` (
  `idDetalleVenta` int NOT NULL AUTO_INCREMENT,
  `idVenta` int NOT NULL,
  `idVariante` int NOT NULL,
  `cantidad` int NOT NULL DEFAULT '1',
  `precioUnitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  `observaciones` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idDetalleVenta`),
  KEY `IDX_DetalleVenta` (`idVenta`),
  KEY `IDX_DetalleVentaVariante` (`idVariante`),
  CONSTRAINT `FK_DetalleVenta` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DetalleVentaVariante` FOREIGN KEY (`idVariante`) REFERENCES `variante` (`idVariante`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleventaproducto`
--

LOCK TABLES `detalleventaproducto` WRITE;
/*!40000 ALTER TABLE `detalleventaproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleventaproducto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_SalidaInventario` AFTER INSERT ON `detalleventaproducto` FOR EACH ROW BEGIN

    UPDATE insumo i
    INNER JOIN detalleFichaInsumo d
        ON d.idInsumo = i.idInsumo
    INNER JOIN fichaTecnica f
        ON f.idFichaTecnica = d.idFichaTecnica
    SET i.stock = i.stock - (d.cantidad * NEW.cantidad)
    WHERE f.idVariante = NEW.idVariante;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `devolucion`
--

DROP TABLE IF EXISTS `devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devolucion` (
  `idDevolucion` int NOT NULL AUTO_INCREMENT,
  `idVenta` int NOT NULL,
  `motivo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `valorDevuelto` decimal(12,2) DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('PENDIENTE','ACEPTADA','RECHAZADA') COLLATE utf8mb4_unicode_ci DEFAULT 'PENDIENTE',
  PRIMARY KEY (`idDevolucion`),
  KEY `IDX_DevolucionVenta` (`idVenta`),
  CONSTRAINT `FK_DevolucionVenta` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucion`
--

LOCK TABLES `devolucion` WRITE;
/*!40000 ALTER TABLE `devolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `idEvento` int NOT NULL AUTO_INCREMENT,
  `nombreEvento` varchar(120) NOT NULL,
  `descripcion` text,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fichatecnica`
--

DROP TABLE IF EXISTS `fichatecnica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fichatecnica` (
  `idFichaTecnica` int NOT NULL AUTO_INCREMENT,
  `idVariante` int NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `fechaCreacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idFichaTecnica`),
  KEY `IDX_FichaTecnicaVariante` (`idVariante`),
  CONSTRAINT `FK_FichaTecnicaVariante` FOREIGN KEY (`idVariante`) REFERENCES `variante` (`idVariante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fichatecnica`
--

LOCK TABLES `fichatecnica` WRITE;
/*!40000 ALTER TABLE `fichatecnica` DISABLE KEYS */;
/*!40000 ALTER TABLE `fichatecnica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo` (
  `idInsumo` int NOT NULL AUTO_INCREMENT,
  `idCategoriaInsumo` int NOT NULL,
  `nombre` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unidadMedida` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` decimal(10,2) DEFAULT '0.00',
  `stockMinimo` decimal(10,2) DEFAULT '0.00',
  `fechaExpedicion` date DEFAULT NULL,
  `fechaVencimiento` date DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `precioUnitario` decimal(10,2) DEFAULT '0.00',
  `idProveedor` int DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idInsumo`),
  KEY `IDX_InsumoCategoria` (`idCategoriaInsumo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES (1,6,'aguacate','und',60.00,0.00,NULL,NULL,1,0.00,NULL,NULL),(2,7,'salsa rosada','paq',40.00,0.00,NULL,NULL,1,0.00,NULL,NULL);
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumopreparado`
--

DROP TABLE IF EXISTS `insumopreparado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumopreparado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precioVenta` decimal(10,2) NOT NULL,
  `unidadMedida` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaCreacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` tinyint(1) DEFAULT '1',
  `rendimiento` decimal(10,2) DEFAULT '1.00',
  `unidadRendimiento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'und',
  `costoTotal` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumopreparado`
--

LOCK TABLES `insumopreparado` WRITE;
/*!40000 ALTER TABLE `insumopreparado` DISABLE KEYS */;
INSERT INTO `insumopreparado` VALUES (1,'salsa de la casa','salsa de la casa 100% artesanal',2000.00,'porción','2026-07-17 11:00:45',1,1.00,'und',0.00),(2,'Salsa Especial de la Casa','Receta casera',7500.00,'und','2026-07-23 05:57:07',1,1.00,'und',3400.00),(3,'Receta Especial Jalapeños','Con queso chedart',10000.00,'und','2026-07-23 05:57:52',0,1.00,'und',3400.00);
/*!40000 ALTER TABLE `insumopreparado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `idPago` int NOT NULL AUTO_INCREMENT,
  `idVenta` int NOT NULL,
  `metodoPago` enum('EFECTIVO','TARJETA','NEQUI','DAVIPLATA','TRANSFERENCIA') COLLATE utf8mb4_unicode_ci NOT NULL,
  `referenciaExterna` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monto` decimal(12,2) NOT NULL,
  `fechaPago` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('PENDIENTE','APROBADO','RECHAZADO') COLLATE utf8mb4_unicode_ci DEFAULT 'APROBADO',
  PRIMARY KEY (`idPago`),
  KEY `IDX_PagoVenta` (`idVenta`),
  CONSTRAINT `FK_PagoVenta` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clienteId` int DEFAULT NULL,
  `items` text,
  `total` decimal(10,2) NOT NULL,
  `estado` varchar(50) DEFAULT 'pendiente',
  `metodoPago` varchar(50) DEFAULT 'efectivo',
  `fechaCreacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso` (
  `idPermiso` int NOT NULL AUTO_INCREMENT,
  `nombrePermiso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idPermiso`),
  UNIQUE KEY `UK_Permiso` (`nombrePermiso`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (3,'Categoría Insumos'),(8,'Categoría Productos'),(13,'Clientes'),(2,'Compras'),(16,'Configuración'),(1,'Dashboard'),(10,'Fichas Técnicas'),(6,'Gestión de Compras'),(11,'Gestión de Producción'),(14,'Gestión de Ventas'),(4,'Insumos'),(7,'Producción'),(9,'Productos'),(5,'Proveedores'),(15,'Punto de Venta'),(18,'Roles'),(17,'Usuarios'),(12,'Ventas');
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `idCategoriaProducto` int NOT NULL,
  `nombre` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `precio` decimal(10,2) DEFAULT '0.00',
  `stock` int DEFAULT '0',
  `categoria` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `adiciones` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`idProducto`),
  KEY `IDX_ProductoCategoria` (`idCategoriaProducto`),
  CONSTRAINT `FK_ProductoCategoria` FOREIGN KEY (`idCategoriaProducto`) REFERENCES `categoriaproducto` (`idCategoriaProducto`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idProveedor` int NOT NULL AUTO_INCREMENT,
  `idTipoProveedor` int NOT NULL,
  `idTipoDocumento` int NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numeroDocumento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint DEFAULT '1',
  `nombreContacto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idProveedor`),
  KEY `IDX_ProveedorTipo` (`idTipoProveedor`),
  KEY `IDX_ProveedorDocumento` (`idTipoDocumento`),
  CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`idTipoProveedor`) REFERENCES `tipoproveedor` (`idTipoProveedor`) ON UPDATE CASCADE,
  CONSTRAINT `proveedor_ibfk_2` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumento` (`idTipoDocumento`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,1,1,'FruVer SA','900.123.456-7','604 123 4567','ventas@fruversa.com','Calle 50 #45-30, Medellín',1,'Juan Pérez'),(2,1,1,'Carnes Premium','900.234.567-8','604 234 5678','info@carnespremium.com','Carrera 43A #12-80, Medellín',1,'María García'),(3,1,1,'Avícola del Sur','900.345.678-9','604 345 6789','ventas@avicolasur.com','Calle 10 Sur #48-20, Envigado',1,'Carlos López'),(4,1,1,'Lácteos del Valle','900.456.789-0','604 456 7890','contacto@lacteosval.com','Avenida Las Palmas #55-100, Medellín',1,'Ana Martínez'),(5,2,1,'Panadería El Trigo','43.123.456-7','604 567 8901','eltrigo@gmail.com','Calle 33 #70-25, Medellín',1,'Luis Rodríguez'),(6,1,1,'Distribuidora Andina','900.567.890-1','604 678 9012','ventas@distrandina.com','Carrera 65 #8B-91, Medellín',0,'Pedro Gómez');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint DEFAULT '1',
  PRIMARY KEY (`idRol`),
  UNIQUE KEY `UK_Rol_Nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador','Acceso total',1),(2,'Cocinero','Acceso a producción y fichas técnicas',1),(3,'Cliente','Acceso básico para realizar pedidos',1);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolpermiso`
--

DROP TABLE IF EXISTS `rolpermiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rolpermiso` (
  `idRolPermiso` int NOT NULL AUTO_INCREMENT,
  `idRol` int NOT NULL,
  `idPermiso` int NOT NULL,
  PRIMARY KEY (`idRolPermiso`),
  UNIQUE KEY `UK_Rol_Permiso` (`idRol`,`idPermiso`),
  KEY `IDX_RolPermisoRol` (`idRol`),
  KEY `IDX_RolPermisoPermiso` (`idPermiso`),
  CONSTRAINT `rolpermiso_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rolpermiso_ibfk_2` FOREIGN KEY (`idPermiso`) REFERENCES `permiso` (`idPermiso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolpermiso`
--

LOCK TABLES `rolpermiso` WRITE;
/*!40000 ALTER TABLE `rolpermiso` DISABLE KEYS */;
INSERT INTO `rolpermiso` VALUES (6,1,1),(4,1,2),(1,1,3),(11,1,4),(14,1,5),(8,1,6),(12,1,7),(2,1,8),(13,1,9),(7,1,10),(9,1,11),(18,1,12),(3,1,13),(10,1,14),(15,1,15),(5,1,16),(17,1,17),(16,1,18),(47,2,1),(48,2,2),(49,2,3),(37,3,1),(40,3,12),(38,3,14),(39,3,15);
/*!40000 ALTER TABLE `rolpermiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipodocumento` (
  `idTipoDocumento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idTipoDocumento`),
  UNIQUE KEY `UK_TipoDocumento` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodocumento`
--

LOCK TABLES `tipodocumento` WRITE;
/*!40000 ALTER TABLE `tipodocumento` DISABLE KEYS */;
INSERT INTO `tipodocumento` VALUES (1,'CC'),(2,'CE'),(3,'NIT'),(4,'Pasaporte');
/*!40000 ALTER TABLE `tipodocumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoproveedor`
--

DROP TABLE IF EXISTS `tipoproveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoproveedor` (
  `idTipoProveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idTipoProveedor`),
  UNIQUE KEY `UK_TipoProveedor` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoproveedor`
--

LOCK TABLES `tipoproveedor` WRITE;
/*!40000 ALTER TABLE `tipoproveedor` DISABLE KEYS */;
INSERT INTO `tipoproveedor` VALUES (2,'Distribuidor'),(3,'Fabricante'),(1,'Mayorista');
/*!40000 ALTER TABLE `tipoproveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trazabilidad`
--

DROP TABLE IF EXISTS `trazabilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trazabilidad` (
  `idTrazabilidad` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entidadNombre` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detalle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leido` tinyint(1) DEFAULT '0',
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `idInsumo` int DEFAULT NULL,
  `tipoMovimiento` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `motivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usuarioId` int DEFAULT NULL,
  PRIMARY KEY (`idTrazabilidad`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trazabilidad`
--

LOCK TABLES `trazabilidad` WRITE;
/*!40000 ALTER TABLE `trazabilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `trazabilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoDocumento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVO',
  `fechaRegistro` datetime DEFAULT NULL,
  `idRol` int NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `UK_Usuario_Email` (`email`),
  UNIQUE KEY `email` (`email`),
  KEY `IDX_UsuarioRol` (`idRol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Fernando','Gómez Jaramillo','C.C.','3014599890','gomezjaramillofer@gmail.com','$2a$10$sFvJOfW0CcBw824E3CENLeuoUQig40lzRQWf67L9CxUUdvFcsoFH.','ACTIVO','2026-07-26 20:09:41',3),(2,'Juan Alberto','Pérez Palermo','C.C.','3456457689','testgestionusuarios@gmail.com','$2a$10$e/p3rV1gEKEGUhT3F6FxG.MOTnyYdSh3m533n7UeVifuKffYi6MQC','ACTIVO','2026-07-20 18:40:14',3),(3,'Juan ALbeiro','Perez Oso','C.C.','314567897','gomezpavas26@gmail.com','$2a$10$j5oVx6JEwM.KjqhBZyM05uF6.D5f.xRWFtCQQRX47UDhzidE5qvVq','ACTIVO','2026-07-21 17:01:48',3),(4,'Admin','Sistema','C.C.','3190000001','admin@chazinfood.com','$2a$10$zWESJ7NxXNvYUZRqaHgD2ORJ8w2wsXpO4S8JMRXVxQsQwjGtckBTW','ACTIVO','2026-07-18 11:53:44',1),(5,'Carlos','Martínez','C.C.','3190000003','cocinero@chazinfood.com','$2a$10$f3THOwAeUHVUT87ubvsInOOBwrhOqIerJvJfWnWuwI86n.VPm5HNS','ACTIVO','2026-07-18 13:02:36',2),(6,'María','García','C.C.','3190000002','cliente@chazinfood.com','$2a$10$Gq2mDwkIKFdcshaYtjiayOu0ilIs.1G.FlvTWo9d6R3iVOIoLZRNq','ACTIVO','2026-07-18 13:02:36',3),(7,'Ana','Martínez','C.C.','3190000004','ana.martinez@chazinfood.com','$2a$10$pgPCLRzjuABNj2teljRYsOGCK.4BNyxpeXmrX/BE4/VkIAiWonOeW','ACTIVO','2026-07-18 13:02:36',3),(8,'Luis','Rodríguez','C.C.','3190000005','luis.rodriguez@chazinfood.com','$2a$10$so2k56hBmTlkKkyIE7SOWuHPdIWBHB89vG.3L.dwGWVTXu8aLVsHK','ACTIVO','2026-07-18 13:02:36',2),(9,'Sandra','Gómez','C.C.','3190000006','sandra.gomez@chazinfood.com','$2a$10$phMmRnOVMy0225SkqUNtgeL052lNC1TR3Jt1xfWrx9n7J7w.S2g5K','ACTIVO','2026-07-18 13:02:37',3),(10,'Alexis','Gómez Pavas','C.C.','3023155969','gomezpavas34@gmail.com','$2a$10$iz/WLUsWy6UdDkJ8MQMxguMy9fjq5JSJGlmNGZ6cA2.hPjM7pnR.e','ACTIVO','2026-07-18 13:02:36',3),(11,'Alejandro','Gómez Plata','T.I.','3456897065','agp7ytwxp@gmail.com','$2a$10$gtCAOCDL/8D0XSq/VtQ3XOH9SY16Wn.WTNUDNEUBBsuAOpa5neUky','ACTIVO','2026-07-23 04:07:38',3),(12,'María Modificada','García López','C.C.','3190000002','maria@correo.com','$2a$10$4v55hrZPMEk3zLiJfU5fo.J6rRy17QeQHpRQHBfvOh07OsKfiQM.W','ACTIVO','2026-07-18 11:57:25',3);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variante`
--

DROP TABLE IF EXISTS `variante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variante` (
  `idVariante` int NOT NULL AUTO_INCREMENT,
  `idProducto` int NOT NULL,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idVariante`),
  KEY `IDX_VarianteProducto` (`idProducto`),
  CONSTRAINT `FK_VarianteProducto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variante`
--

LOCK TABLES `variante` WRITE;
/*!40000 ALTER TABLE `variante` DISABLE KEYS */;
/*!40000 ALTER TABLE `variante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `idVenta` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `idUsuario` int NOT NULL,
  `idDescuento` int DEFAULT NULL,
  `fechaVenta` datetime DEFAULT CURRENT_TIMESTAMP,
  `subtotal` decimal(12,2) NOT NULL,
  `descuentoAplicado` decimal(12,2) DEFAULT '0.00',
  `total` decimal(12,2) NOT NULL,
  `estadoEntrega` enum('PENDIENTE','PREPARANDO','LISTO','EN_CAMINO','ENTREGADO','CANCELADO') COLLATE utf8mb4_unicode_ci DEFAULT 'PENDIENTE',
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`idVenta`),
  KEY `IDX_VentaCliente` (`idCliente`),
  KEY `IDX_VentaUsuario` (`idUsuario`),
  KEY `IDX_VentaDescuento` (`idDescuento`),
  CONSTRAINT `FK_VentaCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON UPDATE CASCADE,
  CONSTRAINT `FK_VentaDescuento` FOREIGN KEY (`idDescuento`) REFERENCES `descuento` (`idDescuento`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_VentaUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vwinventario`
--

DROP TABLE IF EXISTS `vwinventario`;
/*!50001 DROP VIEW IF EXISTS `vwinventario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwinventario` AS SELECT 
 1 AS `idInsumo`,
 1 AS `nombre`,
 1 AS `Categoria`,
 1 AS `stock`,
 1 AS `stockMinimo`,
 1 AS `unidadMedida`,
 1 AS `fechaVencimiento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwproductos`
--

DROP TABLE IF EXISTS `vwproductos`;
/*!50001 DROP VIEW IF EXISTS `vwproductos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwproductos` AS SELECT 
 1 AS `idProducto`,
 1 AS `nombre`,
 1 AS `Categoria`,
 1 AS `Variante`,
 1 AS `precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwventas`
--

DROP TABLE IF EXISTS `vwventas`;
/*!50001 DROP VIEW IF EXISTS `vwventas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwventas` AS SELECT 
 1 AS `idVenta`,
 1 AS `Cliente`,
 1 AS `fechaVenta`,
 1 AS `subtotal`,
 1 AS `descuentoAplicado`,
 1 AS `total`,
 1 AS `estadoEntrega`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'chazinfood'
--
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarCompra`(IN `pProveedor` INT, IN `pTotal` DECIMAL(10,2))
BEGIN

INSERT INTO compra(

idProveedor,

fechaCompra,

total,

estado

)

VALUES(

pProveedor,

NOW(),

pTotal,

'RECIBIDA'

);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarVenta`(IN `pCliente` INT, IN `pUsuario` INT, IN `pSubtotal` DECIMAL(10,2), IN `pDescuento` DECIMAL(10,2), IN `pTotal` DECIMAL(10,2))
BEGIN

INSERT INTO venta(

idCliente,

idUsuario,

fechaVenta,

subtotal,

descuentoAplicado,

total

)

VALUES(

pCliente,

pUsuario,

NOW(),

pSubtotal,

pDescuento,

pTotal

);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vwinventario`
--

/*!50001 DROP VIEW IF EXISTS `vwinventario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwinventario` AS select `i`.`idInsumo` AS `idInsumo`,`i`.`nombre` AS `nombre`,`c`.`nombre` AS `Categoria`,`i`.`stock` AS `stock`,`i`.`stockMinimo` AS `stockMinimo`,`i`.`unidadMedida` AS `unidadMedida`,`i`.`fechaVencimiento` AS `fechaVencimiento` from (`insumo` `i` join `categoriainsumo` `c` on((`c`.`idCategoriaInsumo` = `i`.`idCategoriaInsumo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwproductos`
--

/*!50001 DROP VIEW IF EXISTS `vwproductos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwproductos` AS select `p`.`idProducto` AS `idProducto`,`p`.`nombre` AS `nombre`,`cp`.`nombre` AS `Categoria`,`v`.`nombre` AS `Variante`,`v`.`precio` AS `precio` from ((`producto` `p` join `categoriaproducto` `cp` on((`cp`.`idCategoriaProducto` = `p`.`idCategoriaProducto`))) join `variante` `v` on((`v`.`idProducto` = `p`.`idProducto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwventas`
--

/*!50001 DROP VIEW IF EXISTS `vwventas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwventas` AS select `v`.`idVenta` AS `idVenta`,concat(`u`.`nombre`,' ',`u`.`apellidos`) AS `Cliente`,`v`.`fechaVenta` AS `fechaVenta`,`v`.`subtotal` AS `subtotal`,`v`.`descuentoAplicado` AS `descuentoAplicado`,`v`.`total` AS `total`,`v`.`estadoEntrega` AS `estadoEntrega` from ((`venta` `v` join `cliente` `c` on((`c`.`idCliente` = `v`.`idCliente`))) join `usuario` `u` on((`u`.`idUsuario` = `c`.`idUsuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-29  8:02:37
