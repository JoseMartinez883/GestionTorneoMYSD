BEGIN
    FOR cur_rec IN (SELECT object_name, object_type
                    FROM user_objects
                    WHERE object_type IN ('TABLE', 'VIEW', 'PACKAGE', 'PROCEDURE', 'FUNCTION', 'SEQUENCE', 'TRIGGER'))
    LOOP
        BEGIN
            IF cur_rec.object_type = 'TABLE' THEN
                EXECUTE IMMEDIATE 'DROP ' || cur_rec.object_type || ' "' || cur_rec.object_name || '" CASCADE CONSTRAINTS';
            ELSE
                EXECUTE IMMEDIATE 'DROP ' || cur_rec.object_type || ' "' || cur_rec.object_name || '"';
            END IF;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.put_line('Falló al borrar: ' || cur_rec.object_type || ' "' || cur_rec.object_name || '"');
        END;
    END LOOP;
END;
/

-- Se crean las tablas del sistema de gestion de torneos de futbol. 

CREATE TABLE Persona (
    Id_Persona NUMBER NOT NULL,
    DNI VARCHAR2(20) NOT NULL,
    Nombres VARCHAR2(50) NOT NULL,
    Apellidos VARCHAR2(50) NOT NULL,
    Fecha_nacimiento DATE NOT NULL
);

CREATE TABLE Jugador (
    Id_Persona NUMBER NOT NULL,
    Id_Equipo NUMBER NOT NULL,
    Posicion VARCHAR2(30) NOT NULL,
    Num_camiseta NUMBER NOT NULL,
    Peso NUMBER(5,2) NOT NULL,
    Altura NUMBER(4,2) NOT NULL,
    Nacionalidad VARCHAR2(30)
);

CREATE TABLE Tecnico (
    Id_Persona NUMBER NOT NULL,
    Id_Equipo NUMBER NOT NULL,
    Rol VARCHAR2(30) NOT NULL
);

CREATE TABLE Arbitro (
    Id_Persona NUMBER NOT NULL,
    Categoria VARCHAR2(30) NOT NULL
);

CREATE TABLE Organizador (
    Id_Persona NUMBER NOT NULL,
    Cargo VARCHAR2(30) NOT NULL
);

CREATE TABLE Representante (
    Id_Persona NUMBER NOT NULL,
    Id_Equipo NUMBER NOT NULL,
    telefono VARCHAR2(15) NOT NULL,
    correo VARCHAR2(50) NOT NULL,
    cargo VARCHAR2(30) NOT NULL
);

CREATE TABLE Torneo (
    Id_Torneo NUMBER NOT NULL,
    nombre VARCHAR2(50) NOT NULL,
    temporada VARCHAR2(30) NOT NULL,
    Fecha_Inicio DATE NOT NULL,
    Fecha_Fin DATE NOT NULL,
    estado VARCHAR2(20) NOT NULL
);

CREATE TABLE Fase (
    Id_Torneo NUMBER NOT NULL,
    nombre_fase VARCHAR2(30) NOT NULL,
    tipo_formato VARCHAR2(30) NOT NULL
);

CREATE TABLE Equipo (
    Id_Equipo NUMBER NOT NULL,
    nombre_oficial VARCHAR2(50) NOT NULL,
    escudo_logo VARCHAR2(200),
    fecha_fundacion DATE
);

CREATE TABLE Estadio (
    Id_Estadio NUMBER NOT NULL,
    nombre VARCHAR2(50) NOT NULL,
    ciudad VARCHAR2(30) NOT NULL,
    direccion VARCHAR2(100),
    capacidad NUMBER,
    tipo_cancha VARCHAR2(20) NOT NULL
);

CREATE TABLE Patrocinador (
    Id_Patrocinador NUMBER NOT NULL,
    nombre_empresa VARCHAR2(50) NOT NULL,
    NIT VARCHAR2(20) NOT NULL,
    tipo_aporte VARCHAR2(30) NOT NULL
);

CREATE TABLE Inscripcion (
    Id_Inscripcion NUMBER NOT NULL,
    Id_Equipo NUMBER NOT NULL,
    Id_Torneo NUMBER NOT NULL,
    Id_Representante NUMBER NOT NULL,
    Fecha_solicitud DATE NOT NULL,
    Estado VARCHAR2(20) NOT NULL
);

CREATE TABLE Partido (
    Id_Partido NUMBER NOT NULL,
    Id_Torneo NUMBER NOT NULL,
    nombre_fase VARCHAR2(30) NOT NULL,
    Id_Estadio NUMBER NOT NULL,
    Id_EquipoLocal NUMBER NOT NULL,
    Id_EquipoVisitante NUMBER NOT NULL,
    fecha_hora DATE NOT NULL,
    goles_local NUMBER NOT NULL,
    goles_visitante NUMBER NOT NULL,
    estado VARCHAR2(30) NOT NULL
);

CREATE TABLE Estadistica_Equipo (
    Id_Estadistica NUMBER NOT NULL,
    Id_Equipo NUMBER NOT NULL,
    Id_Torneo NUMBER NOT NULL,
    puntos NUMBER NOT NULL,
    goles_favor NUMBER NOT NULL,
    goles_contra NUMBER NOT NULL,
    partidos_ganados NUMBER NOT NULL,
    partidos_perdidos NUMBER NOT NULL,
    partidos_empatados NUMBER NOT NULL
);

CREATE TABLE Torneo_Patrocinador (
    Id_Torneo NUMBER NOT NULL,
    Id_Patrocinador NUMBER NOT NULL
);

CREATE TABLE Arbitro_Partido (
    Id_Persona NUMBER NOT NULL,
    Id_Partido NUMBER NOT NULL
);

CREATE TABLE Equipo_Patrocinador (
    Id_Equipo NUMBER NOT NULL,
    Id_Patrocinador NUMBER NOT NULL
);

CREATE TABLE Torneo_Organizador (
    Id_Torneo NUMBER NOT NULL,
    Id_Persona NUMBER NOT NULL
);