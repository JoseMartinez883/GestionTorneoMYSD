-- ========================================================================
-- PRUEBA DE SUSTENTACION 1 (C2_Pruebas1.sql) - CICLO 2
-- ========================================================================
/*
LA LIGA ESTELAR Y EL PARTIDO POLEMICO

Contexto: La Federacion decide crear un nuevo torneo hiper-competitivo llamado 
"Liga Estelar 2026". Para cumplir los estrictos reglamentos fundacionales del Ciclo 1, 
se exige la inscripcion obligatoria de al menos 4 equipos fundadores, y cada equipo 
debe aportar un minimo de 11 jugadores registrados (44 en total). 
Una vez superada la burocracia de creacion, estallara el drama financiero y 
disciplinario en la gran inauguracion.
*/

SET SERVEROUTPUT ON;

DBMS_OUTPUT.PUT_LINE('======================================================');
DBMS_OUTPUT.PUT_LINE('FASE 1: AISLAMIENTO Y REGLAS FUNDACIONALES (CICLO 1)');
DBMS_OUTPUT.PUT_LINE('======================================================');

/* 1. El Sistema auto-genera la infraestructura: Torneo, Fase y Estadio */
-- Los IDs son automaticos por los Triggers del Ciclo 1
INSERT INTO Torneo (nombre, temporada, Fecha_Inicio, Fecha_Fin, estado) 
VALUES ('Liga Estelar', '2026', TRUNC(SYSDATE)+1, TRUNC(SYSDATE)+30, 'Programado');

DECLARE v_Id_Torneo NUMBER; BEGIN
    SELECT Id_Torneo INTO v_Id_Torneo FROM Torneo WHERE nombre = 'Liga Estelar';
    INSERT INTO Fase (Id_Torneo, nombre_fase, Tipo) VALUES (v_Id_Torneo, 'Grupos', 'Liga');
END;
/

INSERT INTO Estadio (nombre, ciudad, capacidad, tipo_terreno) VALUES ('Monumental Estelar', 'Bogota', 50000, 'Natural');


/* 2. Registramos los Actores Administrativos Principales */
INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Correo, Estado) 
VALUES ('Don', 'Organizador', 'ORG-999', 'CC', 'org@mail.com', 'Activo');

INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Correo, Estado) 
VALUES ('Florentino', 'Perez', 'REP-999', 'CC', 'rep@mail.com', 'Activo');

INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Correo, Estado) 
VALUES ('Carlo', 'Ancelotti', 'TEC-999', 'CC', 'tec@mail.com', 'Activo');

INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Correo, Estado) 
VALUES ('Pierluigi', 'Collina', 'ARB-999', 'CC', 'arb@mail.com', 'Activo');

DECLARE
    v_Id_Rep NUMBER; v_Id_Tec NUMBER; v_Id_Arb NUMBER;
BEGIN
    SELECT Id_Persona INTO v_Id_Rep FROM Persona WHERE DNI = 'REP-999';
    INSERT INTO Representante (Id_Persona) VALUES (v_Id_Rep);
    
    SELECT Id_Persona INTO v_Id_Tec FROM Persona WHERE DNI = 'TEC-999';
    INSERT INTO Director_Tecnico (Id_Persona, Años_Experiencia) VALUES (v_Id_Tec, 10);
    
    SELECT Id_Persona INTO v_Id_Arb FROM Persona WHERE DNI = 'ARB-999';
    INSERT INTO Arbitro (Id_Persona, Años_Experiencia) VALUES (v_Id_Arb, 20);
END;
/

/* 3. Registramos los 4 Equipos Fundadores (Cumpliendo regla Ciclo 1) */
INSERT INTO Equipo (Nombre_Oficial, fecha_fundacion) VALUES ('Los Galacticos', SYSDATE-100);
INSERT INTO Equipo (Nombre_Oficial, fecha_fundacion) VALUES ('Los Titanes', SYSDATE-100);
INSERT INTO Equipo (Nombre_Oficial, fecha_fundacion) VALUES ('Los Espartanos', SYSDATE-100);
INSERT INTO Equipo (Nombre_Oficial, fecha_fundacion) VALUES ('Los Guerreros', SYSDATE-100);

/* 4. Registramos los 11 jugadores del Equipo 1: Los Galacticos */
DECLARE v_Eq NUMBER; v_P NUMBER; BEGIN SELECT Id_Equipo INTO v_Eq FROM Equipo WHERE Nombre_Oficial = 'Los Galacticos';
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('Paco', 'G', 'G-1', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'G-1'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 1, 'Portero');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('Luis', 'G', 'G-2', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'G-2'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 2, 'Defensa');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('Hugo', 'G', 'G-3', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'G-3'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 3, 'Defensa');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('Jose', 'G', 'G-4', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'G-4'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 4, 'Defensa');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('Raul', 'G', 'G-5', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'G-5'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 5, 'Medio');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('Alex', 'G', 'G-6', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'G-6'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 6, 'Medio');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('Ivan', 'G', 'G-7', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'G-7'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 7, 'Delantero');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('Omar', 'G', 'G-8', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'G-8'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 8, 'Medio');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('Cris', 'G', 'G-9', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'G-9'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 9, 'Delantero');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('Leo',  'G', 'G-10', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'G-10'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 10, 'Medio');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('Juan', 'G', 'G-11', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'G-11'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 11, 'Delantero');
END;
/

