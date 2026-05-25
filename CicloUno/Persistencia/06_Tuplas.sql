-- Se definen las restricciones de tupla que involucran mas de un atributo de la misma tabla.

ALTER TABLE Torneo DROP CONSTRAINT CHK_Torneo_Fechas;
ALTER TABLE Partido DROP CONSTRAINT CHK_Partido_Equipos;
ALTER TABLE Partido DROP CONSTRAINT CHK_Partido_Marcador;
ALTER TABLE Estadistica_Equipo DROP CONSTRAINT CHK_EstEquipo_Puntos_Consistencia;

-- Un torneo debe finalizar despues de su fecha de inicio.
ALTER TABLE Torneo
    ADD CONSTRAINT CHK_Torneo_Fechas
    CHECK (Fecha_Fin > Fecha_Inicio);

-- Un partido no puede jugarse contra si mismo: los equipos deben ser distintos.
ALTER TABLE Partido
    ADD CONSTRAINT CHK_Partido_Equipos
    CHECK (Id_EquipoLocal <> Id_EquipoVisitante);

-- Un partido que no se este jugando o no haya terminado debe tener su marcador en cero.
ALTER TABLE Partido
    ADD CONSTRAINT CHK_Partido_Marcador
    CHECK (estado IN ('Jugado', 'En curso') OR (goles_local = 0 AND goles_visitante = 0));

-- Los puntos deben ser coherentes con los resultados
ALTER TABLE Estadistica_Equipo
    ADD CONSTRAINT CHK_EstEquipo_Puntos_Consistencia
    CHECK (puntos = (partidos_ganados * 3) + partidos_empatados);