use bd_genolab;

-- Tablas independientes
SELECT * FROM cliente;
SELECT * FROM distrito;
SELECT * FROM forma_farmaceutica;
SELECT * FROM laboratorio;

-- Tablas dependientes
SELECT * FROM articulo;
SELECT * FROM direccion;
SELECT * FROM factura;
SELECT * FROM lote;
SELECT * FROM orden_de_venta;
SELECT * FROM rol;
SELECT * FROM transaccion;
SELECT * FROM usuario;

-- Resumen inventario --
SELECT 
    a.codigo AS 'Codigo Articulo',
    a.descripcion AS 'Descripcion Articulo',
    l.codigo AS 'Codigo Lote',
    l.fecha_fabricacion AS 'Fecha Fabricacion',
    l.fecha_expiracion AS 'Fecha Expiracion',
    l.stock AS 'Stock',
    l.precio_unitario AS 'Precio Unitario',
    (l.stock * l.precio_unitario) AS 'Total'
FROM
    bd_genolab.dbo.articulo a
    JOIN bd_genolab.dbo.lote l ON a.id_articulo = l.id_articulo;
    
-- Resumen kardex --
SELECT 
    a.codigo AS 'Codigo Articulo',
    a.descripcion AS 'Descripcion Articulo',
    l.codigo AS 'Codigo Lote',
    t.cantidad AS 'Cantidad',
    t.fecha AS 'Fecha Transaccion',
    t.id_orden AS 'ID Orden',
    c.nombre AS 'Nombre Cliente',
    (t.cantidad * l.precio_unitario) AS 'Importe'
FROM
    bd_genolab.dbo.transaccion t
    JOIN bd_genolab.dbo.lote l ON t.id_lote = l.id_lote
    JOIN bd_genolab.dbo.articulo a ON l.id_articulo = a.id_articulo
    JOIN bd_genolab.dbo.orden_de_venta o ON t.id_orden = o.id_orden
    JOIN bd_genolab.dbo.cliente c ON o.id_cliente = c.id_cliente;

-- Resumen factura --
SELECT 
  f.id_factura,
  f.id_orden,
  c.nombre AS nombre_cliente,
  c.tipo_documento AS tipo_documento_cliente,
  c.numero_documento AS numero_documento_cliente,
  f.codigo_autorizacion,
  f.fecha_hora,
  r.nombre AS nombre_rol,
  u.nombre AS nombre_usuario,
  o.importe_total AS importe_total_orden
FROM bd_genolab.dbo.factura f
JOIN bd_genolab.dbo.orden_de_venta o ON f.id_orden = o.id_orden
JOIN bd_genolab.dbo.cliente c ON o.id_cliente = c.id_cliente
JOIN bd_genolab.dbo.usuario u ON o.id_usuario = u.id_usuario
JOIN bd_genolab.dbo.rol r ON u.id_rol = r.id_rol;
