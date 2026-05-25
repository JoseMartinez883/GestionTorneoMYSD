-- ========================================================================
-- ESPECIFICACIONES DE LOS DISPARADORES (TRIGGERS) - CICLO 2
-- ========================================================================

-- ============================================================
-- CUMPLIMIENTO DE RESTRICCIONES DE CONSTRUCCION: DEFAULT
-- ============================================================
ALTER TABLE Factura MODIFY Estado DEFAULT 'Pendiente';
ALTER TABLE Factura MODIFY Fecha_Emision DEFAULT SYSDATE;
ALTER TABLE Pago MODIFY Fecha_Pago DEFAULT SYSDATE;
ALTER TABLE Estadistica_Jugador MODIFY Goles DEFAULT 0;
ALTER TABLE Estadistica_Jugador MODIFY Asistencias DEFAULT 0;
ALTER TABLE Estadistica_Jugador MODIFY Tarjetas_Amarillas DEFAULT 0;
ALTER TABLE Estadistica_Jugador MODIFY Tarjetas_Rojas DEFAULT 0;
ALTER TABLE Estadistica_Jugador MODIFY Partidos_Jugados DEFAULT 0;
ALTER TABLE Incidencia MODIFY Minuto DEFAULT 0;

-- ============================================================
-- CUMPLIMIENTO DE RESTRICCIONES DE CONSTRUCCION: AUTO INCREMENT
-- ============================================================

DECLARE
    l_start INTEGER;
BEGIN
    SELECT NVL(MAX(Id_Nomina), 0) + 1 INTO l_start FROM Nomina;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_NOMINA START WITH ' || l_start || ' INCREMENT BY 1';

    SELECT NVL(MAX(Id_Incidencia), 0) + 1 INTO l_start FROM Incidencia;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_INCIDENCIA START WITH ' || l_start || ' INCREMENT BY 1';

    SELECT NVL(MAX(Id_Resolucion), 0) + 1 INTO l_start FROM Resolucion;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_RESOLUCION START WITH ' || l_start || ' INCREMENT BY 1';

    SELECT NVL(MAX(Id_Estadistica), 0) + 1 INTO l_start FROM Estadistica_Jugador;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_ESTADISTICA_JUGADOR START WITH ' || l_start || ' INCREMENT BY 1';

    SELECT NVL(MAX(Id_Tarifa), 0) + 1 INTO l_start FROM Tarifa;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_TARIFA START WITH ' || l_start || ' INCREMENT BY 1';

    SELECT NVL(MAX(Id_Factura), 0) + 1 INTO l_start FROM Factura;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_FACTURA START WITH ' || l_start || ' INCREMENT BY 1';

    SELECT NVL(MAX(Id_Pago), 0) + 1 INTO l_start FROM Pago;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_PAGO START WITH ' || l_start || ' INCREMENT BY 1';
END;
/

-- Triggers para activar el Auto Incremento
CREATE OR REPLACE TRIGGER TRG_AI_NOMINA
BEFORE INSERT ON Nomina
FOR EACH ROW
BEGIN
    IF :NEW.Id_Nomina IS NULL THEN
        SELECT SEQ_NOMINA.NEXTVAL INTO :NEW.Id_Nomina FROM DUAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_AI_INCIDENCIA
BEFORE INSERT ON Incidencia
FOR EACH ROW
BEGIN
    IF :NEW.Id_Incidencia IS NULL THEN
        SELECT SEQ_INCIDENCIA.NEXTVAL INTO :NEW.Id_Incidencia FROM DUAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_AI_RESOLUCION
BEFORE INSERT ON Resolucion
FOR EACH ROW
BEGIN
    IF :NEW.Id_Resolucion IS NULL THEN
        SELECT SEQ_RESOLUCION.NEXTVAL INTO :NEW.Id_Resolucion FROM DUAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_AI_ESTADISTICA_JUGADOR
