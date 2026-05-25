-- ========================================================================
-- RESTRICCIONES DE TUPLA (CICLO 2)
-- Definicion de las restricciones que implican mas de un atributo.
-- ========================================================================

-- Se borran por si ya existian previamente en los atributos o ejecuciones pasadas
ALTER TABLE Estadistica_Jugador DROP CONSTRAINT CK_EstJugador_LogicaTarjetas;
ALTER TABLE Factura DROP CONSTRAINT CK_Factura_XOR;
ALTER TABLE Resolucion DROP CONSTRAINT CK_Resolucion_Castigo;
ALTER TABLE Incidencia DROP CONSTRAINT CK_Incidencia_Minuto;

-- 1. Consistencia Matematica en Tarjetas
-- Un jugador maximo puede recibir 1 roja por partido y 2 amarillas por partido.
ALTER TABLE Estadistica_Jugador ADD CONSTRAINT CK_EstJugador_LogicaTarjetas 
CHECK (Tarjetas_Rojas <= Partidos_Jugados AND Tarjetas_Amarillas <= (Partidos_Jugados * 2));

-- 2. La Factura Dual XOR
-- Una factura se cobra por Inscripcion o por Resolucion, jamas por ambas.
-- ALTER TABLE Factura ADD CONSTRAINT CK_Factura_XOR 
-- CHECK ((Id_Inscripcion IS NOT NULL AND Id_Resolucion IS NULL) OR 
       -- (Id_Inscripcion IS NULL AND Id_Resolucion IS NOT NULL));

-- 3. El Castigo Efectivo en Resolucion
-- Toda resolucion disciplinaria debe generar una suspension o una multa economica.
ALTER TABLE Resolucion ADD CONSTRAINT CK_Resolucion_Castigo 
CHECK (Fechas_Suspension > 0 OR Multa_Monto > 0);

-- 4. Validacion del Minuto de Incidencia
-- El minuto debe estar en un rango valido, asumiendo maximo de 150 para incluir alargues y reposicion.
ALTER TABLE Incidencia ADD CONSTRAINT CK_Incidencia_Minuto
CHECK (Minuto >= 0 AND Minuto <= 150);
