

-- ========================================================================
-- PRUEBAS AISLADAS DE DISPARADORES NoOK (CICLO 2)
-- Metodologia: Inserciones SQL planas que provocaran ORA-20000 
-- (Los errores demostraran que los candados de seguridad funcionan)
-- ========================================================================

-- ==========================================
-- PREPARACION DEL ENTORNO AISLADO (SERIE 845)
-- ==========================================
INSERT INTO Torneo (Id_Torneo, nombre, temporada, Fecha_Inicio, Fecha_Fin, estado) VALUES (845, 'Torneo NoOK', '2026', TRUNC(SYSDATE)+1, TRUNC(SYSDATE)+30, 'Programado');
INSERT INTO Fase (Id_Torneo, nombre_fase, tipo_formato) VALUES (845, 'Fase de Grupos', 'Liga');
INSERT INTO Estadio (Id_Estadio, nombre, ciudad, capacidad, tipo_cancha) VALUES (845, 'Estadio 845', 'Bogota', 1000, 'Natural');

INSERT INTO Equipo (Id_Equipo, Nombre_Oficial, fecha_fundacion) VALUES (845, 'Local 845', SYSDATE-10);
INSERT INTO Equipo (Id_Equipo, Nombre_Oficial, fecha_fundacion) VALUES (846, 'Visit 846', SYSDATE-10);
INSERT INTO Equipo (Id_Equipo, Nombre_Oficial, fecha_fundacion) VALUES (847, 'Ajenos 847', SYSDATE-10);

