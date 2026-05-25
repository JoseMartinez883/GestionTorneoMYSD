-- ========================================================================
-- IMPLEMENTACION DE PAQUETES (CRUDI) - CICLO 2
-- ========================================================================

-- ==========================================
-- 1. PK_FACTURA
-- ==========================================
CREATE OR REPLACE PACKAGE BODY PK_FACTURA AS
    -- Tarifas
    PROCEDURE AD_TARIFA (xConcepto IN VARCHAR2, xValor IN NUMBER) IS
    BEGIN
        INSERT INTO Tarifa (Concepto, Valor) VALUES (xConcepto, xValor);
    END AD_TARIFA;

    PROCEDURE MOD_TARIFA (xId_Tarifa IN NUMBER, xConcepto IN VARCHAR2, xValor IN NUMBER) IS
    BEGIN
        UPDATE Tarifa SET Concepto = xConcepto, Valor = xValor WHERE Id_Tarifa = xId_Tarifa;
    END MOD_TARIFA;

    PROCEDURE EL_TARIFA (xId_Tarifa IN NUMBER) IS
    BEGIN
        DELETE FROM Tarifa WHERE Id_Tarifa = xId_Tarifa;
    END EL_TARIFA;

    -- Consulta basica (R del CRUD)
    PROCEDURE CO_TARIFA (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR SELECT * FROM Tarifa;
    END CO_TARIFA;

    -- Facturas
    PROCEDURE AD_FACTURA (xId_Inscripcion IN NUMBER, xId_Resolucion IN NUMBER, xId_Tarifa IN NUMBER) IS
    BEGIN
        INSERT INTO Factura (Id_Inscripcion, Id_Resolucion, Id_Tarifa, Fecha_Emision, Estado)
        VALUES (xId_Inscripcion, xId_Resolucion, xId_Tarifa, SYSDATE, 'Pendiente');
    END AD_FACTURA;

    PROCEDURE MOD_FACTURA (xId_Factura IN NUMBER, xEstado IN VARCHAR2) IS
    BEGIN
        UPDATE Factura SET Estado = xEstado WHERE Id_Factura = xId_Factura;
    END MOD_FACTURA;

    PROCEDURE EL_FACTURA (xId_Factura IN NUMBER) IS
    BEGIN
        DELETE FROM Factura WHERE Id_Factura = xId_Factura;
    END EL_FACTURA;

    -- Consulta basica (R del CRUD)
    PROCEDURE CO_FACTURA (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR SELECT * FROM Factura;
    END CO_FACTURA;

    -- Pagos
    PROCEDURE AD_PAGO (xId_Factura IN NUMBER, xId_Representante IN NUMBER, xMonto IN NUMBER) IS
    BEGIN
        INSERT INTO Pago (Id_Factura, Id_Representante, Monto, Fecha_Pago)
        VALUES (xId_Factura, xId_Representante, xMonto, SYSDATE);
    END AD_PAGO;

    PROCEDURE MOD_PAGO (xId_Pago IN NUMBER, xMonto IN NUMBER) IS
    BEGIN
        RAISE_APPLICATION_ERROR(-20110, 'Error de Seguridad: Los recibos de pago emitidos son inmutables. No se puede alterar su monto.');
    END MOD_PAGO;

    PROCEDURE EL_PAGO (xId_Pago IN NUMBER) IS
    BEGIN
        DELETE FROM Pago WHERE Id_Pago = xId_Pago;
    END EL_PAGO;

    -- Consulta basica (R del CRUD) purificada sin parametros
    PROCEDURE CO_PAGO (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR SELECT * FROM Pago;
    END CO_PAGO;

    -- ==========================================
    -- Consultas Operativas (Desde C2_09_Consultas.sql)
    -- ==========================================
    -- Consulta Operativa 1: Financiera de Estado de Cuenta (Morosos)
    PROCEDURE CO_MOROSOS (xNombre_Equipo IN VARCHAR2, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR 
        SELECT 
            e.Nombre_Oficial AS Equipo,
            f.Id_Factura,
            t.Concepto,
            f.Fecha_Emision,
            f.Total,
            f.Estado
        FROM Factura f
        JOIN Tarifa t ON f.Id_Tarifa = t.Id_Tarifa
        LEFT JOIN Inscripcion i ON f.Id_Inscripcion = i.Id_Inscripcion
        LEFT JOIN Resolucion r ON f.Id_Resolucion = r.Id_Resolucion
        LEFT JOIN Incidencia inc ON r.Id_Incidencia = inc.Id_Incidencia
        LEFT JOIN Jugador j ON inc.Id_Jugador = j.Id_Persona
        LEFT JOIN Equipo e ON i.Id_Equipo = e.Id_Equipo OR j.Id_Equipo = e.Id_Equipo
        WHERE f.Estado = 'Pendiente' AND e.Nombre_Oficial = xNombre_Equipo;
    END CO_MOROSOS;

    -- Consulta Operativa 3: Balance Financiero de la Liga
    PROCEDURE CO_BALANCE_FINANCIERO (xNombre_Torneo IN VARCHAR2, xTemporada IN VARCHAR2, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR 
        SELECT 
            f.Id_Factura,
            t.Concepto,
            f.Fecha_Emision,
            f.Total AS Valor_Total_Factura,
            NVL(SUM(p.Monto), 0) AS Total_Abonado,
            (f.Total - NVL(SUM(p.Monto), 0)) AS Saldo_Pendiente,
            f.Estado
        FROM Factura f
        JOIN Tarifa t ON f.Id_Tarifa = t.Id_Tarifa
        LEFT JOIN Pago p ON f.Id_Factura = p.Id_Factura
        -- Joins para llegar hasta el Torneo por la via de Inscripcion
        LEFT JOIN Inscripcion i ON f.Id_Inscripcion = i.Id_Inscripcion
        LEFT JOIN Torneo tor1 ON i.Id_Torneo = tor1.Id_Torneo
        -- Joins para llegar hasta el Torneo por la via de Resolucion
        LEFT JOIN Resolucion r ON f.Id_Resolucion = r.Id_Resolucion
        LEFT JOIN Incidencia inc ON r.Id_Incidencia = inc.Id_Incidencia
        LEFT JOIN Partido pa ON inc.Id_Partido = pa.Id_Partido
        LEFT JOIN Fase fa ON pa.Id_Torneo = fa.Id_Torneo AND pa.nombre_fase = fa.nombre_fase
        LEFT JOIN Torneo tor2 ON fa.Id_Torneo = tor2.Id_Torneo
        WHERE (tor1.Nombre = xNombre_Torneo AND tor1.Temporada = xTemporada)
           OR (tor2.Nombre = xNombre_Torneo AND tor2.Temporada = xTemporada)
        GROUP BY f.Id_Factura, t.Concepto, f.Fecha_Emision, f.Total, f.Estado
        ORDER BY Saldo_Pendiente DESC, f.Id_Factura ASC;
    END CO_BALANCE_FINANCIERO;
END PK_FACTURA;
/

-- ==========================================
-- 2. PK_NOMINA
-- ==========================================
CREATE OR REPLACE PACKAGE BODY PK_NOMINA AS
    PROCEDURE AD_NOMINA (xId_Partido IN NUMBER, xId_Jugador IN NUMBER, xTitular IN VARCHAR2) IS
    BEGIN
        INSERT INTO Nomina (Id_Partido, Id_Jugador, Titular)
        VALUES (xId_Partido, xId_Jugador, xTitular);
    END AD_NOMINA;

    PROCEDURE MOD_NOMINA (xId_Partido IN NUMBER, xId_Jugador IN NUMBER, xTitular IN VARCHAR2) IS
    BEGIN
        UPDATE Nomina SET Titular = xTitular WHERE Id_Partido = xId_Partido AND Id_Jugador = xId_Jugador;
    END MOD_NOMINA;

    PROCEDURE EL_NOMINA (xId_Partido IN NUMBER, xId_Jugador IN NUMBER) IS
    BEGIN
        DELETE FROM Nomina WHERE Id_Partido = xId_Partido AND Id_Jugador = xId_Jugador;
    END EL_NOMINA;

    -- Consulta basica (R del CRUD) purificada sin parametros
    PROCEDURE CO_NOMINA (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR SELECT * FROM Nomina;
    END CO_NOMINA;

    PROCEDURE CO_PLANTILLA_PARTIDO (xId_Partido IN NUMBER, xNombre_Equipo IN VARCHAR2, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
        SELECT 
            pa.Id_Partido,
            e.Nombre_Oficial AS Equipo,
            n.Titular,
            j.Num_Camiseta,
            j.Posicion,
            p.Nombres || ' ' || p.Apellidos AS Nombre_Jugador
        FROM Nomina n
        JOIN Partido pa ON n.Id_Partido = pa.Id_Partido
        JOIN Jugador j ON n.Id_Jugador = j.Id_Persona
        JOIN Persona p ON j.Id_Persona = p.Id_Persona
        JOIN Equipo e ON j.Id_Equipo = e.Id_Equipo
        WHERE pa.Id_Partido = xId_Partido AND e.Nombre_Oficial = xNombre_Equipo
        ORDER BY n.Titular DESC, j.Num_Camiseta ASC;
    END CO_PLANTILLA_PARTIDO;
END PK_NOMINA;
/

-- ==========================================
-- 3. PK_INCIDENCIA
-- ==========================================
CREATE OR REPLACE PACKAGE BODY PK_INCIDENCIA AS
    PROCEDURE AD_INCIDENCIA (xId_Partido IN NUMBER, xId_Arbitro IN NUMBER, xId_Jugador IN NUMBER, xMinuto IN NUMBER, xTipo IN VARCHAR2) IS
    BEGIN
        INSERT INTO Incidencia (Id_Partido, Id_Arbitro, Id_Jugador, Minuto, Tipo)
        VALUES (xId_Partido, xId_Arbitro, xId_Jugador, xMinuto, xTipo);
    END AD_INCIDENCIA;

    PROCEDURE MOD_INCIDENCIA (xId_Incidencia IN NUMBER, xMinuto IN NUMBER, xTipo IN VARCHAR2) IS
    BEGIN
        RAISE_APPLICATION_ERROR(-20111, 'Error de Seguridad: Las incidencias de los partidos son registros historicos inmutables.');
    END MOD_INCIDENCIA;

    PROCEDURE EL_INCIDENCIA (xId_Incidencia IN NUMBER) IS
    BEGIN
        DELETE FROM Incidencia WHERE Id_Incidencia = xId_Incidencia;
    END EL_INCIDENCIA;

    -- Consulta basica (R del CRUD) purificada sin parametros
    PROCEDURE CO_INCIDENCIA (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR SELECT * FROM Incidencia;
    END CO_INCIDENCIA;

    PROCEDURE AD_RESOLUCION (xId_Incidencia IN NUMBER, xFechas_Suspension IN NUMBER, xMulta_Monto IN NUMBER, xDescripcion IN VARCHAR2) IS
    BEGIN
        INSERT INTO Resolucion (Id_Incidencia, Fechas_Suspension, Multa_Monto, Descripcion)
        VALUES (xId_Incidencia, xFechas_Suspension, xMulta_Monto, xDescripcion);
    END AD_RESOLUCION;

    PROCEDURE MOD_RESOLUCION (xId_Resolucion IN NUMBER, xFechas_Suspension IN NUMBER, xMulta_Monto IN NUMBER, xDescripcion IN VARCHAR2) IS
    BEGIN
        UPDATE Resolucion SET Fechas_Suspension = xFechas_Suspension, Multa_Monto = xMulta_Monto, Descripcion = xDescripcion
        WHERE Id_Resolucion = xId_Resolucion;
    END MOD_RESOLUCION;

    PROCEDURE EL_RESOLUCION (xId_Resolucion IN NUMBER) IS
    BEGIN
        DELETE FROM Resolucion WHERE Id_Resolucion = xId_Resolucion;
    END EL_RESOLUCION;

    -- Consulta basica (R del CRUD)
    PROCEDURE CO_RESOLUCION (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR SELECT * FROM Resolucion;
    END CO_RESOLUCION;

    -- ==========================================
    -- Consultas Operativas (Desde C2_09_Consultas.sql)
    -- ==========================================
    -- Consulta Operativa 4: Historial de Resoluciones (Sanciones)
    PROCEDURE CO_HISTORIAL_SANCIONES (xNombre_Equipo IN VARCHAR2, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR 
        SELECT 
            e.Nombre_Oficial AS Equipo,
            p.Nombres || ' ' || p.Apellidos AS Jugador_Sancionado,
            inc.Minuto,
            inc.Tipo,
            r.Fechas_Suspension,
            r.Multa_Monto,
            r.Descripcion
        FROM Resolucion r
        JOIN Incidencia inc ON r.Id_Incidencia = inc.Id_Incidencia
        JOIN Jugador j ON inc.Id_Jugador = j.Id_Persona
        JOIN Persona p ON j.Id_Persona = p.Id_Persona
        JOIN Equipo e ON j.Id_Equipo = e.Id_Equipo
        WHERE e.Nombre_Oficial = xNombre_Equipo
        ORDER BY r.Id_Resolucion DESC;
    END CO_HISTORIAL_SANCIONES;

    -- Consulta Operativa 5: Linea de Tiempo del Partido
    PROCEDURE CO_LINEA_TIEMPO_PARTIDO (xId_Partido IN NUMBER, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR 
        SELECT 
            fa.Nombre_Fase AS Fase_Torneo,
            pa.Id_Partido,
            inc.Minuto,
            inc.Tipo AS Suceso,
            p.Nombres || ' ' || p.Apellidos AS Protagonista,
            e.Nombre_Oficial AS Equipo,
            NVL(r.Descripcion, 'Sin resolucion adicional') AS Consecuencia
        FROM Incidencia inc
        JOIN Partido pa ON inc.Id_Partido = pa.Id_Partido
        JOIN Fase fa ON pa.Id_Torneo = fa.Id_Torneo AND pa.nombre_fase = fa.nombre_fase
        JOIN Jugador j ON inc.Id_Jugador = j.Id_Persona
        JOIN Persona p ON j.Id_Persona = p.Id_Persona
        JOIN Equipo e ON j.Id_Equipo = e.Id_Equipo
        LEFT JOIN Resolucion r ON inc.Id_Incidencia = r.Id_Incidencia
        WHERE pa.Id_Partido = xId_Partido
        ORDER BY inc.Minuto ASC;
    END CO_LINEA_TIEMPO_PARTIDO;
END PK_INCIDENCIA;
/

-- ==========================================
-- 4. PK_ESTADISTICA_JUGADOR
-- ==========================================
CREATE OR REPLACE PACKAGE BODY PK_ESTADISTICA_JUGADOR AS
    PROCEDURE AD_ESTADISTICA_JUGADOR (xId_Jugador IN NUMBER, xId_Torneo IN NUMBER) IS
    BEGIN
        RAISE_APPLICATION_ERROR(-20104, 'Error de Seguridad: No se pueden insertar estadísticas manualmente. Son autogeneradas por Triggers.');
    END AD_ESTADISTICA_JUGADOR;

    PROCEDURE MOD_ESTADISTICA_JUGADOR (xId_Estadistica IN NUMBER, xGoles IN NUMBER, xAsistencias IN NUMBER, xTarjetas_Amarillas IN NUMBER, xTarjetas_Rojas IN NUMBER, xPartidos_Jugados IN NUMBER) IS
    BEGIN
        UPDATE Estadistica_Jugador
        SET Goles = xGoles, Asistencias = xAsistencias, Tarjetas_Amarillas = xTarjetas_Amarillas, Tarjetas_Rojas = xTarjetas_Rojas, Partidos_Jugados = xPartidos_Jugados
        WHERE Id_Estadistica = xId_Estadistica;
    END MOD_ESTADISTICA_JUGADOR;

    PROCEDURE EL_ESTADISTICA_JUGADOR (xId_Estadistica IN NUMBER) IS
    BEGIN
        RAISE_APPLICATION_ERROR(-20105, 'Error de Seguridad: No se pueden eliminar estadísticas históricas.');
    END EL_ESTADISTICA_JUGADOR;

    -- Consulta basica (R del CRUD)
    PROCEDURE CO_ESTADISTICA_JUGADOR (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR SELECT * FROM Estadistica_Jugador;
    END CO_ESTADISTICA_JUGADOR;

    -- ==========================================
    -- Consultas Operativas (Desde C2_09_Consultas.sql)
    -- ==========================================
    -- Consulta Operativa 2: Ranking de Goleadores y Disciplina
    PROCEDURE CO_RANKING_GOLEADORES (xNombre_Torneo IN VARCHAR2, xTemporada IN VARCHAR2, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR 
        SELECT 
            p.Nombres,
            p.Apellidos,
            e.Nombre_Oficial AS Equipo,
            ej.Goles,
            ej.Asistencias,
            ej.Tarjetas_Amarillas,
            ej.Tarjetas_Rojas
        FROM Estadistica_Jugador ej
        JOIN Jugador j ON ej.Id_Jugador = j.Id_Persona
        JOIN Persona p ON j.Id_Persona = p.Id_Persona
        JOIN Equipo e ON j.Id_Equipo = e.Id_Equipo
        JOIN Torneo tor ON ej.Id_Torneo = tor.Id_Torneo
        WHERE tor.Nombre = xNombre_Torneo AND tor.Temporada = xTemporada
        ORDER BY ej.Goles DESC, ej.Asistencias DESC, ej.Tarjetas_Amarillas ASC;
    END CO_RANKING_GOLEADORES;

    PROCEDURE CO_ESTADISTICA_INDIVIDUAL (xId_Jugador IN NUMBER, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
        SELECT 
            p.DNI,
            p.Nombres || ' ' || p.Apellidos AS Nombre_Jugador,
            e.Nombre_Oficial AS Equipo_Actual,
            tor.Nombre AS Torneo,
            tor.Temporada,
            ej.Partidos_Jugados,
            ej.Goles,
            ej.Asistencias,
            ej.Tarjetas_Amarillas,
            ej.Tarjetas_Rojas
        FROM Estadistica_Jugador ej
        JOIN Jugador j ON ej.Id_Jugador = j.Id_Persona
        JOIN Persona p ON j.Id_Persona = p.Id_Persona
        JOIN Equipo e ON j.Id_Equipo = e.Id_Equipo
        JOIN Torneo tor ON ej.Id_Torneo = tor.Id_Torneo
        WHERE ej.Id_Jugador = xId_Jugador;
    END CO_ESTADISTICA_INDIVIDUAL;
END PK_ESTADISTICA_JUGADOR;
/
