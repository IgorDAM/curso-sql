-- Ejercicio 1: Listar todas las bases de datos
SELECT name,database_id FROM sys.databases;

-- Ejercicio 2: Listar la base de datos 'model'
SELECT name,database_id FROM sys.databases WHERE name = 'model';

-- Ejercicio 3: Listar todas las bases de datos excepto 'master' y 'tempdb'
SELECT name,database_id FROM sys.databases WHERE database_id > 2;