-- 10_DisparadoresNoOk.sql

SET SERVEROUTPUT ON;
SET VERIFY OFF;

PROMPT PERSONAS (ROLES Y EDAD);

-- Prueba: TRG_MANTENER_PERSONA (Edad < 17 o fecha futura)
PROMPT Intentando registrar una persona que es menor de 17
INSERT INTO Persona VALUES (9901, 'CC-9901', 'Nino', 'Test', TO_DATE('2015-01-01', 'YYYY-MM-DD'));

-- Prueba: TRG_MANTENER_PERSONA (Modificar DNI)
PROMPT Intentando cambiar el DNI de una persona
UPDATE Persona SET DNI = 'CC-HACKED' WHERE Id_Persona = 4000;

-- Prueba: TRG_ADICIONAR_ARBITRO (Conflicto de exclusividad)
PROMPT Intentando que un jugador tambien sea arbitro
INSERT INTO Arbitro VALUES (4000, 'Amateur');

-- Prueba: TRG_ADICIONAR_REPRESENTANTE 
PROMPT Intentando que un tecnico sea representanten
INSERT INTO Representante VALUES (4002, 4000, '333', 'h@h.com', 'Presidente');

-- Prueba: TRG_ADICIONAR_TECNICO 
PROMPT Intentando insertar a una persona de 17 como Tecnico Requiere 18
INSERT INTO Persona VALUES (9902, 'CC-9902', 'Joven', 'Tec', TO_DATE('2009-01-01', 'YYYY-MM-DD'));
INSERT INTO Tecnico VALUES (9902, 4000, 'Asistente');

-- Prueba: TRG_ADICIONAR_ORGANIZADOR 
PROMPT Intentando insertar a una persona de 17 como Organizador
INSERT INTO Organizador VALUES (9902, 'Ejecutivo');


PROMPT SECCION 2: PROTECCION Y MODIFICACION ILEGAL DE ROLES;


-- Prueba: TRG_MODIFICAR_TECNICO (Cambio directo de equipo)
PROMPT Intentando cambiar al Tecnico 4002 de un equipo a otro equipo
UPDATE Tecnico SET Id_Equipo = 4001 WHERE Id_Persona = 4002;

-- Prueba: TRG_ELIMINAR_JUGADOR (con historial estadisticio)
PROMPT > Intentando borrar al Jugador 4000 que ya tiene estadisticas en el torneo...
DELETE FROM Jugador WHERE Id_Persona = 4000;

-- Prueba: TRG_ELIMINAR_TECNICO (DT Principal con partidos)
-- Error esperado: ORA-20021
PROMPT > Intentando despedir al DT Principal del Equipo 4001...
DELETE FROM Tecnico WHERE Id_Persona = 4003;

-- Prueba: TRG_ELIMINAR_ARBITRO (Con partidos asignados)
-- Error esperado: ORA-20032
PROMPT > Intentando borrar al Arbitro 4004 que ya pito un partido...
DELETE FROM Arbitro WHERE Id_Persona = 4004;

-- Prueba: TRG_ELIMINAR_REPRESENTANTE (De un equipo con inscripcion aceptada)
-- Error esperado: ORA-20040
PROMPT > Intentando borrar al unico Representante del Equipo 4000...
DELETE FROM Representante WHERE Id_Persona = 4005;


PROMPT -------------------------------------------------------------------------;
PROMPT  (EQUIPOS Y PATROCINADORES);
PROMPT -------------------------------------------------------------------------;

-- Prueba: TRG_MODIFICAR_EQUIPO (Cambiar nombre oficial con partidos)
PROMPT Intentando cambiar el nombre oficial del Equipo 4000 que ya esta jugando
UPDATE Equipo SET nombre_oficial = 'Tigres Hackers' WHERE Id_Equipo = 4000;

-- Prueba: TRG_ELIMINAR_EQUIPO (Con historial)
PROMPT Intentando borrar el Equipo 4000 de la base de datos...
DELETE FROM Equipo WHERE Id_Equipo = 4000;

-- Prueba: TRG_MODIFICAR_PATROCINADOR (Cambiar NIT)
PROMPT Intentando modificar el NIT legal del patrocinador 4000...
UPDATE Patrocinador SET NIT = '000-000' WHERE Id_Patrocinador = 4000;


PROMPT -------------------------------------------------------------------------;
PROMPT SECCION 4: INSCRIPCIONES;
PROMPT -------------------------------------------------------------------------;

-- Prueba: TRG_ADICIONAR_INSCRIPCION 
PROMPT Intentando meter una nueva inscripcion al Torneo que ya inicio
INSERT INTO Equipo VALUES (9900, 'Equipo Tarde', NULL, SYSDATE);
INSERT INTO Inscripcion (Id_Inscripcion, Id_Equipo, Id_Torneo, Id_Representante) VALUES (9900, 9900, 4000, 4005);

