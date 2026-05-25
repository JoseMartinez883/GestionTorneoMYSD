-- ============================================================
-- Se eliminan los indices y vistas del sistema de torneos.
-- ============================================================

-- Vistas
DROP VIEW V_PROXIMOS_ENCUENTROS;
DROP VIEW V_TABLA_POSICIONES;
DROP VIEW V_CALENDARIO_PARTIDOS;
DROP VIEW V_RESUMEN_GERENCIAL_TORNEOS;
DROP VIEW V_PLANTILLA_EQUIPOS;

-- Indices
DROP INDEX IDX_PARTIDO_FECHA;
DROP INDEX IDX_PARTIDO_ESTADO;
DROP INDEX IDX_INSCRIPCION_ESTADO;
DROP INDEX IDX_PERSONA_APELLIDOS;
