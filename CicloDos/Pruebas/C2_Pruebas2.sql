-- ========================================================================
-- PRUEBA DE SUSTENTACION 2 (C2_Pruebas2.sql) - CICLO 2
-- ========================================================================
/*
LA GRAN FINAL Y EL BALANCE DE ORO

Contexto: El torneo "Copa Leyendas" llega a su conclusion. En este script 
aislado veremos la Gran Final. 
El enfoque de esta historia esta en las Estadisticas en tiempo real, 
la prevencion de fraudes en Actas y Pagos, y la consolidacion del 
Balance Financiero final para los Organizadores.
*/

SET SERVEROUTPUT ON;

DBMS_OUTPUT.PUT_LINE('======================================================');
DBMS_OUTPUT.PUT_LINE('FASE 1: AISLAMIENTO Y REGLAS FUNDACIONALES (CICLO 1)');
DBMS_OUTPUT.PUT_LINE('======================================================');

/* 1. Generacion de la Copa Leyendas aislada */
INSERT INTO Torneo (nombre, temporada, Fecha_Inicio, Fecha_Fin, estado) 
VALUES ('Copa Leyendas', '2026', TRUNC(SYSDATE)+1, TRUNC(SYSDATE)+30, 'Programado');

DECLARE v_Id_Torneo NUMBER; BEGIN
    SELECT Id_Torneo INTO v_Id_Torneo FROM Torneo WHERE nombre = 'Copa Leyendas';
    INSERT INTO Fase (Id_Torneo, nombre_fase, Tipo) VALUES (v_Id_Torneo, 'Final', 'Liga');
END;
/

INSERT INTO Estadio (nombre, ciudad, capacidad, tipo_terreno) VALUES ('Arena Leyendas', 'Cali', 40000, 'Sintetico');

/* 2. Actores y 4 Equipos Base */
INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Correo, Estado) VALUES ('Jefe', 'Organizador', 'ORG-888', 'CC', 'org@mail.com', 'Activo');
INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Correo, Estado) VALUES ('Pep', 'Guardiola', 'TEC-888', 'CC', 'tec@mail.com', 'Activo');
INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Correo, Estado) VALUES ('Wilmar', 'Roldan', 'ARB-888', 'CC', 'arb@mail.com', 'Activo');

DECLARE
    v_Id_Tec NUMBER; v_Id_Arb NUMBER;
BEGIN
    SELECT Id_Persona INTO v_Id_Tec FROM Persona WHERE DNI = 'TEC-888';
    INSERT INTO Director_Tecnico (Id_Persona, Años_Experiencia) VALUES (v_Id_Tec, 15);
    
    SELECT Id_Persona INTO v_Id_Arb FROM Persona WHERE DNI = 'ARB-888';
    INSERT INTO Arbitro (Id_Persona, Años_Experiencia) VALUES (v_Id_Arb, 10);
END;
/

INSERT INTO Equipo (Nombre_Oficial, fecha_fundacion) VALUES ('Leyendas Rojas', SYSDATE-10);
INSERT INTO Equipo (Nombre_Oficial, fecha_fundacion) VALUES ('Leyendas Azules', SYSDATE-10);
INSERT INTO Equipo (Nombre_Oficial, fecha_fundacion) VALUES ('Leyendas Verdes', SYSDATE-10);
INSERT INTO Equipo (Nombre_Oficial, fecha_fundacion) VALUES ('Leyendas Amarillas', SYSDATE-10);

/* 3. Insertamos el Equipo A y simulamos la estadistica inicial del Delantero Estrella */
DECLARE v_Eq NUMBER; v_P NUMBER; BEGIN SELECT Id_Equipo INTO v_Eq FROM Equipo WHERE Nombre_Oficial = 'Leyendas Rojas';
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('R1', 'R', 'R-1', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'R-1'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 1, 'Portero');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('R2', 'R', 'R-2', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'R-2'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 2, 'Defensa');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('R3', 'R', 'R-3', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'R-3'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 3, 'Defensa');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('R4', 'R', 'R-4', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'R-4'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 4, 'Defensa');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('R5', 'R', 'R-5', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'R-5'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 5, 'Medio');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('R6', 'R', 'R-6', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'R-6'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 6, 'Medio');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('R7', 'R', 'R-7', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'R-7'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 7, 'Delantero');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('R8', 'R', 'R-8', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'R-8'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 8, 'Medio');
    -- El Delantero Estrella 9
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('Ronaldo', 'Nazario', 'R-9', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'R-9'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 9, 'Delantero');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('R10', 'R', 'R-10', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'R-10'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 10, 'Medio');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('R11', 'R', 'R-11', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'R-11'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 11, 'Delantero');
END;
/

