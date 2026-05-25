-- ========================================================================
-- PRUEBAS DE INDICES Y VISTAS (CICLO 2)
-- ========================================================================

-- Demostración de las vistas operativas construidas con cruces complejos.
-- Al ejecutar estas vistas, el motor de Oracle utilizara internamente
-- los indices funcionales creados (IDX_FACTURA_ESTADO, IDX_INCIDENCIA_TIPO)
-- para optimizar el plan de ejecucion de la consulta.

PROMPT ========================================================
PROMPT PRUEBA 1: ESTADO DE CUENTA DE EQUIPOS (VISTA + INDICE)
PROMPT ========================================================
-- El filtro WHERE Estado = 'Pendiente' obliga al motor de la base de 
-- datos a utilizar el indice IDX_FACTURA_ESTADO creado en la tabla base.
SELECT * FROM V_ESTADO_CUENTA_EQUIPOS
WHERE Estado = 'Pendiente'
ORDER BY Saldo_Pendiente DESC;

PROMPT ========================================================
PROMPT PRUEBA 2: RANKING DE ESTADISTICAS Y RENDIMIENTO
PROMPT ========================================================
SELECT * FROM V_RANKING_ESTADISTICAS
ORDER BY Goles DESC, Asistencias DESC;

PROMPT ========================================================
PROMPT PRUEBA 3: HISTORIAL DISCIPLINARIO (VISTA + INDICE)
PROMPT ========================================================
-- El filtro WHERE Tipo_Infraccion obliga al motor de la base de 
-- datos a utilizar el indice IDX_INCIDENCIA_TIPO creado en la tabla base.
SELECT * FROM V_HISTORIAL_SANCIONES
WHERE Tipo_Infraccion IN ('Roja', 'Amarilla')
ORDER BY Equipo, Minuto ASC;
