-- Especificaciones de los Disparadores (Triggers)

-- ============================================================
-- CUMPLIMIENTO DE RESTRICCIONES DE CONSTRUCCION: DEFAULT
-- ============================================================
ALTER TABLE Inscripcion MODIFY Estado DEFAULT 'Pendiente';
ALTER TABLE Inscripcion MODIFY Fecha_solicitud DEFAULT SYSDATE;
ALTER TABLE Torneo MODIFY Estado DEFAULT 'Programado';
ALTER TABLE Partido MODIFY goles_local DEFAULT 0;
ALTER TABLE Partido MODIFY goles_visitante DEFAULT 0;
ALTER TABLE Partido MODIFY estado DEFAULT 'Pendiente';

ALTER TABLE Estadistica_Equipo MODIFY puntos DEFAULT 0;
ALTER TABLE Estadistica_Equipo MODIFY goles_favor DEFAULT 0;
ALTER TABLE Estadistica_Equipo MODIFY goles_contra DEFAULT 0;
ALTER TABLE Estadistica_Equipo MODIFY partidos_ganados DEFAULT 0;
ALTER TABLE Estadistica_Equipo MODIFY partidos_perdidos DEFAULT 0;
ALTER TABLE Estadistica_Equipo MODIFY partidos_empatados DEFAULT 0;

-- ============================================================
-- CUMPLIMIENTO DE RESTRICCIONES DE CONSTRUCCION: AUTO INCREMENT
-- ============================================================

DECLARE
    l_start INTEGER;
BEGIN
    SELECT NVL(MAX(Id_Persona), 0) + 1 INTO l_start FROM Persona;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_PERSONA START WITH ' || l_start || ' INCREMENT BY 1';

    SELECT NVL(MAX(Id_Equipo), 0) + 1 INTO l_start FROM Equipo;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_EQUIPO START WITH ' || l_start || ' INCREMENT BY 1';

    SELECT NVL(MAX(Id_Torneo), 0) + 1 INTO l_start FROM Torneo;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_TORNEO START WITH ' || l_start || ' INCREMENT BY 1';

    SELECT NVL(MAX(Id_Estadio), 0) + 1 INTO l_start FROM Estadio;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_ESTADIO START WITH ' || l_start || ' INCREMENT BY 1';

    SELECT NVL(MAX(Id_Patrocinador), 0) + 1 INTO l_start FROM Patrocinador;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_PATROCINADOR START WITH ' || l_start || ' INCREMENT BY 1';

    SELECT NVL(MAX(Id_Inscripcion), 0) + 1 INTO l_start FROM Inscripcion;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_INSCRIPCION START WITH ' || l_start || ' INCREMENT BY 1';

    SELECT NVL(MAX(Id_Partido), 0) + 1 INTO l_start FROM Partido;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_PARTIDO START WITH ' || l_start || ' INCREMENT BY 1';

    SELECT NVL(MAX(Id_Estadistica), 0) + 1 INTO l_start FROM Estadistica_Equipo;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_ESTADISTICA_EQUIPO START WITH ' || l_start || ' INCREMENT BY 1';
END;
/

-- Triggers de asignacion (AUTO INCREMENT)
CREATE OR REPLACE TRIGGER TRG_AI_PERSONA
BEFORE INSERT ON Persona FOR EACH ROW
BEGIN IF :NEW.Id_Persona IS NULL THEN :NEW.Id_Persona := SEQ_PERSONA.NEXTVAL; END IF; END;
/
CREATE OR REPLACE TRIGGER TRG_AI_EQUIPO
BEFORE INSERT ON Equipo FOR EACH ROW
BEGIN IF :NEW.Id_Equipo IS NULL THEN :NEW.Id_Equipo := SEQ_EQUIPO.NEXTVAL; END IF; END;
/
CREATE OR REPLACE TRIGGER TRG_AI_TORNEO
BEFORE INSERT ON Torneo FOR EACH ROW
BEGIN IF :NEW.Id_Torneo IS NULL THEN :NEW.Id_Torneo := SEQ_TORNEO.NEXTVAL; END IF; END;
/
CREATE OR REPLACE TRIGGER TRG_AI_ESTADIO
BEFORE INSERT ON Estadio FOR EACH ROW
BEGIN IF :NEW.Id_Estadio IS NULL THEN :NEW.Id_Estadio := SEQ_ESTADIO.NEXTVAL; END IF; END;
/
CREATE OR REPLACE TRIGGER TRG_AI_PATROCINADOR
BEFORE INSERT ON Patrocinador FOR EACH ROW
BEGIN IF :NEW.Id_Patrocinador IS NULL THEN :NEW.Id_Patrocinador := SEQ_PATROCINADOR.NEXTVAL; END IF; END;
/
CREATE OR REPLACE TRIGGER TRG_AI_INSCRIPCION
BEFORE INSERT ON Inscripcion FOR EACH ROW
BEGIN IF :NEW.Id_Inscripcion IS NULL THEN :NEW.Id_Inscripcion := SEQ_INSCRIPCION.NEXTVAL; END IF; END;
/
CREATE OR REPLACE TRIGGER TRG_AI_PARTIDO
BEFORE INSERT ON Partido FOR EACH ROW
BEGIN IF :NEW.Id_Partido IS NULL THEN :NEW.Id_Partido := SEQ_PARTIDO.NEXTVAL; END IF; END;
/
CREATE OR REPLACE TRIGGER TRG_AI_ESTADISTICA_EQUIPO
BEFORE INSERT ON Estadistica_Equipo FOR EACH ROW
BEGIN IF :NEW.Id_Estadistica IS NULL THEN :NEW.Id_Estadistica := SEQ_ESTADISTICA_EQUIPO.NEXTVAL; END IF; END;
/

