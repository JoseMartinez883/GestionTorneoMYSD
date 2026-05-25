-- Se insertan los datos iniciales de prueba (poblacion sin triggers).

-- PERSONAS
INSERT INTO Persona VALUES (1, '1234567890', 'Carlos', 'Rodriguez', TO_DATE('1990-05-15', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (2, '0987654321', 'Juan', 'Martinez', TO_DATE('1985-03-20', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (3, '1122334455', 'Pedro', 'Garcia', TO_DATE('1992-07-10', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (4, '5544332211', 'Luis', 'Lopez', TO_DATE('1988-11-25', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (5, '9988776655', 'Andres', 'Perez', TO_DATE('1995-01-30', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (6, '1231231231', 'Maria', 'Gomez', TO_DATE('1993-04-10', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (7, '3213213213', 'Sofia', 'Torres', TO_DATE('1994-06-15', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (8, '9998887776', 'Roberto', 'Mendez', TO_DATE('1988-05-10', 'YYYY-MM-DD'));

-- EQUIPOS Y JUGADORES
INSERT INTO Equipo VALUES (1, 'Atletico FC', NULL, TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO Equipo VALUES (2, 'Deportivo SC', 'logos/deportivo.jpg', NULL);

INSERT INTO Jugador VALUES (1, 1, 'Delantero', 9, 75.5, 1.80, 'Colombiano');
INSERT INTO Jugador VALUES (2, 1, 'Portero', 1, 80.0, 1.85, NULL);

INSERT INTO Tecnico VALUES (3, 1, 'Principal');
INSERT INTO Tecnico VALUES (4, 2, 'Asistente');

INSERT INTO Arbitro VALUES (5, 'Profesional');
INSERT INTO Organizador VALUES (6, 'Principal');

INSERT INTO Representante VALUES (7, 1, '3001234567', 'representante@email.com', 'Presidente');
INSERT INTO Representante VALUES (8, 2, '3007654321', 'representante4@email.com', 'Manager');

-- TORNEOS 1
INSERT INTO Torneo VALUES (1, 'Copa Ciudad 2024', '2024', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-06-30', 'YYYY-MM-DD'), 'Programado');
INSERT INTO Torneo_Organizador VALUES (1, 6);
INSERT INTO Fase VALUES (1, 'Fase de Grupos', 'Liga');
INSERT INTO Fase VALUES (1, 'Semifinal', 'Eliminacion directa');

INSERT INTO Estadio VALUES (1, 'Estadio Central', 'Bogota', 'Calle 57 #34-20', 50000, 'Natural');
INSERT INTO Estadio VALUES (2, 'Estadio Norte', 'Medellin', NULL, NULL, 'Sintetica');

INSERT INTO Patrocinador VALUES (1, 'Coca Cola Colombia', '860034313', 'Economico');
INSERT INTO Patrocinador VALUES (2, 'Adidas Colombia', '900123456', 'Equipamiento');
INSERT INTO Torneo_Patrocinador VALUES (1, 1);
INSERT INTO Torneo_Patrocinador VALUES (1, 2);
INSERT INTO Equipo_Patrocinador VALUES (1, 1);
INSERT INTO Equipo_Patrocinador VALUES (2, 2);

INSERT INTO Inscripcion VALUES (1, 1, 1, 7, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Aceptada');
INSERT INTO Inscripcion VALUES (2, 2, 1, 8, TO_DATE('2024-01-20', 'YYYY-MM-DD'), 'Aceptada');

INSERT INTO Partido VALUES (1, 1, 'Fase de Grupos', 1, 1, 2, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (5, 1);

INSERT INTO Estadistica_Equipo VALUES (1, 1, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO Estadistica_Equipo VALUES (2, 2, 1, 0, 0, 0, 0, 0, 0);

-- MAS DATOS (LIGA DE CAMPEONES)
INSERT INTO Equipo VALUES (10, 'Club Atletico Linces', 'logo_linces.png', TO_DATE('1995-08-12', 'YYYY-MM-DD'));
INSERT INTO Equipo VALUES (11, 'Real CÃ³ndores', 'logo_condores.png', TO_DATE('2001-03-25', 'YYYY-MM-DD'));
INSERT INTO Equipo VALUES (12, 'Deportivo Metropolitano', 'logo_metro.png', TO_DATE('1988-11-05', 'YYYY-MM-DD'));
INSERT INTO Equipo VALUES (13, 'Sporting Norte', 'logo_snorte.png', TO_DATE('2010-02-18', 'YYYY-MM-DD'));

INSERT INTO Estadio VALUES (10, 'Estadio Monumental', 'Cali', 'Carrera 50 #12-30', 45000, 'Natural');
INSERT INTO Estadio VALUES (11, 'Arena del Sol', 'Barranquilla', 'Av. del Rio #45', 38000, 'Natural');
INSERT INTO Estadio VALUES (12, 'Polideportivo Sur', 'Envigado', 'Calle 40 Sur', 15000, 'Sintetica');

INSERT INTO Patrocinador VALUES (10, 'Nike Colombia', '900888777', 'Equipamiento');
INSERT INTO Patrocinador VALUES (11, 'Banco del Deporte', '800555444', 'Economico');
INSERT INTO Patrocinador VALUES (12, 'Cruz Roja', '860111222', 'Servicios medicos');
INSERT INTO Patrocinador VALUES (13, 'Aerolineas Fast', '901222333', 'Transporte');

INSERT INTO Equipo_Patrocinador VALUES (10, 10);
INSERT INTO Equipo_Patrocinador VALUES (10, 11);
INSERT INTO Equipo_Patrocinador VALUES (11, 10);
INSERT INTO Equipo_Patrocinador VALUES (12, 13);

INSERT INTO Persona VALUES (100, '1111111111', 'David', 'Ospina', TO_DATE('1998-04-20', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (101, '1111111112', 'Mario', 'Yepes', TO_DATE('1995-09-15', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (102, '1111111113', 'Radamel', 'Falcao', TO_DATE('1992-02-10', 'YYYY-MM-DD'));

INSERT INTO Persona VALUES (103, '2222222221', 'James', 'Rodriguez', TO_DATE('1996-07-12', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (104, '2222222222', 'Juan', 'Cuadrado', TO_DATE('1994-05-26', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (105, '2222222223', 'Luis', 'Diaz', TO_DATE('1999-01-13', 'YYYY-MM-DD'));

INSERT INTO Persona VALUES (106, '3333333331', 'Carlos', 'Bacca', TO_DATE('1990-09-08', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (107, '3333333332', 'Teofilo', 'Gutierrez', TO_DATE('1991-05-17', 'YYYY-MM-DD'));

INSERT INTO Persona VALUES (110, '4444444441', 'Jose', 'Pekerman', TO_DATE('1960-09-03', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (111, '4444444442', 'Francisco', 'Maturana', TO_DATE('1955-02-15', 'YYYY-MM-DD'));

INSERT INTO Persona VALUES (112, '5555555551', 'Wilmar', 'Roldan', TO_DATE('1980-01-24', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (113, '5555555552', 'Oscar', 'Ruiz', TO_DATE('1975-11-01', 'YYYY-MM-DD'));

INSERT INTO Persona VALUES (114, '6666666661', 'Jorge', 'Mendes', TO_DATE('1970-05-05', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (115, '6666666662', 'Mino', 'Raiola', TO_DATE('1968-11-04', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (116, '6666666663', 'Rep', 'Equipo12', TO_DATE('1970-01-01', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (117, '6666666664', 'Rep', 'Equipo13', TO_DATE('1970-01-01', 'YYYY-MM-DD'));

INSERT INTO Jugador VALUES (100, 10, 'Portero', 1, 80.5, 1.85, 'Colombiano');
INSERT INTO Jugador VALUES (101, 10, 'Defensa', 3, 82.0, 1.88, 'Colombiano');
INSERT INTO Jugador VALUES (102, 10, 'Delantero', 9, 78.0, 1.77, 'Colombiano');
INSERT INTO Jugador VALUES (103, 11, 'Mediocampista', 10, 75.0, 1.80, 'Colombiano');
INSERT INTO Jugador VALUES (104, 11, 'Mediocampista', 11, 72.5, 1.76, 'Colombiano');
INSERT INTO Jugador VALUES (105, 11, 'Delantero', 7, 73.0, 1.78, 'Colombiano');
INSERT INTO Jugador VALUES (106, 12, 'Delantero', 9, 79.0, 1.81, 'Colombiano');
INSERT INTO Jugador VALUES (107, 12, 'Delantero', 19, 76.5, 1.75, 'Colombiano');

INSERT INTO Tecnico VALUES (110, 10, 'Principal');
INSERT INTO Tecnico VALUES (111, 11, 'Principal');

INSERT INTO Arbitro VALUES (112, 'Profesional');
INSERT INTO Arbitro VALUES (113, 'Profesional');

INSERT INTO Representante VALUES (114, 10, '3001112233', 'jorge@linces.com', 'Presidente');
INSERT INTO Representante VALUES (115, 11, '3102223344', 'mino@condores.com', 'Presidente');
INSERT INTO Representante VALUES (116, 12, '3103334455', 'rep12@metro.com', 'Presidente');
INSERT INTO Representante VALUES (117, 13, '3104445566', 'rep13@snorte.com', 'Presidente');

INSERT INTO Torneo VALUES (10, 'Liga de Campeones 2023', '2023-I', TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-06-20', 'YYYY-MM-DD'), 'Finalizado');
INSERT INTO Torneo_Patrocinador VALUES (10, 11);
INSERT INTO Torneo_Patrocinador VALUES (10, 12);

INSERT INTO Fase VALUES (10, 'Cuartos', 'Eliminacion directa');
INSERT INTO Fase VALUES (10, 'Semifinal', 'Eliminacion directa');
INSERT INTO Fase VALUES (10, 'Final', 'Liga'); 

INSERT INTO Inscripcion VALUES (10, 10, 10, 114, TO_DATE('2022-12-10', 'YYYY-MM-DD'), 'Aceptada');
INSERT INTO Inscripcion VALUES (11, 11, 10, 115, TO_DATE('2022-12-12', 'YYYY-MM-DD'), 'Aceptada');
INSERT INTO Inscripcion VALUES (12, 12, 10, 116, TO_DATE('2022-12-13', 'YYYY-MM-DD'), 'Aceptada');
INSERT INTO Inscripcion VALUES (13, 13, 10, 117, TO_DATE('2022-12-14', 'YYYY-MM-DD'), 'Aceptada');

INSERT INTO Partido VALUES (100, 10, 'Cuartos', 10, 10, 11, TO_DATE('2023-05-10 18:00', 'YYYY-MM-DD HH24:MI'), 2, 1, 'Jugado');
INSERT INTO Partido VALUES (101, 10, 'Semifinal', 11, 12, 13, TO_DATE('2023-05-15 20:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Jugado');
INSERT INTO Partido VALUES (102, 10, 'Cuartos', 10, 10, 12, TO_DATE('2023-06-20 19:30', 'YYYY-MM-DD HH24:MI'), 3, 1, 'Jugado');

INSERT INTO Arbitro_Partido VALUES (112, 100);
INSERT INTO Arbitro_Partido VALUES (113, 101);
INSERT INTO Arbitro_Partido VALUES (112, 102);

INSERT INTO Estadistica_Equipo VALUES (10, 10, 10, 6, 5, 2, 2, 0, 0);
INSERT INTO Estadistica_Equipo VALUES (11, 11, 10, 0, 1, 2, 0, 1, 0);
INSERT INTO Estadistica_Equipo VALUES (12, 12, 10, 1, 1, 3, 0, 1, 1); 
INSERT INTO Estadistica_Equipo VALUES (13, 13, 10, 0, 0, 0, 0, 0, 0);

-- MAS DATOS (COPA DE VERANO 2024)
INSERT INTO Equipo VALUES (20, 'Titanes FC', 'logo_titanes.png', TO_DATE('2005-10-10', 'YYYY-MM-DD'));
INSERT INTO Equipo VALUES (21, 'Gladiadores SC', 'logo_gladiadores.png', TO_DATE('1999-04-15', 'YYYY-MM-DD'));
INSERT INTO Estadio VALUES (20, 'OlÃ­mpico Universitario', 'Medellin', 'Carrera 80 #10-20', 25000, 'Natural');
INSERT INTO Patrocinador VALUES (20, 'Bebidas Energy', '900333444', 'Economico');
INSERT INTO Patrocinador VALUES (21, 'Ropa Deportiva Pro', '800666777', 'Equipamiento');

INSERT INTO Equipo_Patrocinador VALUES (20, 20);
INSERT INTO Equipo_Patrocinador VALUES (21, 21);

INSERT INTO Persona VALUES (200, '7777777771', 'Andres', 'Iniesta', TO_DATE('1984-05-11', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (201, '7777777772', 'Xavi', 'Hernandez', TO_DATE('1980-01-25', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (202, '8888888881', 'Luka', 'Modric', TO_DATE('1985-09-09', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (203, '8888888882', 'Toni', 'Kroos', TO_DATE('1990-01-04', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (204, '9999999991', 'Pep', 'Guardiola', TO_DATE('1971-01-18', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (205, '9999999992', 'Carlo', 'Ancelotti', TO_DATE('1959-06-10', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (206, '1010101010', 'Pierluigi', 'Collina', TO_DATE('1960-02-13', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (207, '1212121212', 'Florentino', 'Perez', TO_DATE('1947-03-08', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (208, '1313131313', 'Joan', 'Laporta', TO_DATE('1962-06-29', 'YYYY-MM-DD'));

INSERT INTO Jugador VALUES (200, 20, 'Mediocampista', 8, 68.0, 1.71, 'Espanol');
INSERT INTO Jugador VALUES (201, 20, 'Mediocampista', 6, 68.0, 1.70, 'Espanol');
INSERT INTO Jugador VALUES (202, 21, 'Mediocampista', 10, 66.0, 1.72, 'Croata');
INSERT INTO Jugador VALUES (203, 21, 'Mediocampista', 8, 76.0, 1.83, 'Aleman');

INSERT INTO Tecnico VALUES (204, 20, 'Principal');
INSERT INTO Tecnico VALUES (205, 21, 'Principal');

INSERT INTO Arbitro VALUES (206, 'Amateur');

INSERT INTO Representante VALUES (207, 21, '3009998877', 'florentino@gladiadores.com', 'Presidente');
INSERT INTO Representante VALUES (208, 20, '3108887766', 'joan@titanes.com', 'Presidente');

INSERT INTO Torneo VALUES (20, 'Copa de Verano 2024', '2024', TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-08-15', 'YYYY-MM-DD'), 'Programado');
INSERT INTO Torneo_Patrocinador VALUES (20, 20);
INSERT INTO Fase VALUES (20, 'Fase de Grupos', 'Liga');

INSERT INTO Inscripcion VALUES (20, 20, 20, 208, TO_DATE('2024-06-01', 'YYYY-MM-DD'), 'Aceptada');
INSERT INTO Inscripcion VALUES (21, 21, 20, 207, TO_DATE('2024-06-02', 'YYYY-MM-DD'), 'Aceptada');

INSERT INTO Partido VALUES (200, 20, 'Fase de Grupos', 20, 20, 21, TO_DATE('2024-07-10 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 0, 'Pendiente');
INSERT INTO Arbitro_Partido VALUES (206, 200);

INSERT INTO Estadistica_Equipo VALUES (20, 20, 20, 0, 0, 0, 0, 0, 0);
INSERT INTO Estadistica_Equipo VALUES (21, 21, 20, 0, 0, 0, 0, 0, 0);


-- ==========================================================
-- MAS DATOS ADICIONALES (COPA COLOMBIA 2025)
-- ==========================================================

-- Nuevos Equipos y Estadios
INSERT INTO Equipo VALUES (30, 'Millonarios FC', 'logo_millos.png', TO_DATE('1946-06-18', 'YYYY-MM-DD'));
INSERT INTO Equipo VALUES (31, 'Independiente Santa Fe', 'logo_santafe.png', TO_DATE('1941-02-28', 'YYYY-MM-DD'));
INSERT INTO Equipo VALUES (32, 'Equidad Seguros', 'logo_equidad.png', TO_DATE('1982-12-01', 'YYYY-MM-DD'));

INSERT INTO Estadio VALUES (30, 'El Campin', 'Bogota', 'Calle 57', 39000, 'Natural');
INSERT INTO Estadio VALUES (31, 'Estadio de Techo', 'Bogota', 'Kennedy', 10000, 'Mixta');

-- Nuevos Patrocinadores
INSERT INTO Patrocinador VALUES (30, 'Cerveza Aguila', '800111222', 'Economico');
INSERT INTO Patrocinador VALUES (31, 'Wplay', '901444555', 'Economico');

INSERT INTO Equipo_Patrocinador VALUES (30, 30);
INSERT INTO Equipo_Patrocinador VALUES (31, 30);
INSERT INTO Equipo_Patrocinador VALUES (32, 31);

-- Nuevas Personas (Jugadores, Tecnicos y Representantes)
INSERT INTO Persona VALUES (300, '1928374650', 'Radamel', 'Garcia', TO_DATE('1986-02-10', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (301, '0564738291', 'David', 'Mackalister', TO_DATE('1986-11-20', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (302, '1122334499', 'Hugo', 'Rodallega', TO_DATE('1985-07-25', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (303, '9988776611', 'Daniel', 'Torres', TO_DATE('1989-11-15', 'YYYY-MM-DD'));

INSERT INTO Persona VALUES (310, '5556667778', 'Alberto', 'Gamero', TO_DATE('1964-02-03', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (311, '8887776665', 'Pablo', 'Peirano', TO_DATE('1975-01-21', 'YYYY-MM-DD'));

INSERT INTO Persona VALUES (320, '1010202030', 'Enrique', 'Camacho', TO_DATE('1955-08-12', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (321, '3030404050', 'Eduardo', 'Mendez', TO_DATE('1960-12-05', 'YYYY-MM-DD'));

-- Asignación de Roles
INSERT INTO Jugador VALUES (300, 30, 'Delantero', 9, 78.0, 1.77, 'Colombiano');
INSERT INTO Jugador VALUES (301, 30, 'Mediocampista', 14, 72.0, 1.72, 'Colombiano');
INSERT INTO Jugador VALUES (302, 31, 'Delantero', 9, 80.0, 1.81, 'Colombiano');
INSERT INTO Jugador VALUES (303, 31, 'Mediocampista', 16, 75.0, 1.83, 'Colombiano');

INSERT INTO Tecnico VALUES (310, 30, 'Principal');
INSERT INTO Tecnico VALUES (311, 31, 'Principal');

INSERT INTO Representante VALUES (320, 30, '3109998888', 'gerencia@millos.com', 'Presidente');
INSERT INTO Representante VALUES (321, 31, '3107776666', 'gerencia@santafe.com', 'Presidente');

-- Nuevo Torneo y Logística
INSERT INTO Torneo VALUES (30, 'Copa Colombia 2025', '2025', TO_DATE('2025-02-01', 'YYYY-MM-DD'), TO_DATE('2025-11-30', 'YYYY-MM-DD'), 'Programado');
INSERT INTO Torneo_Patrocinador VALUES (30, 30);
INSERT INTO Fase VALUES (30, 'Octavos', 'Ida y vuelta');

-- Inscripciones y Partidos (Todo Ok)
INSERT INTO Inscripcion VALUES (30, 30, 30, 320, TO_DATE('2025-01-10', 'YYYY-MM-DD'), 'Aceptada');
INSERT INTO Inscripcion VALUES (31, 31, 30, 321, TO_DATE('2025-01-11', 'YYYY-MM-DD'), 'Aceptada');

INSERT INTO Partido VALUES (300, 30, 'Octavos', 30, 30, 31, TO_DATE('2025-03-01 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 0, 'Pendiente');

INSERT INTO Estadistica_Equipo VALUES (30, 30, 30, 0, 0, 0, 0, 0, 0);
INSERT INTO Estadistica_Equipo VALUES (31, 31, 30, 0, 0, 0, 0, 0, 0);

-- ==========================================================
-- DATOS EXTREMADAMENTE RANDOM Y LARGOS (Copa Intergalactica)
-- ==========================================================

-- Equipos Random con IDs gigantes
INSERT INTO Equipo VALUES (8500001, 'Cyberneticos FC', 'logo_cyber.png', TO_DATE('2015-11-11', 'YYYY-MM-DD'));
INSERT INTO Equipo VALUES (8500002, 'Krakens del Sur SC', 'logo_kraken.png', TO_DATE('2018-04-22', 'YYYY-MM-DD'));
INSERT INTO Equipo VALUES (8500003, 'Dragones Dorados', 'logo_dragon.png', TO_DATE('2020-01-01', 'YYYY-MM-DD'));

-- Estadios Random (Respetando las ciudades permitidas de tu CHK)
INSERT INTO Estadio VALUES (7400001, 'Arena Quantica', 'Cartagena', 'Zona Costera 99', 65000, 'Sintetica');
INSERT INTO Estadio VALUES (7400002, 'Coliseo del Trueno', 'Manizales', 'Pico Alto 44', 32000, 'Natural');

-- Patrocinadores Random
INSERT INTO Patrocinador VALUES (6300001, 'CyberDyne Systems', 'NIT-999888777-1', 'Economico');
INSERT INTO Patrocinador VALUES (6300002, 'Stark Industries Col', 'NIT-111222333-X', 'Equipamiento');

INSERT INTO Equipo_Patrocinador VALUES (8500001, 6300001);
INSERT INTO Equipo_Patrocinador VALUES (8500002, 6300002);

-- Personas Random (IDs de 7 digitos)
INSERT INTO Persona VALUES (9920001, 'XZ-8899001', 'Zephyr', 'Nova', TO_DATE('1990-12-12', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (9920002, 'XZ-8899002', 'Orion', 'Pax', TO_DATE('1988-08-08', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (9920003, 'XZ-8899003', 'Lyra', 'Vance', TO_DATE('1995-03-14', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (9920004, 'XZ-8899004', 'Drax', 'Mendoza', TO_DATE('1992-10-31', 'YYYY-MM-DD'));

INSERT INTO Persona VALUES (9920005, 'DT-7776661', 'Morpheus', 'Lider', TO_DATE('1975-05-20', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (9920006, 'DT-7776662', 'Trinity', 'Cortes', TO_DATE('1980-02-15', 'YYYY-MM-DD'));

INSERT INTO Persona VALUES (9920007, 'RP-5554441', 'Lex', 'Luthor', TO_DATE('1965-07-07', 'YYYY-MM-DD'));
INSERT INTO Persona VALUES (9920008, 'RP-5554442', 'Bruce', 'Wayne', TO_DATE('1970-11-11', 'YYYY-MM-DD'));

-- Asignando Jugadores
INSERT INTO Jugador VALUES (9920001, 8500001, 'Delantero', 99, 85.5, 1.95, 'Marciano');
INSERT INTO Jugador VALUES (9920002, 8500001, 'Portero', 1, 90.0, 2.05, 'Marciano');
INSERT INTO Jugador VALUES (9920003, 8500002, 'Mediocampista', 10, 65.0, 1.65, 'Atlantico');
INSERT INTO Jugador VALUES (9920004, 8500002, 'Defensa', 4, 78.0, 1.88, 'Atlantico');

-- Tecnicos y Representantes
INSERT INTO Tecnico VALUES (9920005, 8500001, 'Principal');
INSERT INTO Tecnico VALUES (9920006, 8500002, 'Principal');

INSERT INTO Representante VALUES (9920007, 8500001, '999-CYBER', 'lex@cyberneticos.com', 'Presidente');
INSERT INTO Representante VALUES (9920008, 8500002, '999-KRAKN', 'bruce@krakens.com', 'Apoderado legal');

-- Torneo Random
INSERT INTO Torneo VALUES (5100001, 'Copa Galactica 3000', 'Temporada X', TO_DATE('2026-01-01', 'YYYY-MM-DD'), TO_DATE('2026-12-31', 'YYYY-MM-DD'), 'Programado');
INSERT INTO Fase VALUES (5100001, 'Final', 'Ida y vuelta');

-- Inscripciones 
INSERT INTO Inscripcion VALUES (4100001, 8500001, 5100001, 9920007, TO_DATE('2025-12-01', 'YYYY-MM-DD'), 'Aceptada');
INSERT INTO Inscripcion VALUES (4100002, 8500002, 5100001, 9920008, TO_DATE('2025-12-02', 'YYYY-MM-DD'), 'Aceptada');

-- Partidos y Estadisticas
INSERT INTO Partido VALUES (3100001, 5100001, 'Final', 7400001, 8500001, 8500002, TO_DATE('2026-06-15 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 0, 'Pendiente');

INSERT INTO Estadistica_Equipo VALUES (2100001, 8500001, 5100001, 0, 0, 0, 0, 0, 0);
INSERT INTO Estadistica_Equipo VALUES (2100002, 8500002, 5100001, 0, 0, 0, 0, 0, 0);

