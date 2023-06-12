/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.22-MariaDB : Database - sis_notas2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sis_notas2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sis_notas2`;

/*Table structure for table `asignaturas` */

DROP TABLE IF EXISTS `asignaturas`;

CREATE TABLE `asignaturas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_modulo` char(100) DEFAULT NULL,
  `cant_horas` char(50) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `asignaturas` */

insert  into `asignaturas`(`id`,`nombre_modulo`,`cant_horas`,`creditos`,`fregistro`,`estatus`) values (1,'Introduccion a la logica','20',2,'2023-06-05 08:59:43','ACTIVO'),(2,'Programacion I','20',2,'2023-06-05 08:59:44','ACTIVO'),(3,'Programacion II','20',2,'2023-06-05 08:59:46','ACTIVO'),(4,'Practicas','20',5,'2023-06-05 12:09:38','ACTIVO'),(5,'Practicas ii','20',4,'2023-06-05 09:02:13','ACTIVO'),(6,'Administracion I','30',4,'2023-06-05 09:02:14','ACTIVO'),(7,'Matematicas I','30',4,'2023-06-05 09:02:15','ACTIVO'),(8,'Contabilidad I','30',4,'2023-06-05 09:02:16','ACTIVO'),(9,'Etica','30',4,'2023-06-05 09:02:17','ACTIVO'),(10,'Metodología Educación','30',4,'2023-06-05 09:02:17','ACTIVO'),(11,'Economia I','30',4,'2023-06-05 09:02:19','ACTIVO'),(12,'Contabilidad II','30',4,'2023-06-05 09:02:18','ACTIVO'),(13,'Matematicas Financieras','30',4,'2023-06-05 09:02:20','ACTIVO'),(14,'Informatica I','30',4,'2023-06-05 09:02:21','ACTIVO'),(15,'Constitucional','30',NULL,'2023-05-12 16:09:03','ACTIVO'),(16,'Derecho Laboral','30',NULL,'2023-05-12 16:09:13','ACTIVO'),(17,'Estadistica','30',NULL,'2023-05-12 16:09:25','ACTIVO'),(18,'Contabilidad III','30',NULL,'2023-05-12 16:13:17','ACTIVO'),(19,'Informatica II','30',NULL,'2023-05-12 16:13:27','ACTIVO'),(20,'Derecho Tributario','30',NULL,'2023-05-12 16:13:41','ACTIVO'),(21,'Costos','30',NULL,'2023-05-12 16:13:51','ACTIVO'),(22,'Presupuesto','30',NULL,'2023-05-12 16:14:00','ACTIVO'),(23,'Proyecto I','30',NULL,'2023-05-12 16:14:21','ACTIVO'),(24,'Analisis Financiero','30',NULL,'2023-05-12 16:14:41','ACTIVO'),(25,'Practicas Empresariales','30',NULL,'2023-05-12 16:14:56','ACTIVO'),(26,'Contabilidad IV','30',NULL,'2023-05-12 16:20:34','ACTIVO'),(27,'Derecho Tributario II','30',NULL,'2023-05-12 16:20:56','ACTIVO'),(28,'Proyecto de grado','30',NULL,'2023-05-12 16:21:19','ACTIVO'),(29,'Auditoria','30',NULL,'2023-05-12 16:21:29','ACTIVO');

/*Table structure for table `calificaciones` */

DROP TABLE IF EXISTS `calificaciones`;

CREATE TABLE `calificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idMatricula` int(11) NOT NULL,
  `idasignatura` int(11) DEFAULT NULL,
  `nota` double DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('CALIFICADO') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idasignatura` (`idasignatura`),
  KEY `idMatricula` (`idMatricula`),
  CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`idasignatura`) REFERENCES `asignaturas` (`id`),
  CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`idMatricula`) REFERENCES `matriculas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

/*Data for the table `calificaciones` */

insert  into `calificaciones`(`id`,`idMatricula`,`idasignatura`,`nota`,`fregistro`,`estatus`) values (1,1,1,3,'2023-05-18 14:24:25',NULL),(3,1,1,4,'2023-05-18 14:24:28',NULL),(4,1,2,4,'2023-05-18 14:24:32',NULL),(5,1,2,4.2,'2023-05-18 14:24:38',NULL),(6,1,2,3,'2023-05-18 14:24:42',NULL),(11,1,1,4,'2023-05-23 16:25:50',NULL),(12,1,1,3,'2023-05-23 16:25:54',NULL),(13,1,3,4,'2023-05-23 16:29:17',NULL),(14,1,3,4.2,'2023-05-23 16:29:20',NULL),(16,18,6,4.2,'2023-06-05 12:27:59',NULL),(17,18,6,4,'2023-06-05 12:28:06',NULL),(18,18,6,4,'2023-06-05 12:28:08',NULL),(19,13,6,4.3,'2023-06-05 12:30:17',NULL),(20,13,6,4.2,'2023-06-05 12:30:33',NULL),(21,13,6,3.8,'2023-06-05 12:31:01',NULL),(22,7,6,4.3,'2023-06-05 12:32:37',NULL),(23,7,6,4.2,'2023-06-05 12:32:41',NULL),(25,7,6,4.5,'2023-06-05 12:33:19',NULL),(26,6,6,4.2,'2023-06-05 12:33:52',NULL),(27,6,6,4.3,'2023-06-05 12:33:55',NULL),(28,6,6,4.4,'2023-06-05 12:34:00',NULL),(29,15,6,4,'2023-06-05 12:35:26',NULL),(30,15,6,4,'2023-06-05 12:35:28',NULL),(31,15,6,4.2,'2023-06-05 12:35:32',NULL),(32,3,6,4,'2023-06-05 12:36:01',NULL),(33,3,6,4.4,'2023-06-05 12:36:03',NULL),(34,3,6,4.3,'2023-06-05 12:36:06',NULL),(35,17,6,4,'2023-06-05 12:38:25',NULL),(36,17,6,3.8,'2023-06-05 12:38:30',NULL),(37,17,6,3.9,'2023-06-05 12:38:34',NULL),(38,8,6,3.9,'2023-06-05 12:38:53',NULL),(39,9,6,4.6,'2023-06-05 12:39:21',NULL),(40,9,6,4.4,'2023-06-05 12:39:25',NULL),(41,9,6,4.4,'2023-06-05 12:39:33',NULL),(42,10,6,4,'2023-06-05 12:39:45',NULL),(43,10,6,4.2,'2023-06-05 12:39:48',NULL),(44,10,6,4.3,'2023-06-05 12:39:54',NULL),(45,4,6,4.3,'2023-06-05 12:40:12',NULL),(46,4,6,4.1,'2023-06-05 12:40:17',NULL),(47,4,6,3.9,'2023-06-05 12:40:22',NULL),(48,11,6,3.9,'2023-06-05 12:40:35',NULL),(49,11,6,4,'2023-06-05 12:40:38',NULL),(50,11,6,4,'2023-06-05 12:40:41',NULL),(51,16,6,4.3,'2023-06-05 12:40:55',NULL),(52,16,6,4.4,'2023-06-05 12:40:58',NULL),(53,16,6,4.3,'2023-06-05 12:41:02',NULL),(54,14,6,4,'2023-06-05 12:41:29',NULL),(55,14,6,3.8,'2023-06-05 12:41:33',NULL),(56,14,6,3.8,'2023-06-05 12:41:36',NULL),(57,12,6,4,'2023-06-05 12:41:48',NULL),(58,12,6,4.3,'2023-06-05 12:41:51',NULL),(59,12,6,4.2,'2023-06-05 12:41:53',NULL),(60,5,6,4,'2023-06-05 12:42:06',NULL),(61,5,6,4.2,'2023-06-05 12:42:08',NULL),(62,5,6,4.3,'2023-06-05 12:42:12',NULL),(63,13,6,4,'2023-06-05 13:18:44',NULL),(64,4,6,4.2,'2023-06-05 13:27:50',NULL),(66,17,6,4.4,'2023-06-05 13:28:50',NULL),(67,18,6,4.3,'2023-06-05 13:29:18',NULL),(68,15,6,4.2,'2023-06-05 13:30:01',NULL),(69,9,6,4.2,'2023-06-05 13:30:30',NULL),(70,10,6,4.3,'2023-06-05 13:31:00',NULL),(71,13,6,4.5,'2023-06-05 13:31:28',NULL),(72,12,6,4.5,'2023-06-05 13:31:59',NULL),(73,11,6,4.4,'2023-06-05 13:32:39',NULL),(74,16,6,4.3,'2023-06-05 13:33:42',NULL),(75,7,6,4.4,'2023-06-05 13:34:05',NULL),(76,3,6,4.2,'2023-06-05 13:34:36',NULL),(77,6,6,4.2,'2023-06-05 13:35:15',NULL),(78,5,6,4,'2023-06-05 13:35:40',NULL),(79,12,6,4,'2023-06-05 13:36:35',NULL),(80,4,6,4,'2023-06-05 13:37:05',NULL),(81,15,6,4.7,'2023-06-05 13:37:31',NULL),(83,7,6,4.6,'2023-06-05 13:38:17',NULL),(84,6,6,4.5,'2023-06-05 13:38:48',NULL),(85,11,6,4,'2023-06-05 13:39:12',NULL),(86,17,6,4,'2023-06-05 13:39:34',NULL),(87,9,6,4.6,'2023-06-05 13:39:59',NULL),(90,5,6,4.3,'2023-06-05 13:41:37',NULL),(91,3,6,4.3,'2023-06-05 13:42:56',NULL),(92,16,6,4.8,'2023-06-05 13:54:28',NULL);

/*Table structure for table `distribucion_modulo` */

DROP TABLE IF EXISTS `distribucion_modulo`;

CREATE TABLE `distribucion_modulo` (
  `idprograma` int(11) NOT NULL,
  `idasignatura` int(11) NOT NULL,
  `idsemestre` int(11) NOT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ASIGNADO') DEFAULT 'ASIGNADO',
  KEY `distribucion_modulo_ibfk_1` (`idasignatura`),
  KEY `distribucion_modulo_ibfk_3` (`idsemestre`),
  KEY `idprograma` (`idprograma`),
  CONSTRAINT `distribucion_modulo_ibfk_1` FOREIGN KEY (`idprograma`) REFERENCES `programa` (`programa_id`),
  CONSTRAINT `distribucion_modulo_ibfk_2` FOREIGN KEY (`idasignatura`) REFERENCES `asignaturas` (`id`),
  CONSTRAINT `distribucion_modulo_ibfk_4` FOREIGN KEY (`idsemestre`) REFERENCES `semestre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `distribucion_modulo` */

