-- Se definen las restricciones de atributo

ALTER TABLE Jugador ADD CONSTRAINT CHK_Jugador_Camiseta 
    CHECK (Num_camiseta BETWEEN 1 AND 99);
    
ALTER TABLE Jugador ADD CONSTRAINT CHK_Jugador_Posicion
    CHECK (Posicion IN ('Portero', 'Defensa', 'Mediocampista', 'Delantero'));
    
ALTER TABLE Jugador ADD CONSTRAINT CHK_Jugador_Peso 
    CHECK (Peso > 0);
    
ALTER TABLE Jugador ADD CONSTRAINT CHK_Jugador_Altura 
    CHECK (Altura > 0);
    
ALTER TABLE Tecnico ADD CONSTRAINT CHK_Tecnico_Rol 
    CHECK (Rol IN ('Principal', 'Asistente', 'Porteros', 'Fisico'));
    
ALTER TABLE Arbitro ADD CONSTRAINT CHK_Arbi_Categoria 
    CHECK (Categoria IN ('Amateur', 'Semi-profesional', 'Profesional'));
    
ALTER TABLE Organizador ADD CONSTRAINT CHK_Orgniza_Rol 
    CHECK (Cargo IN ('Principal', 'Legal', 'Ejecutivo'));
    
ALTER TABLE Representante ADD CONSTRAINT CHK_Repre_Cargo 
    CHECK (cargo IN ('Presidente', 'Manager', 'Apoderado legal'));
    
ALTER TABLE Representante ADD CONSTRAINT CHK_Representante_Correo
    CHECK (REGEXP_LIKE(correo, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'));
    
ALTER TABLE Torneo ADD CONSTRAINT CHK_Torneo_Estado 
    CHECK (estado IN ('Programado', 'En curso', 'Finalizado', 'Cancelado'));
    
ALTER TABLE Torneo ADD CONSTRAINT CHK_Torneo_Fechas 
    CHECK (Fecha_Fin > Fecha_Inicio);
    
ALTER TABLE Fase ADD CONSTRAINT CHK_Nombre_Fase 
    CHECK (nombre_fase IN ('Fase de Grupos', 'Octavos', 'Cuartos', 'Semifinal', 'Final'));
    
ALTER TABLE Fase ADD CONSTRAINT CHK_Fase_Formato 
    CHECK (tipo_formato IN ('Liga', 'Eliminacion directa', 'Ida y vuelta'));
    
ALTER TABLE Estadio ADD CONSTRAINT CHK_Estadio_Cancha 
    CHECK (tipo_cancha IN ('Natural', 'Sintetica', 'Mixta'));

ALTER TABLE Estadio ADD CONSTRAINT CHK_Estadio_Capacidad 
    CHECK (capacidad > 0);
    
ALTER TABLE Estadio ADD CONSTRAINT CHK_Estadio_Ciudad
    CHECK (ciudad IN (
        'Bogota', 'Medellin', 'Cali', 'Barranquilla', 'Bucaramanga',
        'Manizales', 'Pereira', 'Cartagena', 'Cucuta', 'Ibague',
        'Tunja', 'Envigado', 'Monteria'
    ));

ALTER TABLE Patrocinador ADD CONSTRAINT CHK_Patrocinador_Aporte 
    CHECK (tipo_aporte IN ('Economico', 'Equipamiento', 'Servicios medicos', 'Transporte'));
    
ALTER TABLE Inscripcion ADD CONSTRAINT CHK_Inscripcion_Estado 
    CHECK (Estado IN ('Pendiente', 'Aceptada', 'Rechazada'));
    
ALTER TABLE Partido ADD CONSTRAINT CHK_Partido_Estado 
    CHECK (estado IN ('Pendiente', 'En curso', 'Jugado', 'Cancelado', 'Aplazado'));
    
ALTER TABLE Partido ADD CONSTRAINT CHK_Partido_Goles_Local 
    CHECK (goles_local >= 0);
    
ALTER TABLE Partido ADD CONSTRAINT CHK_Partido_Goles_Visitante 
    CHECK (goles_visitante >= 0);
    
ALTER TABLE Partido ADD CONSTRAINT CHK_Partido_Equipos 
    CHECK (Id_EquipoLocal <> Id_EquipoVisitante);
    
ALTER TABLE Estadistica_Equipo ADD CONSTRAINT CHK_EstEquipo_Puntos 
    CHECK (puntos >= 0);
    
ALTER TABLE Estadistica_Equipo ADD CONSTRAINT CHK_EstEqu_Goles_Favor 
    CHECK (goles_favor >= 0);
    
ALTER TABLE Estadistica_Equipo ADD CONSTRAINT CHK_EstEquipo_Goles_Contra 
    CHECK (goles_contra >= 0);
    
ALTER TABLE Partido
    ADD CONSTRAINT CHK_Partido_Marcador
    CHECK (estado IN ('Jugado', 'En curso') OR (goles_local = 0 AND goles_visitante = 0));

ALTER TABLE Estadistica_Equipo 
    ADD CONSTRAINT CHK_EstEq_Puntos_Consist
    CHECK (puntos = (partidos_ganados * 3) + partidos_empatados);