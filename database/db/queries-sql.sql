-- Consulta para obtener productos con sus clasificaciones
SELECT 
    p.producto_id,
    p.nombre AS producto_nombre,
    p.precio,
    GROUP_CONCAT(c.nombre) AS clasificaciones
FROM PRODUCTO p
LEFT JOIN PRODUCTO_CLASIFICACION pc ON p.producto_id = pc.producto_id
LEFT JOIN CLASIFICACION c ON pc.clasificacion_id = c.clasificacion_id
WHERE p.activo = true
GROUP BY p.producto_id;

-- Consulta para obtener productos por clasificación
SELECT 
    c.nombre AS clasificacion,
    COUNT(p.producto_id) AS total_productos,
    AVG(p.precio) AS precio_promedio
FROM CLASIFICACION c
LEFT JOIN PRODUCTO_CLASIFICACION pc ON c.clasificacion_id = pc.clasificacion_id
LEFT JOIN PRODUCTO p ON pc.producto_id = p.producto_id
WHERE c.activo = true
GROUP BY c.clasificacion_id;

-- Consulta para obtener productos con múltiples clasificaciones
SELECT 
    p.nombre AS producto,
    p.precio,
    COUNT(pc.clasificacion_id) AS num_clasificaciones
FROM PRODUCTO p
JOIN PRODUCTO_CLASIFICACION pc ON p.producto_id = pc.producto_id
GROUP BY p.producto_id
HAVING num_clasificaciones > 1;
