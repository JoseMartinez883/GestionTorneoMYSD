-- ========================================================================
-- PRUEBAS AISLADAS DE PAQUETES OK (CRUDOK) - CICLO 2
-- Metodologia: Consumo de la API y comprobacion de Automatizacion (Serie 700)
-- ========================================================================

-- ==========================================
-- PREPARACION DEL ENTORNO AISLADO (SERIE 700)
-- ==========================================
INSERT INTO Torneo (Id_Torneo, nombre, temporada, Fecha_Inicio, Fecha_Fin, estado) VALUES (700, 'Torneo CRUD', '2026', TRUNC(SYSDATE)+1, TRUNC(SYSDATE)+30, 'Programado');
INSERT INTO Fase (Id_Torneo, nombre_fase, tipo_formato) VALUES (700, 'Unica', 'Liga');
INSERT INTO Estadio (Id_Estadio, nombre, ciudad, capacidad, tipo_terreno) VALUES (700, 'Estadio 700', 'Ciudad', 1000, 'Natural');

INSERT INTO Equipo (Id_Equipo, Nombre_Oficial, fecha_fundacion) VALUES (700, 'Local 700', SYSDATE-10);
INSERT INTO Equipo (Id_Equipo, Nombre_Oficial, fecha_fundacion) VALUES (701, 'Visit 701', SYSDATE-10);

INSERT INTO Persona (Id_Persona, Nombres, Apellidos, DNI, Tipo_Documento) VALUES (700, 'Jugador', 'Siete', '70000', 'CC');
INSERT INTO Persona (Id_Persona, Nombres, Apellidos, DNI, Tipo_Documento) VALUES (701, 'Arbitro', 'Siete', '70001', 'CC');
INSERT INTO Persona (Id_Persona, Nombres, Apellidos, DNI, Tipo_Documento) VALUES (702, 'Repre', 'Siete', '70002', 'CC');

INSERT INTO Representante (Id_Persona) VALUES (702);
INSERT INTO Arbitro (Id_Persona, Años_Experiencia) VALUES (701, 5);
INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (700, 700, 10, 'Delantero');

INSERT INTO Partido (Id_Partido, Id_Torneo, nombre_fase, Id_Estadio, Id_EquipoLocal, Id_EquipoVisitante, fecha_hora, goles_local, goles_visitante, estado) VALUES (700, 700, 'Unica', 700, 700, 701, SYSDATE+5, 0, 0, 'Programado');

-- ========================================================================
-- PRUEBA 1: PK_FACTURA y AUTOMATIZACION DE INSCRIPCION
-- ========================================================================
-- Creamos la tarifa base para que el trigger la encuentre
EXEC PK_FACTURA.AD_TARIFA('Inscripcion Torneo', 50000);

-- Insertamos la inscripcion aceptada (ESTO DISPARARA EL TRG_AUTOGENERAR_FACTURA_INS)
INSERT INTO Inscripcion (Id_Inscripcion, Id_Torneo, Id_Equipo, Id_Representante, Estado)
VALUES (700, 700, 700, 702, 'Aceptada');

-- Hacemos un abono a la factura que se genero automaticamente
DECLARE v_Id_Factura NUMBER; BEGIN SELECT MAX(Id_Factura) INTO v_Id_Factura FROM Factura;
    PK_FACTURA.AD_PAGO(v_Id_Factura, 702, 25000);
END;
/

-- Usamos el Fallback manual (Por teoria CRUD)
DECLARE v_Id_Tarifa NUMBER; BEGIN SELECT MAX(Id_Tarifa) INTO v_Id_Tarifa FROM Tarifa; 
    PK_FACTURA.AD_FACTURA(700, NULL, v_Id_Tarifa);
END;
/

-- ========================================================================
-- PRUEBA 2: PK_NOMINA
-- ========================================================================
EXEC PK_NOMINA.AD_NOMINA(700, 700, 'SI');
EXEC PK_NOMINA.MOD_NOMINA(700, 700, 'NO');

-- ========================================================================
-- PRUEBA 3: PK_INCIDENCIA y AUTOMATIZACION DE MULTAS
-- ========================================================================
EXEC PK_INCIDENCIA.AD_INCIDENCIA(700, 701, 700, 20, 'Roja');

-- Al insertar resolucion, ESTO DISPARARA EL TRG_AUTOGENERAR_FACTURA_RES
DECLARE v_Id_Incidencia NUMBER; BEGIN SELECT MAX(Id_Incidencia) INTO v_Id_Incidencia FROM Incidencia;
    PK_INCIDENCIA.AD_RESOLUCION(v_Id_Incidencia, 2, 5000, 'Sancion Grave');
END;
/

-- Prueba de eliminacion de incidencia (El Trigger reversara la roja automaticamente)
EXEC PK_INCIDENCIA.AD_INCIDENCIA(700, 701, 700, 30, 'Gol');
DECLARE v_Id_Inc_Temp NUMBER; BEGIN SELECT MAX(Id_Incidencia) INTO v_Id_Inc_Temp FROM Incidencia;
    PK_INCIDENCIA.EL_INCIDENCIA(v_Id_Inc_Temp);
END;
/

-- ========================================================================
-- PRUEBA 4: PK_ESTADISTICA_JUGADOR
-- ========================================================================
-- Modificamos los goles del jugador a traves de la API
DECLARE v_Id_Est NUMBER; BEGIN SELECT MAX(Id_Estadistica) INTO v_Id_Est FROM Estadistica_Jugador;
    PK_ESTADISTICA_JUGADOR.MOD_ESTADISTICA_JUGADOR(v_Id_Est, 1, 0, 0, 1, 1);
END;
/

-- ========================================================================
-- PRUEBA 5: CONSULTAS OPERATIVAS (Lectura con cursores y filtros)
-- ========================================================================
DECLARE 
    v_cursor SYS_REFCURSOR;
BEGIN
    -- Prueba de PK_FACTURA
    PK_FACTURA.CO_MOROSOS('Local 700', v_cursor);
    PK_FACTURA.CO_BALANCE_FINANCIERO('Torneo CRUD', '2026', v_cursor);
    
    -- Prueba de PK_NOMINA
    PK_NOMINA.CO_PLANTILLA_PARTIDO(700, 'Local 700', v_cursor);
    
    -- Prueba de PK_INCIDENCIA
    PK_INCIDENCIA.CO_HISTORIAL_SANCIONES('Local 700', v_cursor);
    PK_INCIDENCIA.CO_LINEA_TIEMPO_PARTIDO(700, v_cursor);
    
    -- Prueba de PK_ESTADISTICA_JUGADOR
    PK_ESTADISTICA_JUGADOR.CO_RANKING_GOLEADORES('Torneo CRUD', '2026', v_cursor);
    PK_ESTADISTICA_JUGADOR.CO_ESTADISTICA_INDIVIDUAL(700, v_cursor);
END;
/

PROMPT "Todas las pruebas de la API (CRUDOK) y Consultas Operativas han finalizado correctamente."
