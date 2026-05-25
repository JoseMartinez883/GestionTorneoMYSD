-- CrudNoOk - Pruebas de error esperado para procedimientos CRUD
-- Cada prueba debe generar un error controlado (RAISE_APPLICATION_ERROR o constraint)

SET SERVEROUTPUT ON;

-- ============================================================
-- PK_PERSONA
-- ============================================================

-- Insertar persona valida para usar en pruebas de duplicado
EXECUTE PK_PERSONA.AD_PERSONA('999000001', 'Carlos', 'Prueba', TO_DATE('1995-03-15', 'YYYY-MM-DD'));

-- Error: Insertar persona con Id duplicado
EXECUTE PK_PERSONA.AD_PERSONA('999000099', 'Otro', 'Duplicado', TO_DATE('2000-01-01', 'YYYY-MM-DD'));

-- Error: Insertar persona con DNI duplicado
EXECUTE PK_PERSONA.AD_PERSONA('999000001', 'Otro', 'DNIDup', TO_DATE('2000-01-01', 'YYYY-MM-DD'));

-- Error: Modificar persona que no existe
EXECUTE PK_PERSONA.MOD_PERSONA(99999, 'Fantasma', 'NoExiste', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
SELECT * FROM Persona WHERE Id_Persona = 99999;

-- Error: Eliminar persona que no existe
EXECUTE PK_PERSONA.ELI_PERSONA(99999);

-- Limpieza
DECLARE v_id NUMBER; BEGIN SELECT Id_Persona INTO v_id FROM Persona WHERE DNI = '999000001'; PK_PERSONA.ELI_PERSONA(v_id); END;
/

-- ============================================================
-- PK_EQUIPO
-- ============================================================

-- Insertar equipo valido para pruebas de duplicado
EXECUTE PK_EQUIPO.AD_EQUIPO('Equipo NoOk Test', 'esc.png', TO_DATE('2020-01-01', 'YYYY-MM-DD'));

-- Error: Insertar equipo con Id duplicado
EXECUTE PK_EQUIPO.AD_EQUIPO('Otro Equipo', 'esc2.png', TO_DATE('2021-01-01', 'YYYY-MM-DD'));

-- Error: Insertar jugador con persona inexistente (FK violada)
EXECUTE PK_EQUIPO.AD_JUGADOR(99999, 9901, 'Delantero', 9, 75, 1.80, 'Colombiana');

-- Error: Insertar tecnico con persona inexistente
EXECUTE PK_EQUIPO.AD_TECNICO(99999, 9901, 'Principal');

-- Error: Insertar representante con persona inexistente
EXECUTE PK_EQUIPO.AD_REPRESENTANTE(99999, 9901, '300123', 'test@x.com', 'Gerente');

-- Error: Modificar jugador inexistente (ejecuta pero no modifica)
EXECUTE PK_EQUIPO.MOD_JUGADOR(99999, 'Defensa', 5, 80, 1.85, 'Argentina');

-- Error: Eliminar equipo inexistente
EXECUTE PK_EQUIPO.ELI_EQUIPO(99999);

-- Limpieza
DECLARE v_id NUMBER; BEGIN SELECT Id_Equipo INTO v_id FROM Equipo WHERE nombre_oficial = 'Equipo NoOk Test'; PK_EQUIPO.ELI_EQUIPO(v_id); END;
/

-- ============================================================
-- PK_TORNEO
-- ============================================================

-- Prerequisito
EXECUTE PK_PERSONA.AD_PERSONA('999000005', 'Org', 'TestOrg', TO_DATE('1975-01-01', 'YYYY-MM-DD'));
EXECUTE PK_TORNEO.AD_ORGANIZADOR(99005, 'Director');
EXECUTE PK_TORNEO.AD_TORNEO('Torneo NoOk', 'Test', TO_DATE('2027-01-01', 'YYYY-MM-DD'), TO_DATE('2027-12-31', 'YYYY-MM-DD'));

-- Error: Insertar torneo con Id duplicado
EXECUTE PK_TORNEO.AD_TORNEO('Duplicado', 'Dup', TO_DATE('2028-01-01', 'YYYY-MM-DD'), TO_DATE('2028-12-31', 'YYYY-MM-DD'));

-- Error: Insertar fase con torneo inexistente (99999)
EXECUTE PK_TORNEO.AD_FASE(99999, 'Fase Fantasma', 'Eliminacion');

-- Error: Insertar organizador con persona inexistente
EXECUTE PK_TORNEO.AD_ORGANIZADOR(99999, 'Cargo');

-- Error: Modificar torneo inexistente (ejecuta pero no modifica)
EXECUTE PK_TORNEO.MOD_TORNEO(99999, 'Fantasma', 'X', SYSDATE, SYSDATE, 'Activo', 99005);

-- Error: Eliminar fase inexistente (Llave compuesta inexistente)
EXECUTE PK_TORNEO.ELI_FASE(4000, 'Fase Inexistente');

-- Limpieza
DECLARE v_id_tor NUMBER; v_id_per NUMBER; BEGIN SELECT Id_Torneo INTO v_id_tor FROM Torneo WHERE nombre = 'Torneo NoOk'; SELECT Id_Persona INTO v_id_per FROM Persona WHERE DNI = '999000005'; PK_TORNEO.ELI_TORNEO(v_id_tor, v_id_per); END;
/
EXECUTE PK_TORNEO.ELI_ORGANIZADOR((SELECT Id_Persona FROM Persona WHERE DNI = '999000005'));
EXECUTE PK_PERSONA.ELI_PERSONA((SELECT Id_Persona FROM Persona WHERE DNI = '999000005'));

-- ============================================================
-- PK_INSCRIPCION
-- ============================================================

-- Error: Inscribir con equipo inexistente (FK violada)
EXECUTE PK_INSCRIPCION.AD_INSCRIPCION(2000, 1, 9901);

-- Error: Inscribir con torneo inexistente (FK violada)
EXECUTE PK_INSCRIPCION.AD_INSCRIPCION(99999, 1, 9901);

-- Error: Modificar estado de inscripcion inexistente (no modifica)
EXECUTE PK_INSCRIPCION.MOD_INSCRIPCION_ESTADO(99999, 'Aceptada');

-- Error: Eliminar inscripcion inexistente
EXECUTE PK_INSCRIPCION.ELI_INSCRIPCION(99999);

-- ============================================================
-- PK_PARTIDO
-- ============================================================

-- Error: Insertar partido con torneo/fase inexistente (FK violada)
EXECUTE PK_PARTIDO.AD_PARTIDO(99999, 'Fase Fantasma', 2000, 4000, 4001, SYSDATE);

-- Error: Insertar partido con estadio inexistente
EXECUTE PK_PARTIDO.AD_PARTIDO(4000, 'Fase de Grupos', 99999, 4000, 4001, SYSDATE);

-- Error: Insertar arbitro con persona inexistente
EXECUTE PK_PARTIDO.AD_ARBITRO(99999, 'FIFA');

-- Error: Asignar arbitro inexistente a partido
EXECUTE PK_PARTIDO.AD_ARBITRO_PARTIDO(99999, 1);

-- Error: Modificar partido inexistente (no modifica)
EXECUTE PK_PARTIDO.MOD_PARTIDO(99999, SYSDATE, 'Jugado', 0, 0);

-- Error: Eliminar partido inexistente
EXECUTE PK_PARTIDO.ELI_PARTIDO(99999);

-- ============================================================
-- PK_ESTADIO
-- ============================================================

-- Prerequisito
EXECUTE PK_ESTADIO.AD_ESTADIO('Estadio NoOk', 'Ciudad', 'Dir', 30000, 'Natural');

-- Error: Insertar estadio con Id duplicado
EXECUTE PK_ESTADIO.AD_ESTADIO('Duplicado', 'Otra', 'Dir2', 20000, 'Sintetica');

-- Error: Modificar estadio inexistente (no modifica)
EXECUTE PK_ESTADIO.MOD_ESTADIO(99999, 'Fantasma', 'Dir', 10000, 'Natural');

-- Error: Eliminar estadio inexistente
EXECUTE PK_ESTADIO.ELI_ESTADIO(99999);

-- Limpieza
DECLARE v_id NUMBER; BEGIN SELECT Id_Estadio INTO v_id FROM Estadio WHERE nombre = 'Estadio NoOk'; PK_ESTADIO.ELI_ESTADIO(v_id); END;
/

-- ============================================================
-- PK_PATROCINADOR
-- ============================================================

-- Prerequisito
EXECUTE PK_PATROCINADOR.AD_PATROCINADOR('Empresa NoOk', '900999-1', 'Financiero');

-- Error: Insertar patrocinador con Id duplicado
EXECUTE PK_PATROCINADOR.AD_PATROCINADOR('Otra Empresa', '900999-2', 'Especie');

-- Error: Vincular patrocinador a torneo inexistente
EXECUTE PK_PATROCINADOR.AD_TORNEO_PATROCINADOR(99999, 9901);

-- Error: Vincular patrocinador a equipo inexistente
EXECUTE PK_PATROCINADOR.AD_EQUIPO_PATROCINADOR(99999, 9901);

-- Error: Modificar patrocinador inexistente (no modifica)
EXECUTE PK_PATROCINADOR.MOD_PATROCINADOR(99999, 'Fantasma', 'Especie');

-- Error: Eliminar patrocinador inexistente
EXECUTE PK_PATROCINADOR.ELI_PATROCINADOR(99999);

-- Limpieza
DECLARE v_id NUMBER; BEGIN SELECT Id_Patrocinador INTO v_id FROM Patrocinador WHERE nombre_empresa = 'Empresa NoOk'; PK_PATROCINADOR.ELI_PATROCINADOR(v_id); END;
/
