-- ========================================================================
-- Consultas Operativas Ciclo 2 (Sincronizadas con CRUDE)
-- ========================================================================

-- 1. Consulta Financiera de Estado de Cuenta (Morosos)
-- Actor: Organizador del torneo / Administrador del Sistema
-- NOTA: Parametrizada por Nombre_Oficial en el Paquete (Ej: 'Equipo 1')
SELECT 
    e.Nombre_Oficial AS Equipo,
    f.Id_Factura,
    t.Concepto,
    f.Fecha_Emision,
    f.Total,
    f.Estado
FROM Factura f
JOIN Tarifa t ON f.Id_Tarifa = t.Id_Tarifa
LEFT JOIN Inscripcion i ON f.Id_Inscripcion = i.Id_Inscripcion
LEFT JOIN Resolucion r ON f.Id_Resolucion = r.Id_Resolucion
LEFT JOIN Incidencia inc ON r.Id_Incidencia = inc.Id_Incidencia
LEFT JOIN Jugador j ON inc.Id_Jugador = j.Id_Persona
LEFT JOIN Equipo e ON i.Id_Equipo = e.Id_Equipo OR j.Id_Equipo = e.Id_Equipo
WHERE f.Estado = 'Pendiente' 
AND e.Nombre_Oficial = 'Equipo 1';

-- 2. Consulta de Ranking de Goleadores y Disciplina
-- Actor: Publico general / Tecnico
-- NOTA: Parametrizada por Torneo y Temporada en el Paquete (Ej: Torneo 1, 2026)
SELECT 
    p.Nombres,
    p.Apellidos,
    e.Nombre_Oficial AS Equipo,
    ej.Goles,
    ej.Asistencias,
    ej.Tarjetas_Amarillas,
    ej.Tarjetas_Rojas
FROM Estadistica_Jugador ej
JOIN Jugador j ON ej.Id_Jugador = j.Id_Persona
JOIN Persona p ON j.Id_Persona = p.Id_Persona
JOIN Equipo e ON j.Id_Equipo = e.Id_Equipo
JOIN Torneo tor ON ej.Id_Torneo = tor.Id_Torneo
WHERE tor.Nombre = 'Torneo 1' AND tor.Temporada = '2026'
ORDER BY ej.Goles DESC, ej.Asistencias DESC, ej.Tarjetas_Amarillas ASC;

-- 3. Balance Financiero de la Liga (Rentabilidad y Cartera Vencida)
-- Actor: Contador / Administrador Financiero
-- NOTA: Parametrizada por Torneo y Temporada en el Paquete (Ej: Torneo 1, 2026)
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
LEFT JOIN Inscripcion i ON f.Id_Inscripcion = i.Id_Inscripcion
LEFT JOIN Torneo tor1 ON i.Id_Torneo = tor1.Id_Torneo
LEFT JOIN Resolucion r ON f.Id_Resolucion = r.Id_Resolucion
LEFT JOIN Incidencia inc ON r.Id_Incidencia = inc.Id_Incidencia
LEFT JOIN Partido pa ON inc.Id_Partido = pa.Id_Partido
LEFT JOIN Fase fa ON pa.Id_Torneo = fa.Id_Torneo AND pa.nombre_fase = fa.nombre_fase
LEFT JOIN Torneo tor2 ON fa.Id_Torneo = tor2.Id_Torneo
WHERE (tor1.Nombre = 'Torneo 1' AND tor1.Temporada = '2026')
   OR (tor2.Nombre = 'Torneo 1' AND tor2.Temporada = '2026')
GROUP BY f.Id_Factura, t.Concepto, f.Fecha_Emision, f.Total, f.Estado
ORDER BY Saldo_Pendiente DESC, f.Id_Factura ASC;

-- 4. Consulta de Historial de Resoluciones (Sanciones por Equipo)
-- Actor: Representante
-- NOTA: Parametrizada por Nombre_Oficial en el Paquete (Ej: 'Equipo 1')
SELECT 
    e.Nombre_Oficial AS Equipo,
    p.Nombres || ' ' || p.Apellidos AS Jugador_Sancionado,
    inc.Minuto,
    inc.Tipo,
    r.Fechas_Suspension,
    r.Multa_Monto,
    r.Descripcion
