-- Se definen las claves foraneas para mantener la integridad referencial entre las tablas.

ALTER TABLE Jugador
    ADD CONSTRAINT FK_Jugador_Persona
    FOREIGN KEY (Id_Persona)
    REFERENCES Persona(Id_Persona);

ALTER TABLE Jugador
    ADD CONSTRAINT FK_Jugador_Equipo
    FOREIGN KEY (Id_Equipo)
    REFERENCES Equipo(Id_Equipo);

ALTER TABLE Tecnico
    ADD CONSTRAINT FK_Tecnico_Persona
    FOREIGN KEY (Id_Persona)
    REFERENCES Persona(Id_Persona);

ALTER TABLE Arbitro
    ADD CONSTRAINT FK_Arbitro_Persona
    FOREIGN KEY (Id_Persona)
    REFERENCES Persona(Id_Persona);

ALTER TABLE Organizador
    ADD CONSTRAINT FK_Organizador_Persona
    FOREIGN KEY (Id_Persona)
    REFERENCES Persona(Id_Persona);

ALTER TABLE Representante
    ADD CONSTRAINT FK_Representante_Persona
    FOREIGN KEY (Id_Persona)
    REFERENCES Persona(Id_Persona);

ALTER TABLE Tecnico
    ADD CONSTRAINT FK_Tecnico_Equipo
    FOREIGN KEY (Id_Equipo)
    REFERENCES Equipo(Id_Equipo);

ALTER TABLE Representante
    ADD CONSTRAINT FK_Representante_Equipo
    FOREIGN KEY (Id_Equipo)
    REFERENCES Equipo(Id_Equipo);

ALTER TABLE Fase
    ADD CONSTRAINT FK_Fase_Torneo
    FOREIGN KEY (Id_Torneo)
    REFERENCES Torneo(Id_Torneo);

ALTER TABLE Inscripcion
    ADD CONSTRAINT FK_Inscripcion_Equipo
    FOREIGN KEY (Id_Equipo)
    REFERENCES Equipo(Id_Equipo);

ALTER TABLE Inscripcion
    ADD CONSTRAINT FK_Inscripcion_Torneo
    FOREIGN KEY (Id_Torneo)
    REFERENCES Torneo(Id_Torneo);

ALTER TABLE Inscripcion
    ADD CONSTRAINT FK_Inscripcion_Representante
    FOREIGN KEY (Id_Representante)
    REFERENCES Representante(Id_Persona);

ALTER TABLE Partido
    ADD CONSTRAINT FK_Partido_Fase
    FOREIGN KEY (Id_Torneo, nombre_fase)
    REFERENCES Fase(Id_Torneo, nombre_fase);

ALTER TABLE Partido
    ADD CONSTRAINT FK_Partido_Estadio
    FOREIGN KEY (Id_Estadio)
    REFERENCES Estadio(Id_Estadio);

ALTER TABLE Partido
    ADD CONSTRAINT FK_Partido_EquipoLocal
    FOREIGN KEY (Id_EquipoLocal)
    REFERENCES Equipo(Id_Equipo);

ALTER TABLE Partido
    ADD CONSTRAINT FK_Partido_EquipoVisitante
    FOREIGN KEY (Id_EquipoVisitante)
    REFERENCES Equipo(Id_Equipo);

ALTER TABLE Estadistica_Equipo
    ADD CONSTRAINT FK_EstadisticaEquipo_Equipo
    FOREIGN KEY (Id_Equipo)
    REFERENCES Equipo(Id_Equipo);

ALTER TABLE Estadistica_Equipo
    ADD CONSTRAINT FK_EstadisticaEquipo_Torneo
    FOREIGN KEY (Id_Torneo)
    REFERENCES Torneo(Id_Torneo);

ALTER TABLE Torneo_Patrocinador
    ADD CONSTRAINT FK_TorneoPatrocinador_Torneo
    FOREIGN KEY (Id_Torneo)
    REFERENCES Torneo(Id_Torneo);

ALTER TABLE Torneo_Patrocinador
    ADD CONSTRAINT FK_TorneoPatroci_Patrocinador
    FOREIGN KEY (Id_Patrocinador)
    REFERENCES Patrocinador(Id_Patrocinador);

ALTER TABLE Equipo_Patrocinador
    ADD CONSTRAINT FK_EquiPatroci_Equipo
    FOREIGN KEY (Id_Equipo)
    REFERENCES Equipo(Id_Equipo);

ALTER TABLE Equipo_Patrocinador
    ADD CONSTRAINT FK_EquiPatroc_Patrocinador
    FOREIGN KEY (Id_Patrocinador)
    REFERENCES Patrocinador(Id_Patrocinador);

ALTER TABLE Arbitro_Partido
    ADD CONSTRAINT FK_ArbitroPartido_Arbitro
    FOREIGN KEY (Id_Persona)
    REFERENCES Arbitro(Id_Persona);

ALTER TABLE Arbitro_Partido
    ADD CONSTRAINT FK_ArbitroPartido_Partido
    FOREIGN KEY (Id_Partido)
    REFERENCES Partido(Id_Partido);

ALTER TABLE Torneo_Organizador
    ADD CONSTRAINT FK_TorneoOrganizador_Torneo
    FOREIGN KEY (Id_Torneo)
    REFERENCES Torneo(Id_Torneo);

ALTER TABLE Torneo_Organizador
    ADD CONSTRAINT FK_TorneoOrgani_Organizador
    FOREIGN KEY (Id_Persona)
    REFERENCES Organizador(Id_Persona);
