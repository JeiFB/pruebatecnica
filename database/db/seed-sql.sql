-- Insertar clasificaciones de ejemplo
INSERT INTO CLASIFICACION (nombre, descripcion) VALUES
('Perros', 'Productos para perros'),
('Gatos', 'Productos para gatos'),
('Dogourmet', 'Productos premium para perros'),
('Accesorios', 'Accesorios para mascotas'),
('Alimentos', 'Alimentos para mascotas');

-- Insertar productos de ejemplo
INSERT INTO PRODUCTO (nombre, descripcion, precio, imagen_url) VALUES
('Collar Premium', 'Collar de cuero para perros', 29.99, 'collar.jpg'),
('Comida Premium', 'Alimento balanceado premium', 49.99, 'comida.jpg'),
('Juguete Interactivo', 'Juguete para estimulación', 15.99, 'juguete.jpg'),
('Cama Deluxe', 'Cama acolchada para mascotas', 39.99, 'cama.jpg');

-- Asociar productos con clasificaciones
INSERT INTO PRODUCTO_CLASIFICACION (producto_id, clasificacion_id) VALUES
(1, 1),  -- Collar Premium -> Perros
(1, 3),  -- Collar Premium -> Dogourmet
(1, 4),  -- Collar Premium -> Accesorios
(2, 1),  -- Comida Premium -> Perros
(2, 3),  -- Comida Premium -> Dogourmet
(2, 5),  -- Comida Premium -> Alimentos
(3, 1),  -- Juguete Interactivo -> Perros
(3, 2),  -- Juguete Interactivo -> Gatos
(3, 4),  -- Juguete Interactivo -> Accesorios
(4, 1),  -- Cama Deluxe -> Perros
(4, 2),  -- Cama Deluxe -> Gatos
(4, 4);  -- Cama Deluxe -> Accesorios
