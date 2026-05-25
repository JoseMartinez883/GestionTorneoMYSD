-------------------------PRUEBAS 2 (AISLADA)--------------------------
/*
CONTEXTO NARRATIVO: "Crisis y Reestructuracion"
Tras la exitosa inauguración del campeonato, el torneo entra en una fase crítica 
de decisiones organizativas y logísticas. Los clubes se enfrentan a la lesión de sus 
figuras estrella, la búsqueda de nuevos patrocinadores comerciales para financiar sus campañas, 
y la modernización de sus marcas oficiales. 
Asimismo, debido a un evento cultural masivo en la ciudad, el Organizador se ve obligado 
a ampliar la capacidad del estadio principal e inscribir un estadio alterno para programar 
la Fecha 2, mientras que el Administrador realiza una auditoría general de seguridad 
sobre las bases de datos para garantizar la transparencia del torneo.
*/

SET SERVEROUTPUT ON;

-- 1. Crear Estadio y Organizador principal
DECLARE
    v_id_org NUMBER;
BEGIN
    -- Crear Organizador
    PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-ORG-P2', 'Roberto', 'Gomez', TO_DATE('1975-04-12', 'YYYY-MM-DD'));
    SELECT Id_Persona INTO v_id_org FROM Persona WHERE DNI = 'DNI-ORG-P2';
    PA_ADMINISTRADOR_SISTEMA.AD_ORGANIZADOR(v_id_org, 'Principal');

    -- Crear Estadio
    PA_ORGANIZADOR_TORNEO.AD_ESTADIO('Estadio Centenario P2', 'Bogota', 'Calle 53', 30000, 'Natural');
END;
/

-- 2. Crear Torneo y Fases
DECLARE
    v_id_tor NUMBER;
BEGIN
    PA_ORGANIZADOR_TORNEO.AD_TORNEO('Copa Reestructuracion 2028', '2028-1', TO_DATE('2028-02-01', 'YYYY-MM-DD'), TO_DATE('2028-06-30', 'YYYY-MM-DD'));
    SELECT Id_Torneo INTO v_id_tor FROM Torneo WHERE nombre = 'Copa Reestructuracion 2028';
    PA_ORGANIZADOR_TORNEO.AD_FASE(v_id_tor, 'Fase de Grupos', 'Liga');
END;
/

-- 3. Registrar los 4 Equipos y sus Representantes
DECLARE
    v_rep NUMBER;
    v_eq NUMBER;
