-- ========================================================================
-- INDICES (CICLO 2)
-- Creacion de indices funcionales para acelerar operaciones frecuentes
-- ========================================================================

-- 1. Indice para el modulo financiero
-- Acelera las vistas y reportes que buscan facturas pendientes
CREATE INDEX IDX_FACTURA_ESTADO ON Factura(Estado);

-- 2. Indice para el modulo de incidencias (VAR)
-- Acelera el conteo de tipos de faltas (Goles, Amarillas, Rojas)
CREATE INDEX IDX_INCIDENCIA_TIPO ON Incidencia(Tipo);

-- 3. Indice para el cierre de partidos (Trigger TRG_MODIFICAR_PARTIDO_NOMINA)
-- Acelera brutalmente la busqueda de los jugadores titulares de un acta especifica
CREATE INDEX IDX_NOMINA_TITULAR ON Nomina(Titular);
