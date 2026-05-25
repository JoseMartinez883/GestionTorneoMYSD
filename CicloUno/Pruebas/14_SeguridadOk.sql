-- SeguridadOk - Pruebas sencillas y exitosas usando paquetes de actores 

SET SERVEROUTPUT ON;

PROMPT ============================================================
PROMPT EJECUTANDO PRUEBAS DE SEGURIDAD (PAQUETES DE ACTORES) SIMPLES
PROMPT ============================================================

-- ============================================================
-- 1. PA_ADMINISTRADOR_SISTEMA
-- ============================================================

DECLARE
    v_sello   VARCHAR2(10) := TO_CHAR(SYSDATE, 'SSSSS');
    v_dni     VARCHAR2(20) := 'ADM-' || v_sello;
    v_id_per  NUMBER;
    v_cur     SYS_REFCURSOR;
BEGIN
    PA_ADMINISTRADOR_SISTEMA.AD_PERSONA(v_dni, 'Andres '||v_sello, 'Seguridad', TO_DATE('1992-05-10', 'YYYY-MM-DD'));
    SELECT Id_Persona INTO v_id_per FROM Persona WHERE DNI = v_dni;
    
    PA_ADMINISTRADOR_SISTEMA.MOD_PERSONA(v_id_per, 'Andres Modificado '||v_sello, 'Seguridad Mod', TO_DATE('1992-05-15', 'YYYY-MM-DD'));
    PA_ADMINISTRADOR_SISTEMA.AD_ORGANIZADOR(v_id_per, 'Principal');
    
    PA_ADMINISTRADOR_SISTEMA.CO_PERSONA(v_cur); --DBMS_SQL.RETURN_RESULT(v_cur);
    PA_ADMINISTRADOR_SISTEMA.CO_ESTADISTICA_EQUIPO(v_cur); --DBMS_SQL.RETURN_RESULT(v_cur);
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('>>> PA_ADMINISTRADOR_SISTEMA COMPLETADO EXITOSAMENTE.');
EXCEPTION WHEN OTHERS THEN ROLLBACK; DBMS_OUTPUT.PUT_LINE('Error Admin: '||SQLERRM);
END;
/

-- ============================================================
-- 2. PA_ORGANIZADOR_TORNEO
-- ============================================================
DECLARE
    v_sello   VARCHAR2(10) := TO_CHAR(SYSDATE, 'SSSSS');
    v_id_tor  NUMBER; v_id_est  NUMBER;
    v_cur     SYS_REFCURSOR;
BEGIN
    PA_ORGANIZADOR_TORNEO.AD_ESTADIO('Estadio Seguridad '||v_sello, 'Bogota', 'Calle 0', 35000, 'Natural');
    SELECT Id_Estadio INTO v_id_est FROM Estadio WHERE nombre = 'Estadio Seguridad '||v_sello;
    
    PA_ORGANIZADOR_TORNEO.MOD_ESTADIO(v_id_est, 'Estadio Seg Mod '||v_sello, 'Calle 0 Mod', 40000, 'Natural');
    
    PA_ORGANIZADOR_TORNEO.AD_TORNEO('Copa Seguridad '||v_sello, 'Alpha', SYSDATE + 10, SYSDATE + 90);
    SELECT Id_Torneo INTO v_id_tor FROM Torneo WHERE nombre = 'Copa Seguridad '||v_sello;
    
    PA_ORGANIZADOR_TORNEO.AD_FASE(v_id_tor, 'Fase de Grupos', 'Liga');
    
    PA_ORGANIZADOR_TORNEO.CO_TORNEO(v_cur); --DBMS_SQL.RETURN_RESULT(v_cur);
    PA_ORGANIZADOR_TORNEO.CO_ESTADIO(v_cur); --DBMS_SQL.RETURN_RESULT(v_cur);
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('>>> PA_ORGANIZADOR_TORNEO COMPLETADO EXITOSAMENTE.');
EXCEPTION WHEN OTHERS THEN ROLLBACK; DBMS_OUTPUT.PUT_LINE('Error Organizador: '||SQLERRM);
END;
/

-- ============================================================
-- 3. PA_REPRESENTANTE_EQUIPO
-- ============================================================
DECLARE
    v_sello   VARCHAR2(10) := TO_CHAR(SYSDATE, 'SSSSS');
    v_id_eq   NUMBER;
    v_cur     SYS_REFCURSOR;
