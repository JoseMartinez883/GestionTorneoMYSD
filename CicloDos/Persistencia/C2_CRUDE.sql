-- ========================================================================
-- ESPECIFICACION DE PAQUETES (CRUDE) - CICLO 2
-- ========================================================================

-- ==========================================
-- 1. PK_FACTURA
-- ==========================================
CREATE OR REPLACE PACKAGE PK_FACTURA AS
    -- Tarifas
    PROCEDURE AD_TARIFA (xConcepto IN VARCHAR2, xValor IN NUMBER);
    PROCEDURE MOD_TARIFA (xId_Tarifa IN NUMBER, xConcepto IN VARCHAR2, xValor IN NUMBER);
    PROCEDURE EL_TARIFA (xId_Tarifa IN NUMBER);
    -- Consulta basica (R del CRUD)
    PROCEDURE CO_TARIFA (xCursor OUT SYS_REFCURSOR);
    
    -- Facturas
    PROCEDURE AD_FACTURA (xId_Inscripcion IN NUMBER, xId_Resolucion IN NUMBER, xId_Tarifa IN NUMBER);
    PROCEDURE MOD_FACTURA (xId_Factura IN NUMBER, xEstado IN VARCHAR2);
    PROCEDURE EL_FACTURA (xId_Factura IN NUMBER);
    -- Consulta basica (R del CRUD)
    PROCEDURE CO_FACTURA (xCursor OUT SYS_REFCURSOR);
    
    -- Pagos
    PROCEDURE AD_PAGO (xId_Factura IN NUMBER, xId_Representante IN NUMBER, xMonto IN NUMBER);
    PROCEDURE MOD_PAGO (xId_Pago IN NUMBER, xMonto IN NUMBER); -- Bloqueado por Trigger
    PROCEDURE EL_PAGO (xId_Pago IN NUMBER); -- Bloqueado por Trigger
    -- Consulta basica (R del CRUD) purificada sin parametros
    PROCEDURE CO_PAGO (xCursor OUT SYS_REFCURSOR);

    -- ==========================================
    -- Consultas Operativas (Desde C2_09_Consultas.sql)
    -- ==========================================
    -- Consulta Operativa 1: Financiera de Estado de Cuenta (Morosos)
    PROCEDURE CO_MOROSOS (xNombre_Equipo IN VARCHAR2, xCursor OUT SYS_REFCURSOR);

    -- Consulta Operativa 3: Balance Financiero de la Liga
    PROCEDURE CO_BALANCE_FINANCIERO (xNombre_Torneo IN VARCHAR2, xTemporada IN VARCHAR2, xCursor OUT SYS_REFCURSOR);
END PK_FACTURA;
/

-- ==========================================
-- 2. PK_NOMINA
-- ==========================================
CREATE OR REPLACE PACKAGE PK_NOMINA AS
    PROCEDURE AD_NOMINA (xId_Partido IN NUMBER, xId_Jugador IN NUMBER, xTitular IN VARCHAR2);
    PROCEDURE MOD_NOMINA (xId_Partido IN NUMBER, xId_Jugador IN NUMBER, xTitular IN VARCHAR2);
    PROCEDURE EL_NOMINA (xId_Partido IN NUMBER, xId_Jugador IN NUMBER);
    -- Consultas Basicas y Operativas (R del CRUD)
    PROCEDURE CO_NOMINA (xCursor OUT SYS_REFCURSOR);
    PROCEDURE CO_PLANTILLA_PARTIDO (xId_Partido IN NUMBER, xNombre_Equipo IN VARCHAR2, xCursor OUT SYS_REFCURSOR);
END PK_NOMINA;
/

-- ==========================================
-- 3. PK_INCIDENCIA
-- ==========================================
CREATE OR REPLACE PACKAGE PK_INCIDENCIA AS
    -- Incidencias
    PROCEDURE AD_INCIDENCIA (xId_Partido IN NUMBER, xId_Arbitro IN NUMBER, xId_Jugador IN NUMBER, xMinuto IN NUMBER, xTipo IN VARCHAR2);
    PROCEDURE MOD_INCIDENCIA (xId_Incidencia IN NUMBER, xMinuto IN NUMBER, xTipo IN VARCHAR2); -- Bloqueado por Trigger
    PROCEDURE EL_INCIDENCIA (xId_Incidencia IN NUMBER);
    -- Consulta basica (R del CRUD) purificada sin parametros
    PROCEDURE CO_INCIDENCIA (xCursor OUT SYS_REFCURSOR);
    
    -- Resoluciones
    PROCEDURE AD_RESOLUCION (xId_Incidencia IN NUMBER, xFechas_Suspension IN NUMBER, xMulta_Monto IN NUMBER, xDescripcion IN VARCHAR2);
    PROCEDURE MOD_RESOLUCION (xId_Resolucion IN NUMBER, xFechas_Suspension IN NUMBER, xMulta_Monto IN NUMBER, xDescripcion IN VARCHAR2); -- Controlado
    PROCEDURE EL_RESOLUCION (xId_Resolucion IN NUMBER); -- Controlado
    -- Consulta basica (R del CRUD)
    PROCEDURE CO_RESOLUCION (xCursor OUT SYS_REFCURSOR);
    
    -- ==========================================
    -- Consultas Operativas (Desde C2_09_Consultas.sql)
    -- ==========================================
    -- Consulta Operativa 4: Historial de Resoluciones (Sanciones)
    PROCEDURE CO_HISTORIAL_SANCIONES (xNombre_Equipo IN VARCHAR2, xCursor OUT SYS_REFCURSOR);
    
    -- Consulta Operativa 5: Linea de Tiempo del Partido
    PROCEDURE CO_LINEA_TIEMPO_PARTIDO (xId_Partido IN NUMBER, xCursor OUT SYS_REFCURSOR);
END PK_INCIDENCIA;
/

-- ==========================================
-- 4. PK_ESTADISTICA_JUGADOR
-- ==========================================
CREATE OR REPLACE PACKAGE PK_ESTADISTICA_JUGADOR AS
    PROCEDURE AD_ESTADISTICA_JUGADOR (xId_Jugador IN NUMBER, xId_Torneo IN NUMBER); -- Bloqueado internamente
    PROCEDURE MOD_ESTADISTICA_JUGADOR (xId_Estadistica IN NUMBER, xGoles IN NUMBER, xAsistencias IN NUMBER, xTarjetas_Amarillas IN NUMBER, xTarjetas_Rojas IN NUMBER, xPartidos_Jugados IN NUMBER);
    PROCEDURE EL_ESTADISTICA_JUGADOR (xId_Estadistica IN NUMBER); -- Bloqueado internamente
    -- Consultas Basicas y Operativas (R del CRUD)
    PROCEDURE CO_ESTADISTICA_JUGADOR (xCursor OUT SYS_REFCURSOR);
    PROCEDURE CO_RANKING_GOLEADORES (xNombre_Torneo IN VARCHAR2, xTemporada IN VARCHAR2, xCursor OUT SYS_REFCURSOR);
    PROCEDURE CO_ESTADISTICA_INDIVIDUAL (xId_Jugador IN NUMBER, xCursor OUT SYS_REFCURSOR);
END PK_ESTADISTICA_JUGADOR;
/
