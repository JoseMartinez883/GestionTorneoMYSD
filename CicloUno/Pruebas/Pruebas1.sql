-------------------------PRUEBAS 1--------------------------
/*La Copa Esperanza
La Federación Colombiana de Fútbol decide crear un torneo benéfico llamado "Copa Esperanza 2028". 
Para poder iniciar legalmente el torneo, el reglamento exige que haya al menos 4 equipos inscritos, 
y que cada equipo cuente con un mínimo de 11 jugadores registrados. 
*/

SET SERVEROUTPUT ON;

/*
1. El Administrador del Sistema es el encargado de registrar toda la infraestructura humana 
inicial. Comienza registrando al Organizador General del torneo y al Arbitro principal.
*/

EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-ORG-1', 'Roberto', 'Gomez', TO_DATE('1975-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-ARB-1', 'Diego', 'Salazar', TO_DATE('1985-05-15', 'YYYY-MM-DD'));

/*
2. Luego, se registran las personas que actuarán como Representantes de los 4 equipos fundadores.
*/
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-REP-1', 'Camila', 'Rios', TO_DATE('1990-03-20', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-REP-2', 'Juan', 'Perez', TO_DATE('1988-07-10', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-REP-3', 'Luisa', 'Mendez', TO_DATE('1992-11-05', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-REP-4', 'Carlos', 'Ruiz', TO_DATE('1980-09-30', 'YYYY-MM-DD'));

