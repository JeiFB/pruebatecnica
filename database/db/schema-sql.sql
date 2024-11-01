CREATE DATABASE productos_db;
USE productos_db;


-- Crear tabla de PRODUCTO
CREATE TABLE PRODUCTO (
    producto_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(12,2) NOT NULL,
    imagen_url VARCHAR(500),
    activo BOOLEAN DEFAULT true,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Crear tabla de CLASIFICACION
CREATE TABLE CLASIFICACION (
    clasificacion_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    activo BOOLEAN DEFAULT true,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Crear tabla intermedia PRODUCTO_CLASIFICACION
CREATE TABLE PRODUCTO_CLASIFICACION (
    producto_id INT UNSIGNED,
    clasificacion_id INT UNSIGNED,
    fecha_asignacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (producto_id, clasificacion_id),
    CONSTRAINT fk_producto 
        FOREIGN KEY (producto_id) 
        REFERENCES PRODUCTO(producto_id) 
        ON DELETE CASCADE,
    CONSTRAINT fk_clasificacion 
        FOREIGN KEY (clasificacion_id) 
        REFERENCES CLASIFICACION(clasificacion_id) 
        ON DELETE CASCADE
);

-- Crear índices
CREATE INDEX idx_producto_activo ON PRODUCTO(activo);
CREATE INDEX idx_clasificacion_activo ON CLASIFICACION(activo);

-- Agregar restricción UNIQUE
ALTER TABLE CLASIFICACION ADD CONSTRAINT uk_clasificacion_nombre UNIQUE (nombre);