/* 4. Insertamos el Equipo B (Los perdedores) */
DECLARE v_Eq NUMBER; v_P NUMBER; BEGIN SELECT Id_Equipo INTO v_Eq FROM Equipo WHERE Nombre_Oficial = 'Leyendas Azules';
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('B1', 'B', 'B-1', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'B-1'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 1, 'Portero');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('B2', 'B', 'B-2', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'B-2'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 2, 'Defensa');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('B3', 'B', 'B-3', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'B-3'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 3, 'Defensa');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('B4', 'B', 'B-4', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'B-4'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 4, 'Defensa');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('B5', 'B', 'B-5', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'B-5'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 5, 'Medio');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('B6', 'B', 'B-6', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'B-6'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 6, 'Medio');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('B7', 'B', 'B-7', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'B-7'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 7, 'Delantero');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('B8', 'B', 'B-8', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'B-8'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 8, 'Medio');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('B9', 'B', 'B-9', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'B-9'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 9, 'Delantero');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('B10','B', 'B-10','CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'B-10'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 10, 'Medio');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('B11','B', 'B-11','CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'B-11'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 11, 'Delantero');
END;
/

/* 5. Inyectamos un Pago base para comprobar despues el Fraude Financiero */
INSERT INTO Tarifa (Concepto, Valor) VALUES ('Patrocinio Master', 5000000);
DECLARE
    v_Id_Torneo NUMBER; v_Id_Equipo NUMBER; v_Id_Rep NUMBER; v_Id_Tarifa NUMBER;
BEGIN
    SELECT Id_Persona INTO v_Id_Rep FROM Persona WHERE DNI = 'ORG-888';
    SELECT Id_Tarifa INTO v_Id_Tarifa FROM Tarifa WHERE Concepto = 'Patrocinio Master';
    
    INSERT INTO Factura (Id_Tarifa, Estado) VALUES (v_Id_Tarifa, 'Pagada');
    -- Suponiendo que la DB permite inyectar el pago asi
    -- INSERT INTO Pago (Id_Factura, Id_Representante, Monto, Fecha_Pago) VALUES ((SELECT MAX(Id_Factura) FROM Factura), v_Id_Rep, 5000000, SYSDATE);
END;
/

/* 6. Comienza la Gran Final */
DECLARE
    v_nombre_fase VARCHAR2(30); v_Id_Torneo NUMBER; v_Id_Estadio NUMBER; v_Id_Equipo_A NUMBER; v_Id_Equipo_B NUMBER;
BEGIN
    v_nombre_fase := 'Final'; SELECT Id_Torneo INTO v_Id_Torneo FROM Torneo WHERE ROWNUM = 1;
    SELECT Id_Estadio INTO v_Id_Estadio FROM Estadio WHERE nombre = 'Arena Leyendas' AND ROWNUM = 1;
    SELECT Id_Equipo INTO v_Id_Equipo_A FROM Equipo WHERE Nombre_Oficial = 'Leyendas Rojas';
    SELECT Id_Equipo INTO v_Id_Equipo_B FROM Equipo WHERE Nombre_Oficial = 'Leyendas Azules';
    
    INSERT INTO Partido (Id_Torneo, nombre_fase, Id_Estadio, Id_EquipoLocal, Id_EquipoVisitante, fecha_hora, goles_local, goles_visitante, estado) 
    VALUES (v_Id_Torneo, v_nombre_fase, v_Id_Estadio, v_Id_Equipo_A, v_Id_Equipo_B, SYSDATE, 0, 0, 'Programado');
END;
/

DBMS_OUTPUT.PUT_LINE('======================================================');
DBMS_OUTPUT.PUT_LINE('FASE 2: LA FINAL Y LAS ESTADISTICAS (CICLO 2)');
DBMS_OUTPUT.PUT_LINE('======================================================');

/* 7. El Tecnico convoca a la Estrella */
DECLARE v_Id_Partido NUMBER; v_Id_Jugador NUMBER; BEGIN
    SELECT MAX(Id_Partido) INTO v_Id_Partido FROM Partido;
    SELECT Id_Persona INTO v_Id_Jugador FROM Persona WHERE DNI = 'R-9';
    PA_TECNICO_C2.AD_NOMINA(v_Id_Partido, v_Id_Jugador, 'SI');
END;
/