/*
3. Para liderar a estos equipos, se registran 4 personas con experiencia técnica que serán los Directores Técnicos.
*/
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-DT-1', 'Jose', 'Pekerman', TO_DATE('1960-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-DT-2', 'Reinaldo', 'Rueda', TO_DATE('1965-02-02', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-DT-3', 'Luis', 'Pinto', TO_DATE('1962-03-03', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-DT-4', 'Hernan', 'Gomez', TO_DATE('1968-04-04', 'YYYY-MM-DD'));

/*
4. Finalmente, el administrador realiza el registro masivo de las 44 personas que jugarán en el torneo 
(11 jugadores base para cada uno de los 4 equipos, cumpliendo con la regla de negocio).
*/
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J1-1', 'Jugador1', 'C', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J1-2', 'Jugador2', 'C', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J1-3', 'Jugador3', 'C', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J1-4', 'Jugador4', 'C', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J1-5', 'Jugador5', 'C', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J1-6', 'Jugador6', 'C', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J1-7', 'Jugador7', 'C', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J1-8', 'Jugador8', 'C', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J1-9', 'Jugador9', 'C', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J1-10', 'Jugador10', 'C', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J1-11', 'Jugador11', 'C', TO_DATE('2000-01-01', 'YYYY-MM-DD'));

-- Equipo 2
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J2-1', 'Jugador1', 'J', TO_DATE('2001-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J2-2', 'Jugador2', 'J', TO_DATE('2001-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J2-3', 'Jugador3', 'J', TO_DATE('2001-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J2-4', 'Jugador4', 'J', TO_DATE('2001-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J2-5', 'Jugador5', 'J', TO_DATE('2001-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J2-6', 'Jugador6', 'J', TO_DATE('2001-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J2-7', 'Jugador7', 'J', TO_DATE('2001-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J2-8', 'Jugador8', 'J', TO_DATE('2001-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J2-9', 'Jugador9', 'J', TO_DATE('2001-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J2-10', 'Jugador10', 'J', TO_DATE('2001-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J2-11', 'Jugador11', 'J', TO_DATE('2001-01-01', 'YYYY-MM-DD'));

-- Equipo 3
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J3-1', 'Jugador1', 'T', TO_DATE('2002-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J3-2', 'Jugador2', 'T', TO_DATE('2002-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J3-3', 'Jugador3', 'T', TO_DATE('2002-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J3-4', 'Jugador4', 'T', TO_DATE('2002-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J3-5', 'Jugador5', 'T', TO_DATE('2002-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J3-6', 'Jugador6', 'T', TO_DATE('2002-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J3-7', 'Jugador7', 'T', TO_DATE('2002-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J3-8', 'Jugador8', 'T', TO_DATE('2002-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J3-9', 'Jugador9', 'T', TO_DATE('2002-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J3-10', 'Jugador10', 'T', TO_DATE('2002-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J3-11', 'Jugador11', 'T', TO_DATE('2002-01-01', 'YYYY-MM-DD'));

-- Equipo 4
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J4-1', 'Jugador1', 'L', TO_DATE('2003-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J4-2', 'Jugador2', 'L', TO_DATE('2003-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J4-3', 'Jugador3', 'L', TO_DATE('2003-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J4-4', 'Jugador4', 'L', TO_DATE('2003-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J4-5', 'Jugador5', 'L', TO_DATE('2003-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J4-6', 'Jugador6', 'L', TO_DATE('2003-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J4-7', 'Jugador7', 'L', TO_DATE('2003-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J4-8', 'Jugador8', 'L', TO_DATE('2003-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J4-9', 'Jugador9', 'L', TO_DATE('2003-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J4-10', 'Jugador10', 'L', TO_DATE('2003-01-01', 'YYYY-MM-DD'));
EXECUTE PA_ADMINISTRADOR_SISTEMA.AD_PERSONA('DNI-J4-11', 'Jugador11', 'L', TO_DATE('2003-01-01', 'YYYY-MM-DD'));

/*
5. Una vez creadas las personas, se le asigna el rol oficial de Organizador a Roberto.
*/
DECLARE v_id NUMBER; BEGIN SELECT Id_Persona INTO v_id FROM Persona WHERE DNI = 'DNI-ORG-1'; PA_ADMINISTRADOR_SISTEMA.AD_ORGANIZADOR(v_id, 'Principal'); END;
/

/*
6. Con el rol asignado, Roberto (el Organizador) crea oficialmente el Torneo "Copa Esperanza 2028".
Este nacerá automáticamente en estado 'Programado'. Además define la Fase de Grupos y el Estadio sede.
*/
EXECUTE PA_ORGANIZADOR_TORNEO.AD_TORNEO('Copa Esperanza 2028', '2028-1', TO_DATE('2028-02-01', 'YYYY-MM-DD'), TO_DATE('2028-06-30', 'YYYY-MM-DD'));

DECLARE v_id_tor NUMBER; BEGIN SELECT Id_Torneo INTO v_id_tor FROM Torneo WHERE nombre = 'Copa Esperanza 2028'; PA_ORGANIZADOR_TORNEO.AD_FASE(v_id_tor, 'Fase de Grupos', 'Liga'); END;
/

EXECUTE PA_ORGANIZADOR_TORNEO.AD_ESTADIO('Estadio Centenario', 'Bogota', 'Cra 30', 35000, 'Natural');

/*
7. Empieza la logística de los clubes. Los representantes crean sus respectivos Equipos en el sistema.
*/
EXECUTE PA_REPRESENTANTE_EQUIPO.AD_EQUIPO('Condores de Bogota', 'condor.png', TO_DATE('1950-01-01', 'YYYY-MM-DD'));
EXECUTE PA_REPRESENTANTE_EQUIPO.AD_EQUIPO('Jaguares del Valle', 'jaguar.png', TO_DATE('1960-01-01', 'YYYY-MM-DD'));
EXECUTE PA_REPRESENTANTE_EQUIPO.AD_EQUIPO('Tigres del Sur', 'tigre.png', TO_DATE('1970-01-01', 'YYYY-MM-DD'));
EXECUTE PA_REPRESENTANTE_EQUIPO.AD_EQUIPO('Leones de la Costa', 'leon.png', TO_DATE('1980-01-01', 'YYYY-MM-DD'));

/*
8. Se vincula a las personas con rol de representante a su respectivo equipo de forma exclusiva.
*/
DECLARE
    v_eq1 NUMBER; v_eq2 NUMBER; v_eq3 NUMBER; v_eq4 NUMBER;
    
    FUNCTION get_per_id(xDni IN VARCHAR2) RETURN NUMBER IS
        v_id NUMBER;
    BEGIN
        SELECT Id_Persona INTO v_id FROM Persona WHERE DNI = xDni;
        RETURN v_id;
    END;
BEGIN
    SELECT Id_Equipo INTO v_eq1 FROM Equipo WHERE nombre_oficial = 'Condores de Bogota';
    SELECT Id_Equipo INTO v_eq2 FROM Equipo WHERE nombre_oficial = 'Jaguares del Valle';
    SELECT Id_Equipo INTO v_eq3 FROM Equipo WHERE nombre_oficial = 'Tigres del Sur';
    SELECT Id_Equipo INTO v_eq4 FROM Equipo WHERE nombre_oficial = 'Leones de la Costa';

    PA_REPRESENTANTE_EQUIPO.AD_REPRESENTANTE(get_per_id('DNI-REP-1'), v_eq1, '300111', 'rep1@mail.com', 'Presidente');
    PA_REPRESENTANTE_EQUIPO.AD_REPRESENTANTE(get_per_id('DNI-REP-2'), v_eq2, '300222', 'rep2@mail.com', 'Presidente');
    PA_REPRESENTANTE_EQUIPO.AD_REPRESENTANTE(get_per_id('DNI-REP-3'), v_eq3, '300333', 'rep3@mail.com', 'Presidente');
    PA_REPRESENTANTE_EQUIPO.AD_REPRESENTANTE(get_per_id('DNI-REP-4'), v_eq4, '300444', 'rep4@mail.com', 'Presidente');
END;
/

/*
9. Los representantes fichan y asocian a sus Técnicos Principales.
*/
DECLARE
    v_eq1 NUMBER; v_eq2 NUMBER; v_eq3 NUMBER; v_eq4 NUMBER;
    
    FUNCTION get_per_id(xDni IN VARCHAR2) RETURN NUMBER IS
        v_id NUMBER;
    BEGIN
        SELECT Id_Persona INTO v_id FROM Persona WHERE DNI = xDni;
        RETURN v_id;
    END;
BEGIN
    SELECT Id_Equipo INTO v_eq1 FROM Equipo WHERE nombre_oficial = 'Condores de Bogota';
    SELECT Id_Equipo INTO v_eq2 FROM Equipo WHERE nombre_oficial = 'Jaguares del Valle';
    SELECT Id_Equipo INTO v_eq3 FROM Equipo WHERE nombre_oficial = 'Tigres del Sur';
    SELECT Id_Equipo INTO v_eq4 FROM Equipo WHERE nombre_oficial = 'Leones de la Costa';

    PA_REPRESENTANTE_EQUIPO.AD_TECNICO(get_per_id('DNI-DT-1'), v_eq1, 'Principal');
    PA_REPRESENTANTE_EQUIPO.AD_TECNICO(get_per_id('DNI-DT-2'), v_eq2, 'Principal');
    PA_REPRESENTANTE_EQUIPO.AD_TECNICO(get_per_id('DNI-DT-3'), v_eq3, 'Principal');
    PA_REPRESENTANTE_EQUIPO.AD_TECNICO(get_per_id('DNI-DT-4'), v_eq4, 'Principal');
END;
/

/*
10. Acto seguido, cada representante asocia a los 11 jugadores requeridos para su plantilla oficial.
Esto es vital para no ser rechazados en la inscripción.
*/
DECLARE
    v_eq1 NUMBER; v_eq2 NUMBER; v_eq3 NUMBER; v_eq4 NUMBER;
    v_per NUMBER;
BEGIN
    SELECT Id_Equipo INTO v_eq1 FROM Equipo WHERE nombre_oficial = 'Condores de Bogota';
    SELECT Id_Equipo INTO v_eq2 FROM Equipo WHERE nombre_oficial = 'Jaguares del Valle';
    SELECT Id_Equipo INTO v_eq3 FROM Equipo WHERE nombre_oficial = 'Tigres del Sur';
    SELECT Id_Equipo INTO v_eq4 FROM Equipo WHERE nombre_oficial = 'Leones de la Costa';
    
    -- Equipo 1
    FOR i IN 1..11 LOOP
        SELECT Id_Persona INTO v_per FROM Persona WHERE DNI = 'DNI-J1-' || i;
        IF i = 1 THEN
            PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq1, 'Portero', 1, 80, 1.90, 'Col');
        ELSIF i IN (2,3,4,5) THEN
            PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq1, 'Defensa', i, 75, 1.85, 'Col');
        ELSIF i IN (6,7,8) THEN
            PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq1, 'Mediocampista', i, 70, 1.75, 'Col');
        ELSIF i = 9 THEN
            PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq1, 'Delantero', 9, 82, 1.88, 'Arg');
        ELSE
            PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq1, 'Delantero', i, 80, 1.80, 'Col');
        END IF;
    END LOOP;

    -- Equipo 2
    FOR i IN 1..11 LOOP
        SELECT Id_Persona INTO v_per FROM Persona WHERE DNI = 'DNI-J2-' || i;
        IF i = 1 THEN
            PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq2, 'Portero', 1, 80, 1.90, 'Col');
        ELSIF i IN (2,3,4,5) THEN
            PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq2, 'Defensa', i, 75, 1.85, 'Col');
        ELSIF i IN (6,7,8) THEN
            PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq2, 'Mediocampista', i, 70, 1.75, 'Col');
        ELSE
            PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq2, 'Delantero', i, 80, 1.80, 'Col');
        END IF;
    END LOOP;

    -- Equipo 3
    FOR i IN 1..11 LOOP
        SELECT Id_Persona INTO v_per FROM Persona WHERE DNI = 'DNI-J3-' || i;
        IF i = 1 THEN
            PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq3, 'Portero', 1, 80, 1.90, 'Col');
        ELSIF i IN (2,3,4,5) THEN
            PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq3, 'Defensa', i, 75, 1.85, 'Col');
        ELSIF i IN (6,7,8) THEN
            PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq3, 'Mediocampista', i, 70, 1.75, 'Col');
        ELSE
            PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq3, 'Delantero', i, 80, 1.80, 'Col');
        END IF;
    END LOOP;

    -- Equipo 4
    FOR i IN 1..11 LOOP
        SELECT Id_Persona INTO v_per FROM Persona WHERE DNI = 'DNI-J4-' || i;
        IF i = 1 THEN
            PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq4, 'Portero', 1, 80, 1.90, 'Col');
        ELSIF i IN (2,3,4,5) THEN
            PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq4, 'Defensa', i, 75, 1.85, 'Col');
        ELSIF i IN (6,7,8) THEN
            PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq4, 'Mediocampista', i, 70, 1.75, 'Col');
        ELSE
            PA_REPRESENTANTE_EQUIPO.AD_JUGADOR(v_per, v_eq4, 'Delantero', i, 80, 1.80, 'Col');
        END IF;
    END LOOP;
