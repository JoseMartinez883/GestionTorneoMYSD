-- 09_DisparadoresOk.sql

SET SERVEROUTPUT ON;
SET VERIFY OFF;

-- Equipos base
INSERT INTO Equipo VALUES (4000, 'Tigres FC', NULL, SYSDATE);
INSERT INTO Equipo VALUES (4001, 'Leones FC', NULL, SYSDATE);
INSERT INTO Equipo VALUES (4008, 'Aguilas FC', NULL, SYSDATE);
INSERT INTO Equipo VALUES (4009, 'Halcones FC', NULL, SYSDATE);

-- 1. Jugadores (Cumplen exclusividad, >= 17 anios)
INSERT INTO Persona VALUES (4000, 'CC-J1', 'Juan', 'Perez', TO_DATE('1995-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (4000, 4000, 'Defensa', 4, 75, 1.80, 'Colombiana');
INSERT INTO Persona VALUES (4001, 'CC-J2', 'Mario', 'Gomez', TO_DATE('1998-05-10', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (4001, 4001, 'Delantero', 9, 72, 1.75, 'Colombiana');

-- 2. Tecnicos (Cumplen exclusividad, >= 18 anios)
INSERT INTO Persona VALUES (4002, 'CC-T1', 'Carlos', 'Ruiz', TO_DATE('1980-08-20', 'YYYY-MM-DD'));
INSERT INTO Tecnico VALUES (4002, 4000, 'Principal');
INSERT INTO Persona VALUES (4003, 'CC-T2', 'Luis', 'Diaz', TO_DATE('1975-11-30', 'YYYY-MM-DD'));
INSERT INTO Tecnico VALUES (4003, 4001, 'Principal');

-- 3. Arbitro (Cumple exclusividad, >= 18 anios)
INSERT INTO Persona VALUES (4004, 'CC-A1', 'Oscar', 'Ruiz', TO_DATE('1982-12-15', 'YYYY-MM-DD'));
INSERT INTO Arbitro VALUES (4004, 'Profesional');

-- 4. Representantes (Cumplen exclusividad, >= 18 anios)
INSERT INTO Persona VALUES (4005, 'CC-R1', 'Pedro', 'Mendez', TO_DATE('1970-03-25', 'YYYY-MM-DD'));
INSERT INTO Representante VALUES (4005, 4000, '300123', 'rep1@test.com', 'Presidente');
INSERT INTO Persona VALUES (4006, 'CC-R2', 'Ana', 'Lopez', TO_DATE('1985-07-14', 'YYYY-MM-DD'));
INSERT INTO Representante VALUES (4006, 4001, '300456', 'rep2@test.com', 'Manager');
INSERT INTO Persona VALUES (4008, 'CC-R3', 'Luis', 'Gomez', TO_DATE('1980-01-01', 'YYYY-MM-DD'));
INSERT INTO Representante VALUES (4008, 4008, '300789', 'rep3@test.com', 'Presidente');
INSERT INTO Persona VALUES (4009, 'CC-R4', 'Sara', 'Mesa', TO_DATE('1982-01-01', 'YYYY-MM-DD'));
INSERT INTO Representante VALUES (4009, 4009, '300000', 'rep4@test.com', 'Manager');

-- 5. Organizador (Cumple exclusividad, >= 18 anios)
INSERT INTO Persona VALUES (4007, 'CC-O1', 'Julio', 'Torres', TO_DATE('1965-09-05', 'YYYY-MM-DD'));
INSERT INTO Organizador VALUES (4007, 'Ejecutivo');

PROMPT =========================================================================;
PROMPT PRUEBA 2: MODIFICACIONES PERMITIDAS EN ACTORES;
PROMPT =========================================================================;

-- Modificar Persona (Juan)
UPDATE Persona SET Nombres = 'Juanito', Fecha_nacimiento = TO_DATE('1996-01-01', 'YYYY-MM-DD') WHERE Id_Persona = 4000;

-- Modificar Jugador (Peso)
UPDATE Jugador SET peso = 73 WHERE Id_Persona = 4000;

-- Modificar Tecnico (Rol de Asistente a Principal no dispara error de equipo)
UPDATE Tecnico SET Rol = 'Asistente' WHERE Id_Persona = 4002;

-- Modificar Arbitro (Categoria)
UPDATE Arbitro SET Categoria = 'Amateur' WHERE Id_Persona = 4004;

-- Modificar Representante (Telefono)
UPDATE Representante SET Telefono = '320999' WHERE Id_Persona = 4005;

-- Modificar Organizador (Rol)
UPDATE Organizador SET Cargo = 'Principal' WHERE Id_Persona = 4007;

PROMPT =========================================================================;
PROMPT CREACION DEL TORNEO E INSCRIPCIONES;
PROMPT =========================================================================;

INSERT INTO Torneo VALUES (4000, 'Copa Diamante', '2028-I', TO_DATE('2028-02-01','YYYY-MM-DD'), TO_DATE('2028-12-01','YYYY-MM-DD'), 'Programado');
INSERT INTO Inscripcion (Id_Inscripcion, Id_Equipo, Id_Torneo, Id_Representante) VALUES (4000, 4000, 4000, 4005);
INSERT INTO Inscripcion (Id_Inscripcion, Id_Equipo, Id_Torneo, Id_Representante) VALUES (4001, 4001, 4000, 4006);
INSERT INTO Inscripcion (Id_Inscripcion, Id_Equipo, Id_Torneo, Id_Representante) VALUES (4008, 4008, 4000, 4008);
INSERT INTO Inscripcion (Id_Inscripcion, Id_Equipo, Id_Torneo, Id_Representante) VALUES (4009, 4009, 4000, 4009);

SELECT Id_Torneo, estado FROM Torneo WHERE Id_Torneo = 4000;
SELECT Id_Inscripcion, Id_Equipo, Estado FROM Inscripcion WHERE Id_Torneo = 4000;

PROMPT =========================================================================;
PROMPT COMPLETANDO PLANTILLAS Y ACEPTANDO INSCRIPCIONES;
PROMPT =========================================================================;

BEGIN
  -- 11 jugadores para Tigres (4000)
  FOR i IN 1..11 LOOP
    INSERT INTO Persona VALUES (4010+i, 'C-T'||i, 'Tigre'||i, 'Gen', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
    INSERT INTO Jugador VALUES (4010+i, 4000, 'Mediocampista', i+15, 70, 1.70, 'Colombiana');
  END LOOP;
  -- 11 jugadores para Leones (4001)
  FOR i IN 1..11 LOOP
    INSERT INTO Persona VALUES (4030+i, 'C-L'||i, 'Leon'||i, 'Gen', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
    INSERT INTO Jugador VALUES (4030+i, 4001, 'Mediocampista', i+15, 70, 1.70, 'Colombiana');
  END LOOP;
  -- 11 jugadores para Aguilas (4008)
  FOR i IN 1..11 LOOP
    INSERT INTO Persona VALUES (4050+i, 'C-A'||i, 'Aguila'||i, 'Gen', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
    INSERT INTO Jugador VALUES (4050+i, 4008, 'Mediocampista', i+15, 70, 1.70, 'Colombiana');
  END LOOP;
  -- 11 jugadores para Halcones (4009)
  FOR i IN 1..11 LOOP
    INSERT INTO Persona VALUES (4070+i, 'C-H'||i, 'Halcon'||i, 'Gen', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
    INSERT INTO Jugador VALUES (4070+i, 4009, 'Mediocampista', i+15, 70, 1.70, 'Colombiana');
  END LOOP;
END;
/


UPDATE Inscripcion SET Estado = 'Aceptada' WHERE Id_Torneo = 4000;

SELECT Id_Equipo, puntos, partidos_ganados FROM Estadistica_Equipo WHERE Id_Torneo = 4000;

PROMPT =========================================================================;
PROMPT PATROCINADORES Y ESTADIOS;
PROMPT =========================================================================;

-- 6. Estadio
-- Cambiamos el nombre para evitar el choque con el 'Estadio Central' de Bogota
INSERT INTO Estadio VALUES (4000, 'Estadio Pascual Guerrero', 'Cali', 'San Fernando', 35000, 'Natural');

PROMPT PATROCINADORES;
PROMPT =========================================================================;

INSERT INTO Patrocinador VALUES (4000, 'Nike', '800-1', 'Economico');
INSERT INTO Patrocinador VALUES (4001, 'Adidas', '800-2', 'Equipamiento');
INSERT INTO Patrocinador VALUES (4002, 'Puma', '800-3', 'Transporte');

-- Modificaciones permitidas
UPDATE Patrocinador SET tipo_aporte = 'Transporte' WHERE Id_Patrocinador = 4000;

-- Modificacion permitida
UPDATE Estadio SET capacidad = 20000, tipo_cancha = 'Sintetica' WHERE Id_Estadio = 4000;

PROMPT =========================================================================;
PROMPT FASES, CAMBIO DE ESTADO DEL TORNEO Y PARTIDOS;
PROMPT =========================================================================;


UPDATE Torneo SET Estado = 'En curso' WHERE Id_Torneo = 4000;
INSERT INTO Fase VALUES (4000, 'Fase de Grupos', 'Liga');

-- Modificar fase (Nombre_fase, permitido ya que no hay partidos aun)
UPDATE Fase SET nombre_fase = 'Fase de Grupos' WHERE Id_Torneo = 4000 AND nombre_fase = 'Fase de Grupos';

-- Crear 5 Partidos (Pendientes)
INSERT INTO Partido VALUES (4000, 4000, 'Fase de Grupos', 4000, 4000, 4001, TO_DATE('2028-03-01 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Partido VALUES (4001, 4000, 'Fase de Grupos', 4000, 4001, 4000, TO_DATE('2028-03-08 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Partido VALUES (4002, 4000, 'Fase de Grupos', 4000, 4000, 4001, TO_DATE('2028-03-15 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Partido VALUES (4003, 4000, 'Fase de Grupos', 4000, 4001, 4000, TO_DATE('2028-03-22 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Partido VALUES (4004, 4000, 'Fase de Grupos', 4000, 4000, 4001, TO_DATE('2028-03-29 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');

-- Asignar Arbitro al primer partido
INSERT INTO Arbitro_Partido VALUES (4004, 4000);

PROMPT =========================================================================;
PROMPT EJECUCION DE PARTIDOS Y GENERACION DE ESTADISTICAS;
PROMPT =========================================================================;

-- Partido 1: Gana Local (Tigres 4000) 2-1
UPDATE Partido SET estado = 'Jugado', goles_local = 2, goles_visitante = 1 WHERE Id_Partido = 4000;
-- Partido 2: Empate 1-1
UPDATE Partido SET estado = 'Jugado', goles_local = 1, goles_visitante = 1 WHERE Id_Partido = 4001;
-- Partido 3: Gana Visitante (Leones 4001) 0-3
UPDATE Partido SET estado = 'Jugado', goles_local = 0, goles_visitante = 3 WHERE Id_Partido = 4002;

PROMPT > Mostrando tabla final de Estadisticas
SELECT e.nombre_oficial AS Equipo, s.puntos, s.partidos_ganados AS PG, s.partidos_empatados AS PE, 
       s.goles_favor AS GF, s.goles_contra AS GC 
FROM Estadistica_Equipo s 
JOIN Equipo e ON s.Id_Equipo = e.Id_Equipo 
WHERE s.Id_Torneo = 4000 ORDER BY s.puntos DESC;