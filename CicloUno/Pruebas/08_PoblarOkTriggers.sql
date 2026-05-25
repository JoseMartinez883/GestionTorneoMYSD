-- Se insertan datos de prueba con los disparadores activos.

INSERT INTO Estadio VALUES (2000, 'Estadio Metropolitano', 'Barranquilla', 'Calle 72', 45000, 'Natural');
INSERT INTO Estadio VALUES (2001, 'Estadio El Campin', 'Bogota', 'Carrera 30', 36000, 'Natural');

INSERT INTO Persona VALUES (2000, 'CC-2000', 'Arturo', 'Char', TO_DATE('1970-01-01', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (2001, 'CC-2001', 'Eduardo', 'Mendez', TO_DATE('1965-05-15', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (2002, 'CC-2002', 'Tulio', 'Gomez', TO_DATE('1960-10-20', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (2003, 'CC-2003', 'Fuad', 'Char', TO_DATE('1945-03-12', 'YYYY-MM-DD'));

INSERT INTO Persona VALUES (2100, 'CC-2100', 'Alberto', 'Gamero', TO_DATE('1964-02-03', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (2101, 'CC-2101', 'Hernan', 'Torres', TO_DATE('1961-05-31', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (2102, 'CC-2102', 'Pablo', 'Repetto', TO_DATE('1974-03-14', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (2103, 'CC-2103', 'Arturo', 'Reyes', TO_DATE('1969-04-08', 'YYYY-MM-DD'));

INSERT INTO Equipo VALUES (2000, 'Tiburones de Barranquilla', NULL, TO_DATE('1924-08-07', 'YYYY-MM-DD'));
INSERT INTO Equipo VALUES (2001, 'Leones de la Capital', NULL, TO_DATE('1946-02-28', 'YYYY-MM-DD'));
INSERT INTO Equipo VALUES (2002, 'Escarlatas del Valle', NULL, TO_DATE('1927-02-13', 'YYYY-MM-DD'));
INSERT INTO Equipo VALUES (2003, 'Verdes de la Montana', NULL, TO_DATE('1947-04-30', 'YYYY-MM-DD'));

INSERT INTO Representante VALUES (2000, 2000, '3001', 'presi1@liga.com', 'Presidente');
INSERT INTO Representante VALUES (2001, 2001, '3002', 'presi2@liga.com', 'Presidente');
INSERT INTO Representante VALUES (2002, 2002, '3003', 'presi3@liga.com', 'Presidente');
INSERT INTO Representante VALUES (2003, 2003, '3004', 'presi4@liga.com', 'Presidente');

INSERT INTO Tecnico VALUES (2100, 2000, 'Principal');
INSERT INTO Tecnico VALUES (2101, 2001, 'Principal');
INSERT INTO Tecnico VALUES (2102, 2002, 'Principal');
INSERT INTO Tecnico VALUES (2103, 2003, 'Principal');

INSERT INTO Persona VALUES (2200, 'J-2200', 'Carlos', 'Sierra', TO_DATE('1990-10-25', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2200, 2000, 'Mediocampista', 10, 75, 1.78, 'Colombiana');
INSERT INTO Persona VALUES (2201, 'J-2201', 'Miguel', 'Borja', TO_DATE('1993-01-26', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2201, 2000, 'Delantero', 9, 82, 1.83, 'Colombiana');

INSERT INTO Persona VALUES (2210, 'J-2210', 'Hugo', 'Rodallega', TO_DATE('1985-07-25', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2210, 2001, 'Delantero', 11, 79, 1.81, 'Colombiana');
INSERT INTO Persona VALUES (2211, 'J-2211', 'Daniel', 'Torres', TO_DATE('1989-11-15', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2211, 2001, 'Mediocampista', 5, 76, 1.80, 'Colombiana');

INSERT INTO Persona VALUES (2220, 'J-2220', 'Adrian', 'Ramos', TO_DATE('1986-01-22', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2220, 2002, 'Delantero', 20, 80, 1.85, 'Colombiana');

INSERT INTO Persona VALUES (2230, 'J-2230', 'Edwin', 'Cardona', TO_DATE('1992-12-08', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2230, 2003, 'Mediocampista', 8, 84, 1.82, 'Colombiana');

INSERT INTO Persona VALUES (2500, 'ARB-2500', 'Imer', 'Machado', TO_DATE('1973-03-26', 'YYYY-MM-DD'));
INSERT INTO Arbitro VALUES (2500, 'Profesional');

-- Completando plantilla para equipo 2000
INSERT INTO Persona VALUES (2300, 'J-2300', 'Jugador2300', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2300, 2000, 'Defensa', 30, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2301, 'J-2301', 'Jugador2301', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2301, 2000, 'Defensa', 31, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2302, 'J-2302', 'Jugador2302', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2302, 2000, 'Defensa', 32, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2303, 'J-2303', 'Jugador2303', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2303, 2000, 'Defensa', 33, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2304, 'J-2304', 'Jugador2304', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2304, 2000, 'Defensa', 34, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2305, 'J-2305', 'Jugador2305', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2305, 2000, 'Defensa', 35, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2306, 'J-2306', 'Jugador2306', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2306, 2000, 'Defensa', 36, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2307, 'J-2307', 'Jugador2307', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2307, 2000, 'Defensa', 37, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2308, 'J-2308', 'Jugador2308', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2308, 2000, 'Defensa', 38, 75, 1.75, 'Colombiana');

-- Completando plantilla para equipo 2001
INSERT INTO Persona VALUES (2309, 'J-2309', 'Jugador2309', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2309, 2001, 'Defensa', 30, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2310, 'J-2310', 'Jugador2310', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2310, 2001, 'Defensa', 31, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2311, 'J-2311', 'Jugador2311', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2311, 2001, 'Defensa', 32, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2312, 'J-2312', 'Jugador2312', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2312, 2001, 'Defensa', 33, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2313, 'J-2313', 'Jugador2313', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2313, 2001, 'Defensa', 34, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2314, 'J-2314', 'Jugador2314', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2314, 2001, 'Defensa', 35, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2315, 'J-2315', 'Jugador2315', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2315, 2001, 'Defensa', 36, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2316, 'J-2316', 'Jugador2316', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2316, 2001, 'Defensa', 37, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2317, 'J-2317', 'Jugador2317', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2317, 2001, 'Defensa', 38, 75, 1.75, 'Colombiana');

-- Completando plantilla para equipo 2002
INSERT INTO Persona VALUES (2318, 'J-2318', 'Jugador2318', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2318, 2002, 'Defensa', 30, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2319, 'J-2319', 'Jugador2319', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2319, 2002, 'Defensa', 31, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2320, 'J-2320', 'Jugador2320', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2320, 2002, 'Defensa', 32, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2321, 'J-2321', 'Jugador2321', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2321, 2002, 'Defensa', 33, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2322, 'J-2322', 'Jugador2322', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2322, 2002, 'Defensa', 34, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2323, 'J-2323', 'Jugador2323', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2323, 2002, 'Defensa', 35, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2324, 'J-2324', 'Jugador2324', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2324, 2002, 'Defensa', 36, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2325, 'J-2325', 'Jugador2325', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2325, 2002, 'Defensa', 37, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2326, 'J-2326', 'Jugador2326', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2326, 2002, 'Defensa', 38, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2327, 'J-2327', 'Jugador2327', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2327, 2002, 'Defensa', 39, 75, 1.75, 'Colombiana');

-- Completando plantilla para equipo 2003
INSERT INTO Persona VALUES (2328, 'J-2328', 'Jugador2328', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2328, 2003, 'Defensa', 30, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2329, 'J-2329', 'Jugador2329', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2329, 2003, 'Defensa', 31, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2330, 'J-2330', 'Jugador2330', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2330, 2003, 'Defensa', 32, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2331, 'J-2331', 'Jugador2331', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2331, 2003, 'Defensa', 33, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2332, 'J-2332', 'Jugador2332', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2332, 2003, 'Defensa', 34, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2333, 'J-2333', 'Jugador2333', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2333, 2003, 'Defensa', 35, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2334, 'J-2334', 'Jugador2334', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2334, 2003, 'Defensa', 36, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2335, 'J-2335', 'Jugador2335', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2335, 2003, 'Defensa', 37, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2336, 'J-2336', 'Jugador2336', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2336, 2003, 'Defensa', 38, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2337, 'J-2337', 'Jugador2337', 'Gen', TO_DATE('1998-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2337, 2003, 'Defensa', 39, 75, 1.75, 'Colombiana');

INSERT INTO Torneo VALUES (2000, 'Superliga Profesional 2027', '2027-I', TO_DATE('2027-01-10', 'YYYY-MM-DD'), TO_DATE('2027-06-20', 'YYYY-MM-DD'), 'Programado');
INSERT INTO Fase VALUES (2000, 'Fase de Grupos', 'Liga');

INSERT INTO Inscripcion VALUES (2000, 2000, 2000, 2000, SYSDATE, 'Pendiente');
INSERT INTO Inscripcion VALUES (2001, 2001, 2000, 2001, SYSDATE, 'Pendiente');
INSERT INTO Inscripcion VALUES (2002, 2002, 2000, 2002, SYSDATE, 'Pendiente');
INSERT INTO Inscripcion VALUES (2003, 2003, 2000, 2003, SYSDATE, 'Pendiente');

UPDATE Inscripcion SET Estado = 'Aceptada' WHERE Id_Torneo = 2000;

UPDATE Torneo SET estado = 'En curso' WHERE Id_Torneo = 2000;

INSERT INTO Partido VALUES (2001, 2000, 'Fase de Grupos', 2000, 2000, 2001, TO_DATE('2027-02-01 19:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Partido VALUES (2002, 2000, 'Fase de Grupos', 2001, 2002, 2003, TO_DATE('2027-02-02 20:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Partido VALUES (2003, 2000, 'Fase de Grupos', 2000, 2003, 2000, TO_DATE('2027-02-10 18:30', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');

UPDATE Partido SET estado = 'Jugado', goles_local = 2, goles_visitante = 1 WHERE Id_Partido = 2001;
UPDATE Partido SET estado = 'Jugado', goles_local = 0, goles_visitante = 0 WHERE Id_Partido = 2002;
UPDATE Partido SET estado = 'Jugado', goles_local = 1, goles_visitante = 3 WHERE Id_Partido = 2003;

-- Consulta para verificar los datos ingresados 
SELECT 
    e.nombre_oficial AS Equipo,
    ee.puntos,
    ee.partidos_ganados AS PG,
    ee.partidos_empatados AS PE,
    ee.partidos_perdidos AS PP,
    ee.goles_favor AS GF,
    ee.goles_contra AS GC
FROM Estadistica_Equipo ee
JOIN Equipo e ON ee.Id_Equipo = e.Id_Equipo
WHERE ee.Id_Torneo = 2000
ORDER BY ee.puntos DESC, (ee.goles_favor - ee.goles_contra) DESC;

-- ==============================
-- DATOS MASIVOS (NUEVOS TORNEOS)
-- ==============================

INSERT INTO Equipo VALUES (3000, 'Bucaramanga FC', NULL, TO_DATE('1949-05-11', 'YYYY-MM-DD'));
INSERT INTO Equipo VALUES (3001, 'Once Caldas', NULL, TO_DATE('1961-01-15', 'YYYY-MM-DD'));
INSERT INTO Equipo VALUES (3002, 'Pasto', NULL, TO_DATE('1949-10-12', 'YYYY-MM-DD'));
INSERT INTO Equipo VALUES (3003, 'Tolima', NULL, TO_DATE('1954-12-18', 'YYYY-MM-DD'));

INSERT INTO Persona VALUES (3000, 'CC-3000', 'Presi', 'Buca', TO_DATE('1960-01-01', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (3001, 'CC-3001', 'Presi', 'Once', TO_DATE('1960-01-01', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (3002, 'CC-3002', 'Presi', 'Pasto', TO_DATE('1960-01-01', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (3003, 'CC-3003', 'Presi', 'Tolima', TO_DATE('1960-01-01', 'YYYY-MM-DD'));

INSERT INTO Representante VALUES (3000, 3000, '3111', 'p1@liga.com', 'Presidente');
INSERT INTO Representante VALUES (3001, 3001, '3112', 'p2@liga.com', 'Presidente');
INSERT INTO Representante VALUES (3002, 3002, '3113', 'p3@liga.com', 'Presidente');
INSERT INTO Representante VALUES (3003, 3003, '3114', 'p4@liga.com', 'Presidente');

-- Plantilla completa equipo 3000
INSERT INTO Persona VALUES (2338, 'J-2338', 'Masivo2338', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2338, 3000, 'Defensa', 1, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2339, 'J-2339', 'Masivo2339', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2339, 3000, 'Defensa', 2, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2340, 'J-2340', 'Masivo2340', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2340, 3000, 'Defensa', 3, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2341, 'J-2341', 'Masivo2341', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2341, 3000, 'Defensa', 4, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2342, 'J-2342', 'Masivo2342', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2342, 3000, 'Defensa', 5, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2343, 'J-2343', 'Masivo2343', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2343, 3000, 'Defensa', 6, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2344, 'J-2344', 'Masivo2344', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2344, 3000, 'Defensa', 7, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2345, 'J-2345', 'Masivo2345', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2345, 3000, 'Defensa', 8, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2346, 'J-2346', 'Masivo2346', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2346, 3000, 'Defensa', 9, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2347, 'J-2347', 'Masivo2347', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2347, 3000, 'Defensa', 10, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2348, 'J-2348', 'Masivo2348', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2348, 3000, 'Defensa', 11, 75, 1.75, 'Colombiana');

-- Plantilla completa equipo 3001
INSERT INTO Persona VALUES (2349, 'J-2349', 'Masivo2349', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2349, 3001, 'Defensa', 1, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2350, 'J-2350', 'Masivo2350', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2350, 3001, 'Defensa', 2, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2351, 'J-2351', 'Masivo2351', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2351, 3001, 'Defensa', 3, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2352, 'J-2352', 'Masivo2352', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2352, 3001, 'Defensa', 4, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2353, 'J-2353', 'Masivo2353', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2353, 3001, 'Defensa', 5, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2354, 'J-2354', 'Masivo2354', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2354, 3001, 'Defensa', 6, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2355, 'J-2355', 'Masivo2355', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2355, 3001, 'Defensa', 7, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2356, 'J-2356', 'Masivo2356', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2356, 3001, 'Defensa', 8, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2357, 'J-2357', 'Masivo2357', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2357, 3001, 'Defensa', 9, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2358, 'J-2358', 'Masivo2358', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2358, 3001, 'Defensa', 10, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2359, 'J-2359', 'Masivo2359', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2359, 3001, 'Defensa', 11, 75, 1.75, 'Colombiana');

-- Plantilla completa equipo 3002
INSERT INTO Persona VALUES (2360, 'J-2360', 'Masivo2360', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2360, 3002, 'Defensa', 1, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2361, 'J-2361', 'Masivo2361', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2361, 3002, 'Defensa', 2, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2362, 'J-2362', 'Masivo2362', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2362, 3002, 'Defensa', 3, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2363, 'J-2363', 'Masivo2363', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2363, 3002, 'Defensa', 4, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2364, 'J-2364', 'Masivo2364', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2364, 3002, 'Defensa', 5, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2365, 'J-2365', 'Masivo2365', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2365, 3002, 'Defensa', 6, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2366, 'J-2366', 'Masivo2366', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2366, 3002, 'Defensa', 7, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2367, 'J-2367', 'Masivo2367', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2367, 3002, 'Defensa', 8, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2368, 'J-2368', 'Masivo2368', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2368, 3002, 'Defensa', 9, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2369, 'J-2369', 'Masivo2369', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2369, 3002, 'Defensa', 10, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2370, 'J-2370', 'Masivo2370', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2370, 3002, 'Defensa', 11, 75, 1.75, 'Colombiana');

-- Plantilla completa equipo 3003
INSERT INTO Persona VALUES (2371, 'J-2371', 'Masivo2371', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2371, 3003, 'Defensa', 1, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2372, 'J-2372', 'Masivo2372', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2372, 3003, 'Defensa', 2, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2373, 'J-2373', 'Masivo2373', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2373, 3003, 'Defensa', 3, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2374, 'J-2374', 'Masivo2374', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2374, 3003, 'Defensa', 4, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2375, 'J-2375', 'Masivo2375', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2375, 3003, 'Defensa', 5, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2376, 'J-2376', 'Masivo2376', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2376, 3003, 'Defensa', 6, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2377, 'J-2377', 'Masivo2377', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2377, 3003, 'Defensa', 7, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2378, 'J-2378', 'Masivo2378', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2378, 3003, 'Defensa', 8, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2379, 'J-2379', 'Masivo2379', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2379, 3003, 'Defensa', 9, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2380, 'J-2380', 'Masivo2380', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2380, 3003, 'Defensa', 10, 75, 1.75, 'Colombiana');
INSERT INTO Persona VALUES (2381, 'J-2381', 'Masivo2381', 'Gen', TO_DATE('1999-01-01', 'YYYY-MM-DD'));
INSERT INTO Jugador VALUES (2381, 3003, 'Defensa', 11, 75, 1.75, 'Colombiana');

INSERT INTO Torneo VALUES (3000, 'Torneo Clausura 2028', '2028-II', TO_DATE('2028-07-10', 'YYYY-MM-DD'), TO_DATE('2028-12-20', 'YYYY-MM-DD'), 'Programado');
INSERT INTO Fase VALUES (3000, 'Fase de Grupos', 'Liga');

INSERT INTO Inscripcion VALUES (3000, 3000, 3000, 3000, SYSDATE, 'Pendiente');
INSERT INTO Inscripcion VALUES (3001, 3001, 3000, 3001, SYSDATE, 'Pendiente');
INSERT INTO Inscripcion VALUES (3002, 3002, 3000, 3002, SYSDATE, 'Pendiente');
INSERT INTO Inscripcion VALUES (3003, 3003, 3000, 3003, SYSDATE, 'Pendiente');
INSERT INTO Inscripcion VALUES (3004, 2000, 3000, 2000, SYSDATE, 'Pendiente');
INSERT INTO Inscripcion VALUES (3005, 2001, 3000, 2001, SYSDATE, 'Pendiente');

UPDATE Inscripcion SET Estado = 'Aceptada' WHERE Id_Torneo = 3000;
UPDATE Torneo SET estado = 'En curso' WHERE Id_Torneo = 3000;

-- Partidos masivos
INSERT INTO Partido VALUES (3000, 3000, 'Fase de Grupos', 2000, 3001, 2001, TO_DATE('2028-08-01 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (2500, 3000);
UPDATE Partido SET estado = 'Jugado', goles_local = 0, goles_visitante = 0 WHERE Id_Partido = 3000;
INSERT INTO Partido VALUES (3001, 3000, 'Fase de Grupos', 2000, 3003, 2001, TO_DATE('2028-08-01 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (2500, 3001);
UPDATE Partido SET estado = 'Jugado', goles_local = 0, goles_visitante = 1 WHERE Id_Partido = 3001;
INSERT INTO Partido VALUES (3002, 3000, 'Fase de Grupos', 2000, 3001, 2000, TO_DATE('2028-08-01 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (2500, 3002);
UPDATE Partido SET estado = 'Jugado', goles_local = 1, goles_visitante = 4 WHERE Id_Partido = 3002;
INSERT INTO Partido VALUES (3003, 3000, 'Fase de Grupos', 2000, 3001, 3003, TO_DATE('2028-08-01 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (2500, 3003);
UPDATE Partido SET estado = 'Jugado', goles_local = 4, goles_visitante = 0 WHERE Id_Partido = 3003;
INSERT INTO Partido VALUES (3004, 3000, 'Fase de Grupos', 2000, 2000, 2001, TO_DATE('2028-08-01 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (2500, 3004);
UPDATE Partido SET estado = 'Jugado', goles_local = 4, goles_visitante = 1 WHERE Id_Partido = 3004;
INSERT INTO Partido VALUES (3005, 3000, 'Fase de Grupos', 2000, 3003, 2000, TO_DATE('2028-08-01 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (2500, 3005);
UPDATE Partido SET estado = 'Jugado', goles_local = 4, goles_visitante = 3 WHERE Id_Partido = 3005;
INSERT INTO Partido VALUES (3006, 3000, 'Fase de Grupos', 2000, 3001, 3002, TO_DATE('2028-08-01 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (2500, 3006);
UPDATE Partido SET estado = 'Jugado', goles_local = 1, goles_visitante = 3 WHERE Id_Partido = 3006;
INSERT INTO Partido VALUES (3007, 3000, 'Fase de Grupos', 2000, 3000, 3003, TO_DATE('2028-08-01 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (2500, 3007);
UPDATE Partido SET estado = 'Jugado', goles_local = 4, goles_visitante = 2 WHERE Id_Partido = 3007;
INSERT INTO Partido VALUES (3008, 3000, 'Fase de Grupos', 2000, 3002, 3003, TO_DATE('2028-08-01 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (2500, 3008);
UPDATE Partido SET estado = 'Jugado', goles_local = 0, goles_visitante = 1 WHERE Id_Partido = 3008;
INSERT INTO Partido VALUES (3009, 3000, 'Fase de Grupos', 2000, 3000, 2000, TO_DATE('2028-08-01 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (2500, 3009);
UPDATE Partido SET estado = 'Jugado', goles_local = 3, goles_visitante = 2 WHERE Id_Partido = 3009;
INSERT INTO Partido VALUES (3010, 3000, 'Fase de Grupos', 2000, 3000, 2001, TO_DATE('2028-08-01 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (2500, 3010);
UPDATE Partido SET estado = 'Jugado', goles_local = 2, goles_visitante = 1 WHERE Id_Partido = 3010;
INSERT INTO Partido VALUES (3011, 3000, 'Fase de Grupos', 2000, 3002, 2001, TO_DATE('2028-08-01 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (2500, 3011);
UPDATE Partido SET estado = 'Jugado', goles_local = 1, goles_visitante = 2 WHERE Id_Partido = 3011;
INSERT INTO Partido VALUES (3012, 3000, 'Fase de Grupos', 2000, 3000, 3001, TO_DATE('2028-08-01 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (2500, 3012);
UPDATE Partido SET estado = 'Jugado', goles_local = 0, goles_visitante = 0 WHERE Id_Partido = 3012;
INSERT INTO Partido VALUES (3013, 3000, 'Fase de Grupos', 2000, 3000, 3002, TO_DATE('2028-08-01 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (2500, 3013);
UPDATE Partido SET estado = 'Jugado', goles_local = 3, goles_visitante = 0 WHERE Id_Partido = 3013;
INSERT INTO Partido VALUES (3014, 3000, 'Fase de Grupos', 2000, 3002, 2000, TO_DATE('2028-08-01 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (2500, 3014);
UPDATE Partido SET estado = 'Jugado', goles_local = 2, goles_visitante = 2 WHERE Id_Partido = 3014;
