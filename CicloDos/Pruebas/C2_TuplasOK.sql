

s-- ========================================================================
-- PRUEBAS AISLADAS DE TUPLAS OK (CICLO 2)
-- Ingreso de datos correctos respetando absolutamente todos los disparadores
-- ========================================================================
-- ==========================================
-- 1. PREPARACION DEL ENTORNO AISLADO (SERIE 900)
-- Se cumple estrictamente con todos los disparadores del Ciclo 1
-- ==========================================
INSERT INTO Torneo (Id_Torneo, nombre, temporada, Fecha_Inicio, Fecha_Fin, estado) 
VALUES (900, 'Torneo Tuplas OK', '2026', TRUNC(SYSDATE)+1, TRUNC(SYSDATE)+30, 'Programado');

INSERT INTO Fase (Id_Torneo, nombre_fase, tipo_formato) VALUES (900, 'Fase de Grupos', 'Liga');

INSERT INTO Estadio (Id_Estadio, nombre, ciudad, capacidad, tipo_cancha) 
VALUES (900, 'Estadio 900', 'Bogota', 1000, 'Natural');

INSERT INTO Equipo (Id_Equipo, Nombre_Oficial, fecha_fundacion) VALUES (900, 'Local 900', SYSDATE-10);
INSERT INTO Equipo (Id_Equipo, Nombre_Oficial, fecha_fundacion) VALUES (901, 'Visit 901', SYSDATE-10);

-- Insertar 11 jugadores para el equipo local para poder aceptar su inscripcion
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90000, 'C90000', 'P0', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90000, 900, 'Mediocampista', 1, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90001, 'C90001', 'P1', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90001, 900, 'Mediocampista', 2, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90002, 'C90002', 'P2', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90002, 900, 'Mediocampista', 3, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90003, 'C90003', 'P3', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90003, 900, 'Mediocampista', 4, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90004, 'C90004', 'P4', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90004, 900, 'Mediocampista', 5, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90005, 'C90005', 'P5', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90005, 900, 'Mediocampista', 6, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90006, 'C90006', 'P6', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90006, 900, 'Mediocampista', 7, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90007, 'C90007', 'P7', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90007, 900, 'Mediocampista', 8, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90008, 'C90008', 'P8', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90008, 900, 'Mediocampista', 9, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90009, 'C90009', 'P9', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90009, 900, 'Mediocampista', 10, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90010, 'C90010', 'P10', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90010, 900, 'Mediocampista', 11, 70.0, 1.70, 'Colombia');

-- Insertar 11 jugadores para el equipo visitante
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90020, 'C90020', 'P0', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90020, 901, 'Mediocampista', 1, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90021, 'C90021', 'P1', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90021, 901, 'Mediocampista', 2, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90022, 'C90022', 'P2', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90022, 901, 'Mediocampista', 3, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90023, 'C90023', 'P3', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90023, 901, 'Mediocampista', 4, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90024, 'C90024', 'P4', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90024, 901, 'Mediocampista', 5, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90025, 'C90025', 'P5', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90025, 901, 'Mediocampista', 6, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90026, 'C90026', 'P6', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90026, 901, 'Mediocampista', 7, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90027, 'C90027', 'P7', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90027, 901, 'Mediocampista', 8, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90028, 'C90028', 'P8', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90028, 901, 'Mediocampista', 9, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90029, 'C90029', 'P9', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90029, 901, 'Mediocampista', 10, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (90030, 'C90030', 'P10', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (90030, 901, 'Mediocampista', 11, 70.0, 1.70, 'Colombia');

-- Inscripciones de los equipos

BEGIN
    INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, Fecha_Nacimiento) 
    VALUES (100900, 'REP100900', 'Rep', 'Gomez', TO_DATE('1980-01-01', 'YYYY-MM-DD'));
EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; END;
/
BEGIN
    INSERT INTO Representante (Id_Persona, Id_Equipo, Cargo) VALUES (100900, 900, 'Manager');
EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; END;
/
INSERT INTO Inscripcion (Id_Inscripcion, Id_Torneo, Id_Equipo, Id_Representante, Estado, Fecha_solicitud) 
VALUES (900, 900, 900, 100900, 'Pendiente', SYSDATE);


BEGIN
    INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, Fecha_Nacimiento) 
    VALUES (100901, 'REP100901', 'Rep', 'Gomez', TO_DATE('1980-01-01', 'YYYY-MM-DD'));
EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; END;
/
BEGIN
    INSERT INTO Representante (Id_Persona, Id_Equipo, Cargo) VALUES (100901, 901, 'Manager');
EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; END;
/
INSERT INTO Inscripcion (Id_Inscripcion, Id_Torneo, Id_Equipo, Id_Representante, Estado, Fecha_solicitud) 
VALUES (901, 900, 901, 100901, 'Pendiente', SYSDATE);


-- Aceptar inscripciones (El disparador exige 11 jugadores, que ya tenemos)
UPDATE Inscripcion SET Estado = 'Aceptada' WHERE Id_Inscripcion IN (900, 901);

-- Arbitro
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (950, 'C950', 'Arb', 'Cen', TO_DATE('1990-01-01', 'YYYY-MM-DD'));
INSERT INTO Arbitro (Id_Persona, Categoria) VALUES (950, 'Amateur');

-- Partido (El disparador exige inscripciones aceptadas y fecha dentro del torneo)
INSERT INTO Partido (Id_Partido, Id_Torneo, nombre_fase, Id_Estadio, Id_EquipoLocal, Id_EquipoVisitante, fecha_hora, estado, goles_local, goles_visitante) 
VALUES (900, 900, 'Fase de Grupos', 900, 900, 901, TRUNC(SYSDATE)+2, 'Pendiente', 0, 0);

INSERT INTO Tarifa (Id_Tarifa, Concepto, Valor) VALUES (900, 'Tarifa 900', 1000);

INSERT INTO Incidencia (Id_Incidencia, Id_Partido, Id_Arbitro, Id_Jugador, Minuto, Tipo) 
VALUES (900, 900, 950, 90000, 10, 'Amarilla');

-- ==========================================
-- 2. PRUEBAS OK DE LAS TUPLAS
-- ==========================================
-- Prueba Tarjetas (OK): Jugador con 5 partidos, 1 roja, 10 amarillas.
INSERT INTO Estadistica_Jugador (Id_Estadistica, Id_Jugador, Id_Torneo, Goles, Asistencias, Tarjetas_Amarillas, Tarjetas_Rojas, Partidos_Jugados) 
VALUES (900, 90000, 900, 0, 0, 10, 1, 5);

-- Prueba Castigo (OK): Resolucion con multa sin suspension
INSERT INTO Resolucion (Id_Resolucion, Id_Incidencia, Fechas_Suspension, Multa_Monto, Descripcion) 
VALUES (900, 900, 0, 50000, 'Multa OK sin suspension');

-- Prueba Factura (OK): Factura cobrando exclusivamente la resolucion
INSERT INTO Factura (Id_Factura, Id_Inscripcion, Id_Resolucion, Id_Tarifa, Fecha_Emision, Total, Estado) 
VALUES (900, NULL, 900, 900, SYSDATE, 50000, 'Pendiente');

-- ==========================================
-- 3. LIMPIEZA DEL ENTORNO AISLADO
-- ==========================================
DELETE FROM Pago WHERE Id_Factura IN (SELECT Id_Factura FROM Factura WHERE Id_Tarifa = 900);
DELETE FROM Factura WHERE Id_Tarifa = 900;
DELETE FROM Resolucion WHERE Id_Incidencia IN (SELECT Id_Incidencia FROM Incidencia WHERE Id_Partido = 900);
DELETE FROM Resolucion WHERE Descripcion IN ('Castigo Vacio', 'Multa Valida', 'Resolucion Cascada');
DELETE FROM Incidencia WHERE Id_Partido = 900;
DELETE FROM Estadistica_Jugador WHERE Id_Torneo = 900;
DELETE FROM Nomina WHERE Id_Partido = 900;
DELETE FROM Partido WHERE Id_Partido = 900;
DELETE FROM Arbitro WHERE Id_Arbitro = 950;
DELETE FROM Inscripcion WHERE Id_Torneo = 900;
DELETE FROM Estadistica_Equipo WHERE Id_Torneo = 900; -- Generado por trigger
DELETE FROM Jugador WHERE Id_Equipo IN (900, 901);
DELETE FROM Equipo WHERE Id_Equipo IN (900, 901);
DELETE FROM Persona WHERE Id_Persona BETWEEN 90000 AND 90050;
DELETE FROM Representante WHERE Id_Persona > 100000;
DELETE FROM Persona WHERE Id_Persona > 100000;
DELETE FROM Persona WHERE Id_Persona = 950;
DELETE FROM Estadio WHERE Id_Estadio = 900;
DELETE FROM Fase WHERE Id_Torneo = 900;
DELETE FROM Torneo WHERE Id_Torneo = 900;
DELETE FROM Tarifa WHERE Id_Tarifa = 900;
COMMIT;