END;
/

/*
11. Con las plantillas listas, los representantes envían la solicitud de inscripción.
*/
DECLARE
    v_id_tor NUMBER;
    v_eq1 NUMBER; v_eq2 NUMBER; v_eq3 NUMBER; v_eq4 NUMBER;
    v_rep1 NUMBER; v_rep2 NUMBER; v_rep3 NUMBER; v_rep4 NUMBER;
BEGIN
    SELECT Id_Torneo INTO v_id_tor FROM Torneo WHERE nombre = 'Copa Esperanza 2028';
    SELECT Id_Equipo INTO v_eq1 FROM Equipo WHERE nombre_oficial = 'Condores de Bogota';
    SELECT Id_Equipo INTO v_eq2 FROM Equipo WHERE nombre_oficial = 'Jaguares del Valle';
    SELECT Id_Equipo INTO v_eq3 FROM Equipo WHERE nombre_oficial = 'Tigres del Sur';
    SELECT Id_Equipo INTO v_eq4 FROM Equipo WHERE nombre_oficial = 'Leones de la Costa';
    
    SELECT Id_Persona INTO v_rep1 FROM Representante WHERE Id_Equipo = v_eq1;
    SELECT Id_Persona INTO v_rep2 FROM Representante WHERE Id_Equipo = v_eq2;
    SELECT Id_Persona INTO v_rep3 FROM Representante WHERE Id_Equipo = v_eq3;
    SELECT Id_Persona INTO v_rep4 FROM Representante WHERE Id_Equipo = v_eq4;
    
    PA_REPRESENTANTE_EQUIPO.AD_INSCRIPCION(v_eq1, v_id_tor, v_rep1);
    PA_REPRESENTANTE_EQUIPO.AD_INSCRIPCION(v_eq2, v_id_tor, v_rep2);
    PA_REPRESENTANTE_EQUIPO.AD_INSCRIPCION(v_eq3, v_id_tor, v_rep3);
    PA_REPRESENTANTE_EQUIPO.AD_INSCRIPCION(v_eq4, v_id_tor, v_rep4);
