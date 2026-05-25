-- Creacion de tablas Ciclo 2

CREATE TABLE Nomina (
    Id_Nomina NUMBER NOT NULL,
    Id_Partido NUMBER NOT NULL,
    Id_Jugador NUMBER NOT NULL,
    Titular VARCHAR2(2) NOT NULL
);

CREATE TABLE Incidencia (
    Id_Incidencia NUMBER NOT NULL,
    Id_Partido NUMBER NOT NULL,
    Id_Arbitro NUMBER NOT NULL,
    Id_Jugador NUMBER NOT NULL,
    Minuto NUMBER NOT NULL,
    Tipo VARCHAR2(20) NOT NULL
);

CREATE TABLE Resolucion (
    Id_Resolucion NUMBER NOT NULL,
    Id_Incidencia NUMBER NOT NULL,
    Fechas_Suspension NUMBER NOT NULL,
    Multa_Monto NUMBER NOT NULL,
    Descripcion VARCHAR2(200) NOT NULL
);

CREATE TABLE Estadistica_Jugador (
    Id_Estadistica NUMBER NOT NULL,
    Id_Jugador NUMBER NOT NULL,
    Id_Torneo NUMBER NOT NULL,
    Goles NUMBER NOT NULL,
    Asistencias NUMBER NOT NULL,
    Tarjetas_Amarillas NUMBER NOT NULL,
    Tarjetas_Rojas NUMBER NOT NULL,
    Partidos_Jugados NUMBER NOT NULL
);

CREATE TABLE Tarifa (
    Id_Tarifa NUMBER NOT NULL,
    Concepto VARCHAR2(50) NOT NULL,
    Valor NUMBER NOT NULL
);

CREATE TABLE Factura (
    Id_Factura NUMBER NOT NULL,
    Id_Inscripcion NUMBER,
    Id_Resolucion NUMBER,
    Id_Tarifa NUMBER NOT NULL,
    Fecha_Emision DATE NOT NULL,
    Total NUMBER NOT NULL,
    Estado VARCHAR2(20) NOT NULL
);

CREATE TABLE Pago (
    Id_Pago NUMBER NOT NULL,
    Id_Factura NUMBER NOT NULL,
    Id_Representante NUMBER NOT NULL,
    Monto NUMBER NOT NULL,
    Fecha_Pago DATE NOT NULL
);