-- Prueba: TRG_MODIFICAR_INSCRIPCION 
PROMPT Intentando mover la inscripcion a otro torneo 
UPDATE Inscripcion SET Id_Torneo = 9999 WHERE Id_Inscripcion = 4000;

-- Prueba: TRG_INSCRIPCION_INICIALIZAR_ESTADISTICAS_AL_ACEPTAR 
PROMPT aprobar una inscripcion de un equipo nuevo sin jugadores...
INSERT INTO Torneo VALUES (9999, 'Torneo Vacio', '2029', TO_DATE('2029-01-01','YYYY-MM-DD'), TO_DATE('2029-12-01','YYYY-MM-DD'), 'Programado');
INSERT INTO Inscripcion (Id_Inscripcion, Id_Equipo, Id_Torneo, Id_Representante) VALUES (9901, 9900, 9999, 4005);
UPDATE Inscripcion SET Estado = 'Aceptada' WHERE Id_Inscripcion = 9901;

-- Prueba: TRG_ELIMINAR_INSCRIPCION 
PROMPT > Intentando borrar la inscripcion Aceptada 4000...
DELETE FROM Inscripcion WHERE Id_Inscripcion = 4000;


PROMPT FLUJO Y PROTECCION DE FASES;

PROMPT -------------------------------------------------------------------------;
PROMPT FLUJO Y PROTECCION DE FASES;
PROMPT -------------------------------------------------------------------------;

-- ==========================================
-- SETUP AISLADO (Garantiza que exista el dato)
-- ==========================================
-- 1. Creamos una fase exclusiva para esta prueba
INSERT INTO Fase VALUES (4000, 'Semifinal', 'Eliminacion directa');

-- 2. Le asignamos un partido asegurando que exista al menos 1 registro
-- (Usamos fecha dentro de Torneo 4000 y equipos 4000 y 4001 que ya están aceptados)
INSERT INTO Partido VALUES (9990, 4000, 'Semifinal', 4000, 4000, 4001, TO_DATE('2028-04-15 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');

-- ==========================================
-- PRUEBA DEL DISPARADOR
-- ==========================================
-- Prueba: TRG_ELIMINAR_FASE (Con partidos asociados)
PROMPT > Intentando eliminar la 'Semifinal' que acabamos de bloquear con un partido...
-- ERROR ESPERADO: ORA-20088
DELETE FROM Fase WHERE Id_Torneo = 4000 AND nombre_fase = 'Semifinal';

PROMPT -------------------------------------------------------------------------;
PROMPT INTEGRIDAD DE PARTIDOS;
PROMPT -------------------------------------------------------------------------;

-- Prueba: TRG_INSERTAR_PARTIDO (Fechas por fuera del torneo)
PROMPT Intentando programar un partido en 2030 para un torneo de 2028
INSERT INTO Partido VALUES (9999, 4000, 'Fase de Grupos', 4000, 4000, 4001, TO_DATE('2030-01-01 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');

-- Prueba: TRG_MODIFICAR_PARTIDO (Meter goles a partido pendiente)
PROMPT Intentando sumarle goles al partido Pendiente 4003
UPDATE Partido SET goles_local = 5 WHERE Id_Partido = 4003;

-- Prueba: TRG_MODIFICAR_PARTIDO (Cambiar estado de Jugado a Pendiente)
UPDATE Partido SET estado = 'Pendiente' WHERE Id_Partido = 4000;

-- Prueba: TRG_ELIMINAR_PARTIDO (Borrar partido Jugado)
DELETE FROM Partido WHERE Id_Partido = 4000;


PROMPT -------------------------------------------------------------------------;
PROMPT ESTADISTICAS;
PROMPT -------------------------------------------------------------------------;

-- Prueba: TRG_MODIFICAR_ESTADISTICA_EQUIPO 
PROMPT Intentando pasar las estadisticas del equipo 4000 al 4001
UPDATE Estadistica_Equipo SET Id_Equipo = 4001 WHERE Id_Equipo = 4000;

-- Prueba: TRG_ELIMINAR_ESTADISTICA_EQUIPO 
PROMPT Intentando borrar las estadisticas historicas del torneo
DELETE FROM Estadistica_Equipo WHERE Id_Torneo = 4000;


PROMPT -------------------------------------------------------------------------;
PROMPT SECCION 8: LEYES DEL TIEMPO EN TORNEOS;
PROMPT -------------------------------------------------------------------------;

-- Prueba: TRG_ELIMINAR_TORNEO (Borrar torneo "En curso")
PROMPT Intentando borrar el Torneo (que esta En curso)
DELETE FROM Torneo WHERE Id_Torneo = 4000;
