-- Llaves foraneas Ciclo 2

-- Nomina
ALTER TABLE Nomina ADD CONSTRAINT FK_Nomina_Partido    
    FOREIGN KEY (Id_Partido) REFERENCES Partido(Id_Partido);

ALTER TABLE Nomina ADD CONSTRAINT FK_Nomina_Jugador 
    FOREIGN KEY (Id_Jugador) REFERENCES Jugador(Id_Persona);

-- Incidencia
ALTER TABLE Incidencia ADD CONSTRAINT FK_Incidencia_Partido 
    FOREIGN KEY (Id_Partido) REFERENCES Partido(Id_Partido);

ALTER TABLE Incidencia ADD CONSTRAINT FK_Incidencia_Arbitro 
    FOREIGN KEY (Id_Arbitro) REFERENCES Arbitro(Id_Persona);

ALTER TABLE Incidencia ADD CONSTRAINT FK_Incidencia_Jugador 
    FOREIGN KEY (Id_Jugador) REFERENCES Jugador(Id_Persona);

-- Resolucion
ALTER TABLE Resolucion ADD CONSTRAINT FK_Resolucion_Incidencia 
    FOREIGN KEY (Id_Incidencia) REFERENCES Incidencia(Id_Incidencia);

-- Estadistica_Jugador
ALTER TABLE Estadistica_Jugador ADD CONSTRAINT FK_Estadistica_Jugador 
    FOREIGN KEY (Id_Jugador) REFERENCES Jugador(Id_Persona);

ALTER TABLE Estadistica_Jugador ADD CONSTRAINT FK_Estadistica_Torneo
    FOREIGN KEY (Id_Torneo) REFERENCES Torneo(Id_Torneo);

-- Factura
ALTER TABLE Factura ADD CONSTRAINT FK_Factura_Inscripcion 
    FOREIGN KEY (Id_Inscripcion) REFERENCES Inscripcion(Id_Inscripcion);

ALTER TABLE Factura ADD CONSTRAINT FK_Factura_Resolucion 
    FOREIGN KEY (Id_Resolucion) REFERENCES Resolucion(Id_Resolucion);

ALTER TABLE Factura ADD CONSTRAINT FK_Factura_Tarifa 
    FOREIGN KEY (Id_Tarifa) REFERENCES Tarifa(Id_Tarifa);

-- Pago
ALTER TABLE Pago ADD CONSTRAINT FK_Pago_Factura 
    FOREIGN KEY (Id_Factura) REFERENCES Factura(Id_Factura);

ALTER TABLE Pago ADD CONSTRAINT FK_Pago_Representante 
    FOREIGN KEY (Id_Representante) REFERENCES Representante(Id_Persona);
