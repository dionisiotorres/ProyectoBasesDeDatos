-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-03-2019 a las 20:41:33
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diasclase`
--

DROP TABLE IF EXISTS `diasclase`;
CREATE TABLE IF NOT EXISTS `diasclase` (
  `idDiasClase` int(11) NOT NULL AUTO_INCREMENT,
  `dias` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDiasClase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`idDocente`),
  KEY `FK_EMPLEADO_DOCENTE` (`Empleado_idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `edificio`
--

DROP TABLE IF EXISTS `edificio`;
CREATE TABLE IF NOT EXISTS `edificio` (
  `idEdificio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Edificio',
  `nombre` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el nombre de un edificio de especifico',
  PRIMARY KEY (`idEdificio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Empleado',
  `numContrato` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra el numero de contrarto asociado a un empleado',
  `fechaRegistro` varchar(45) DEFAULT NULL COMMENT 'Atributo que ingresa la fecha de los nuevos registros en la tabla',
  `TipoContrato_idTipoContrato` int(11) NOT NULL COMMENT 'Llave foranea que hace refencia a la tabla TipoContrato',
  `Persona_idPersona` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla persona',
  `Departamentos_idDepartamentos` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia al departamento',
  PRIMARY KEY (`idEmpleado`),
  KEY `FK_TIPO_CONTRATO_EMPLEADO` (`TipoContrato_idTipoContrato`),
  KEY `FK_PERSONA_EMPLEADO` (`Persona_idPersona`),
  KEY `FK_DEPARTAMENTOS_EMPLEADO` (`Departamentos_idDepartamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`idEstudiante`),
  KEY `FK_PERSONA_ESTUDIANTE` (`Persona_idPersona`),
  KEY `FK_CENTRO_ESTUDIO_ESTUDIANTE` (`CentroEstudio_idCentroEstudio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

DROP TABLE IF EXISTS `facultad`;
CREATE TABLE IF NOT EXISTS `facultad` (
  `idFacultad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFacultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`idInstructorLaboratorio`),
  KEY `FK_EMPLEADO_INSTRUCTOR` (`Empleado_idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observacionnota`
--

DROP TABLE IF EXISTS `observacionnota`;
CREATE TABLE IF NOT EXISTS `observacionnota` (
  `idObservacionNota` int(11) NOT NULL AUTO_INCREMENT COMMENT 'LLave primaria de la tabla ObservacionNota',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra valores de APR/RPB/NSP',
  PRIMARY KEY (`idObservacionNota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

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
(8, '0801-1995-01345', 'Karla', 'Maria', 'Casto', 'Mendez', 24),
(9, '0803-1998-01543', 'David', 'Andres', 'Suarez', 'Ortiz', 18),
(10, '0209-2000-1045', 'Astrid', 'Valeria', 'Lopez', 'Guerra', 11);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
