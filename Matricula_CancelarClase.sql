DROP PROCEDURE IF EXISTS SP_CANCELAR$$

CREATE PROCEDURE SP_CANCELAR(
	IN pnidSeccion INT,
	OUT pbOcurreError BOOLEAN,
	OUT pcMensajeError VARCHAR(100)

)
SP:BEGIN
DECLARE vnConteo,vnCupos INT;
DECLARE vcTempMensajeError VARCHAR(100);
SET vcTempMensajeError='';
SET autocommit=0;
START TRANSACTION;
SET  pbOcurreError=TRUE;
	IF pnidSeccion ='' OR pnidSeccion  IS NULL THEN
		set vcTempMensajeError='Seccion';
	END IF;
			IF vcTempMensajeError<>'' THEN
				SET pcMensajeError=CONCAT('Campos requeridos',vcTempMensajeError);
				LEAVE SP;
			END IF;

	SELECT COUNT(*) INTO vnConteo from  Matricula m
           	INNER JOIN Seccion s ON m.Seccion_idSeccion=s.idSeccion
                  INNER JOIN PeriodoAcademico pac ON s.PeriodoAcademico_idPeriodoAcademico=pac.idPeriodoAcademico
	WHERE m.Seccion_idSeccion=pnidSeccion  
	AND pac.fechaInicio<=CURDATE() AND pac.fechaFin>=CURDATE();
	IF vnConteo=0 THEN
	SET pcMensajeError='La seccion que desea cancelar no esta matriculada'; 
	LEAVE SP;
	END IF;

	
			SELECT (cuposMaximo+1) INTO vnCupos from seccion
			where idSeccion=pnidSeccion;
	

			UPDATE Seccion set
			estado='C',
			cuposMaximo=vnCupos
			WHERE idSeccion=pnidSeccion;
	
	Delete from Matricula where Seccion_idSeccion=pnidSeccion;


			
	COMMIT;
	SET pbOcurreError=FALSE;
	SET pcMensajeError='Clase cancelada';
LEAVE SP;
END$$


