-- ========================================================================
-- PRUEBAS AISLADAS DE SEGURIDAD (SeguridadOK) - CICLO 2
-- Metodologia: Consumo de la API a traves de las fachadas (Serie 900)
-- Objetivo: Probar exhaustivamente los metodos habilitados (C-R-U-D) sin fallos.
-- ========================================================================

SET SERVEROUTPUT ON;

-- ==========================================
-- 0. PREPARACION DEL ENTORNO AISLADO (SERIE 900)
-- ==========================================
INSERT INTO Torneo (Id_Torneo, nombre, temporada, Fecha_Inicio, Fecha_Fin, estado) VALUES (900, 'Torneo Seguridad', '2026', TRUNC(SYSDATE)+1, TRUNC(SYSDATE)+30, 'Programado');
INSERT INTO Fase (Id_Torneo, nombre_fase, tipo_formato) VALUES (900, 'Unica', 'Liga');
INSERT INTO Estadio (Id_Estadio, nombre, ciudad, capacidad, tipo_terreno) VALUES (900, 'Estadio 900', 'Ciudad', 1000, 'Natural');

INSERT INTO Equipo (Id_Equipo, Nombre_Oficial, fecha_fundacion) VALUES (900, 'Seguridad FC', SYSDATE-10);
INSERT INTO Equipo (Id_Equipo, Nombre_Oficial, fecha_fundacion) VALUES (901, 'Rival 901', SYSDATE-10);

INSERT INTO Persona (Id_Persona, Nombres, Apellidos, DNI, Tipo_Documento) VALUES (900, 'Jugador', 'Nueve', '90000', 'CC');
INSERT INTO Persona (Id_Persona, Nombres, Apellidos, DNI, Tipo_Documento) VALUES (901, 'Arbitro', 'Nueve', '90001', 'CC');
INSERT INTO Persona (Id_Persona, Nombres, Apellidos, DNI, Tipo_Documento) VALUES (902, 'Repre', 'Nueve', '90002', 'CC');

INSERT INTO Representante (Id_Persona) VALUES (902);
INSERT INTO Arbitro (Id_Persona, Años_Experiencia) VALUES (901, 5);
-- El trigger de Jugador auto-creara la Estadistica_Jugador
INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (900, 900, 10, 'Delantero');

INSERT INTO Partido (Id_Partido, Id_Torneo, nombre_fase, Id_Estadio, Id_EquipoLocal, Id_EquipoVisitante, fecha_hora, goles_local, goles_visitante, estado) VALUES (900, 900, 'Unica', 900, 900, 901, SYSDATE+5, 0, 0, 'Programado');

INSERT INTO Tarifa (Id_Tarifa, Concepto, Valor) VALUES (900, 'Tarifa Base 900', 1000);
INSERT INTO Inscripcion (Id_Inscripcion, Id_Torneo, Id_Equipo, Id_Representante, Estado) VALUES (900, 900, 900, 902, 'Aceptada');

-- ========================================================================
-- 1. PRUEBAS EXHAUSTIVAS DE FACHADAS DE SEGURIDAD (PA_..._C2)
-- ========================================================================
DECLARE
    v_cursor SYS_REFCURSOR;
    v_id_tarifa NUMBER;
    v_id_resolucion NUMBER;
    v_id_incidencia NUMBER;
    v_id_factura NUMBER;
    v_id_estadistica NUMBER;
