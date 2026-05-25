-- Vistas del sistema de torneos.

-- V_PROXIMOS_ENCUENTROS
CREATE OR REPLACE VIEW V_PROXIMOS_ENCUENTROS AS
SELECT 
    t.nombre AS torneo,
    f.nombre_fase AS fase,
    el.nombre_oficial AS equipo_local,
    ev.nombre_oficial AS equipo_visitante,
    p.fecha_hora AS fecha_partido,
    es.nombre AS estadio,
    es.ciudad,
    ROUND(p.fecha_hora - SYSDATE, 1) AS dias_para_el_partido
FROM Partido p
JOIN Fase f ON p.Id_Torneo = f.Id_Torneo AND p.nombre_fase = f.nombre_fase
JOIN Torneo t ON f.Id_Torneo = t.Id_Torneo
JOIN Estadio es ON p.Id_Estadio = es.Id_Estadio
JOIN Equipo el ON p.Id_EquipoLocal = el.Id_Equipo
JOIN Equipo ev ON p.Id_EquipoVisitante = ev.Id_Equipo
WHERE p.estado = 'Pendiente' AND p.fecha_hora >= SYSDATE
ORDER BY p.fecha_hora ASC;


-- V_TABLA_POSICIONES
CREATE OR REPLACE VIEW V_TABLA_POSICIONES AS
SELECT
    t.nombre AS torneo,
    t.temporada,
    t.estado AS estado_torneo,
    e.nombre_oficial AS equipo,
    ee.puntos,
    (ee.partidos_ganados + ee.partidos_empatados + ee.partidos_perdidos) AS PJ,
    ee.partidos_ganados AS PG,
    ee.partidos_empatados AS PE,
    ee.partidos_perdidos AS PP,
    ee.goles_favor AS GF,
    ee.goles_contra AS GC,
    (ee.goles_favor - ee.goles_contra) AS DG,
    RANK() OVER (
        PARTITION BY ee.Id_Torneo
        ORDER BY ee.puntos DESC,
                 (ee.goles_favor - ee.goles_contra) DESC,
                 ee.goles_favor DESC
    ) AS posicion
FROM Estadistica_Equipo ee
JOIN Equipo e ON ee.Id_Equipo = e.Id_Equipo
JOIN Torneo t ON ee.Id_Torneo = t.Id_Torneo;


-- V_CALENDARIO_PARTIDOS
CREATE OR REPLACE VIEW V_CALENDARIO_PARTIDOS AS
SELECT
    t.nombre AS torneo,
    t.temporada,
    f.nombre_fase AS fase,
    f.tipo_formato,
    p.Id_Partido,
    el.nombre_oficial AS equipo_local,
    ev.nombre_oficial AS equipo_visitante,
    p.fecha_hora,
    es.nombre AS estadio,
    es.ciudad,
    p.goles_local,
    p.goles_visitante,
    p.estado
FROM Partido p
JOIN Fase f ON p.Id_Torneo = f.Id_Torneo AND p.nombre_fase = f.nombre_fase
JOIN Torneo t ON f.Id_Torneo = t.Id_Torneo
JOIN Estadio es ON p.Id_Estadio = es.Id_Estadio
JOIN Equipo el ON p.Id_EquipoLocal = el.Id_Equipo
JOIN Equipo ev ON p.Id_EquipoVisitante = ev.Id_Equipo;


-- V_RESUMEN_GERENCIAL_TORNEOS
CREATE OR REPLACE VIEW V_RESUMEN_GERENCIAL_TORNEOS AS
SELECT
    t.Id_Torneo,
    t.nombre AS torneo,
    t.temporada,
    t.Fecha_Inicio,
    t.Fecha_Fin,
    t.estado,
    (SELECT COUNT(*) FROM Inscripcion i WHERE i.Id_Torneo = t.Id_Torneo AND i.Estado = 'Aceptada') AS equipos_inscritos,
    (SELECT COUNT(*) FROM Partido p WHERE p.Id_Torneo = t.Id_Torneo AND p.estado = 'Jugado') AS partidos_jugados,
    NVL((SELECT SUM(p.goles_local + p.goles_visitante) FROM Partido p WHERE p.Id_Torneo = t.Id_Torneo AND p.estado = 'Jugado'), 0) AS total_goles,
    NVL((SELECT AVG(p.goles_local + p.goles_visitante) FROM Partido p WHERE p.Id_Torneo = t.Id_Torneo AND p.estado = 'Jugado'), 0) AS promedio_goles_partido
FROM Torneo t;


-- V_PLANTILLA_EQUIPOS
CREATE OR REPLACE VIEW V_PLANTILLA_EQUIPOS AS
SELECT
    e.nombre_oficial AS equipo,
    p.nombres AS nombre,
    p.Apellidos AS apellido,
    j.Posicion,
    j.Num_camiseta AS camiseta,
    j.Nacionalidad,
    j.Peso,
    j.Altura,
    dt.nombre_dt        AS director_tecnico
FROM Jugador j
JOIN Persona p ON j.Id_Persona = p.Id_Persona
JOIN Equipo  e ON j.Id_Equipo  = e.Id_Equipo
LEFT JOIN (
    SELECT
        tc.Id_Equipo,
        pdt.nombres || ' ' || pdt.Apellidos AS nombre_dt
    FROM Tecnico  tc
    JOIN Persona  pdt ON tc.Id_Persona = pdt.Id_Persona
    WHERE tc.Rol = 'Principal'
) dt ON j.Id_Equipo = dt.Id_Equipo;