BEFORE INSERT ON Estadistica_Jugador
FOR EACH ROW
BEGIN
    IF :NEW.Id_Estadistica IS NULL THEN
        SELECT SEQ_ESTADISTICA_JUGADOR.NEXTVAL INTO :NEW.Id_Estadistica FROM DUAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_AI_TARIFA
BEFORE INSERT ON Tarifa
FOR EACH ROW
BEGIN
    IF :NEW.Id_Tarifa IS NULL THEN
        SELECT SEQ_TARIFA.NEXTVAL INTO :NEW.Id_Tarifa FROM DUAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_AI_FACTURA
BEFORE INSERT ON Factura
FOR EACH ROW
BEGIN
    IF :NEW.Id_Factura IS NULL THEN
        SELECT SEQ_FACTURA.NEXTVAL INTO :NEW.Id_Factura FROM DUAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_AI_PAGO
BEFORE INSERT ON Pago
FOR EACH ROW
BEGIN
    IF :NEW.Id_Pago IS NULL THEN
        SELECT SEQ_PAGO.NEXTVAL INTO :NEW.Id_Pago FROM DUAL;
    END IF;
END;
/

-- ============================================================
-- 1. GESTION FINANCIERA (FACTURAS Y PAGOS)
-- ============================================================

-- TRG_INSERTAR_FACTURA: Automatiza el llenado del Total basado en Tarifa o Resolucion
CREATE OR REPLACE TRIGGER TRG_INSERTAR_FACTURA
BEFORE INSERT OR UPDATE ON Factura
FOR EACH ROW
DECLARE
    v_valor_tarifa NUMBER;
    v_valor_multa NUMBER;
BEGIN
    IF :NEW.Id_Inscripcion IS NOT NULL THEN
        SELECT Valor INTO v_valor_tarifa FROM Tarifa WHERE Id_Tarifa = :NEW.Id_Tarifa;
        :NEW.Total := v_valor_tarifa;
    ELSIF :NEW.Id_Resolucion IS NOT NULL THEN
        SELECT Multa_Monto INTO v_valor_multa FROM Resolucion WHERE Id_Resolucion = :NEW.Id_Resolucion;
        :NEW.Total := v_valor_multa;
    END IF;
END;
/

-- TRG_ELIMINAR_FACTURA: Evita borrar una factura que ya tiene pagos (historial)
CREATE OR REPLACE TRIGGER TRG_ELIMINAR_FACTURA
BEFORE DELETE ON Factura
FOR EACH ROW
DECLARE
    v_conteo_pagos NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_conteo_pagos FROM Pago WHERE Id_Factura = :OLD.Id_Factura;
    IF v_conteo_pagos > 0 THEN
        RAISE_APPLICATION_ERROR(-20095, 'Error Contable: No se puede eliminar una factura que ya tiene abonos registrados en el sistema.');
    END IF;
END;
/

-- TRG_INSERTAR_PAGO: Controla los abonos para no superar el total y cambia el estado de Factura
CREATE OR REPLACE TRIGGER TRG_INSERTAR_PAGO
BEFORE INSERT OR UPDATE ON Pago
FOR EACH ROW
DECLARE
    v_total_factura NUMBER;
    v_total_pagado NUMBER;
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    SELECT Total INTO v_total_factura FROM Factura WHERE Id_Factura = :NEW.Id_Factura;
    
    SELECT NVL(SUM(Monto), 0) INTO v_total_pagado FROM Pago WHERE Id_Factura = :NEW.Id_Factura;
    
    IF (v_total_pagado + :NEW.Monto) > v_total_factura THEN
        RAISE_APPLICATION_ERROR(-20096, 'Error Financiero: El abono supera el saldo total pendiente de la factura.');
    END IF;
    
    IF (v_total_pagado + :NEW.Monto) = v_total_factura THEN
        UPDATE Factura SET Estado = 'Pagada' WHERE Id_Factura = :NEW.Id_Factura;
        COMMIT;
    END IF;
END;
/

-- ============================================================
-- 2. GESTION DEPORTIVA (INSCRIPCIONES, NOMINAS E INCIDENCIAS)
-- ============================================================

