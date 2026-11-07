USE PracticaNull;

-- A) ¿Qué clientes de Oviedo no tienen teléfono?
-- Predicción: Pablo Ruiz. Resultado: Pablo Ruiz
SELECT ClienteId,Nombre FROM dbo.Cliente WHERE Telefono IS NULL AND Ciudad = 'Oviedo' ORDER BY ClienteId;

-- B) ¿Qué clientes no son de Oviedo, incluidos los de ciudad desconocida?
-- Predicción: Luis, Marta y Elena. Resultado: Luis, Marta y Elena
SELECT ClienteId,Nombre FROM dbo.Cliente WHERE Ciudad <> 'Oviedo' OR Ciudad IS NULL ORDER BY ClienteId;

-- C) ¿Qué pedidos no tienen importe o lo tienen mayor que 100?
-- Predicción: 101, 103, 104, 106
SELECT PedidoId, Importe FROM dbo.Pedido WHERE Importe IS NULL OR Importe > 100 ORDER BY PedidoId;

-- D) ¿Cuántos pedidos no tienen cliente asignado?
-- Predicción: 1 (el pedido 105)
SELECT Count(*) AS PedidosSinCliente FROM dbo.Pedido WHERE ClienteId IS NULL;

-- E) ¿Cuántos pedidos pagados tienen importe y cuánto suman?
-- Predicción: 3 y 400.00. Resultado: 3 y 400.00
SELECT Count(Importe) AS PagadosConImporte, SUM(Importe) AS TotalImporte FROM dbo.Pedido WHERE Estado = 'Pagado';

