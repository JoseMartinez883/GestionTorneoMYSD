-- Especificaciones de Paquetes CRUDE

-- PK_PERSONA
CREATE OR REPLACE PACKAGE PK_PERSONA AS

    PROCEDURE AD_PERSONA (
        xDNI            IN VARCHAR2,
        xNombres        IN VARCHAR2,
        xApellidos      IN VARCHAR2,
        xFecha_nacimiento IN DATE
    );

    PROCEDURE MOD_PERSONA (
        xId_Persona     IN NUMBER,
        xNombres        IN VARCHAR2,
        xApellidos      IN VARCHAR2,
        xFecha_nacimiento IN DATE
    );

    PROCEDURE ELI_PERSONA (
        xId_Persona     IN NUMBER
    );

    PROCEDURE CO_PERSONA (
        xCursor         OUT SYS_REFCURSOR
    );
END PK_PERSONA;
/


-- PK_EQUIPO
CREATE OR REPLACE PACKAGE PK_EQUIPO AS

    PROCEDURE AD_EQUIPO (
        xNombre_oficial IN VARCHAR2,
        xEscudo_logo    IN VARCHAR2,
        xFecha_fundacion IN DATE
    );

    PROCEDURE MOD_EQUIPO (
        xId_Equipo      IN NUMBER,
        xNombre_oficial IN VARCHAR2,
        xEscudo_logo    IN VARCHAR2,
        xFecha_fundacion IN DATE
    );

    PROCEDURE ELI_EQUIPO (
        xId_Equipo      IN NUMBER
    );

    PROCEDURE AD_JUGADOR (
        xId_Persona     IN NUMBER,
        xId_Equipo      IN NUMBER,
        xPosicion       IN VARCHAR2,
        xNum_camiseta   IN NUMBER,
        xPeso           IN NUMBER,
        xAltura         IN NUMBER,
        xNacionalidad   IN VARCHAR2 
    );

    PROCEDURE MOD_JUGADOR (
        xId_Persona     IN NUMBER,
        xPosicion       IN VARCHAR2,
        xNum_camiseta   IN NUMBER,
        xPeso           IN NUMBER,
        xAltura         IN NUMBER,
        xNacionalidad   IN VARCHAR2 -- añadiddo
    );

    PROCEDURE ELI_JUGADOR (
        xId_Persona     IN NUMBER
    );

    PROCEDURE AD_TECNICO (
        xId_Persona     IN NUMBER,
        xId_Equipo      IN NUMBER,
        xRol            IN VARCHAR2
    );

    PROCEDURE MOD_TECNICO (
        xId_Persona     IN NUMBER,
        xRol            IN VARCHAR2
    );

    PROCEDURE ELI_TECNICO (
        xId_Persona     IN NUMBER
    );

    PROCEDURE AD_REPRESENTANTE (
        xId_Persona     IN NUMBER,
        xId_Equipo      IN NUMBER,
        xTelefono       IN VARCHAR2,
        xCorreo         IN VARCHAR2,
        xCargo          IN VARCHAR2
    );

    PROCEDURE MOD_REPRESENTANTE (
        xId_Persona     IN NUMBER,
        xTelefono       IN VARCHAR2,
        xCorreo         IN VARCHAR2,
        xCargo          IN VARCHAR2
    );

    PROCEDURE ELI_REPRESENTANTE (
        xId_Persona     IN NUMBER
    );

    PROCEDURE CO_EQUIPO (
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_JUGADOR (
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_TECNICO (
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_REPRESENTANTE (
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_JUGADOR_EQUIPO (
        xId_Equipo      IN NUMBER,
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_EQUIPO_NOMBRE (
        xNombre         IN VARCHAR2,
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_REPRESENTANTE_EQUIPO (
        xId_Equipo      IN NUMBER,
        xCursor         OUT SYS_REFCURSOR
    );

END PK_EQUIPO;
/

-- PK_TORNEO
CREATE OR REPLACE PACKAGE PK_TORNEO AS

    PROCEDURE AD_TORNEO (
        xNombre         IN VARCHAR2,
        xTemporada      IN VARCHAR2,
        xFecha_Inicio   IN DATE,
        xFecha_Fin      IN DATE
    );

    PROCEDURE MOD_TORNEO (
        xId_Torneo      IN NUMBER,
        xNombre         IN VARCHAR2,
        xTemporada      IN VARCHAR2,
        xFecha_Inicio   IN DATE,
        xFecha_Fin      IN DATE,
        xEstado         IN VARCHAR2,
        xId_Organizador IN NUMBER
    );

    PROCEDURE ELI_TORNEO (
        xId_Torneo      IN NUMBER,
        xId_Organizador IN NUMBER
    );

    PROCEDURE AD_FASE (
        xId_Torneo      IN NUMBER,
        xNombre_fase    IN VARCHAR2,
        xTipo_formato   IN VARCHAR2
    );

    PROCEDURE MOD_FASE (
        xId_Torneo      IN NUMBER,
        xNombre_fase    IN VARCHAR2,
        xTipo_formato   IN VARCHAR2
    );

    PROCEDURE ELI_FASE (
        xId_Torneo      IN NUMBER,
        xNombre_fase    IN VARCHAR2
    );

    PROCEDURE AD_ORGANIZADOR (
        xId_Persona     IN NUMBER,
        xCargo          IN VARCHAR2
    );

    PROCEDURE MOD_ORGANIZADOR (
        xId_Persona     IN NUMBER,
        xCargo          IN VARCHAR2
    );

    PROCEDURE ELI_ORGANIZADOR (
        xId_Persona     IN NUMBER
    );
    
    PROCEDURE AD_TORNEO_ORGANIZADOR (
        xId_Torneo      IN NUMBER,
        xId_Persona     IN NUMBER
    );

    PROCEDURE ELI_TORNEO_ORGANIZADOR (
        xId_Torneo      IN NUMBER,
        xId_Persona     IN NUMBER
    );
    
    PROCEDURE CO_TORNEO (
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_ORGANIZADOR (
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_FASE (
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_TORNEO_ESTADO (
        xEstado         IN VARCHAR2,
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_FASE_TORNEO (
        xId_Torneo      IN NUMBER,
        xCursor         OUT SYS_REFCURSOR
    );

END PK_TORNEO;
/

-- PK_INSCRIPCION
CREATE OR REPLACE PACKAGE PK_INSCRIPCION AS

    PROCEDURE AD_INSCRIPCION (
        xId_Equipo      IN NUMBER,
        xId_Torneo      IN NUMBER,
        xId_Representante IN NUMBER
    );

    PROCEDURE MOD_INSCRIPCION_ESTADO (
        xId_Inscripcion IN NUMBER,
        xEstado         IN VARCHAR2
    );

    PROCEDURE ELI_INSCRIPCION (
        xId_Inscripcion IN NUMBER
    );

    PROCEDURE CO_INSCRIPCION (
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_INSCRIPCION_TORNEO (
        xId_Torneo      IN NUMBER,
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_EQUIPOS_INSCRITOS (
        xId_Torneo      IN NUMBER,
        xCursor         OUT SYS_REFCURSOR
    );

END PK_INSCRIPCION;
/

-- PK_PARTIDO
CREATE OR REPLACE PACKAGE PK_PARTIDO AS

    PROCEDURE AD_PARTIDO (
        xId_Torneo      IN NUMBER,
        xNombre_fase    IN VARCHAR2,
        xId_Estadio     IN NUMBER,
        xId_EquipoLocal IN NUMBER,
        xId_EquipoVisitante IN NUMBER,
        xFecha_hora     IN DATE
    );

    PROCEDURE MOD_PARTIDO (
        xId_Partido     IN NUMBER,
        xFecha_hora     IN DATE,
        xEstado         IN VARCHAR2,
        xGoles_local    IN NUMBER,
        xGoles_visitante IN NUMBER
    );

    PROCEDURE ELI_PARTIDO (
        xId_Partido     IN NUMBER
    );

    PROCEDURE AD_ARBITRO (
        xId_Persona     IN NUMBER,
        xCategoria      IN VARCHAR2
    );

    PROCEDURE ELI_ARBITRO (
        xId_Persona     IN NUMBER
    );

    PROCEDURE MOD_ARBITRO (
        xId_Persona     IN NUMBER,
        xCategoria      IN VARCHAR2
    );
    
    PROCEDURE AD_ARBITRO_PARTIDO (
        xId_Persona     IN NUMBER,
        xId_Partido     IN NUMBER
    );

    PROCEDURE CO_PARTIDO (
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_ARBITRO (
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_PARTIDO_FASE (
        xId_Torneo      IN NUMBER,
        xNombre_fase    IN VARCHAR2,
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_ARBITRO_PARTIDOS (
        xId_Persona     IN NUMBER,
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_ESTADO_PARTIDOS (
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_PARTIDOS_EQUIPO (
        xId_Equipo      IN NUMBER,
        xCursor         OUT SYS_REFCURSOR
    );

END PK_PARTIDO;
/

-- PK_ESTADISTICA_EQUIPO
CREATE OR REPLACE PACKAGE PK_ESTADISTICA_EQUIPO AS

    PROCEDURE MOD_ESTADISTICA_EQUIPO (
        xId_Estadistica IN NUMBER,
        xPuntos         IN NUMBER,
        xGF             IN NUMBER,
        xGC             IN NUMBER,
        xPG             IN NUMBER,
        xPP             IN NUMBER,
        xPE             IN NUMBER
    );

    PROCEDURE CO_ESTADISTICA_EQUIPO (
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_TABLA_POSICIONES (
        xId_Torneo      IN NUMBER,
        xCursor         OUT SYS_REFCURSOR
    );

END PK_ESTADISTICA_EQUIPO;
/

-- PK_ESTADIO
CREATE OR REPLACE PACKAGE PK_ESTADIO AS

    PROCEDURE AD_ESTADIO (
        xNombre         IN VARCHAR2,
        xCiudad         IN VARCHAR2,
        xDireccion      IN VARCHAR2,
        xCapacidad      IN NUMBER,
        xTipo_cancha    IN VARCHAR2
    );

    PROCEDURE MOD_ESTADIO (
        xId_Estadio     IN NUMBER,
        xNombre         IN VARCHAR2,
        xDireccion      IN VARCHAR2,
        xCapacidad      IN NUMBER,
        xTipo_cancha    IN VARCHAR2 -- Añadido
    );

    PROCEDURE ELI_ESTADIO (
        xId_Estadio     IN NUMBER
    );

    PROCEDURE CO_ESTADIO (
        xCursor         OUT SYS_REFCURSOR
    );

    PROCEDURE CO_ESTADIO_PARTIDOS (
        xCursor         OUT SYS_REFCURSOR
    );

END PK_ESTADIO;
/

-- PK_PATROCINADOR
CREATE OR REPLACE PACKAGE PK_PATROCINADOR AS

    PROCEDURE AD_PATROCINADOR (
        xNombre_empresa IN VARCHAR2,
        xNIT            IN VARCHAR2,
        xTipo_aporte    IN VARCHAR2
    );

    PROCEDURE MOD_PATROCINADOR (
        xId_Patrocinador IN NUMBER,
        xNombre_empresa IN VARCHAR2,
        xTipo_aporte    IN VARCHAR2
    );

    PROCEDURE ELI_PATROCINADOR (
        xId_Patrocinador IN NUMBER
    );

    PROCEDURE AD_TORNEO_PATROCINADOR (
        xId_Torneo      IN NUMBER,
        xId_Patrocinador IN NUMBER
    );

    PROCEDURE AD_EQUIPO_PATROCINADOR (
        xId_Equipo      IN NUMBER,
        xId_Patrocinador IN NUMBER
    );

    PROCEDURE ELI_TORNEO_PATROCINADOR (
        xId_Torneo      IN NUMBER,
        xId_Patrocinador IN NUMBER
    );

    PROCEDURE ELI_EQUIPO_PATROCINADOR (
        xId_Equipo      IN NUMBER,
        xId_Patrocinador IN NUMBER
    );
    
    PROCEDURE CO_PATROCINADOR (
        xCursor         OUT SYS_REFCURSOR
    );

END PK_PATROCINADOR;
/