-- TRG_MODIFICAR_INSCRIPCION_JUGADORES: Inicializa estadisticas masivamente cuando el equipo es Aceptado
CREATE OR REPLACE TRIGGER TRG_MODIFICAR_INSCRIPCION_JUG
AFTER UPDATE OF Estado ON Inscripcion
FOR EACH ROW
BEGIN
    IF :OLD.Estado <> 'Aceptada' AND :NEW.Estado = 'Aceptada' THEN
        FOR jugador_rec IN (SELECT Id_Jugador FROM Jugador WHERE Id_Equipo = :NEW.Id_Equipo) LOOP
            INSERT INTO Estadistica_Jugador (Id_Estadistica, Id_Jugador, Id_Torneo, Goles, Asistencias, Tarjetas_Amarillas, Tarjetas_Rojas, Partidos_Jugados)
            VALUES (SEQ_ESTADISTICA_JUGADOR.NEXTVAL, jugador_rec.Id_Jugador, :NEW.Id_Torneo, 0, 0, 0, 0, 0);
        END LOOP;
    END IF;
END;
/

-- TRG_INSERTAR_NOMINA: Valida que el jugador pertenezca a los equipos que estan jugando el partido
CREATE OR REPLACE TRIGGER TRG_INSERTAR_NOMINA
BEFORE INSERT OR UPDATE ON Nomina
FOR EACH ROW
DECLARE
    v_es_valido NUMBER;
BEGIN
    -- Consulta optimizada usando algebra relacional (JOINs)
    SELECT COUNT(*)
    INTO v_es_valido
    FROM Partido p
    JOIN Jugador j ON j.Id_Persona = :NEW.Id_Jugador
    WHERE p.Id_Partido = :NEW.Id_Partido
      AND (j.Id_Equipo = p.Id_EquipoLocal OR j.Id_Equipo = p.Id_EquipoVisitante);
      
    IF v_es_valido = 0 THEN
        RAISE_APPLICATION_ERROR(-20097, 'Error de Nomina: El jugador no pertenece ni al equipo local ni al equipo visitante de este partido.');
    END IF;
END;
/

-- TRG_INSERTAR_INCIDENCIA: Valida nominas y automatiza estadisticas
CREATE OR REPLACE TRIGGER TRG_INSERTAR_INCIDENCIA
BEFORE INSERT ON Incidencia
FOR EACH ROW
DECLARE
    v_conteo_nomina NUMBER;
    v_id_torneo NUMBER;
BEGIN
    -- Validar que no sea incidencia fantasma
    SELECT COUNT(*) INTO v_conteo_nomina FROM Nomina WHERE Id_Partido = :NEW.Id_Partido AND Id_Jugador = :NEW.Id_Jugador;
    IF v_conteo_nomina = 0 THEN
        RAISE_APPLICATION_ERROR(-20098, 'Error Deportivo: No se puede registrar incidencia a un jugador que no esta en el acta (Nomina) del partido.');
    END IF;

    -- Obtener torneo
    SELECT i.Id_Torneo INTO v_id_torneo 
    FROM Partido p
    JOIN Inscripcion i ON p.Id_EquipoLocal = i.Id_Equipo
    WHERE p.Id_Partido = :NEW.Id_Partido AND ROWNUM = 1;

    -- Actualizar estadistica automatica
    IF :NEW.Tipo = 'Gol' THEN
        UPDATE Estadistica_Jugador SET Goles = Goles + 1 WHERE Id_Jugador = :NEW.Id_Jugador AND Id_Torneo = v_id_torneo;
    ELSIF :NEW.Tipo = 'Asistencia' THEN
        UPDATE Estadistica_Jugador SET Asistencias = Asistencias + 1 WHERE Id_Jugador = :NEW.Id_Jugador AND Id_Torneo = v_id_torneo;
    ELSIF :NEW.Tipo = 'Amarilla' THEN
        UPDATE Estadistica_Jugador SET Tarjetas_Amarillas = Tarjetas_Amarillas + 1 WHERE Id_Jugador = :NEW.Id_Jugador AND Id_Torneo = v_id_torneo;
    ELSIF :NEW.Tipo = 'Roja' THEN
        UPDATE Estadistica_Jugador SET Tarjetas_Rojas = Tarjetas_Rojas + 1 WHERE Id_Jugador = :NEW.Id_Jugador AND Id_Torneo = v_id_torneo;
    END IF;