END;
/

/*
12. Roberto (Organizador) evalúa las inscripciones y las aprueba.
Aquí actúa el Trigger de validación de 11 jugadores min., y se generan
automáticamente los registros de estadísticas base (en 0).
*/
DECLARE
    v_id_tor NUMBER;
    v_ins1 NUMBER; v_ins2 NUMBER; v_ins3 NUMBER; v_ins4 NUMBER;
BEGIN
    SELECT Id_Torneo INTO v_id_tor FROM Torneo WHERE nombre = 'Copa Esperanza 2028';
    SELECT Id_Inscripcion INTO v_ins1 FROM Inscripcion WHERE Id_Torneo = v_id_tor AND Id_Equipo = (SELECT Id_Equipo FROM Equipo WHERE nombre_oficial = 'Condores de Bogota');
    SELECT Id_Inscripcion INTO v_ins2 FROM Inscripcion WHERE Id_Torneo = v_id_tor AND Id_Equipo = (SELECT Id_Equipo FROM Equipo WHERE nombre_oficial = 'Jaguares del Valle');
    SELECT Id_Inscripcion INTO v_ins3 FROM Inscripcion WHERE Id_Torneo = v_id_tor AND Id_Equipo = (SELECT Id_Equipo FROM Equipo WHERE nombre_oficial = 'Tigres del Sur');
    SELECT Id_Inscripcion INTO v_ins4 FROM Inscripcion WHERE Id_Torneo = v_id_tor AND Id_Equipo = (SELECT Id_Equipo FROM Equipo WHERE nombre_oficial = 'Leones de la Costa');
    
    PA_ORGANIZADOR_TORNEO.MOD_INSCRIPCION_ESTADO(v_ins1, 'Aceptada');
    PA_ORGANIZADOR_TORNEO.MOD_INSCRIPCION_ESTADO(v_ins2, 'Aceptada');
    PA_ORGANIZADOR_TORNEO.MOD_INSCRIPCION_ESTADO(v_ins3, 'Aceptada');
    PA_ORGANIZADOR_TORNEO.MOD_INSCRIPCION_ESTADO(v_ins4, 'Aceptada');
