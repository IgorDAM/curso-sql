USE PracticaNull;
-- A
SELECT PedidoId, Importe FROM dbo.Pedido WHERE Importe = NULL;

-- B
SELECT PedidoId, Importe FROM dbo.Pedido WHERE Importe <> NULL;

-- C
SELECT PedidoId, Importe FROM dbo.Pedido WHERE Importe IS NULL ORDER BY PedidoId;

-------------------- 

-- A
SELECT PedidoId, Importe FROM dbo.Pedido WHERE NOT (Importe > 100) ORDER BY PedidoId;

-- B
SELECT PedidoId, Importe FROM dbo.Pedido WHERE NOT (Importe > 100) OR Importe IS NULL ORDER BY PedidoId;

---------------------

SELECT COUNT(*)       AS filas,
       COUNT(Importe) AS con_importe,
       SUM(Importe)   AS total,
       AVG(Importe)   AS media
FROM dbo.Pedido;

----------------------

SELECT AVG(Importe)                AS media_ignorando_nulos,
       AVG(COALESCE(Importe, 0))   AS media_nulos_como_cero
FROM dbo.Pedido;

----------------------

SELECT Nombre,
       COALESCE(Telefono, 'sin teléfono') AS contacto,
       COALESCE(Ciudad,   '(sin ciudad)') AS ciudad
FROM dbo.Cliente
ORDER BY ClienteId;

----------------------

SELECT * FROM dbo.Cliente 

----------------------

SELECT Ciudad, COUNT(*) AS clientes
FROM dbo.Cliente
GROUP BY Ciudad
ORDER BY Ciudad;

----------------------

-- A
SELECT Nombre, Telefono FROM dbo.Cliente ORDER BY Telefono, ClienteId;

-- B
SELECT Nombre, Telefono FROM dbo.Cliente
ORDER BY CASE WHEN Telefono IS NULL THEN 1 ELSE 0 END, Telefono, ClienteId;

----------------------

-- A: clientes que no han hecho ningún pedido
SELECT Nombre FROM dbo.Cliente
WHERE ClienteId NOT IN (SELECT ClienteId FROM dbo.Pedido)
ORDER BY ClienteId;

-- B: lo mismo, filtrando los nulos dentro de la subconsulta
SELECT Nombre FROM dbo.Cliente
WHERE ClienteId NOT IN (SELECT ClienteId FROM dbo.Pedido WHERE ClienteId IS NOT NULL)
ORDER BY ClienteId;

----------------------

SELECT ClienteId FROM dbo.Pedido

----------------------
-- A
SELECT PedidoId, Importe * 2 AS doble
FROM dbo.Pedido
-- WHERE doble > 100;

-- B
SELECT PedidoId, Importe * 2 AS doble
FROM dbo.Pedido
WHERE Importe * 2 > 100
ORDER BY doble DESC;

----------------------

-- A: sin filtro
SELECT Estado, COUNT(*) AS pedidos, SUM(Importe) AS total
FROM dbo.Pedido GROUP BY Estado ORDER BY Estado;

-- B: filtro con WHERE
SELECT Estado, COUNT(*) AS pedidos, SUM(Importe) AS total
FROM dbo.Pedido WHERE Importe IS NOT NULL GROUP BY Estado ORDER BY Estado;

-- C: filtro con HAVING
SELECT Estado, COUNT(*) AS pedidos, SUM(Importe) AS total
FROM dbo.Pedido GROUP BY Estado HAVING SUM(Importe) > 100 ORDER BY Estado;

----------------------



-- GO
-- SELECT DB_NAME() AS base_actual;
-- SELECT COUNT(*) AS clientes FROM dbo.Cliente;
-- SELECT COUNT(*) AS pedidos  FROM dbo.Pedido;