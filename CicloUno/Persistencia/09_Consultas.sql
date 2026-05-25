-- Se definen las consultas operativas del sistema de gestion de torneos de futbol.

-- Consulta 1: Inscripciones por torneo con estado y equipo participante.
SELECT 
    t.nombre AS torneo,
    t.temporada,
    e.nombre_oficial AS equipo,
    i.Fecha_solicitud,
    i.Estado
FROM Inscripcion i
JOIN Torneo t ON i.Id_Torneo = t.Id_Torneo
JOIN Equipo e ON i.Id_Equipo = e.Id_Equipo
ORDER BY t.nombre, i.Estado;

-- Consulta 2: Partidos por fase con resultado, estadio y equipos.
SELECT 
    f.nombre_fase,
    el.nombre_oficial AS equipo_local,
    ev.nombre_oficial AS equipo_visitante,
    p.goles_local,
    p.goles_visitante,
    p.estado,
    p.fecha_hora,
    es.nombre AS estadio,
    es.ciudad
FROM Partido p
JOIN Fase f ON p.Id_Torneo = f.Id_Torneo AND p.nombre_fase = f.nombre_fase
JOIN Equipo el ON p.Id_EquipoLocal = el.Id_Equipo
JOIN Equipo ev ON p.Id_EquipoVisitante = ev.Id_Equipo
JOIN Estadio es ON p.Id_Estadio = es.Id_Estadio
ORDER BY f.nombre_fase, p.fecha_hora;

-- Consulta3 : Ver la nomina completa de jugadores de un equipo especifico.
SELECT 
    p.nombres || ' ' || p.Apellidos AS nombre_jugador,
    j.num_camiseta AS dorsal,
    j.Posicion,
    j.Altura AS estatura,
    j.Nacionalidad,
    e.nombre_oficial AS equipo
FROM Jugador j
JOIN Persona p ON j.Id_Persona = p.Id_Persona
JOIN Equipo e ON j.Id_Equipo = e.Id_Equipo
WHERE j.Id_Equipo = 10 -- Aqui iria el parametro del equipo del tecnico
ORDER BY j.num_camiseta;


-- Consulta 4 Partidos asignados a un arbitro especifico.
SELECT 
    t.nombre AS torneo,
    t.temporada,
    f.nombre_fase,                     
    p.fecha_hora,
    es.nombre AS estadio,
    el.nombre_oficial AS equipo_local, 
    ev.nombre_oficial AS equipo_visitante
FROM Arbitro_Partido ap
JOIN Partido p ON ap.Id_Partido = p.Id_Partido
JOIN Fase f ON p.Id_Torneo = f.Id_Torneo AND p.nombre_fase = f.nombre_fase               
JOIN Torneo t ON f.Id_Torneo = t.Id_Torneo         
JOIN Estadio es ON p.Id_Estadio = es.Id_Estadio
JOIN Equipo el ON p.Id_EquipoLocal = el.Id_Equipo
JOIN Equipo ev ON p.Id_EquipoVisitante = ev.Id_Equipo
WHERE ap.Id_Persona = 112
ORDER BY t.nombre, p.fecha_hora;


-- Consulta 5: Partidos programados por estadio para coordinar horarios y evitar cruces.
SELECT 
    es.nombre AS estadio,
    es.ciudad,
    p.fecha_hora
FROM Estadio es
JOIN Partido p ON es.Id_Estadio = p.Id_Estadio
ORDER BY es.nombre, p.fecha_hora;

-- Consulta 6: Buscar equipos que coincidan con un nombre ingresado para su ficha técnica.
SELECT 
    nombre_oficial,
    escudo_logo,
    fecha_fundacion
FROM Equipo
WHERE UPPER(nombre_oficial) LIKE '%REAL%' -- Aquí iría el parámetro de búsqueda 
ORDER BY nombre_oficial;

-- Consulta 7: Historial de todos los partidos de un equipo específico para analizar rendimiento.
SELECT 
    Id_Partido,
    Fecha_hora,
    Nombre_fase,
    Id_EquipoLocal,
    Id_EquipoVisitante,
    Goles_local,
    Goles_visitante,
    Estado
FROM Partido
WHERE Id_EquipoLocal = 10 OR Id_EquipoVisitante = 10 -- Aquí iría el parámetro de prueba del equipo
ORDER BY Fecha_hora DESC;

-- Consulta 8: Torneos filtrados por su estado para consulta del público general.
SELECT 
    Id_Torneo,
    nombre,
    temporada,
    Fecha_Inicio,
    Fecha_Fin,
    estado
FROM Torneo
WHERE UPPER(estado) = 'PROGRAMADO' 
ORDER BY Fecha_Inicio DESC;

-- Consulta 9: Fases correspondientes a un torneo para coordinar la programación.
SELECT 
    t.nombre AS torneo,
    f.nombre_fase AS fase,
    f.tipo_formato
FROM Fase f
JOIN Torneo t ON f.Id_Torneo = t.Id_Torneo
WHERE f.Id_Torneo = 1 
ORDER BY f.nombre_fase;

-- Consulta 10: Datos de contacto del representante administrativo de un equipo específico.
SELECT 
    p.Nombres,
    p.Apellidos,
    p.DNI,
    r.Telefono,
    r.Correo,
    r.Cargo
FROM Representante r
JOIN Persona p ON r.Id_Persona = p.Id_Persona
WHERE r.Id_Equipo = 10 
ORDER BY p.Apellidos, p.Nombres;