BEGIN
    -- Crear Equipos
    PA_REPRESENTANTE_EQUIPO.AD_EQUIPO('Condores de Bogota P2', 'logo1.png', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
    PA_REPRESENTANTE_EQUIPO.AD_EQUIPO('Jaguares del Valle P2', 'logo2.png', TO_DATE('2002-05-10', 'YYYY-MM-DD'));
    PA_REPRESENTANTE_EQUIPO.AD_EQUIPO('Tigres del Sur P2', 'logo3.png', TO_DATE('1998-11-20', 'YYYY-MM-DD'));
    PA_REPRESENTANTE_EQUIPO.AD_EQUIPO('Leones de la Costa P2', 'logo4.png', TO_DATE('2005-08-15', 'YYYY-MM-DD'));

    -- Crear Representantes y enlazarlos (Extrayendo el ID primero en v_eq)
    PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-REP-P2-1', 'Camila', 'Rios', TO_DATE('1988-09-12', 'YYYY-MM-DD'));
    SELECT Id_Persona INTO v_rep FROM Persona WHERE DNI = 'DNI-REP-P2-1';
    SELECT Id_Equipo INTO v_eq FROM Equipo WHERE nombre_oficial = 'Condores de Bogota P2';
    PA_REPRESENTANTE_EQUIPO.AD_REPRESENTANTE(v_rep, v_eq, '3001', 'c@condores.com', 'Presidente');

    PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-REP-P2-2', 'Juan', 'Perez', TO_DATE('1980-03-24', 'YYYY-MM-DD'));
    SELECT Id_Persona INTO v_rep FROM Persona WHERE DNI = 'DNI-REP-P2-2';
    SELECT Id_Equipo INTO v_eq FROM Equipo WHERE nombre_oficial = 'Jaguares del Valle P2';
    PA_REPRESENTANTE_EQUIPO.AD_REPRESENTANTE(v_rep, v_eq, '3002', 'j@jaguares.com', 'Presidente');

    PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-REP-P2-3', 'Luisa', 'Mendez', TO_DATE('1985-07-19', 'YYYY-MM-DD'));
    SELECT Id_Persona INTO v_rep FROM Persona WHERE DNI = 'DNI-REP-P2-3';
    SELECT Id_Equipo INTO v_eq FROM Equipo WHERE nombre_oficial = 'Tigres del Sur P2';
    PA_REPRESENTANTE_EQUIPO.AD_REPRESENTANTE(v_rep, v_eq, '3003', 'l@tigres.com', 'Presidente');

    PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-REP-P2-4', 'Carlos', 'Ruiz', TO_DATE('1990-11-05', 'YYYY-MM-DD'));
    SELECT Id_Persona INTO v_rep FROM Persona WHERE DNI = 'DNI-REP-P2-4';
    SELECT Id_Equipo INTO v_eq FROM Equipo WHERE nombre_oficial = 'Leones de la Costa P2';
    PA_REPRESENTANTE_EQUIPO.AD_REPRESENTANTE(v_rep, v_eq, '3004', 'c@leones.com', 'Presidente');
END;
/


-- 4. Registrar 11 Jugadores por Equipo (Bucle compacto)
DECLARE
    v_eq1 NUMBER; v_eq2 NUMBER; v_eq3 NUMBER; v_eq4 NUMBER;
    v_per NUMBER;
BEGIN
    SELECT Id_Equipo INTO v_eq1 FROM Equipo WHERE nombre_oficial = 'Condores de Bogota P2';
    SELECT Id_Equipo INTO v_eq2 FROM Equipo WHERE nombre_oficial = 'Jaguares del Valle P2';
    SELECT Id_Equipo INTO v_eq3 FROM Equipo WHERE nombre_oficial = 'Tigres del Sur P2';
    SELECT Id_Equipo INTO v_eq4 FROM Equipo WHERE nombre_oficial = 'Leones de la Costa P2';

    -- Crear 44 Personas de Jugadores de forma masiva
    FOR eq IN 1..4 LOOP
        FOR j IN 1..11 LOOP
            PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-P2-J' || eq || '-' || j, 'Jugador' || j, 'Equipo' || eq, TO_DATE('2000-01-01', 'YYYY-MM-DD'));
        END LOOP;
    END LOOP;

    -- Asignar los Jugadores a sus respectivos equipos
    FOR i IN 1..11 LOOP
        -- Equipo 1
        SELECT Id_Persona INTO v_per FROM Persona WHERE DNI = 'DNI-P2-J1-' || i;
        PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq1, CASE WHEN i=1 THEN 'Portero' WHEN i<=5 THEN 'Defensa' WHEN i<=8 THEN 'Mediocampista' ELSE 'Delantero' END, i, 75, 1.80, 'Col');
        -- Equipo 2
        SELECT Id_Persona INTO v_per FROM Persona WHERE DNI = 'DNI-P2-J2-' || i;
        PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq2, CASE WHEN i=1 THEN 'Portero' WHEN i<=5 THEN 'Defensa' WHEN i<=8 THEN 'Mediocampista' ELSE 'Delantero' END, i, 75, 1.80, 'Col');
        -- Equipo 3
        SELECT Id_Persona INTO v_per FROM Persona WHERE DNI = 'DNI-P2-J3-' || i;
        PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq3, CASE WHEN i=1 THEN 'Portero' WHEN i<=5 THEN 'Defensa' WHEN i<=8 THEN 'Mediocampista' ELSE 'Delantero' END, i, 75, 1.80, 'Col');
        -- Equipo 4
        SELECT Id_Persona INTO v_per FROM Persona WHERE DNI = 'DNI-P2-J4-' || i;
        PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq4, CASE WHEN i=1 THEN 'Portero' WHEN i<=5 THEN 'Defensa' WHEN i<=8 THEN 'Mediocampista' ELSE 'Delantero' END, i, 75, 1.80, 'Col');
    END LOOP;
