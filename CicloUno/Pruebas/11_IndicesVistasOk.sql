-- Pruebas de Vistas e Indices 

-- Tabla completa de todos los torneos
SELECT posicion, torneo, equipo, puntos, PJ, PG, PE, PP, GF, GC, DG
FROM V_TABLA_POSICIONES
ORDER BY torneo, posicion;

-- Filtro por torneo especifico
SELECT posicion, equipo, puntos, PG, PE, PP, GF, GC, DG
FROM V_TABLA_POSICIONES
WHERE torneo = 'Superliga Profesional 2027'
ORDER BY posicion;

-- Top 2 por torneo (zona de clasificacion)
SELECT torneo, posicion, equipo, puntos, DG
FROM V_TABLA_POSICIONES
WHERE posicion <= 2
ORDER BY torneo, posicion;

-- Equipos invictos (sin derrotas)
SELECT torneo, equipo, PJ, PG, PE, puntos
FROM V_TABLA_POSICIONES
WHERE PP = 0 AND PJ > 0
ORDER BY puntos DESC;

-- Equipos con diferencia de gol negativa (zona de riesgo)
SELECT torneo, equipo, posicion, GF, GC, DG
FROM V_TABLA_POSICIONES
WHERE DG < 0
ORDER BY DG ASC;


-- ============================================================
-- V_CALENDARIO_PARTIDOS
-- ============================================================

-- Calendario completo
SELECT torneo, fase, equipo_local, equipo_visitante,
       fecha_hora, estadio, goles_local, goles_visitante, estado
FROM V_CALENDARIO_PARTIDOS
ORDER BY torneo, fecha_hora;

-- Partidos jugados 
SELECT torneo, fase, equipo_local, equipo_visitante,
       goles_local || ' - ' || goles_visitante AS resultado, estadio
FROM V_CALENDARIO_PARTIDOS
WHERE estado = 'Jugado'
ORDER BY torneo, fecha_hora;

-- Partidos con victoria 
SELECT torneo, equipo_local, equipo_visitante,
       goles_local, goles_visitante,
       CASE
           WHEN goles_local > goles_visitante THEN equipo_local
           ELSE equipo_visitante
       END AS ganador
FROM V_CALENDARIO_PARTIDOS
WHERE estado = 'Jugado'
  AND goles_local <> goles_visitante
ORDER BY torneo;

-- Busqueda por rango de fecha (aprovecha IDX_PARTIDO_FECHA)
SELECT torneo, equipo_local, equipo_visitante, fecha_hora, estado
FROM V_CALENDARIO_PARTIDOS
WHERE fecha_hora BETWEEN TO_DATE('2028-08-01', 'YYYY-MM-DD')
                     AND TO_DATE('2028-08-31', 'YYYY-MM-DD')
ORDER BY fecha_hora;

-- Historial de un equipo especifico en cualquier torneo
SELECT torneo, equipo_local, equipo_visitante,
       goles_local, goles_visitante, estado, estadio
FROM V_CALENDARIO_PARTIDOS
WHERE equipo_local = 'Tiburones de Barranquilla'
   OR equipo_visitante = 'Tiburones de Barranquilla'
ORDER BY fecha_hora;

-- Estadios mas usados (agrupacion sobre la vista)
SELECT estadio, ciudad, COUNT(*) AS total_partidos
FROM V_CALENDARIO_PARTIDOS
GROUP BY estadio, ciudad
ORDER BY total_partidos DESC;

-- (partidos con 3+ goles totales)
SELECT torneo, equipo_local, equipo_visitante,
       goles_local, goles_visitante,
       (goles_local + goles_visitante) AS total_goles
FROM V_CALENDARIO_PARTIDOS
WHERE estado = 'Jugado'
  AND (goles_local + goles_visitante) >= 3
ORDER BY total_goles DESC;

PROMPT ============================================================
PROMPT V_PROXIMOS_ENCUENTROS
PROMPT ============================================================

-- Todos los encuentros pendientes
SELECT torneo, fase, equipo_local, equipo_visitante,
       fecha_partido, estadio, ciudad, dias_para_el_partido
FROM V_PROXIMOS_ENCUENTROS
ORDER BY fecha_partido;

-- Encuentros por ciudad
SELECT ciudad, COUNT(*) AS partidos_pendientes
FROM V_PROXIMOS_ENCUENTROS
GROUP BY ciudad
ORDER BY partidos_pendientes DESC;

PROMPT ============================================================
PROMPT V_RESUMEN_GERENCIAL_TORNEOS 
PROMPT ============================================================

