-- MariaDB dump 10.19  Distrib 10.5.16-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: elregio
-- ------------------------------------------------------
-- Server version	10.5.16-MariaDB

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
-- Table structure for table `CITAS`
--

DROP TABLE IF EXISTS `CITAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CITAS` (
  `id_cita` int(11) NOT NULL AUTO_INCREMENT,
  `id_medico` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `Fecha_Hora` datetime NOT NULL,
  `Hora_Fin` datetime NOT NULL,
  PRIMARY KEY (`id_cita`),
  KEY `id_medico` (`id_medico`),
  KEY `id_paciente` (`id_paciente`),
  CONSTRAINT `CITAS_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `MEDICO` (`id_medico`),
  CONSTRAINT `CITAS_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `PACIENTE` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CITAS`
--

LOCK TABLES `CITAS` WRITE;
/*!40000 ALTER TABLE `CITAS` DISABLE KEYS */;
INSERT INTO `CITAS` VALUES (1,2,1,'Dolor de cabeza','2023-05-19 15:00:00','2023-05-19 17:00:00'),(6,6,1,'Dolor de cabeza','2023-05-19 12:00:00','2023-05-19 14:00:00'),(7,1,3,'DOLOR DE ESTOMAGO','2023-05-17 00:00:00','2023-05-18 00:00:00'),(8,1,3,'DOLOR DE ','2023-05-15 08:00:00','2023-05-15 08:30:00'),(9,2,3,'Dolor de estomago','2023-05-22 11:00:00','2023-05-22 13:00:00'),(10,2,3,'Dolor de pecho','2023-05-24 11:00:00','2023-05-24 13:00:00');
/*!40000 ALTER TABLE `CITAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HISTORIAL_CLINICO`
--

DROP TABLE IF EXISTS `HISTORIAL_CLINICO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HISTORIAL_CLINICO` (
  `id_historial` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `enfermedadesPrevias` varchar(255) DEFAULT NULL,
  `medicamentos` varchar(255) DEFAULT NULL,
  `cirugias` varchar(255) DEFAULT NULL,
  `antecedentes` varchar(255) DEFAULT NULL,
  `tipoSangre` varchar(10) DEFAULT NULL,
  `alergias` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `fk_historial_paciente` (`id_paciente`),
  CONSTRAINT `fk_historial_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `PACIENTE` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HISTORIAL_CLINICO`
--

LOCK TABLES `HISTORIAL_CLINICO` WRITE;
/*!40000 ALTER TABLE `HISTORIAL_CLINICO` DISABLE KEYS */;
INSERT INTO `HISTORIAL_CLINICO` VALUES (1,1,'2023-05-10','asdadsa','dsadada','da','ada','dada','dadada'),(2,1,'2023-05-13','a','aadad','aadasdad','sad','','asddsa'),(3,3,'2023-05-12','Neumonia','Genoprazol, Ketorolaco, Paracetamol','Cirugia de Riñon','Diabettes','A+','Alergia al Polvo'),(4,6,'2023-05-02','las gomitas','paracetamol','cirugia de estomago','diabetes tipo 3','O negativa','Al polen');
/*!40000 ALTER TABLE `HISTORIAL_CLINICO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HORARIO_MEDICO`
--

DROP TABLE IF EXISTS `HORARIO_MEDICO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HORARIO_MEDICO` (
  `id_horario` int(11) NOT NULL AUTO_INCREMENT,
  `id_medico` int(11) DEFAULT NULL,
  `diaSemana` varchar(10) DEFAULT NULL,
  `horaInicio` time DEFAULT NULL,
  `horaFin` time DEFAULT NULL,
  PRIMARY KEY (`id_horario`),
  KEY `id_medico` (`id_medico`),
  CONSTRAINT `HORARIO_MEDICO_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `MEDICO` (`id_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HORARIO_MEDICO`
--

LOCK TABLES `HORARIO_MEDICO` WRITE;
/*!40000 ALTER TABLE `HORARIO_MEDICO` DISABLE KEYS */;
/*!40000 ALTER TABLE `HORARIO_MEDICO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEDICO`
--

DROP TABLE IF EXISTS `MEDICO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEDICO` (
  `id_medico` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `especialidad` varchar(255) NOT NULL,
  `medico_foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_medico`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEDICO`
--

LOCK TABLES `MEDICO` WRITE;
/*!40000 ALTER TABLE `MEDICO` DISABLE KEYS */;
INSERT INTO `MEDICO` VALUES (1,'Dra. María Hernández','+52 (81) 4567 8901','Ginecología','doctor-1'),(2,'Dr. Juan Pérez','+52 (81) 1234 5678','Cardiología','doctor-2'),(3,'Dr. José López','+52 (81) 2345 6789','Neurología','doctor-3'),(4,'Dr. Pedro Gómez','+52 (81) 3456 7890','Pediatría','doctor-4'),(6,'Dra. Ana Torres','+52 (81) 5678 9012','Dermatología','doctor-6'),(7,'Dr. Francisco Ramírez','+52 (81) 5678 9012','Psiquiatría','doctor-7');
/*!40000 ALTER TABLE `MEDICO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PACIENTE`
--

DROP TABLE IF EXISTS `PACIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PACIENTE` (
  `id_paciente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contrasena` varchar(150) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  PRIMARY KEY (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PACIENTE`
--

LOCK TABLES `PACIENTE` WRITE;
/*!40000 ALTER TABLE `PACIENTE` DISABLE KEYS */;
INSERT INTO `PACIENTE` VALUES (1,'EPEP',NULL,'Calle 25 #229','8124297946','ricar@localhost.com','PEPE','RUIZ'),(2,'Ricardo Arath','2023-05-24','Calle 25 #229','8124297946','wqeqwear@localhost.com','pepe','Sanchez Aguirre'),(3,'DIEGO','2003-12-09','San jemo','210387394601','diegobases1103@gmail.com','666','Linados'),(6,'Ricardo Arath','2023-05-18','Calle 25 #229','8124297946','epep@localhost.com','ewwqe','Sanchez Aguirre'),(8,'Ricardo Arath','2023-05-17','Calle 25 #229','8124297946','ricar@localhost.com','pepe','Sanchez Aguirre'),(9,'Manuel','2023-05-11','Calle 25 #229','8124297946','wqeqwear@localhost.com','miguel','Cantu'),(10,'luis','2131-02-13','2321','2133','21312@213.com','pepe','suarez'),(11,'Ricardo Arath','2023-06-02','qwewq','8124297946','wqeqwear@localhost.com','pepe','Sanchez Aguirre'),(12,'Ricardo Arath','2023-05-31','wqewq','8124297946','weqweq@gmail.com','pepe','Sanchez Aguirre'),(13,'Ricardo Arath','2023-05-31','wqewq','8124297946','weqweq@gmail.com','pepe','Sanchez Aguirre'),(14,'Ricardo Arath','2023-06-10','qweqw','8124297946','wqeqwear@localhost.com','wqeqw','Sanchez Aguirre'),(15,'David','2003-03-20','por la udem calle 2','8661214242','david@trevino.com','611','Treviño'),(16,'Luis Guillermo','2003-06-18','Privada Lomás del Vergel #1118, colonia Valle de San Lucas, San Pedro Garza García, Nuevo León','8110438833','luisroman@udem.edu','luis1','Román Escalera'),(17,'David','2000-06-30','Calle Antigua Aserradero #2010, colonia Mitras centro, Monterrey, Nuevo León','8135983377','david.trevino@hotmail.com','david2','Treviño Camavinga'),(18,'Manuel','2006-10-31','Calle 15 #229, colonia Nuevo Las Puentes, San Nicolas de los Garza, Nuevo León','5532539278','manu.ort@hotmail.com','manu3','Ortega Montemayor'),(19,'Mariana','2002-08-15','De la Rosa #1110, colonia Hacienda de las Parras, Santa Catarina, Nuevo León','8183309006','mariana@gmail.com','mariana.2023','Moreno Lichnovsky'),(20,'Luis','2023-05-16','Calle 25 #559. San Pedro, Nuevo Leon','81 23456789','luisar@hotmail.com','luis1','Perez');
/*!40000 ALTER TABLE `PACIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAGO`
--

DROP TABLE IF EXISTS `PAGO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PAGO` (
  `id_pago` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) DEFAULT NULL,
  `nombreTitular` varchar(255) DEFAULT NULL,
  `numTarjeta` bigint(20) DEFAULT NULL,
  `fechaExp` date DEFAULT NULL,
  `CVV` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `fk_pago_paciente` (`id_paciente`),
  CONSTRAINT `fk_pago_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `PACIENTE` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAGO`
--

LOCK TABLES `PAGO` WRITE;
/*!40000 ALTER TABLE `PAGO` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAGO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESULTADOS_EXAMEN`
--

DROP TABLE IF EXISTS `RESULTADOS_EXAMEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESULTADOS_EXAMEN` (
  `id_resultado` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) DEFAULT NULL,
  `nombreDelExamen` varchar(255) DEFAULT NULL,
  `resultadoExamen` varchar(255) DEFAULT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`id_resultado`),
  KEY `fk_resultados_paciente` (`id_paciente`),
  CONSTRAINT `fk_resultados_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `PACIENTE` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESULTADOS_EXAMEN`
--

LOCK TABLES `RESULTADOS_EXAMEN` WRITE;
/*!40000 ALTER TABLE `RESULTADOS_EXAMEN` DISABLE KEYS */;
INSERT INTO `RESULTADOS_EXAMEN` VALUES (1,3,'Examen de Cancer','Negativo',1499.99),(2,1,'Examen de Tuberculosis','Positivo',600),(3,1,'Examen de COVID19','Positivo',750),(5,15,'Examen de COVID19','Positivo',750);
/*!40000 ALTER TABLE `RESULTADOS_EXAMEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRATAMIENTO`
--

DROP TABLE IF EXISTS `TRATAMIENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRATAMIENTO` (
  `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`id_tratamiento`),
  KEY `id_paciente` (`id_paciente`),
  CONSTRAINT `id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `PACIENTE` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRATAMIENTO`
--

LOCK TABLES `TRATAMIENTO` WRITE;
/*!40000 ALTER TABLE `TRATAMIENTO` DISABLE KEYS */;
INSERT INTO `TRATAMIENTO` VALUES (1,'Tratamiento 1','Este es un tratamiento de ejemplo',3,785.39);
/*!40000 ALTER TABLE `TRATAMIENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'elregio'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarPaciente`(
    IN idPaciente INT,
    IN p_nombre VARCHAR(255),
    IN p_apellido VARCHAR(255),
    IN p_correo VARCHAR(255),
    IN p_telefono VARCHAR(20),
    IN p_fecha_nacimiento DATE
)
BEGIN
    UPDATE PACIENTE
    SET nombre = p_nombre,
        apellido = p_apellido,
        correo = p_correo,
        telefono = p_telefono,
        fecha_nacimiento = p_fecha_nacimiento
    WHERE id = idPaciente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllMedicos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllMedicos`()
BEGIN
    SELECT nombre, especialidad, telefono, id_medico, medico_foto
    FROM MEDICO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetHistorialClinico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetHistorialClinico`(IN id_paciente INT)
BEGIN
    SELECT * FROM HISTORIAL_CLINICO WHERE id_paciente = id_paciente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPaciente`(IN p_id_paciente INT)
BEGIN
    SELECT * FROM PACIENTE WHERE id_paciente = p_id_paciente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPacienteCorreo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPacienteCorreo`(IN correo_param VARCHAR(255))
BEGIN
  SELECT id_paciente, correo, contrasena FROM PACIENTE WHERE correo = correo_param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertIntoHistorialClinico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertIntoHistorialClinico`(IN p_id_paciente INT, IN p_fechaNacimiento DATE, IN p_enfermedadesPrevias VARCHAR(255), IN p_medicamentos VARCHAR(255), IN p_cirugias VARCHAR(255), IN p_antecedentes VARCHAR(255), IN p_tipoSangre VARCHAR(255), IN p_alergias VARCHAR(255))
BEGIN
    INSERT INTO HISTORIAL_CLINICO(id_paciente, fechaNacimiento, enfermedadesPrevias, medicamentos, cirugias, antecedentes, tipoSangre, alergias) 
    VALUES(p_id_paciente, p_fechaNacimiento, p_enfermedadesPrevias, p_medicamentos, p_cirugias, p_antecedentes, p_tipoSangre, p_alergias);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPaciente`(IN p_nombre VARCHAR(255), IN p_fecha_nacimiento DATE, IN p_direccion VARCHAR(255), IN p_telefono VARCHAR(20), IN p_correo VARCHAR(255), IN p_contrasena VARCHAR(255), IN p_apellido VARCHAR(255))
BEGIN
    INSERT INTO PACIENTE(nombre, fecha_nacimiento, direccion, telefono, correo, contrasena, apellido)
    VALUES(p_nombre, p_fecha_nacimiento, p_direccion, p_telefono, p_correo, p_contrasena, p_apellido);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdatePaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePaciente`(
    IN p_id_paciente INT, 
    IN p_nombre VARCHAR(50), 
    IN p_apellido VARCHAR(50), 
    IN p_correo VARCHAR(100), 
    IN p_telefono VARCHAR(20), 
    IN p_fecha_nacimiento DATE
)
BEGIN
    UPDATE PACIENTE
    SET 
        nombre = p_nombre,
        apellido = p_apellido,
        correo = p_correo,
        telefono = p_telefono,
        fecha_nacimiento = p_fecha_nacimiento
    WHERE id_paciente = p_id_paciente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-20  2:52:29
