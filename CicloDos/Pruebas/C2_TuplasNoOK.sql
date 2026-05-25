

-- ========================================================================
-- PRUEBAS AISLADAS DE TUPLAS NO OK (CICLO 2)
-- Ataques logicos respetando los disparadores de negocio
-- ========================================================================
-- ==========================================
-- 1. PREPARACION DEL ENTORNO AISLADO (SERIE 910)
-- Se cumple estrictamente con todos los disparadores del Ciclo 1
-- ==========================================
INSERT INTO Torneo (Id_Torneo, nombre, temporada, Fecha_Inicio, Fecha_Fin, estado) 
VALUES (910, 'Torneo Tuplas Falla', '2026', TRUNC(SYSDATE)+1, TRUNC(SYSDATE)+30, 'Programado');

INSERT INTO Fase (Id_Torneo, nombre_fase, tipo_formato) VALUES (910, 'Fase de Grupos', 'Liga');

INSERT INTO Estadio (Id_Estadio, nombre, ciudad, capacidad, tipo_cancha) 
VALUES (910, 'Estadio 910', 'Bogota', 1000, 'Natural');

INSERT INTO Equipo (Id_Equipo, Nombre_Oficial, fecha_fundacion) VALUES (910, 'Local 910', SYSDATE-10);
INSERT INTO Equipo (Id_Equipo, Nombre_Oficial, fecha_fundacion) VALUES (911, 'Visit 911', SYSDATE-10);

-- Insertar 11 jugadores para el equipo local para poder aceptar su inscripcion
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91000, 'C91000', 'P0', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91000, 910, 'Mediocampista', 1, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91001, 'C91001', 'P1', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91001, 910, 'Mediocampista', 2, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91002, 'C91002', 'P2', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91002, 910, 'Mediocampista', 3, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91003, 'C91003', 'P3', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91003, 910, 'Mediocampista', 4, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91004, 'C91004', 'P4', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91004, 910, 'Mediocampista', 5, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91005, 'C91005', 'P5', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91005, 910, 'Mediocampista', 6, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91006, 'C91006', 'P6', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91006, 910, 'Mediocampista', 7, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91007, 'C91007', 'P7', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91007, 910, 'Mediocampista', 8, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91008, 'C91008', 'P8', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91008, 910, 'Mediocampista', 9, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91009, 'C91009', 'P9', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91009, 910, 'Mediocampista', 10, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91010, 'C91010', 'P10', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91010, 910, 'Mediocampista', 11, 70.0, 1.70, 'Colombia');

-- Insertar 11 jugadores para el equipo visitante
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91020, 'C91020', 'P0', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91020, 911, 'Mediocampista', 1, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91021, 'C91021', 'P1', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91021, 911, 'Mediocampista', 2, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91022, 'C91022', 'P2', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91022, 911, 'Mediocampista', 3, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91023, 'C91023', 'P3', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91023, 911, 'Mediocampista', 4, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91024, 'C91024', 'P4', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91024, 911, 'Mediocampista', 5, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91025, 'C91025', 'P5', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91025, 911, 'Mediocampista', 6, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91026, 'C91026', 'P6', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91026, 911, 'Mediocampista', 7, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91027, 'C91027', 'P7', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91027, 911, 'Mediocampista', 8, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91028, 'C91028', 'P8', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91028, 911, 'Mediocampista', 9, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91029, 'C91029', 'P9', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91029, 911, 'Mediocampista', 10, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (91030, 'C91030', 'P10', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (91030, 911, 'Mediocampista', 11, 70.0, 1.70, 'Colombia');

-- Inscripciones de los equipos

BEGIN
    INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, Fecha_Nacimiento) 
    VALUES (100910, 'REP100910', 'Rep', 'Gomez', TO_DATE('1980-01-01', 'YYYY-MM-DD'));
EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; END;
/
BEGIN
    INSERT INTO Representante (Id_Persona, Id_Equipo, Cargo) VALUES (100910, 910, 'Manager');
EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; END;
/
INSERT INTO Inscripcion (Id_Inscripcion, Id_Torneo, Id_Equipo, Id_Representante, Estado, Fecha_solicitud) 
VALUES (910, 910, 910, 100910, 'Pendiente', SYSDATE);


BEGIN
    INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, Fecha_Nacimiento) 
    VALUES (100911, 'REP100911', 'Rep', 'Gomez', TO_DATE('1980-01-01', 'YYYY-MM-DD'));
EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; END;
/
BEGIN
    INSERT INTO Representante (Id_Persona, Id_Equipo, Cargo) VALUES (100911, 911, 'Manager');
EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; END;
/
INSERT INTO Inscripcion (Id_Inscripcion, Id_Torneo, Id_Equipo, Id_Representante, Estado, Fecha_solicitud) 
VALUES (911, 910, 911, 100911, 'Pendiente', SYSDATE);