SELECT torneo, temporada, estado, equipos_inscritos,
       partidos_jugados, total_goles,
       ROUND(promedio_goles_partido, 2) AS promedio_goles
FROM V_RESUMEN_GERENCIAL_TORNEOS
ORDER BY Fecha_Inicio;

-- Solo torneos en curso
SELECT torneo, equipos_inscritos, partidos_jugados, total_goles
FROM V_RESUMEN_GERENCIAL_TORNEOS
WHERE estado = 'En curso';

-- Torneo mas espectacular 
SELECT torneo, partidos_jugados, total_goles,
       ROUND(promedio_goles_partido, 2) AS promedio_goles
FROM V_RESUMEN_GERENCIAL_TORNEOS
WHERE partidos_jugados > 0
ORDER BY promedio_goles DESC;

-- Comparativa entre torneos 
SELECT torneo,
       equipos_inscritos AS equipos,
       partidos_jugados AS PJ,
       total_goles,
       ROUND(promedio_goles_partido, 2) AS promedio,
       CASE
           WHEN promedio_goles_partido >= 3 THEN 'Alta espectacularidad'
           WHEN promedio_goles_partido >= 2 THEN 'Media espectacularidad'
           ELSE 'Baja espectacularidad'
       END AS clasificacion
FROM V_RESUMEN_GERENCIAL_TORNEOS
ORDER BY total_goles DESC;

PROMPT ============================================================
PROMPT V_PLANTILLA_EQUIPOS 
PROMPT ============================================================

-- Ficha tecnica de un equipo
SELECT nombre, apellido, Posicion, camiseta, Nacionalidad, director_tecnico
FROM V_PLANTILLA_EQUIPOS
WHERE equipo = 'Tiburones de Barranquilla'
ORDER BY Posicion, camiseta;

-- Total de jugadores por equipo
SELECT equipo, director_tecnico, COUNT(*) AS total_jugadores
FROM V_PLANTILLA_EQUIPOS
GROUP BY equipo, director_tecnico
ORDER BY total_jugadores DESC;

-- Jugadores por posicion en todo el sistema
SELECT Posicion, COUNT(*) AS total
FROM V_PLANTILLA_EQUIPOS
GROUP BY Posicion
ORDER BY total DESC;

-- Todos los delanteros
SELECT equipo, nombre, apellido, camiseta, Nacionalidad
FROM V_PLANTILLA_EQUIPOS
WHERE Posicion = 'Delantero'
ORDER BY equipo;

-- Jugadores extranjeros (nacionalidad distinta a Colombia)
SELECT equipo, nombre, apellido, Nacionalidad, Posicion
FROM V_PLANTILLA_EQUIPOS
WHERE Nacionalidad <> 'Colombiana'
ORDER BY Nacionalidad, equipo;

-- Promedio de altura y peso por equipo (analisis fisico)
SELECT equipo,
       ROUND(AVG(Altura), 2) AS promedio_altura,
       ROUND(AVG(Peso), 2) AS promedio_peso,
       COUNT(*) AS jugadores
FROM V_PLANTILLA_EQUIPOS
GROUP BY equipo
ORDER BY promedio_altura DESC;


-- ============================================================
-- INDICES
-- ============================================================

-- Busqueda por apellido (IDX_PERSONA_APELLIDOS)
SELECT pe.Nombres, pe.Apellidos, j.Posicion, e.nombre_oficial AS equipo
FROM Jugador j
JOIN Persona pe ON j.Id_Persona = pe.Id_Persona
JOIN Equipo  e  ON j.Id_Equipo  = e.Id_Equipo
WHERE pe.Apellidos = 'Borja';

-- Inscripciones agrupadas por estado (IDX_INSCRIPCION_ESTADO)
SELECT Estado, COUNT(*) AS total
FROM Inscripcion
GROUP BY Estado
ORDER BY Estado;

-- Partidos por estado (IDX_PARTIDO_ESTADO)
SELECT estado, COUNT(*) AS total
FROM Partido
GROUP BY estado
ORDER BY total DESC;

-- Partidos en rango de fechas (IDX_PARTIDO_FECHA)
SELECT p.Id_Partido, el.nombre_oficial AS local,
       ev.nombre_oficial AS visitante, p.fecha_hora, p.estado
FROM Partido p
JOIN Equipo el ON p.Id_EquipoLocal = el.Id_Equipo
JOIN Equipo ev ON p.Id_EquipoVisitante = ev.Id_Equipo
WHERE p.fecha_hora BETWEEN TO_DATE('2027-01-01', 'YYYY-MM-DD')
                       AND TO_DATE('2028-12-31', 'YYYY-MM-DD')
ORDER BY p.fecha_hora;



