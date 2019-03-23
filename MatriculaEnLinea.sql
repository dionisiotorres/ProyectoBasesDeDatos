-- MySQL Script generated by MySQL Workbench
-- Fri Mar 22 19:34:34 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Direccion` (
  `idDireccion` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla direccion',
  `colonia` VARCHAR(45) NULL COMMENT 'atributo que registra el nombre de la colonia',
  `calle` VARCHAR(45) NULL COMMENT 'atributo que registra el numero de calle',
  `noCasa` INT NULL COMMENT 'atributo que registra el numero de casa',
  `referencias` VARCHAR(45) NULL COMMENT 'atributo que registra referencias de la dirrecion del domicilio.',
  PRIMARY KEY (`idDireccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Persona` (
  `idPersona` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Persona',
  `noIdentidad` VARCHAR(45) NULL COMMENT 'Atributo que registra el numero de identidad de la persona',
  `pnombre` VARCHAR(45) NULL COMMENT 'Atributo  que registra el primer nombre de la persona',
  `snombre` VARCHAR(45) NULL COMMENT 'Atributo segundo nombre de la persona',
  `papellido` VARCHAR(45) NULL COMMENT 'Atributo  que registra el primer apellido de la persona',
  `sapellido` VARCHAR(45) NULL COMMENT 'Atributo  que registra el segundo apellido de la persona',
  `Direccion_idDireccion` INT NOT NULL COMMENT 'Llave foranea, hace referencia a la tabla direccion.',
  PRIMARY KEY (`idPersona`),
  CONSTRAINT `fk_Persona_Direccion1`
    FOREIGN KEY (`Direccion_idDireccion`)
    REFERENCES `mydb`.`Direccion` (`idDireccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Ciudades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ciudades` (
  `idCiudades` INT NOT NULL COMMENT 'Llave primaria de la tabla Ciudades',
  `nombreCiudad` VARCHAR(45) NULL COMMENT 'Atributo que registra el nombre de ciudades donde exites un centro educativo',
  PRIMARY KEY (`idCiudades`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CentroEstudio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CentroEstudio` (
  `idCentroEstudio` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla CentroEstudio',
  `nombreCentroEstudio` VARCHAR(45) NULL COMMENT 'Atributo que registra el nombre del centro de estudio',
  `Ciudades_idCiudades` INT NOT NULL,
  PRIMARY KEY (`idCentroEstudio`),
  CONSTRAINT `fk_CentroEstudio_Ciudades1`
    FOREIGN KEY (`Ciudades_idCiudades`)
    REFERENCES `mydb`.`Ciudades` (`idCiudades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estudiante` (
  `numeroCuenta` VARCHAR(45) NOT NULL COMMENT 'Llave primaria de la tabla estudiante, registra el numero de cuenta del estudiante',
  `Persona_idPersona` INT NOT NULL COMMENT 'Llave foranea que hace refencia a la tabla persona.',
  `CentroEstudio_idCentroEstudio` INT NOT NULL COMMENT 'Llave foranea que hace refencia a la tabla CentroEstudio.',
  PRIMARY KEY (`numeroCuenta`),
  CONSTRAINT `fk_Estudiante_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `mydb`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estudiante_CentroEstudio1`
    FOREIGN KEY (`CentroEstudio_idCentroEstudio`)
    REFERENCES `mydb`.`CentroEstudio` (`idCentroEstudio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoContrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoContrato` (
  `idTipoContrato` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla TipoContrato',
  `descripcion` VARCHAR(45) NULL COMMENT 'Atributo que detalla el tipo de contrato del empleado',
  PRIMARY KEY (`idTipoContrato`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleado` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Empleado',
  `numContrato` VARCHAR(45) NULL COMMENT 'Atributo que registra el numero de contrarto asociado a un empleado',
  `fechaRegistro` VARCHAR(45) NULL COMMENT 'Atributo que ingresa la fecha de los nuevos registros en la tabla',
  `TipoContrato_idTipoContrato` INT NOT NULL COMMENT 'Llave foranea que hace refencia a la tabla TipoContrato',
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  CONSTRAINT `fk_Empleado_TipoContrato1`
    FOREIGN KEY (`TipoContrato_idTipoContrato`)
    REFERENCES `mydb`.`TipoContrato` (`idTipoContrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `mydb`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Docente` (
  `idDocente` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la  tabla Docente',
  `Empleado_idEmpleado` INT NOT NULL COMMENT 'Llave foranea que hace referencia  ala tabla Empleado',
  PRIMARY KEY (`idDocente`),
  CONSTRAINT `fk_Docente_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `mydb`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono` (
  `idTelefono` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla telefono\n',
  `numeroTelefono` VARCHAR(45) NULL COMMENT 'Atributo que registra el numero de telefono.',
  `tipo` VARCHAR(45) NULL COMMENT 'Atributo que registra el tipo de telefono (celular,telefono)',
  `Persona_idPersona` INT NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla persona.',
  PRIMARY KEY (`idTelefono`),
  CONSTRAINT `fk_Telefono_Persona`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `mydb`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PeriodoAcademico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PeriodoAcademico` (
  `idPeriodoAcademico` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla PeriodoAcademico',
  `fechaInicio` DATE NULL COMMENT 'Atributo que registra la fecha de inicio de un periodo academico',
  `fechaFin` DATE NULL COMMENT 'Atributo que registra la fecha de finalizacion de un periodo academico',
  `descripcion` VARCHAR(45) NULL COMMENT 'Atributo que registra los detalles de un periodo academico',
  PRIMARY KEY (`idPeriodoAcademico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departamentos` (
  `idDepartamentos` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Departamentos',
  `descripcion` VARCHAR(45) NULL COMMENT 'Atributo que registra los detalles de un departamentos',
  PRIMARY KEY (`idDepartamentos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asignatura` (
  `idAsignatura` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Asignatura',
  `nombre` VARCHAR(45) NULL COMMENT 'Atributo que registra el nombre de una asignatura',
  `codigo` VARCHAR(45) NULL COMMENT 'Atributo que registra el codigo de una asignatura',
  `creditosAcademicos` INT NULL COMMENT 'Atributo que registra la cantidad de creditos academisco de la asignatura',
  `Departamentos_idDepartamentos` INT NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Departamentos',
  PRIMARY KEY (`idAsignatura`),
  CONSTRAINT `fk_Asignatura_Departamentos1`
    FOREIGN KEY (`Departamentos_idDepartamentos`)
    REFERENCES `mydb`.`Departamentos` (`idDepartamentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Edificio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Edificio` (
  `idEdificio` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Edificio',
  `nombre` VARCHAR(45) NULL COMMENT 'Atributo que registra el nombre de un edificio de especifico',
  PRIMARY KEY (`idEdificio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aula` (
  `idAula` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Aula',
  `numero` VARCHAR(45) NULL COMMENT 'Atributo que registra el numero de una aula especifica',
  `Edificio_idEdificio` INT NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Edificio',
  `estado` VARCHAR(1) NULL,
  PRIMARY KEY (`idAula`),
  CONSTRAINT `fk_Aula_Edificio1`
    FOREIGN KEY (`Edificio_idEdificio`)
    REFERENCES `mydb`.`Edificio` (`idEdificio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Modalidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Modalidad` (
  `idModalidad` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Modalidad',
  `descripcion` VARCHAR(45) NULL COMMENT 'Atributo que registra los detalles de la modalidad de la seccion',
  PRIMARY KEY (`idModalidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Seccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Seccion` (
  `idSeccion` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Seccion',
  `seccion` VARCHAR(45) NULL COMMENT 'Atributo que registra el numero de una seccion',
  `horaInicio` TIME NULL COMMENT 'Atributo que registra la hora de incio de clase de una seccion',
  `horaFin` TIME NULL COMMENT 'Atributo que registra la hora de finalizacion de clase de una seccion',
  `Asignatura_idAsignatura` INT NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Asignatura',
  `PeriodoAcademico_idPeriodoAcademico` INT NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla PeriodoAcademico',
  `Aula_idAula` INT NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Aula',
  `tipoAsignacion` VARCHAR(1) NULL COMMENT 'Atributo que registra una nueva asignasion la cual puede ser Laboratorio \"L\" ó Asignatura \"A\"',
  `estado` VARCHAR(1) NULL COMMENT 'Atributo que registra ek estado de la seccion en periodo academico especifico puede ser cancelada, terminada, cerrada etc.',
  `Modalidad_idModalidad` INT NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Modalidad.',
  `Empleado_idEmpleado` INT NOT NULL,
  PRIMARY KEY (`idSeccion`),
  CONSTRAINT `fk_Seccion_Asignatura1`
    FOREIGN KEY (`Asignatura_idAsignatura`)
    REFERENCES `mydb`.`Asignatura` (`idAsignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Seccion_PeriodoAcademico1`
    FOREIGN KEY (`PeriodoAcademico_idPeriodoAcademico`)
    REFERENCES `mydb`.`PeriodoAcademico` (`idPeriodoAcademico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Seccion_Aula1`
    FOREIGN KEY (`Aula_idAula`)
    REFERENCES `mydb`.`Aula` (`idAula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Seccion_Modalidad1`
    FOREIGN KEY (`Modalidad_idModalidad`)
    REFERENCES `mydb`.`Modalidad` (`idModalidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Seccion_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `mydb`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Facultad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Facultad` (
  `idFacultad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idFacultad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Carrera` (
  `idCarrera` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Carrera',
  `nombre` VARCHAR(45) NULL COMMENT 'Atributo que registra el nombre de una carrera',
  `fechaInicio` DATE NULL COMMENT 'Atributo que registra la fecha de inicio de una carrera',
  `Facultad_idFaccultad` INT NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Facultad',
  PRIMARY KEY (`idCarrera`),
  CONSTRAINT `fk_Carrera_Facultad1`
    FOREIGN KEY (`Facultad_idFaccultad`)
    REFERENCES `mydb`.`Facultad` (`idFacultad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PlanEstudio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PlanEstudio` (
  `idPlanEstudio` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla PlanEstudio',
  `fechaAprobacion` DATE NULL COMMENT 'Atributo que registra la fecha de aprobacion de un plan de estudios',
  `fechaFin` DATE NULL COMMENT 'Atributo que registra la fecha de finalizacion de la vigencia de un plan de estudios',
  `numeroAcuerdo` VARCHAR(45) NULL COMMENT 'Atributo que registra el numero de acuerdo de un plan de estudios',
  `Carrera_idCarrera` INT NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Carrera',
  PRIMARY KEY (`idPlanEstudio`),
  CONSTRAINT `fk_PlanEstudio_Carrera1`
    FOREIGN KEY (`Carrera_idCarrera`)
    REFERENCES `mydb`.`Carrera` (`idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AsignaturaPlanEstudio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AsignaturaPlanEstudio` (
  `idAsignaturaPlanEstudio` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla AsignaturaPlanEstudio\n',
  `Asignatura_idAsignatura` INT NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Asignatura',
  `PlanEstudio_idPlanEstudio` INT NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla PlanEstudio',
  PRIMARY KEY (`idAsignaturaPlanEstudio`),
  CONSTRAINT `fk_AsignaturaPlanEstudio_Asignatura1`
    FOREIGN KEY (`Asignatura_idAsignatura`)
    REFERENCES `mydb`.`Asignatura` (`idAsignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AsignaturaPlanEstudio_PlanEstudio1`
    FOREIGN KEY (`PlanEstudio_idPlanEstudio`)
    REFERENCES `mydb`.`PlanEstudio` (`idPlanEstudio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ObservacionNota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ObservacionNota` (
  `idObservacionNota` INT NOT NULL AUTO_INCREMENT COMMENT 'LLave primaria de la tabla ObservacionNota',
  `descripcion` VARCHAR(45) NULL COMMENT 'Atributo que registra valores de APR/RPB/NSP',
  PRIMARY KEY (`idObservacionNota`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EstadoPago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EstadoPago` (
  `idEstadoPago` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla EstadoPago',
  `descripcion` VARCHAR(45) NULL COMMENT 'Atributo que registra los detalle del tipo de pago que realiza el estudiante',
  `estado` VARCHAR(1) NULL COMMENT 'Atributo que registra valores de Pagado/NoPagado',
  PRIMARY KEY (`idEstadoPago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matricula` (
  `idMatricula` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Matricula',
  `Seccion_idSeccion` INT NOT NULL COMMENT 'Llave foranea que hace refencia a la tabla Seccion',
  `fechaRegistro` DATE NULL COMMENT 'Atributo que ingresa la fecha de un nuevo registro en la tabla',
  `calificacion` DOUBLE NULL COMMENT 'Atributo que registra la calificacion obtenida en una asignatura',
  `ObservacionNota_idObservacionNota` INT NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla ObservacionNota',
  `EstadoPago_idEstadoPago` INT NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla EstadoPago',
  `Estudiante_numeroCuenta` VARCHAR(45) NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Estudiante',
  PRIMARY KEY (`idMatricula`),
  CONSTRAINT `fk_Matricula_Seccion1`
    FOREIGN KEY (`Seccion_idSeccion`)
    REFERENCES `mydb`.`Seccion` (`idSeccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_ObservacionNota1`
    FOREIGN KEY (`ObservacionNota_idObservacionNota`)
    REFERENCES `mydb`.`ObservacionNota` (`idObservacionNota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_EstadoPago1`
    FOREIGN KEY (`EstadoPago_idEstadoPago`)
    REFERENCES `mydb`.`EstadoPago` (`idEstadoPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Estudiante1`
    FOREIGN KEY (`Estudiante_numeroCuenta`)
    REFERENCES `mydb`.`Estudiante` (`numeroCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estudiante_has_Carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estudiante_has_Carrera` (
  `Estudiante_numeroCuenta` VARCHAR(45) NOT NULL COMMENT 'LLave primaria compuesta, atributo que hace refencia a la tabla Estudiante',
  `Carrera_idCarrera` INT NOT NULL COMMENT 'LLave primaria compuesta, atributo que hace refencia a la tabla Carrera',
  `Estado` VARCHAR(1) NULL COMMENT 'Atributo que controla el estado del estudiante en una carrera.',
  PRIMARY KEY (`Estudiante_numeroCuenta`, `Carrera_idCarrera`),
  CONSTRAINT `fk_Estudiante_has_Carrera_Estudiante1`
    FOREIGN KEY (`Estudiante_numeroCuenta`)
    REFERENCES `mydb`.`Estudiante` (`numeroCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estudiante_has_Carrera_Carrera1`
    FOREIGN KEY (`Carrera_idCarrera`)
    REFERENCES `mydb`.`Carrera` (`idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DiasClase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DiasClase` (
  `idDiasClase` INT NOT NULL AUTO_INCREMENT,
  `dias` VARCHAR(45) NULL,
  PRIMARY KEY (`idDiasClase`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`InstructorLaboratorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`InstructorLaboratorio` (
  `idInstructorLaboratorio` INT NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` INT NOT NULL,
  PRIMARY KEY (`idInstructorLaboratorio`),
  CONSTRAINT `fk_InstructorLaboratorio_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `mydb`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DiasClase_has_Seccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DiasClase_has_Seccion` (
  `DiasClase_idDiasClase` INT NOT NULL,
  `Seccion_idSeccion` INT NOT NULL,
  PRIMARY KEY (`DiasClase_idDiasClase`, `Seccion_idSeccion`),
  CONSTRAINT `fk_DiasClase_has_Seccion_DiasClase1`
    FOREIGN KEY (`DiasClase_idDiasClase`)
    REFERENCES `mydb`.`DiasClase` (`idDiasClase`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DiasClase_has_Seccion_Seccion1`
    FOREIGN KEY (`Seccion_idSeccion`)
    REFERENCES `mydb`.`Seccion` (`idSeccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Requisitos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Requisitos` (
  `idRequisitos` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Requisitos',
  `idAsignaturaPlanEstudio` INT NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla AsignaturaPlanEstudio',
  `idAsignaturaPlanEstudioRequisito` INT NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Requisitos',
  PRIMARY KEY (`idRequisitos`),
  CONSTRAINT `fk_Requisitos_AsignaturaPlanEstudio1`
    FOREIGN KEY (`idAsignaturaPlanEstudio`)
    REFERENCES `mydb`.`AsignaturaPlanEstudio` (`idAsignaturaPlanEstudio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Requisitos_AsignaturaPlanEstudio2`
    FOREIGN KEY (`idAsignaturaPlanEstudioRequisito`)
    REFERENCES `mydb`.`AsignaturaPlanEstudio` (`idAsignaturaPlanEstudio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Correo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Correo` (
  `idCorreo` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Correo',
  `descripcion` VARCHAR(45) NULL COMMENT 'Atributo que registra los detalles del correo',
  `Persona_idPersona` INT NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Persona',
  PRIMARY KEY (`idCorreo`),
  CONSTRAINT `fk_Correo_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `mydb`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Privilegios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Privilegios` (
  `idPrivilegios` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Privilegios',
  `nombreCorto` VARCHAR(45) NULL COMMENT 'Atributo que registra el nombre de los distintos privilegios',
  `descripcionPrivilegios` VARCHAR(45) NULL COMMENT 'Atributo que registra los detalles de los distintos privilegios',
  PRIMARY KEY (`idPrivilegios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aplicaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aplicaciones` (
  `idAplicaciones` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Aplicaciones',
  `nombreCorto` VARCHAR(45) NULL COMMENT 'Atributo que registra el nombre de las distintas aplicaciones que puede tener una o muchas pantallas',
  PRIMARY KEY (`idAplicaciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pantallas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pantallas` (
  `idPantallas` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Pantallas',
  `nombreCorto` VARCHAR(45) NULL COMMENT 'Atributo que registra el nombre de las pantallas donde se encuentran una serie de controles segun el privilegio.',
  `descripcion` VARCHAR(45) NULL COMMENT 'Atributo que detalla  las pantallas donde se encuentran una serie de controles segun el privilegio.',
  `Aplicaciones_idAplicaciones` INT NOT NULL COMMENT 'Llave foranea que hace referencia a la tabla Aplicaciones',
  PRIMARY KEY (`idPantallas`),
  CONSTRAINT `fk_Pantallas_Aplicaciones1`
    FOREIGN KEY (`Aplicaciones_idAplicaciones`)
    REFERENCES `mydb`.`Aplicaciones` (`idAplicaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Controles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Controles` (
  `idControles` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla Controles',
  `nombreCorto` VARCHAR(45) NULL COMMENT 'Atributo que  registra el nombre de los distintos controles a los que se puede accerder con cada privilegio',
  `descripcion` VARCHAR(45) NULL COMMENT 'Atributo que detalla los distintos controles a los que se puede accerder con cada privilegio',
  PRIMARY KEY (`idControles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Privilegios_has_Controles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Privilegios_has_Controles` (
  `Privilegios_idPrivilegios` INT NOT NULL COMMENT 'Llave primaria compuesta, atributo que hace referencia a la tabla Privilegios',
  `Controles_idControles` INT NOT NULL COMMENT 'Llave primaria compuesta, atributo que hace referencia a la tabla Controles',
  PRIMARY KEY (`Privilegios_idPrivilegios`, `Controles_idControles`),
  CONSTRAINT `fk_Privilegios_has_Controles_Privilegios1`
    FOREIGN KEY (`Privilegios_idPrivilegios`)
    REFERENCES `mydb`.`Privilegios` (`idPrivilegios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Privilegios_has_Controles_Controles1`
    FOREIGN KEY (`Controles_idControles`)
    REFERENCES `mydb`.`Controles` (`idControles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pantallas_has_Controles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pantallas_has_Controles` (
  `Pantallas_idPantallas` INT NOT NULL AUTO_INCREMENT,
  `Controles_idControles` INT NOT NULL,
  PRIMARY KEY (`Pantallas_idPantallas`, `Controles_idControles`),
  CONSTRAINT `fk_Pantallas_has_Controles_Pantallas1`
    FOREIGN KEY (`Pantallas_idPantallas`)
    REFERENCES `mydb`.`Pantallas` (`idPantallas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pantallas_has_Controles_Controles1`
    FOREIGN KEY (`Controles_idControles`)
    REFERENCES `mydb`.`Controles` (`idControles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleado_has_Privilegios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleado_has_Privilegios` (
  `Empleado_idEmpleado` INT NOT NULL COMMENT 'LLave primaria compuesta, atributo hace referencia a la tabla empleado',
  `Privilegios_idPrivilegios` INT NOT NULL COMMENT 'LLave primaria compuesta, atributo hace referencia a la tabla Privilegios',
  PRIMARY KEY (`Empleado_idEmpleado`, `Privilegios_idPrivilegios`),
  CONSTRAINT `fk_Empleado_has_Privilegios_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `mydb`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_has_Privilegios_Privilegios1`
    FOREIGN KEY (`Privilegios_idPrivilegios`)
    REFERENCES `mydb`.`Privilegios` (`idPrivilegios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;

-- -----------------------------------------------------
--  routine1
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;