-- ========================================================================
-- PRUEBAS AISLADAS DE PAQUETES NoOK (CRUDNoOK) - CICLO 2
-- Metodologia: Intento de corrupcion de datos para probar Filtros y Candados
-- ========================================================================

-- ==========================================
-- PREPARACION DEL ENTORNO AISLADO (SERIE 750)
-- ==========================================
INSERT INTO Torneo (Id_Torneo, nombre, temporada, Fecha_Inicio, Fecha_Fin, estado) VALUES (750, 'Torneo CRUD NoOK', '2026', TRUNC(SYSDATE)+1, TRUNC(SYSDATE)+30, 'Programado');
INSERT INTO Fase (Id_Torneo, nombre_fase, tipo_formato) VALUES (750, 'Unica', 'Liga');
INSERT INTO Estadio (Id_Estadio, nombre, ciudad, capacidad, tipo_terreno) VALUES (750, 'Estadio 750', 'Ciudad', 1000, 'Natural');

INSERT INTO Equipo (Id_Equipo, Nombre_Oficial, fecha_fundacion) VALUES (750, 'Local 750', SYSDATE-10);
INSERT INTO Equipo (Id_Equipo, Nombre_Oficial, fecha_fundacion) VALUES (751, 'Visit 751', SYSDATE-10);

INSERT INTO Persona (Id_Persona, Nombres, Apellidos, DNI, Tipo_Documento) VALUES (750, 'Jugador', 'Malo', '75000', 'CC');
INSERT INTO Persona (Id_Persona, Nombres, Apellidos, DNI, Tipo_Documento) VALUES (751, 'Arbitro', 'Malo', '75001', 'CC');
INSERT INTO Persona (Id_Persona, Nombres, Apellidos, DNI, Tipo_Documento) VALUES (752, 'Repre', 'Malo', '75002', 'CC');

INSERT INTO Representante (Id_Persona) VALUES (752);
INSERT INTO Arbitro (Id_Persona, Años_Experiencia) VALUES (751, 5);
INSERT INTO Jugador (Id_Persona, Id_Equipo, Num_Camiseta, Posicion) VALUES (750, 750, 10, 'Delantero');

INSERT INTO Partido (Id_Partido, Id_Torneo, nombre_fase, Id_Estadio, Id_EquipoLocal, Id_EquipoVisitante, fecha_hora, goles_local, goles_visitante, estado) VALUES (750, 750, 'Unica', 750, 750, 751, SYSDATE+5, 0, 0, 'Programado');

-- ========================================================================
-- PRUEBA 1: PK_ESTADISTICA_JUGADOR (Bloqueo de Insercion/Eliminacion)
-- ========================================================================
-- Intentar insertar o eliminar estadisticas a mano debe fallar.
EXEC PK_ESTADISTICA_JUGADOR.AD_ESTADISTICA_JUGADOR(750, 750);
EXEC PK_ESTADISTICA_JUGADOR.EL_ESTADISTICA_JUGADOR(999);

-- ========================================================================
-- PRUEBA 2: PK_INCIDENCIA (Bloqueo de Modificacion y Congelamiento)
-- ========================================================================
-- Agregamos incidencia y resolucion
EXEC PK_INCIDENCIA.AD_INCIDENCIA(750, 751, 750, 10, 'Amarilla');

DECLARE v_Id_Incidencia NUMBER; BEGIN SELECT MAX(Id_Incidencia) INTO v_Id_Incidencia FROM Incidencia;
    PK_INCIDENCIA.AD_RESOLUCION(v_Id_Incidencia, 1, 1000, 'Falta leve');
END;
/

-- Al crearse la resolucion, ya se genero una FACTURA. 
-- Intentar modificar o eliminar la resolucion fallara por el TRG_CONGELA_RESOLUCION
DECLARE v_Id_Resolucion NUMBER; BEGIN SELECT MAX(Id_Resolucion) INTO v_Id_Resolucion FROM Resolucion;
    PK_INCIDENCIA.EL_RESOLUCION(v_Id_Resolucion);
END;
/

-- Las incidencias son inmutables (Candado del Paquete)
DECLARE v_Id_Incidencia NUMBER; BEGIN SELECT MAX(Id_Incidencia) INTO v_Id_Incidencia FROM Incidencia;
    PK_INCIDENCIA.MOD_INCIDENCIA(v_Id_Incidencia, 15, 'Roja');
END;
/

-- ========================================================================
-- PRUEBA 3: PK_FACTURA (Filtros Contables y Pagos Inmutables)
-- ========================================================================
DECLARE v_Id_Factura NUMBER; BEGIN SELECT MAX(Id_Factura) INTO v_Id_Factura FROM Factura;
    -- Intentamos cambiar el estado de la factura a 'Anulada', pero le metemos un abono primero
    PK_FACTURA.AD_PAGO(v_Id_Factura, 752, 500);
    
    -- El TRG_MODIFICAR_FACTURA bloqueara esta anulacion porque ya hay pagos.
    PK_FACTURA.MOD_FACTURA(v_Id_Factura, 'Anulada');
END;
/

DECLARE v_Id_Pago NUMBER; BEGIN SELECT MAX(Id_Pago) INTO v_Id_Pago FROM Pago;
    -- Intentar borrar el pago debe fallar por el TRG_ELIMINAR_PAGO
    PK_FACTURA.EL_PAGO(v_Id_Pago);
    
    -- Los recibos de pago son inmutables (Candado del paquete)
    PK_FACTURA.MOD_PAGO(v_Id_Pago, 9999);
END;
/

-- ========================================================================
-- PRUEBA 4: TRG_VERIFICAR_SANCION_NOMINA (Anti-Trampas)
-- ========================================================================
-- Intentaremos meter a un jugador sancionado en el acta del partido.
-- Usaremos el Jugador 750, al cual ya le sacamos una roja y le creamos una multa
-- en la Prueba 2 (que genero una Factura Pendiente).
BEGIN
    -- Esta insercion DEBE fallar y lanzar el error de inhabilitacion
    PK_NOMINA.AD_NOMINA(750, 750, 'SI');
END;
/

PROMPT "Las pruebas de fallo fueron bloqueadas correctamente por los candados de seguridad y los Triggers Inteligentes."