END;
/

-- 5. Inscripciones y Aceptaciones del Torneo (Activar Torneo)
DECLARE
    v_id_tor NUMBER;
    v_eq1 NUMBER; v_eq2 NUMBER; v_eq3 NUMBER; v_eq4 NUMBER;
    v_rep1 NUMBER; v_rep2 NUMBER; v_rep3 NUMBER; v_rep4 NUMBER;
    v_ins NUMBER;
    v_org NUMBER;
BEGIN
    SELECT Id_Torneo INTO v_id_tor FROM Torneo WHERE nombre = 'Copa Reestructuracion 2028';
    SELECT Id_Equipo INTO v_eq1 FROM Equipo WHERE nombre_oficial = 'Condores de Bogota P2';
    SELECT Id_Equipo INTO v_eq2 FROM Equipo WHERE nombre_oficial = 'Jaguares del Valle P2';
    SELECT Id_Equipo INTO v_eq3 FROM Equipo WHERE nombre_oficial = 'Tigres del Sur P2';
    SELECT Id_Equipo INTO v_eq4 FROM Equipo WHERE nombre_oficial = 'Leones de la Costa P2';
    
    SELECT Id_Persona INTO v_rep1 FROM Representante WHERE Id_Equipo = v_eq1 AND ROWNUM = 1;
    SELECT Id_Persona INTO v_rep2 FROM Representante WHERE Id_Equipo = v_eq2 AND ROWNUM = 1;
    SELECT Id_Persona INTO v_rep3 FROM Representante WHERE Id_Equipo = v_eq3 AND ROWNUM = 1;
    SELECT Id_Persona INTO v_rep4 FROM Representante WHERE Id_Equipo = v_eq4 AND ROWNUM = 1;

    -- Enviar Solicitud de Inscripción
    PA_REPRESENTANTE_EQUIPO.AD_INSCRIPCION(v_eq1, v_id_tor, v_rep1);
    PA_REPRESENTANTE_EQUIPO.AD_INSCRIPCION(v_eq2, v_id_tor, v_rep2);
    PA_REPRESENTANTE_EQUIPO.AD_INSCRIPCION(v_eq3, v_id_tor, v_rep3);
    PA_REPRESENTANTE_EQUIPO.AD_INSCRIPCION(v_eq4, v_id_tor, v_rep4);

    -- Aceptar Inscripciones
    SELECT Id_Inscripcion INTO v_ins FROM Inscripcion WHERE Id_Equipo = v_eq1 AND Id_Torneo = v_id_tor;
    PA_ORGANIZADOR_TORNEO.MOD_INSCRIPCION_ESTADO(v_ins, 'Aceptada');
    
    SELECT Id_Inscripcion INTO v_ins FROM Inscripcion WHERE Id_Equipo = v_eq2 AND Id_Torneo = v_id_tor;
    PA_ORGANIZADOR_TORNEO.MOD_INSCRIPCION_ESTADO(v_ins, 'Aceptada');

    SELECT Id_Inscripcion INTO v_ins FROM Inscripcion WHERE Id_Equipo = v_eq3 AND Id_Torneo = v_id_tor;
    PA_ORGANIZADOR_TORNEO.MOD_INSCRIPCION_ESTADO(v_ins, 'Aceptada');

    SELECT Id_Inscripcion INTO v_ins FROM Inscripcion WHERE Id_Equipo = v_eq4 AND Id_Torneo = v_id_tor;
    PA_ORGANIZADOR_TORNEO.MOD_INSCRIPCION_ESTADO(v_ins, 'Aceptada');

    -- Iniciar Torneo ('En curso')
    SELECT Id_Persona INTO v_org FROM Organizador WHERE Cargo = 'Principal' AND ROWNUM = 1;
    PA_ORGANIZADOR_TORNEO.MOD_TORNEO(v_id_tor, 'Copa Reestructuracion 2028', '2028-1', TO_DATE('2028-02-01', 'YYYY-MM-DD'), TO_DATE('2028-06-30', 'YYYY-MM-DD'), 'En curso', v_org);
