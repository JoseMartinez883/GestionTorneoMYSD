-- Llaves unicas Ciclo 2

-- Un jugador solo puede estar una vez en la nomina de un partido
ALTER TABLE Nomina ADD CONSTRAINT UK_Nomina_JugadorPartido 
    UNIQUE (Id_Partido, Id_Jugador);

-- Solo debe haber un registro estadistico por jugador por torneo
ALTER TABLE Estadistica_Jugador ADD CONSTRAINT UK_Estadistica_JugadorTorneo 
    UNIQUE (Id_Jugador, Id_Torneo);

-- Una incidencia grave solo debe generar un (1) dictamen o resolucion final
ALTER TABLE Resolucion ADD CONSTRAINT UK_Resolucion_Incidencia 
    UNIQUE (Id_Incidencia);

-- No pueden existir dos tarifas en el catalogo con el mismo concepto para evitar cobros confusos
ALTER TABLE Tarifa ADD CONSTRAINT UK_Tarifa_Concepto 
    UNIQUE (Concepto);

-- FACTURACION: Prevencion de Doble Cobro
-- No se le puede generar mas de una factura a la misma inscripcion
ALTER TABLE Factura ADD CONSTRAINT UK_Factura_Inscripcion 
    UNIQUE (Id_Inscripcion);

-- No se le puede generar mas de una factura a la misma resolucion (multa)
ALTER TABLE Factura ADD CONSTRAINT UK_Factura_Resolucion 
    UNIQUE (Id_Resolucion);
