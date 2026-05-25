

-- ========================================================================
-- PRUEBAS AISLADAS DE ACCIONES REFERENCIALES OK (CICLO 2)
-- ========================================================================
-- ==========================================
-- 1. PREPARACION DEL ENTORNO AISLADO (SERIE 820)
-- Se cumple estrictamente con todos los disparadores del Ciclo 1
-- ==========================================
INSERT INTO Torneo (Id_Torneo, nombre, temporada, Fecha_Inicio, Fecha_Fin, estado) 
VALUES (820, 'Torneo Acciones', '2026', TRUNC(SYSDATE)+1, TRUNC(SYSDATE)+30, 'Programado');

INSERT INTO Fase (Id_Torneo, nombre_fase, tipo_formato) VALUES (820, 'Fase de Grupos', 'Liga');

INSERT INTO Estadio (Id_Estadio, nombre, ciudad, capacidad, tipo_cancha) 
VALUES (820, 'Estadio 820', 'Bogota', 1000, 'Natural');

INSERT INTO Equipo (Id_Equipo, Nombre_Oficial, fecha_fundacion) VALUES (820, 'Local 820', SYSDATE-10);
INSERT INTO Equipo (Id_Equipo, Nombre_Oficial, fecha_fundacion) VALUES (821, 'Visit 821', SYSDATE-10);

-- Insertar 11 jugadores para el equipo local para poder aceptar su inscripcion
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82000, 'C82000', 'P0', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82000, 820, 'Mediocampista', 1, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82001, 'C82001', 'P1', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82001, 820, 'Mediocampista', 2, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82002, 'C82002', 'P2', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82002, 820, 'Mediocampista', 3, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82003, 'C82003', 'P3', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82003, 820, 'Mediocampista', 4, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82004, 'C82004', 'P4', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82004, 820, 'Mediocampista', 5, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82005, 'C82005', 'P5', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82005, 820, 'Mediocampista', 6, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82006, 'C82006', 'P6', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82006, 820, 'Mediocampista', 7, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82007, 'C82007', 'P7', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82007, 820, 'Mediocampista', 8, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82008, 'C82008', 'P8', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82008, 820, 'Mediocampista', 9, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82009, 'C82009', 'P9', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82009, 820, 'Mediocampista', 10, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82010, 'C82010', 'P10', 'L', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82010, 820, 'Mediocampista', 11, 70.0, 1.70, 'Colombia');

-- Insertar 11 jugadores para el equipo visitante
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82020, 'C82020', 'P0', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82020, 821, 'Mediocampista', 1, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82021, 'C82021', 'P1', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82021, 821, 'Mediocampista', 2, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82022, 'C82022', 'P2', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82022, 821, 'Mediocampista', 3, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82023, 'C82023', 'P3', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82023, 821, 'Mediocampista', 4, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82024, 'C82024', 'P4', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82024, 821, 'Mediocampista', 5, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82025, 'C82025', 'P5', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82025, 821, 'Mediocampista', 6, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82026, 'C82026', 'P6', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82026, 821, 'Mediocampista', 7, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82027, 'C82027', 'P7', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82027, 821, 'Mediocampista', 8, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82028, 'C82028', 'P8', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82028, 821, 'Mediocampista', 9, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82029, 'C82029', 'P9', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82029, 821, 'Mediocampista', 10, 70.0, 1.70, 'Colombia');
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (82030, 'C82030', 'P10', 'V', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad) VALUES (82030, 821, 'Mediocampista', 11, 70.0, 1.70, 'Colombia');

-- Inscripciones de los equipos

BEGIN
    INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, Fecha_Nacimiento) 
    VALUES (100820, 'REP100820', 'Rep', 'Gomez', TO_DATE('1980-01-01', 'YYYY-MM-DD'));
EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; END;
/
BEGIN
    INSERT INTO Representante (Id_Persona, Id_Equipo, Cargo) VALUES (100820, 820, 'Manager');
EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; END;
/
INSERT INTO Inscripcion (Id_Inscripcion, Id_Torneo, Id_Equipo, Id_Representante, Estado, Fecha_solicitud) 
VALUES (820, 820, 820, 100820, 'Pendiente', SYSDATE);


BEGIN
    INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, Fecha_Nacimiento) 
    VALUES (100821, 'REP100821', 'Rep', 'Gomez', TO_DATE('1980-01-01', 'YYYY-MM-DD'));
EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; END;
/
BEGIN
    INSERT INTO Representante (Id_Persona, Id_Equipo, Cargo) VALUES (100821, 821, 'Manager');
EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; END;
/
INSERT INTO Inscripcion (Id_Inscripcion, Id_Torneo, Id_Equipo, Id_Representante, Estado, Fecha_solicitud) 
VALUES (821, 820, 821, 100821, 'Pendiente', SYSDATE);


-- Aceptar inscripciones (El disparador exige 11 jugadores, que ya tenemos)
UPDATE Inscripcion SET Estado = 'Aceptada' WHERE Id_Inscripcion IN (820, 821);

-- Arbitro
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) VALUES (850, 'C850', 'Arb', 'Cen', TO_DATE('1990-01-01', 'YYYY-MM-DD'));
INSERT INTO Arbitro (Id_Persona, Categoria) VALUES (850, 'Amateur');

-- Partido (El disparador exige inscripciones aceptadas y fecha dentro del torneo)
INSERT INTO Partido (Id_Partido, Id_Torneo, nombre_fase, Id_Estadio, Id_EquipoLocal, Id_EquipoVisitante, fecha_hora, estado, goles_local, goles_visitante) 
VALUES (820, 820, 'Fase de Grupos', 820, 820, 821, TRUNC(SYSDATE)+2, 'Pendiente', 0, 0);

