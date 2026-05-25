-- AccionesNoOk

-- Intentar cambiar el ID de una persona a uno que ya existe
UPDATE Persona SET Id_Persona = 301 WHERE Id_Persona = 300;

-- Intentar cambiar el DNI de una persona a uno que ya existe
UPDATE Persona SET DNI = 'CC-301' WHERE Id_Persona = 300;

-- Intentar cambiar el NIT de un patrocinador a uno existente
UPDATE Patrocinador SET NIT = '900400200' WHERE Id_Patrocinador = 300;

-- Intentar asignar un tecnico a un equipo que no existe
UPDATE Tecnico SET Id_Equipo = 999 WHERE Id_Persona = 302;

-- Intentar asignar un partido a una fase inexistente (FK Compuesta)
UPDATE Partido SET nombre_fase = 'Octavos' WHERE Id_Partido = 300;

-- Intentar eliminar una persona que es Jugador (Integridad referencial)
DELETE FROM Persona WHERE Id_Persona = 300;

-- Intentar cambiar el numero de camiseta a uno invalido (Fuera de 1-99)
UPDATE Jugador SET Num_camiseta = 150 WHERE Id_Persona = 300;

-- Intentar poner un peso negativo
UPDATE Jugador SET Peso = -5.0 WHERE Id_Persona = 300;

-- Intentar cambiar el estado de un partido a un valor no permitido
UPDATE Partido SET estado = 'Desconocido' WHERE Id_Partido = 300;

-- Intentar cambiar el tipo de formato de una fase a uno invalido (Usando PK Compuesta)
UPDATE Fase SET tipo_formato = 'Invalido' WHERE Id_Torneo = 300 AND nombre_fase = 'Fase de Grupos';

