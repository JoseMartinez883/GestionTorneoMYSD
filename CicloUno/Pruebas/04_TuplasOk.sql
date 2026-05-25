-- TuplasOk

INSERT INTO Persona VALUES (3434343, 'CC-300', 'Santiago', 'Moreno', TO_DATE('1990-06-15', 'YYYY-MM-DD'));
INSERT INTO Equipo  VALUES (300, 'Aguila FC', NULL, SYSDATE);
INSERT INTO Equipo  VALUES (301, 'Panteras SC', NULL, SYSDATE);
INSERT INTO Estadio VALUES (300, 'Estadioo Central', 'Bogota', NULL, 1000, 'Natural');

-- 2. VERIFICACION DE 06_TUPLAS (Torneo: Fecha_Fin > Fecha_Inicio).
INSERT INTO Torneo VALUES (332536260, 'Copa Pfwefwrueba', '2027', 
    TO_DATE('2027-01-01', 'YYYY-MM-DD'), 
    TO_DATE('2027-12-31', 'YYYY-MM-DD'), 
    'Programado');
    
INSERT INTO Fase VALUES (332536260, 'Fase de Grupos', 'Liga');

-- 3. VERIFICACION DE 06_TUPLAS (Partido: Local <> Visitante) y 
INSERT INTO Partido VALUES (
    8800, 332536260, 'Fase de Grupos', 300, 
    300, 301, -- El local (300) es distinto al visitante (301)
    TO_DATE('2027-05-01 15:00', 'YYYY-MM-DD HH24:MI'), 
    0, 0, 'Pendiente');

--- 4. VERIFICACION DE 06_TUPLAS (partido no jugado, no debe tener goles)
INSERT INTO Partido VALUES (
    8801, 332536260, 'Fase de Grupos', 300, 
    301, 300, -- Invertimos el local y visitante para cumplir la otra tupla
    TO_DATE('2027-05-02 15:00', 'YYYY-MM-DD HH24:MI'), 
    2, 1, 'Jugado'); -- Como esta "Jugado", el CHECK debe permitir estos goles
    
-- 5. VERIFICACION DE 06_TUPLAS (Estadistica_Equipo: Puntos = Ganados*3 + Empatados)
-- El equipo 300 tiene 2 victorias (6 pts) y 1 empate (1 pt) = 7 puntos en total.
INSERT INTO Estadistica_Equipo (Id_Estadistica, Id_Equipo, Id_Torneo, puntos, goles_favor, goles_contra, partidos_ganados, partidos_perdidos, partidos_empatados)
VALUES (300, 300, 332536260, 7, 5, 2, 2, 1, 1);