-- ========================================================================

-- persona
CREATE OR REPLACE TRIGGER TRG_MANTENER_PERSONA
BEFORE INSERT OR UPDATE ON Persona
FOR EACH ROW
DECLARE
    v_edad NUMBER;
BEGIN
    v_edad := MONTHS_BETWEEN(SYSDATE, :NEW.Fecha_nacimiento) / 12;
    IF v_edad < 17 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Error: La persona debe tener al menos 17 años para registrarse en el sistema.');
    END IF;

    IF UPDATING AND :OLD.DNI <> :NEW.DNI THEN
        RAISE_APPLICATION_ERROR(-20003, 'Error: El DNI es un identificador legal inmutable y no puede ser modificado.');
    END IF;
END;
/

-- jugador
CREATE OR REPLACE TRIGGER TRG_ADICIONAR_JUGADOR
BEFORE INSERT OR UPDATE ON Jugador
FOR EACH ROW
DECLARE
    v_conteo_tec NUMBER;
    v_conteo_arb NUMBER;
    v_conteo_org NUMBER;
    v_conteo_rep NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_conteo_tec FROM Tecnico WHERE id_Persona = :NEW.id_Persona;
    SELECT COUNT(*) INTO v_conteo_arb FROM Arbitro WHERE id_Persona = :NEW.id_Persona;
    SELECT COUNT(*) INTO v_conteo_org FROM Organizador WHERE id_Persona = :NEW.id_Persona;
    SELECT COUNT(*) INTO v_conteo_rep FROM Representante WHERE id_Persona = :NEW.id_Persona;

    IF v_conteo_tec > 0 OR v_conteo_arb > 0 OR v_conteo_org > 0 OR v_conteo_rep > 0 THEN
        RAISE_APPLICATION_ERROR(-20030, 'Error: Conflicto de intereses. Esta persona ya tiene un rol activo en el sistema.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_ELIMINAR_JUGADOR
BEFORE DELETE ON Jugador
FOR EACH ROW
DECLARE
    v_historial_equipo NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO v_historial_equipo
    FROM Partido
    WHERE Id_EquipoLocal = :OLD.Id_Equipo 
       OR Id_EquipoVisitante = :OLD.Id_Equipo;

    IF v_historial_equipo > 0 THEN
        RAISE_APPLICATION_ERROR(-20031, 'Error: No se puede eliminar al jugador. Su equipo ya tiene un historial de partidos registrados en el sistema.');
    END IF;
END;
/

-- tecnico
CREATE OR REPLACE TRIGGER TRG_MODIFICAR_TECNICO
BEFORE UPDATE ON Tecnico
FOR EACH ROW
BEGIN
    IF :OLD.Id_Equipo <> :NEW.Id_Equipo THEN
        RAISE_APPLICATION_ERROR(-20020, 'Error: No se puede cambiar de equipo directamente. Debe eliminar el registro y crear uno nuevo para el nuevo equipo.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_ELIMINAR_TECNICO
BEFORE DELETE ON Tecnico
FOR EACH ROW
DECLARE
    v_partidos_equipo NUMBER := 0;
BEGIN
    IF :OLD.Rol = 'Principal' THEN
        
        SELECT COUNT(*) INTO v_partidos_equipo
        FROM Partido 
        WHERE (Id_EquipoLocal = :OLD.Id_Equipo OR Id_EquipoVisitante = :OLD.Id_Equipo)
        AND estado IN ('Pendiente', 'En curso', 'Cancelado', 'Aplazado');

        IF v_partidos_equipo > 0 THEN
            RAISE_APPLICATION_ERROR(-20021, 'Error: No se puede eliminar al DT Principal. Su equipo tiene partidos pendientes o aplazados en el calendario.');
        END IF;
        
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_ADICIONAR_TECNICO
BEFORE INSERT OR UPDATE ON Tecnico
FOR EACH ROW
DECLARE
    v_conteo_jug NUMBER;
    v_conteo_arb NUMBER;
    v_conteo_org NUMBER;
    v_conteo_rep NUMBER;
    v_edad NUMBER;
BEGIN
    SELECT MONTHS_BETWEEN(SYSDATE, Fecha_nacimiento) / 12 INTO v_edad FROM Persona WHERE Id_Persona = :NEW.id_Persona;
    IF v_edad < 18 THEN
        RAISE_APPLICATION_ERROR(-20033, 'Error: Legalmente, un Tecnico debe ser mayor de edad (18+ anios).');
    END IF;

    SELECT COUNT(*) INTO v_conteo_jug FROM Jugador WHERE id_Persona = :NEW.id_Persona;
    SELECT COUNT(*) INTO v_conteo_arb FROM Arbitro WHERE id_Persona = :NEW.id_Persona;
    SELECT COUNT(*) INTO v_conteo_org FROM Organizador WHERE id_Persona = :NEW.id_Persona;
    SELECT COUNT(*) INTO v_conteo_rep FROM Representante WHERE id_Persona = :NEW.id_Persona;

    IF v_conteo_jug > 0 OR v_conteo_arb > 0 OR v_conteo_org > 0 OR v_conteo_rep > 0 THEN
        RAISE_APPLICATION_ERROR(-20030, 'Error: Conflicto de intereses. Esta persona ya tiene un rol activo en el sistema.');
    END IF;
END;
/

-- arbitro
CREATE OR REPLACE TRIGGER TRG_ADICIONAR_ARBITRO
BEFORE INSERT OR UPDATE ON Arbitro
FOR EACH ROW
DECLARE
    v_conteo_jug NUMBER;
    v_conteo_tec NUMBER;
    v_conteo_org NUMBER;
    v_conteo_rep NUMBER;
    v_edad NUMBER;
BEGIN
    SELECT MONTHS_BETWEEN(SYSDATE, Fecha_nacimiento) / 12 INTO v_edad FROM Persona WHERE Id_Persona = :NEW.id_Persona;
        IF v_edad < 18 THEN
            RAISE_APPLICATION_ERROR(-20033, 'Error: Legalmente, un Arbitro debe ser mayor de edad (18+).');
        END IF;

    SELECT COUNT(*) INTO v_conteo_jug FROM Jugador WHERE id_Persona = :NEW.id_Persona;
    SELECT COUNT(*) INTO v_conteo_tec FROM Tecnico WHERE id_Persona = :NEW.id_Persona;
    SELECT COUNT(*) INTO v_conteo_org FROM Organizador WHERE id_Persona = :NEW.id_Persona;
    SELECT COUNT(*) INTO v_conteo_rep FROM Representante WHERE id_Persona = :NEW.id_Persona;

    IF v_conteo_jug > 0 OR v_conteo_tec > 0 OR v_conteo_org > 0 OR v_conteo_rep > 0 THEN
        RAISE_APPLICATION_ERROR(-20030, 'Error: Conflicto de intereses. Esta persona ya tiene un rol activo en el sistema.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_ELIMINAR_ARBITRO
BEFORE DELETE ON Arbitro
FOR EACH ROW
DECLARE
    v_partidos NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO v_partidos
    FROM Arbitro_Partido
    WHERE Id_Persona = :OLD.Id_Persona;

    IF v_partidos > 0 THEN
        RAISE_APPLICATION_ERROR(-20032, 'Error: No se puede eliminar a este árbitro porque ya ha sido asignado a partidos en el torneo.');
    END IF;
END;
/


-- representante
CREATE OR REPLACE TRIGGER TRG_ADICIONAR_REPRESENTANTE
BEFORE INSERT OR UPDATE ON Representante
FOR EACH ROW
DECLARE
    v_conteo_jug NUMBER;
    v_conteo_tec NUMBER;
    v_conteo_arb NUMBER;
    v_conteo_org NUMBER;
    v_edad NUMBER;
BEGIN
    SELECT MONTHS_BETWEEN(SYSDATE, Fecha_nacimiento) / 12 INTO v_edad FROM Persona WHERE Id_Persona = :NEW.id_Persona;
    IF v_edad < 18 THEN
        RAISE_APPLICATION_ERROR(-20034, 'Error: Legalmente, un Representante debe ser mayor de edad (18+).');
    END IF;

    SELECT COUNT(*) INTO v_conteo_jug FROM Jugador WHERE id_Persona = :NEW.id_Persona;
    SELECT COUNT(*) INTO v_conteo_tec FROM Tecnico WHERE id_Persona = :NEW.id_Persona;
    SELECT COUNT(*) INTO v_conteo_arb FROM Arbitro WHERE id_Persona = :NEW.id_Persona;
    SELECT COUNT(*) INTO v_conteo_org FROM Organizador WHERE id_Persona = :NEW.id_Persona;

    IF v_conteo_jug > 0 OR v_conteo_tec > 0 OR v_conteo_arb > 0 OR v_conteo_org > 0 THEN
        RAISE_APPLICATION_ERROR(-20030, 'Error: Conflicto de intereses. Esta persona ya tiene un rol activo en el sistema.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_ELIMINAR_REPRESENTANTE
BEFORE DELETE ON Representante
FOR EACH ROW
DECLARE
    v_partidos_activos NUMBER;
BEGIN
    
    SELECT COUNT(*) INTO v_partidos_activos 
    FROM Partido 
    WHERE (Id_EquipoLocal = :OLD.Id_Equipo OR Id_EquipoVisitante = :OLD.Id_Equipo)
    AND estado IN ('Pendiente', 'Aplazado','En curso');
    
    IF v_partidos_activos > 0 THEN
        RAISE_APPLICATION_ERROR(-20040, 'No se puede eliminar al único representante de un equipo con compromisos pendientes.');
    END IF;
END;
/

-- organizador
CREATE OR REPLACE TRIGGER TRG_ADICIONAR_ORGANIZADOR
BEFORE INSERT OR UPDATE ON Organizador
FOR EACH ROW
DECLARE
    v_conteo_jug NUMBER;
    v_conteo_tec NUMBER;
    v_conteo_arb NUMBER;
    v_conteo_rep NUMBER;
    v_edad NUMBER;
BEGIN
    SELECT MONTHS_BETWEEN(SYSDATE, Fecha_nacimiento) / 12 INTO v_edad FROM Persona WHERE Id_Persona = :NEW.id_Persona;
    IF v_edad < 18 THEN
        RAISE_APPLICATION_ERROR(-20035, 'Error: Legalmente, un Organizador debe ser mayor de edad (18+).');
    END IF;

    SELECT COUNT(*) INTO v_conteo_jug FROM Jugador WHERE id_Persona = :NEW.id_Persona;
    SELECT COUNT(*) INTO v_conteo_tec FROM Tecnico WHERE id_Persona = :NEW.id_Persona;
    SELECT COUNT(*) INTO v_conteo_arb FROM Arbitro WHERE id_Persona = :NEW.id_Persona;
    SELECT COUNT(*) INTO v_conteo_rep FROM Representante WHERE id_Persona = :NEW.id_Persona;

    IF v_conteo_jug > 0 OR v_conteo_tec > 0 OR v_conteo_arb > 0 OR v_conteo_rep > 0 THEN
        RAISE_APPLICATION_ERROR(-20030, 'Error: Conflicto de intereses. Esta persona ya tiene un rol activo en el sistema.');
    END IF;
END;
/

-- Bloquear eliminacion si tiene responsabilidad
CREATE OR REPLACE TRIGGER TRG_ELIMINAR_ORGANIZADOR
BEFORE DELETE ON Organizador
FOR EACH ROW
DECLARE
    v_torneos_activos NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_torneos_activos 
    FROM Torneo_Organizador 
    WHERE Id_Persona = :OLD.Id_Persona;
    IF v_torneos_activos > 0 THEN
        RAISE_APPLICATION_ERROR(-20036, 'Error: No se puede eliminar al Organizador porque tiene torneos bajo su responsabilidad.');
    END IF;
END;
/

-- inscripcion
CREATE OR REPLACE TRIGGER TRG_ADICIONAR_INSCRIPCION
BEFORE INSERT ON Inscripcion
FOR EACH ROW
DECLARE
    v_estado_torneo VARCHAR2(20);
BEGIN
    SELECT estado INTO v_estado_torneo FROM Torneo WHERE Id_Torneo = :NEW.Id_Torneo;
    
    IF v_estado_torneo <> 'Programado' THEN
        RAISE_APPLICATION_ERROR(-20050, 'Error: No se permiten inscripciones en torneos que ya están en curso o finalizados.');
    END IF;
    -- Estado y Fecha_solicitud son manejados por el constraint DEFAULT de la tabla
END;
/

CREATE OR REPLACE TRIGGER TRG_MODIFICAR_INSCRIPCION
BEFORE UPDATE ON Inscripcion
FOR EACH ROW
DECLARE
    v_jugadores NUMBER;
BEGIN
    IF :OLD.Id_Equipo <> :NEW.Id_Equipo OR :OLD.Id_Torneo <> :NEW.Id_Torneo THEN
        RAISE_APPLICATION_ERROR(-20051, 'Error: No es posible transferir una inscripcion a otro equipo o torneo.');
    END IF;

    IF :OLD.Estado <> 'Pendiente' AND :OLD.Estado <> :NEW.Estado THEN
        RAISE_APPLICATION_ERROR(-20052, 'Error: Esta inscripcion ya ha sido procesada y no permite cambios adicionales.');
    END IF;

    IF :NEW.Estado = 'Aceptada' THEN
        SELECT COUNT(*) INTO v_jugadores FROM Jugador WHERE Id_Equipo = :NEW.Id_Equipo;

        IF v_jugadores < 11 THEN
            RAISE_APPLICATION_ERROR(-20055, 'Error: El equipo debe tener minimo 11 jugadores registrados para que su inscripcion sea aceptada.');
        END IF;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_ELIMINAR_INSCRIPCION
BEFORE DELETE ON Inscripcion
FOR EACH ROW
BEGIN
    IF :OLD.Estado = 'Aceptada' THEN
        RAISE_APPLICATION_ERROR(-20053, 'Error: No se pueden eliminar inscripciones que ya fueron aceptadas.');
    END IF;
END;
/

-- estadistica aquipo
CREATE OR REPLACE TRIGGER TRG_ADICIONAR_ESTADISITICA_EQUIPO
AFTER UPDATE ON Inscripcion
FOR EACH ROW
BEGIN
    IF :OLD.Estado = 'Pendiente' AND :NEW.Estado = 'Aceptada' THEN
        
        INSERT INTO Estadistica_Equipo (Id_Estadistica, Id_Equipo, Id_Torneo) 
            VALUES (SEQ_ESTADISTICA_EQUIPO.NEXTVAL, :NEW.Id_Equipo, :NEW.Id_Torneo);
    END IF;
END;
/

-- equipo
CREATE OR REPLACE TRIGGER TRG_MODIFICAR_EQUIPO
BEFORE UPDATE ON Equipo
FOR EACH ROW
DECLARE
    v_conteo_partidos NUMBER;
BEGIN
    IF :OLD.nombre_oficial <> :NEW.nombre_oficial THEN
        SELECT COUNT(*) INTO v_conteo_partidos
        FROM Partido
        WHERE (Id_EquipoLocal = :OLD.Id_Equipo OR Id_EquipoVisitante = :OLD.Id_Equipo)
        AND estado IN ('Pendiente', 'Aplazado', 'En curso');

        IF v_conteo_partidos > 0 THEN
            RAISE_APPLICATION_ERROR(-20060, 'Error: No se puede modificar el nombre oficial mientras existan partidos pendientes o aplazados.');
        END IF;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_ELIMINAR_EQUIPO
BEFORE DELETE ON Equipo
FOR EACH ROW
DECLARE
    v_conteo_partidos NUMBER;
    v_conteo_inscrip NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_conteo_inscrip
    FROM Inscripcion
    WHERE Id_Equipo = :OLD.Id_Equipo AND Estado = 'Aceptada';
    
    SELECT COUNT(*) INTO v_conteo_partidos
    FROM Partido
    WHERE (Id_EquipoLocal = :OLD.Id_Equipo OR Id_EquipoVisitante = :OLD.Id_Equipo)
    AND estado IN ('Pendiente', 'Jugado');

    IF v_conteo_inscrip > 0 OR v_conteo_partidos > 0 THEN
        RAISE_APPLICATION_ERROR(-20061, 'Error: El equipo no puede eliminarse porque tiene inscripciones aceptadas o registros en el historial de partidos.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_EQUIPO_VALIDAR_FECHA
BEFORE INSERT OR UPDATE ON Equipo
FOR EACH ROW
BEGIN
    IF :NEW.fecha_fundacion > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20062, 'Error: La fecha de fundación no puede ser una fecha futura.');
    END IF;
END;
/

-- patrocinadores
CREATE OR REPLACE TRIGGER TRG_MODIFICAR_PATROCINADOR
BEFORE UPDATE ON Patrocinador
FOR EACH ROW
BEGIN
    IF :OLD.NIT <> :NEW.NIT THEN
        RAISE_APPLICATION_ERROR(-20070, 'Error: El NIT es inmutable por ser el identificador legal de la empresa.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_ELIMINAR_PATROCINADOR
BEFORE DELETE ON Patrocinador
FOR EACH ROW
DECLARE
    v_activos NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO v_activos
    FROM Torneo_Patrocinador tp
    JOIN Torneo t ON tp.Id_Torneo = t.Id_Torneo
    WHERE tp.Id_Patrocinador = :OLD.Id_Patrocinador
    AND t.estado = 'En curso';

    IF v_activos > 0 THEN
        RAISE_APPLICATION_ERROR(-20071, 'Error: No se puede eliminar. El patrocinador tiene un contrato vigente en un torneo EN CURSO.');
    END IF;

    SELECT COUNT(*) INTO v_activos
    FROM Equipo_Patrocinador ep
    JOIN Inscripcion i ON ep.Id_Equipo = i.Id_Equipo
    JOIN Torneo t ON i.Id_Torneo = t.Id_Torneo
    WHERE ep.Id_Patrocinador = :OLD.Id_Patrocinador
    AND i.Estado = 'Aceptada'
    AND t.estado = 'En curso';

    IF v_activos > 0 THEN
        RAISE_APPLICATION_ERROR(-20072, 'Error: No se puede eliminar. El patrocinador está vinculado a un equipo con participación deportiva ACTIVA.');
    END IF;
END;
/

-- estadio
CREATE OR REPLACE TRIGGER TRG_ELIMINAR_ESTADIO
BEFORE DELETE ON Estadio
FOR EACH ROW
DECLARE
    v_partidos_activos NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_partidos_activos
    FROM Partido
    WHERE Id_Estadio = :OLD.Id_Estadio
    AND estado IN ('Pendiente', 'Aplazado', 'Jugado','En curso');

    IF v_partidos_activos > 0 THEN
        RAISE_APPLICATION_ERROR(-20081, 'Error: No se puede eliminar el estadio. Existen partidos pendientes, aplazados o registrados en el historial.');
    END IF;
END;
/

-- partido
CREATE OR REPLACE TRIGGER TRG_INSERTAR_PARTIDO
BEFORE INSERT ON Partido
FOR EACH ROW
DECLARE
    v_torneo NUMBER;
    v_inicio_t DATE;
    v_fin_t DATE;
    v_estado_t VARCHAR2(20);
    v_aceptados NUMBER;
BEGIN
    v_torneo := :NEW.Id_Torneo;
    
    SELECT Fecha_Inicio, Fecha_Fin, estado INTO v_inicio_t, v_fin_t, v_estado_t
    FROM Torneo WHERE Id_Torneo = v_torneo;
    
    IF v_estado_t = 'Finalizado' THEN
        RAISE_APPLICATION_ERROR(-20302, 'Error: El torneo ya est� finalizado. No se pueden programar nuevos partidos.');
    END IF;

    IF :NEW.fecha_hora < v_inicio_t OR :NEW.fecha_hora > v_fin_t THEN
        RAISE_APPLICATION_ERROR(-20090, 'Error: La fecha del partido está fuera del rango de fechas del torneo.');
    END IF;

    SELECT COUNT(*) INTO v_aceptados FROM Inscripcion 
    WHERE Id_Torneo = v_torneo AND Estado = 'Aceptada'
    AND Id_Equipo IN (:NEW.Id_EquipoLocal, :NEW.Id_EquipoVisitante);

    IF v_aceptados < 2 THEN
        RAISE_APPLICATION_ERROR(-20091, 'Error: Uno o ambos equipos no cuentan con una inscripción Aceptada para este torneo.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_MODIFICAR_PARTIDO
BEFORE UPDATE ON Partido
FOR EACH ROW
BEGIN
    IF :OLD.Id_EquipoLocal <> :NEW.Id_EquipoLocal OR :OLD.Id_EquipoVisitante <> :NEW.Id_EquipoVisitante THEN
        RAISE_APPLICATION_ERROR(-20092, 'Error: Los equipos rivales no pueden ser modificados.');
    END IF;

    IF :NEW.estado NOT IN ('En curso', 'Jugado') AND (:NEW.goles_local > 0 OR :NEW.goles_visitante > 0) THEN
         RAISE_APPLICATION_ERROR(-20093, 'Error: Un partido que no está "En curso" o "Jugado" no puede tener goles registrados.');
    END IF;
    
    IF :OLD.estado = 'Jugado' AND :NEW.estado <> 'Jugado' THEN
         RAISE_APPLICATION_ERROR(-20095, 'Error: Un partido oficial (Jugado) no puede revertir su estado. Si hay un error, contacte al soporte para hacer un ajuste manual de estadísticas.');
    END IF;

    IF :OLD.estado = 'Jugado' AND (:OLD.goles_local <> :NEW.goles_local OR :OLD.goles_visitante <> :NEW.goles_visitante) THEN
        RAISE_APPLICATION_ERROR(-20096, 'Error: partido jugado no se puede modificar.');
    END IF;

END;
/

CREATE OR REPLACE TRIGGER TRG_ELIMINAR_PARTIDO
BEFORE DELETE ON Partido
FOR EACH ROW
BEGIN
    IF :OLD.estado = 'Jugado' THEN
        RAISE_APPLICATION_ERROR(-20094, 'Error: Un partido con resultado oficial (Jugado) no puede ser eliminado del sistema.');
    END IF;
END;
/

-- Estadistica equipo
CREATE OR REPLACE TRIGGER TRG_MODIFICAR_ESTADISTICA_EQUIPO_PARTIDO
AFTER UPDATE ON Partido
FOR EACH ROW
DECLARE
    v_id_torneo NUMBER;
BEGIN
    IF :OLD.estado <> 'Jugado' AND :NEW.estado = 'Jugado' THEN
        

        v_id_torneo := :NEW.Id_Torneo;
        
        IF :NEW.goles_local > :NEW.goles_visitante THEN
       
            UPDATE Estadistica_Equipo 
            SET puntos = puntos + 3, partidos_ganados = partidos_ganados + 1,
                goles_favor = goles_favor + :NEW.goles_local, goles_contra = goles_contra + :NEW.goles_visitante
            WHERE Id_Equipo = :NEW.Id_EquipoLocal AND Id_Torneo = v_id_torneo;
            
        
            UPDATE Estadistica_Equipo 
            SET partidos_perdidos = partidos_perdidos + 1,
                goles_favor = goles_favor + :NEW.goles_visitante, goles_contra = goles_contra + :NEW.goles_local
            WHERE Id_Equipo = :NEW.Id_EquipoVisitante AND Id_Torneo = v_id_torneo;

        ELSIF :NEW.goles_local < :NEW.goles_visitante THEN
         
            UPDATE Estadistica_Equipo 
            SET puntos = puntos + 3, partidos_ganados = partidos_ganados + 1,
                goles_favor = goles_favor + :NEW.goles_visitante, goles_contra = goles_contra + :NEW.goles_local
            WHERE Id_Equipo = :NEW.Id_EquipoVisitante AND Id_Torneo = v_id_torneo;
            
        
            UPDATE Estadistica_Equipo 
            SET partidos_perdidos = partidos_perdidos + 1,
                goles_favor = goles_favor + :NEW.goles_local, goles_contra = goles_contra + :NEW.goles_visitante
            WHERE Id_Equipo = :NEW.Id_EquipoLocal AND Id_Torneo = v_id_torneo;

        ELSE
            UPDATE Estadistica_Equipo
            SET puntos = puntos + 1, partidos_empatados = partidos_empatados + 1,
                goles_favor = goles_favor + :NEW.goles_local,
                goles_contra = goles_contra + :NEW.goles_visitante
            WHERE Id_Equipo = :NEW.Id_EquipoLocal AND Id_Torneo = v_id_torneo;

            UPDATE Estadistica_Equipo
            SET puntos = puntos + 1, partidos_empatados = partidos_empatados + 1,
                goles_favor = goles_favor + :NEW.goles_visitante,
                goles_contra = goles_contra + :NEW.goles_local
            WHERE Id_Equipo = :NEW.Id_EquipoVisitante AND Id_Torneo = v_id_torneo;
        END IF;

    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_MODIFICAR_ESTADISTICA_EQUIPO
BEFORE UPDATE ON Estadistica_Equipo
FOR EACH ROW
BEGIN
    IF :OLD.Id_Equipo <> :NEW.Id_Equipo OR :OLD.Id_Torneo <> :NEW.Id_Torneo THEN
        RAISE_APPLICATION_ERROR(-20111, 'Error: No se permite la reasignación de estadísticas. Los identificadores de Equipo y Torneo son inmutables.');
    END IF;
END;
/

-- NUEVO SE MODIFICO ANTES DIRECTAMENTE NO DEBAJA
CREATE OR REPLACE TRIGGER TRG_ELIMINAR_ESTADISTICA_EQUIPO
BEFORE DELETE ON Estadistica_Equipo
FOR EACH ROW
BEGIN
    -- Si la suma de partidos jugados es mayor a 0, prohibimos el borrado.
    IF (:OLD.partidos_ganados + :OLD.partidos_perdidos + :OLD.partidos_empatados) > 0 THEN
        RAISE_APPLICATION_ERROR(-20110, 'Error: No se puede eliminar el registro. El equipo ya tiene partidos contabilizados en este torneo.');
    END IF;
END;
/

-- torneo
CREATE OR REPLACE TRIGGER TRG_INSERTAR_TORNEO
BEFORE INSERT ON Torneo
FOR EACH ROW
BEGIN
    IF :NEW.Fecha_Inicio < TRUNC(SYSDATE) THEN
        RAISE_APPLICATION_ERROR(-20206, 'Error: La fecha de inicio no puede ser anterior a la fecha actual.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_MODIFICAR_TORNEO
BEFORE UPDATE ON Torneo
FOR EACH ROW
DECLARE
    v_conteo_equipos NUMBER;
BEGIN

    IF :OLD.Estado <> 'Programado' AND :OLD.Fecha_Inicio <> :NEW.Fecha_Inicio THEN
        RAISE_APPLICATION_ERROR(-20201, 'Error: No se puede modificar la fecha de inicio de un torneo que ya empez�.');
    END IF;

    -- permitir aplazar el torneo
    IF :OLD.Estado = 'En curso' AND :NEW.Fecha_Fin < :OLD.Fecha_Fin THEN
        RAISE_APPLICATION_ERROR(-20206, 'Error: Un torneo en curso solo permite aplazar su fecha de fin (extenderla), no acortarla.');
    END IF;

    IF :OLD.Estado = 'Finalizado' AND (:OLD.Fecha_Inicio <> :NEW.Fecha_Inicio OR :OLD.Fecha_Fin <> :NEW.Fecha_Fin) THEN
        RAISE_APPLICATION_ERROR(-20207, 'Error: No se pueden alterar las fechas de un torneo ya finalizado.');
    END IF;

    -- Progresividad de estados (No saltar de Programado a Finalizado)
    IF :OLD.Estado = 'Programado' AND :NEW.Estado = 'Finalizado' THEN
        RAISE_APPLICATION_ERROR(-20202, 'Error: Un torneo debe pasar al estado "En curso" antes de poder finalizarlo.');
    END IF;
    
    -- No reabrir torneos finalizados
    IF :OLD.Estado = 'Finalizado' AND :NEW.Estado <> 'Finalizado' THEN
        RAISE_APPLICATION_ERROR(-20203, 'Error: No es posible reabrir un torneo que ya ha sido finalizado.');
    END IF;

    -- minimo de equipos para iniciar el torneo
    IF :OLD.estado = 'Programado' AND :NEW.estado = 'En curso' THEN
        SELECT COUNT(*) INTO v_conteo_equipos 
        FROM Inscripcion
        WHERE Id_Torneo = :NEW.Id_Torneo 
        AND Estado = 'Aceptada';

        IF v_conteo_equipos < 4 THEN
            RAISE_APPLICATION_ERROR(-20105, 'Error de Quorum: Se requieren minimo 4 equipos aceptados para poder iniciar el torneo.');
        END IF;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_ELIMINAR_TORNEO
BEFORE DELETE ON Torneo
FOR EACH ROW
BEGIN
    IF :OLD.Estado <> 'Programado' THEN
        RAISE_APPLICATION_ERROR(-20204, 'Error: Solo se pueden eliminar torneos que permanezcan en estado "Programado".');
    END IF;
END;
/

-- fase
CREATE OR REPLACE TRIGGER TRG_ADICIONAR_FASE
BEFORE INSERT ON Fase
FOR EACH ROW
DECLARE
    v_estado VARCHAR2(20);
BEGIN
    SELECT Estado INTO v_estado FROM Torneo WHERE Id_Torneo = :NEW.Id_Torneo;
    IF v_estado = 'Finalizado' THEN
        RAISE_APPLICATION_ERROR(-20085, 'Error: No se pueden añadir fases a un torneo que ya ha finalizado.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_MODIFICAR_FASE
BEFORE UPDATE ON Fase
FOR EACH ROW
DECLARE
    v_estado VARCHAR2(20);
BEGIN
    IF :OLD.Id_Torneo <> :NEW.Id_Torneo THEN
        RAISE_APPLICATION_ERROR(-20086, 'Error: No se permite cambiar el torneo asociado a una fase.');
    END IF;
    
    SELECT Estado INTO v_estado FROM Torneo WHERE Id_Torneo = :NEW.Id_Torneo;
    IF v_estado = 'Finalizado' THEN
        RAISE_APPLICATION_ERROR(-20087, 'Error: No se pueden modificar las fases de un torneo finalizado.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_ELIMINAR_FASE
BEFORE DELETE ON Fase
FOR EACH ROW
DECLARE
    v_partidos NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_partidos FROM Partido 
    WHERE Id_Torneo = :OLD.Id_Torneo AND nombre_fase = :OLD.nombre_fase;
    IF v_partidos > 0 THEN
        RAISE_APPLICATION_ERROR(-20088, 'Error: No se puede eliminar la fase porque ya tiene partidos registrados en ella.');
    END IF;
END;
/