/* 5. Registramos los 11 jugadores del Equipo 2: Los Titanes */
DECLARE v_Eq NUMBER; v_P NUMBER; BEGIN SELECT Id_Equipo INTO v_Eq FROM Equipo WHERE Nombre_Oficial = 'Los Titanes';
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('T1', 'T', 'T-1', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'T-1'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 1, 'Portero');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('T2', 'T', 'T-2', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'T-2'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 2, 'Defensa');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('T3', 'T', 'T-3', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'T-3'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 3, 'Defensa');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('T4', 'T', 'T-4', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'T-4'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 4, 'Defensa');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('T5', 'T', 'T-5', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'T-5'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 5, 'Medio');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('T6', 'T', 'T-6', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'T-6'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 6, 'Medio');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('T7', 'T', 'T-7', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'T-7'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 7, 'Delantero');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('T8', 'T', 'T-8', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'T-8'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 8, 'Medio');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('T9', 'T', 'T-9', 'CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'T-9'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 9, 'Delantero');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('T10','T', 'T-10','CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'T-10'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 10, 'Medio');
    INSERT INTO Persona (Nombres, Apellidos, DNI, Tipo_Documento, Estado) VALUES ('T11','T', 'T-11','CC', 'Activo'); SELECT Id_Persona INTO v_P FROM Persona WHERE DNI = 'T-11'; INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (v_P, v_Eq, 11, 'Delantero');
END;
/

/* 6. Programamos el gran partido de inauguracion */
DECLARE
    v_nombre_fase VARCHAR2(30); v_Id_Torneo NUMBER; v_Id_Estadio NUMBER; v_Id_Equipo_A NUMBER; v_Id_Equipo_B NUMBER;
BEGIN
    v_nombre_fase := 'Grupos'; SELECT Id_Torneo INTO v_Id_Torneo FROM Torneo WHERE ROWNUM = 1;
    SELECT Id_Estadio INTO v_Id_Estadio FROM Estadio WHERE nombre = 'Monumental Estelar' AND ROWNUM = 1;
    SELECT Id_Equipo INTO v_Id_Equipo_A FROM Equipo WHERE Nombre_Oficial = 'Los Galacticos';
    SELECT Id_Equipo INTO v_Id_Equipo_B FROM Equipo WHERE Nombre_Oficial = 'Los Titanes';
    
    INSERT INTO Partido (Id_Torneo, nombre_fase, Id_Estadio, Id_EquipoLocal, Id_EquipoVisitante, fecha_hora, goles_local, goles_visitante, estado) 
    VALUES (v_Id_Torneo, v_nombre_fase, v_Id_Estadio, v_Id_Equipo_A, v_Id_Equipo_B, SYSDATE, 0, 0, 'Programado');
END;
/

DBMS_OUTPUT.PUT_LINE('======================================================');
DBMS_OUTPUT.PUT_LINE('FASE 2: LA DRAMATICA INAUGURACION (CICLO 2)');
DBMS_OUTPUT.PUT_LINE('======================================================');

/* 7. El Organizador crea las Tarifas dinamicamente en el paquete del C2 */
EXECUTE PA_ORGANIZADOR_C2.AD_TARIFA('Inscripcion Liga Estelar', 50000);
EXECUTE PA_ORGANIZADOR_C2.AD_TARIFA('Multa Tarjeta Roja', 25000);

/* 8. El Representante inscribe a su equipo. MAGIA: El Trigger crea la factura */
DECLARE
    v_Id_Torneo NUMBER; v_Id_Equipo NUMBER; v_Id_Rep NUMBER;
BEGIN
    SELECT Id_Torneo INTO v_Id_Torneo FROM Torneo WHERE nombre = 'Liga Estelar';
    SELECT Id_Equipo INTO v_Id_Equipo FROM Equipo WHERE Nombre_Oficial = 'Los Galacticos';
    SELECT Id_Persona INTO v_Id_Rep FROM Persona WHERE DNI = 'REP-999';
    
    INSERT INTO Inscripcion (Id_Torneo, Id_Equipo, Id_Representante, Estado) 
    VALUES (v_Id_Torneo, v_Id_Equipo, v_Id_Rep, 'Aceptada');
END;
/

/* 9. El Representante consulta si tiene morosos en el club */
DECLARE v_cursor SYS_REFCURSOR; BEGIN
    PA_REPRESENTANTE_C2.CO_MOROSOS('Los Galacticos', v_cursor);
END;
/

/* 10. Abonos Parciales: El Representante paga la inscripcion en dos cuotas */
DECLARE
    v_Id_Rep NUMBER;
    v_Id_Inscripcion NUMBER;
    v_Id_Factura NUMBER;