END;
/

-- TRG_ELIMINAR_INCIDENCIA: Reversa la estadistica contablemente si se anula
CREATE OR REPLACE TRIGGER TRG_ELIMINAR_INCIDENCIA
BEFORE DELETE ON Incidencia
FOR EACH ROW
DECLARE
    v_id_torneo NUMBER;
BEGIN
    SELECT i.Id_Torneo INTO v_id_torneo 
    FROM Partido p
    JOIN Inscripcion i ON p.Id_EquipoLocal = i.Id_Equipo
    WHERE p.Id_Partido = :OLD.Id_Partido AND ROWNUM = 1;

    IF :OLD.Tipo = 'Gol' THEN
        UPDATE Estadistica_Jugador SET Goles = Goles - 1 WHERE Id_Jugador = :OLD.Id_Jugador AND Id_Torneo = v_id_torneo;
    ELSIF :OLD.Tipo = 'Asistencia' THEN
        UPDATE Estadistica_Jugador SET Asistencias = Asistencias - 1 WHERE Id_Jugador = :OLD.Id_Jugador AND Id_Torneo = v_id_torneo;
    ELSIF :OLD.Tipo = 'Amarilla' THEN
        UPDATE Estadistica_Jugador SET Tarjetas_Amarillas = Tarjetas_Amarillas - 1 WHERE Id_Jugador = :OLD.Id_Jugador AND Id_Torneo = v_id_torneo;
    ELSIF :OLD.Tipo = 'Roja' THEN
        UPDATE Estadistica_Jugador SET Tarjetas_Rojas = Tarjetas_Rojas - 1 WHERE Id_Jugador = :OLD.Id_Jugador AND Id_Torneo = v_id_torneo;
    END IF;
END;
/
-- TRG_MODIFICAR_ESTADISTICA_JUGADOR: Inmutabilidad de los identificadores de la estadistica
CREATE OR REPLACE TRIGGER TRG_MODIFICAR_ESTADISTICA_JUG
BEFORE UPDATE ON Estadistica_Jugador
FOR EACH ROW
BEGIN
    IF :OLD.Id_Jugador <> :NEW.Id_Jugador OR :OLD.Id_Torneo <> :NEW.Id_Torneo THEN
        RAISE_APPLICATION_ERROR(-20101, 'Error: No se permite la reasignacion de estadisticas. Los identificadores de Jugador y Torneo son inmutables.');
    END IF;
END;
/

-- ============================================================
-- 3. CANDADOS DE SEGURIDAD E HISTORICIDAD AVANZADOS
-- ============================================================

-- TRG_MODIFICAR_PAGO: Los recibos de caja son inmutables
CREATE OR REPLACE TRIGGER TRG_MODIFICAR_PAGO
BEFORE UPDATE ON Pago
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20102, 'Error Financiero: Los pagos o abonos no se pueden modificar por seguridad contable. Si hay un error, anule el pago y genere uno nuevo.');
END;
/

-- TRG_MODIFICAR_NOMINA: El acta de un partido jugado es intocable
CREATE OR REPLACE TRIGGER TRG_MODIFICAR_NOMINA
BEFORE UPDATE ON Nomina
FOR EACH ROW
DECLARE
    v_estado_partido VARCHAR2(20);
BEGIN
    SELECT Estado INTO v_estado_partido FROM Partido WHERE Id_Partido = :OLD.Id_Partido;
    IF v_estado_partido = 'Jugado' THEN
        RAISE_APPLICATION_ERROR(-20103, 'Error Deportivo: No se puede modificar el acta (nomina) de un partido que ya ha sido jugado.');
    END IF;
