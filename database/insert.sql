use bd_genolab;


INSERT INTO `bd_genolab`.`forma_farmaceutica` (`descripcion`) VALUES 
('Comprimido'),
('Cápsula'),
('Inyectable');

INSERT INTO `bd_genolab`.`cliente` (`nombre`, `tipo_documento`, `numero_documento`, `telefono`, `email`, `activo`) VALUES 
('Juan Ramos', 'NIT', '123456789', '555-1234', 'juan.ramos@example.com', 1),
('Jose Perez', 'NIT', '987654321', '555-5678', 'jose.perez@example.com', 1),
('Ana Fernandez', 'NIT', '456789012', '555-9012', 'ana.fernandez@example.com', 1);

INSERT INTO `bd_genolab`.`empresa` (`nombre`, `nit`) VALUES ('GenoLab', '5624634');

INSERT INTO `bd_genolab`.`distrito` (`nombre`) VALUES 
('Cochabamba'),
('La Paz'),
('Santa Cruz');

INSERT INTO `bd_genolab`.`laboratorio` (`nombre`, `procedencia`, `activo`) VALUES 
('Sinochem', 'China', 1),
('Ningbo', 'China', 1),
('Laboratorios Chile', 'Chile', 1);

INSERT INTO `bd_genolab`.`articulo` (`id_ffarmaceutica`, `descripcion`, `concentracion`, `codigo`, `activo`) VALUES 
(1, 'Amoxicilina 500mg', 500, 'AMOX001', 1),
(2, 'Complejo B 2ml', 2, 'CB001', 1),
(1, 'Paracetamol 500mg', 500, 'PARA001', 1),
(3, 'Vitamina C 5ml', 5, 'VITC001', 1);

INSERT INTO `bd_genolab`.`lote` (`id_articulo`, `id_laboratorio`, `fecha_fabricacion`, `fecha_expiracion`, `stock`, `precio_unitario`, `activo`, `codigo`) VALUES 
(1, 1, '2023-11-01', '2024-11-01', 500000, 0.5, 1, 'LOTE001'),
(2, 2, '2023-11-01', '2024-11-01', 500000, 0.4, 1, 'LOTE002'),
(3, 1, '2023-11-01', '2024-11-01', 500000, 0.3, 1, 'LOTE003'),
(4, 3, '2023-11-01', '2024-11-01', 500000, 0.2, 1, 'LOTE004');

INSERT INTO `bd_genolab`.`direccion` (`id_distrito`, `id_cliente`, `calle`, `numero`, `oficina`, `activo`) VALUES 
(1, 1, 'Calle A', '123', 'Oficina 1', 1),
(2, 2, 'Avenida B', '456', 'Oficina 2', 1),
(3, 3, 'Calle C', '789', 'Oficina 3', 1);

INSERT INTO `bd_genolab`.`rol` (`id_empresa`, `nombre`, `activo`) VALUES 
(1, 'Administrador', 1),
(1, 'Ventas', 1),
(1, 'Regencia Farmaceutica', 1),
(1, 'Almacenes', 1);

INSERT INTO `bd_genolab`.`usuario` (`id_rol`, `password`, `nombre`, `apellido`, `ci`, `email`, `fecha_nacimiento`, `activo`) VALUES 
(1, 'password_admin', 'Carlos', 'López', '123456', 'carlos.lopez@example.com', '1990-01-01', 1),
(2, 'password_ventas', 'Sofía', 'González', '789012', 'sofia.gonzalez@example.com', '1992-05-15', 1),
(3, 'password_regencia', 'Miguel', 'Martínez', '345678', 'miguel.martinez@example.com', '1985-08-20', 1),
(4, 'password_almacenes', 'Laura', 'Ruiz', '901234', 'laura.ruiz@example.com', '1988-11-10', 1);

INSERT INTO `bd_genolab`.`orden_de_venta` (`id_cliente`, `id_usuario`, `fecha_hora`) VALUES 
(1, 2, NOW()),
(2, 2, NOW()),
(3, 2, NOW());

-- Insertar transacciones para la Orden de Venta 1
INSERT INTO `bd_genolab`.`transaccion` (`id_lote`, `id_orden`, `cantidad`, `fecha`) VALUES 
(1, 1, 6000, NOW()),
(2, 1, 2000, NOW());

-- Insertar transacciones para la Orden de Venta 2
INSERT INTO `bd_genolab`.`transaccion` (`id_lote`, `id_orden`, `cantidad`, `fecha`) VALUES 
(2, 2, 4000, NOW()),
(3, 2, 7000, NOW());

-- Insertar transacciones para la Orden de Venta 3
INSERT INTO `bd_genolab`.`transaccion` (`id_lote`, `id_orden`, `cantidad`, `fecha`) VALUES 
(3, 3, 8000, NOW()),
(4, 3, 5000, NOW());




/*UPDATE `bd_genolab`.`orden_de_venta` SET `importe_total` = NULL WHERE `id_orden` IN (1, 2, 3);

 UPDATE `bd_genolab`.`lote` 
SET `precio_unitario` = 
  CASE 
    WHEN `id_lote` = 2 THEN 0.4
    WHEN `id_lote` = 3 THEN 0.3
    WHEN `id_lote` = 4 THEN 0.2
  END
WHERE `id_lote` IN (2, 3, 4);*/

-- INICIO OPERACION VENTA --

UPDATE `bd_genolab`.`orden_de_venta` AS o
SET o.`importe_total` = (
    SELECT SUM(t.`cantidad` * l.`precio_unitario`)
    FROM `bd_genolab`.`transaccion` AS t
    INNER JOIN `bd_genolab`.`lote` AS l ON t.`id_lote` = l.`id_lote`
    WHERE t.`id_orden` = o.`id_orden`
)
WHERE o.`id_orden` IN (1, 2, 3);

UPDATE `bd_genolab`.`lote` AS l
SET l.`stock` = l.`stock` - (
    SELECT SUM(t.`cantidad`)
    FROM `bd_genolab`.`transaccion` AS t
    WHERE t.`id_lote` = l.`id_lote`
)
WHERE l.`id_lote` IN (1, 2, 3, 4);

-- FIN DE OPERACION VENTA--



-- Generar factura --

INSERT INTO `bd_genolab`.`factura` (`id_orden`, `codigo_autorizacion`, `fecha_hora`)
VALUES 
  (1, 'AUT001', NOW()),
  (2, 'AUT002', NOW()),
  (3, 'AUT003', NOW());

-- Fin generar factura --



