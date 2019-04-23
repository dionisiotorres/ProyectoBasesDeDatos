-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 23-04-2019 a las 03:06:02
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `matricula`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicaciones`
--

DROP TABLE IF EXISTS `aplicaciones`;
CREATE TABLE IF NOT EXISTS `aplicaciones` (
  `idAplicaciones` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Aplicaciones',
  `nombreCorto` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el nombre de las distintas aplicaciones que puede tener una o muchas pantallas',
  PRIMARY KEY (`idAplicaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
CREATE TABLE IF NOT EXISTS `asignatura` (
  `idAsignatura` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Asignatura',
  `nombre` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el nombre de una asignatura',
  `codigo` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el codigo de una asignatura',
  `creditosAcademicos` int(11) DEFAULT NULL COMMENT 'Atributo que registra la cantidad de creditos academisco de la asignatura',
  `Departamentos_idDepartamentos` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Departamentos',
  PRIMARY KEY (`idAsignatura`),
  KEY `FK_DEPARTAMENTOS_ASIGNATURA` (`Departamentos_idDepartamentos`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`idAsignatura`, `nombre`, `codigo`, `creditosAcademicos`, `Departamentos_idDepartamentos`) VALUES
(1, 'Matematica 1', 'MM-110', 5, 3),
(2, 'Introduccion a Ing en Sistemas', 'IS-101', 3, 1),
(3, 'Geometria y Trigonometria', 'MM-111', 5, 3),
(4, 'Sociologia', 'SC-101', 4, 9),
(5, 'Ingles 1', 'IN-101', 4, 5),
(6, 'Fisica 1', 'FS-100', 5, 8),
(7, 'Dibujo 1', 'DQ-101', 3, 7),
(8, 'Historia de Honduras', 'HH-101', 4, 6),
(9, 'Español General 1', 'EG-011', 4, 9),
(10, 'Calculo 1', 'MM-201', 5, 3),
(11, 'Calculo 2', 'MM-202', 5, 3),
(12, 'Programacion 1', 'MM-314', 4, 3),
(13, 'Programacion 2', 'IS-201', 4, 1),
(14, 'Fisica 2', 'FS-200', 5, 8),
(15, 'Ingles 2', 'IN-102', 4, 5);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `asignaturacancelada`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `asignaturacancelada`;
CREATE TABLE IF NOT EXISTS `asignaturacancelada` (
`NombreAlumno` varchar(183)
,`numeroCuenta` varchar(45)
,`NombreCentroEstudio` varchar(45)
,`Anio` int(4)
,`Carrera` varchar(45)
,`CodAsig` varchar(45)
,`Asignatura` varchar(45)
,`seccion` varchar(45)
,`HoraInicio` time
,`HoraFin` time
,`dias` varchar(45)
,`Edificio` varchar(45)
,`Aula` varchar(45)
,`creditosAcademicos` int(11)
,`Periodo` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `asignaturaespera`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `asignaturaespera`;
CREATE TABLE IF NOT EXISTS `asignaturaespera` (
`NombreAlumno` varchar(183)
,`numeroCuenta` varchar(45)
,`NombreCentroEstudio` varchar(45)
,`Anio` int(4)
,`Carrera` varchar(45)
,`CodAsig` varchar(45)
,`Asignatura` varchar(45)
,`seccion` varchar(45)
,`HoraInicio` time
,`HoraFin` time
,`dias` varchar(45)
,`Edificio` varchar(45)
,`Aula` varchar(45)
,`creditosAcademicos` int(11)
,`Periodo` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturaplanestudio`
--

DROP TABLE IF EXISTS `asignaturaplanestudio`;
CREATE TABLE IF NOT EXISTS `asignaturaplanestudio` (
  `idAsignaturaPlanEstudio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla AsignaturaPlanEstudio\n',
  `Asignatura_idAsignatura` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Asignatura',
  `PlanEstudio_idPlanEstudio` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla PlanEstudio',
  PRIMARY KEY (`idAsignaturaPlanEstudio`),
  KEY `FK_ASIGNATURA_ASIGNATURA_PLANESTUDIO` (`Asignatura_idAsignatura`),
  KEY `FK_PLAN_ESTUDIO_ASIGNATURA_PLANESTUDIO` (`PlanEstudio_idPlanEstudio`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignaturaplanestudio`
--

INSERT INTO `asignaturaplanestudio` (`idAsignaturaPlanEstudio`, `Asignatura_idAsignatura`, `PlanEstudio_idPlanEstudio`) VALUES
(1, 10, 1),
(2, 2, 1),
(3, 1, 1),
(4, 3, 1),
(5, 1, 2),
(6, 5, 1),
(7, 6, 1),
(8, 7, 1),
(9, 8, 1),
(10, 9, 1),
(11, 10, 1),
(12, 11, 1),
(13, 12, 1),
(14, 13, 1),
(15, 14, 1),
(16, 15, 1),
(17, 2, 2),
(18, 14, 2),
(19, 14, 2),
(20, 9, 3),
(21, 8, 3),
(22, 1, 3),
(23, 7, 3),
(24, 5, 3),
(25, 5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aula`
--

DROP TABLE IF EXISTS `aula`;
CREATE TABLE IF NOT EXISTS `aula` (
  `idAula` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Aula',
  `numero` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el numero de una aula especifica',
  `Edificio_idEdificio` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Edificio',
  `estado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idAula`),
  KEY `FK_EDIFICIO_AULA` (`Edificio_idEdificio`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aula`
--

INSERT INTO `aula` (`idAula`, `numero`, `Edificio_idEdificio`, `estado`) VALUES
(13, '101', 1, 'L'),
(14, '102', 1, 'L'),
(15, '201', 1, 'L'),
(16, '202', 1, 'L'),
(17, '101', 2, 'L'),
(18, '102', 2, 'L'),
(19, '201', 2, 'L'),
(20, '202', 2, 'L'),
(21, '101', 3, 'L'),
(22, '102', 3, 'L'),
(23, '201', 3, 'L'),
(24, '202', 3, 'L'),
(25, '101', 4, 'L'),
(26, '102', 4, 'L'),
(27, '201', 4, 'L'),
(28, '202', 4, 'L'),
(29, '101', 5, 'L'),
(30, '101', 6, 'L'),
(31, '101', 7, 'L'),
(32, '101', 8, 'L'),
(33, '101', 9, 'L'),
(34, '101', 10, 'L'),
(35, '101', 11, 'L'),
(36, '101', 12, 'L'),
(37, '101', 13, 'L');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `auladisponible`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `auladisponible`;
CREATE TABLE IF NOT EXISTS `auladisponible` (
`nombre` varchar(45)
,`numero` varchar(45)
,`HoraDisponible` time
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `calificaciones_seccion`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `calificaciones_seccion`;
CREATE TABLE IF NOT EXISTS `calificaciones_seccion` (
`Asignatura` varchar(45)
,`seccion` varchar(45)
,`NombreAlumno` varchar(183)
,`numeroCuenta` varchar(45)
,`calificacion` double
,`OBS` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

DROP TABLE IF EXISTS `carrera`;
CREATE TABLE IF NOT EXISTS `carrera` (
  `idCarrera` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Carrera',
  `nombre` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el nombre de una carrera',
  `fechaInicio` date DEFAULT NULL COMMENT 'Atributo que registra la fecha de inicio de una carrera',
  `Facultad_idFaccultad` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Facultad',
  PRIMARY KEY (`idCarrera`),
  KEY `FK_FACULTAD_CARRERA` (`Facultad_idFaccultad`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`idCarrera`, `nombre`, `fechaInicio`, `Facultad_idFaccultad`) VALUES
(1, 'Ingeniería en sistemas', '2003-05-07', 1),
(2, 'Ingeniería Electrica', '1995-11-11', 1),
(3, 'Ingeniería Quimica', '1999-03-04', 1),
(4, 'Ingeniería Civil', '1970-07-19', 1),
(5, 'Lenguas Extranjeras', '2000-01-16', 4),
(6, 'Quimica y Farmacia', '2007-03-12', 5),
(7, 'Arquitectura', '1989-08-08', 4),
(8, 'Derecho', '1970-03-10', 2),
(9, 'Psicologia', '2000-03-19', 3),
(10, 'Matematicas', '1990-09-10', 6),
(11, 'Fisica', '1985-03-19', 6),
(12, 'Astronomia y Astrofisica', '2007-02-06', 7),
(13, 'Medicina', '1970-08-16', 8),
(14, 'Odontología', '2000-01-06', 9),
(15, 'Enfermeria', '1997-03-18', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centroestudio`
--

DROP TABLE IF EXISTS `centroestudio`;
CREATE TABLE IF NOT EXISTS `centroestudio` (
  `idCentroEstudio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla CentroEstudio',
  `nombreCentroEstudio` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el nombre del centro de estudio',
  `Ciudades_idCiudades` int(11) NOT NULL,
  PRIMARY KEY (`idCentroEstudio`),
  KEY `FK_CIUDADES_CENTRO_ESTUDIO` (`Ciudades_idCiudades`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `centroestudio`
--

INSERT INTO `centroestudio` (`idCentroEstudio`, `nombreCentroEstudio`, `Ciudades_idCiudades`) VALUES
(1, 'UNAH-CU', 1),
(2, 'UNAH-VS', 2),
(3, 'UNAH-CURLA', 5),
(4, 'UNAH-TEC Danli', 4),
(5, 'UNAH-TEC Aguan', 6),
(6, 'UNAH-TEC Curno', 7),
(7, 'UNAH-TEC CURLP', 8),
(8, 'UNAH-TEC CURC', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE IF NOT EXISTS `ciudades` (
  `idCiudades` int(11) NOT NULL COMMENT 'Llave primaria de la tabla Ciudades',
  `nombreCiudad` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el nombre de ciudades donde exites un centro educativo',
  PRIMARY KEY (`idCiudades`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`idCiudades`, `nombreCiudad`) VALUES
(1, 'Tegucigalpa'),
(2, 'San Pedro Sula'),
(3, 'Comayagua'),
(4, 'Danli'),
(5, 'La Ceiba'),
(6, 'Olanchito'),
(7, 'Santa Rosa de Copan'),
(8, 'Choluteca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controles`
--

DROP TABLE IF EXISTS `controles`;
CREATE TABLE IF NOT EXISTS `controles` (
  `idControles` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Controles',
  `nombreCorto` varchar(45) DEFAULT NULL COMMENT 'Atributo que  registra el nombre de los distintos controles a los que se puede accerder con cada privilegio',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Atributo que detalla los distintos controles a los que se puede accerder con cada privilegio',
  PRIMARY KEY (`idControles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correo`
--

DROP TABLE IF EXISTS `correo`;
CREATE TABLE IF NOT EXISTS `correo` (
  `idCorreo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Correo',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra los detalles del correo',
  `Persona_idPersona` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Persona',
  PRIMARY KEY (`idCorreo`),
  KEY `FK_PERSONA_CORREO` (`Persona_idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `correo`
--

INSERT INTO `correo` (`idCorreo`, `descripcion`, `Persona_idPersona`) VALUES
(1, 'mario.gon@gmail.com', 3),
(2, 'andrea.ortega@yahoo.com', 1),
(3, 'karla_castro@gmail.com', 8),
(4, 'estefany_ruiz@gmail.com', 5),
(5, 'jose.perez@yahoo.com', 2),
(6, 'carlos.portillo@gmail.com', 4),
(7, 'lalejandra@gmail.com', 7),
(8, 'armando@hotmail.com', 6),
(9, 'dave.suarez@gmail.com', 9),
(10, 'valeria_lopez@gmaiol.com', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE IF NOT EXISTS `departamentos` (
  `idDepartamentos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Departamentos',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra los detalles de un departamentos',
  PRIMARY KEY (`idDepartamentos`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`idDepartamentos`, `descripcion`) VALUES
(1, 'Departamento de Ingeniería en Sistemas'),
(2, 'Departamento de Ingeniería Electrica'),
(3, 'Departamento de Matematicas'),
(4, 'Departamento de Enfermeria'),
(5, 'Departamento de Lenguas Extranjera'),
(6, 'Departamento de Derecho'),
(7, 'Departamento de Arquitectura'),
(8, 'Departamento de Fisica'),
(9, 'Departamento de Psicología'),
(10, 'Departamento de Ingeniería Civil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diasclase`
--

DROP TABLE IF EXISTS `diasclase`;
CREATE TABLE IF NOT EXISTS `diasclase` (
  `idDiasClase` int(11) NOT NULL AUTO_INCREMENT,
  `dias` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDiasClase`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `diasclase`
--

INSERT INTO `diasclase` (`idDiasClase`, `dias`) VALUES
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miercoles'),
(4, 'Jueves'),
(5, 'Viernes'),
(6, 'Sabado'),
(7, 'Domingo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diasclase_has_seccion`
--

DROP TABLE IF EXISTS `diasclase_has_seccion`;
CREATE TABLE IF NOT EXISTS `diasclase_has_seccion` (
  `DiasClase_idDiasClase` int(11) NOT NULL,
  `Seccion_idSeccion` int(11) NOT NULL,
  PRIMARY KEY (`DiasClase_idDiasClase`,`Seccion_idSeccion`),
  KEY `FK_SECCION_DIAS_CLASES` (`Seccion_idSeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `diasclase_has_seccion`
--

INSERT INTO `diasclase_has_seccion` (`DiasClase_idDiasClase`, `Seccion_idSeccion`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

DROP TABLE IF EXISTS `direccion`;
CREATE TABLE IF NOT EXISTS `direccion` (
  `idDireccion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla direccion',
  `colonia` varchar(45) DEFAULT NULL COMMENT 'atributo que registra el nombre de la colonia',
  `calle` varchar(45) DEFAULT NULL COMMENT 'atributo que registra el numero de calle',
  `noCasa` int(11) DEFAULT NULL COMMENT 'atributo que registra el numero de casa',
  `referencias` varchar(45) DEFAULT NULL COMMENT 'atributo que registra referencias de la dirrecion del domicilio.',
  PRIMARY KEY (`idDireccion`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`idDireccion`, `colonia`, `calle`, `noCasa`, `referencias`) VALUES
(1, 'Bella Oriente', '3', 23, 'Casa verde'),
(2, 'Bella Oriente', '1', 4567, 'Frente a Agente Atlantida'),
(3, 'Venecia', '5', 5675, 'Calle principal'),
(4, 'Hato del medio', '7', 34, 'Frente a la despensa familiar'),
(5, 'Cerro grande', '12', 56, 'Casa azul'),
(6, 'Kenedy', '3', 5402, 'Cerco Verde'),
(7, 'Residecial plaza', '2', 13, 'Frente Pulperia Plaza'),
(8, 'Bella Oriente', '1', 45, 'Frente iglesia Catolica'),
(9, 'Cerro grande', '4', 71, 'Casa Rosada'),
(10, 'Loarque', '1', 451, 'Casa Amarilla'),
(11, 'Trapiche', '2', 567, 'Casa Azul'),
(12, 'Altos del trapiche', '3', 1212, 'Casa de cerco azul'),
(13, 'Pedregal', '1', 234, NULL),
(14, 'Altos del trapiche', '2', 45, 'Tercera Casa'),
(15, 'Villanueva', '1', 123, 'Casa Azul'),
(16, 'San Angel', '2', 34, 'Frente a pulperia San Angel'),
(17, 'San Ignacio', '2', 123, 'Casa Anarajada'),
(18, 'Residencial Plaza', '1', 456, 'Casa Beige'),
(19, 'La joya', '1', 89, 'Frente a pulperia La Joya'),
(20, 'San Jose', '3', 198, 'Frente iglesia Catolica'),
(21, 'Miramontes', '1', 4, 'Frente a Escuela'),
(22, 'El Alamo', '1', 234, 'Cerco azul'),
(23, 'Miraflores', '5', 352, 'Fente a banco'),
(24, 'San Isidro', '1', 5, 'Fenete a Colegio'),
(25, 'Kennedy', '4', 349, 'Frente a Baleadas Olanchito'),
(26, 'La quezada', '2', 45, 'Casa Azul'),
(27, 'Residencial Venecia', '3', 35, 'Frente a Pulperia Venecia'),
(28, 'Prados universitarios', '5', 109, 'Frente a Banco'),
(29, 'Nueva Era', '1', 670, 'Casa Roja'),
(30, 'Cerro grande', '3', 891, 'Frente a Agente Atlantida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

DROP TABLE IF EXISTS `docente`;
CREATE TABLE IF NOT EXISTS `docente` (
  `idDocente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la  tabla Docente',
  `Empleado_idEmpleado` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia  ala tabla Empleado',
  `jefeDepto` varchar(1) DEFAULT NULL COMMENT 'Atributo que determina si el docente es jefe de algun departamento',
  `contrasenia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idDocente`),
  KEY `FK_EMPLEADO_DOCENTE` (`Empleado_idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`idDocente`, `Empleado_idEmpleado`, `jefeDepto`, `contrasenia`) VALUES
(1, 2, 'N', 'docente1'),
(2, 3, 'S', 'docente2'),
(3, 6, 'N', 'docente3'),
(4, 4, 'S', 'docente4'),
(5, 5, 'N', 'docente5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `edificio`
--

DROP TABLE IF EXISTS `edificio`;
CREATE TABLE IF NOT EXISTS `edificio` (
  `idEdificio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Edificio',
  `nombre` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el nombre de un edificio de especifico',
  PRIMARY KEY (`idEdificio`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `edificio`
--

INSERT INTO `edificio` (`idEdificio`, `nombre`) VALUES
(1, 'A1'),
(2, 'A2'),
(3, 'B1'),
(4, 'B2'),
(5, 'C1'),
(6, 'C2'),
(7, 'C3'),
(8, 'D1'),
(9, 'F1'),
(10, 'E1'),
(11, 'I1'),
(12, 'J1'),
(13, 'K1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Empleado',
  `numContrato` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el numero de contrarto asociado a un empleado',
  `fechaRegistro` date DEFAULT NULL COMMENT 'Atributo que ingresa la fecha de los nuevos registros en la tabla',
  `TipoContrato_idTipoContrato` int(11) NOT NULL COMMENT 'Llave foranea que hace refencia a la tabla TipoContrato',
  `Persona_idPersona` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla persona',
  `Departamentos_idDepartamentos` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia al departamento',
  PRIMARY KEY (`idEmpleado`),
  KEY `FK_TIPO_CONTRATO_EMPLEADO` (`TipoContrato_idTipoContrato`),
  KEY `FK_PERSONA_EMPLEADO` (`Persona_idPersona`),
  KEY `FK_DEPARTAMENTOS_EMPLEADO` (`Departamentos_idDepartamentos`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `numContrato`, `fechaRegistro`, `TipoContrato_idTipoContrato`, `Persona_idPersona`, `Departamentos_idDepartamentos`) VALUES
(1, '100', '2015-12-04', 1, 1, 1),
(2, '101', '2019-03-06', 2, 11, 1),
(3, '102', '2018-05-06', 1, 12, 3),
(4, '103', '2018-09-05', 2, 13, 4),
(5, '104', '2014-08-16', 2, 14, 5),
(6, '108', '2015-10-30', 1, 15, 8),
(7, '109', '2014-02-15', 2, 10, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_has_privilegios`
--

DROP TABLE IF EXISTS `empleado_has_privilegios`;
CREATE TABLE IF NOT EXISTS `empleado_has_privilegios` (
  `Empleado_idEmpleado` int(11) NOT NULL COMMENT 'LLave primaria compuesta, atributo hace referencia a la tabla empleado',
  `Privilegios_idPrivilegios` int(11) NOT NULL COMMENT 'LLave primaria compuesta, atributo hace referencia a la tabla Privilegios',
  PRIMARY KEY (`Empleado_idEmpleado`,`Privilegios_idPrivilegios`),
  KEY `FK_PRIVILEGIOS` (`Privilegios_idPrivilegios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadopago`
--

DROP TABLE IF EXISTS `estadopago`;
CREATE TABLE IF NOT EXISTS `estadopago` (
  `idEstadoPago` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla EstadoPago',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra los detalle del tipo de pago que realiza el estudiante',
  `estado` varchar(1) DEFAULT NULL COMMENT 'Atributo que registra valores de Pagado/NoPagado',
  PRIMARY KEY (`idEstadoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estadopago`
--

INSERT INTO `estadopago` (`idEstadoPago`, `descripcion`, `estado`) VALUES
(1, 'Matricula', 'P'),
(2, 'Cambio de Centro', 'P'),
(3, 'Cambio de Carrera', 'P'),
(4, 'Laboratorio', 'P');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE IF NOT EXISTS `estudiante` (
  `idEstudiante` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla estudiante',
  `numeroCuenta` varchar(45) NOT NULL COMMENT 'registra el numero de cuenta del estudiante',
  `Persona_idPersona` int(11) NOT NULL COMMENT 'Llave foranea que hace refencia a la tabla persona.',
  `CentroEstudio_idCentroEstudio` int(11) NOT NULL COMMENT 'Llave foranea que hace refencia a la tabla CentroEstudio.',
  `contrasenia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEstudiante`),
  KEY `FK_PERSONA_ESTUDIANTE` (`Persona_idPersona`),
  KEY `FK_CENTRO_ESTUDIO_ESTUDIANTE` (`CentroEstudio_idCentroEstudio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`idEstudiante`, `numeroCuenta`, `Persona_idPersona`, `CentroEstudio_idCentroEstudio`, `contrasenia`) VALUES
(1, '20171004081', 1, 1, 'estudiante1'),
(2, '21053000190', 2, 3, 'estudiante2'),
(3, '20171000678', 3, 1, 'estudiante3'),
(4, '20163008971', 4, 3, 'estudiante4'),
(5, '20195000765', 5, 7, 'estudiante5'),
(6, '20191005258', 6, 1, 'estudiante6'),
(7, '20174005423', 7, 7, 'estudiante7'),
(8, '20185004590', 8, 6, 'estudiante8'),
(9, '20169000564', 9, 2, 'estudiante9'),
(10, '20187000189', 10, 5, 'estudiante10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_has_carrera`
--

DROP TABLE IF EXISTS `estudiante_has_carrera`;
CREATE TABLE IF NOT EXISTS `estudiante_has_carrera` (
  `Estudiante_idEstudiante` int(11) NOT NULL COMMENT 'LLave primaria compuesta, atributo que hace refencia a la tabla Estudiante',
  `Carrera_idCarrera` int(11) NOT NULL COMMENT 'LLave primaria compuesta, atributo que hace refencia a la tabla Carrera',
  `Estado` varchar(1) DEFAULT NULL COMMENT 'Atributo que controla el estado del estudiante en una carrera.',
  PRIMARY KEY (`Estudiante_idEstudiante`,`Carrera_idCarrera`),
  KEY `FK_CARRERA_ESTUDIANTE` (`Carrera_idCarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiante_has_carrera`
--

INSERT INTO `estudiante_has_carrera` (`Estudiante_idEstudiante`, `Carrera_idCarrera`, `Estado`) VALUES
(1, 1, 'A'),
(2, 1, 'A'),
(3, 3, 'A'),
(4, 3, 'A'),
(5, 9, 'A'),
(6, 9, 'A'),
(7, 5, 'A'),
(8, 5, 'A'),
(9, 6, 'A'),
(10, 6, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

DROP TABLE IF EXISTS `facultad`;
CREATE TABLE IF NOT EXISTS `facultad` (
  `idFacultad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFacultad`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`idFacultad`, `nombre`) VALUES
(1, 'Ingeniería'),
(2, 'Ciencias Jurídicas'),
(3, 'Ciencias Sociales'),
(4, 'Humanidades y Artes'),
(5, 'Quimica y Farmacia'),
(6, 'Ciencias'),
(7, 'Ciencias Espaciales'),
(8, 'Ciencias Medicas'),
(9, 'Odontología'),
(10, 'Ciencias Economicas');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `forma03asignaturas`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `forma03asignaturas`;
CREATE TABLE IF NOT EXISTS `forma03asignaturas` (
`NombreAlumno` varchar(183)
,`numeroCuenta` varchar(45)
,`NombreCentroEstudio` varchar(45)
,`Anio` int(4)
,`Carrera` varchar(45)
,`CodAsig` varchar(45)
,`Asignatura` varchar(45)
,`seccion` varchar(45)
,`HoraInicio` time
,`HoraFin` time
,`dias` varchar(45)
,`Edificio` varchar(45)
,`Aula` varchar(45)
,`creditosAcademicos` int(11)
,`Periodo` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `forma03laboratorios`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `forma03laboratorios`;
CREATE TABLE IF NOT EXISTS `forma03laboratorios` (
`NombreAlumno` varchar(183)
,`numeroCuenta` varchar(45)
,`NombreCentroEstudio` varchar(45)
,`Anio` int(4)
,`Carrera` varchar(45)
,`CodAsig` varchar(45)
,`AsignaturaLaboratorio` varchar(45)
,`seccion` varchar(45)
,`HoraInicio` time
,`HoraFin` time
,`dias` varchar(45)
,`Edificio` varchar(45)
,`Aula` varchar(45)
,`Periodo` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `historial_academico`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `historial_academico`;
CREATE TABLE IF NOT EXISTS `historial_academico` (
`NombreAlumno` varchar(183)
,`numeroCuenta` varchar(45)
,`Carrera` varchar(45)
,`nombreCentroEstudio` varchar(45)
,`Asignatura` varchar(45)
,`seccion` varchar(45)
,`Año` int(4)
,`idPeriodoAcademico` int(11)
,`calificacion` double
,`OBS` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructorlaboratorio`
--

DROP TABLE IF EXISTS `instructorlaboratorio`;
CREATE TABLE IF NOT EXISTS `instructorlaboratorio` (
  `idInstructorLaboratorio` int(11) NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` int(11) NOT NULL,
  `contrasenia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idInstructorLaboratorio`),
  KEY `FK_EMPLEADO_INSTRUCTOR` (`Empleado_idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `instructorlaboratorio`
--

INSERT INTO `instructorlaboratorio` (`idInstructorLaboratorio`, `Empleado_idEmpleado`, `contrasenia`) VALUES
(1, 1, 'instructor1'),
(2, 7, 'instructor2');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `laboratoriocancelado`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `laboratoriocancelado`;
CREATE TABLE IF NOT EXISTS `laboratoriocancelado` (
`NombreAlumno` varchar(183)
,`numeroCuenta` varchar(45)
,`NombreCentroEstudio` varchar(45)
,`Anio` int(4)
,`Carrera` varchar(45)
,`CodAsig` varchar(45)
,`AsignaturaLaboratorio` varchar(45)
,`seccion` varchar(45)
,`HoraInicio` time
,`HoraFin` time
,`dias` varchar(45)
,`Edificio` varchar(45)
,`Aula` varchar(45)
,`Periodo` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

DROP TABLE IF EXISTS `matricula`;
CREATE TABLE IF NOT EXISTS `matricula` (
  `idMatricula` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Matricula',
  `Seccion_idSeccion` int(11) NOT NULL COMMENT 'Llave foranea que hace refencia a la tabla Seccion',
  `fechaRegistro` date DEFAULT NULL COMMENT 'Atributo que ingresa la fecha de un nuevo registro en la tabla',
  `calificacion` double DEFAULT NULL COMMENT 'Atributo que registra la calificacion obtenida en una asignatura',
  `ObservacionNota_idObservacionNota` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla ObservacionNota',
  `EstadoPago_idEstadoPago` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla EstadoPago',
  `Estudiante_idEstudiante` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Estudiante',
  PRIMARY KEY (`idMatricula`),
  KEY `FK_SECCION_MATRICULA` (`Seccion_idSeccion`),
  KEY `FK_OBSERVACION_NOTA_MATRICULA` (`ObservacionNota_idObservacionNota`),
  KEY `FK_ESTADO_PAGO_MATRICULA` (`EstadoPago_idEstadoPago`),
  KEY `FK_ESTUDIANTE_MATRICULA` (`Estudiante_idEstudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`idMatricula`, `Seccion_idSeccion`, `fechaRegistro`, `calificacion`, `ObservacionNota_idObservacionNota`, `EstadoPago_idEstadoPago`, `Estudiante_idEstudiante`) VALUES
(1, 1, '2019-03-24', 97, 1, 1, 1),
(2, 1, '2019-03-24', 60, 2, 1, 4),
(3, 1, '2019-03-24', 89, 1, 1, 2),
(4, 1, '2019-03-24', 0, 3, 1, 10),
(5, 3, '2019-03-24', 67, 1, 4, 7),
(6, 3, '2019-03-24', 52, 2, 1, 6),
(7, 3, '2019-03-24', 100, 1, 1, 9),
(8, 2, '2019-03-24', 78, 1, 1, 5),
(9, 2, '2019-03-24', 90, 1, 1, 3),
(10, 2, '2019-03-24', 80, 1, 4, 8),
(11, 2, '2019-03-24', 96, 1, 3, 6),
(12, 2, '2019-03-24', 56, 2, 1, 10),
(13, 2, '2019-03-24', 78, 2, 4, 4),
(14, 2, '2019-03-24', 70, 1, 1, 7);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `matriculainstructores`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `matriculainstructores`;
CREATE TABLE IF NOT EXISTS `matriculainstructores` (
`NombreInstructor` varchar(183)
,`Anio` int(4)
,`Asignatura` varchar(91)
,`seccion` varchar(45)
,`HoraInicio` time
,`HoraFin` time
,`dias` varchar(45)
,`Edificio` varchar(45)
,`Aula` varchar(45)
,`Periodo` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `matriculamaestros`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `matriculamaestros`;
CREATE TABLE IF NOT EXISTS `matriculamaestros` (
`NombreMaestro` varchar(183)
,`Anio` int(4)
,`Asignatura` varchar(91)
,`seccion` varchar(45)
,`HoraInicio` time
,`HoraFin` time
,`dias` varchar(45)
,`Edificio` varchar(45)
,`Aula` varchar(45)
,`Periodo` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidad`
--

DROP TABLE IF EXISTS `modalidad`;
CREATE TABLE IF NOT EXISTS `modalidad` (
  `idModalidad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Modalidad',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra los detalles de la modalidad de la seccion',
  PRIMARY KEY (`idModalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modalidad`
--

INSERT INTO `modalidad` (`idModalidad`, `descripcion`) VALUES
(1, 'Presencial'),
(2, 'En linea');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observacionnota`
--

DROP TABLE IF EXISTS `observacionnota`;
CREATE TABLE IF NOT EXISTS `observacionnota` (
  `idObservacionNota` int(11) NOT NULL AUTO_INCREMENT COMMENT 'LLave primaria de la tabla ObservacionNota',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra valores de APR/RPB/NSP',
  PRIMARY KEY (`idObservacionNota`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `observacionnota`
--

INSERT INTO `observacionnota` (`idObservacionNota`, `descripcion`) VALUES
(1, 'APR'),
(2, 'RPR'),
(3, 'NSP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pantallas`
--

DROP TABLE IF EXISTS `pantallas`;
CREATE TABLE IF NOT EXISTS `pantallas` (
  `idPantallas` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Pantallas',
  `nombreCorto` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el nombre de las pantallas donde se encuentran una serie de controles segun el privilegio.',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Atributo que detalla  las pantallas donde se encuentran una serie de controles segun el privilegio.',
  `Aplicaciones_idAplicaciones` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Aplicaciones',
  PRIMARY KEY (`idPantallas`),
  KEY `FK_APLICACIONES_PANTALLAS` (`Aplicaciones_idAplicaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pantallas_has_controles`
--

DROP TABLE IF EXISTS `pantallas_has_controles`;
CREATE TABLE IF NOT EXISTS `pantallas_has_controles` (
  `Pantallas_idPantallas` int(11) NOT NULL AUTO_INCREMENT,
  `Controles_idControles` int(11) NOT NULL,
  PRIMARY KEY (`Pantallas_idPantallas`,`Controles_idControles`),
  KEY `FK_CONTROLES_PANTALLAS_CONTROLES` (`Controles_idControles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodoacademico`
--

DROP TABLE IF EXISTS `periodoacademico`;
CREATE TABLE IF NOT EXISTS `periodoacademico` (
  `idPeriodoAcademico` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla PeriodoAcademico',
  `fechaInicio` date DEFAULT NULL COMMENT 'Atributo que registra la fecha de inicio de un periodo academico',
  `fechaFin` date DEFAULT NULL COMMENT 'Atributo que registra la fecha de finalizacion de un periodo academico',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra los detalles de un periodo academico',
  PRIMARY KEY (`idPeriodoAcademico`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `periodoacademico`
--

INSERT INTO `periodoacademico` (`idPeriodoAcademico`, `fechaInicio`, `fechaFin`, `descripcion`) VALUES
(1, '2018-09-07', '2018-12-21', 'III-PAC 2018'),
(2, '2019-01-24', '2019-05-02', 'I-PAC 2019'),
(3, '2019-03-19', '2019-08-30', 'II-PAC 2019'),
(4, '2019-09-11', '2019-12-17', 'III-PAC 2019');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `idPersona` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Persona',
  `noIdentidad` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el numero de identidad de la persona',
  `pnombre` varchar(45) DEFAULT NULL COMMENT 'Atributo  que registra el primer nombre de la persona',
  `snombre` varchar(45) DEFAULT NULL COMMENT 'Atributo segundo nombre de la persona',
  `papellido` varchar(45) DEFAULT NULL COMMENT 'Atributo  que registra el primer apellido de la persona',
  `sapellido` varchar(45) DEFAULT NULL COMMENT 'Atributo  que registra el segundo apellido de la persona',
  `Direccion_idDireccion` int(11) NOT NULL COMMENT 'Llave foranea, hace referencia a la tabla direccion.',
  PRIMARY KEY (`idPersona`),
  KEY `FK_DIRECCION_PERSONA` (`Direccion_idDireccion`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idPersona`, `noIdentidad`, `pnombre`, `snombre`, `papellido`, `sapellido`, `Direccion_idDireccion`) VALUES
(1, '0801-1999-13567', 'Andrea', 'Maria', 'Ortega', 'Lozano', 25),
(2, '0801-1990-01234', 'Jose', 'Antonio', 'Perez', 'Martinez', 5),
(3, '0209-1994-02301', 'Mario', 'Francisco', 'Gonzales', 'Torres', 7),
(4, '0801-1995-19345', 'Carlos', 'Arturo', 'Narvaez', 'Portillo', 2),
(5, '0801-1996-09878', 'Estefany', 'Daniela', 'Ruiz', 'Gonzales', 6),
(6, '0308-1995-12567', 'Armando', 'Josue', 'Romero', 'Flores', 1),
(7, '0406-1999-89654', 'Leticia', 'Alejandra', 'Molina', 'Rojas', 1),
(8, '0801-1995-01345', 'Karla', 'Maria', 'Castro', 'Mendez', 24),
(9, '0803-1998-01543', 'David', 'Andres', 'Suarez', 'Ortiz', 18),
(10, '0209-2000-1045', 'Astrid', 'Valeria', 'Lopez', 'Guerra', 11),
(11, '0801-1980-01234', 'Diana', 'Marleny', 'Gonzales', 'Rivera', 6),
(12, '0805-1990-15690', 'Diana', 'Yolibeth', 'Sanchez', 'Salgado', 29),
(13, '0308-1990-01654', 'Karol', 'Daniela', 'Lemus', 'Lemus', 27),
(14, '0801-1985-13465', 'Oscar', 'David', 'Fernandez', 'Antunez', 13),
(15, '0801-1970-19789', 'Angela', 'Melissa', 'Garcia ', 'Guillen', 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio`
--

DROP TABLE IF EXISTS `planestudio`;
CREATE TABLE IF NOT EXISTS `planestudio` (
  `idPlanEstudio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla PlanEstudio',
  `fechaAprobacion` date DEFAULT NULL COMMENT 'Atributo que registra la fecha de aprobacion de un plan de estudios',
  `fechaFin` date DEFAULT NULL COMMENT 'Atributo que registra la fecha de finalizacion de la vigencia de un plan de estudios',
  `numeroAcuerdo` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el numero de acuerdo de un plan de estudios',
  `Carrera_idCarrera` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Carrera',
  PRIMARY KEY (`idPlanEstudio`),
  KEY `FK_CARRERA_PLAN_ESTUDIO` (`Carrera_idCarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `planestudio`
--

INSERT INTO `planestudio` (`idPlanEstudio`, `fechaAprobacion`, `fechaFin`, `numeroAcuerdo`, `Carrera_idCarrera`) VALUES
(1, '2016-11-02', '2019-10-19', '101', 1),
(2, '2012-03-28', '2016-11-01', '100', 1),
(3, '2017-07-25', '2021-03-10', '204', 15),
(4, '2012-06-27', '2019-10-10', '3018', 2),
(5, '2014-03-22', '2021-03-02', '401', 3),
(6, '2016-10-01', '2022-10-09', '501', 4),
(7, '2017-03-11', '2022-03-19', '601', 5),
(8, '2015-03-06', '2022-03-06', '702', 6),
(9, '2014-07-04', '2020-07-04', '804', 7),
(10, '2016-05-30', '2022-05-30', '907', 8),
(11, '2015-09-27', '2019-09-27', '1011', 9),
(12, '2010-10-06', '2024-10-06', '1102', 13),
(13, '2013-04-30', '2022-06-30', '1220', 10),
(14, '2016-07-05', '2020-12-05', '1308', 11),
(15, '2016-05-13', '2021-07-05', '1408', 12),
(16, '2014-03-01', '2021-07-05', '1508', 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios`
--

DROP TABLE IF EXISTS `privilegios`;
CREATE TABLE IF NOT EXISTS `privilegios` (
  `idPrivilegios` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Privilegios',
  `nombreCorto` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el nombre de los distintos privilegios',
  `descripcionPrivilegios` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra los detalles de los distintos privilegios',
  PRIMARY KEY (`idPrivilegios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios_has_controles`
--

DROP TABLE IF EXISTS `privilegios_has_controles`;
CREATE TABLE IF NOT EXISTS `privilegios_has_controles` (
  `Privilegios_idPrivilegios` int(11) NOT NULL COMMENT 'Llave primaria compuesta, atributo que hace referencia a la tabla Privilegios',
  `Controles_idControles` int(11) NOT NULL COMMENT 'Llave primaria compuesta, atributo que hace referencia a la tabla Controles',
  PRIMARY KEY (`Privilegios_idPrivilegios`,`Controles_idControles`),
  KEY `FK_CONTROLES_PRIVILEGIOS_CONTROLES` (`Controles_idControles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `programacionacademica`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `programacionacademica`;
CREATE TABLE IF NOT EXISTS `programacionacademica` (
`Departamento` varchar(45)
,`Asignatura` varchar(91)
,`dias` varchar(45)
,`seccion` varchar(45)
,`HoraInicio` time
,`HoraFin` time
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisitos`
--

DROP TABLE IF EXISTS `requisitos`;
CREATE TABLE IF NOT EXISTS `requisitos` (
  `idRequisitos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Requisitos',
  `idAsignaturaPlanEstudio` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla AsignaturaPlanEstudio',
  `idAsignaturaPlanEstudioRequisito` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Requisitos',
  PRIMARY KEY (`idRequisitos`),
  KEY `FK_ASIGNATURA_PLAN_ESTUDIO` (`idAsignaturaPlanEstudio`),
  KEY `FK_ASIGNATURA_PLAN_ESTUDIO_REQUISITOS` (`idAsignaturaPlanEstudioRequisito`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `requisitos`
--

INSERT INTO `requisitos` (`idRequisitos`, `idAsignaturaPlanEstudio`, `idAsignaturaPlanEstudioRequisito`) VALUES
(1, 1, 2),
(2, 8, 9),
(3, 10, 17),
(4, 10, 14),
(5, 2, 17),
(6, 12, 24),
(7, 17, 21),
(8, 20, 25),
(9, 11, 16),
(10, 2, 3),
(11, 9, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

DROP TABLE IF EXISTS `seccion`;
CREATE TABLE IF NOT EXISTS `seccion` (
  `idSeccion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Seccion',
  `seccion` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el numero de una seccion',
  `horaInicio` time DEFAULT NULL COMMENT 'Atributo que registra la hora de incio de clase de una seccion',
  `horaFin` time DEFAULT NULL COMMENT 'Atributo que registra la hora de finalizacion de clase de una seccion',
  `Asignatura_idAsignatura` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Asignatura',
  `PeriodoAcademico_idPeriodoAcademico` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla PeriodoAcademico',
  `Aula_idAula` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Aula',
  `tipoAsignacion` varchar(1) DEFAULT NULL COMMENT 'Atributo que registra una nueva asignasion la cual puede ser Laboratorio "L" ó Asignatura "A"',
  `estado` varchar(1) DEFAULT NULL COMMENT 'Atributo que registra ek estado de la seccion en periodo academico especifico puede ser cancelada, terminada, cerrada etc.',
  `Modalidad_idModalidad` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Modalidad.',
  `Empleado_idEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`idSeccion`),
  KEY `FK_ASIGNATURA_SECCION` (`Asignatura_idAsignatura`),
  KEY `FK_PERIODO_ACADEMICO_SECCION` (`PeriodoAcademico_idPeriodoAcademico`),
  KEY `FK_AULA_SECCION` (`Aula_idAula`),
  KEY `FK_MODALIDAD_SECCION` (`Modalidad_idModalidad`),
  KEY `FK_EMPLEADO_SECCION` (`Empleado_idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`idSeccion`, `seccion`, `horaInicio`, `horaFin`, `Asignatura_idAsignatura`, `PeriodoAcademico_idPeriodoAcademico`, `Aula_idAula`, `tipoAsignacion`, `estado`, `Modalidad_idModalidad`, `Empleado_idEmpleado`) VALUES
(1, '0800', '08:00:00', '09:00:00', 1, 2, 35, 'A', 'M', 1, 2),
(2, '1100', '11:00:00', '12:00:00', 3, 2, 18, 'A', 'M', 1, 2),
(3, '1000', '10:00:00', '11:00:00', 2, 2, 23, 'A', 'M', 1, 6),
(4, '1300', '13:00:00', '15:00:00', 6, 2, 18, 'L', 'M', 1, 1),
(5, '1700', '17:00:00', '18:00:00', 6, 2, 28, 'A', 'M', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

DROP TABLE IF EXISTS `telefono`;
CREATE TABLE IF NOT EXISTS `telefono` (
  `idTelefono` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla telefono\n',
  `numeroTelefono` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el numero de telefono.',
  `tipo` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el tipo de telefono (celular,telefono)',
  `Persona_idPersona` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla persona.',
  PRIMARY KEY (`idTelefono`),
  KEY `FK_PERSONA_TELEFONO` (`Persona_idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`idTelefono`, `numeroTelefono`, `tipo`, `Persona_idPersona`) VALUES
(1, '9865-1234', 'Celular', 5),
(2, '2234-3452', 'Casa', 7),
(3, '2345-6710', 'Casa', 1),
(4, '3356-4580', 'Celular', 10),
(5, '3912-9086', 'Celular', 8),
(6, '2444-2076', 'Casa', 10),
(7, '9556-1275', 'Celular', 4),
(8, '3256-0987', 'Celular', 6),
(9, '2267-9986', 'Casa', 9),
(10, '9654-4265', 'Celular', 7),
(11, '9539-2183', 'Celular', 2),
(12, '2778-6493', 'Casa', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocontrato`
--

DROP TABLE IF EXISTS `tipocontrato`;
CREATE TABLE IF NOT EXISTS `tipocontrato` (
  `idTipoContrato` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla TipoContrato',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Atributo que detalla el tipo de contrato del empleado',
  PRIMARY KEY (`idTipoContrato`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipocontrato`
--

INSERT INTO `tipocontrato` (`idTipoContrato`, `descripcion`) VALUES
(1, 'Fijo'),
(2, 'Por horas'),
(3, 'Temporal');

-- --------------------------------------------------------

--
-- Estructura para la vista `asignaturacancelada`
--
DROP TABLE IF EXISTS `asignaturacancelada`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `asignaturacancelada`  AS  select concat(`p`.`pnombre`,' ',`p`.`snombre`,' ',`p`.`papellido`,' ',`p`.`sapellido`) AS `NombreAlumno`,`es`.`numeroCuenta` AS `numeroCuenta`,`ce`.`nombreCentroEstudio` AS `NombreCentroEstudio`,year(curdate()) AS `Anio`,`ca`.`nombre` AS `Carrera`,`asi`.`codigo` AS `CodAsig`,`asi`.`nombre` AS `Asignatura`,`se`.`seccion` AS `seccion`,`se`.`horaInicio` AS `HoraInicio`,`se`.`horaFin` AS `HoraFin`,`dc`.`dias` AS `dias`,`ed`.`nombre` AS `Edificio`,`au`.`numero` AS `Aula`,`asi`.`creditosAcademicos` AS `creditosAcademicos`,`pac`.`descripcion` AS `Periodo` from ((((((((((((`persona` `p` join `estudiante` `es` on((`es`.`Persona_idPersona` = `p`.`idPersona`))) join `centroestudio` `ce` on((`es`.`CentroEstudio_idCentroEstudio` = `ce`.`idCentroEstudio`))) join `estudiante_has_carrera` `ehc` on((`ehc`.`Estudiante_idEstudiante` = `es`.`idEstudiante`))) join `carrera` `ca` on((`ca`.`idCarrera` = `ehc`.`Carrera_idCarrera`))) join `matricula` `ma` on((`ma`.`Estudiante_idEstudiante` = `es`.`idEstudiante`))) join `seccion` `se` on((`se`.`idSeccion` = `ma`.`Seccion_idSeccion`))) join `asignatura` `asi` on((`asi`.`idAsignatura` = `se`.`Asignatura_idAsignatura`))) join `diasclase_has_seccion` `dhs` on((`dhs`.`Seccion_idSeccion` = `se`.`idSeccion`))) join `diasclase` `dc` on((`dc`.`idDiasClase` = `dhs`.`DiasClase_idDiasClase`))) join `aula` `au` on((`au`.`idAula` = `se`.`Aula_idAula`))) join `edificio` `ed` on((`ed`.`idEdificio` = `au`.`Edificio_idEdificio`))) join `periodoacademico` `pac` on((`pac`.`idPeriodoAcademico` = `se`.`PeriodoAcademico_idPeriodoAcademico`))) where ((`pac`.`fechaInicio` <= curdate()) and (`pac`.`fechaFin` >= curdate()) and (`se`.`estado` = 'canceladas') and (`se`.`tipoAsignacion` = 'A')) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `asignaturaespera`
--
DROP TABLE IF EXISTS `asignaturaespera`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `asignaturaespera`  AS  select concat(`p`.`pnombre`,' ',`p`.`snombre`,' ',`p`.`papellido`,' ',`p`.`sapellido`) AS `NombreAlumno`,`es`.`numeroCuenta` AS `numeroCuenta`,`ce`.`nombreCentroEstudio` AS `NombreCentroEstudio`,year(curdate()) AS `Anio`,`ca`.`nombre` AS `Carrera`,`asi`.`codigo` AS `CodAsig`,`asi`.`nombre` AS `Asignatura`,`se`.`seccion` AS `seccion`,`se`.`horaInicio` AS `HoraInicio`,`se`.`horaFin` AS `HoraFin`,`dc`.`dias` AS `dias`,`ed`.`nombre` AS `Edificio`,`au`.`numero` AS `Aula`,`asi`.`creditosAcademicos` AS `creditosAcademicos`,`pac`.`descripcion` AS `Periodo` from ((((((((((((`persona` `p` join `estudiante` `es` on((`es`.`Persona_idPersona` = `p`.`idPersona`))) join `centroestudio` `ce` on((`es`.`CentroEstudio_idCentroEstudio` = `ce`.`idCentroEstudio`))) join `estudiante_has_carrera` `ehc` on((`ehc`.`Estudiante_idEstudiante` = `es`.`idEstudiante`))) join `carrera` `ca` on((`ca`.`idCarrera` = `ehc`.`Carrera_idCarrera`))) join `matricula` `ma` on((`ma`.`Estudiante_idEstudiante` = `es`.`idEstudiante`))) join `seccion` `se` on((`se`.`idSeccion` = `ma`.`Seccion_idSeccion`))) join `asignatura` `asi` on((`asi`.`idAsignatura` = `se`.`Asignatura_idAsignatura`))) join `diasclase_has_seccion` `dhs` on((`dhs`.`Seccion_idSeccion` = `se`.`idSeccion`))) join `diasclase` `dc` on((`dc`.`idDiasClase` = `dhs`.`DiasClase_idDiasClase`))) join `aula` `au` on((`au`.`idAula` = `se`.`Aula_idAula`))) join `edificio` `ed` on((`ed`.`idEdificio` = `au`.`Edificio_idEdificio`))) join `periodoacademico` `pac` on((`pac`.`idPeriodoAcademico` = `se`.`PeriodoAcademico_idPeriodoAcademico`))) where ((`pac`.`fechaInicio` <= curdate()) and (`pac`.`fechaFin` >= curdate()) and (`se`.`estado` = 'espera') and (`se`.`tipoAsignacion` = 'A')) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `auladisponible`
--
DROP TABLE IF EXISTS `auladisponible`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `auladisponible`  AS  select `ed`.`nombre` AS `nombre`,`au`.`numero` AS `numero`,`sc`.`horaFin` AS `HoraDisponible` from ((`edificio` `ed` join `aula` `au` on((`au`.`Edificio_idEdificio` = `ed`.`idEdificio`))) join `seccion` `sc` on((`sc`.`Aula_idAula` = `au`.`idAula`))) where ((not(`sc`.`horaFin` in (select `ss`.`horaInicio` from ((`seccion` `ss` join `aula` `au` on((`au`.`idAula` = `ss`.`Aula_idAula`))) join `edificio` `ed` on((`ed`.`idEdificio` = `au`.`Edificio_idEdificio`)))))) and (`au`.`estado` = 'L')) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `calificaciones_seccion`
--
DROP TABLE IF EXISTS `calificaciones_seccion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `calificaciones_seccion`  AS  (select `asig`.`nombre` AS `Asignatura`,`se`.`seccion` AS `seccion`,concat(`pe`.`pnombre`,' ',`pe`.`snombre`,' ',`pe`.`papellido`,' ',`pe`.`sapellido`) AS `NombreAlumno`,`es`.`numeroCuenta` AS `numeroCuenta`,`ma`.`calificacion` AS `calificacion`,`ob`.`descripcion` AS `OBS` from (((((`persona` `pe` join `estudiante` `es` on((`es`.`Persona_idPersona` = `pe`.`idPersona`))) join `matricula` `ma` on((`ma`.`Estudiante_idEstudiante` = `es`.`idEstudiante`))) join `observacionnota` `ob` on((`ob`.`idObservacionNota` = `ma`.`ObservacionNota_idObservacionNota`))) join `seccion` `se` on((`se`.`idSeccion` = `ma`.`Seccion_idSeccion`))) join `asignatura` `asig` on((`asig`.`idAsignatura` = `se`.`Asignatura_idAsignatura`))) group by `asig`.`nombre`,`se`.`seccion`,concat(`pe`.`pnombre`,' ',`pe`.`snombre`,' ',`pe`.`papellido`,' ',`pe`.`sapellido`),`es`.`numeroCuenta`,`ma`.`calificacion`,`ob`.`descripcion`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `forma03asignaturas`
--
DROP TABLE IF EXISTS `forma03asignaturas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `forma03asignaturas`  AS  select concat(`p`.`pnombre`,' ',`p`.`snombre`,' ',`p`.`papellido`,' ',`p`.`sapellido`) AS `NombreAlumno`,`es`.`numeroCuenta` AS `numeroCuenta`,`ce`.`nombreCentroEstudio` AS `NombreCentroEstudio`,year(curdate()) AS `Anio`,`ca`.`nombre` AS `Carrera`,`asi`.`codigo` AS `CodAsig`,`asi`.`nombre` AS `Asignatura`,`se`.`seccion` AS `seccion`,`se`.`horaInicio` AS `HoraInicio`,`se`.`horaFin` AS `HoraFin`,`dc`.`dias` AS `dias`,`ed`.`nombre` AS `Edificio`,`au`.`numero` AS `Aula`,`asi`.`creditosAcademicos` AS `creditosAcademicos`,`pac`.`descripcion` AS `Periodo` from ((((((((((((`persona` `p` join `estudiante` `es` on((`es`.`Persona_idPersona` = `p`.`idPersona`))) join `centroestudio` `ce` on((`es`.`CentroEstudio_idCentroEstudio` = `ce`.`idCentroEstudio`))) join `estudiante_has_carrera` `ehc` on((`ehc`.`Estudiante_idEstudiante` = `es`.`idEstudiante`))) join `carrera` `ca` on((`ca`.`idCarrera` = `ehc`.`Carrera_idCarrera`))) join `matricula` `ma` on((`ma`.`Estudiante_idEstudiante` = `es`.`idEstudiante`))) join `seccion` `se` on((`se`.`idSeccion` = `ma`.`Seccion_idSeccion`))) join `asignatura` `asi` on((`asi`.`idAsignatura` = `se`.`Asignatura_idAsignatura`))) join `diasclase_has_seccion` `dhs` on((`dhs`.`Seccion_idSeccion` = `se`.`idSeccion`))) join `diasclase` `dc` on((`dc`.`idDiasClase` = `dhs`.`DiasClase_idDiasClase`))) join `aula` `au` on((`au`.`idAula` = `se`.`Aula_idAula`))) join `edificio` `ed` on((`ed`.`idEdificio` = `au`.`Edificio_idEdificio`))) join `periodoacademico` `pac` on((`pac`.`idPeriodoAcademico` = `se`.`PeriodoAcademico_idPeriodoAcademico`))) where ((`pac`.`fechaInicio` <= curdate()) and (`pac`.`fechaFin` >= curdate()) and (`se`.`estado` <> 'Espera,Cancelada') and (`se`.`tipoAsignacion` = 'A')) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `forma03laboratorios`
--
DROP TABLE IF EXISTS `forma03laboratorios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `forma03laboratorios`  AS  select concat(`p`.`pnombre`,' ',`p`.`snombre`,' ',`p`.`papellido`,' ',`p`.`sapellido`) AS `NombreAlumno`,`es`.`numeroCuenta` AS `numeroCuenta`,`ce`.`nombreCentroEstudio` AS `NombreCentroEstudio`,year(curdate()) AS `Anio`,`ca`.`nombre` AS `Carrera`,`asi`.`codigo` AS `CodAsig`,`asi`.`nombre` AS `AsignaturaLaboratorio`,`se`.`seccion` AS `seccion`,`se`.`horaInicio` AS `HoraInicio`,`se`.`horaFin` AS `HoraFin`,`dc`.`dias` AS `dias`,`ed`.`nombre` AS `Edificio`,`au`.`numero` AS `Aula`,`pac`.`descripcion` AS `Periodo` from ((((((((((((`persona` `p` join `estudiante` `es` on((`es`.`Persona_idPersona` = `p`.`idPersona`))) join `centroestudio` `ce` on((`es`.`CentroEstudio_idCentroEstudio` = `ce`.`idCentroEstudio`))) join `estudiante_has_carrera` `ehc` on((`ehc`.`Estudiante_idEstudiante` = `es`.`idEstudiante`))) join `carrera` `ca` on((`ca`.`idCarrera` = `ehc`.`Carrera_idCarrera`))) join `matricula` `ma` on((`ma`.`Estudiante_idEstudiante` = `es`.`idEstudiante`))) join `seccion` `se` on((`se`.`idSeccion` = `ma`.`Seccion_idSeccion`))) join `asignatura` `asi` on((`asi`.`idAsignatura` = `se`.`Asignatura_idAsignatura`))) join `diasclase_has_seccion` `dhs` on((`dhs`.`Seccion_idSeccion` = `se`.`idSeccion`))) join `diasclase` `dc` on((`dc`.`idDiasClase` = `dhs`.`DiasClase_idDiasClase`))) join `aula` `au` on((`au`.`idAula` = `se`.`Aula_idAula`))) join `edificio` `ed` on((`ed`.`idEdificio` = `au`.`Edificio_idEdificio`))) join `periodoacademico` `pac` on((`pac`.`idPeriodoAcademico` = `se`.`PeriodoAcademico_idPeriodoAcademico`))) where ((`pac`.`fechaInicio` <= curdate()) and (`pac`.`fechaFin` >= curdate()) and (`se`.`estado` <> 'Espera,Cancelado') and (`se`.`tipoAsignacion` = 'L') and `asi`.`nombre` in (select `asi`.`nombre` from `forma03asignaturas`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `historial_academico`
--
DROP TABLE IF EXISTS `historial_academico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `historial_academico`  AS  (select concat(`pe`.`pnombre`,' ',`pe`.`snombre`,' ',`pe`.`papellido`,' ',`pe`.`sapellido`) AS `NombreAlumno`,`es`.`numeroCuenta` AS `numeroCuenta`,`ca`.`nombre` AS `Carrera`,`ce`.`nombreCentroEstudio` AS `nombreCentroEstudio`,`asig`.`nombre` AS `Asignatura`,`se`.`seccion` AS `seccion`,extract(year from `pa`.`fechaInicio`) AS `Año`,`pa`.`idPeriodoAcademico` AS `idPeriodoAcademico`,`ma`.`calificacion` AS `calificacion`,`ob`.`descripcion` AS `OBS` from (((((((((`persona` `pe` join `estudiante` `es` on((`es`.`Persona_idPersona` = `pe`.`idPersona`))) join `centroestudio` `ce` on((`ce`.`idCentroEstudio` = `es`.`CentroEstudio_idCentroEstudio`))) join `matricula` `ma` on((`ma`.`Estudiante_idEstudiante` = `es`.`idEstudiante`))) join `observacionnota` `ob` on((`ob`.`idObservacionNota` = `ma`.`ObservacionNota_idObservacionNota`))) join `seccion` `se` on((`se`.`idSeccion` = `ma`.`Seccion_idSeccion`))) join `asignatura` `asig` on((`asig`.`idAsignatura` = `se`.`Asignatura_idAsignatura`))) join `periodoacademico` `pa` on((`pa`.`idPeriodoAcademico` = `se`.`PeriodoAcademico_idPeriodoAcademico`))) join `estudiante_has_carrera` `ec` on((`ec`.`Estudiante_idEstudiante` = `es`.`idEstudiante`))) join `carrera` `ca` on((`ca`.`idCarrera` = `ec`.`Carrera_idCarrera`)))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `laboratoriocancelado`
--
DROP TABLE IF EXISTS `laboratoriocancelado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `laboratoriocancelado`  AS  select concat(`p`.`pnombre`,' ',`p`.`snombre`,' ',`p`.`papellido`,' ',`p`.`sapellido`) AS `NombreAlumno`,`es`.`numeroCuenta` AS `numeroCuenta`,`ce`.`nombreCentroEstudio` AS `NombreCentroEstudio`,year(curdate()) AS `Anio`,`ca`.`nombre` AS `Carrera`,`asi`.`codigo` AS `CodAsig`,`asi`.`nombre` AS `AsignaturaLaboratorio`,`se`.`seccion` AS `seccion`,`se`.`horaInicio` AS `HoraInicio`,`se`.`horaFin` AS `HoraFin`,`dc`.`dias` AS `dias`,`ed`.`nombre` AS `Edificio`,`au`.`numero` AS `Aula`,`pac`.`descripcion` AS `Periodo` from ((((((((((((`persona` `p` join `estudiante` `es` on((`es`.`Persona_idPersona` = `p`.`idPersona`))) join `centroestudio` `ce` on((`es`.`CentroEstudio_idCentroEstudio` = `ce`.`idCentroEstudio`))) join `estudiante_has_carrera` `ehc` on((`ehc`.`Estudiante_idEstudiante` = `es`.`idEstudiante`))) join `carrera` `ca` on((`ca`.`idCarrera` = `ehc`.`Carrera_idCarrera`))) join `matricula` `ma` on((`ma`.`Estudiante_idEstudiante` = `es`.`idEstudiante`))) join `seccion` `se` on((`se`.`idSeccion` = `ma`.`Seccion_idSeccion`))) join `asignatura` `asi` on((`asi`.`idAsignatura` = `se`.`Asignatura_idAsignatura`))) join `diasclase_has_seccion` `dhs` on((`dhs`.`Seccion_idSeccion` = `se`.`idSeccion`))) join `diasclase` `dc` on((`dc`.`idDiasClase` = `dhs`.`DiasClase_idDiasClase`))) join `aula` `au` on((`au`.`idAula` = `se`.`Aula_idAula`))) join `edificio` `ed` on((`ed`.`idEdificio` = `au`.`Edificio_idEdificio`))) join `periodoacademico` `pac` on((`pac`.`idPeriodoAcademico` = `se`.`PeriodoAcademico_idPeriodoAcademico`))) where ((`pac`.`fechaInicio` <= curdate()) and (`pac`.`fechaFin` >= curdate()) and (`se`.`estado` = 'Espera') and (`se`.`tipoAsignacion` = 'L') and `asi`.`nombre` in (select `asi`.`nombre` from `forma03asignaturas`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `matriculainstructores`
--
DROP TABLE IF EXISTS `matriculainstructores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `matriculainstructores`  AS  select concat(`p`.`pnombre`,' ',`p`.`snombre`,' ',`p`.`papellido`,' ',`p`.`sapellido`) AS `NombreInstructor`,year(curdate()) AS `Anio`,concat(`asi`.`codigo`,' ',`asi`.`nombre`) AS `Asignatura`,`se`.`seccion` AS `seccion`,`se`.`horaInicio` AS `HoraInicio`,`se`.`horaFin` AS `HoraFin`,`dc`.`dias` AS `dias`,`ed`.`nombre` AS `Edificio`,`au`.`numero` AS `Aula`,`pac`.`descripcion` AS `Periodo` from ((((((((((`persona` `p` join `empleado` `em` on((`em`.`Persona_idPersona` = `p`.`idPersona`))) join `instructorlaboratorio` `ins` on((`ins`.`Empleado_idEmpleado` = `em`.`idEmpleado`))) join `seccion` `se` on((`se`.`Empleado_idEmpleado` = `em`.`idEmpleado`))) join `matricula` `ma` on((`ma`.`Seccion_idSeccion` = `se`.`idSeccion`))) join `asignatura` `asi` on((`asi`.`idAsignatura` = `se`.`Asignatura_idAsignatura`))) join `diasclase_has_seccion` `dhs` on((`dhs`.`Seccion_idSeccion` = `se`.`idSeccion`))) join `diasclase` `dc` on((`dc`.`idDiasClase` = `dhs`.`DiasClase_idDiasClase`))) join `aula` `au` on((`au`.`idAula` = `se`.`Aula_idAula`))) join `edificio` `ed` on((`ed`.`idEdificio` = `au`.`Edificio_idEdificio`))) join `periodoacademico` `pac` on((`pac`.`idPeriodoAcademico` = `se`.`PeriodoAcademico_idPeriodoAcademico`))) where ((`pac`.`fechaInicio` <= curdate()) and (`pac`.`fechaFin` >= curdate())) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `matriculamaestros`
--
DROP TABLE IF EXISTS `matriculamaestros`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `matriculamaestros`  AS  select concat(`p`.`pnombre`,' ',`p`.`snombre`,' ',`p`.`papellido`,' ',`p`.`sapellido`) AS `NombreMaestro`,year(curdate()) AS `Anio`,concat(`asi`.`codigo`,' ',`asi`.`nombre`) AS `Asignatura`,`se`.`seccion` AS `seccion`,`se`.`horaInicio` AS `HoraInicio`,`se`.`horaFin` AS `HoraFin`,`dc`.`dias` AS `dias`,`ed`.`nombre` AS `Edificio`,`au`.`numero` AS `Aula`,`pac`.`descripcion` AS `Periodo` from ((((((((((`persona` `p` join `empleado` `em` on((`em`.`Persona_idPersona` = `p`.`idPersona`))) join `docente` `doc` on((`doc`.`Empleado_idEmpleado` = `em`.`idEmpleado`))) join `seccion` `se` on((`se`.`Empleado_idEmpleado` = `em`.`idEmpleado`))) join `matricula` `ma` on((`ma`.`Seccion_idSeccion` = `se`.`idSeccion`))) join `asignatura` `asi` on((`asi`.`idAsignatura` = `se`.`Asignatura_idAsignatura`))) join `diasclase_has_seccion` `dhs` on((`dhs`.`Seccion_idSeccion` = `se`.`idSeccion`))) join `diasclase` `dc` on((`dc`.`idDiasClase` = `dhs`.`DiasClase_idDiasClase`))) join `aula` `au` on((`au`.`idAula` = `se`.`Aula_idAula`))) join `edificio` `ed` on((`ed`.`idEdificio` = `au`.`Edificio_idEdificio`))) join `periodoacademico` `pac` on((`pac`.`idPeriodoAcademico` = `se`.`PeriodoAcademico_idPeriodoAcademico`))) where ((`pac`.`fechaInicio` <= curdate()) and (`pac`.`fechaFin` >= curdate())) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `programacionacademica`
--
DROP TABLE IF EXISTS `programacionacademica`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `programacionacademica`  AS  select `dp`.`descripcion` AS `Departamento`,concat(`asg`.`codigo`,' ',`asg`.`nombre`) AS `Asignatura`,`dc`.`dias` AS `dias`,`sc`.`seccion` AS `seccion`,`sc`.`horaInicio` AS `HoraInicio`,`sc`.`horaFin` AS `HoraFin` from (((((`departamentos` `dp` join `asignatura` `asg` on((`asg`.`Departamentos_idDepartamentos` = `dp`.`idDepartamentos`))) join `seccion` `sc` on((`sc`.`Asignatura_idAsignatura` = `asg`.`idAsignatura`))) join `diasclase_has_seccion` `dhs` on((`dhs`.`Seccion_idSeccion` = `sc`.`idSeccion`))) join `diasclase` `dc` on((`dc`.`idDiasClase` = `dhs`.`DiasClase_idDiasClase`))) join `periodoacademico` `pac` on((`pac`.`idPeriodoAcademico` = `sc`.`PeriodoAcademico_idPeriodoAcademico`))) where ((`pac`.`fechaInicio` <= curdate()) and (`pac`.`fechaFin` >= curdate())) ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `FK_DEPARTAMENTOS_ASIGNATURA` FOREIGN KEY (`Departamentos_idDepartamentos`) REFERENCES `departamentos` (`idDepartamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asignaturaplanestudio`
--
ALTER TABLE `asignaturaplanestudio`
  ADD CONSTRAINT `FK_ASIGNATURA_ASIGNATURA_PLANESTUDIO` FOREIGN KEY (`Asignatura_idAsignatura`) REFERENCES `asignatura` (`idAsignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PLAN_ESTUDIO_ASIGNATURA_PLANESTUDIO` FOREIGN KEY (`PlanEstudio_idPlanEstudio`) REFERENCES `planestudio` (`idPlanEstudio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `aula`
--
ALTER TABLE `aula`
  ADD CONSTRAINT `FK_EDIFICIO_AULA` FOREIGN KEY (`Edificio_idEdificio`) REFERENCES `edificio` (`idEdificio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD CONSTRAINT `FK_FACULTAD_CARRERA` FOREIGN KEY (`Facultad_idFaccultad`) REFERENCES `facultad` (`idFacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `centroestudio`
--
ALTER TABLE `centroestudio`
  ADD CONSTRAINT `FK_CIUDADES_CENTRO_ESTUDIO` FOREIGN KEY (`Ciudades_idCiudades`) REFERENCES `ciudades` (`idCiudades`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `correo`
--
ALTER TABLE `correo`
  ADD CONSTRAINT `FK_PERSONA_CORREO` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `diasclase_has_seccion`
--
ALTER TABLE `diasclase_has_seccion`
  ADD CONSTRAINT `FK_DIAS_CLASE` FOREIGN KEY (`DiasClase_idDiasClase`) REFERENCES `diasclase` (`idDiasClase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SECCION_DIAS_CLASES` FOREIGN KEY (`Seccion_idSeccion`) REFERENCES `seccion` (`idSeccion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `FK_EMPLEADO_DOCENTE` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_DEPARTAMENTOS_EMPLEADO` FOREIGN KEY (`Departamentos_idDepartamentos`) REFERENCES `departamentos` (`idDepartamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PERSONA_EMPLEADO` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TIPO_CONTRATO_EMPLEADO` FOREIGN KEY (`TipoContrato_idTipoContrato`) REFERENCES `tipocontrato` (`idTipoContrato`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado_has_privilegios`
--
ALTER TABLE `empleado_has_privilegios`
  ADD CONSTRAINT `FK_EMPLEADO_PRIVILEGIOS` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PRIVILEGIOS` FOREIGN KEY (`Privilegios_idPrivilegios`) REFERENCES `privilegios` (`idPrivilegios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `FK_CENTRO_ESTUDIO_ESTUDIANTE` FOREIGN KEY (`CentroEstudio_idCentroEstudio`) REFERENCES `centroestudio` (`idCentroEstudio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PERSONA_ESTUDIANTE` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estudiante_has_carrera`
--
ALTER TABLE `estudiante_has_carrera`
  ADD CONSTRAINT `FK_CARRERA_ESTUDIANTE` FOREIGN KEY (`Carrera_idCarrera`) REFERENCES `carrera` (`idCarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ESTUDIANTE_CARRERA` FOREIGN KEY (`Estudiante_idEstudiante`) REFERENCES `estudiante` (`idEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `instructorlaboratorio`
--
ALTER TABLE `instructorlaboratorio`
  ADD CONSTRAINT `FK_EMPLEADO_INSTRUCTOR` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `FK_ESTADO_PAGO_MATRICULA` FOREIGN KEY (`EstadoPago_idEstadoPago`) REFERENCES `estadopago` (`idEstadoPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ESTUDIANTE_MATRICULA` FOREIGN KEY (`Estudiante_idEstudiante`) REFERENCES `estudiante` (`idEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OBSERVACION_NOTA_MATRICULA` FOREIGN KEY (`ObservacionNota_idObservacionNota`) REFERENCES `observacionnota` (`idObservacionNota`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SECCION_MATRICULA` FOREIGN KEY (`Seccion_idSeccion`) REFERENCES `seccion` (`idSeccion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pantallas`
--
ALTER TABLE `pantallas`
  ADD CONSTRAINT `FK_APLICACIONES_PANTALLAS` FOREIGN KEY (`Aplicaciones_idAplicaciones`) REFERENCES `aplicaciones` (`idAplicaciones`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pantallas_has_controles`
--
ALTER TABLE `pantallas_has_controles`
  ADD CONSTRAINT `FK_CONTROLES_PANTALLAS_CONTROLES` FOREIGN KEY (`Controles_idControles`) REFERENCES `controles` (`idControles`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PANTALLAS_PANTALLAS_CONTROLES` FOREIGN KEY (`Pantallas_idPantallas`) REFERENCES `pantallas` (`idPantallas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `FK_DIRECCION_PERSONA` FOREIGN KEY (`Direccion_idDireccion`) REFERENCES `direccion` (`idDireccion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `planestudio`
--
ALTER TABLE `planestudio`
  ADD CONSTRAINT `FK_CARRERA_PLAN_ESTUDIO` FOREIGN KEY (`Carrera_idCarrera`) REFERENCES `carrera` (`idCarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `privilegios_has_controles`
--
ALTER TABLE `privilegios_has_controles`
  ADD CONSTRAINT `FK_CONTROLES_PRIVILEGIOS_CONTROLES` FOREIGN KEY (`Controles_idControles`) REFERENCES `controles` (`idControles`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PRIVILEGIOS_PRIVILEGIOS_CONTROLES` FOREIGN KEY (`Privilegios_idPrivilegios`) REFERENCES `privilegios` (`idPrivilegios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `requisitos`
--
ALTER TABLE `requisitos`
  ADD CONSTRAINT `FK_ASIGNATURA_PLAN_ESTUDIO` FOREIGN KEY (`idAsignaturaPlanEstudio`) REFERENCES `asignaturaplanestudio` (`idAsignaturaPlanEstudio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ASIGNATURA_PLAN_ESTUDIO_REQUISITOS` FOREIGN KEY (`idAsignaturaPlanEstudioRequisito`) REFERENCES `asignaturaplanestudio` (`idAsignaturaPlanEstudio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD CONSTRAINT `FK_ASIGNATURA_SECCION` FOREIGN KEY (`Asignatura_idAsignatura`) REFERENCES `asignatura` (`idAsignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_AULA_SECCION` FOREIGN KEY (`Aula_idAula`) REFERENCES `aula` (`idAula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_EMPLEADO_SECCION` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_MODALIDAD_SECCION` FOREIGN KEY (`Modalidad_idModalidad`) REFERENCES `modalidad` (`idModalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PERIODO_ACADEMICO_SECCION` FOREIGN KEY (`PeriodoAcademico_idPeriodoAcademico`) REFERENCES `periodoacademico` (`idPeriodoAcademico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `FK_PERSONA_TELEFONO` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