INSERT INTO Tarifa (Id_Tarifa, Concepto, Valor) VALUES (820, 'Tarifa 820', 1000);

-- ==========================================
-- 2. ESCENARIO A: PRUEBAS DE EFECTO DOMINO (ON DELETE CASCADE)
-- ==========================================

-- 1. Cascada Partido -> Nomina
INSERT INTO Nomina (Id_Nomina, Id_Partido, Id_Jugador, Titular) VALUES (820, 820, 82000, 'SI');
DELETE FROM Partido WHERE Id_Partido = 820;
-- Auditoria 1: Deberia devolver 0 filas (La nomina cayo con el partido)
SELECT * FROM Nomina WHERE Id_Partido = 820;

-- 2. Cascada Incidencia -> Resolucion
-- (Restauramos el partido para seguir probando)
INSERT INTO Partido (Id_Partido, Id_Torneo, nombre_fase, Id_Estadio, Id_EquipoLocal, Id_EquipoVisitante, fecha_hora, estado, goles_local, goles_visitante) 
VALUES (820, 820, 'Fase de Grupos', 820, 820, 821, TRUNC(SYSDATE)+2, 'Pendiente', 0, 0);
INSERT INTO Incidencia (Id_Incidencia, Id_Partido, Id_Arbitro, Id_Jugador, Minuto, Tipo) 
VALUES (820, 820, 850, 82000, 10, 'Roja');
INSERT INTO Resolucion (Id_Resolucion, Id_Incidencia, Fechas_Suspension, Multa_Monto, Descripcion) 
VALUES (820, 820, 1, 1000, 'Resolucion Cascada');
DELETE FROM Incidencia WHERE Id_Incidencia = 820;
-- Auditoria 2: Deberia devolver 0 filas
SELECT * FROM Resolucion WHERE Id_Incidencia = 820;

-- 3. Cascada Factura -> Pago
INSERT INTO Resolucion (Id_Resolucion, Id_Incidencia, Fechas_Suspension, Multa_Monto, Descripcion) 
VALUES (821, NULL, 1, 1000, 'Multa Valida');
INSERT INTO Factura (Id_Factura, Id_Inscripcion, Id_Resolucion, Id_Tarifa, Fecha_Emision, Total, Estado) 
VALUES (820, NULL, 821, 820, SYSDATE, 1000, 'Pendiente');

-- Representante para el Pago
INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, fecha_nacimiento) 
VALUES (899, 'CC899', 'Rep', 'Res', TO_DATE('1980-01-01', 'YYYY-MM-DD'));
INSERT INTO Representante (Id_Representante, Id_Persona, Id_Equipo, correo, rol_representante) 
VALUES (899, 899, 820, 'a@a.com', 'Pres');

INSERT INTO Pago (Id_Pago, Id_Factura, Id_Representante, Monto, Fecha_Pago) 
VALUES (820, 820, 899, 1000, SYSDATE);
DELETE FROM Factura WHERE Id_Factura = 820;
-- Auditoria 3: Deberia devolver 0 filas
SELECT * FROM Pago WHERE Id_Factura = 820;

-- ==========================================
-- 3. ESCENARIO B: PRUEBA DE BORRADO JERARQUICO MANUAL (RESTRICT)
-- ==========================================
INSERT INTO Estadistica_Jugador (Id_Estadistica, Id_Jugador, Id_Torneo, Goles, Asistencias, Tarjetas_Amarillas, Tarjetas_Rojas, Partidos_Jugados) 
VALUES (820, 82000, 820, 0, 0, 0, 0, 0);

-- Si intentaramos: DELETE FROM Jugador WHERE Id_Jugador = 82000; fallaria porque tiene estadistica.
-- Borrado jerarquico correcto:
DELETE FROM Estadistica_Jugador WHERE Id_Estadistica = 820;
DELETE FROM Jugador WHERE Id_Jugador = 82000;


-- ==========================================
-- 3. LIMPIEZA DEL ENTORNO AISLADO
-- ==========================================
DELETE FROM Pago WHERE Id_Factura IN (SELECT Id_Factura FROM Factura WHERE Id_Tarifa = 820);
DELETE FROM Factura WHERE Id_Tarifa = 820;
DELETE FROM Resolucion WHERE Id_Incidencia IN (SELECT Id_Incidencia FROM Incidencia WHERE Id_Partido = 820);
DELETE FROM Resolucion WHERE Descripcion IN ('Castigo Vacio', 'Multa Valida', 'Resolucion Cascada');
DELETE FROM Incidencia WHERE Id_Partido = 820;
DELETE FROM Estadistica_Jugador WHERE Id_Torneo = 820;
DELETE FROM Nomina WHERE Id_Partido = 820;
DELETE FROM Partido WHERE Id_Partido = 820;
DELETE FROM Arbitro WHERE Id_Arbitro = 850;
DELETE FROM Inscripcion WHERE Id_Torneo = 820;
DELETE FROM Estadistica_Equipo WHERE Id_Torneo = 820; -- Generado por trigger
DELETE FROM Jugador WHERE Id_Equipo IN (820, 821);
DELETE FROM Equipo WHERE Id_Equipo IN (820, 821);
DELETE FROM Persona WHERE Id_Persona BETWEEN 82000 AND 82050;
DELETE FROM Persona WHERE Id_Persona = 850;
DELETE FROM Estadio WHERE Id_Estadio = 820;
DELETE FROM Fase WHERE Id_Torneo = 820;
DELETE FROM Torneo WHERE Id_Torneo = 820;
DELETE FROM Tarifa WHERE Id_Tarifa = 820;
COMMIT;

DELETE FROM Representante WHERE Id_Representante = 899;
DELETE FROM Persona WHERE Id_Persona = 899;
COMMIT;
