-- CRUDI - Cuerpo de Paquetes 

-- PK_PERSONA
CREATE OR REPLACE PACKAGE BODY PK_PERSONA AS

    PROCEDURE AD_PERSONA (
        xDNI IN VARCHAR2, xNombres IN VARCHAR2,
        xApellidos IN VARCHAR2, xFecha_nacimiento IN DATE
    ) IS
    BEGIN
        INSERT INTO Persona (Id_Persona, DNI, Nombres, Apellidos, Fecha_nacimiento)
        VALUES (NULL, xDNI, xNombres, xApellidos, xFecha_nacimiento);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Error al insertar en PERSONA');
    END;

    PROCEDURE MOD_PERSONA (
        xId_Persona IN NUMBER, xNombres IN VARCHAR2,
        xApellidos IN VARCHAR2, xFecha_nacimiento IN DATE
    ) IS
    BEGIN
        UPDATE Persona SET Nombres = xNombres, Apellidos = xApellidos,
            Fecha_nacimiento = xFecha_nacimiento
        WHERE Id_Persona = xId_Persona;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20002, 'Error al modificar en PERSONA');
    END;

    PROCEDURE ELI_PERSONA (xId_Persona IN NUMBER) IS
    BEGIN
        DELETE FROM Persona WHERE Id_Persona = xId_Persona;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20003, 'Error al eliminar en PERSONA');
    END;

    PROCEDURE CO_PERSONA (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR SELECT * FROM Persona ORDER BY Apellidos;
    END;

END PK_PERSONA;
/

-- PK_EQUIPO
CREATE OR REPLACE PACKAGE BODY PK_EQUIPO AS

    PROCEDURE AD_EQUIPO (
        xNombre_oficial IN VARCHAR2,
        xEscudo_logo IN VARCHAR2, xFecha_fundacion IN DATE
    ) IS
    BEGIN
        INSERT INTO Equipo (Id_Equipo, nombre_oficial, escudo_logo, fecha_fundacion)
        VALUES (NULL, xNombre_oficial, xEscudo_logo, xFecha_fundacion);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20004, 'Error al insertar en EQUIPO');
    END;

    PROCEDURE MOD_EQUIPO (
        xId_Equipo IN NUMBER, xNombre_oficial IN VARCHAR2,
        xEscudo_logo IN VARCHAR2, xFecha_fundacion IN DATE
    ) IS
    BEGIN
        UPDATE Equipo SET nombre_oficial = xNombre_oficial, escudo_logo = xEscudo_logo,
            fecha_fundacion = xFecha_fundacion
        WHERE Id_Equipo = xId_Equipo;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20005, 'Error al modificar en EQUIPO');
    END;

    PROCEDURE ELI_EQUIPO (xId_Equipo IN NUMBER) IS
    BEGIN
        DELETE FROM Equipo WHERE Id_Equipo = xId_Equipo;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20006, 'Error al eliminar en EQUIPO');
    END;

    PROCEDURE AD_JUGADOR (
        xId_Persona IN NUMBER, xId_Equipo IN NUMBER, xPosicion IN VARCHAR2,
        xNum_camiseta IN NUMBER, xPeso IN NUMBER, xAltura IN NUMBER, xNacionalidad IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Jugador (Id_Persona, Id_Equipo, Posicion, Num_camiseta, Peso, Altura, Nacionalidad)
        VALUES (xId_Persona, xId_Equipo, xPosicion, xNum_camiseta, xPeso, xAltura, xNacionalidad);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20007, 'Error al insertar en JUGADOR');
    END;

    PROCEDURE MOD_JUGADOR (
        xId_Persona IN NUMBER, xPosicion IN VARCHAR2,
        xNum_camiseta IN NUMBER, xPeso IN NUMBER, xAltura IN NUMBER,
        xNacionalidad IN VARCHAR2 -- Añadido
    ) IS
    BEGIN
        UPDATE Jugador SET Posicion = xPosicion, Num_camiseta = xNum_camiseta,
            Peso = xPeso, Altura = xAltura, Nacionalidad = xNacionalidad -- Añadido
        WHERE Id_Persona = xId_Persona;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20008, 'Error al modificar en JUGADOR');
    END;

    PROCEDURE ELI_JUGADOR (xId_Persona IN NUMBER) IS
    BEGIN
        DELETE FROM Jugador WHERE Id_Persona = xId_Persona;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20009, 'Error al eliminar en JUGADOR');
    END;

    PROCEDURE AD_TECNICO (xId_Persona IN NUMBER, xId_Equipo IN NUMBER, xRol IN VARCHAR2) IS
    BEGIN
        INSERT INTO Tecnico (Id_Persona, Id_Equipo, Rol)
        VALUES (xId_Persona, xId_Equipo, xRol);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20010, 'Error al insertar en TECNICO');
    END;

    PROCEDURE MOD_TECNICO (xId_Persona IN NUMBER, xRol IN VARCHAR2) IS
    BEGIN
        UPDATE Tecnico SET Rol = xRol WHERE Id_Persona = xId_Persona;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'Error al modificar en TECNICO');
    END;

    PROCEDURE ELI_TECNICO (xId_Persona IN NUMBER) IS
    BEGIN
        DELETE FROM Tecnico WHERE Id_Persona = xId_Persona;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20012, 'Error al eliminar en TECNICO');
    END;

    PROCEDURE AD_REPRESENTANTE (
        xId_Persona IN NUMBER, xId_Equipo IN NUMBER, xTelefono IN VARCHAR2,
        xCorreo IN VARCHAR2, xCargo IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Representante (Id_Persona, Id_Equipo, telefono, correo, cargo)
        VALUES (xId_Persona, xId_Equipo, xTelefono, xCorreo, xCargo);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20013, 'Error al insertar en REPRESENTANTE');
    END;

    PROCEDURE MOD_REPRESENTANTE (
        xId_Persona IN NUMBER, xTelefono IN VARCHAR2, xCorreo IN VARCHAR2, xCargo IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Representante SET telefono = xTelefono, correo = xCorreo, cargo = xCargo
        WHERE Id_Persona = xId_Persona;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20014, 'Error al modificar en REPRESENTANTE');
    END;

    PROCEDURE ELI_REPRESENTANTE (xId_Persona IN NUMBER) IS
    BEGIN
        DELETE FROM Representante WHERE Id_Persona = xId_Persona;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20015, 'Error al eliminar en REPRESENTANTE');
    END;

    PROCEDURE CO_EQUIPO (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR SELECT * FROM Equipo ORDER BY nombre_oficial;
    END;

    PROCEDURE CO_JUGADOR (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT j.*, p.Nombres, p.Apellidos
            FROM Jugador j JOIN Persona p ON j.Id_Persona = p.Id_Persona
            ORDER BY p.Apellidos;
    END;

    PROCEDURE CO_TECNICO (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT t.*, p.Nombres, p.Apellidos
            FROM Tecnico t JOIN Persona p ON t.Id_Persona = p.Id_Persona
            ORDER BY p.Apellidos;
    END;

    PROCEDURE CO_REPRESENTANTE (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT r.*, p.Nombres, p.Apellidos
            FROM Representante r JOIN Persona p ON r.Id_Persona = p.Id_Persona
            ORDER BY p.Apellidos;
    END;

    PROCEDURE CO_JUGADOR_EQUIPO (xId_Equipo IN NUMBER, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT p.Nombres || ' ' || p.Apellidos AS jugador,
                   j.Num_camiseta, j.Posicion, j.Altura, j.Nacionalidad,
                   e.nombre_oficial AS equipo
            FROM Jugador j
            JOIN Persona p ON j.Id_Persona = p.Id_Persona
            JOIN Equipo e ON j.Id_Equipo = e.Id_Equipo
            WHERE j.Id_Equipo = xId_Equipo
            ORDER BY j.Num_camiseta;
    END;

    PROCEDURE CO_EQUIPO_NOMBRE (xNombre IN VARCHAR2, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT nombre_oficial, escudo_logo, fecha_fundacion
            FROM Equipo
            WHERE UPPER(nombre_oficial) LIKE '%' || UPPER(xNombre) || '%'
            ORDER BY nombre_oficial;
    END;

    PROCEDURE CO_REPRESENTANTE_EQUIPO (xId_Equipo IN NUMBER, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT p.Nombres, p.Apellidos, p.DNI, r.Telefono, r.Correo, r.Cargo
            FROM Representante r
            JOIN Persona p ON r.Id_Persona = p.Id_Persona
            WHERE r.Id_Equipo = xId_Equipo
            ORDER BY p.Apellidos, p.Nombres;
    END;

END PK_EQUIPO;
/

-- PK_TORNEO
CREATE OR REPLACE PACKAGE BODY PK_TORNEO AS

    PROCEDURE AD_TORNEO (
        xNombre IN VARCHAR2, xTemporada IN VARCHAR2,
        xFecha_Inicio IN DATE, xFecha_Fin IN DATE
    ) IS
    BEGIN
        INSERT INTO Torneo (Id_Torneo, nombre, temporada, Fecha_Inicio, Fecha_Fin, estado)
        VALUES (NULL, xNombre, xTemporada, xFecha_Inicio, xFecha_Fin, 'Programado');
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20016, 'Error al insertar en TORNEO');
    END;

    PROCEDURE MOD_TORNEO (
        xId_Torneo IN NUMBER, xNombre IN VARCHAR2, xTemporada IN VARCHAR2,
        xFecha_Inicio IN DATE, xFecha_Fin IN DATE, xEstado IN VARCHAR2, xId_Organizador IN NUMBER
    ) IS
    BEGIN
        UPDATE Torneo SET nombre = xNombre, temporada = xTemporada,
            Fecha_Inicio = xFecha_Inicio, Fecha_Fin = xFecha_Fin, estado = xEstado
        WHERE Id_Torneo = xId_Torneo;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20017, 'Error al modificar en TORNEO');
    END;

    PROCEDURE ELI_TORNEO (xId_Torneo IN NUMBER, xId_Organizador IN NUMBER) IS
    BEGIN
        DELETE FROM Torneo WHERE Id_Torneo = xId_Torneo;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20018, 'Error al eliminar en TORNEO');
    END;

    PROCEDURE AD_FASE (
        xId_Torneo IN NUMBER,
        xNombre_fase IN VARCHAR2, xTipo_formato IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Fase (Id_Torneo, nombre_fase, tipo_formato)
        VALUES (xId_Torneo, xNombre_fase, xTipo_formato);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20019, 'Error al insertar en FASE');
    END;

    PROCEDURE MOD_FASE (xId_Torneo IN NUMBER, xNombre_fase IN VARCHAR2, xTipo_formato IN VARCHAR2) IS
    BEGIN
        UPDATE Fase SET tipo_formato = xTipo_formato
        WHERE Id_Torneo = xId_Torneo AND nombre_fase = xNombre_fase;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20020, 'Error al modificar en FASE');
    END;

    PROCEDURE ELI_FASE (xId_Torneo IN NUMBER, xNombre_fase IN VARCHAR2) IS
    BEGIN
        DELETE FROM Fase WHERE Id_Torneo = xId_Torneo AND nombre_fase = xNombre_fase;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20021, 'Error al eliminar en FASE');
    END;

    PROCEDURE AD_ORGANIZADOR (xId_Persona IN NUMBER, xCargo IN VARCHAR2) IS
    BEGIN
        INSERT INTO Organizador (Id_Persona, Cargo)
        VALUES (xId_Persona, xCargo);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20022, 'Error al insertar en ORGANIZADOR');
    END;

    PROCEDURE MOD_ORGANIZADOR (xId_Persona IN NUMBER, xCargo IN VARCHAR2) IS
    BEGIN
        UPDATE Organizador SET Cargo = xCargo WHERE Id_Persona = xId_Persona;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20023, 'Error al modificar en ORGANIZADOR');
    END;

    PROCEDURE ELI_ORGANIZADOR (xId_Persona IN NUMBER) IS
    BEGIN
        DELETE FROM Organizador WHERE Id_Persona = xId_Persona;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20024, 'Error al eliminar en ORGANIZADOR');
    END;

    PROCEDURE AD_TORNEO_ORGANIZADOR (
        xId_Torneo      IN NUMBER,
        xId_Persona     IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Torneo_Organizador (Id_Torneo, Id_Persona)
        VALUES (xId_Torneo, xId_Persona);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20025, 'Error al asociar organizador a torneo');
    END;

    PROCEDURE ELI_TORNEO_ORGANIZADOR (
        xId_Torneo      IN NUMBER,
        xId_Persona     IN NUMBER
    ) IS
    BEGIN
        DELETE FROM Torneo_Organizador
        WHERE Id_Torneo = xId_Torneo AND Id_Persona = xId_Persona;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20026, 'Error al remover organizador de torneo');
    END;
    ------------------------------------------------------------------------------------

    PROCEDURE CO_TORNEO (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR SELECT * FROM Torneo ORDER BY Fecha_Inicio DESC;
    END;

    PROCEDURE CO_ORGANIZADOR (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT o.*, p.Nombres, p.Apellidos
            FROM Organizador o JOIN Persona p ON o.Id_Persona = p.Id_Persona;
    END;

    PROCEDURE CO_FASE (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR SELECT * FROM Fase ORDER BY Id_Torneo, nombre_fase;
    END;

    PROCEDURE CO_TORNEO_ESTADO (xEstado IN VARCHAR2, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT Id_Torneo, nombre, temporada, Fecha_Inicio, Fecha_Fin, estado
            FROM Torneo
            WHERE UPPER(estado) = UPPER(xEstado)
            ORDER BY Fecha_Inicio DESC;
    END;

    PROCEDURE CO_FASE_TORNEO (xId_Torneo IN NUMBER, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT t.nombre AS torneo, f.nombre_fase AS fase, f.tipo_formato
            FROM Fase f
            JOIN Torneo t ON f.Id_Torneo = t.Id_Torneo
            WHERE f.Id_Torneo = xId_Torneo
            ORDER BY f.nombre_fase;
    END;

END PK_TORNEO;
/

-- PK_INSCRIPCION
CREATE OR REPLACE PACKAGE BODY PK_INSCRIPCION AS

    PROCEDURE AD_INSCRIPCION (
        xId_Equipo IN NUMBER,
        xId_Torneo IN NUMBER, xId_Representante IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Inscripcion (Id_Inscripcion, Id_Equipo, Id_Torneo, Id_Representante, Fecha_solicitud, Estado)
        VALUES (NULL, xId_Equipo, xId_Torneo, xId_Representante, SYSDATE, 'Pendiente');
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20025, 'Error al insertar en INSCRIPCION');
    END;

    PROCEDURE MOD_INSCRIPCION_ESTADO (xId_Inscripcion IN NUMBER, xEstado IN VARCHAR2) IS
    BEGIN
        UPDATE Inscripcion SET Estado = xEstado WHERE Id_Inscripcion = xId_Inscripcion;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20026, 'Error al modificar en INSCRIPCION ESTADO');
    END;

    PROCEDURE ELI_INSCRIPCION (xId_Inscripcion IN NUMBER) IS
    BEGIN
        DELETE FROM Inscripcion WHERE Id_Inscripcion = xId_Inscripcion;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20027, 'Error al eliminar en INSCRIPCION');
    END;

    PROCEDURE CO_INSCRIPCION (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR SELECT * FROM Inscripcion ORDER BY Fecha_solicitud DESC;
    END;

    PROCEDURE CO_INSCRIPCION_TORNEO (xId_Torneo IN NUMBER, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT t.nombre AS torneo, t.temporada,
                   e.nombre_oficial AS equipo,
                   i.Fecha_solicitud, i.Estado
            FROM Inscripcion i
            JOIN Torneo t ON i.Id_Torneo = t.Id_Torneo
            JOIN Equipo e ON i.Id_Equipo = e.Id_Equipo
            WHERE i.Id_Torneo = xId_Torneo
            ORDER BY i.Fecha_solicitud;
    END;

    PROCEDURE CO_EQUIPOS_INSCRITOS (xId_Torneo IN NUMBER, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT t.nombre AS torneo, t.temporada,
                   e.nombre_oficial AS equipo,
                   i.Fecha_solicitud, i.Estado
            FROM Inscripcion i
            JOIN Torneo t ON i.Id_Torneo = t.Id_Torneo
            JOIN Equipo e ON i.Id_Equipo = e.Id_Equipo
            WHERE i.Id_Torneo = xId_Torneo AND i.Estado = 'Aceptada'
            ORDER BY e.nombre_oficial;
    END;

END PK_INSCRIPCION;
/

-- PK_PARTIDO
CREATE OR REPLACE PACKAGE BODY PK_PARTIDO AS

    PROCEDURE AD_PARTIDO (
        xId_Torneo IN NUMBER, xNombre_fase IN VARCHAR2, xId_Estadio IN NUMBER,
        xId_EquipoLocal IN NUMBER, xId_EquipoVisitante IN NUMBER, xFecha_hora IN DATE
    ) IS
    BEGIN
        INSERT INTO Partido (Id_Partido, Id_Torneo, nombre_fase, Id_Estadio, Id_EquipoLocal, Id_EquipoVisitante, fecha_hora, goles_local, goles_visitante, estado)
        VALUES (NULL, xId_Torneo, xNombre_fase, xId_Estadio, xId_EquipoLocal, xId_EquipoVisitante, xFecha_hora, 0, 0, 'Pendiente');
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20028, 'Error al insertar en PARTIDO');
    END;

    -- Añadido para poder ascender/descender árbitros
    PROCEDURE MOD_PARTIDO (
        xId_Partido IN NUMBER, xFecha_hora IN DATE, xEstado IN VARCHAR2,
        xGoles_local IN NUMBER, xGoles_visitante IN NUMBER
    ) IS
    BEGIN
        UPDATE Partido SET fecha_hora = xFecha_hora, estado = xEstado,
            goles_local = xGoles_local, goles_visitante = xGoles_visitante
        WHERE Id_Partido = xId_Partido;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20029, 'Error al modificar en PARTIDO');
    END;

    PROCEDURE ELI_PARTIDO (xId_Partido IN NUMBER) IS
    BEGIN
        DELETE FROM Partido WHERE Id_Partido = xId_Partido;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20030, 'Error al eliminar en PARTIDO');
    END;

    PROCEDURE AD_ARBITRO (xId_Persona IN NUMBER, xCategoria IN VARCHAR2) IS
    BEGIN
        INSERT INTO Arbitro (Id_Persona, Categoria)
        VALUES (xId_Persona, xCategoria);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20031, 'Error al insertar en ARBITRO');
    END;

    PROCEDURE ELI_ARBITRO (xId_Persona IN NUMBER) IS
    BEGIN
        DELETE FROM Arbitro WHERE Id_Persona = xId_Persona;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20032, 'Error al eliminar en ARBITRO');
    END;

    PROCEDURE MOD_ARBITRO (
        xId_Persona     IN NUMBER,
        xCategoria      IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Arbitro SET Categoria = xCategoria
        WHERE Id_Persona = xId_Persona;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20033, 'Error al modificar en ARBITRO');
    END;

    PROCEDURE AD_ARBITRO_PARTIDO (xId_Persona IN NUMBER, xId_Partido IN NUMBER) IS
    BEGIN
        INSERT INTO Arbitro_Partido (Id_Persona, Id_Partido)
        VALUES (xId_Persona, xId_Partido);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20033, 'Error al insertar en ARBITRO PARTIDO');
    END;

    PROCEDURE CO_PARTIDO (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR SELECT * FROM Partido ORDER BY fecha_hora DESC;
    END;

    PROCEDURE CO_ARBITRO (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT a.*, p.Nombres, p.Apellidos
            FROM Arbitro a JOIN Persona p ON a.Id_Persona = p.Id_Persona;
    END;

    PROCEDURE CO_PARTIDO_FASE (xId_Torneo IN NUMBER, xNombre_fase IN VARCHAR2, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT f.nombre_fase,
                   el.nombre_oficial AS equipo_local,
                   ev.nombre_oficial AS equipo_visitante,
                   p.goles_local, p.goles_visitante, p.estado,
                   p.fecha_hora, es.nombre AS estadio, es.ciudad
            FROM Partido p
            JOIN Fase f ON p.Id_Torneo = f.Id_Torneo AND p.nombre_fase = f.nombre_fase
            JOIN Equipo el ON p.Id_EquipoLocal = el.Id_Equipo
            JOIN Equipo ev ON p.Id_EquipoVisitante = ev.Id_Equipo
            JOIN Estadio es ON p.Id_Estadio = es.Id_Estadio
            WHERE p.Id_Torneo = xId_Torneo AND p.nombre_fase = xNombre_fase
            ORDER BY p.fecha_hora;
    END;

    PROCEDURE CO_ARBITRO_PARTIDOS (xId_Persona IN NUMBER, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT t.nombre AS torneo, t.temporada,
                   f.nombre_fase, p.fecha_hora, es.nombre AS estadio
            FROM Arbitro_Partido ap
            JOIN Partido p ON ap.Id_Partido = p.Id_Partido
            JOIN Fase f ON p.Id_Torneo = f.Id_Torneo AND p.nombre_fase = f.nombre_fase
            JOIN Torneo t ON f.Id_Torneo = t.Id_Torneo
            JOIN Estadio es ON p.Id_Estadio = es.Id_Estadio
            WHERE ap.Id_Persona = xId_Persona
            ORDER BY p.fecha_hora;
    END;

    PROCEDURE CO_ESTADO_PARTIDOS (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT t.nombre AS nombre_torneo, f.nombre_fase AS fase_del_torneo,
                   p.fecha_hora, p.goles_local, p.goles_visitante, p.estado
            FROM Partido p
            JOIN Fase f ON p.Id_Torneo = f.Id_Torneo AND p.nombre_fase = f.nombre_fase
            JOIN Torneo t ON f.Id_Torneo = t.Id_Torneo
            ORDER BY t.nombre, p.fecha_hora;
    END;

    PROCEDURE CO_PARTIDOS_EQUIPO (xId_Equipo IN NUMBER, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT Id_Partido, Fecha_hora, Nombre_fase, Id_EquipoLocal, Id_EquipoVisitante, Goles_local, Goles_visitante, Estado
            FROM Partido
            WHERE Id_EquipoLocal = xId_Equipo OR Id_EquipoVisitante = xId_Equipo
            ORDER BY Fecha_hora DESC;
    END;

END PK_PARTIDO;
/

-- PK_ESTADISTICA_EQUIPO
CREATE OR REPLACE PACKAGE BODY PK_ESTADISTICA_EQUIPO AS

    PROCEDURE MOD_ESTADISTICA_EQUIPO (
        xId_Estadistica IN NUMBER, xPuntos IN NUMBER, xGF IN NUMBER,
        xGC IN NUMBER, xPG IN NUMBER, xPP IN NUMBER, xPE IN NUMBER
    ) IS
    BEGIN
        UPDATE Estadistica_Equipo SET puntos = xPuntos,
            goles_favor = xGF, goles_contra = xGC,
            partidos_ganados = xPG, partidos_perdidos = xPP, partidos_empatados = xPE
        WHERE Id_Estadistica = xId_Estadistica;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20035, 'Error al modificar en ESTADISTICA EQUIPO');
    END;

    PROCEDURE CO_ESTADISTICA_EQUIPO (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR SELECT * FROM Estadistica_Equipo ORDER BY Id_Torneo, puntos DESC;
    END;

    PROCEDURE CO_TABLA_POSICIONES (xId_Torneo IN NUMBER, xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT * FROM V_TABLA_POSICIONES
            WHERE torneo IN (SELECT nombre FROM Torneo WHERE Id_Torneo = xId_Torneo)
            ORDER BY posicion;
    END;

END PK_ESTADISTICA_EQUIPO;
/

-- PK_ESTADIO
CREATE OR REPLACE PACKAGE BODY PK_ESTADIO AS

    PROCEDURE AD_ESTADIO (
        xNombre IN VARCHAR2, xCiudad IN VARCHAR2,
        xDireccion IN VARCHAR2, xCapacidad IN NUMBER, xTipo_cancha IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Estadio (Id_Estadio, nombre, ciudad, direccion, capacidad, tipo_cancha)
        VALUES (NULL, xNombre, xCiudad, xDireccion, xCapacidad, xTipo_cancha);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20036, 'Error al insertar en ESTADIO');
    END;

    PROCEDURE MOD_ESTADIO (
        xId_Estadio IN NUMBER, xNombre IN VARCHAR2, xDireccion IN VARCHAR2, xCapacidad IN NUMBER, xTipo_cancha IN VARCHAR2 -- Añadido
    ) IS
    BEGIN
        UPDATE Estadio SET nombre = xNombre, direccion = xDireccion, capacidad = xCapacidad, tipo_cancha = xTipo_cancha -- Añadido
        WHERE Id_Estadio = xId_Estadio;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20037, 'Error al modificar en ESTADIO');
    END;

    PROCEDURE ELI_ESTADIO (xId_Estadio IN NUMBER) IS
    BEGIN
        DELETE FROM Estadio WHERE Id_Estadio = xId_Estadio;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20038, 'Error al eliminar en ESTADIO');
    END;

    PROCEDURE CO_ESTADIO (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR SELECT * FROM Estadio ORDER BY nombre;
    END;

    PROCEDURE CO_ESTADIO_PARTIDOS (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR
            SELECT es.nombre AS estadio, es.ciudad, p.fecha_hora
            FROM Estadio es
            JOIN Partido p ON es.Id_Estadio = p.Id_Estadio
            ORDER BY es.nombre, p.fecha_hora;
    END;

END PK_ESTADIO;
/

-- PK_PATROCINADOR
CREATE OR REPLACE PACKAGE BODY PK_PATROCINADOR AS

    PROCEDURE AD_PATROCINADOR (
        xNombre_empresa IN VARCHAR2,
        xNIT IN VARCHAR2, xTipo_aporte IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Patrocinador (Id_Patrocinador, nombre_empresa, NIT, tipo_aporte)
        VALUES (NULL, xNombre_empresa, xNIT, xTipo_aporte);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20039, 'Error al insertar en PATROCINADOR');
    END;

    PROCEDURE MOD_PATROCINADOR (
        xId_Patrocinador IN NUMBER, xNombre_empresa IN VARCHAR2, xTipo_aporte IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Patrocinador SET nombre_empresa = xNombre_empresa, tipo_aporte = xTipo_aporte
        WHERE Id_Patrocinador = xId_Patrocinador;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20040, 'Error al modificar en PATROCINADOR');
    END;

    PROCEDURE ELI_PATROCINADOR (xId_Patrocinador IN NUMBER) IS
    BEGIN
        DELETE FROM Patrocinador WHERE Id_Patrocinador = xId_Patrocinador;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20041, 'Error al eliminar en PATROCINADOR');
    END;

    PROCEDURE AD_TORNEO_PATROCINADOR (xId_Torneo IN NUMBER, xId_Patrocinador IN NUMBER) IS
    BEGIN
        INSERT INTO Torneo_Patrocinador (Id_Torneo, Id_Patrocinador)
        VALUES (xId_Torneo, xId_Patrocinador);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20042, 'Error al insertar en TORNEO PATROCINADOR');
    END;

    PROCEDURE AD_EQUIPO_PATROCINADOR (xId_Equipo IN NUMBER, xId_Patrocinador IN NUMBER) IS
    BEGIN
        INSERT INTO Equipo_Patrocinador (Id_Equipo, Id_Patrocinador)
        VALUES (xId_Equipo, xId_Patrocinador);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20043, 'Error al insertar en EQUIPO PATROCINADOR');
    END;

    PROCEDURE ELI_TORNEO_PATROCINADOR (
        xId_Torneo      IN NUMBER,
        xId_Patrocinador IN NUMBER
    ) IS
    BEGIN
        DELETE FROM Torneo_Patrocinador
        WHERE Id_Torneo = xId_Torneo AND Id_Patrocinador = xId_Patrocinador;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20044, 'Error al eliminar en TORNEO PATROCINADOR');
    END;

    PROCEDURE ELI_EQUIPO_PATROCINADOR (
        xId_Equipo      IN NUMBER,
        xId_Patrocinador IN NUMBER
    ) IS
    BEGIN
        DELETE FROM Equipo_Patrocinador
        WHERE Id_Equipo = xId_Equipo AND Id_Patrocinador = xId_Patrocinador;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20045, 'Error al eliminar en EQUIPO PATROCINADOR');
    END;

    PROCEDURE CO_PATROCINADOR (xCursor OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN xCursor FOR SELECT * FROM Patrocinador ORDER BY nombre_empresa;
    END;

END PK_PATROCINADOR;
/

