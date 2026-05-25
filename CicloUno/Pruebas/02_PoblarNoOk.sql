-- 1. DNI duplicado en Persona
INSERT INTO Persona VALUES (8, '1234567890', 'Mario', 'Ruiz', TO_DATE('1991-03-10', 'YYYY-MM-DD'));

-- 2. DNI nulo en Persona
INSERT INTO Persona VALUES (9, NULL, 'Laura', 'Silva', TO_DATE('1992-05-20', 'YYYY-MM-DD'));

-- 3. Jugador con Id_Persona inexistente
INSERT INTO Jugador VALUES (99, 1, 'Delantero', 9, 75.5, 1.80, 'Colombiano');

-- 4. Jugador con Id_Equipo inexistente
INSERT INTO Jugador VALUES (1, 99, 'Delantero', 9, 75.5, 1.80, 'Colombiano');

-- 5. Jugador con Num_camiseta fuera de rango
INSERT INTO Jugador VALUES (1, 1, 'Delantero', 100, 75.5, 1.80, 'Colombiano');

-- 6. Jugador con Peso negativo
INSERT INTO Jugador VALUES (1, 1, 'Delantero', 9, -75.5, 1.80, 'Colombiano');

-- 7. Jugador con Altura negativa
INSERT INTO Jugador VALUES (1, 1, 'Delantero', 9, 75.5, -1.80, 'Colombiano');

-- 8. Tecnico con Rol invalido
INSERT INTO Tecnico VALUES (3, 1, 'Entrenador');

-- 9. Arbitro con Categoria invalida
INSERT INTO Arbitro VALUES (5, 'Internacional');

-- 10. Organizador con Cargo invalido
INSERT INTO Organizador VALUES (6, 'Secretario');

-- 11. Representante con Cargo invalido
INSERT INTO Representante VALUES (7, 1, '3001234567', 'rep2@email.com', 'Delegado');

-- 12. Representante con correo duplicado
INSERT INTO Representante VALUES (7, 1, '3009876543', 'representante@email.com', 'Presidente');

-- 13. Torneo con Fecha_Fin anterior a Fecha_Inicio
INSERT INTO Torneo VALUES (2, 'Copa 2024', '2024', TO_DATE('2024-06-30', 'YYYY-MM-DD'), TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'Programado');

-- 14. Torneo con Estado invalido
INSERT INTO Torneo VALUES (2, 'Copa 2024', '2024', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-06-30', 'YYYY-MM-DD'), 'Suspendido');

-- 15. Fase con nombre_fase invalido
INSERT INTO Fase VALUES (1, 'Ronda 1', 'Liga');

-- 16. Fase duplicada en el mismo torneo (PK Compuesta)
-- (Suponiendo que ya existe 'Fase de Grupos' en Torneo 1 por PoblarOk)
INSERT INTO Fase VALUES (1, 'Fase de Grupos', 'Liga');

-- 17. Partido con Torneo y Fase inexistente (FK Compuesta)
INSERT INTO Partido VALUES (999, 1, 'Octavos', 1, 1, 2, SYSDATE, 0, 0, 'Pendiente');


-- ==========================================================
-- PRUEBAS DE FALLO ADICIONALES (Estructura 01 al 05)
-- ==========================================================

-- 18. Violacion de Llave Foranea (FK): Estadio no existe
INSERT INTO Partido VALUES (998, 1, 'Fase de Grupos', 999, 1, 2, SYSDATE, 0, 0, 'Pendiente');

-- 19. Violacion de Llave Unica (UK): Nombre de equipo repetido (Ya existe 'Titanes FC')
INSERT INTO Equipo VALUES (99, 'Titanes FC', 'logo_falso.png', SYSDATE);

-- 20. Violacion de Llave Unica (UK): Patrocinador con el mismo NIT que 'Coca Cola'
INSERT INTO Patrocinador VALUES (99, 'Pepsi', '860034313', 'Economico');

-- 21. Violacion de Llave Unica (UK): Dos jugadores con la misma camiseta en el mismo equipo
-- (El jugador 100 de Atletico Linces ya tiene la camiseta 1)
INSERT INTO Jugador VALUES (101, 10, 'Defensa', 1, 80.0, 1.85, 'Colombiano');

-- 22. Violacion de Atributo (Check): Correo electronico con formato invalido
INSERT INTO Representante VALUES (99, 2, '3000000000', 'correo_sin_arroba.com', 'Manager');

-- 23. Violacion de Atributo (Check): Ciudad no permitida para el Estadio
INSERT INTO Estadio VALUES (99, 'Estadio Nuevo', 'Tokio', 'Calle 1', 10000, 'Natural');

-- 24. Violacion de Atributo (Check): Goles negativos en un partido
INSERT INTO Partido VALUES (997, 1, 'Fase de Grupos', 1, 1, 2, SYSDATE, -1, 0, 'Pendiente');

-- ==========================================================
-- PRUEBAS DE FALLO RANDOM (Deben dar error de Constraint)
-- ==========================================================

-- 25. Violacion de Tupla (CHK_Partido_Equipos): Un equipo jugando contra si mismo
-- El equipo Cyberneticos FC (8500001) contra Cyberneticos FC (8500001)
INSERT INTO Partido VALUES (3100002, 5100001, 'Final', 7400002, 8500001, 8500001, SYSDATE, 0, 0, 'Pendiente');

-- 26. Violacion de Atributo (CHK_Estadio_Cancha): Tipo de cancha absurdo
INSERT INTO Estadio VALUES (7400003, 'Estadio de Cristal', 'Bogota', 'Calle Luna', 10000, 'Vidrio');

-- 27. Violacion de Unicidad (UK_Representante_Correo): Robandole el correo a Lex Luthor
INSERT INTO Representante VALUES (9920008, 8500003, '000-0000', 'lex@cyberneticos.com', 'Manager');

-- 28. Violacion de Atributo (CHK_Jugador_Camiseta): Camiseta fuera del rango 1-99
INSERT INTO Jugador VALUES (9920001, 8500003, 'Delantero', 999, 70.0, 1.80, 'Terricola');

-- 29. Violacion de Atributo (CHK_Jugador_Posicion): Posicion inventada
INSERT INTO Jugador VALUES (9920001, 8500003, 'Aguatero', 10, 70.0, 1.80, 'Terricola');

-- 30. Violacion de Tupla (CHK_EstEquipo_Puntos_Consistencia): Puntos matematicamente imposibles
-- Si ganó 1 partido y empató 0, debería tener 3 puntos. Le ponemos 100.
INSERT INTO Estadistica_Equipo VALUES (2100003, 8500003, 5100001, 100, 5, 0, 1, 0, 0);

-- 31. Violacion de Atributo (CHK_Fase_Formato): Tipo de formato de torneo no permitido
INSERT INTO Fase VALUES (5100001, 'Semifinal', 'Batalla Campal');