insert  into `distribucion_modulo`(`idprograma`,`idasignatura`,`idsemestre`,`fregistro`,`estatus`) values (1,1,1,'2022-02-11 08:54:49','ASIGNADO'),(1,2,1,'2022-02-11 08:56:06','ASIGNADO'),(1,3,2,'2022-02-11 08:56:21','ASIGNADO'),(1,4,3,'2022-02-11 08:56:34','ASIGNADO'),(1,5,4,'2022-02-11 08:56:42','ASIGNADO'),(1,3,4,'2022-07-31 12:53:50','ASIGNADO'),(1,2,3,'2023-05-10 10:18:24','ASIGNADO'),(2,7,1,'2023-05-12 08:52:11','ASIGNADO'),(2,6,1,'2023-05-12 08:54:10','ASIGNADO'),(2,8,1,'2023-05-12 08:54:19','ASIGNADO'),(2,10,1,'2023-05-12 08:54:32','ASIGNADO'),(2,11,1,'2023-05-12 08:54:40','ASIGNADO'),(2,9,1,'2023-05-12 08:55:23','ASIGNADO'),(2,12,2,'2023-05-12 16:09:45','ASIGNADO'),(2,14,2,'2023-05-12 16:09:55','ASIGNADO'),(2,13,2,'2023-05-12 16:10:04','ASIGNADO'),(2,15,2,'2023-05-12 16:10:15','ASIGNADO'),(2,16,2,'2023-05-12 16:10:26','ASIGNADO'),(2,17,2,'2023-05-12 16:11:00','ASIGNADO'),(2,19,3,'2023-05-12 16:15:54','ASIGNADO'),(2,20,3,'2023-05-12 16:16:05','ASIGNADO'),(2,21,3,'2023-05-12 16:16:14','ASIGNADO'),(2,22,3,'2023-05-12 16:16:22','ASIGNADO'),(2,25,3,'2023-05-12 16:16:29','ASIGNADO'),(2,24,3,'2023-05-12 16:16:40','ASIGNADO'),(2,23,3,'2023-05-12 16:19:21','ASIGNADO'),(2,26,4,'2023-05-12 16:21:54','ASIGNADO'),(2,19,4,'2023-05-12 16:22:03','ASIGNADO'),(2,27,4,'2023-05-12 16:22:12','ASIGNADO'),(2,28,4,'2023-05-12 16:22:21','ASIGNADO'),(2,29,4,'2023-05-12 16:22:34','ASIGNADO'),(3,8,1,'2023-05-12 20:11:27','ASIGNADO'),(3,12,2,'2023-05-18 07:59:26','ASIGNADO'),(3,15,2,'2023-05-18 08:01:29','ASIGNADO'),(3,16,2,'2023-05-18 08:01:42','ASIGNADO'),(3,17,2,'2023-05-18 08:01:55','ASIGNADO'),(3,14,2,'2023-05-18 08:04:00','ASIGNADO'),(3,13,2,'2023-05-18 08:04:23','ASIGNADO'),(3,24,3,'2023-05-18 08:04:54','ASIGNADO'),(3,21,3,'2023-05-18 08:05:07','ASIGNADO'),(3,20,3,'2023-05-18 08:16:28','ASIGNADO'),(3,19,3,'2023-05-18 08:16:43','ASIGNADO'),(3,25,3,'2023-05-18 08:16:57','ASIGNADO'),(3,22,3,'2023-05-18 08:17:08','ASIGNADO'),(3,23,3,'2023-05-18 08:17:17','ASIGNADO'),(3,29,4,'2023-05-18 08:17:40','ASIGNADO'),(3,26,4,'2023-05-18 08:25:00','ASIGNADO'),(3,27,4,'2023-05-18 08:25:12','ASIGNADO'),(3,19,4,'2023-05-18 08:25:31','ASIGNADO'),(3,28,4,'2023-05-18 08:25:56','ASIGNADO'),(1,3,1,'2023-05-23 16:28:30','ASIGNADO'),(3,6,1,'2023-06-05 13:56:13','ASIGNADO'),(3,11,1,'2023-06-05 13:56:36','ASIGNADO'),(3,7,1,'2023-06-05 13:56:50','ASIGNADO'),(3,9,1,'2023-06-05 13:57:05','ASIGNADO');

/*Table structure for table `distribucion_programas` */

DROP TABLE IF EXISTS `distribucion_programas`;

