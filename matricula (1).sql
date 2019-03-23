-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 23-03-2019 a las 17:05:46
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
  PRIMARY KEY `PK_APLICACIONES` (`idAplicaciones`)
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
  PRIMARY KEY `PK_ASIGNATURA` (`idAsignatura`),
  KEY `FK_DEPARTAMENTOS_ASIGNATURA` (`Departamentos_idDepartamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturaplanestudio`
--

DROP TABLE IF EXISTS `asignaturaplanestudio`;
CREATE TABLE IF NOT EXISTS `asignaturaplanestudio` (
  `idAsignaturaPlanEstudio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla AsignaturaPlanEstudio\n',
  `Asignatura_idAsignatura` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Asignatura',
  `PlanEstudio_idPlanEstudio` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla PlanEstudio',
  PRIMARY KEY `PK_ASIGNATURA_PLANE_ESTUDIO` (`idAsignaturaPlanEstudio`),
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
  PRIMARY KEY `PK_AULA` (`idAula`),
  KEY `FK_EDIFICIO_AULA` (`Edificio_idEdificio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY `PK_CARRERA` (`idCarrera`),
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
  PRIMARY KEY `PK_CENTRO_ESTUDIO` (`idCentroEstudio`),
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
  PRIMARY KEY `PK_CIUDADES` (`idCiudades`)
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
  PRIMARY KEY `PK_CONTROLES` (`idControles`)
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
  PRIMARY KEY `PK_CORREO` (`idCorreo`),
  KEY `FK_PERSONA_CORREO` (`Persona_idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE IF NOT EXISTS `departamentos` (
  `idDepartamentos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Departamentos',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra los detalles de un departamentos',
  PRIMARY KEY `PK_DEPTOS` (`idDepartamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diasclase`
--

DROP TABLE IF EXISTS `diasclase`;
CREATE TABLE IF NOT EXISTS `diasclase` (
  `idDiasClase` int(11) NOT NULL AUTO_INCREMENT,
  `dias` varchar(45) DEFAULT NULL,
  PRIMARY KEY `PK_DIAS_CLASES` (`idDiasClase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diasclase_has_seccion`
--

DROP TABLE IF EXISTS `diasclase_has_seccion`;
CREATE TABLE IF NOT EXISTS `diasclase_has_seccion` (
  `DiasClase_idDiasClase` int(11) NOT NULL,
  `Seccion_idSeccion` int(11) NOT NULL,
  PRIMARY KEY `PK_DIAS_CLASES_SECCION` (`DiasClase_idDiasClase`,`Seccion_idSeccion`),
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
  PRIMARY KEY `PK_DIRECCION` (`idDireccion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`idDireccion`, `colonia`, `calle`, `noCasa`, `referencias`) VALUES
(1, 'Bella Oriente', '3', 23, 'Casa verde'),
(2, 'Bella Oriente', '1', 4567, 'Frente a Agente Atlantida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

DROP TABLE IF EXISTS `docente`;
CREATE TABLE IF NOT EXISTS `docente` (
  `idDocente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la  tabla Docente',
  `Empleado_idEmpleado` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia  ala tabla Empleado',
  PRIMARY KEY `PK_DOCENTE` (`idDocente`),
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
  PRIMARY KEY `PK_EDIFICIO` (`idEdificio`)
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
  `Persona_idPersona` int(11) NOT NULL,
  PRIMARY KEY `PK_EMPLEADO` (`idEmpleado`),
  KEY `FK_TIPO_CONTRATO_EMPLEADO` (`TipoContrato_idTipoContrato`),
  KEY `FK_PERSONA_EMPLEADO` (`Persona_idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_has_privilegios`
--

DROP TABLE IF EXISTS `empleado_has_privilegios`;
CREATE TABLE IF NOT EXISTS `empleado_has_privilegios` (
  `Empleado_idEmpleado` int(11) NOT NULL COMMENT 'LLave primaria compuesta, atributo hace referencia a la tabla empleado',
  `Privilegios_idPrivilegios` int(11) NOT NULL COMMENT 'LLave primaria compuesta, atributo hace referencia a la tabla Privilegios',
  PRIMARY KEY `PK_EMPLEADO_PRIVILEGIOS` (`Empleado_idEmpleado`,`Privilegios_idPrivilegios`),
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
  PRIMARY KEY `PK_ESTADO_PAGO` (`idEstadoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE IF NOT EXISTS `estudiante` (
  `numeroCuenta` varchar(45) NOT NULL COMMENT 'Llave primaria de la tabla estudiante, registra el numero de cuenta del estudiante',
  `Persona_idPersona` int(11) NOT NULL COMMENT 'Llave foranea que hace refencia a la tabla persona.',
  `CentroEstudio_idCentroEstudio` int(11) NOT NULL COMMENT 'Llave foranea que hace refencia a la tabla CentroEstudio.',
  PRIMARY KEY `PK_ESTUDIANTE` (`numeroCuenta`),
  KEY `FK_PERSONA_ESTUDIANTE` (`Persona_idPersona`),
  KEY `FK_CENTRO_ESTUDIO_ESTUDIANTE`  (`CentroEstudio_idCentroEstudio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_has_carrera`
--

DROP TABLE IF EXISTS `estudiante_has_carrera`;
CREATE TABLE IF NOT EXISTS `estudiante_has_carrera` (
  `Estudiante_numeroCuenta` varchar(45) NOT NULL COMMENT 'LLave primaria compuesta, atributo que hace refencia a la tabla Estudiante',
  `Carrera_idCarrera` int(11) NOT NULL COMMENT 'LLave primaria compuesta, atributo que hace refencia a la tabla Carrera',
  `Estado` varchar(1) DEFAULT NULL COMMENT 'Atributo que controla el estado del estudiante en una carrera.',
  PRIMARY KEY `PK_ESTUDIANTE_CARRERA` (`Estudiante_numeroCuenta`,`Carrera_idCarrera`),
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
  PRIMARY KEY `PK_FACULTAD` (`idFacultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructorlaboratorio`
--

DROP TABLE IF EXISTS `instructorlaboratorio`;
CREATE TABLE IF NOT EXISTS `instructorlaboratorio` (
  `idInstructorLaboratorio` int(11) NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` int(11) NOT NULL,
  PRIMARY KEY `PK_INSTRUCTOR_LABORATORIO` (`idInstructorLaboratorio`),
  KEY `FK_EMPLEADO_INSTRUCTOR` (`Empleado_idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `Estudiante_numeroCuenta` varchar(45) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Estudiante',
  PRIMARY KEY `PK_MATRICULA` (`idMatricula`),
  KEY `FK_SECCION_MATRICULA` (`Seccion_idSeccion`),
  KEY `FK_OBSERVACION_NOTA_MATRICULA` (`ObservacionNota_idObservacionNota`),
  KEY `FK_ESTADO_PAGO_MATRICULA` (`EstadoPago_idEstadoPago`),
  KEY `FK_ESTUDIANTE_MATRICULA` (`Estudiante_numeroCuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidad`
--

DROP TABLE IF EXISTS `modalidad`;
CREATE TABLE IF NOT EXISTS `modalidad` (
  `idModalidad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Modalidad',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra los detalles de la modalidad de la seccion',
  PRIMARY KEY `PK_MODALIDAD` (`idModalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observacionnota`
--

DROP TABLE IF EXISTS `observacionnota`;
CREATE TABLE IF NOT EXISTS `observacionnota` (
  `idObservacionNota` int(11) NOT NULL AUTO_INCREMENT COMMENT 'LLave primaria de la tabla ObservacionNota',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Atributo que registra valores de APR/RPB/NSP',
  PRIMARY KEY `PK_OBSERVACION_NOTA` (`idObservacionNota`)
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
  PRIMARY KEY `PK_PANTALLAS` (`idPantallas`),
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
  PRIMARY KEY `PK_PANTALLAS_CONTROLES` (`Pantallas_idPantallas`,`Controles_idControles`),
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
  PRIMARY KEY `PK_PERIODO_ACADEMICO` (`idPeriodoAcademico`)
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
  PRIMARY KEY `PK_PERSONA` (`idPersona`),
  KEY `FK_DIRECCION_PERSONA` (`Direccion_idDireccion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idPersona`, `noIdentidad`, `pnombre`, `snombre`, `papellido`, `sapellido`, `Direccion_idDireccion`) VALUES
(1, '0801-1990-01234', 'Jose', 'Antonio', 'Perez', 'Martinez', 1);

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
  PRIMARY KEY `PK_PLAN_ESTUDIO` (`idPlanEstudio`),
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
  PRIMARY KEY `PK_PRIVILEGIOS` (`idPrivilegios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios_has_controles`
--

DROP TABLE IF EXISTS `privilegios_has_controles`;
CREATE TABLE IF NOT EXISTS `privilegios_has_controles` (
  `Privilegios_idPrivilegios` int(11) NOT NULL COMMENT 'Llave primaria compuesta, atributo que hace referencia a la tabla Privilegios',
  `Controles_idControles` int(11) NOT NULL COMMENT 'Llave primaria compuesta, atributo que hace referencia a la tabla Controles',
  PRIMARY KEY `PK_PRIVILEGIOS_CONTROLES` (`Privilegios_idPrivilegios`,`Controles_idControles`),
  KEY `FK_CONTROLES_PRIVILEGIOS_CONTROLES` (`Controles_idControles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisitos`
--

DROP TABLE IF EXISTS `requisitos`;
CREATE TABLE IF NOT EXISTS `requisitos` (
  `idRequisitos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Requisitos',
  `idAsignaturaPlanEstudio` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla AsignaturaPlanEstudio',
  `idAsignaturaPlanEstudioRequisito` int(11) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Requisitos',
  PRIMARY KEY `PK_REQUISITOS` (`idRequisitos`),
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
  PRIMARY KEY `PK_SECCION` (`idSeccion`),
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
  PRIMARY KEY `PK_TELEFONO` (`idTelefono`),
  KEY `FK_PERSONA_TELEFONO` (`Persona_idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocontrato`
--

DROP TABLE IF EXISTS `tipocontrato`;
CREATE TABLE IF NOT EXISTS `tipocontrato` (
  `idTipoContrato` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla TipoContrato',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Atributo que detalla el tipo de contrato del empleado',
  PRIMARY KEY `PK_TIPO_CONTRATO` (`idTipoContrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD CONSTRAINT `FK_ESTUDIANTE_CARRERA` FOREIGN KEY (`Estudiante_numeroCuenta`) REFERENCES `estudiante` (`numeroCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `FK_ESTUDIANTE_MATRICULA` FOREIGN KEY (`Estudiante_numeroCuenta`) REFERENCES `estudiante` (`numeroCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
