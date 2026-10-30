RESTORE FILELISTONLY
FROM DISK = '/var/opt/mssql/backup/AdventureWorksLT2022.bak';

-- Restaurar AdventureWorksLT
RESTORE DATABASE AdventureWorksLT
FROM DISK = '/var/opt/mssql/backup/AdventureWorksLT2022.bak'
WITH MOVE 'AdventureWorksLT2022_Data' TO '/var/opt/mssql/data/AdventureWorksLT2022.mdf',
MOVE 'AdventureWorksLT2022_Log' TO '/var/opt/mssql/data/AdventureWorksLT2022.ldf';

-- Listar todas las tablas de la base de datos AdventureWorksLT
USE AdventureWorksLT;
SELECT name FROM sys.tables;

-- Listar todas las tablas de la base de datos AdventureWorksLT con su esquema
SELECT SCHEMA_NAME(schema_id) AS esquema, name
FROM sys.tables;

-- Listar las 10 primeras filas de la tabla SalesLT.Customer
SELECT TOP (10) * FROM SalesLT.Customer;

-- Listar los clientes que no tienen segundo nombre
SELECT CustomerID, FirstName, LastName, MiddleName FROM SalesLT.Customer 
WHERE MiddleName IS NULL;