CREATE TABLE `distribucion_programas` (
  `idPrograma` int(11) NOT NULL,
  `idDocente` char(50) NOT NULL,
  `estatus` enum('ASIGNADO') DEFAULT 'ASIGNADO',
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `idDocente` (`idDocente`),
  KEY `idPrograma` (`idPrograma`),
  CONSTRAINT `distribucion_programas_ibfk_1` FOREIGN KEY (`idDocente`) REFERENCES `docentes` (`id`),
  CONSTRAINT `distribucion_programas_ibfk_2` FOREIGN KEY (`idPrograma`) REFERENCES `programa` (`programa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `distribucion_programas` */

insert  into `distribucion_programas`(`idPrograma`,`idDocente`,`estatus`,`fregistro`) values (1,'1070813753','ASIGNADO','2022-02-11 09:03:56');

/*Table structure for table `docentes` */

DROP TABLE IF EXISTS `docentes`;

CREATE TABLE `docentes` (
  `id` char(50) CHARACTER SET latin1 NOT NULL,
  `tipo_documento` enum('CEDULA','PASAPORTE','TI') CHARACTER SET latin1 DEFAULT NULL,
  `nombres` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `apellidos` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `direccion` char(100) CHARACTER SET latin1 DEFAULT NULL,
  `barrio` char(250) CHARACTER SET latin1 DEFAULT NULL,
  `telefono` char(100) CHARACTER SET latin1 DEFAULT NULL,
  `sexo` enum('MASCULINO','FEMENINO') CHARACTER SET latin1 DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `idprofesion` int(11) DEFAULT NULL,
  `archivo` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `docentes_ibfk_1` (`idusuario`),
  KEY `idprofesion` (`idprofesion`),
  CONSTRAINT `docentes_ibfk_3` FOREIGN KEY (`idprofesion`) REFERENCES `profesion` (`profesion_id`),
  CONSTRAINT `docentes_ibfk_4` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `docentes` */

insert  into `docentes`(`id`,`tipo_documento`,`nombres`,`apellidos`,`direccion`,`barrio`,`telefono`,`sexo`,`fecha_nacimiento`,`idprofesion`,`archivo`,`idusuario`,`fregistro`,`estatus`) values ('1070813753','CEDULA','JERSON','BATISTA','EL CARMEN','MONTE CARMELO','3007358024','MASCULINO','1989-05-26',1,NULL,2,'2022-02-11 07:58:12','ACTIVO');

/*Table structure for table `estudiantes` */

DROP TABLE IF EXISTS `estudiantes`;

CREATE TABLE `estudiantes` (
  `nombres` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `apellidos` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `tipo_documento` enum('CEDULA','TI','REGISTRO_CIVIL','PASAPORTE') CHARACTER SET latin1 DEFAULT NULL,
  `documento` varchar(50) CHARACTER SET latin1 NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` enum('MASCULINO','FEMENINO') CHARACTER SET latin1 DEFAULT NULL,
  `estado_civil` enum('CASADO','SOLTERO','CASADA','SOLTERA','UNION_LIBRE','VIUDO') CHARACTER SET latin1 DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `departamento` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `ciudad` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `telefono` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `tipo_vivienda` enum('PROPIA','FAMILIAR','ALQUILADA') CHARACTER SET latin1 DEFAULT NULL,
  `estrato` int(2) DEFAULT NULL,
  `tipo_poblacion` enum('AFRO','RAIZAL','INDIGENA','DESPLAZADO','OTRO') DEFAULT NULL,
  `eps` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `sisben` char(5) CHARACTER SET latin1 DEFAULT NULL,
  `formacion` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `ocupacion` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`documento`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `estudiantes` */

insert  into `estudiantes`(`nombres`,`apellidos`,`tipo_documento`,`documento`,`fecha_nacimiento`,`sexo`,`estado_civil`,`direccion`,`departamento`,`ciudad`,`telefono`,`tipo_vivienda`,`estrato`,`tipo_poblacion`,`eps`,`sisben`,`formacion`,`ocupacion`,`idusuario`,`foto`,`fregistro`,`estatus`) values ('Kaina Patricia','Cañate Jimenez','CEDULA','1002274599','1993-11-02','MASCULINO','UNION_LIBRE','mahates','bolivar','mahates','3003996460','PROPIA',1,'OTRO','0','1','estudiante','estudiante',21,'controlador/estudiantes/img/avatar.png','2023-06-03 12:51:24','ACTIVO'),('Pedro Luis ','Polo Cervantes','CEDULA','1002276287','2001-08-13','MASCULINO','UNION_LIBRE','evitar','bolivar','mahates','3012079207','PROPIA',1,'OTRO','0','1','estudiante','estudiante',22,'controlador/estudiantes/img/avatar.png','2023-06-03 12:56:50','ACTIVO'),('Yeider Edwin','Pajaro Diaz','CEDULA','1007136491','2003-05-03','MASCULINO','SOLTERO','malagana','bolivar','mahates','3244092090','PROPIA',1,'OTRO','0','1','estudiante','estudiante',19,'controlador/estudiantes/img/avatar.png','2023-06-05 12:44:41','ACTIVO'),('Jhorjenis','Reyes','TI','1043969356','2006-01-17','FEMENINO','SOLTERO','gamero','bolivar','mahates','3104576250','PROPIA',1,'OTRO','0','1','estudiante','estudiante',12,'controlador/estudiantes/img/avatar.png','2023-06-05 08:38:14','ACTIVO'),('KAREN','VEGA','CEDULA','1047378369','0000-00-00','FEMENINO','SOLTERA','EL CARMEN','BOLIVAR','EL CARMEN DE BOLIVAR','65567567','ALQUILADA',1,'DESPLAZADO','0','1','ESTUDIANTE','INDEPENDIENTE',3,'controlador/estudiantes/img/avatar3.png','2023-04-14 15:12:58','ACTIVO'),('JUAN DAVID','RAMIREZ BELTRAN','CEDULA','1048933256','2005-02-05','MASCULINO','SOLTERO','mahates','BOLIVAR','MAHATE','3117730678','PROPIA',1,'OTRO','0','1','INDEPENDIENTE','INDEPENDIENTE',5,'controlador/estudiantes/img/avatar.png','2023-06-03 11:38:35','ACTIVO'),('Adriana Marcela','Guerrero Camargo','CEDULA','1048933414','2005-04-07','FEMENINO','SOLTERO','mahates','bolivar','mahates','3183562642','PROPIA',1,'OTRO','0','1','estudiante','estudiante',13,'controlador/estudiantes/img/avatar.png','2023-06-05 08:35:30','ACTIVO'),('Rosaicela ','Vasquez Ospino','TI','1048933776','2005-09-24','FEMENINO','UNION_LIBRE','mahates','bolivar','mahates','3011338094','PROPIA',1,'OTRO','0','1','estudiante','estudiante',15,'controlador/estudiantes/img/avatar.png','2023-06-05 12:45:31','ACTIVO'),('Margarita','Atencio Vásquez','CEDULA','1048935322','1988-10-25','FEMENINO','SOLTERO','mahates','bolivar','mahates','3215668548','PROPIA',1,'OTRO','0','1','estudiante','estudiante',17,'controlador/estudiantes/img/avatar.png','2023-06-05 08:36:06','ACTIVO'),('Jose David ','Marriaga Torres','TI','1048936428','2008-03-08','MASCULINO','SOLTERO','mahates','bolivar','mahates','3137582696','PROPIA',1,'OTRO','0','1','estudiante','estudiante',18,'controlador/estudiantes/img/avatar.png','2023-06-05 08:37:55','ACTIVO'),('Kelly Johana','Acosta Santana','CEDULA','1048939244','1993-07-09','FEMENINO','SOLTERO','gamero','bolivar','mahates','3137442865','PROPIA',1,'OTRO','0','1','estudiante','estudiante',16,'controlador/estudiantes/img/avatar.png','2023-06-05 13:47:07','ACTIVO'),('Andres Armando','Agamez Martelo','CEDULA','1048941750','1997-02-09','MASCULINO','SOLTERO','mahates','bolivar','mahates','3202011109','PROPIA',1,'OTRO','0','1','estudiante','estudiante',25,'controlador/estudiantes/img/avatar.png','2023-06-03 13:15:32','ACTIVO'),('Julyhet  Paola','Torres Chavez','CEDULA','1102870351','1995-11-22','MASCULINO','CASADA','mahates','bolivar','mahates','3128585301','PROPIA',1,'OTRO','0','1','estudiante','estudiante',23,'controlador/estudiantes/img/avatar.png','2023-06-03 13:02:59','ACTIVO'),('PRUEBAS','dfsdf','CEDULA','12121','2023-04-20','MASCULINO','SOLTERO','EL CARMEN DE BOLIVAR','bolivar','Cartagena','3013794981','PROPIA',0,'AFRO','0','1','','',4,'controlador/estudiantes/img/IMG2042023101636.jpeg','2023-04-20 10:16:37','ACTIVO'),('Luis ','Blanco','CEDULA','1341427','2003-04-06','MASCULINO','SOLTERO','malagana','bolivar','mahates','3001159273','PROPIA',1,'AFRO','0','1','estudiante','estudiante',6,'controlador/estudiantes/img/avatar.png','2023-06-05 08:36:31','ACTIVO'),('Giorcelis ','Guerrero Camargo','CEDULA','30871608','1983-10-01','FEMENINO','UNION_LIBRE','mahates','bolivar','mahates','3175414745','PROPIA',1,'OTRO','0','1','estudiante','estudiante',14,'controlador/estudiantes/img/avatar.png','2023-06-05 08:37:29','ACTIVO'),('Rosmery Carolina ','Torrealba Torrealba','PASAPORTE','6835185','1994-12-11','FEMENINO','SOLTERO','mahates','bolivar','mahates','3234323502','PROPIA',1,'OTRO','0','1','estudiante','estudiante',24,'controlador/estudiantes/img/avatar.png','2023-06-05 08:35:03','ACTIVO'),('Aris Manuel','Esalas Cantillo','CEDULA','73508422','1985-03-31','MASCULINO','UNION_LIBRE','mahates','bolivar','mahates','3126428047','PROPIA',1,'OTRO','0','1','estudiante','estudiante',20,'controlador/estudiantes/img/avatar.png','2023-06-03 12:44:06','ACTIVO');

/*Table structure for table `jornada` */

DROP TABLE IF EXISTS `jornada`;

CREATE TABLE `jornada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_jornada` char(50) CHARACTER SET latin1 DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `jornada` */

insert  into `jornada`(`id`,`nombre_jornada`,`fregistro`,`estatus`) values (1,'Mañana','2022-02-11 08:32:59','ACTIVO'),(2,'Tarde','2022-02-11 08:33:06','ACTIVO'),(3,'Sabado Mañana','2022-02-11 08:33:34','ACTIVO'),(4,'Sabado  Tarde','2022-02-11 08:33:44','ACTIVO');

/*Table structure for table `matriculas` */

DROP TABLE IF EXISTS `matriculas`;

CREATE TABLE `matriculas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(50) NOT NULL,
  `idsede` int(11) DEFAULT NULL,
  `idprograma` int(11) NOT NULL,
  `idsemestre` int(11) DEFAULT NULL,
  `idjornada` int(11) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `nombre_ref` varchar(100) DEFAULT NULL,
  `apellidos_ref` varchar(100) DEFAULT NULL,
  `parentesco` varchar(100) DEFAULT NULL,
  `direccion_ref` varchar(100) DEFAULT NULL,
  `telefono_ref` varchar(100) DEFAULT NULL,
  `correo_ref` varchar(100) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('MATRICULADO','RETIRADO','GRADUADO') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idprograma` (`idprograma`),
  KEY `documento` (`documento`),
  KEY `idsemestre` (`idsemestre`),
  KEY `idsede` (`idsede`),
  KEY `idjornada` (`idjornada`),
  CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`idprograma`) REFERENCES `programa` (`programa_id`),
  CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`documento`) REFERENCES `estudiantes` (`documento`),
  CONSTRAINT `matriculas_ibfk_3` FOREIGN KEY (`idsemestre`) REFERENCES `semestre` (`id`),
  CONSTRAINT `matriculas_ibfk_4` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`sede_id`),
  CONSTRAINT `matriculas_ibfk_5` FOREIGN KEY (`idjornada`) REFERENCES `jornada` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `matriculas` */

