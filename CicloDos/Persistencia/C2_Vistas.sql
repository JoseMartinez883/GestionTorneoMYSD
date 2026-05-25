-- ========================================================================
-- VISTAS (CICLO 2)
-- Encapsulamiento de las consultas operativas complejas
-- ========================================================================

-- 1. Vista Financiera (Balance Financiero de Equipos)
CREATE OR REPLACE VIEW V_ESTADO_CUENTA_EQUIPOS AS
SELECT 
    f.Id_Factura,
    t.Concepto,
    f.Fecha_Emision,
    f.Total AS Valor_Total_Factura,
    NVL(SUM(p.Monto), 0) AS Total_Abonado,
    (f.Total - NVL(SUM(p.Monto), 0)) AS Saldo_Pendiente,
    f.Estado
FROM Factura f
JOIN Tarifa t ON f.Id_Tarifa = t.Id_Tarifa
LEFT JOIN Pago p ON f.Id_Factura = p.Id_Factura
GROUP BY f.Id_Factura, t.Concepto, f.Fecha_Emision, f.Total, f.Estado;

-- 2. Vista Deportiva (Ranking de Goleadores y Disciplina)
CREATE OR REPLACE VIEW V_RANKING_ESTADISTICAS AS
SELECT 
    p.Nombres || ' ' || p.Apellidos AS Jugador,
    e.Nombre_Oficial AS Equipo,
    ej.Goles,
    ej.Asistencias,
    ej.Tarjetas_Amarillas,
    ej.Tarjetas_Rojas,
    ej.Partidos_Jugados
FROM Estadistica_Jugador ej
JOIN Jugador j ON ej.Id_Jugador = j.Id_Persona
JOIN Persona p ON j.Id_Persona = p.Id_Persona
JOIN Equipo e ON j.Id_Equipo = e.Id_Equipo;

-- 3. Vista Disciplinaria (Historial de Sanciones)
CREATE OR REPLACE VIEW V_HISTORIAL_SANCIONES AS
SELECT 
    e.Nombre_Oficial AS Equipo,
    p.Nombres || ' ' || p.Apellidos AS Jugador_Sancionado,
    inc.Minuto,
    inc.Tipo AS Tipo_Infraccion,
    r.Fechas_Suspension,
    r.Multa_Monto,
    r.Descripcion
FROM Resolucion r
JOIN Incidencia inc ON r.Id_Incidencia = inc.Id_Incidencia
JOIN Jugador j ON inc.Id_Jugador = j.Id_Persona
JOIN Persona p ON j.Id_Persona = p.Id_Persona
JOIN Equipo e ON j.Id_Equipo = e.Id_Equipo;