INSERT INTO Persona (Id_Persona, Nombres, Apellidos, DNI, Fecha_Nacimiento) VALUES (845, 'Jugador', 'NoOK', '84500', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Persona (Id_Persona, Nombres, Apellidos, DNI, Fecha_Nacimiento) VALUES (846, 'Arbitro', 'NoOK', '84501', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Persona (Id_Persona, Nombres, Apellidos, DNI, Fecha_Nacimiento) VALUES (847, 'Representante', 'NoOK', '84502', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Persona (Id_Persona, Nombres, Apellidos, DNI, Fecha_Nacimiento) VALUES (848, 'Infiltrado', 'Ajeno', '84503', TO_DATE('2000-01-01', 'YYYY-MM-DD'));

INSERT INTO Representante (Id_Persona) VALUES (847);
INSERT INTO Arbitro (Id_Persona, Años_Experiencia) VALUES (846, 5);
INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (845, 845, 10, 'Delantero');
INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (848, 847, 9, 'Defensa');

INSERT INTO Partido (Id_Partido, Id_Torneo, nombre_fase, Id_Estadio, Id_EquipoLocal, Id_EquipoVisitante, fecha_hora, goles_local, goles_visitante, estado) VALUES (845, 845, 'Fase de Grupos', 845, 845, 846, SYSDATE+5, 0, 0, 'Programado');

INSERT INTO Inscripcion (Id_Inscripcion, Id_Torneo, Id_Equipo, Id_Representante, Estado)
VALUES (845, 845, 845, 847, 'Aceptada');

INSERT INTO Estadistica_Jugador (Id_Estadistica, Id_Jugador, Id_Torneo, Goles, Asistencias, Tarjetas_Amarillas, Tarjetas_Rojas, Partidos_Jugados)
VALUES (845, 845, 845, 0, 0, 0, 0, 0);

INSERT INTO Tarifa (Id_Tarifa, Concepto, Valor) VALUES (845, 'Inscripcion NoOK', 50000);
INSERT INTO Factura (Id_Factura, Id_Inscripcion, Id_Tarifa, Fecha_Emision, Estado) VALUES (845, 845, 845, SYSDATE, 'Pendiente');
INSERT INTO Pago (Id_Pago, Id_Factura, Id_Representante, Monto, Fecha_Pago) VALUES (845, 845, 847, 1000, SYSDATE);

INSERT INTO Nomina (Id_Partido, Id_Jugador, Titular) VALUES (845, 845, 'SI');
INSERT INTO Incidencia (Id_Incidencia, Id_Partido, Id_Arbitro, Id_Jugador, Minuto, Tipo) VALUES (845, 845, 846, 845, 15, 'Gol');

-- ========================================================================
-- PRUEBA 1: TRG_ELIMINAR_FACTURA
-- ========================================================================
-- Debera fallar porque la factura 845 ya tiene un abono (Pago 845)
DELETE FROM Factura WHERE Id_Factura = 845;

-- ========================================================================
-- PRUEBA 2: TRG_INSERTAR_PAGO
-- ========================================================================
-- Debera fallar porque la tarifa es 50,000, ya pago 1000, y va a intentar pagar 60,000 (excede saldo)
INSERT INTO Pago (Id_Pago, Id_Factura, Id_Representante, Monto, Fecha_Pago) VALUES (846, 845, 847, 60000, SYSDATE);

-- ========================================================================
-- PRUEBA 3: TRG_MODIFICAR_PAGO
-- ========================================================================
-- Debera fallar porque los pagos no se editan
UPDATE Pago SET Monto = 2000 WHERE Id_Pago = 845;

-- ========================================================================
-- PRUEBA 4: TRG_INSERTAR_NOMINA
-- ========================================================================
-- Debera fallar porque jugador 848 es del equipo 847 (y el partido es 845 vs 846)
INSERT INTO Nomina (Id_Partido, Id_Jugador, Titular) VALUES (845, 848, 'SI');

-- ========================================================================
-- PRUEBA 5: TRG_INSERTAR_INCIDENCIA
-- ========================================================================
-- Debera fallar porque el jugador 848 no esta en el acta (nomina) de este partido
INSERT INTO Incidencia (Id_Incidencia, Id_Partido, Id_Arbitro, Id_Jugador, Minuto, Tipo) VALUES (846, 845, 846, 848, 20, 'Amarilla');

-- ========================================================================
-- PRUEBA 6: TRG_MODIFICAR_INCIDENCIA
-- ========================================================================
-- Debera fallar porque las incidencias son inmutables para proteger estadistica
UPDATE Incidencia SET Tipo = 'Roja' WHERE Id_Incidencia = 845;

-- ========================================================================
-- PRUEBA 7: TRG_MODIFICAR_ESTADISTICA_JUG
-- ========================================================================
-- Debera fallar porque no se pueden reasignar IDs (Robo de estadisticas)
UPDATE Estadistica_Jugador SET Id_Jugador = 848 WHERE Id_Estadistica = 845;

-- ========================================================================
-- PRUEBA 8: TRG_MODIFICAR_NOMINA y TRG_ELIMINAR_NOMINA
-- ========================================================================
-- Forzamos cambiar el estado a Jugado (lo cual sumara un partido jugado al jugador 845)
UPDATE Partido SET Estado = 'Jugado' WHERE Id_Partido = 845;

-- Debera fallar porque no se puede modificar el acta de un partido que ya se jugo
UPDATE Nomina SET Titular = 'NO' WHERE Id_Partido = 845 AND Id_Jugador = 845;

-- Debera fallar porque no se puede eliminar a alguien del acta post-partido
DELETE FROM Nomina WHERE Id_Partido = 845 AND Id_Jugador = 845;

-- ========================================================================
-- PRUEBA 9: TRG_ELIMINAR_PAGO
-- ========================================================================
-- Debera fallar porque los pagos son inmutables y no se pueden eliminar
DELETE FROM Pago WHERE Id_Pago = 845;

-- ========================================================================
-- PRUEBA 10: TRG_MODIFICAR_FACTURA
-- ========================================================================
-- Debera fallar porque no se puede cambiar el Total de una factura
UPDATE Factura SET Total = 500000 WHERE Id_Factura = 845;

-- Debera fallar porque la factura tiene pagos (Id_Pago = 845), asi que no se puede anular
UPDATE Factura SET Estado = 'Anulada' WHERE Id_Factura = 845;

-- ========================================================================
-- PRUEBA 11: TRG_CONGELA_RESOLUCION
-- ========================================================================
-- Necesitamos crear una resolucion y su factura automatica (Asumiendo que Tarifa 845 existe)
INSERT INTO Tarifa (Id_Tarifa, Concepto, Valor) VALUES (845, 'Multa Prueba', 1000);
INSERT INTO Resolucion (Id_Resolucion, Id_Incidencia, Fechas_Suspension, Multa_Monto, Descripcion)
VALUES (845, 845, 2, 5000, 'Sancion No OK');

-- Debera fallar porque la resolucion ya tiene factura automatica
UPDATE Resolucion SET Fechas_Suspension = 1 WHERE Id_Resolucion = 845;
DELETE FROM Resolucion WHERE Id_Resolucion = 845;

PROMPT "Pruebas de Disparadores No OK completadas."