insert  into `matriculas`(`id`,`documento`,`idsede`,`idprograma`,`idsemestre`,`idjornada`,`fecha_ingreso`,`nombre_ref`,`apellidos_ref`,`parentesco`,`direccion_ref`,`telefono_ref`,`correo_ref`,`fregistro`,`estatus`) values (1,'1047378369',1,1,1,1,'2022-02-11','Ramiro','Vega','padre','el centro','5656','rami@gmail.com','2022-02-11 08:51:05','MATRICULADO'),(2,'12121',1,1,1,2,'2023-04-20','aasdas','asds','dsada','asda','asda','asda','2023-04-20 10:16:37','MATRICULADO'),(3,'1048933256',2,2,1,3,'2023-06-03','NELVIS','BELTRAN','MADRE','MAHATE','3117730678','nose@gmail.com','2023-06-03 11:38:36','MATRICULADO'),(4,'1341427',2,3,1,3,'2023-06-03','luis','blanco ','mama','mahates','3001159273','luisantonioblanco0601@gmail.com','2023-06-03 11:49:31','MATRICULADO'),(5,'1043969356',2,4,1,3,'2023-05-03','jhorjenis','reyes','mama','mahates','3104576250','jhorjenisreyesmarriaga@gmail.com','2023-06-03 11:58:32','MATRICULADO'),(6,'1048933414',2,2,1,3,'2023-05-03','adriana marcela','guerrero camargo','mama','mahates','3183562642','adranaguerrerocamargo@gmail.com','2023-06-03 12:04:16','MATRICULADO'),(7,'30871608',2,2,1,3,'2023-05-03','giorcelis','guerrero camargo','mama','mahates','3183562642','giorcelisguerrero@yahoo.es','2023-06-03 12:08:11','MATRICULADO'),(8,'1048933776',2,2,1,3,'2023-05-03','rosaicela','vasquez ospino','mama','mahates','3183562642','rosaicelavasquezospino50@gmail.com','2023-06-03 12:14:29','MATRICULADO'),(9,'1048939244',2,3,1,3,'2023-05-03','kelly johana','acosta  santana','mama','mahates','3137442865','acostakelly2014@gmail.com','2023-06-03 12:19:36','MATRICULADO'),(10,'1048935322',2,3,1,3,'2023-05-03','margarita ','atencio vasquez ','mama','mahates','3215668548','margaritaayoisaka@gmail.com','2023-06-03 12:25:08','MATRICULADO'),(11,'1048936428',2,3,1,3,'2023-05-03','jose david','marriaga torres','mama','mahates','3137582696','marriagajose468@gmail.com','2023-06-03 12:30:36','MATRICULADO'),(12,'1007136491',2,4,1,3,'2023-05-03','yeider edwin','pajaro diaz','mama','mahates','3244092090','yeiderpajarodiaz@gmail.com','2023-06-03 12:36:34','MATRICULADO'),(13,'73508422',2,2,1,3,'2023-05-03','Aria Manuel','Esalas Cantillo','Papa','mahates','3126428047','asmec31@hotmail.com','2023-06-03 12:44:06','MATRICULADO'),(14,'1002274599',2,4,1,3,'2023-05-03','kaina Patricia','Cañate Jimenez','Mama','mahates','3003996460','kainatkm@hotmail.com','2023-06-03 12:51:25','MATRICULADO'),(15,'1002276287',2,2,1,3,'2023-05-03','Pedro Luis','Polo Cervantes','Mama','mahates','3012079207','p49506415@gmail.com','2023-06-03 12:56:50','MATRICULADO'),(16,'1102870351',2,3,1,3,'2023-05-03','Julyhet Paola','Torres Chavez','Mama','mahates','3128585301','julyhet022@gmail.com','2023-06-03 13:02:59','MATRICULADO'),(17,'6835185',2,2,1,3,'2023-05-03','Romery Carolina ','Torrealba Torrealba','yo','mahates','3234323502','rosmerytorrealba78@gmail.com','2023-06-03 13:09:23','MATRICULADO'),(18,'1048941750',2,2,1,3,'2023-05-03','Andres Armando','Agamez Martelo','mama','mahates','3202011109','andresagamez3@gmail.com','2023-06-03 13:15:32','MATRICULADO');

/*Table structure for table `profesion` */

DROP TABLE IF EXISTS `profesion`;

