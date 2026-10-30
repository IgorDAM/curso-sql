USE PracticaNull;
SELECT ClienteId,Nombre FROM dbo.Cliente WHERE Telefono IS NULL AND Ciudad = 'Oviedo' ORDER BY ClienteId;

SELECT ClienteId,Nombre FROM dbo.Cliente WHERE Ciudad <> 'Oviedo' ORDER BY ClienteId;

SELECT PedidoId, Importe FROM dbo.Pedido WHERE Importe IS NULL OR Importe > 100 ORDER BY PedidoId;
