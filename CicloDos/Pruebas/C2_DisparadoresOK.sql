

-- ========================================================================
-- PRUEBAS AISLADAS DE DISPARADORES OK (CICLO 2)
-- Metodologia: Inserciones SQL planas usando preparacion de entorno aislado (Serie 830)
-- ========================================================================

-- ==========================================
-- PREPARACION DEL ENTORNO AISLADO (SERIE 830)
-- ==========================================
INSERT INTO Torneo (Id_Torneo, nombre, temporada, Fecha_Inicio, Fecha_Fin, estado) VALUES (830, 'Torneo Disparadores OK', '2026', TRUNC(SYSDATE)+1, TRUNC(SYSDATE)+30, 'Programado');
INSERT INTO Fase (Id_Torneo, nombre_fase, tipo_formato) VALUES (830, 'Fase de Grupos', 'Liga');
INSERT INTO Estadio (Id_Estadio, nombre, ciudad, capacidad, tipo_cancha) VALUES (830, 'Estadio 830', 'Bogota', 1000, 'Natural');

INSERT INTO Equipo (Id_Equipo, Nombre_Oficial, fecha_fundacion) VALUES (830, 'Local 830', SYSDATE-10);
INSERT INTO Equipo (Id_Equipo, Nombre_Oficial, fecha_fundacion) VALUES (831, 'Visit 831', SYSDATE-10);

INSERT INTO Persona (Id_Persona, Nombres, Apellidos, DNI, Fecha_Nacimiento) VALUES (830, 'Jugador', 'Local', '83000', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Persona (Id_Persona, Nombres, Apellidos, DNI, Fecha_Nacimiento) VALUES (831, 'Arbitro', 'Perez', '83001', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Persona (Id_Persona, Nombres, Apellidos, DNI, Fecha_Nacimiento) VALUES (832, 'Representante', 'Gomez', '83002', TO_DATE('2000-01-01', 'YYYY-MM-DD'));

INSERT INTO Representante (Id_Persona) VALUES (832);
INSERT INTO Arbitro (Id_Persona, Años_Experiencia) VALUES (831, 5);
INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (830, 830, 10, 'Delantero');

INSERT INTO Partido (Id_Partido, Id_Torneo, nombre_fase, Id_Estadio, Id_EquipoLocal, Id_EquipoVisitante, fecha_hora, goles_local, goles_visitante, estado) VALUES (830, 830, 'Fase de Grupos', 830, 830, 831, SYSDATE+5, 0, 0, 'Programado');

INSERT INTO Inscripcion (Id_Inscripcion, Id_Torneo, Id_Equipo, Id_Representante, Estado)
VALUES (830, 830, 830, 832, 'Pendiente');

INSERT INTO Tarifa (Id_Tarifa, Concepto, Valor) VALUES (830, 'Inscripcion Test', 50000);

-- ========================================================================
-- PRUEBA 1: TRG_INSERTAR_FACTURA
-- ========================================================================
-- Se inserta factura y el trigger asignara el Total de 50000 automaticamente
INSERT INTO Factura (Id_Factura, Id_Inscripcion, Id_Tarifa, Fecha_Emision, Estado) 
VALUES (830, 830, 830, SYSDATE, 'Pendiente');

-- ========================================================================
-- PRUEBA 2: TRG_INSERTAR_PAGO
-- ========================================================================
-- Se inserta pago por el total, el trigger cambiara la Factura a Pagada
INSERT INTO Pago (Id_Pago, Id_Factura, Id_Representante, Monto, Fecha_Pago)
VALUES (830, 830, 832, 50000, SYSDATE);

-- ========================================================================
-- PRUEBA 3: TRG_MODIFICAR_INSCRIPCION_JUG
-- ========================================================================
-- Al cambiar a Aceptada, se creara el registro Estadistica_Jugador en ceros
UPDATE Inscripcion SET Estado = 'Aceptada' WHERE Id_Inscripcion = 830;

-- ========================================================================
-- PRUEBA 4: TRG_INSERTAR_NOMINA
-- ========================================================================
-- El jugador 830 pertenece al equipo 830 (Local), debe ser aceptado
INSERT INTO Nomina (Id_Partido, Id_Jugador, Titular) VALUES (830, 830, 'SI');

-- ========================================================================
-- PRUEBA 5: TRG_INSERTAR_INCIDENCIA y TRG_ELIMINAR_INCIDENCIA
-- ========================================================================
-- Insertamos una incidencia de Gol para el jugador 830 (incrementa a 1)
INSERT INTO Incidencia (Id_Incidencia, Id_Partido, Id_Arbitro, Id_Jugador, Minuto, Tipo)
VALUES (830, 830, 831, 830, 45, 'Gol');

-- Borramos la incidencia (reduce a 0)
DELETE FROM Incidencia WHERE Id_Incidencia = 830;

-- ========================================================================
-- PRUEBA 6: TRG_MODIFICAR_PARTIDO_NOMINA
-- ========================================================================
-- Al cambiar el partido a Jugado, suma +1 a Partidos_Jugados del jugador 830
UPDATE Partido SET Estado = 'Jugado' WHERE Id_Partido = 830;

-- ========================================================================
-- PRUEBA 7: TRG_AUTOGENERAR_FACTURA_RES
-- ========================================================================
-- Creamos tarifa de prueba
INSERT INTO Tarifa (Id_Tarifa, Concepto, Valor) VALUES (830, 'Multa Prueba', 1000);

-- Insertar una resolucion debe auto-generar la factura
INSERT INTO Resolucion (Id_Resolucion, Id_Incidencia, Fechas_Suspension, Multa_Monto, Descripcion)
VALUES (830, 830, 2, 5000, 'Sancion OK');

-- ========================================================================
-- PRUEBA 8: TRG_AUTOGENERAR_FACTURA_INS
-- ========================================================================
-- Al pasar la inscripcion 830 a Aceptada, se auto-genera la factura de inscripcion
UPDATE Inscripcion SET Estado = 'Aceptada' WHERE Id_Inscripcion = 830;

PROMPT "Pruebas de Disparadores OK completadas."
