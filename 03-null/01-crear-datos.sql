CREATE DATABASE PracticaNull;
GO
USE PracticaNull;
GO

CREATE TABLE dbo.Cliente (
    ClienteId INT          NOT NULL PRIMARY KEY,
    Nombre    VARCHAR(50)  NOT NULL,
    Telefono  VARCHAR(15)  NULL,
    Ciudad    VARCHAR(30)  NULL
);

CREATE TABLE dbo.Pedido (
    PedidoId  INT            NOT NULL PRIMARY KEY,
    ClienteId INT            NULL REFERENCES dbo.Cliente(ClienteId),
    Importe   DECIMAL(10,2)  NULL,
    Estado    VARCHAR(10)    NOT NULL
);

INSERT INTO dbo.Cliente (ClienteId, Nombre, Telefono, Ciudad) VALUES
    (1, 'Ana García', '600111222', 'Oviedo'),
    (2, 'Luis Pérez',  NULL,       'Gijón'),
    (3, 'Marta Díaz', '600333444', NULL),
    (4, 'Pablo Ruiz',  NULL,       'Oviedo'),
    (5, 'Elena Sanz', '600555666', 'Gijón');

INSERT INTO dbo.Pedido (PedidoId, ClienteId, Importe, Estado) VALUES
    (101, 1,    120.00, 'Pagado'),
    (102, 1,     80.00, 'Pagado'),
    (103, 2,     NULL,  'Pendiente'),
    (104, 3,    200.00, 'Pagado'),
    (105, NULL,  50.00, 'Pendiente'),
    (106, 3,     NULL,  'Pendiente');