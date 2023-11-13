use bd_genolab;

-- Tablas independientes
select * from cliente;
select * from distrito;
select * from empresa;
select * from forma_farmaceutica;
select * from laboratorio;

-- Tablas dependientes
select * from articulo;
select * from direccion;
select * from factura;
select * from lote;
select * from orden_de_venta;
select * from rol;
select * from transaccion;
select * from usuario;

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
    bd_genolab.articulo a
    JOIN bd_genolab.lote l ON a.id_articulo = l.id_articulo;
    
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
    bd_genolab.transaccion t
    JOIN bd_genolab.lote l ON t.id_lote = l.id_lote
    JOIN bd_genolab.articulo a ON l.id_articulo = a.id_articulo
    JOIN bd_genolab.orden_de_venta o ON t.id_orden = o.id_orden
    JOIN bd_genolab.cliente c ON o.id_cliente = c.id_cliente;

-- Resumen factura --

SELECT 
  f.id_factura,
  f.id_orden,
  c.nombre AS nombre_cliente,
  c.tipo_documento AS tipo_documento_cliente,
  c.numero_documento AS numero_documento_cliente,
  e.nit AS nit_empresa,
  f.codigo_autorizacion,
  f.fecha_hora,
  r.nombre AS nombre_rol,
  u.nombre AS nombre_usuario,
  o.importe_total AS importe_total_orden
FROM bd_genolab.factura f
JOIN bd_genolab.orden_de_venta o ON f.id_orden = o.id_orden
JOIN bd_genolab.cliente c ON o.id_cliente = c.id_cliente
JOIN bd_genolab.usuario u ON o.id_usuario = u.id_usuario
JOIN bd_genolab.rol r ON u.id_rol = r.id_rol
JOIN bd_genolab.empresa e ON r.id_empresa = e.idempresa;


