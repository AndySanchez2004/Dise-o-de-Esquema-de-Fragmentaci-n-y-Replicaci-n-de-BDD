-- 1) COMPLETITUD
-- La vista global debe tener todos los pedidos.
SELECT COUNT(*) AS filas_globales
FROM pedidos_global;

-- 2) RECONSTRUCCIÓN
-- La suma por sede debe reconstruirse correctamente.
SELECT sede, SUM(monto) AS total
FROM pedidos_global
GROUP BY sede;

-- 3) DISJUNCIÓN
-- Ningún pedido debe aparecer repetido.
SELECT pedido_id, COUNT(*) AS veces
FROM pedidos_global
GROUP BY pedido_id
HAVING COUNT(*) > 1;