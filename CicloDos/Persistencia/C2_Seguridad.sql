-- ========================================================================
-- SEGURIDAD (Roles y Grants) - CICLO 2
-- ========================================================================

-- 1. Creacion de Roles Oficiales de la Liga Deportiva
-- (Se mantienen los mismos nombres del Ciclo 1 para integracion)
CREATE ROLE RL_ADMINISTRADOR;
CREATE ROLE RL_ORGANIZADOR;
CREATE ROLE RL_REPRESENTANTE;
CREATE ROLE RL_TECNICO;
CREATE ROLE RL_ARBITRO;
CREATE ROLE RL_PUBLICO;

-- 2. Matriz de Permisos (Asignacion de Fachadas del Ciclo 2)
-- Cada Rol recibe acceso unica y exclusivamente a su paquete de Actor correspondiente
GRANT EXECUTE ON PA_ADMINISTRADOR_C2 TO RL_ADMINISTRADOR;
GRANT EXECUTE ON PA_ORGANIZADOR_C2 TO RL_ORGANIZADOR;
GRANT EXECUTE ON PA_REPRESENTANTE_C2 TO RL_REPRESENTANTE;
GRANT EXECUTE ON PA_TECNICO_C2 TO RL_TECNICO;
GRANT EXECUTE ON PA_ARBITRO_C2 TO RL_ARBITRO;
GRANT EXECUTE ON PA_PUBLICO_C2 TO RL_PUBLICO;

-- 3. Revocacion de accesos directos (Blindaje)
-- Nota: En Oracle por defecto los usuarios no tienen permisos, 
-- pero garantizamos que nadie pueda hacer SELECT/INSERT en el CRUDE
-- a menos que sea el dueo del esquema.