FROM Resolucion r
JOIN Incidencia inc ON r.Id_Incidencia = inc.Id_Incidencia
JOIN Jugador j ON inc.Id_Jugador = j.Id_Persona
JOIN Persona p ON j.Id_Persona = p.Id_Persona
JOIN Equipo e ON j.Id_Equipo = e.Id_Equipo
WHERE e.Nombre_Oficial = 'Equipo 1'
ORDER BY r.Id_Resolucion DESC;

-- 5. Linea de Tiempo del Partido (El Minuto a Minuto)
-- Actor: Publico general / Periodistas Deportivos
-- NOTA: Parametrizada por Id_Partido en el Paquete (Ej: Partido 1)
SELECT 
    fa.Nombre_Fase AS Fase_Torneo,
    pa.Id_Partido,
    inc.Minuto,
    inc.Tipo AS Suceso,
    p.Nombres || ' ' || p.Apellidos AS Protagonista,
    e.Nombre_Oficial AS Equipo,
    NVL(r.Descripcion, 'Sin resolucion adicional') AS Consecuencia
FROM Incidencia inc
JOIN Partido pa ON inc.Id_Partido = pa.Id_Partido
JOIN Fase fa ON pa.Id_Torneo = fa.Id_Torneo AND pa.nombre_fase = fa.nombre_fase
JOIN Jugador j ON inc.Id_Jugador = j.Id_Persona
JOIN Persona p ON j.Id_Persona = p.Id_Persona
JOIN Equipo e ON j.Id_Equipo = e.Id_Equipo
LEFT JOIN Resolucion r ON inc.Id_Incidencia = r.Id_Incidencia
WHERE pa.Id_Partido = 1
ORDER BY inc.Minuto ASC;

-- 6. Estadistica Individual (Perfil Completo del Jugador)
-- Actor: Tecnico / Publico General
-- NOTA: Parametrizada por Id_Jugador en el Paquete (Ej: Jugador 10)
SELECT 
    p.DNI,
    p.Nombres || ' ' || p.Apellidos AS Nombre_Jugador,
    e.Nombre_Oficial AS Equipo_Actual,
    tor.Nombre AS Torneo,
    tor.Temporada,
    ej.Partidos_Jugados,
    ej.Goles,
    ej.Asistencias,
    ej.Tarjetas_Amarillas,
    ej.Tarjetas_Rojas
FROM Estadistica_Jugador ej
JOIN Jugador j ON ej.Id_Jugador = j.Id_Persona
JOIN Persona p ON j.Id_Persona = p.Id_Persona
JOIN Equipo e ON j.Id_Equipo = e.Id_Equipo
JOIN Torneo tor ON ej.Id_Torneo = tor.Id_Torneo
WHERE ej.Id_Jugador = 10;

-- 7. Plantilla Oficial del Partido (Titulares vs Suplentes)
-- Actor: Tecnico / Arbitro / Publico General
-- NOTA: Parametrizada por Id_Partido y Nombre_Equipo en el Paquete (Ej: Partido 1, 'Equipo 1')
SELECT 
    pa.Id_Partido,
    e.Nombre_Oficial AS Equipo,
    n.Titular,
    j.Num_Camiseta,
    j.Posicion,
    p.Nombres || ' ' || p.Apellidos AS Nombre_Jugador
FROM Nomina n
JOIN Partido pa ON n.Id_Partido = pa.Id_Partido
JOIN Jugador j ON n.Id_Jugador = j.Id_Persona
JOIN Persona p ON j.Id_Persona = p.Id_Persona
JOIN Equipo e ON j.Id_Equipo = e.Id_Equipo
WHERE pa.Id_Partido = 1 AND e.Nombre_Oficial = 'Equipo 1'
ORDER BY n.Titular DESC, j.Num_Camiseta ASC;
