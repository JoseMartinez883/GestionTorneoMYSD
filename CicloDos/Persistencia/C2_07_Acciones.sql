-- ========================================================================
-- ACCIONES REFERENCIALES (CICLO 2)
-- Definicion de acciones de borrado en cascada
-- ========================================================================

-- Se borran las foraneas restrictivas previas
ALTER TABLE Nomina DROP CONSTRAINT FK_Nomina_Partido;
ALTER TABLE Resolucion DROP CONSTRAINT FK_Resolucion_Incidencia;
ALTER TABLE Pago DROP CONSTRAINT FK_Pago_Factura;

-- 1. Cascada Partido -> Nomina
ALTER TABLE Nomina ADD CONSTRAINT FK_Nomina_Partido 
FOREIGN KEY (Id_Partido) REFERENCES Partido(Id_Partido) ON DELETE CASCADE;

-- 2. Cascada Incidencia -> Resolucion
ALTER TABLE Resolucion ADD CONSTRAINT FK_Resolucion_Incidencia 
FOREIGN KEY (Id_Incidencia) REFERENCES Incidencia(Id_Incidencia) ON DELETE CASCADE;

-- 3. Cascada Factura -> Pago
ALTER TABLE Pago ADD CONSTRAINT FK_Pago_Factura 
FOREIGN KEY (Id_Factura) REFERENCES Factura(Id_Factura) ON DELETE CASCADE;

-- 4. Cascada Jugador -> Estadistica_Jugador
ALTER TABLE Estadistica_Jugador DROP CONSTRAINT FK_EstadisticaJugador_Jugador;

ALTER TABLE Estadistica_Jugador ADD CONSTRAINT FK_EstadisticaJugador_Jugador 
FOREIGN KEY (Id_Jugador) REFERENCES Jugador(Id_Persona) ON DELETE CASCADE;
