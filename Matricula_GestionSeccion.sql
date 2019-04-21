DROP PROCEDURE IF EXISTS SP_GESTIONSECCION$$

CREATE PROCEDURE SP_GESTIONSECCION(
IN pnIdSeccion     INT,
IN pcNombreSeccion VARCHAR(100),
IN pcTipoAsignacion VARCHAR(1),
IN pnCupos INT,
IN pnIdProfesor INT,
IN pnIdModalidad INT,
IN pnIdPeriodoAcademico INT,
IN pnIdAula INT,
IN pnIdAsignatura INT,
IN pfHoraInicio INT,
IN pfHoraFin INT,
IN pcAccion VARCHAR(100),
OUT pnCodigoMensaje INT,
OUT pcMensaje VARCHAR(100)
)
SP:BEGIN 
   DECLARE vnConteo,vnCapMaxAula,vnUVAsignadas ,vnUVPorAsignar int;
   DECLARE vcTempMensajeError VARCHAR(1000);
   SET vcTempMensajeError=' ';
   SET pcMensaje=' ';
   SET autocommit=0;
   START TRANSACTION;
    

   IF pcAccion='AGREGAR' THEN 

        IF pnIdProfesor=' ' OR pnIdProfesor IS NULL THEN
           SET vcTempMensajeError='Profesor';
        END IF;
        IF pnIdPeriodoAcademico=' ' OR pnIdPeriodoAcademico IS NULL THEN
           SET vcTempMensajeError=CONCAT(vcTempMensajeError,'PERIODO');
        END IF;
        IF pnIdModalidad=' ' OR pnIdModalidad IS NULL THEN
           SET vcTempMensajeError=CONCAT(vcTempMensajeError,'IdModalidad');
        END IF;
        IF pcNombreSeccion=' ' OR pcNombreSeccion IS NULL THEN
           SET vcTempMensajeError=CONCAT(vcTempMensajeError,'NombreSeccion');
        END IF;
        IF pcTipoAsignacion=' ' OR pcTipoAsignacion IS NULL THEN
           SET vcTempMensajeError=CONCAT(vcTempMensajeError,'TipoAsignacion');
        END IF;
         IF pnIdAula=' ' OR  pnIdAula IS NULL THEN
            SET vcTempMensajeError=CONCAT(vcTempMensajeError,'Aula');
         END IF;
         IF pnIdAsignatura='' OR pnIdAsignatura IS NULL THEN 
            SET vcTempMensajeError=CONCAT(vcTempMensajeError,'Asignatura');
         END IF;
         IF pfHoraInicio=' ' OR pfHoraInicio IS NULL THEN
            SET vcTempMensajeError=CONCAT(vcTempMensajeError,'HoraInicio');
         END IF;
         IF pfHoraFin=' ' OR pfHoraFin IS NULL THEN
            SET vcTempMensajeError=CONCAT(vcTempMensajeError,'HoraFin');
         END IF;
         IF vcTempMensajeError<>' ' THEN
            SET pcMensaje=CONCAT('Error de Validación de parámetros de entrada distintos de NULL',vcTempMensajeError);
            SET pnCodigoMensaje=1;
            LEAVE SP;
         END IF;

         SELECT COUNT(*) INTO vnConteo from Seccion
         WHERE seccion=pcNombreSeccion;
         IF vnConteo>0 THEN
            SET pcMensaje='Ya existe esta seccion';
            SET pnCodigoMensaje=2;
            LEAVE SP;
         END IF;

         SELECT COUNT(*) INTO vnConteo from Docente
         WHERE pnIdProfesor=idDocente;
         IF vnConteo=0 THEN
            SET pcMensaje='Error no existe docente';
            SET pnCodigoMensaje=2;
            LEAVE SP;
         END IF;
                     
         SELECT COUNT(*) INTO vnConteo from Aula
         WHERE idAula=pnIdAula;
         IF vnConteo=0 THEN
            SET pcMensaje='Error no existe esta aula';
            SET pnCodigoMensaje=2;
            LEAVE SP;
         END IF;
                     
         SELECT COUNT(*) INTO vnConteo from Asignatura
         WHERE idAsignatura=pnIdAsignatura;
         IF vnConteo=0 THEN
            SET pcMensaje='Error no existe asignatura';
            SET pnCodigoMensaje=2;
            LEAVE SP;
         END IF;
                     
         IF pfHoraInicio<6 OR pfHoraInicio>20  THEN
            SET pcMensaje='Hora Inicio no disponible';
            LEAVE SP;
         END IF;
                     
         IF pfHoraFin<7 OR pfHoraFin>21 THEN
            SET pcMensaje='Hora Final no disponible';
            LEAVE SP;
         END IF;
                     
         SELECT COUNT(*) INTO vnConteo from PeriodoAcademico 
         where idPeriodoAcademico=pnIdPeriodoAcademico;
         IF vnConteo=0 THEN
            SET pcMensaje='No existe periodo';          
            LEAVE SP;
         END IF;  

         SELECT COUNT(*) INTO vnConteo from Seccion se 
         where se.PeriodoAcademico_idPeriodoAcademico=(SELECT idPeriodoAcademico from PeriodoAcademico 
                                    where fechaInicio<=CURDATE() AND fechaFin>=CURDATE())
         AND se.HoraInicio=pfHoraInicio
         AND se.Aula_idAula=pnIdAula;
         IF vnConteo>=1 THEN
            SET pcMensaje='Ya hay seccion a esa hora en esa aula';
            SET pnCodigoMensaje=3;
            LEAVE SP;
         END IF;
                     
         SELECT SUM(a.creditoAcademico) INTO vnUVAsignadas from Asignatura a
         inner join Seccion se ON se.Asignatura_idAsignatura=a.idAsignatura
         where se.Empleado_idEmpleado=pnIdProfesor
         and se.PeriodoAcademico_idPeriodoAcademico=(SELECT idPeriodoAcademico from PeriodoAcademico 
         where fechaInicio<=CURDATE() AND fechaFin>=CURDATE());
                     
         SELECT creditoAcademico INTO vnUVPorAsignar from Asignatura 
         where idAsignatura=pnIdAsignatura;
                   
         IF (vnUVAsignadas+vnUVPorAsignar)>25 THEN
            SET pcMensaje='Error ya tiene 12 unidades asignadas';
            SET pnCodigoMensaje=3;
            LEAVE SP;
         END IF;
                     
         SELECT se.Asignatura_idAsignatura, COUNT(se.idSeccion) INTO vnCapMaxAula, vnConteo from Seccion se 
         inner join PeriodoAcademico pac ON pac.idPeriodoAcademico=se.PeriodoAcademico_idPeriodoAcademico
         where pnidPeriodoAcademico = (SELECT idPeriodoAcademico from PeriodoAcademico 
                                          where fechaInicio<=CURDATE() AND fechaFin>=CURDATE());
         IF vnConteo=4 THEN
            SET pcMensaje='Ya hay 4 secciones';
            SET pnCodigoMensaje=3;
            LEAVE SP;
         END IF;
                     
                     
         SELECT COUNT(*) INTO vnConteo from Aula
         WHERE pnIdAula IN (SELECT a.idAula from Aula a
                           where estado='I');
         IF vnConteo>0 THEN
            SET pcMensaje='Error aula inactiva';
            SET pnCodigoMensaje=3;
            LEAVE SP;
         END IF;
                     
         SELECT capacidadmaxima INTO vnCapMaxAula from aula; 
         IF pnCupos>(vnCapMaxAula-5) THEN
            SET pcMensaje='Error excede la cantidad de cupos';
            SET pnCodigoMensaje=3;
            LEAVE SP;
         END IF;
                      
                     INSERT Seccion(Empleado_idEmpleado,Aula_idAula,Asignatura_idAsignatura,
                     HoraInicio,HoraFin,cuposMaximo,PeriodoAcademico_idPeriodoAcademico,
                     Modalidad_idModalidad,tipoAsignacion,estado,seccion)
                     values(pnIdProfesor,pnIdAula,pnIdAsignatura,pfHoraInicio,pfHoraFin,pnCupos,
                     pnIdPeriodoAcademico,pnIdModalidad,pcTipoAsignacion,'M',pcNombreSeccion);
                     COMMIT;
                     	SET pcMensaje='Consulta realizada correctamente, se agrego';
                     	SET pnCodigoMensaje=0;
      LEAVE SP;
    END IF;


       IF pcAccion='EDITAR' THEN 

         SELECT COUNT(*) INTO vnConteo from seccion 
         WHERE idSeccion=pnIdSeccion
         and PeriodoAcademico_idPeriodoAcademico=(SELECT idPeriodoAcademico from PeriodoAcademico
                     where fechaInicio<=CURDATE() AND fechaFin>=CURDATE());
         IF vnConteo=0 THEN
             SET pcMensaje='Error no existe esa seccion a editar';
             SET pnCodigoMensaje=2;
             LEAVE SP;
         END IF;

         IF pnIdProfesor=' ' OR pnIdProfesor IS NULL THEN
           SET vcTempMensajeError='Profesor';
        END IF;
        IF pnIdPeriodoAcademico=' ' OR pnIdPeriodoAcademico IS NULL THEN
           SET vcTempMensajeError=CONCAT(vcTempMensajeError,'PERIODO');
        END IF;
        IF pnIdModalidad=' ' OR pnIdModalidad IS NULL THEN
           SET vcTempMensajeError=CONCAT(vcTempMensajeError,'IdModalidad');
        END IF;
        IF pcNombreSeccion=' ' OR pcNombreSeccion IS NULL THEN
           SET vcTempMensajeError=CONCAT(vcTempMensajeError,'NombreSeccion');
        END IF;
        IF pcTipoAsignacion=' ' OR pcTipoAsignacion IS NULL THEN
           SET vcTempMensajeError=CONCAT(vcTempMensajeError,'TipoAsignacion');
        END IF;
         IF pnIdAula=' ' OR  pnIdAula IS NULL THEN
            SET vcTempMensajeError=CONCAT(vcTempMensajeError,'Aula');
         END IF;
         IF pnIdAsignatura='' OR pnIdAsignatura IS NULL THEN 
            SET vcTempMensajeError=CONCAT(vcTempMensajeError,'Asignatura');
         END IF;
         IF pfHoraInicio=' ' OR pfHoraInicio IS NULL THEN
            SET vcTempMensajeError=CONCAT(vcTempMensajeError,'HoraInicio');
         END IF;
         IF pfHoraFin=' ' OR pfHoraFin IS NULL THEN
            SET vcTempMensajeError=CONCAT(vcTempMensajeError,'HoraFin');
         END IF;
         IF vcTempMensajeError<>' ' THEN
            SET pcMensaje=CONCAT('Error de Validación de parámetros de entrada distintos de NULL',vcTempMensajeError);
            SET pnCodigoMensaje=1;
            LEAVE SP;
         END IF;



                     SELECT COUNT(*) INTO vnConteo from Docente
                     WHERE pnIdProfesor=idDocente;
                     IF vnConteo=0 THEN
                        SET pcMensaje='Error no existe docente';
                        SET pnCodigoMensaje=2;
                        LEAVE SP;
                     END IF;
                     
                     SELECT COUNT(*) INTO vnConteo from Aula
                     WHERE idAula=pnIdAula;
                     IF vnConteo=0 THEN
                       SET pcMensaje='Error no existe aula';
                       SET pnCodigoMensaje=2;
                       LEAVE SP;
                     END IF;
                     
                     SELECT COUNT(*) INTO vnConteo from Asignatura
                     WHERE idAsignatura=pnIdAsignatura;
                     IF vnConteo=0 THEN
                        SET pcMensaje='Error asignatura no existe ';
                        SET pnCodigoMensaje=2;
                        LEAVE SP;
                     END IF;
                     
                     IF pfHoraInicio<6 OR pfHoraInicio>20  THEN
                        SET pcMensaje='Hora Inicio no disponible';
                        LEAVE SP;
                     END IF;
                     
                     IF pfHoraFin<7 OR pfHoraFin>21 THEN
                        SET pcMensaje='Hora Final no disponible';
                        LEAVE SP;
                     END IF;
                     
                     SELECT idPeriodoAcademico from PeriodoAcademico 
                     where fechaInicio<=CURDATE() AND fechaFin>=CURDATE();
                     
                     SELECT COUNT(*) INTO vnConteo from Seccion se 
                     where se.PeriodoAcademico_idPeriodoAcademico=(SELECT idPeriodoAcademico from PeriodoAcademico 
                                                   where fechaInicio<=CURDATE() AND fechaFin>=CURDATE())
                     AND se.HoraInicio=pfHoraInicio
                     AND se.Aula_idAula=pnIdAula;
                     IF vnConteo>=1 THEN
                        SET pcMensaje='Error ya hay seccion a esa hora en esa aula';
                        SET pnCodigoMensaje=3;
                        LEAVE SP;
                     END IF;
                     
                     SELECT SUM(a.creditoAcademico) INTO vnUVAsignadas from Asignatura a
                     inner join Seccion se ON se.Asignatura_idAsignatura=a.idAsignatura
                     where se.Empleado_idEmpleado=pnIdProfesor
                     and se.PeriodoAcademico_idPeriodoAcademico=(SELECT idPeriodoAcademico from PeriodoAcademico 
                     where fechaInicio<=CURDATE() AND fechaFin>=CURDATE());
                     
                     SELECT creditoAcademico INTO vnUVPorAsignar from Asignatura 
                     where idAsignatura=pnIdAsignatura;
                     IF (vnUVAsignadas+vnUVPorAsignar)>25 THEN
                        SET pcMensaje='Error excede el numero de creditos para el docente';
                        SET pnCodigoMensaje=3;
                        LEAVE SP;
                     END IF;
                     
                    SELECT se.Asignatura_idAsignatura, COUNT(se.idSeccion) INTO vnCapMaxAula, vnConteo from Seccion se 
                    inner join PeriodoAcademico pac ON pac.idPeriodoAcademico=se.PeriodoAcademico_idPeriodoAcademico
                     where pnidPeriodoAcademico=(SELECT idPeriodoAcademico from PeriodoAcademico 
                     where fechaInicio<=CURDATE() AND fechaFin>=CURDATE());
                     IF vnConteo=4 THEN
                        SET pcMensaje='Error ya hay 4 secciones de esa asignatura';
                        SET pnCodigoMensaje=3;
                        LEAVE SP;
                     END IF;
                     
                     SELECT capacidadmaxima INTO vnCapMaxAula from aula;
                     IF pnCupos>(vnCapMaxAula-5) THEN
                        SET pcMensaje='Error excede los cupos';
                        SET pnCodigoMensaje=3;
                        LEAVE SP;
                     END IF;
                      
                     UPDATE Seccion SET 
                     Empleado_idEmpleado=pnIdProfesor,
                     Aula_idAula= pnIdAula,
                     Asignatura_idAsignatura=pnIdAsignatura,
                     HoraInicio= pfHoraInicio,
                     HoraFin= pfHoraFin,
                     cuposMaximo=pnCupos,
                     PeriodoAcademico_idPeriodoAcademico=pnIdPeriodoAcademico,
                     Modalidad_idModalidad=pnIdModalidad,
                     tipoAsignacion=pcTipoAsignacion,
                     seccion=pcNombreSeccion
                     where idSeccion=pnIdSeccion;
                     COMMIT;
                     
                        
                     	SET pcMensaje='Consulta realizada correctamente';
                     	SET pnCodigoMensaje=0;
      LEAVE SP;
    END IF;
   
    IF pcAccion='ELIMINAR' THEN
        SELECT COUNT(*) INTO vnConteo from seccion 
         WHERE idSeccion=pnIdSeccion
         and PeriodoAcademico_idPeriodoAcademico=(SELECT idPeriodoAcademico from PeriodoAcademico
                     where fechaInicio<=CURDATE() AND fechaFin>=CURDATE());
         IF vnConteo=0 THEN
             SET pcMensaje='Error no existe seccion a eliminar';
             SET pnCodigoMensaje=2;
             LEAVE SP;
         END IF;
         SELECT COUNT(*) INTO vnConteo  from seccion se
        inner join Matricula ma ON ma.Seccion_idSeccion=se.idSeccion
        where se.idSeccion=pnIdSeccion;
        IF vnConteo>=1 THEN
           SET pcMensaje='Hay alumnos matriculados no la puede eliminar';
           SET pnCodigoMensaje=3;  
           LEAVE SP;
        END IF;


        DELETE FROM Seccion where idSeccion=pnIdSeccion;
          COMMIT;
        SET pcMensaje='Consulta realizada correctamente';
        SET pnCodigoMensaje=0;
      LEAVE SP;
    END IF;


END$$