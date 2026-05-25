-- TuplasNoOk
-- Inserciones que deben fallar por restricciones de tupla (CHECKs)

-- 1. Torneo con Fecha_Fin anterior a Fecha_Inicio
INSERT INTO Torneo (Id_Torneo, nombre, temporada, Fecha_Inicio, Fecha_Fin, estado) 
VALUES (991, 'Copa Paradoja Temporal', '2027-II', TO_DATE('2027-12-31', 'YYYY-MM-DD'), TO_DATE('2027-01-01', 'YYYY-MM-DD'), 'Programado');

-- 2. Torneo con Fecha_Fin igual a Fecha_Inicio 
INSERT INTO Torneo (Id_Torneo, nombre, temporada, Fecha_Inicio, Fecha_Fin, estado) 
VALUES (992, 'Copa Un Solo Dia', '2027-III', TO_DATE('2027-05-05', 'YYYY-MM-DD'), TO_DATE('2027-05-05', 'YYYY-MM-DD'), 'Programado');

-- 3. Partido con Equipo Local igual al Visitante 
INSERT INTO Partido (Id_Partido, Id_Torneo, nombre_fase, Id_Estadio, Id_EquipoLocal, Id_EquipoVisitante, fecha_hora, goles_local, goles_visitante, estado) 
VALUES (991, 20, 'Fase de Grupos', 10, 20, 20, TO_DATE('2024-07-21 15:00', 'YYYY-MM-DD HH24:MI'), 0, 0, 'Pendiente');

-- 4. Otro caso de equipos iguales con datos diferentes
INSERT INTO Partido (Id_Partido, Id_Torneo, nombre_fase, Id_Estadio, Id_EquipoLocal, Id_EquipoVisitante, fecha_hora, goles_local, goles_visitante, estado)
VALUES (3, 1, 'Fase de Grupos', 1, 10, 10, TO_DATE('2024-06-01','YYYY-MM-DD'), 0, 0, 'Pendiente');

-- 5. Partido con Estado Pendiente pero con goles registrados
INSERT INTO Partido (Id_Partido, Id_Torneo, nombre_fase, Id_Estadio, Id_EquipoLocal, Id_EquipoVisitante, fecha_hora, goles_local, goles_visitante, estado)
VALUES (994, 332536260, 'Fase de Grupos', 300, 300, 301, TO_DATE('2024-06-01','YYYY-MM-DD'), 2, 1, 'Pendiente');

-- 6. Violacion de Tupla (CHK_EstEquipo_Puntos_Consistencia)
-- El equipo 301 tiene 1 victoria (3 pts) y 0 empates (0 pts). Deberia tener 3 puntos, pero intentamos inyectarle 10 puntos.
INSERT INTO Estadistica_Equipo (Id_Estadistica, Id_Equipo, Id_Torneo, puntos, goles_favor, goles_contra, partidos_ganados, partidos_perdidos, partidos_empatados)
VALUES (301, 301, 332536260, 10, 2, 1, 1, 1, 0);
