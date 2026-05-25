-- Llaves primarias Ciclo 2

ALTER TABLE Nomina ADD CONSTRAINT PK_Nomina PRIMARY KEY (Id_Nomina);
ALTER TABLE Incidencia ADD CONSTRAINT PK_Incidencia PRIMARY KEY (Id_Incidencia);
ALTER TABLE Resolucion ADD CONSTRAINT PK_Resolucion PRIMARY KEY (Id_Resolucion);
ALTER TABLE Estadistica_Jugador ADD CONSTRAINT PK_Estadistica PRIMARY KEY (Id_Estadistica);
ALTER TABLE Tarifa ADD CONSTRAINT PK_Tarifa PRIMARY KEY (Id_Tarifa);
ALTER TABLE Factura ADD CONSTRAINT PK_Factura PRIMARY KEY (Id_Factura);
ALTER TABLE Pago ADD CONSTRAINT PK_Pago PRIMARY KEY (Id_Pago);
