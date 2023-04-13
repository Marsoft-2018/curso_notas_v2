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
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `asignaturas` */

insert  into `asignaturas`(`id`,`nombre_modulo`,`cant_horas`,`fregistro`,`estatus`) values (1,'Introduccion a la logica','20','2022-02-11 08:52:18','ACTIVO'),(2,'Programacion I','20','2022-02-11 08:53:56','ACTIVO'),(3,'Programacion II','20','2022-02-11 08:54:06','ACTIVO'),(4,'Practicas','20','2022-02-11 08:54:20','ACTIVO'),(5,'Practicas ii','20','2022-02-11 08:54:27','ACTIVO');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `calificaciones` */

insert  into `calificaciones`(`id`,`idMatricula`,`idasignatura`,`nota`,`fregistro`,`estatus`) values (1,1,1,3,'2022-07-29 19:30:58',NULL),(2,1,1,3.5,'2022-07-29 19:31:04',NULL),(3,1,1,4,'2022-07-29 19:31:13',NULL),(4,1,2,4,'2022-07-31 12:51:38',NULL),(5,1,2,4.2,'2022-07-31 12:51:43',NULL),(6,1,2,3,'2022-07-31 12:51:46',NULL);

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

insert  into `distribucion_modulo`(`idprograma`,`idasignatura`,`idsemestre`,`fregistro`,`estatus`) values (1,1,1,'2022-02-11 08:54:49','ASIGNADO'),(1,2,1,'2022-02-11 08:56:06','ASIGNADO'),(1,3,2,'2022-02-11 08:56:21','ASIGNADO'),(1,4,3,'2022-02-11 08:56:34','ASIGNADO'),(1,5,4,'2022-02-11 08:56:42','ASIGNADO'),(1,3,4,'2022-07-31 12:53:50','ASIGNADO');

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

insert  into `docentes`(`id`,`tipo_documento`,`nombres`,`apellidos`,`direccion`,`barrio`,`telefono`,`sexo`,`fecha_nacimiento`,`idprofesion`,`idusuario`,`fregistro`,`estatus`) values ('1070813753','CEDULA','JERSON','BATISTA','EL CARMEN','MONTE CARMELO','3007358024','MASCULINO','1989-05-26',1,2,'2022-02-11 07:58:12','ACTIVO');

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

insert  into `estudiantes`(`nombres`,`apellidos`,`tipo_documento`,`documento`,`fecha_nacimiento`,`sexo`,`estado_civil`,`direccion`,`departamento`,`ciudad`,`telefono`,`tipo_vivienda`,`estrato`,`tipo_poblacion`,`eps`,`sisben`,`formacion`,`ocupacion`,`idusuario`,`foto`,`fregistro`,`estatus`) values ('KAREN','VEGA','CEDULA','1047378369','0000-00-00','FEMENINO','SOLTERA','EL CARMEN','BOLIVAR','EL CARMEN DE BOLIVAR','65567567','ALQUILADA',1,'DESPLAZADO','0','1','ESTUDIANTE','INDEPENDIENTE',3,NULL,'2022-02-11 08:51:05','ACTIVO');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `matriculas` */

insert  into `matriculas`(`id`,`documento`,`idsede`,`idprograma`,`idsemestre`,`idjornada`,`fecha_ingreso`,`nombre_ref`,`apellidos_ref`,`parentesco`,`direccion_ref`,`telefono_ref`,`correo_ref`,`fregistro`,`estatus`) values (1,'1047378369',1,1,1,1,'2022-02-11','Ramiro','Vega','padre','el centro','5656','rami@gmail.com','2022-02-11 08:51:05','MATRICULADO');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `programa` */

insert  into `programa`(`programa_id`,`nombre_programa`,`idsede`,`fregistro`,`estatus`) values (1,'Analisis y desarrollo  de sistemas',1,'2022-02-11 08:13:00','ACTIVO');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `sedes` */

insert  into `sedes`(`sede_id`,`sede_nombre`,`sede_ciudad`,`fregistro`,`estatus`) values (1,'Principal','EL CARMEN DE BOLIVAR','2022-02-11 08:07:24','ACTIVO');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

insert  into `usuario`(`usuario_id`,`usuario_nombre`,`usuario_password`,`rol_id`,`usuario_estatus`,`usuario_email`,`usuario_intento`,`usuario_imagen`,`usuario_fregistro`) values (1,'admin','$2y$10$CZXxdYpG8LNDVBQP6pOxJO8.oxfZTIG85ymSBZE4hJDYg9gJxewY2',1,'ACTIVO','ingjerson2014@gmail.com',0,'controlador/usuario/img/IMG112202274727.png','2022-02-11 07:47:27'),(2,'1070813753','$2y$10$P/sIobhxRr3SNvaFnfasY.5U64vstbF0RI1FwtgtiM1lSsnHSZOW.',2,'ACTIVO','docente@gmail.com',0,NULL,'2022-02-11 07:50:41'),(3,'1047378369','$2y$10$3aX.FI.5ZSDfIqz.XhIxVO3RHkjJVoADo7cbdCC19qQtFrytsWQqm',3,'ACTIVO','kareen123@gmail.com',0,NULL,'2022-02-11 08:51:05');

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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_Asignatura`(IN `NOMBRE` VARCHAR(50), IN `CANTIDAD_HORAS` VARCHAR(50))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM `asignaturas` WHERE `nombre_modulo`=NOMBRE);
IF @CANTIDAD= 0 THEN 
INSERT INTO `asignaturas`(`nombre_modulo`,`cant_horas`, `estatus`)
VALUES (NOMBRE,CANTIDAD_HORAS,'ACTIVO');
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