CREATE TABLE `profesion` (
  `profesion_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_profesion` varchar(100) CHARACTER SET latin1 NOT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`profesion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `profesion` */

insert  into `profesion`(`profesion_id`,`nombre_profesion`,`fregistro`,`estatus`) values (1,'Ingeniero de sistemas','2022-02-11 07:48:37','ACTIVO');

/*Table structure for table `programa` */

DROP TABLE IF EXISTS `programa`;

CREATE TABLE `programa` (
  `programa_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_programa` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `idsede` int(11) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`programa_id`),
  KEY `idsede` (`idsede`),
  CONSTRAINT `programa_ibfk_1` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`sede_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `programa` */

insert  into `programa`(`programa_id`,`nombre_programa`,`idsede`,`fregistro`,`estatus`) values (1,'Analisis y desarrollo  de sistemas',1,'2022-02-11 08:13:00','ACTIVO'),(2,'Auxiliar Administrativo',2,'2023-05-12 08:51:23','ACTIVO'),(3,'Auxiliar Contable',2,'2023-05-12 08:51:33','ACTIVO'),(4,'Auxiliar Caja Registradora',2,'2023-05-12 08:51:48','ACTIVO'),(5,'Caja Registradora',1,'2023-05-12 16:07:58','ACTIVO'),(6,'Auxiliar Administrativo',1,'2023-05-16 08:32:24','ACTIVO');

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `rol` */

insert  into `rol`(`id`,`nombre_rol`,`fregistro`,`estatus`) values (1,'Administrador','2022-02-11 07:45:53','ACTIVO'),(2,'Docente','2022-02-11 07:45:56','ACTIVO'),(3,'Estudiante','2022-02-11 07:45:59','ACTIVO'),(4,'Coordinador','2022-02-11 07:46:02','ACTIVO');

/*Table structure for table `sedes` */

DROP TABLE IF EXISTS `sedes`;

CREATE TABLE `sedes` (
  `sede_id` int(11) NOT NULL AUTO_INCREMENT,
  `sede_nombre` varchar(100) DEFAULT NULL,
  `sede_ciudad` varchar(255) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`sede_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `sedes` */

insert  into `sedes`(`sede_id`,`sede_nombre`,`sede_ciudad`,`fregistro`,`estatus`) values (1,'Principal','EL CARMEN DE BOLIVAR','2022-02-11 08:07:24','ACTIVO'),(2,'Mahates','Cartagena','2023-05-12 08:50:56','ACTIVO');

/*Table structure for table `semestre` */

DROP TABLE IF EXISTS `semestre`;

CREATE TABLE `semestre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(5) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `semestre` */

insert  into `semestre`(`id`,`numero`,`fregistro`,`estatus`) values (1,'I','2022-02-11 08:36:04','ACTIVO'),(2,'II','2022-02-11 08:36:06','ACTIVO'),(3,'III','2022-02-11 08:36:08','ACTIVO'),(4,'IV','2022-02-11 08:36:12','ACTIVO');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_nombre` varchar(100) DEFAULT NULL,
  `usuario_password` varchar(250) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `usuario_estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `usuario_email` varchar(100) DEFAULT NULL,
  `usuario_intento` int(11) DEFAULT NULL,
  `usuario_imagen` varchar(250) DEFAULT NULL,
  `usuario_fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `usuario_nombre` (`usuario_nombre`),
  UNIQUE KEY `usuario_email` (`usuario_email`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

insert  into `usuario`(`usuario_id`,`usuario_nombre`,`usuario_password`,`rol_id`,`usuario_estatus`,`usuario_email`,`usuario_intento`,`usuario_imagen`,`usuario_fregistro`) values (1,'admin','$2y$10$CZXxdYpG8LNDVBQP6pOxJO8.oxfZTIG85ymSBZE4hJDYg9gJxewY2',1,'ACTIVO','ingjerson2014@gmail.com',0,'controlador/usuario/img/IMG112202274727.png','2022-02-11 07:47:27'),(2,'1070813753','$2y$10$P/sIobhxRr3SNvaFnfasY.5U64vstbF0RI1FwtgtiM1lSsnHSZOW.',2,'ACTIVO','docente@gmail.com',0,NULL,'2022-02-11 07:50:41'),(3,'1047378369','$2y$10$3aX.FI.5ZSDfIqz.XhIxVO3RHkjJVoADo7cbdCC19qQtFrytsWQqm',3,'ACTIVO','kareen123@gmail.com',0,NULL,'2022-02-11 08:51:05'),(4,'12121','$2y$10$eYS8n2TJzITvfeKdC4N5t.LX9M1tx0NU8R5w1zfdjK3eWp5Dwjgsm',3,'ACTIVO','12121@gmail.com',0,NULL,'2023-04-20 10:16:36'),(5,'1048933256','$2y$10$veDEbmfa6.8MdwAM5W2GKOvJWT0pjQqtENVKhlOQnMjc4uhhlLS4y',3,'ACTIVO','ramirezbeltranjuandavid279@gmail.com',0,NULL,'2023-06-03 11:38:35'),(6,'1341427','$2y$10$4HvQM96HAaT4xkOL26VFC.YsnuGXbSD1rKVFv.jYYP98Xycjdngb.',3,'ACTIVO','luisantonioblanco0601@gmail.com',0,NULL,'2023-06-03 11:49:31'),(12,'1043969356','$2y$10$iEWi0LBdMEOrBGrM2UaZ1O4xoW7xy53ArOOklHFQxgkLa/KA818L6',3,'ACTIVO','jhorjenisreyesmarriaga@gmail.com',0,NULL,'2023-06-03 11:58:32'),(13,'1048933414','$2y$10$9zlOfVJctDuyoQrAb3onY.zC0B5/Pb1g8aQj8oLC7l/dM5IMomkZ.',3,'ACTIVO','adranaguerrerocamargo@gmail.com',0,NULL,'2023-06-03 12:04:15'),(14,'30871608','$2y$10$8HChoowztQc4mculdc24suznKt6SMhJLs9EsDpERuqokC.m6ux7sW',3,'ACTIVO','giorcelisguerrero@yahoo.es',0,NULL,'2023-06-03 12:08:11'),(15,'1048933776','$2y$10$VxZsg0yLE0zCaSUwGNHI1ujoUvfMvuZYEffvqcnkvSyae.YncEF6G',3,'ACTIVO','rosaicelavasquezospino50@gmail.com',0,NULL,'2023-06-03 12:14:29'),(16,'1048939244','$2y$10$YvThvwhSTE0.99/iJ6SQ8egsGmQ1UrnCWxa8yWZhVZNe3.glcpjZC',3,'ACTIVO','acostakelly2014@gmail.com',0,NULL,'2023-06-03 12:19:35'),(17,'1048935322','$2y$10$WXTdXWFF2gMYmUamMGaHPOScwaKhVA0Az5Yy9MCc/4dzl03xFM9yC',3,'ACTIVO','margaritaayoisaka@gmail.com',0,NULL,'2023-06-03 12:25:08'),(18,'1048936428','$2y$10$.qwzHovbkvC7SCAG0IUUpOzQdtQGC0ab2CIYqlNh90BatiKAIFIxW',3,'ACTIVO','marriagajose468@gmail.com',0,NULL,'2023-06-03 12:30:36'),(19,'1007136491','$2y$10$j6iJrZJVg204PfaSYbYVK.V9ieCf0t5W2hiWo2k6KJeFrZ6KR1t0S',3,'ACTIVO','yeiderpajarodiaz@gmail.com',0,NULL,'2023-06-03 12:36:34'),(20,'73508422','$2y$10$Y.N84w6QAJSbjM9SPJ3hM.TefyExg15eLdH3CG9DrjoEG5LogueRa',3,'ACTIVO','asmec31@hotmail.com',0,NULL,'2023-06-03 12:44:06'),(21,'1002274599','$2y$10$uTSFYeyTuFe1gTbBde7nCe.GIOPvsbZwOpoLCc.omRgGTdWKuqH96',3,'ACTIVO','kainatkm@hotmail.com',0,NULL,'2023-06-03 12:51:24'),(22,'1002276287','$2y$10$PGzQXA48us1f/hKFjYyFduqcrhsIHA2wawfihTTzIjNd9Nw0uN9iO',3,'ACTIVO','p495064@gmail.com',0,NULL,'2023-06-03 12:56:50'),(23,'1102870351','$2y$10$jhM0UNjgsSbeQswK5O/Ox.meZrhFzaSYoCMspg.5LM5CcZsKXBu/y',3,'ACTIVO','julyhet022@gmail.com',0,NULL,'2023-06-03 13:02:59'),(24,'6835185','$2y$10$v9TnF1mQkn2MQAa3jboHGO0eIMmwJ2woSpuWmoCRSczg/FlSHCV1u',3,'ACTIVO','rosmerytorrealba78@gmail.com',0,NULL,'2023-06-03 13:09:22'),(25,'1048941750','$2y$10$SICeUR9CbzgfGbvshAqPNeThjk3lNjpA9nqL8LwZcCbqB40U2eB0i',3,'ACTIVO','andresagamez3@gmail.com',0,NULL,'2023-06-03 13:15:32');

/* Procedure structure for procedure `SP_EDITAR_DOCENTE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_EDITAR_DOCENTE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_DOCENTE`(IN IDDOCENTE VARCHAR(50),IN TIPO_DOC VARCHAR(50),IN NOMBRES VARCHAR(100),
IN APELLIDOS VARCHAR(100),IN DIRECCION VARCHAR(100),IN BARRIO VARCHAR(100),IN TELEFONO VARCHAR(100),IN SEXO_DOC VARCHAR(50),IN FECHA_NAC DATE,IN IDPROFESION INT)
update docentes set
tipo_documento=TIPO_DOC,
nombres =NOMBRES,
apellidos=APELLIDOS,
docentes.direccion =DIRECCION,
docentes.barrio =BARRIO,
docentes.telefono = TELEFONO,
docentes.sexo =SEXO_DOC,
docentes.fecha_nacimiento = FECHA_NAC,
docentes.idprofesion = IDPROFESION 
where  id =IDDOCENTE */$$
DELIMITER ;

/* Procedure structure for procedure `SP_EDITAR_ESTUDIANTE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_EDITAR_ESTUDIANTE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_ESTUDIANTE`(IN IDESTUDIANTE VARCHAR(50),IN NOMBRE VARCHAR(100),
IN APELLIDOS VARCHAR(100),IN TIPO_DOC VARCHAR(50),
IN FECHA_NAC DATE,IN SEXO_EST VARCHAR(50),IN ESTADO_CIVIL VARCHAR(100),IN DIRECCION VARCHAR(100),IN DEPARTAMENTO VARCHAR(100),IN CIUDAD VARCHAR(100),IN TELEFONO VARCHAR(100),
IN TIPO_VIVIENDA VARCHAR(100),IN ESTRATO INT,
IN GRUPO_POBLACION VARCHAR(100),IN EPS_NOMBRE VARCHAR(100),
IN SISBEN VARCHAR(100),IN FORMACION VARCHAR(100),
IN OCUPACION VARCHAR(100))
update estudiantes set
nombres =NOMBRE,
apellidos=APELLIDOS,
tipo_documento=TIPO_DOC,
estudiantes.fecha_nacimiento =FECHA_NAC,
estudiantes.sexo =SEXO_EST,
estudiantes.estado_civil =ESTADO_CIVIL,
estudiantes.direccion =DIRECCION,
estudiantes.departamento =DEPARTAMENTO,
estudiantes.ciudad =CIUDAD,
estudiantes.telefono =TELEFONO,
estudiantes.tipo_vivienda =TIPO_VIVIENDA,
estudiantes.estrato =ESTRATO,
estudiantes.tipo_poblacion =GRUPO_POBLACION,
estudiantes.eps =EPS_NOMBRE,
estudiantes.sisben =SISBEN,
estudiantes.formacion = FORMACION,
estudiantes.ocupacion =OCUPACION
where  documento =IDESTUDIANTE */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_COMBO_PROGRAMAS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_COMBO_PROGRAMAS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_PROGRAMAS`(IN IDSEDE INT)
select `programa_id`, `nombre_programa` from programa
where `programa`.`idsede`=IDSEDE */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_DISTRI_MODULOS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_DISTRI_MODULOS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_DISTRI_MODULOS`(IN `IDPROGRAMA` INT, IN `IDSEMESTRE` INT)
SELECT
    `dm`.`idprograma`
    , `pr`.`nombre_programa`
    , `dm`.`idasignatura`
    , `as`.`nombre_modulo`
    , `as`.`cant_horas`
    , `dm`.`idsemestre`
    , `sm`.`numero`
    , `dm`.`fregistro`
    ,dm.estatus
FROM
    `distribucion_modulo` AS `dm`
    INNER JOIN `asignaturas` AS `as` 
        ON (`dm`.`idasignatura` = `as`.`id`)
    INNER JOIN `programa` AS `pr`
        ON (`dm`.`idprograma` = `pr`.`programa_id`)
    INNER JOIN `semestre` AS `sm`
        ON (`dm`.`idsemestre` = `sm`.`id`)
               WHERE `dm`.`idprograma` = IDPROGRAMA AND  `dm`.`idsemestre` =IDSEMESTRE
        order by  pr.`nombre_programa`,    `nombre_modulo` asc */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_DOCENTE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_DOCENTE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_DOCENTE`()
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=0;

SELECT
@CANTIDAD:=@CANTIDAD+1 AS posicion,

    `docentes`.`id`
    , docentes.`tipo_documento`
    ,CONCAT_WS(' ', `docentes`.`nombres`    , `docentes`.`apellidos` ) AS docente
    , `docentes`.`direccion`
    , `docentes`.`barrio`
    , `docentes`.`telefono`
    , `docentes`.`sexo`
 
    , `docentes`.`fecha_nacimiento`
    , `docentes`.`idprofesion`
    , `profesion`.`nombre_profesion`
   
    , `docentes`.`fregistro`
    , `docentes`.`estatus`
FROM
    `docentes`
    INNER JOIN `profesion` 
        ON (`docentes`.`idprofesion` = `profesion`.`profesion_id`);
  
       
 END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_ESTUDIANTES2` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_ESTUDIANTES2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ESTUDIANTES2`()
SELECT
    `estudiantes`.`nombres`  , `estudiantes`.`apellidos`    , `estudiantes`.`tipo_documento`
    , `estudiantes`.`documento`    , `estudiantes`.`fecha_nacimiento`
    , `estudiantes`.`sexo`    , `estudiantes`.`estado_civil`
    , `estudiantes`.`direccion`    , `estudiantes`.`departamento`
    , `estudiantes`.`ciudad`    , `estudiantes`.`telefono`
    , `estudiantes`.`tipo_vivienda`    , `estudiantes`.`estrato`
    , `estudiantes`.`tipo_poblacion`    , `estudiantes`.`eps`
    , `estudiantes`.`sisben`    , `estudiantes`.`formacion`
    , `estudiantes`.`ocupacion`		,matriculas.fecha_ingreso
    ,  `matriculas`.`nombre_ref`   , `matriculas`.`apellidos_ref` 
    , `matriculas`.`parentesco`     , `matriculas`.`direccion_ref`
    , `matriculas`.`telefono_ref`    , `matriculas`.`correo_ref`
    , `estudiantes`.`fregistro`    , `estudiantes`.`estatus`
FROM
    `matriculas`
    INNER JOIN `estudiantes`         ON (`matriculas`.`documento` = `estudiantes`.`documento`) */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_PROGRAMAS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_PROGRAMAS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PROGRAMAS`(IN IDSEDE INT)
SELECT
    `programa`.`programa_id`
    , `programa`.`nombre_programa`
    , `programa`.`idsede`
    , `sedes`.`sede_nombre`
    , `programa`.`fregistro`
    , `programa`.`estatus`
FROM
    `programa`
    INNER JOIN `sedes` 
        ON (`programa`.`idsede` = `sedes`.`sede_id`)
        where `programa`.`idsede` = IDSEDE */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_USUARIO`()
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=0;

SELECT
@CANTIDAD:=@CANTIDAD+1 AS posicion,
    `usuario`.`usuario_id`
    , `usuario`.`usuario_nombre`
    , `usuario`.`rol_id`
    , `rol`.`nombre_rol`
    , `usuario`.`usuario_estatus`
    , `usuario`.`usuario_email`
    , `usuario`.`usuario_intento`
   
    , `usuario`.`usuario_imagen`
    , `usuario`.`usuario_fregistro`
FROM
    `usuario`
    INNER JOIN `rol` 
        ON (`usuario`.`rol_id` = `rol`.`id`);
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MATRICULAS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MATRICULAS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MATRICULAS`(IN IDPROGRAMA INT, IN IDSEMESTRE INT, IN IDJORNADA INT)
SELECT
    `matriculas`.`id`
    , `matriculas`.`documento`
    , CONCAT_WS (' ', `estudiantes`.`nombres`     , `estudiantes`.`apellidos` ) AS estudiante
    , `matriculas`.`idsede`
    , `sedes`.`sede_nombre`
    , `matriculas`.`idprograma`
    , `programa`.`nombre_programa`
    , `matriculas`.`idsemestre`
    , `semestre`.`numero`
    , `matriculas`.`idjornada`
    , `jornada`.`nombre_jornada`
    , `matriculas`.`fecha_ingreso`
     
    , `matriculas`.`estatus`
FROM
    `matriculas`
    INNER JOIN `estudiantes` 
        ON (`matriculas`.`documento` = `estudiantes`.`documento`)
    INNER JOIN `sedes` 
        ON (`matriculas`.`idsede` = `sedes`.`sede_id`)
    INNER JOIN `jornada` 
        ON (`matriculas`.`idjornada` = `jornada`.`id`)
    INNER JOIN `programa` 
        ON (`matriculas`.`idprograma` = `programa`.`programa_id`)
    INNER JOIN `semestre` 
        ON (`matriculas`.`idsemestre` = `semestre`.`id`)
        where `matriculas`.`idprograma`   = IDPROGRAMA
         and `matriculas`.`idsemestre`  =IDSEMESTRE
          and `matriculas`.`idjornada` = IDJORNADA */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ASIGNATURA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ASIGNATURA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ASIGNATURA`(IN `IDASIGNATURA` INT, 
IN `NOMBRE_ACTUAL` VARCHAR(250), IN `NOMBRE_NUEVO` VARCHAR(250), 
IN `CANTIDAD_HORAS` VARCHAR(100), IN CREDITOS_MODULO INT)
BEGIN
DECLARE CANTIDAD INT;
IF NOMBRE_ACTUAL = NOMBRE_NUEVO THEN
	UPDATE asignaturas SET
	`cant_horas`=CANTIDAD_HORAS,
	creditos =CREDITOS_MODULO
	WHERE id = IDASIGNATURA;
SELECT 1;
ELSE 

SET @CANTIDAD:=(SELECT COUNT(*) FROM asignaturas WHERE `nombre_modulo`=NOMBRE_NUEVO);
IF  @CANTIDAD = 0 THEN

UPDATE asignaturas SET
	`nombre_modulo` =NOMBRE_NUEVO,
	`cant_horas`=CANTIDAD_HORAS,
	creditos =CREDITOS_MODULO
	WHERE id = IDASIGNATURA;

SELECT 1;
ELSE 
SELECT 2;
END IF;
END IF;


END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_FOTO_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_FOTO_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_FOTO_USUARIO`(IN idusuario INT, IN foto VARCHAR(250))
BEGIN 
UPDATE usuario SET 
usuario_imagen =foto
WHERE usuario_id =idusuario;
SELECT 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_PROFESION` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_PROFESION` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_PROFESION`(IN `ID` INT, IN `NOMBRE_ACTUAL` VARCHAR(250), IN `NOMBRE_NUEVO` VARCHAR(250), IN `ESTATUS` VARCHAR(15))
BEGIN
DECLARE CANTIDAD INT;
IF NOMBRE_ACTUAL = NOMBRE_NUEVO THEN
	UPDATE `profesion` SET
	`estatus`=ESTATUS
	WHERE `profesion_id` = ID;
SELECT 1;
ELSE 
SET @CANTIDAD:=(SELECT COUNT(*) FROM `profesion` WHERE `nombre_profesion`=NOMBRE_NUEVO);
IF  @CANTIDAD = 0 THEN
UPDATE profesion SET
`estatus`=ESTATUS,
`nombre_profesion`=NOMBRE_NUEVO
WHERE `profesion_id` = ID;
SELECT 1;
ELSE 
SELECT 2;
END IF;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ROL` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ROL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ROL`(IN `IDROL` INT, IN `NOMBRE_ACTUAL` VARCHAR(250), IN `NOMBRE_NUEVO` VARCHAR(250), IN `ESTATUS_ROL` VARCHAR(15))
BEGIN
DECLARE CANTIDAD INT;
IF NOMBRE_ACTUAL = NOMBRE_NUEVO THEN
	UPDATE rol SET
	estatus=ESTATUS_ROL
	WHERE id = IDROL;
SELECT 1;
ELSE 

SET @CANTIDAD:=(SELECT COUNT(*) FROM rol WHERE `nombre_rol`=NOMBRE_NUEVO);
IF  @CANTIDAD = 0 THEN
UPDATE rol SET
estatus=ESTATUS_ROL,
`nombre_rol`=NOMBRE_NUEVO

WHERE id = IDROL;
SELECT 1;
ELSE 
SELECT 2;
END IF;
END IF;



END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_SEDES` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_SEDES` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_SEDES`(IN `ID` INT, IN `SEDE_ACTUAL` VARCHAR(250),
 IN `SEDE_NUEVO` VARCHAR(250), CIUDAD_EDT VARCHAR(100))
BEGIN
DECLARE CANTIDAD INT;
IF SEDE_ACTUAL = SEDE_NUEVO THEN
    UPDATE sedes SET
sede_ciudad=CIUDAD_EDT
WHERE sede_id = ID;
SELECT 1;
ELSE 
SET @CANTIDAD:=(SELECT COUNT(*) FROM sedes WHERE sede_nombre=SEDE_NUEVO);
IF  @CANTIDAD = 0 THEN
UPDATE sedes SET
sede_nombre=SEDE_NUEVO,
`sede_ciudad`=CIUDAD_EDT
WHERE sede_id = ID;
SELECT 1;
ELSE 
SELECT 2;
END IF;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_Asignatura` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_Asignatura` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_Asignatura`(IN `NOMBRE` VARCHAR(50),
 IN `CANTIDAD_HORAS` VARCHAR(50), IN CREDITOS INT)
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM `asignaturas` WHERE `nombre_modulo`=NOMBRE);
IF @CANTIDAD= 0 THEN 
INSERT INTO `asignaturas`(`nombre_modulo`,`cant_horas`, `creditos`, `estatus`)
VALUES (NOMBRE,CANTIDAD_HORAS,CREDITOS,'ACTIVO');
SELECT 1;
 ELSE 
 SELECT 2;
 END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_DOCENTE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_DOCENTE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_DOCENTE`(IN `CEDULA` VARCHAR(50), IN `TIPO_DOCUMENTO` VARCHAR(50), IN `NOMBRES` CHAR(100), IN `APELLIDOS` VARCHAR(200), IN `DIRECCION` CHAR(100), IN `BARRIO` CHAR(100), IN `TELEFONO` VARCHAR(100), IN `SEXO` VARCHAR(100), IN `FECHA_NAC` DATE, IN `IDPROFESION` INT, IN `USUARIO` VARCHAR(20), IN `CONTRASENA` VARCHAR(250), IN `ROL` INT, IN `CORREO` CHAR(100))
BEGIN
DECLARE  CANTIDADU INT;
DECLARE CANTIDADME INT;
SET @CANTIDADU :=(SELECT COUNT(*) FROM usuario WHERE usuario_nombre =USUARIO);
IF @CANTIDADU = 0 THEN
    SET @CANTIDADME:=(SELECT COUNT(*) FROM docentes WHERE `id` =CEDULA);
    IF @CANTIDADME = 0 THEN
        INSERT INTO usuario(usuario_nombre,usuario_password, rol_id,usuario_estatus,
            usuario_email,usuario_intento)
        VALUES(USUARIO,CONTRASENA, ROL,'ACTIVO',CORREO,0);
        INSERT INTO docentes(`id`,`tipo_documento`,`nombres`,`apellidos`,
        `direccion`, `barrio`, `telefono`,`sexo`,`fecha_nacimiento`,`idprofesion`,
        `idusuario`,`estatus`)
        VALUES(CEDULA,TIPO_DOCUMENTO,NOMBRES,APELLIDOS,DIRECCION,BARRIO,
            TELEFONO,SEXO, FECHA_NAC ,IDPROFESION,
        (SELECT MAX(usuario_id) FROM usuario),'INACTIVO');
        SELECT 1;
    ELSE
    SELECT 2;
    END IF;
    ELSE 
    SELECT 2;
END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_ESTUDIANTE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_ESTUDIANTE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_ESTUDIANTE`(IN `NOMBRE` VARCHAR(50), IN `APELLIDOS` VARCHAR(50), IN `TIPO_DOCUMENTO` VARCHAR(200), IN `NUMERO` CHAR(20), IN `FEC_NAC` DATE, IN `SEXO` VARCHAR(50), IN `ESTADO_CIVIL` VARCHAR(100), IN `DIRECCION` VARCHAR(100), IN `DEPARTAMENTO` VARCHAR(100), IN `CIUDAD` VARCHAR(100), IN `TELEFONO` VARCHAR(100), IN `TIPO_VIVIENDA` VARCHAR(50), IN `ESTRATO` INT, IN `GRUPO_POBLACION` VARCHAR(100), IN `EPS` INT, IN `SISBEN` VARCHAR(100), IN `FORMACION` VARCHAR(200), IN `OCUPACION` VARCHAR(100), IN `USUARIO` VARCHAR(20), IN `CONTRASENA` VARCHAR(250), IN `ROL` INT, IN `EMAIL` VARCHAR(100), IN `IDSEDE` INT, IN `IDPROGRAMA` INT, IN `IDSEMESTRE` INT, IN `IDJORNADA` INT, IN `FECHA_MAT` DATE, IN `NOMBRE_REF` VARCHAR(100), IN `APELLIDO_REF` VARCHAR(100), IN `PARENTESCO` VARCHAR(100), IN `DIRECCION_REF` VARCHAR(100), IN `TELEFONO_REF` VARCHAR(100), IN `CORREO_REF` VARCHAR(100))
BEGIN
DECLARE  CANTIDADU INT;
DECLARE CANTIDADME INT;
SET @CANTIDADU :=(SELECT COUNT(*) FROM usuario WHERE usuario_nombre =USUARIO);
IF @CANTIDADU = 0 THEN
    SET @CANTIDADME:=(SELECT COUNT(*) FROM estudiantes WHERE documento =NUMERO);
    IF @CANTIDADME = 0 THEN
        INSERT INTO usuario(usuario_nombre,usuario_password, rol_id,usuario_estatus,
            usuario_email,usuario_intento)
        VALUES(USUARIO,CONTRASENA, ROL,'ACTIVO',EMAIL,0);
        INSERT INTO estudiantes(nombres,apellidos,tipo_documento,
        documento, `fecha_nacimiento`, sexo, estado_civil, direccion, `departamento`, ciudad,
        telefono,tipo_vivienda,estrato,tipo_poblacion,eps,`sisben`,
        formacion,ocupacion, `idusuario`,`estatus`)
        VALUES(NOMBRE,APELLIDOS,TIPO_DOCUMENTO,NUMERO,FEC_NAC,SEXO,ESTADO_CIVIL,
            DIRECCION,DEPARTAMENTO,CIUDAD,TELEFONO,
            TIPO_VIVIENDA,ESTRATO,GRUPO_POBLACION,EPS,SISBEN, FORMACION,OCUPACION
           ,
        (SELECT MAX(usuario_id) FROM usuario),'ACTIVO');
		
		INSERT INTO matriculas(documento,idsede,`idprograma`,
            idsemestre,idjornada,`fecha_ingreso`,`nombre_ref`,`apellidos_ref`,`parentesco`,`direccion_ref`,`telefono_ref`,`correo_ref`,`estatus`)
		VALUES (NUMERO,IDSEDE,IDPROGRAMA,IDSEMESTRE,IDJORNADA, 
		FECHA_MAT,NOMBRE_REF,APELLIDO_REF,PARENTESCO,DIRECCION_REF,TELEFONO_REF,CORREO_REF,'MATRICULADO');
        SELECT 1;
    ELSE
    SELECT 2;
    END IF;
    ELSE 
    SELECT 2;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_ESTUDIANTE2` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_ESTUDIANTE2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_ESTUDIANTE2`(IN `NOMBRE` VARCHAR(50), 
IN `APELLIDOS` VARCHAR(50), IN `TIPO_DOCUMENTO` VARCHAR(200), 
IN `NUMERO` CHAR(20), IN `FEC_NAC` DATE, IN `SEXO` VARCHAR(50),
 IN `ESTADO_CIVIL` VARCHAR(100), IN `DIRECCION` VARCHAR(100), 
 IN `DEPARTAMENTO` VARCHAR(100), IN `CIUDAD` VARCHAR(100), 
 IN `TELEFONO` VARCHAR(100), IN `TIPO_VIVIENDA` VARCHAR(50),
  IN `ESTRATO` INT, IN `GRUPO_POBLACION` VARCHAR(100),
   IN `EPS` INT, IN `SISBEN` VARCHAR(100),
    IN `FORMACION` VARCHAR(200),
     IN `OCUPACION` VARCHAR(100),
      IN `USUARIO` VARCHAR(20), 
      IN `CONTRASENA` VARCHAR(250),
       IN `ROL` INT, 
       IN `EMAIL` VARCHAR(100),
        IN `IDSEDE` INT, 
        IN `IDPROGRAMA` INT,
         IN `IDSEMESTRE` INT,
          IN `IDJORNADA` INT, 
          IN `FECHA_MAT` DATE,
           IN `NOMBRE_REF` VARCHAR(100), 
           IN `APELLIDO_REF` VARCHAR(100),
            IN `PARENTESCO` VARCHAR(100), 
            IN `DIRECCION_REF` VARCHAR(100), IN `TELEFONO_REF` VARCHAR(100), IN `CORREO_REF` VARCHAR(100), IN RUTA VARCHAR(255))
BEGIN
DECLARE  CANTIDADU INT;
DECLARE CANTIDADME INT;
SET @CANTIDADU :=(SELECT COUNT(*) FROM usuario WHERE usuario_nombre =USUARIO);
IF @CANTIDADU = 0 THEN
    SET @CANTIDADME:=(SELECT COUNT(*) FROM estudiantes WHERE documento =NUMERO);
    IF @CANTIDADME = 0 THEN
        INSERT INTO usuario(usuario_nombre,usuario_password, rol_id,usuario_estatus,
            usuario_email,usuario_intento)
        VALUES(USUARIO,CONTRASENA, ROL,'ACTIVO',EMAIL,0);
        INSERT INTO estudiantes(nombres,apellidos,tipo_documento,
        documento, `fecha_nacimiento`, sexo, estado_civil, direccion, `departamento`, ciudad,
        telefono,tipo_vivienda,estrato,tipo_poblacion,eps,`sisben`,
        formacion,ocupacion, `idusuario`,`foto`, `estatus`)
        VALUES(NOMBRE,APELLIDOS,TIPO_DOCUMENTO,NUMERO,FEC_NAC,SEXO,ESTADO_CIVIL,
            DIRECCION,DEPARTAMENTO,CIUDAD,TELEFONO,
            TIPO_VIVIENDA,ESTRATO,GRUPO_POBLACION,EPS,SISBEN, FORMACION,OCUPACION
           ,
        (SELECT MAX(usuario_id) FROM usuario),RUTA,'ACTIVO');
		
		INSERT INTO matriculas(documento,idsede,`idprograma`,
            idsemestre,idjornada,`fecha_ingreso`,`nombre_ref`,`apellidos_ref`,`parentesco`,`direccion_ref`,`telefono_ref`,`correo_ref`,`estatus`)
		VALUES (NUMERO,IDSEDE,IDPROGRAMA,IDSEMESTRE,IDJORNADA, 
		FECHA_MAT,NOMBRE_REF,APELLIDO_REF,PARENTESCO,DIRECCION_REF,TELEFONO_REF,CORREO_REF,'MATRICULADO');
        SELECT 1;
    ELSE
    SELECT 2;
    END IF;
    ELSE 
    SELECT 2;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_JORNADA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_JORNADA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_JORNADA`(IN `NOMBRE` VARCHAR(200))
BEGIN 
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM `jornada` WHERE `nombre_jornada` = NOMBRE);
IF @CANTIDAD = 0 THEN
INSERT INTO `jornada` (`nombre_jornada`, `estatus`)
VALUES (NOMBRE,'ACTIVO');
SELECT 1;
ELSE
SELECT 2;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_PROFESION` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_PROFESION` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PROFESION`(IN NOMBRE VARCHAR(50))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM `profesion` WHERE `nombre_profesion`=NOMBRE);
IF @CANTIDAD= 0 THEN 
INSERT INTO profesion(`nombre_profesion`,`estatus`)
VALUES (NOMBRE,'ACTIVO');
SELECT 1;
 ELSE 
 SELECT 2;
 END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_PROGRAMA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_PROGRAMA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PROGRAMA`( IN `NOM_PROGRAMA` VARCHAR(100),IN `IDSEDE` INT)
BEGIN

INSERT INTO programa(`nombre_programa`,`idsede`, estatus)
VALUES (NOM_PROGRAMA,IDSEDE,'ACTIVO');

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_ROL` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_ROL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_ROL`(IN NOMBRE VARCHAR(50))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM rol WHERE `nombre_rol`=NOMBRE);
IF @CANTIDAD= 0 THEN 
INSERT INTO rol(`nombre_rol`,`estatus`)
VALUES (NOMBRE,'ACTIVO');
SELECT 1;
 ELSE 
 SELECT 2;
 END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_SEDES` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_SEDES` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_SEDES`(IN `NOMBRE` VARCHAR(50), IN `NOM_CIUDAD` VARCHAR(100))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM sedes WHERE `sede_nombre`=NOMBRE);
