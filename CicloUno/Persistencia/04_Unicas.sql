-- Se definen las restricciones de clave unica para asegurar la no duplicidad de datos

ALTER TABLE Persona
    ADD CONSTRAINT UK_Persona_DNI
    UNIQUE (DNI);

ALTER TABLE Representante
    ADD CONSTRAINT UK_Representante_Correo
    UNIQUE (correo);

ALTER TABLE Equipo
    ADD CONSTRAINT UK_Equipo_Nombre
    UNIQUE (nombre_oficial);

ALTER TABLE Estadio
    ADD CONSTRAINT UK_Estadio_Nombre
    UNIQUE (nombre);

ALTER TABLE Patrocinador
    ADD CONSTRAINT UK_Patrocinador_Empresa
    UNIQUE (nombre_empresa);

ALTER TABLE Patrocinador
    ADD CONSTRAINT UK_Patrocinador_NIT
    UNIQUE (NIT);
    
ALTER TABLE Inscripcion 
    ADD CONSTRAINT UK_Inscripcion_Equipo_Torneo 
    UNIQUE (Id_Equipo, Id_Torneo);
    
ALTER TABLE Estadistica_Equipo 
    ADD CONSTRAINT UK_EstEquipo_Torneo 
    UNIQUE (Id_Equipo, Id_Torneo);
    
ALTER TABLE Torneo ADD CONSTRAINT UK_Nombre_Temporada 
    UNIQUE (Nombre, Temporada);
    
ALTER TABLE Jugador 
    ADD CONSTRAINT UK_Equipo_Camiseta 
    UNIQUE (Id_Equipo, Num_camiseta);
