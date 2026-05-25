-- Se definen las claves primarias de las tablas del sistema.

ALTER TABLE Persona
    ADD CONSTRAINT PK_Persona 
    PRIMARY KEY (Id_Persona);

ALTER TABLE Jugador
    ADD CONSTRAINT PK_Jugador 
    PRIMARY KEY (Id_Persona);

ALTER TABLE Tecnico
    ADD CONSTRAINT PK_Tecnico 
    PRIMARY KEY (Id_Persona);

ALTER TABLE Arbitro
    ADD CONSTRAINT PK_Arbitro 
    PRIMARY KEY (Id_Persona);

ALTER TABLE Organizador
    ADD CONSTRAINT PK_Organizador 
    PRIMARY KEY (Id_Persona);

ALTER TABLE Representante
    ADD CONSTRAINT PK_Representante 
    PRIMARY KEY (Id_Persona);

ALTER TABLE Torneo
    ADD CONSTRAINT PK_Torneo 
    PRIMARY KEY (Id_Torneo);

ALTER TABLE Fase
    ADD CONSTRAINT PK_Fase 
    PRIMARY KEY (Id_Torneo, nombre_fase);

ALTER TABLE Equipo
    ADD CONSTRAINT PK_Equipo 
    PRIMARY KEY (Id_Equipo);

ALTER TABLE Estadio
    ADD CONSTRAINT PK_Estadio 
    PRIMARY KEY (Id_Estadio);

ALTER TABLE Patrocinador
    ADD CONSTRAINT PK_Patrocinador 
    PRIMARY KEY (Id_Patrocinador);

ALTER TABLE Inscripcion
    ADD CONSTRAINT PK_Inscripcion 
    PRIMARY KEY (Id_Inscripcion);

ALTER TABLE Partido
    ADD CONSTRAINT PK_Partido 
    PRIMARY KEY (Id_Partido);

ALTER TABLE Estadistica_Equipo
    ADD CONSTRAINT PK_Estadistica_Equipo 
    PRIMARY KEY (Id_Estadistica);

ALTER TABLE Torneo_Patrocinador
    ADD CONSTRAINT PK_Torneo_Patrocinador 
    PRIMARY KEY (Id_Torneo, Id_Patrocinador);
    
ALTER TABLE Arbitro_Partido
    ADD CONSTRAINT PK_Arbitro_Partido
    PRIMARY KEY (Id_Persona, Id_Partido);

ALTER TABLE Torneo_Organizador
    ADD CONSTRAINT PK_Torneo_Organizador
    PRIMARY KEY (Id_Torneo, Id_Persona);

ALTER TABLE Equipo_Patrocinador
    ADD CONSTRAINT PK_Equipo_Patrocinador
    PRIMARY KEY (Id_Equipo, Id_Patrocinador);
