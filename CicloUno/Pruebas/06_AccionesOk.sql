DELETE FROM Representante WHERE Id_Persona = 500;
DELETE FROM Equipo WHERE Id_Equipo IN (500, 501);
DELETE FROM Inscripcion WHERE Id_Torneo = 500;
DELETE FROM Fase WHERE Id_Torneo = 500;
DELETE FROM Estadistica_Equipo WHERE Id_Torneo = 500;
DELETE FROM Torneo WHERE Id_Torneo = 500;
DELETE FROM Persona WHERE Id_Persona = 500;
DELETE FROM Patrocinador WHERE Id_Patrocinador = 500;
DELETE FROM Estadio WHERE Id_Estadio = 500;
COMMIT;

-- ========================================================================
-- SCRIPT DE VERIFICACIÓN DE ACCIONES OPERATIVAS Y REFERENCIALES (AccionesOk)
-- ========================================================================

-- PARTE 2: INSERCIÓN DE DATOS DE PRUEBA AISLADOS (SERIE 500)
-- ========================================================================
-- 1. Entidades Maestras Base
INSERT INTO Torneo VALUES (500, 'Torneo Nacional Cascadas', '2026', TO_DATE('2026-06-01', 'YYYY-MM-DD'), TO_DATE('2026-08-01', 'YYYY-MM-DD'), 'Programado');
INSERT INTO Fase VALUES (500, 'Final', 'Eliminacion directa');
INSERT INTO Estadio VALUES (500, 'Estadio Metropolitano 500', 'Bogota', NULL, 20000, 'Natural');
INSERT INTO Patrocinador VALUES (500, 'Patrocinador 500 S.A.', '999555111', 'Economico');

-- 2. Equipos de Prueba
INSERT INTO Equipo VALUES (500, 'Fantasmas FC', NULL, NULL);
INSERT INTO Equipo VALUES (501, 'Espectros SC', NULL, NULL);

-- 3. Entidades Restrictivas 
INSERT INTO Persona VALUES (500, 'CC-500', 'Representante', 'Uno', TO_DATE('1980-01-01', 'YYYY-MM-DD'));
INSERT INTO Representante VALUES (500, 500, '3000000500', 'rep500@test.com', 'Presidente');
INSERT INTO Inscripcion VALUES (500, 500, 500, 500, SYSDATE, 'Aceptada');
INSERT INTO Partido VALUES (500, 500, 'Final', 500, 500, 1, TO_DATE('2026-07-15 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (5, 500);

-- 4. Tablas Puente y Dependientes
INSERT INTO Torneo_Patrocinador VALUES (500, 500);
INSERT INTO Equipo_Patrocinador VALUES (500, 500);
INSERT INTO Equipo_Patrocinador VALUES (501, 500);
INSERT INTO Estadistica_Equipo VALUES (500, 500, 500, 0, 0, 0, 0, 0, 0);
INSERT INTO Estadistica_Equipo VALUES (501, 501, 500, 0, 0, 0, 0, 0, 0);

-- ========================================================================
-- PARTE 3: VERIFICACIÓN DEL EFECTO DOMINÓ Y AUDITORÍA 
-- ========================================================================
-- [PRUEBA 1]: Cascada desde la entidad Equipo (Id = 501)
DELETE FROM Equipo WHERE Id_Equipo = 501;

-- Auditorias 1 y 2
SELECT * FROM Equipo_Patrocinador WHERE Id_Equipo = 501;
SELECT * FROM Estadistica_Equipo WHERE Id_Equipo = 501;

-- [PRUEBA 2]: Cascada desde la entidad Partido (Id = 500)
DELETE FROM Partido WHERE Id_Partido = 500;

-- Auditoria 3
SELECT * FROM Arbitro_Partido WHERE Id_Partido = 500;

-- [PRUEBA 3]: Borrado Jerarquico de la entidad Torneo (Id = 500)
-- IMPORTANTE: Borramos todos los hijos restrictivos primero
DELETE FROM Fase WHERE Id_Torneo = 500;
DELETE FROM Inscripcion WHERE Id_Torneo = 500;
DELETE FROM Estadistica_Equipo WHERE Id_Torneo = 500; -- <- AQUÍ ESTÁ LA MAGIA

-- Ahora el Torneo sí se deja borrar
DELETE FROM Torneo WHERE Id_Torneo = 500;

-- Auditoria 4
SELECT * FROM Torneo_Patrocinador WHERE Id_Torneo = 500;

-- ========================================================================
-- PARTE 4: LIMPIEZA CONTROLADA DEL ENTORNO DE PRUEBAS
-- ========================================================================
DELETE FROM Representante WHERE Id_Persona = 500;
DELETE FROM Equipo WHERE Id_Equipo = 500;
DELETE FROM Persona WHERE Id_Persona = 500;
DELETE FROM Patrocinador WHERE Id_Patrocinador = 500;
DELETE FROM Estadio WHERE Id_Estadio = 500;

COMMIT;