-- Restricciones de atributos Ciclo 2 (Dominios)

-- Dominio TTitular
ALTER TABLE Nomina ADD CONSTRAINT CHK_Nomina_Titular
    CHECK (Titular IN ('SI', 'NO'));

-- Dominio TTipoIncidencia
ALTER TABLE Incidencia ADD CONSTRAINT CHK_Incidencia_Tipo 
    CHECK (Tipo IN ('Gol', 'Asistencia', 'Amarilla', 'Roja', 'Falta', 'Lesion'));

-- Dominio TEstadoFactura
ALTER TABLE Factura ADD CONSTRAINT CHK_Factura_Estado 
    CHECK (Estado IN ('Pendiente', 'Pagada', 'Anulada'));

-- Restricciones de valores positivos
ALTER TABLE Resolucion ADD CONSTRAINT CHK_Resolucion_Multa 
    CHECK (Multa_Monto >= 0);

ALTER TABLE Resolucion ADD CONSTRAINT CHK_Resolucion_Fechas 
    CHECK (Fechas_Suspension >= 0);

ALTER TABLE Estadistica_Jugador ADD CONSTRAINT CHK_EstJugador_Goles 
    CHECK (Goles >= 0);

ALTER TABLE Estadistica_Jugador ADD CONSTRAINT CHK_EstJugador_Asistencias 
    CHECK (Asistencias >= 0);

ALTER TABLE Estadistica_Jugador ADD CONSTRAINT CHK_EstJugador_TA 
    CHECK (Tarjetas_Amarillas >= 0);

ALTER TABLE Estadistica_Jugador ADD CONSTRAINT CHK_EstJugador_TR 
    CHECK (Tarjetas_Rojas >= 0);

ALTER TABLE Tarifa ADD CONSTRAINT CHK_Tarifa_Valor 
    CHECK (Valor >= 0);

ALTER TABLE Factura ADD CONSTRAINT CHK_Factura_Total 
    CHECK (Total >= 0);

ALTER TABLE Pago ADD CONSTRAINT CHK_Pago_Monto 
    CHECK (Monto > 0);

-- Definición ingenua de restricciones de Tupla (se borrarán y recrearán en 06_Tuplas.sql)
ALTER TABLE Estadistica_Jugador ADD CONSTRAINT CK_EstJugador_LogicaTarjetas 
    CHECK (Tarjetas_Rojas <= Partidos_Jugados AND Tarjetas_Amarillas <= (Partidos_Jugados * 2));
z
ALTER TABLE Factura ADD CONSTRAINT CK_Factura_XOR 
    CHECK ((Id_Inscripcion IS NOT NULL AND Id_Tarifa IS NOT NULL AND Id_Resolucion IS NULL) OR 
           (Id_Inscripcion IS NULL AND Id_Tarifa IS NULL AND Id_Resolucion IS NOT NULL));

ALTER TABLE Resolucion ADD CONSTRAINT CK_Resolucion_Castigo 
    CHECK (Fechas_Suspension > 0 OR Multa_Monto > 0);

ALTER TABLE Incidencia ADD CONSTRAINT CK_Incidencia_Minuto
    CHECK (Minuto >= 0 AND Minuto <= 150);