BEGIN
    SELECT Id_Persona INTO v_Id_Rep FROM Persona WHERE DNI = 'REP-999';
    SELECT MAX(Id_Inscripcion) INTO v_Id_Inscripcion FROM Inscripcion;
    SELECT Id_Factura INTO v_Id_Factura FROM Factura WHERE Id_Inscripcion = v_Id_Inscripcion;
    
    -- Abono 1: La factura pasa a Pendiente
    PA_REPRESENTANTE_C2.AD_PAGO(v_Id_Factura, v_Id_Rep, 25000); 
    -- Abono 2: El trigger liquida y pasa a Pagada
    PA_REPRESENTANTE_C2.AD_PAGO(v_Id_Factura, v_Id_Rep, 25000);
END;
/

/* 11. El Tecnico inscribe la Nomina Oficial */
DECLARE
    v_Id_Partido NUMBER;
    v_Id_Jugador NUMBER;
BEGIN
    SELECT MAX(Id_Partido) INTO v_Id_Partido FROM Partido;
    -- Llamamos a 'Leo' (El numero 10 y nuestro infractor estrella)
    SELECT Id_Persona INTO v_Id_Jugador FROM Persona WHERE DNI = 'G-10';
    
    PA_TECNICO_C2.AD_NOMINA(v_Id_Partido, v_Id_Jugador, 'SI');
END;
/

/* 11.1 El Tecnico imprime la Plantilla Oficial del Partido */
DECLARE v_Id_Partido NUMBER; v_cursor SYS_REFCURSOR; BEGIN
    SELECT MAX(Id_Partido) INTO v_Id_Partido FROM Partido;
    PA_TECNICO_C2.CO_PLANTILLA_PARTIDO(v_Id_Partido, 'Los Galacticos', v_cursor);
END;
/

/* 12. Drama: El Arbitro expulsa al jugador 10 en pleno partido */
DECLARE
    v_Id_Partido NUMBER; v_Id_Arb NUMBER; v_Id_Jugador NUMBER;
BEGIN
    SELECT MAX(Id_Partido) INTO v_Id_Partido FROM Partido;
    SELECT Id_Persona INTO v_Id_Arb FROM Persona WHERE DNI = 'ARB-999';
    SELECT Id_Persona INTO v_Id_Jugador FROM Persona WHERE DNI = 'G-10';
    
    PA_ARBITRO_C2.AD_INCIDENCIA(v_Id_Partido, v_Id_Arb, v_Id_Jugador, 45, 'Tarjeta Roja');
END;
/

/* 13. El Organizador impone la Sancion Disciplinaria */
DECLARE
    v_Id_Incidencia NUMBER;
BEGIN
    SELECT MAX(Id_Incidencia) INTO v_Id_Incidencia FROM Incidencia WHERE Tipo = 'Tarjeta Roja';
    -- MAGIA C2: Esta resolucion dispara una factura de multa automatica.
    PA_ORGANIZADOR_C2.AD_RESOLUCION(v_Id_Incidencia, 3, 25000, 'Expulsion directa por agresion');
END;
/

/* 13.1 El Representante asustado revisa su Historial de Sanciones */
DECLARE v_cursor SYS_REFCURSOR; BEGIN
    PA_REPRESENTANTE_C2.CO_HISTORIAL_SANCIONES('Los Galacticos', v_cursor);
END;
/

/* 14. EL HACKEO: El Tecnico intenta meter al jugador sancionado al SIGUIENTE partido */
DECLARE
    v_Id_Partido NUMBER; v_Id_Jugador NUMBER;
BEGIN
    SELECT MAX(Id_Partido) INTO v_Id_Partido FROM Partido;
    SELECT Id_Persona INTO v_Id_Jugador FROM Persona WHERE DNI = 'G-10';
    
    DBMS_OUTPUT.PUT_LINE('--- INTENTO DE HACKEO DE NOMINA ---');
    BEGIN
        -- Intentamos meterlo a la fuerza
        PA_TECNICO_C2.AD_NOMINA(v_Id_Partido, v_Id_Jugador, 'SI');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('CANDADO FUNCIONA: ' || SQLERRM);
    END;
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');
END;
/

/* 15. El Representante Paga la Multa para liberar a su estrella */
DECLARE
    v_Id_Rep NUMBER; v_Id_Resolucion NUMBER; v_Id_Factura NUMBER;
BEGIN
    SELECT Id_Persona INTO v_Id_Rep FROM Persona WHERE DNI = 'REP-999';
    SELECT MAX(Id_Resolucion) INTO v_Id_Resolucion FROM Resolucion;
    SELECT Id_Factura INTO v_Id_Factura FROM Factura WHERE Id_Resolucion = v_Id_Resolucion;
    
    -- Se paga el total de la multa
    PA_REPRESENTANTE_C2.AD_PAGO(v_Id_Factura, v_Id_Rep, 25000);
    DBMS_OUTPUT.PUT_LINE('SUSTENTACION PRUEBA 1: FINALIZADA CON EXITO ABSOLUTO.');
END;
/