BEGIN
    PA_REPRESENTANTE_EQUIPO.AD_EQUIPO('Club Seguridad '||v_sello, 'escudo.png', TO_DATE('2018-01-01', 'YYYY-MM-DD'));
    SELECT Id_Equipo INTO v_id_eq FROM Equipo WHERE nombre_oficial = 'Club Seguridad '||v_sello;

    PA_REPRESENTANTE_EQUIPO.MOD_EQUIPO(v_id_eq, 'Club Seg Mod '||v_sello, 'escudo2.png', TO_DATE('2018-06-01', 'YYYY-MM-DD'));
    PA_REPRESENTANTE_EQUIPO.AD_PATROCINADOR('Umbrella '||v_sello, 'NIT-'||v_sello, 'Economico');

    PA_REPRESENTANTE_EQUIPO.CO_EQUIPO(v_cur); --DBMS_SQL.RETURN_RESULT(v_cur);
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('>>> PA_REPRESENTANTE_EQUIPO COMPLETADO EXITOSAMENTE.');
EXCEPTION WHEN OTHERS THEN ROLLBACK; DBMS_OUTPUT.PUT_LINE('Error Representante: '||SQLERRM);
END;
/

-- ============================================================
-- 4. PA_TECNICO, PA_ARBITRO Y PA_PUBLICO_GENERAL
-- ============================================================
PROMPT >>> Probando Consultas de PA_TECNICO, PA_ARBITRO y PA_PUBLICO_GENERAL...
DECLARE
    v_cur     SYS_REFCURSOR;
BEGIN
    -- PA_TECNICO
    PA_TECNICO.CO_ESTADIO_PARTIDOS(v_cur); --DBMS_SQL.RETURN_RESULT(v_cur);
    
    -- PA_ARBITRO
    PA_ARBITRO.CO_PARTIDO(v_cur); --DBMS_SQL.RETURN_RESULT(v_cur);
    
    -- PA_PUBLICO_GENERAL
    PA_PUBLICO_GENERAL.CO_TORNEO(v_cur); --DBMS_SQL.RETURN_RESULT(v_cur);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('>>> CONSULTAS DE OTROS ACTORES COMPLETADAS EXITOSAMENTE.');
EXCEPTION WHEN OTHERS THEN ROLLBACK; DBMS_OUTPUT.PUT_LINE('Error Consultas: '||SQLERRM);
END;
/

-- ============================================================
-- 5. CASO INTEGRAL: PERSONA, EQUIPO Y JUGADOR
-- ============================================================
DECLARE
    v_sello   VARCHAR2(10) := TO_CHAR(SYSDATE, 'SSSSS');
    v_dni_jug VARCHAR2(20) := 'JUG-' || v_sello;
    v_id_jug  NUMBER; v_id_eq   NUMBER;
    v_cur     SYS_REFCURSOR;
BEGIN
    -- 1. Crear Persona para el Jugador usando el Administrador
    PA_ADMINISTRADOR_SISTEMA.AD_PERSONA(v_dni_jug, 'Jugador-'||v_sello, 'Estrella', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
    SELECT Id_Persona INTO v_id_jug FROM Persona WHERE DNI = v_dni_jug;

    -- 2. Crear Equipo usando el Representante
    PA_REPRESENTANTE_EQUIPO.AD_EQUIPO('Fenix de Marte '||v_sello, 'fenix.png', TO_DATE('2019-01-01', 'YYYY-MM-DD'));
    SELECT Id_Equipo INTO v_id_eq FROM Equipo WHERE nombre_oficial = 'Fenix de Marte '||v_sello;

    -- 3. Registrar al Jugador en el Equipo usando el Representante
    PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_id_jug, v_id_eq, 'Delantero', 10, 75.5, 1.80, 'Colombiana');

    -- 4. Mostrar Resultados de la Asociación
    PA_REPRESENTANTE_EQUIPO.CO_JUGADOR(v_cur); --DBMS_SQL.RETURN_RESULT(v_cur);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('>>> CASO COMPLETADO EXITOSAMENTE.');
EXCEPTION WHEN OTHERS THEN ROLLBACK; DBMS_OUTPUT.PUT_LINE('Error Caso Integral: '||SQLERRM);
END;
/