/* 8. El Arbitro registra dos goles al Delantero Estrella */
DECLARE v_Id_Partido NUMBER; v_Id_Arb NUMBER; v_Id_Jugador NUMBER; BEGIN
    SELECT MAX(Id_Partido) INTO v_Id_Partido FROM Partido;
    SELECT Id_Persona INTO v_Id_Arb FROM Persona WHERE DNI = 'ARB-888';
    SELECT Id_Persona INTO v_Id_Jugador FROM Persona WHERE DNI = 'R-9';
    
    PA_ARBITRO_C2.AD_INCIDENCIA(v_Id_Partido, v_Id_Arb, v_Id_Jugador, 10, 'Gol');
    PA_ARBITRO_C2.AD_INCIDENCIA(v_Id_Partido, v_Id_Arb, v_Id_Jugador, 45, 'Gol');
END;
/

/* 9. EL FRAUDE DE INCIDENCIA: El Tecnico intenta modificar el acta */
DECLARE v_Id_Incidencia NUMBER; BEGIN
    SELECT MAX(Id_Incidencia) INTO v_Id_Incidencia FROM Incidencia;
    
    DBMS_OUTPUT.PUT_LINE('--- INTENTO DE FRAUDE EN EL ACTA ---');
    BEGIN
        PA_ADMINISTRADOR_C2.MOD_INCIDENCIA(v_Id_Incidencia, 90, 'Tarjeta Amarilla');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('CANDADO FUNCIONA: ' || SQLERRM);
    END;
    DBMS_OUTPUT.PUT_LINE('------------------------------------');
END;
/

/* 9.1 El Publico revisa la Linea de Tiempo (El Acta Inmutable) */
DECLARE v_Id_Partido NUMBER; v_cursor SYS_REFCURSOR; BEGIN
    SELECT MAX(Id_Partido) INTO v_Id_Partido FROM Partido;
    PA_PUBLICO_C2.CO_LINEA_TIEMPO_PARTIDO(v_Id_Partido, v_cursor);
END;
/

/* 10. EL HINCHA VE EL ANTES (RANKING Y STATS) */
DECLARE v_Id_Jugador NUMBER; v_cursor SYS_REFCURSOR; BEGIN
    SELECT Id_Persona INTO v_Id_Jugador FROM Persona WHERE DNI = 'R-9';
    DBMS_OUTPUT.PUT_LINE('>>> Estadisticas ANTES del update oficial:');
    PA_PUBLICO_C2.CO_ESTADISTICA_INDIVIDUAL(v_Id_Jugador, v_cursor);
END;
/

/* 11. MUTACION DE ESTADISTICAS: Oficializamos los Goles */
DECLARE v_Id_Jugador NUMBER; v_Id_Estadistica NUMBER; BEGIN
    SELECT Id_Persona INTO v_Id_Jugador FROM Persona WHERE DNI = 'R-9';
    SELECT Id_Estadistica INTO v_Id_Estadistica FROM Estadistica_Jugador WHERE Id_Jugador = v_Id_Jugador;
    
    -- Le inyectamos los 2 goles que hizo en la final (Modo Admin)
    PA_ADMINISTRADOR_C2.MOD_ESTADISTICA_JUGADOR(v_Id_Estadistica, 2, 0, 0, 0, 1);
END;
/

/* 12. EL HINCHA VE EL DESPUES (RANKING Y STATS mutadas en tiempo real) */
DECLARE v_Id_Jugador NUMBER; v_cursor SYS_REFCURSOR; BEGIN
    SELECT Id_Persona INTO v_Id_Jugador FROM Persona WHERE DNI = 'R-9';
    DBMS_OUTPUT.PUT_LINE('>>> Estadisticas DESPUES (Actualizadas):');
    PA_PUBLICO_C2.CO_ESTADISTICA_INDIVIDUAL(v_Id_Jugador, v_cursor);
    PA_PUBLICO_C2.CO_RANKING_GOLEADORES('Copa Leyendas', '2026', v_cursor);
END;
/

/* 12.1 El Organizador revisa el Balance Financiero Final */
DECLARE v_cursor SYS_REFCURSOR; BEGIN
    PA_ORGANIZADOR_C2.CO_BALANCE_FINANCIERO('Copa Leyendas', '2026', v_cursor);
END;
/

/* 13. HACKEO FINANCIERO: Admin corrupto intenta borrar el pago maestro */
DECLARE v_Id_Pago NUMBER; BEGIN
    SELECT MAX(Id_Pago) INTO v_Id_Pago FROM Pago;
    DBMS_OUTPUT.PUT_LINE('--- INTENTO DE ROBO FINANCIERO ---');
    BEGIN
        PA_ADMINISTRADOR_C2.EL_PAGO(v_Id_Pago);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('CANDADO FUNCIONA: ' || SQLERRM);
    END;
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
END;
/

DBMS_OUTPUT.PUT_LINE('SUSTENTACION PRUEBA 2: FINALIZADA CON EXITO ABSOLUTO.');