IF @CANTIDAD= 0 THEN 
INSERT INTO sedes(`sede_nombre`,`sede_ciudad`,estatus)
VALUES (NOMBRE,NOM_CIUDAD,'ACTIVO');
SELECT 1;
 ELSE 
 SELECT 2;
 END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_USUARIO`(IN USUARIO VARCHAR(100), 
IN PASS VARCHAR(250),IN IDROL INT, IN CORREO VARCHAR(100), IN SEXO CHAR(5),
 IN RUTA VARCHAR(255))
BEGIN 
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM usuario WHERE usuario_nombre =USUARIO 
OR usuario_email =CORREO);
IF @CANTIDAD =0 THEN
INSERT INTO `usuario` (`usuario_nombre`,`usuario_password`,`rol_id`,`usuario_estatus`,`usuario_email`, `usuario_intento`,   
`usuario_imagen`) VALUES(USUARIO,PASS,IDROL,'ACTIVO',CORREO,0,RUTA);
SELECT 1;
ELSE 
SELECT 2;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_TRAER_DATOS_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_TRAER_DATOS_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRAER_DATOS_USUARIO`(IN `ID` INT)
SELECT
    `usuario`.`usuario_id`
    , `usuario`.`usuario_nombre`
    , `usuario`.`usuario_password`
    , `usuario`.`rol_id`
    , `rol`.`nombre_rol`
    , `usuario`.`usuario_estatus`
    , `usuario`.`usuario_email`
    , `usuario`.`usuario_intento`
    ,usuario.usuario_sexo
    , `usuario`.`usuario_imagen`
    , `usuario`.`usuario_fregistro`
FROM
    `usuario`
    INNER JOIN `rol` 
        ON (`usuario`.`rol_id` = `rol`.`id`)
        where `usuario_id` =ID */$$
DELIMITER ;

/* Procedure structure for procedure `SP_VERIFICAR_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_VERIFICAR_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VERIFICAR_USUARIO`(IN USUARIO varchar(50))
select * from usuario 
where usuario_nombre =USUARIO */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
