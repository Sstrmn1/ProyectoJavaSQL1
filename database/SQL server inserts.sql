USE bd_genolab;

-- Insertar datos en la tabla forma_farmaceutica
INSERT INTO forma_farmaceutica (descripcion) VALUES 
('Comprimido'),
('Cápsula'),
('Inyectable');

-- Insertar datos en la tabla cliente
INSERT INTO cliente (nombre, tipo_documento, numero_documento, telefono, email, activo) VALUES 
('Juan Ramos', 'NIT', '123456789', '555-1234', 'juan.ramos@example.com', 1),
('Jose Perez', 'NIT', '987654321', '555-5678', 'jose.perez@example.com', 1),
('Ana Fernandez', 'NIT', '456789012', '555-9012', 'ana.fernandez@example.com', 1);

-- Insertar datos en la tabla distrito
INSERT INTO distrito (nombre) VALUES 
('Cochabamba'),
('La Paz'),
('Santa Cruz');

-- Insertar datos en la tabla laboratorio
INSERT INTO laboratorio (nombre, procedencia, activo) VALUES 
('Sinochem', 'China', 1),
('Ningbo', 'China', 1),
('Laboratorios Chile', 'Chile', 1);

-- Insertar datos en la tabla articulo
INSERT INTO articulo (id_ffarmaceutica, descripcion, concentracion, codigo, activo) VALUES 
(1, 'Amoxicilina 500mg', 500, 'AMOX001', 1),
(2, 'Complejo B 2ml', 2, 'CB001', 1),
(1, 'Paracetamol 500mg', 500, 'PARA001', 1),
(3, 'Vitamina C 5ml', 5, 'VITC001', 1);

-- Insertar datos en la tabla lote
INSERT INTO lote (id_articulo, id_laboratorio, fecha_fabricacion, fecha_expiracion, stock, precio_unitario, activo, codigo) VALUES 
(1, 1, '2023-11-01', '2024-11-01', 500000, 0.5, 1, 'LOTE001'),
(2, 2, '2023-11-01', '2024-11-01', 500000, 0.4, 1, 'LOTE002'),
(3, 1, '2023-11-01', '2024-11-01', 500000, 0.3, 1, 'LOTE003'),
(4, 3, '2023-11-01', '2024-11-01', 500000, 0.2, 1, 'LOTE004');

-- Insertar datos en la tabla direccion
INSERT INTO direccion (id_distrito, id_cliente, calle, numero, oficina, activo) VALUES 
(1, 1, 'Calle A', '123', 'Oficina 1', 1),
(2, 2, 'Avenida B', '456', 'Oficina 2', 1),
(3, 3, 'Calle C', '789', 'Oficina 3', 1);

-- Insertar datos en la tabla rol
INSERT INTO rol (nombre, activo) VALUES 
('Administrador', 1),
('Ventas', 1),
('Regencia Farmaceutica', 1),
('Almacenes', 1);

-- Insertar datos en la tabla usuario
INSERT INTO usuario (id_rol, password, nombre, apellido, ci, email, fecha_nacimiento, activo) VALUES 
(1, 'password_admin', 'Carlos', 'López', '123456', 'carlos.lopez@example.com', '1990-01-01', 1),
(2, 'password_ventas', 'Sofía', 'González', '789012', 'sofia.gonzalez@example.com', '1992-05-15', 1),
(3, 'password_regencia', 'Miguel', 'Martínez', '345678', 'miguel.martinez@example.com', '1985-08-20', 1),
(4, 'password_almacenes', 'Laura', 'Ruiz', '901234', 'laura.ruiz@example.com', '1988-11-10', 1);

-- Insertar datos en la tabla orden_de_venta
INSERT INTO orden_de_venta (id_cliente, id_usuario, fecha_hora) VALUES 
(1, 2, GETDATE()),
(2, 2, GETDATE()),
(3, 2, GETDATE());

-- Insertar transacciones para la Orden de Venta 1
INSERT INTO transaccion (id_lote, id_orden, cantidad, fecha) VALUES 
(1, 1, 6000, GETDATE()),
(2, 1, 2000, GETDATE());

-- Insertar transacciones para la Orden de Venta 2
INSERT INTO transaccion (id_lote, id_orden, cantidad, fecha) VALUES 
(2, 2, 4000, GETDATE()),
(3, 2, 7000, GETDATE());

-- Insertar transacciones para la Orden de Venta 3
INSERT INTO transaccion (id_lote, id_orden, cantidad, fecha) VALUES 
(3, 3, 8000, GETDATE()),
(4, 3, 5000, GETDATE());

-- INICIO OPERACION VENTA --

UPDATE orden_de_venta 
SET importe_total = (
    SELECT SUM(t.cantidad * l.precio_unitario)
    FROM transaccion t
    INNER JOIN lote l ON t.id_lote = l.id_lote
    WHERE t.id_orden = orden_de_venta.id_orden
)
WHERE orden_de_venta.id_orden IN (1, 2, 3);

UPDATE lote 
SET stock = stock - (
    SELECT SUM(t.cantidad)
    FROM transaccion t
    WHERE t.id_lote = lote.id_lote
)
WHERE lote.id_lote IN (1, 2, 3, 4);

-- FIN DE OPERACION VENTA--

-- Generar factura --

INSERT INTO factura (id_orden, codigo_autorizacion, fecha_hora)
VALUES 
(1, 'AUT001', GETDATE()),
(2, 'AUT002', GETDATE()),
(3, 'AUT003', GETDATE());

-- Fin generar factura --
