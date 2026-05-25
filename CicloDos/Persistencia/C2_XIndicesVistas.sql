-- ========================================================================
-- BORRADO ESTRUCTURAL DE INDICES Y VISTAS (CICLO 2)
-- Script de limpieza (Rollback estructural)
-- ========================================================================

-- Eliminacion de Vistas
DROP VIEW V_ESTADO_CUENTA_EQUIPOS;
DROP VIEW V_RANKING_ESTADISTICAS;
DROP VIEW V_HISTORIAL_SANCIONES;

-- Eliminacion de Indices Funcionales
DROP INDEX IDX_FACTURA_ESTADO;
DROP INDEX IDX_INCIDENCIA_TIPO;
DROP INDEX IDX_NOMINA_TITULAR;