END;
/

-- TRG_ELIMINAR_NOMINA: El acta de un partido jugado es intocable
CREATE OR REPLACE TRIGGER TRG_ELIMINAR_NOMINA
BEFORE DELETE ON Nomina
FOR EACH ROW
DECLARE
    v_estado_partido VARCHAR2(20);
BEGIN
    SELECT Estado INTO v_estado_partido FROM Partido WHERE Id_Partido = :OLD.Id_Partido;
    IF v_estado_partido = 'Jugado' THEN
        RAISE_APPLICATION_ERROR(-20104, 'Error Deportivo: No se puede eliminar a un jugador del acta (nomina) de un partido que ya ha sido jugado.');
    END IF;
END;
/

-- TRG_MODIFICAR_INCIDENCIA: Las incidencias no se editan para proteger la estadistica
CREATE OR REPLACE TRIGGER TRG_MODIFICAR_INCIDENCIA
BEFORE UPDATE ON Incidencia
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20105, 'Error Deportivo: Las incidencias no se pueden modificar porque desincronizan las estadisticas. Debe eliminar la incidencia erronea y crear una nueva.');
END;
/

-- TRG_MODIFICAR_PARTIDO_NOMINA: El pitazo final (Suma partidos jugados a los titulares)
CREATE OR REPLACE TRIGGER TRG_MODIFICAR_PARTIDO_NOMINA
AFTER UPDATE OF Estado ON Partido
FOR EACH ROW
BEGIN
    -- Si el partido acaba de terminar...
    IF :OLD.Estado <> 'Jugado' AND :NEW.Estado = 'Jugado' THEN
        -- Le sumamos +1 a los partidos jugados solo a los titulares de la nomina de ese partido
        UPDATE Estadistica_Jugador ej
        SET ej.Partidos_Jugados = ej.Partidos_Jugados + 1
        WHERE ej.Id_Jugador IN (
            SELECT j.Id_Persona 
            FROM Nomina n
            JOIN Jugador j ON n.Id_Jugador = j.Id_Persona
            WHERE n.Id_Partido = :NEW.Id_Partido AND n.Titular = 'SI'
        )
        AND ej.Id_Torneo = (
            SELECT i.Id_Torneo
            FROM Inscripcion i
            WHERE i.Id_Equipo = :NEW.Id_EquipoLocal AND ROWNUM = 1
        );
    END IF;
END;
/

-- ============================================================
-- 4. NUEVOS TRIGGERS DE AUTOMATIZACION Y FILTROS CONTABLES
-- ============================================================

-- TRG_AUTOGENERAR_FACTURA_RES: Genera factura automatica cuando hay una multa
CREATE OR REPLACE TRIGGER TRG_AUTOGENERAR_FACTURA_RES
AFTER INSERT ON Resolucion
FOR EACH ROW
DECLARE
    v_id_tarifa NUMBER;
BEGIN
    -- Busca la tarifa de "Sancion" o asigna una por defecto (Suponiendo que la primera es de Multas)
    SELECT Id_Tarifa INTO v_id_tarifa FROM Tarifa WHERE ROWNUM = 1;
    
    INSERT INTO Factura (Id_Inscripcion, Id_Resolucion, Id_Tarifa, Fecha_Emision, Estado, Total)
    VALUES (NULL, :NEW.Id_Resolucion, v_id_tarifa, SYSDATE, 'Pendiente', :NEW.Multa_Monto);
END;
/

-- TRG_AUTOGENERAR_FACTURA_INS: Genera factura automatica cuando se acepta inscripcion
CREATE OR REPLACE TRIGGER TRG_AUTOGENERAR_FACTURA_INS
AFTER UPDATE OF Estado ON Inscripcion
FOR EACH ROW
DECLARE
    v_id_tarifa NUMBER;
    v_valor NUMBER;