END;
/

/*
13. Como paso de seguridad, el Administrador verifica los equipos 
que quedaron inscritos usando el procedimiento de lectura (Cursor).
*/
DECLARE
    v_cursor SYS_REFCURSOR;
    v_id_tor NUMBER;
BEGIN
    SELECT Id_Torneo INTO v_id_tor FROM Torneo WHERE nombre = 'Copa Esperanza 2028';
    PA_REPRESENTANTE_EQUIPO.CO_EQUIPOS_INSCRITOS(v_id_tor, v_cursor);
    --DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/

/*
14. HITO: Con 4 equipos aceptados, el Organizador cambia el estado 
del Torneo a 'En curso'. El trigger valida que se cumple el Quorum.
*/
DECLARE
    v_id_tor NUMBER;
    v_id_per NUMBER;
BEGIN
    SELECT Id_Torneo INTO v_id_tor FROM Torneo WHERE nombre = 'Copa Esperanza 2028';
    SELECT Id_Persona INTO v_id_per FROM Persona WHERE DNI = 'DNI-ORG-1';
    
    PA_ORGANIZADOR_TORNEO.MOD_TORNEO(v_id_tor, 'Copa Esperanza 2028', '2028-1', TO_DATE('2028-02-01', 'YYYY-MM-DD'), TO_DATE('2028-06-30', 'YYYY-MM-DD'), 'En curso', v_id_per);
END;
/

/*
15. Con el torneo iniciado, el Organizador ficha al árbitro y 
programa los 2 primeros partidos de la Fecha 1.
*/
DECLARE
    v_arb NUMBER;
    v_conteo NUMBER;
BEGIN
    SELECT Id_Persona INTO v_arb FROM Persona WHERE DNI = 'DNI-ARB-1';
    SELECT COUNT(*) INTO v_conteo FROM Arbitro WHERE Id_Persona = v_arb;
    IF v_conteo = 0 THEN
        PA_ORGANIZADOR_TORNEO.AD_ARBITRO(v_arb, 'Profesional');
    END IF;
END;
/

DECLARE
    v_id_tor NUMBER;
    v_id_est NUMBER;
    v_eq1 NUMBER; v_eq2 NUMBER; v_eq3 NUMBER; v_eq4 NUMBER;
    v_arb NUMBER;
    v_p1 NUMBER; v_p2 NUMBER;
