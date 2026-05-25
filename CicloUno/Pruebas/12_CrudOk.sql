SET SERVEROUTPUT ON;

-- ============================================================
-- PERSONAS, EQUIPOS Y ROLES (JUGADOR, TECNICO, REP)
-- ==============================================================

DECLARE
    v_sello   VARCHAR2(10) := TO_CHAR(SYSDATE, 'SSSSS');
    v_dni_rep VARCHAR2(20) := 'REP-' || v_sello;
    v_dni_tec VARCHAR2(20) := 'TEC-' || v_sello;
    v_dni_jug VARCHAR2(20) := 'JUG-' || v_sello;
    v_id_rep  NUMBER; v_id_tec  NUMBER; v_id_jug  NUMBER; v_id_eq   NUMBER;
    v_cur     SYS_REFCURSOR;
BEGIN
    PK_PERSONA.AD_PERSONA(v_dni_rep, 'Lord-'||v_sello, 'Random', TO_DATE('1985-05-15', 'YYYY-MM-DD'));
    PK_PERSONA.AD_PERSONA(v_dni_tec, 'Prof-'||v_sello, 'Glitch', TO_DATE('1978-10-10', 'YYYY-MM-DD'));
    PK_PERSONA.AD_PERSONA(v_dni_jug, 'Cyborg-'||v_sello, 'X-99', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
    
    SELECT Id_Persona INTO v_id_rep FROM Persona WHERE DNI = v_dni_rep;
    SELECT Id_Persona INTO v_id_tec FROM Persona WHERE DNI = v_dni_tec;
    SELECT Id_Persona INTO v_id_jug FROM Persona WHERE DNI = v_dni_jug;

    PK_EQUIPO.AD_EQUIPO('Chivas de Pluton ' || v_sello, 'escudo.png', TO_DATE('2020-01-01', 'YYYY-MM-DD'));
    SELECT Id_Equipo INTO v_id_eq FROM Equipo WHERE nombre_oficial = 'Chivas de Pluton ' || v_sello;

    PK_EQUIPO.AD_REPRESENTANTE(v_id_rep, v_id_eq, '399-888', 'ceo@pluton.com', 'Presidente');
    PK_EQUIPO.AD_TECNICO(v_id_tec, v_id_eq, 'Principal');
    PK_EQUIPO.AD_JUGADOR(v_id_jug, v_id_eq, 'Delantero', 99, 99.9, 1.99, 'Plutoniana');

    PK_EQUIPO.MOD_EQUIPO(v_id_eq, 'Astros de Saturno ' || v_sello, 'esc_mod.png', TO_DATE('2020-02-02', 'YYYY-MM-DD'));
    PK_EQUIPO.MOD_JUGADOR(v_id_jug, 'Portero', 1, 95.5, 2.01, 'Saturniana');

    PK_EQUIPO.CO_EQUIPO(v_cur); --DBMS_SQL.RETURN_RESULT(v_cur);
    PK_EQUIPO.CO_JUGADOR_EQUIPO(v_id_eq, v_cur); --DBMS_SQL.RETURN_RESULT(v_cur);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('>>> BLOQUE 1 COMPLETADO EXITOSAMENTE.');
EXCEPTION WHEN OTHERS THEN ROLLBACK; DBMS_OUTPUT.PUT_LINE('Error Bloque 1: '||SQLERRM);
END;
/

-- ============================================================
-- BTORNEOS, FASES, ESTADIOS Y ARBITROS (SUPER SENCILLO)
-- ============================================================
DECLARE
    v_sello   VARCHAR2(10) := TO_CHAR(SYSDATE, 'SSSSS');
    v_dni_org VARCHAR2(20) := 'ORG-' || v_sello;
    v_dni_arb VARCHAR2(20) := 'ARB-' || v_sello;

    v_id_org NUMBER; v_id_arb NUMBER; v_id_est NUMBER; v_id_tor NUMBER;
    v_cur     SYS_REFCURSOR;
BEGIN
    PK_PERSONA.AD_PERSONA(v_dni_org, 'Comisario-'||v_sello, 'Alfa', TO_DATE('1970-01-01', 'YYYY-MM-DD'));
    PK_PERSONA.AD_PERSONA(v_dni_arb, 'Juez-'||v_sello, 'Beta', TO_DATE('1982-01-01', 'YYYY-MM-DD'));

    SELECT Id_Persona INTO v_id_org FROM Persona WHERE DNI = v_dni_org;
    SELECT Id_Persona INTO v_id_arb FROM Persona WHERE DNI = v_dni_arb;

    PK_TORNEO.AD_ORGANIZADOR(v_id_org, 'Principal');
    PK_PARTIDO.AD_ARBITRO(v_id_arb, 'Profesional');
    PK_ESTADIO.AD_ESTADIO('Estadio Fin del Mundo '||v_sello, 'Bogota', 'Calle 0', 95000, 'Sintetica');
    SELECT Id_Estadio INTO v_id_est FROM Estadio WHERE nombre = 'Estadio Fin del Mundo '||v_sello;

    PK_TORNEO.AD_TORNEO('Torneo Rapido '||v_sello, 'Alpha', SYSDATE + 15, SYSDATE + 90);
    SELECT Id_Torneo INTO v_id_tor FROM Torneo WHERE nombre = 'Torneo Rapido '||v_sello;
    PK_TORNEO.AD_FASE(v_id_tor, 'Fase de Grupos', 'Liga');

    PK_ESTADIO.MOD_ESTADIO(v_id_est, 'Superdomo '||v_sello, 'Calle 0 Modificada', 99000, 'Mixta');
    PK_TORNEO.MOD_TORNEO(v_id_tor, 'Torneo Modificado '||v_sello, 'Alpha', SYSDATE + 16, SYSDATE + 95, 'Programado', v_id_org);

    PK_TORNEO.CO_TORNEO(v_cur); --DBMS_SQL.RETURN_RESULT(v_cur);
    PK_ESTADIO.CO_ESTADIO(v_cur); --DBMS_SQL.RETURN_RESULT(v_cur);
    PK_PARTIDO.CO_ARBITRO(v_cur); --DBMS_SQL.RETURN_RESULT(v_cur);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('>>> COMPLETADO EXITOSAMENTE.');
EXCEPTION WHEN OTHERS THEN ROLLBACK; DBMS_OUTPUT.PUT_LINE('Error Bloque 2: '||SQLERRM);
END;
/


-- ============================================================
-- PATROCINADORES Y ESTADISTICAS (MUTACIONES DINAMICAS)
-- ============================================================

DECLARE
    v_sello   VARCHAR2(10) := TO_CHAR(SYSDATE, 'SSSSS');
    v_nit     VARCHAR2(20) := 'NIT-' || v_sello;
    v_id_pat  NUMBER; v_id_tor  NUMBER; v_id_eq   NUMBER;
    v_cur     SYS_REFCURSOR;
BEGIN
    PK_PATROCINADOR.AD_PATROCINADOR('Corporacion Umbrella '||v_sello, v_nit, 'Economico');
    SELECT Id_Patrocinador INTO v_id_pat FROM Patrocinador WHERE NIT = v_nit;

    PK_PATROCINADOR.MOD_PATROCINADOR(v_id_pat, 'Umbrella Bio-Tech '||v_sello, 'Equipamiento');

    SELECT MIN(Id_Torneo) INTO v_id_tor FROM Torneo;
    SELECT MIN(Id_Equipo) INTO v_id_eq FROM Equipo;

    IF v_id_tor IS NOT NULL THEN PK_PATROCINADOR.AD_TORNEO_PATROCINADOR(v_id_tor, v_id_pat); END IF;
    IF v_id_eq IS NOT NULL THEN PK_PATROCINADOR.AD_EQUIPO_PATROCINADOR(v_id_eq, v_id_pat); END IF;

    PK_PATROCINADOR.CO_PATROCINADOR(v_cur); --DBMS_SQL.RETURN_RESULT(v_cur);
    PK_ESTADISTICA_EQUIPO.CO_ESTADISTICA_EQUIPO(v_cur); --DBMS_SQL.RETURN_RESULT(v_cur);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('>>> COMPLETADO EXITOSAMENTE.');
EXCEPTION WHEN OTHERS THEN ROLLBACK; DBMS_OUTPUT.PUT_LINE('Error Bloque 3: '||SQLERRM);
END;
/
