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
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `CITAS`
--

LOCK TABLES `CITAS` WRITE;
/*!40000 ALTER TABLE `CITAS` DISABLE KEYS */;
INSERT INTO `CITAS` VALUES (1,2,1,'Dolor de cabeza','2023-05-19 15:00:00','2023-05-19 17:00:00'),(6,6,1,'Dolor de cabeza','2023-05-19 12:00:00','2023-05-19 14:00:00'),(7,1,3,'DOLOR DE ESTOMAGO','2023-05-17 00:00:00','2023-05-18 00:00:00'),(8,1,3,'DOLOR DE ','2023-05-15 08:00:00','2023-05-15 08:30:00'),(9,2,3,'Dolor de estomago','2023-05-22 11:00:00','2023-05-22 13:00:00');
/*!40000 ALTER TABLE `CITAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `HISTORIAL_CLINICO`
--

LOCK TABLES `HISTORIAL_CLINICO` WRITE;
/*!40000 ALTER TABLE `HISTORIAL_CLINICO` DISABLE KEYS */;
INSERT INTO `HISTORIAL_CLINICO` VALUES (1,1,'2023-05-10','asdadsa','dsadada','da','ada','dada','dadada'),(2,1,'2023-05-13','a','aadad','aadasdad','sad','','asddsa'),(3,3,'2023-05-12','Neumonia','Genoprazol, Ketorolaco, Paracetamol','Cirugia de Riñon','Diabettes','A+','Alergia al Polvo'),(4,6,'2023-05-02','las gomitas','paracetamol','cirugia de estomago','diabetes tipo 3','O negativa','Al polen');
/*!40000 ALTER TABLE `HISTORIAL_CLINICO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `HORARIO_MEDICO`
--

LOCK TABLES `HORARIO_MEDICO` WRITE;
/*!40000 ALTER TABLE `HORARIO_MEDICO` DISABLE KEYS */;
/*!40000 ALTER TABLE `HORARIO_MEDICO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `MEDICO`
--

LOCK TABLES `MEDICO` WRITE;
/*!40000 ALTER TABLE `MEDICO` DISABLE KEYS */;
INSERT INTO `MEDICO` VALUES (1,'Dra. María Hernández','+52 (81) 4567 8901','Ginecología','doctor-1'),(2,'Dr. Juan Pérez','+52 (81) 1234 5678','Cardiología','doctor-2'),(3,'Dr. José López','+52 (81) 2345 6789','Neurología','doctor-3'),(4,'Dr. Pedro Gómez','+52 (81) 3456 7890','Pediatría','doctor-4'),(6,'Dra. Ana Torres','+52 (81) 5678 9012','Dermatología','doctor-6'),(7,'Dr. Francisco Ramírez','+52 (81) 5678 9012','Psiquiatría','doctor-7');
/*!40000 ALTER TABLE `MEDICO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `PACIENTE`
--

LOCK TABLES `PACIENTE` WRITE;
/*!40000 ALTER TABLE `PACIENTE` DISABLE KEYS */;
INSERT INTO `PACIENTE` VALUES (1,'EPEP',NULL,'Calle 25 #229','8124297946','ricar@localhost.com','PEPE','RUIZ'),(2,'Ricardo Arath','2023-05-24','Calle 25 #229','8124297946','wqeqwear@localhost.com','pepe','Sanchez Aguirre'),(3,'DIEGO','2003-12-09','San jemo','210387394601','diegobases1103@gmail.com','666','Linados'),(6,'Ricardo Arath','2023-05-18','Calle 25 #229','8124297946','epep@localhost.com','ewwqe','Sanchez Aguirre'),(8,'Ricardo Arath','2023-05-17','Calle 25 #229','8124297946','ricar@localhost.com','pepe','Sanchez Aguirre'),(9,'Manuel','2023-05-11','Calle 25 #229','8124297946','wqeqwear@localhost.com','miguel','Cantu'),(10,'luis','2131-02-13','2321','2133','21312@213.com','pepe','suarez'),(11,'Ricardo Arath','2023-06-02','qwewq','8124297946','wqeqwear@localhost.com','pepe','Sanchez Aguirre'),(12,'Ricardo Arath','2023-05-31','wqewq','8124297946','weqweq@gmail.com','pepe','Sanchez Aguirre'),(13,'Ricardo Arath','2023-05-31','wqewq','8124297946','weqweq@gmail.com','pepe','Sanchez Aguirre'),(14,'Ricardo Arath','2023-06-10','qweqw','8124297946','wqeqwear@localhost.com','wqeqw','Sanchez Aguirre'),(15,'David','2003-03-20','por la udem calle 2','8661214242','david@trevino.com','611','Treviño'),(16,'Luis Guillermo','2003-06-18','Privada Lomás del Vergel #1118, colonia Valle de San Lucas, San Pedro Garza García, Nuevo León','8110438833','luisroman@udem.edu','luis1','Román Escalera'),(17,'David','2000-06-30','Calle Antigua Aserradero #2010, colonia Mitras centro, Monterrey, Nuevo León','8135983377','david.trevino@hotmail.com','david2','Treviño Camavinga'),(18,'Manuel','2006-10-31','Calle 15 #229, colonia Nuevo Las Puentes, San Nicolas de los Garza, Nuevo León','5532539278','manu.ort@hotmail.com','manu3','Ortega Montemayor'),(19,'Mariana','2002-08-15','De la Rosa #1110, colonia Hacienda de las Parras, Santa Catarina, Nuevo León','8183309006','mariana@gmail.com','mariana.2023','Moreno Lichnovsky');
/*!40000 ALTER TABLE `PACIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `PAGO`
--

LOCK TABLES `PAGO` WRITE;
/*!40000 ALTER TABLE `PAGO` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAGO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `RESULTADOS_EXAMEN`
--

LOCK TABLES `RESULTADOS_EXAMEN` WRITE;
/*!40000 ALTER TABLE `RESULTADOS_EXAMEN` DISABLE KEYS */;
INSERT INTO `RESULTADOS_EXAMEN` VALUES (1,3,'Examen de Cancer','Negativo',1499.99),(2,1,'Examen de Tuberculosis','Positivo',600),(3,1,'Examen de COVID19','Positivo',750),(5,15,'Examen de COVID19','Positivo',750);
/*!40000 ALTER TABLE `RESULTADOS_EXAMEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `TRATAMIENTO`
--

LOCK TABLES `TRATAMIENTO` WRITE;
/*!40000 ALTER TABLE `TRATAMIENTO` DISABLE KEYS */;
INSERT INTO `TRATAMIENTO` VALUES (1,'Tratamiento 1','Este es un tratamiento de ejemplo',3,785.39);
/*!40000 ALTER TABLE `TRATAMIENTO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-20  0:41:17