BEGIN
    SELECT Id_Torneo INTO v_id_tor FROM Torneo WHERE nombre = 'Copa Esperanza 2028';
    SELECT Id_Estadio INTO v_id_est FROM Estadio WHERE nombre = 'Estadio Centenario';
    SELECT Id_Equipo INTO v_eq1 FROM Equipo WHERE nombre_oficial = 'Condores de Bogota';
    SELECT Id_Equipo INTO v_eq2 FROM Equipo WHERE nombre_oficial = 'Jaguares del Valle';
    SELECT Id_Equipo INTO v_eq3 FROM Equipo WHERE nombre_oficial = 'Tigres del Sur';
    SELECT Id_Equipo INTO v_eq4 FROM Equipo WHERE nombre_oficial = 'Leones de la Costa';
    SELECT Id_Persona INTO v_arb FROM Persona WHERE DNI = 'DNI-ARB-1';
    
    -- Programar Partidos
    PA_ORGANIZADOR_TORNEO.AD_PARTIDO(v_id_tor, 'Fase de Grupos', v_id_est, v_eq1, v_eq2, TO_DATE('2028-02-15 15:00', 'YYYY-MM-DD HH24:MI'));
    PA_ORGANIZADOR_TORNEO.AD_PARTIDO(v_id_tor, 'Fase de Grupos', v_id_est, v_eq3, v_eq4, TO_DATE('2028-02-15 18:00', 'YYYY-MM-DD HH24:MI'));
    
    -- Obtener IDs de Partidos creados
    SELECT MAX(Id_Partido) INTO v_p1 FROM Partido WHERE Id_EquipoLocal = v_eq1 AND Id_EquipoVisitante = v_eq2;
    SELECT MAX(Id_Partido) INTO v_p2 FROM Partido WHERE Id_EquipoLocal = v_eq3 AND Id_EquipoVisitante = v_eq4;
    
    -- Asignar Arbitro a los partidos
    PA_ORGANIZADOR_TORNEO.AD_ARBITRO_PARTIDO(v_arb, v_p1);
    PA_ORGANIZADOR_TORNEO.AD_ARBITRO_PARTIDO(v_arb, v_p2);
END;
/

/*
19. Llega el día de los partidos. El Arbitro (Diego) registra los resultados
oficiales. Cóndores gana 3-1 y los otros empatan 2-2. 
Aquí los triggers sumarán automáticamente los puntos y goles.
*/
DECLARE
    v_eq1 NUMBER; v_eq2 NUMBER; v_eq3 NUMBER; v_eq4 NUMBER;
    v_p1 NUMBER; v_p2 NUMBER;
BEGIN
    SELECT Id_Equipo INTO v_eq1 FROM Equipo WHERE nombre_oficial = 'Condores de Bogota';
    SELECT Id_Equipo INTO v_eq2 FROM Equipo WHERE nombre_oficial = 'Jaguares del Valle';
    SELECT Id_Equipo INTO v_eq3 FROM Equipo WHERE nombre_oficial = 'Tigres del Sur';
    SELECT Id_Equipo INTO v_eq4 FROM Equipo WHERE nombre_oficial = 'Leones de la Costa';
    
    SELECT MAX(Id_Partido) INTO v_p1 FROM Partido WHERE Id_EquipoLocal = v_eq1 AND Id_EquipoVisitante = v_eq2;
    SELECT MAX(Id_Partido) INTO v_p2 FROM Partido WHERE Id_EquipoLocal = v_eq3 AND Id_EquipoVisitante = v_eq4;
    
    PA_ARBITRO.MOD_PARTIDO(v_p1, TO_DATE('2028-02-15 15:00', 'YYYY-MM-DD HH24:MI'), 'Jugado', 3, 1);
    PA_ARBITRO.MOD_PARTIDO(v_p2, TO_DATE('2028-02-15 18:00', 'YYYY-MM-DD HH24:MI'), 'Jugado', 2, 2);
END;
/

/*
20. Finalizada la fecha, el Técnico de Cóndores revisa la 
tabla de posiciones para ver a su equipo en la punta.
*/
DECLARE
    v_cursor SYS_REFCURSOR;
    v_id_tor NUMBER;
BEGIN
    SELECT Id_Torneo INTO v_id_tor FROM Torneo WHERE nombre = 'Copa Esperanza 2028';
    PA_TECNICO.CO_TABLA_POSICIONES(v_id_tor, v_cursor);
    --DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/

/*
21. El público general ingresa al sistema (vista pública) para ver 
los resultados históricos de los partidos jugados.
*/
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    PA_PUBLICO_GENERAL.CO_PARTIDO(v_cursor);
    --DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/