END;
/


-- =========================================================================
-- FASE 2: FLUJO DE PRUEBAS DE CRISIS Y REESTRUCTURACIÓN (12 PASOS)
-- =========================================================================

/*
1. El Representante del Equipo "Condores" (Rep 1) actualiza el perfil 
de su jugador estrella debido a una lesión, cambiándolo a 'Mediocampista'.
*/
DECLARE
    v_id_per NUMBER;
BEGIN
    SELECT Id_Persona INTO v_id_per FROM Persona WHERE DNI = 'DNI-P2-J1-9';
    PA_REPRESENTANTE_EQUIPO.MOD_JUGADOR(v_id_per, 'Mediocampista', 9, 82, 1.88, 'Col');
END;
/

/*
2. El equipo "Jaguares P2" consigue un importante patrocinador ("Energy Drinks S.A."). 
Su Representante lo registra en el sistema como aporte 'Economico'.
*/
BEGIN
    PA_REPRESENTANTE_EQUIPO.AD_PATROCINADOR('Energy Drinks S.A.', 'NIT-7000', 'Economico');
END;
/

/*
3. El Representante vincula formalmente el nuevo patrocinador al club Jaguares.
*/
DECLARE
    v_id_eq NUMBER;
    v_id_pat NUMBER;
BEGIN
    SELECT Id_Equipo INTO v_id_eq FROM Equipo WHERE nombre_oficial = 'Jaguares del Valle P2';
    SELECT Id_Patrocinador INTO v_id_pat FROM Patrocinador WHERE nombre_empresa = 'Energy Drinks S.A.';
    PA_REPRESENTANTE_EQUIPO.AD_EQUIPO_PATROCINADOR(v_id_eq, v_id_pat);
END;
/

/*
4. Para atraer más público, el equipo "Condores" moderniza su imagen, 
actualizando su nombre comercial oficial a 'Condores FC P2'.
*/
DECLARE
    v_id_eq NUMBER;