-- Aceptar inscripciones (El disparador exige 11 jugadores, que ya tenemos)
UPDATE Inscripcion SET Estado = 'Aceptada' WHERE Id_Inscripcion IN (910, 911);

-- Arbitro
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (951, 'C951', 'Arb', 'Cen', TO_DATE('1990-01-01', 'YYYY-MM-DD'));
INSERT INTO Arbitro (Id_Persona, Categoria) VALUES (951, 'Amateur');

-- Partido (El disparador exige inscripciones aceptadas y fecha dentro del torneo)
INSERT INTO Partido (Id_Partido, Id_Torneo, nombre_fase, Id_Estadio, Id_EquipoLocal, Id_EquipoVisitante, fecha_hora, estado, goles_local, goles_visitante) 
VALUES (910, 910, 'Fase de Grupos', 910, 910, 911, TRUNC(SYSDATE)+2, 'Pendiente', 0, 0);

INSERT INTO Tarifa (Id_Tarifa, Concepto, Valor) VALUES (910, 'Tarifa 910', 1000);

INSERT INTO Incidencia (Id_Incidencia, Id_Partido, Id_Arbitro, Id_Jugador, Minuto, Tipo) 
VALUES (910, 910, 951, 91000, 10, 'Amarilla');

-- ==========================================
-- 2. ATAQUES LOGICOS A LAS TUPLAS
-- ==========================================
-- Falla Amarillas (Logica): 1 partido jugado pero 3 amarillas
INSERT INTO Estadistica_Jugador (Id_Estadistica, Id_Jugador, Id_Torneo, Goles, Asistencias, Tarjetas_Amarillas, Tarjetas_Rojas, Partidos_Jugados) 
VALUES (910, 91000, 910, 0, 0, 3, 0, 1);

-- Falla Rojas (Logica): 2 partidos jugados pero 3 rojas
INSERT INTO Estadistica_Jugador (Id_Estadistica, Id_Jugador, Id_Torneo, Goles, Asistencias, Tarjetas_Amarillas, Tarjetas_Rojas, Partidos_Jugados) 
VALUES (911, 91000, 910, 0, 0, 0, 3, 2);

-- Falla Castigo Inexistente: Resolucion con 0 fechas Y 0 multa
INSERT INTO Resolucion (Id_Resolucion, Id_Incidencia, Fechas_Suspension, Multa_Monto, Descripcion) 
VALUES (910, 910, 0, 0, 'Castigo Vacio');

-- Preparacion Factura
INSERT INTO Resolucion (Id_Resolucion, Id_Incidencia, Fechas_Suspension, Multa_Monto, Descripcion) 
VALUES (911, 910, 1, 1000, 'Multa Valida');

-- Falla XOR Factura (Doble Cobro)
INSERT INTO Factura (Id_Factura, Id_Inscripcion, Id_Resolucion, Id_Tarifa, Fecha_Emision, Total, Estado) 
VALUES (910, 910, 911, 910, SYSDATE, 1000, 'Pendiente');

-- Falla XOR Factura (Vacia)
INSERT INTO Factura (Id_Factura, Id_Inscripcion, Id_Resolucion, Id_Tarifa, Fecha_Emision, Total, Estado) 
VALUES (911, NULL, NULL, 910, SYSDATE, 1000, 'Pendiente');

-- ==========================================
-- 3. LIMPIEZA DEL ENTORNO AISLADO
-- ==========================================
DELETE FROM Pago WHERE Id_Factura IN (SELECT Id_Factura FROM Factura WHERE Id_Tarifa = 910);
DELETE FROM Factura WHERE Id_Tarifa = 910;
DELETE FROM Resolucion WHERE Id_Incidencia IN (SELECT Id_Incidencia FROM Incidencia WHERE Id_Partido = 910);
DELETE FROM Resolucion WHERE Descripcion IN ('Castigo Vacio', 'Multa Valida', 'Resolucion Cascada');
DELETE FROM Incidencia WHERE Id_Partido = 910;
DELETE FROM Estadistica_Jugador WHERE Id_Torneo = 910;
DELETE FROM Nomina WHERE Id_Partido = 910;
DELETE FROM Partido WHERE Id_Partido = 910;
DELETE FROM Arbitro WHERE Id_Arbitro = 951;
DELETE FROM Inscripcion WHERE Id_Torneo = 910;
DELETE FROM Estadistica_Equipo WHERE Id_Torneo = 910; -- Generado por trigger
DELETE FROM Jugador WHERE Id_Equipo IN (910, 911);
DELETE FROM Equipo WHERE Id_Equipo IN (910, 911);
DELETE FROM Persona WHERE Id_Persona BETWEEN 91000 AND 91050;
DELETE FROM Persona WHERE Id_Persona = 951;
DELETE FROM Estadio WHERE Id_Estadio = 910;
DELETE FROM Fase WHERE Id_Torneo = 910;
DELETE FROM Torneo WHERE Id_Torneo = 910;
DELETE FROM Tarifa WHERE Id_Tarifa = 910;
COMMIT;

