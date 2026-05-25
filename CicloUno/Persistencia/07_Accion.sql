-- Se definen las acciones referenciales

-- Las estadisticas de equipo se eliminan en cascada si se elimina el equipo,
-- preservando la coherencia del historial cuando un equipo es removido del sistema.
ALTER TABLE Estadistica_Equipo DROP CONSTRAINT FK_EstadisticaEquipo_Equipo;
ALTER TABLE Estadistica_Equipo ADD CONSTRAINT FK_EstadisticaEquipo_Equipo
    FOREIGN KEY (Id_Equipo) REFERENCES Equipo(Id_Equipo)
    ON DELETE CASCADE;

-- Las asignaciones de arbitros a partidos se eliminan en cascada si se elimina el partido,
-- dado que la asignacion pierde relevancia si el partido ya no existe.
ALTER TABLE Arbitro_Partido DROP CONSTRAINT FK_ArbitroPartido_Partido;
ALTER TABLE Arbitro_Partido ADD CONSTRAINT FK_ArbitroPartido_Partido
    FOREIGN KEY (Id_Partido)
    REFERENCES Partido(Id_Partido)
    ON DELETE CASCADE;

ALTER TABLE Equipo_Patrocinador DROP CONSTRAINT FK_EquiPatroci_Equipo;
ALTER TABLE Equipo_Patrocinador ADD CONSTRAINT FK_EquiPatroci_Equipo
    FOREIGN KEY (Id_Equipo)
    REFERENCES Equipo(Id_Equipo)
    ON DELETE CASCADE;

ALTER TABLE Torneo_Patrocinador DROP CONSTRAINT FK_TorneoPatrocinador_Torneo;
ALTER TABLE Torneo_Patrocinador ADD CONSTRAINT FK_TorneoPatrocinador_Torneo
    FOREIGN KEY (Id_Torneo)
    REFERENCES Torneo(Id_Torneo)
    ON DELETE CASCADE;