BEGIN
    SELECT Id_Equipo INTO v_id_eq FROM Equipo WHERE nombre_oficial = 'Condores de Bogota P2';
    PA_REPRESENTANTE_EQUIPO.MOD_EQUIPO(v_id_eq, 'Condores FC P2', 'condor_new.png', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
END;
/

/*
5. El Organizador del Torneo actualiza la capacidad del "Estadio Centenario P2" 
luego de terminar las obras de ampliación a 45,000 espectadores.
*/
DECLARE
    v_id_est NUMBER;
BEGIN
    SELECT Id_Estadio INTO v_id_est FROM Estadio WHERE nombre = 'Estadio Centenario P2';
    PA_ORGANIZADOR_TORNEO.MOD_ESTADIO(v_id_est, 'Estadio Centenario P2', 'Calle 53', 45000, 'Natural');
END;
/

/*
6. Debido a un evento externo en la ciudad, el Organizador inscribe 
un nuevo estadio en el sistema para usarlo de apoyo.
*/
BEGIN
    PA_ORGANIZADOR_TORNEO.AD_ESTADIO('Estadio Municipal P2', 'Medellin', 'Av 10', 20000, 'Sintetica');
END;
/

/*
7. El Organizador programa los 2 partidos de la Fecha 1, distribuyendo 
a los equipos entre el Estadio Centenario P2 y el nuevo Estadio Municipal P2.
*/
DECLARE
    v_id_tor NUMBER;
    v_id_est_muni NUMBER;
    v_id_est_cent NUMBER;
    v_eq1 NUMBER; v_eq2 NUMBER; v_eq3 NUMBER; v_eq4 NUMBER;
BEGIN
    SELECT Id_Torneo INTO v_id_tor FROM Torneo WHERE nombre = 'Copa Reestructuracion 2028';
    SELECT Id_Estadio INTO v_id_est_muni FROM Estadio WHERE nombre = 'Estadio Municipal P2';
    SELECT Id_Estadio INTO v_id_est_cent FROM Estadio WHERE nombre = 'Estadio Centenario P2';
    SELECT Id_Equipo INTO v_eq1 FROM Equipo WHERE nombre_oficial = 'Condores FC P2';
    SELECT Id_Equipo INTO v_eq2 FROM Equipo WHERE nombre_oficial = 'Jaguares del Valle P2';
    SELECT Id_Equipo INTO v_eq3 FROM Equipo WHERE nombre_oficial = 'Tigres del Sur P2';
    SELECT Id_Equipo INTO v_eq4 FROM Equipo WHERE nombre_oficial = 'Leones de la Costa P2';
    
    PA_ORGANIZADOR_TORNEO.AD_PARTIDO(v_id_tor, 'Fase de Grupos', v_id_est_muni, v_eq1, v_eq3, TO_DATE('2028-02-22 15:00', 'YYYY-MM-DD HH24:MI'));
    PA_ORGANIZADOR_TORNEO.AD_PARTIDO(v_id_tor, 'Fase de Grupos', v_id_est_cent, v_eq2, v_eq4, TO_DATE('2028-02-22 18:00', 'YYYY-MM-DD HH24:MI'));
END;
/

/*
8. El Técnico de uno de los equipos revisa el calendario completo de la Fase 
para planear la logística y entrenamientos.
*/

DECLARE
    v_cursor SYS_REFCURSOR;
    v_id_tor NUMBER;
BEGIN
    SELECT Id_Torneo INTO v_id_tor FROM Torneo WHERE nombre = 'Copa Reestructuracion 2028';
    PA_TECNICO.CO_PARTIDO_FASE(v_id_tor, 'Fase de Grupos', v_cursor);
    --DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/

/*
9. Asimismo, el Técnico consulta el historial de estadios disponibles en el sistema.
*/
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    PA_TECNICO.CO_ESTADIO_PARTIDOS(v_cursor);
    --DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/

/*
10. El Arbitro principal solicita una corrección registral en su nombre 
legal, lo cual es ejecutado exclusivamente por el Administrador del Sistema.
*/
DECLARE
    v_id_per NUMBER;
BEGIN
    SELECT Id_Persona INTO v_id_per FROM Persona WHERE DNI = 'DNI-ORG-P2';
    PA_ADMINISTRADOR_SISTEMA.MOD_PERSONA(v_id_per, 'Roberto Carlos', 'Gomez', TO_DATE('1975-04-12', 'YYYY-MM-DD'));
END;
/

/*
11. El Administrador ejecuta una auditoría de todo el personal registrado 
para validar que la actualización de datos se aplicara correctamente.
*/
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    PA_ADMINISTRADOR_SISTEMA.CO_PERSONA(v_cursor);
    --DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/

/*
12. El Organizador del Torneo genera un reporte del estado de los torneos 
activos para presentarlo a la junta directiva y patrocinadores.
*/
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    PA_ORGANIZADOR_TORNEO.CO_TORNEO(v_cursor);
    --DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/

/*
13. Finalmente, el Público General consulta el fixture oficial actualizado.
*/
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    PA_PUBLICO_GENERAL.CO_PARTIDO(v_cursor);
    --DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/