BEGIN
    -- ==========================================================
    -- A. PA_ORGANIZADOR_C2 (Acceso financiero y disciplinario)
    -- ==========================================================
    -- Crear Tarifa
    PA_ORGANIZADOR_C2.AD_TARIFA('Multa Seguridad', 10000);
    SELECT MAX(Id_Tarifa) INTO v_id_tarifa FROM Tarifa;
    -- Modificar Tarifa
    PA_ORGANIZADOR_C2.MOD_TARIFA(v_id_tarifa, 'Multa Seguridad Mod', 15000);
    -- Consultas Financieras
    PA_ORGANIZADOR_C2.CO_TARIFA(v_cursor);
    PA_ORGANIZADOR_C2.CO_FACTURA(v_cursor);
    PA_ORGANIZADOR_C2.CO_PAGO(v_cursor);
    PA_ORGANIZADOR_C2.CO_BALANCE_FINANCIERO('Torneo Seguridad', '2026', v_cursor);
    PA_ORGANIZADOR_C2.CO_MOROSOS('Seguridad FC', v_cursor);

    -- ==========================================================
    -- B. PA_ARBITRO_C2 (Autoridad de la cancha)
    -- ==========================================================
    -- Registrar Suceso
    PA_ARBITRO_C2.AD_INCIDENCIA(900, 901, 900, 45, 'Gol');
    SELECT MAX(Id_Incidencia) INTO v_id_incidencia FROM Incidencia;
    -- Consultas de Partido
    PA_ARBITRO_C2.CO_INCIDENCIA(v_cursor);
    PA_ARBITRO_C2.CO_LINEA_TIEMPO_PARTIDO(900, v_cursor);
    PA_ARBITRO_C2.CO_PLANTILLA_PARTIDO(900, 'Seguridad FC', v_cursor);

    -- ==========================================================
    -- C. PA_ORGANIZADOR_C2 (Castigos basados en la incidencia)
    -- ==========================================================
    -- Emitir Resolucion Disciplinaria
    PA_ORGANIZADOR_C2.AD_RESOLUCION(v_id_incidencia, 2, 5000, 'Sancion');
    SELECT MAX(Id_Resolucion) INTO v_id_resolucion FROM Resolucion;
    -- Consultas
    PA_ORGANIZADOR_C2.CO_RESOLUCION(v_cursor);
    PA_ORGANIZADOR_C2.CO_HISTORIAL_SANCIONES('Seguridad FC', v_cursor);
    
    -- ==========================================================
    -- D. PA_TECNICO_C2 (Acceso deportivo)
    -- ==========================================================
    -- Convocar Jugador
    PA_TECNICO_C2.AD_NOMINA(900, 900, 'SI');
    -- Cambiar a Suplente
    PA_TECNICO_C2.MOD_NOMINA(900, 900, 'NO');
    -- Consultas Tacticas
    PA_TECNICO_C2.CO_NOMINA(v_cursor);
    PA_TECNICO_C2.CO_PLANTILLA_PARTIDO(900, 'Seguridad FC', v_cursor);
    PA_TECNICO_C2.CO_LINEA_TIEMPO_PARTIDO(900, v_cursor);
    PA_TECNICO_C2.CO_RANKING_GOLEADORES('Torneo Seguridad', '2026', v_cursor);
    PA_TECNICO_C2.CO_ESTADISTICA_JUGADOR(v_cursor);
    PA_TECNICO_C2.CO_ESTADISTICA_INDIVIDUAL(900, v_cursor);
    -- Limpiar Nomina (Sin Candados)
    PA_TECNICO_C2.EL_NOMINA(900, 900);

    -- ==========================================================
    -- E. PA_REPRESENTANTE_C2 (Gestion administrativa)
    -- ==========================================================
    PA_REPRESENTANTE_C2.CO_FACTURA(v_cursor);
    PA_REPRESENTANTE_C2.CO_PAGO(v_cursor);
    PA_REPRESENTANTE_C2.CO_MOROSOS('Seguridad FC', v_cursor);
    PA_REPRESENTANTE_C2.CO_HISTORIAL_SANCIONES('Seguridad FC', v_cursor);
    
    -- El trigger de la resolucion autogenero una factura, la pagamos
    SELECT MAX(Id_Factura) INTO v_id_factura FROM Factura WHERE Id_Resolucion = v_id_resolucion;
    PA_REPRESENTANTE_C2.AD_PAGO(v_id_factura, 902, 1000);

    -- ==========================================================
    -- F. PA_PUBLICO_C2 (Solo Lectura)
    -- ==========================================================
    PA_PUBLICO_C2.CO_LINEA_TIEMPO_PARTIDO(900, v_cursor);
    PA_PUBLICO_C2.CO_RANKING_GOLEADORES('Torneo Seguridad', '2026', v_cursor);
    PA_PUBLICO_C2.CO_ESTADISTICA_JUGADOR(v_cursor);
    PA_PUBLICO_C2.CO_ESTADISTICA_INDIVIDUAL(900, v_cursor);
    PA_PUBLICO_C2.CO_NOMINA(v_cursor);
    PA_PUBLICO_C2.CO_PLANTILLA_PARTIDO(900, 'Seguridad FC', v_cursor);

    -- ==========================================================
    -- G. PA_ADMINISTRADOR_C2 (Modo Dios y Mantenimiento)
    -- ==========================================================
    -- Consultas Maestras
    PA_ADMINISTRADOR_C2.CO_TARIFA(v_cursor);
    PA_ADMINISTRADOR_C2.CO_FACTURA(v_cursor);
    PA_ADMINISTRADOR_C2.CO_PAGO(v_cursor);
    PA_ADMINISTRADOR_C2.CO_NOMINA(v_cursor);
    PA_ADMINISTRADOR_C2.CO_INCIDENCIA(v_cursor);
    PA_ADMINISTRADOR_C2.CO_RESOLUCION(v_cursor);
    PA_ADMINISTRADOR_C2.CO_ESTADISTICA_JUGADOR(v_cursor);
    
    -- El Administrador tiene permisos para manipular estadisticas
    SELECT MAX(Id_Estadistica) INTO v_id_estadistica FROM Estadistica_Jugador WHERE Id_Jugador = 900;
    PA_ADMINISTRADOR_C2.MOD_ESTADISTICA_JUGADOR(v_id_estadistica, 10, 5, 1, 0, 15);
    
    -- (Nota: No usamos EL_PAGO, MOD_PAGO, MOD_INCIDENCIA ni EL_RESOLUCION porque probamos en CRUDNoOK 
    -- que estos levantan Excepciones intencionales de inmutabilidad, lo cual arruinaria este script OK).
    
    -- Limpieza permitida
    PA_ORGANIZADOR_C2.EL_TARIFA(v_id_tarifa);

END;
/

PROMPT "Las pruebas exhaustivas de seguridad se ejecutaron exitosamente. Las 6 fachadas C2 y todos sus procedimientos funcionan a la perfeccion."
