-- Pruebas de Poblar NO OK - Ciclo 2 (Generan Error intencional)

-- 1. VIOLACIONES DE LLAVE PRIMARIA (PK)
INSERT INTO Tarifa (Id_Tarifa, Concepto, Valor) VALUES (1, 'Duplicado', 100); -- Falla: ID 1 ya existe en PoblarOK

-- 2. VIOLACIONES DE LLAVE FORANEA (FK)
INSERT INTO Nomina (Id_Nomina, Id_Partido, Id_Jugador, Titular) VALUES (999, 3, 302, 'SI'); -- Falla: Partido o Jugador no existen
INSERT INTO Factura (Id_Factura, Id_Inscripcion, Id_Resolucion, Id_Tarifa, Fecha_Emision, Total, Estado) VALUES (999, NULL, 9999, 1, SYSDATE, 100, 'Pendiente'); -- Falla: Resolucion 9999 no existe

-- 3. VIOLACIONES DE LLAVE UNICA (UK)
-- (Jugador 1 ya esta en Partido 2 por PoblarOK)
INSERT INTO Nomina (Id_Nomina, Id_Partido, Id_Jugador, Titular) VALUES (1000, 2, 100, 'NO'); -- Falla: UK_Nomina_JugadorPartido
INSERT INTO Estadistica_Jugador (Id_Estadistica, Id_Jugador, Id_Torneo, Goles, Tarjetas_Amarillas, Tarjetas_Rojas) VALUES (1000, 1, 1, 0, 0, 0); -- Falla: UK_Estadistica_JugadorTorneo

-- 4. VIOLACIONES DE DOMINIO (CHECK)
INSERT INTO Nomina (Id_Nomina, Id_Partido, Id_Jugador, Titular) VALUES (1001, 2, 101, 'INVALIDO'); -- Falla: CHK_Nomina_Titular ('SI'/'NO')
INSERT INTO Incidencia (Id_Incidencia, Id_Partido, Id_Arbitro, Id_Jugador, Minuto, Tipo) VALUES (1001, 1, 3, 100, 15, 'Abrazo'); -- Falla: CHK_Incidencia_Tipo
INSERT INTO Factura (Id_Factura, Id_Inscripcion, Id_Resolucion, Id_Tarifa, Fecha_Emision, Total, Estado) VALUES (1001, NULL, 2, 1, SYSDATE, 100, 'Rechazada'); -- Falla: CHK_Factura_Estado

-- 5. VIOLACIONES DE VALORES POSITIVOS (CHECK)
INSERT INTO Resolucion (Id_Resolucion, Id_Incidencia, Fechas_Suspension, Multa_Monto, Descripcion) VALUES (1001, 1, -5, -50000, 'Negativo'); -- Falla: CHK_Resolucion_Multa / Fechas
INSERT INTO Pago (Id_Pago, Id_Factura, Id_Representante, Monto, Fecha_Pago) VALUES (1001, 1, 1, -100, SYSDATE); -- Falla: CHK_Pago_Monto
INSERT INTO Tarifa (Id_Tarifa, Concepto, Valor) VALUES (1001, 'Gratis', -10); -- Falla: CHK_Tarifa_Valor

-- 6. VIOLACIONES DE RESTRICCIONES COMPLEJAS (XOR Factura en C2_06_Tuplas.sql)
-- Falla: Tiene Inscripcion Y Resolucion al mismo tiempo
INSERT INTO Factura (Id_Factura, Id_Inscripcion, Id_Resolucion, Id_Tarifa, Fecha_Emision, Total, Estado) VALUES (1002, 1, 1, 1, SYSDATE, 100, 'Pendiente'); 
-- Falla: No tiene ni Inscripcion ni Resolucion (Ambos NULL)
INSERT INTO Factura (Id_Factura, Id_Inscripcion, Id_Resolucion, Id_Tarifa, Fecha_Emision, Total, Estado) VALUES (1003, NULL, NULL, 1, SYSDATE, 100, 'Pendiente'); 

-- 7. VIOLACIONES DE NOT NULL
INSERT INTO Tarifa (Id_Tarifa, Concepto, Valor) VALUES (1002, NULL, 100); -- Falla: Concepto es NOT NULL
INSERT INTO Pago (Id_Pago, Id_Factura, Id_Representante, Monto, Fecha_Pago) VALUES (1002, 1, 1, NULL, SYSDATE); -- Falla: Monto es NOT NULL