BEGIN
    IF :OLD.Estado <> 'Aceptada' AND :NEW.Estado = 'Aceptada' THEN
        -- Busca la tarifa de Inscripcion
        SELECT Id_Tarifa, Valor INTO v_id_tarifa, v_valor FROM Tarifa WHERE ROWNUM = 1;
        
        INSERT INTO Factura (Id_Inscripcion, Id_Resolucion, Id_Tarifa, Fecha_Emision, Estado, Total)
        VALUES (:NEW.Id_Inscripcion, NULL, v_id_tarifa, SYSDATE, 'Pendiente', v_valor);
    END IF;
END;
/

-- TRG_ELIMINAR_PAGO: Prohibe borrar recibos
CREATE OR REPLACE TRIGGER TRG_ELIMINAR_PAGO
BEFORE DELETE ON Pago
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20106, 'Error Financiero: Prohibido eliminar recibos de pago. Si hay un error, anule el pago generando uno nuevo negativo o anule la factura.');
END;
/

-- TRG_MODIFICAR_FACTURA: Filtro inteligente para permitir solo Anulacion
CREATE OR REPLACE TRIGGER TRG_MODIFICAR_FACTURA
BEFORE UPDATE ON Factura
FOR EACH ROW
DECLARE
    v_conteo_pagos NUMBER;
BEGIN
    IF :NEW.Total <> :OLD.Total OR :NEW.Id_Tarifa <> :OLD.Id_Tarifa OR :NEW.Id_Inscripcion <> :OLD.Id_Inscripcion OR :NEW.Id_Resolucion <> :OLD.Id_Resolucion THEN
        RAISE_APPLICATION_ERROR(-20107, 'Fraude Contable: No se puede alterar los montos o referencias de una factura emitida.');
    END IF;

    IF :NEW.Estado = 'Anulada' AND :OLD.Estado <> 'Anulada' THEN
        SELECT COUNT(*) INTO v_conteo_pagos FROM Pago WHERE Id_Factura = :OLD.Id_Factura;
        IF v_conteo_pagos > 0 THEN
            RAISE_APPLICATION_ERROR(-20108, 'Fraude Contable: No se puede anular una factura con dinero recaudado (abonos).');
        END IF;
    END IF;
END;
/

-- TRG_CONGELA_RESOLUCION: Protege la resolucion si ya esta facturada
CREATE OR REPLACE TRIGGER TRG_CONGELA_RESOLUCION
BEFORE UPDATE OR DELETE ON Resolucion
FOR EACH ROW
DECLARE
    v_conteo_factura NUMBER;
BEGIN
    -- Determina el ID segun si es UPDATE o DELETE
    SELECT COUNT(*) INTO v_conteo_factura FROM Factura WHERE Id_Resolucion = NVL(:OLD.Id_Resolucion, :OLD.Id_Resolucion);
    
    IF v_conteo_factura > 0 THEN
        RAISE_APPLICATION_ERROR(-20109, 'Error Legal: No se puede modificar ni eliminar una resolucion que ya ha sido facturada para cobro.');
    END IF;
END;
/

-- TRG_VERIFICAR_SANCION_NOMINA: Prohibe a un jugador sancionado sin pagar jugar un partido
CREATE OR REPLACE TRIGGER TRG_VERIFICAR_SANCION_NOMINA
BEFORE INSERT ON Nomina
FOR EACH ROW
DECLARE
    v_multas_pendientes NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_multas_pendientes
    FROM Resolucion r
    JOIN Factura f ON r.Id_Resolucion = f.Id_Resolucion
    JOIN Incidencia inc ON r.Id_Incidencia = inc.Id_Incidencia
    WHERE inc.Id_Jugador = :NEW.Id_Jugador AND f.Estado = 'Pendiente';
    
    IF v_multas_pendientes > 0 THEN
        RAISE_APPLICATION_ERROR(-20112, 'Error Disciplinario: El jugador tiene multas pendientes de pago y esta inhabilitado para jugar en este partido.');
    END IF;
END;
/
