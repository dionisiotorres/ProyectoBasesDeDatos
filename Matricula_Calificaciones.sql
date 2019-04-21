    DROP PROCEDURE IF EXISTS SP_CALIFICACIONES$$

    CREATE PROCEDURE SP_CALIFICACIONES(
       IN pnNumCuenta INT,
       IN pnIdSeccion INT,
       IN pdCalificacion DOUBLE,
       OUT pcMensaje VARCHAR(100),
       OUT pbOcurreError BOOLEAN
        
    )
    SP:BEGIN 
    DECLARE vnConteo,vnidObservacion,vnidMatricula INT;
    DECLARE vcMsjTemp VARCHAR(1000);
    SET vcMsjTemp='';
    SET pbOcurreError=TRUE;
    SET autocommit=0;
    START TRANSACTION;
    

        IF pdCalificacion='' OR pdCalificacion IS NULL THEN
            SET vcMsjTemp=CONCAT(vcMsjTemp, 'Calificacion' );
        END IF;
        IF pnIdSeccion='' OR pnIdSeccion IS NULL THEN
            SET vcMsjTemp=CONCAT(vcMsjTemp, 'Seccion' );
        END IF;
        
        IF pnNumCuenta='' OR pnNumCuenta IS NULL THEN
            SET vcMsjTemp=CONCAT(vcMsjTemp, 'NumCuenta' );
        END IF;
        IF vcMsjTemp<>'' THEN
            SET pcMensaje=CONCAT('Campos requeridos ',vcMsjTemp);
            LEAVE SP;
        END IF;

        
        SELECT COUNT(*) INTO vnConteo from Matricula 
        where Estudiante_idEstudiante=(SELECT idEstudiante from estudiante 
                                        where numerocuenta=pnNumCuenta)
        AND Seccion_idSeccion=pnIdSeccion;

        IF vnConteo=0 THEN
            SET pcMensaje='No puede ingresar calificacion, verifique la seccion y estudiante';
            LEAVE SP;
        END IF;


        IF pdCalificacion>=65 THEN
            SELECT idObservacionNota INTO vnidObservacion from ObservacionNota
            where descripcion='APR';
        END IF;
        IF pdCalificacion>0 and pdCalificacion<65  THEN
            SELECT idObservacionNota INTO vnidObservacion from ObservacionNota
            where descripcion='RPB';
        END IF;
        IF pdCalificacion=0 THEN
            SELECT idObservacionNota INTO vnidObservacion from ObservacionNota
            where descripcion='NSP';
        END IF;

        SELECT idMatricula INTO vnidMatricula from Matricula 
        where Estudiante_idEstudiante=(SELECT idEstudiante from estudiante 
                                        where numerocuenta=pnNumCuenta)
        AND Seccion_idSeccion=pnIdSeccion;

    
        UPDATE Matricula SET
        Calificacion=pdCalificacion,
        ObservacionNota_idObservacionNota=vnidObservacion
        where idMatricula=vnidMatricula;
        COMMIT;
        SET pcMensaje='calificacion registrada';
        SET pbOcurreError=FALSE;

END$$
        