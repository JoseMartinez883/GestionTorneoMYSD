-- ========================================================================
-- BORRADO ESTRUCTURAL DE PAQUETES (XCRUD) - CICLO 2
-- Script de limpieza (Rollback estructural)
-- ========================================================================

-- Eliminacion de Cuerpos de Paquetes (Opcional, al borrar la cabecera se borra todo, pero es buena practica)
DROP PACKAGE BODY PK_FACTURA;
DROP PACKAGE BODY PK_NOMINA;
DROP PACKAGE BODY PK_INCIDENCIA;
DROP PACKAGE BODY PK_ESTADISTICA_JUGADOR;

-- Eliminacion de Cabeceras de Paquetes
DROP PACKAGE PK_FACTURA;
DROP PACKAGE PK_NOMINA;
DROP PACKAGE PK_INCIDENCIA;
DROP PACKAGE PK_ESTADISTICA_JUGADOR;
