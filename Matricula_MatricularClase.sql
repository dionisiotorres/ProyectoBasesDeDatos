DROP PROCEDURE IF EXISTS SP_MATRICULA$$

CREATE PROCEDURE SP_MATRICULA(
		IN pnNumeroCuenta		INT,
		IN pnIdSeccion		 	INT,
		OUT pbOcurreError		BOOLEAN,
		OUT pcMensajeError		VARCHAR(1000)
)
SP:BEGIN
	DECLARE vnConteo,vnConteo2,vnidEst, vnCuposMaximo, vnUVMatriculadas, vnUVClaseAMatricular, vnUVMaximo INT;
	DECLARE vcTempMensajeError VARCHAR(1000);
	DECLARE vnHoraInicio, vnHoraFin TIME;
	SET autocommit=0;
	START TRANSACTION;
	SET vcTempMensajeError='';
	SET pbOcurreError=TRUE;
	SET vnUVMaximo=25;
	IF pnNumeroCuenta='' or pnNumeroCuenta IS NULL THEN
		SET vcTempMensajeError='Numero de cuenta, ';
	END IF;
	IF pnIdSeccion='' or pnIdSeccion IS NULL THEN
		SET vcTempMensajeError=CONCAT(vcTempMensajeError,'Seccion');
	END IF;
	IF vcTempMensajeError<>'' THEN
		SET pcMensajeError=CONCAT('Campos requeridos',vcTempMensajeError);
		LEAVE SP;
	END IF;
    
	SELECT COUNT(*) INTO vnConteo FROM estudiante 
	WHERE numeroCuenta=pnNumeroCuenta;
	IF vnConteo=0 THEN
		SET pcMensajeError='Numero de cuenta NO EXISTE';
		LEAVE SP;
	END IF;
	
	SELECT COUNT(*) INTO vnConteo FROM seccion
	WHERE idSeccion=pnIdseccion;
	IF vnConteo=0 THEN
		SET pcMensajeError='La seccion NO EXISTE';
		LEAVE SP;
	END IF;
	
	SELECT cuposMaximo INTO vnCuposMaximo FROM 
	seccion WHERE idSeccion=pnIdSeccion;
	
	SELECT COUNT(*) INTO vnConteo 
	FROM matricula WHERE Seccion_idSeccion=pnIdSeccion;
	
	IF vnConteo=vnCuposMaximo THEN
		SET pcMensajeError='No hay cupos disponibles';
		LEAVE SP;
	END IF;
	
	
	SELECT SUM(a.creditoAcademico) INTO vnUVMatriculadas 
	FROM asignatura a 
	INNER JOIN seccion s ON a.idAsignatura=s.Asignatura_idAsignatura
	INNER JOIN matricula m ON m.Seccion_idSeccion=s.idSeccion
	INNER JOIN Estudiante e ON e.idEstudiante=m.Estudiante_idEstudiante
	WHERE e.numeroCuenta=pnNumeroCuenta;
	
	SELECT a.creditoAcademico INTO vnUVClaseAMatricular
	FROM asignatura a
	INNER JOIN seccion s ON a.idAsignatura=s.Asignatura_idAsignatura
	WHERE s.idSeccion=pnIdSeccion;
	
	
	IF (vnUVMatriculadas+vnUVClaseAMatricular)>vnUVMaximo THEN
		SET pcMensajeError=CONCAT('Excede las UV maximo: ', vnUVMaximo,' matriculadas actualmente: ',vnUVMatriculadas);
		LEAVE SP;
	END IF;
	
	SELECT COUNT(*) INTO vnConteo FROM requisitos r
	INNER JOIN asignatura a ON r.idAsignaturaPlanEstudio=a.idAsignatura
	INNER JOIN seccion s ON s.Asignatura_idAsignatura=a.idAsignatura
	WHERE s.idSeccion=pnIdSeccion;
	
	SELECT COUNT(*) INTO vnConteo2 FROM requisitos r
	INNER JOIN asignatura a ON r.idAsignaturaPlanEstudio=a.idAsignatura
	INNER JOIN seccion s ON s.Asignatura_idAsignatura=a.idAsignatura
	WHERE s.idSeccion=pnIdSeccion
	AND a.idAsignatura IN (
		SELECT a.idAsignatura FROM asignatura a
		INNER JOIN seccion s ON a.idAsignatura=s.Asignatura_idAsignatura
		INNER JOIN matricula m ON m.Seccion_idSeccion=s.idSeccion
		INNER JOIN Estudiante e ON e.idEstudiante=m.Estudiante_idEstudiante
		WHERE e.numeroCuenta=pnNumeroCuenta
		AND m.ObservacionNota_idObservacionNota=1);
	
	IF vnConteo2<vnConteo THEN
		SET pcMensajeError='No tiene los requisitos para matricula la asignatura';
		LEAVE SP;
	END IF;
	
	SELECT s2.horaInicio, s2.horaFin 
	INTO vnHoraInicio, vnHoraFin FROM seccion s2 WHERE s2.idSeccion=pnIdSeccion;
	
	SELECT COUNT(*) INTO vnConteo 
	FROM asignatura a 
	INNER JOIN seccion s ON a.idAsignatura=s.Asignatura_idAsignatura
	INNER JOIN matricula m ON m.Seccion_idSeccion=s.idSeccion
	INNER JOIN Estudiante e ON e.idEstudiante=m.Estudiante_idEstudiante
		WHERE e.numeroCuenta=pnNumeroCuenta
	AND ( (s.horaInicio<=vnHoraInicio AND s.horaFin>vnHoraInicio)
			OR  (s.horaInicio<vnHoraFin AND s.horaFin>=vnHoraFin));
	
	
	IF vnConteo>0 THEN
		SET pcMensajeError='Tiene traslape';
		LEAVE SP;
	END IF;
	select idEstudiante INTO vnidEst from estudiante
	where numeroCuenta=pnNumeroCuenta;
	
	INSERT matricula(Seccion_idSeccion,Estudiante_idEstudiante, fechaRegistro,
	EstadoPago_idEstadoPago,ObservacionNota_idObservacionNota)
	VALUES (pnIdSeccion, vnidEst, CURDATE(),1,3);
	UPDATE seccion SET
	cuposMaximo=cuposMaximo-1
	where idSeccion=pnIdSeccion;
	
	COMMIT;
	SET pcMensajeError='Estudiante matriculado satisfactoriamente';
	SET pbOcurreError=FALSE;
	
		
END$$
















