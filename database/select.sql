use bd_genolab;

-- Tablas independientes
select * from cliente;
select * from distrito;
select * from forma_farmaceutica;
select * from laboratorio;

-- Tablas dependientes
select * from articulo;
select * from sucursal;
select * from factura;
select * from lote;
select id_lote, precio_unitario, descripcion from lote inner join articulo on lote.id_articulo = articulo.id_articulo;
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
  f.codigo_autorizacion,
  f.fecha_hora,
  r.nombre AS nombre_rol,
  u.nombre AS nombre_usuario,
  o.importe_total AS importe_total_orden
FROM bd_genolab.factura f
JOIN bd_genolab.orden_de_venta o ON f.id_orden = o.id_orden
JOIN bd_genolab.cliente c ON o.id_cliente = c.id_cliente
JOIN bd_genolab.usuario u ON o.id_usuario = u.id_usuario
JOIN bd_genolab.rol r ON u.id_rol = r.id_rol;


SELECT u.id_usuario, u.id_rol, r.nombre AS rol_nombre, u.nombre, u.apellido, 
u.ci, u.email, u.password, u.fecha_nacimiento, u.foto, u .activo
FROM usuario u INNER JOIN rol r ON u.id_rol=r.id_rol; 

SELECT a.id_articulo, a.id_ffarmaceutica, a.codigo, a.descripcion, a.concentracion,
f.descripcion AS forma_farmaceutica, a.activo FROM articulo a INNER JOIN forma_farmaceutica f
ON a.id_ffarmaceutica = f.id_ffarmaceutica WHERE a.descripcion LIKE "%%";

SELECT l.id_lote,
l.id_articulo,
l.id_laboratorio,
a.codigo AS codigo,
a.descripcion AS articulo,
l.codigo AS lote,
l.fecha_fabricacion,
l.fecha_expiracion,
l.stock,
l.precio_unitario,
lab.nombre as laboratorio,
l.activo
FROM lote l 
INNER JOIN articulo a
ON l.id_articulo = a.id_articulo
INNER JOIN laboratorio lab
ON l.id_laboratorio = lab.id_laboratorio
WHERE a.codigo LIKE "%%";

SELECT o.id_orden,
o.id_sucursal,
o.id_usuario,
o.fecha_hora,
o.importe_total,
s.
c.nombre as cliente,
c.id_cliente;
 
select  t.fecha, t.id_transaccion as operacion, c.nombre as cliente, r.nombre as usuario, -t.cantidad as cantidad from
transaccion t inner join lote l on t.id_lote = l.id_lote
inner join orden_de_venta o on t.id_orden = o.id_orden 
inner join sucursal s on o.id_sucursal = s.id_sucursal
inner join cliente c on s.id_cliente = c.id_cliente
inner join usuario u on o.id_usuario = u.id_usuario
inner join rol r on u.id_rol = r.id_rol where l.id_lote = 27;

SELECT
    t.fecha,
    t.id_transaccion AS operacion,
    c.nombre AS cliente,
    r.nombre AS usuario,
    -t.cantidad AS cantidad,
    (500 - COALESCE(SUM(t.cantidad) OVER (ORDER BY t.fecha, t.id_transaccion), 0)) AS saldo_stock
FROM
    transaccion t
INNER JOIN lote l ON t.id_lote = l.id_lote
INNER JOIN orden_de_venta o ON t.id_orden = o.id_orden 
INNER JOIN sucursal s ON o.id_sucursal = s.id_sucursal
INNER JOIN cliente c ON s.id_cliente = c.id_cliente
INNER JOIN usuario u ON o.id_usuario = u.id_usuario
INNER JOIN rol r ON u.id_rol = r.id_rol
WHERE
    l.id_lote = 27
ORDER BY
    t.fecha, t.id_transaccion;


SELECT
    t.fecha,
    t.id_transaccion AS id_trans,
    c.nombre AS cliente,
    r.nombre AS rol,
    -t.cantidad AS cantidad,
    (total_cantidad_stock - COALESCE(SUM(t.cantidad) OVER (ORDER BY t.fecha, t.id_transaccion), 0)) AS saldo_stock
FROM
    transaccion t
INNER JOIN lote l ON t.id_lote = l.id_lote
INNER JOIN orden_de_venta o ON t.id_orden = o.id_orden 
INNER JOIN sucursal s ON o.id_sucursal = s.id_sucursal
INNER JOIN cliente c ON s.id_cliente = c.id_cliente
INNER JOIN usuario u ON o.id_usuario = u.id_usuario
INNER JOIN rol r ON u.id_rol = r.id_rol
CROSS JOIN (SELECT SUM(t.cantidad) + l.stock AS total_cantidad_stock
            FROM transaccion t
            INNER JOIN lote l ON t.id_lote = l.id_lote
            WHERE l.id_lote = 27
            GROUP BY l.id_lote) AS total_stock
WHERE
    l.id_lote = 27
ORDER BY
    t.fecha;



select * from lote where id_lote=27;

select cantidad from transaccion where id_lote =27;

SELECT
    SUM(t.cantidad) + l.stock AS total_cantidad_stock
FROM
    transaccion t
INNER JOIN lote l ON t.id_lote = l.id_lote
WHERE
    l.id_lote = 27
GROUP BY
    l.id_lote;

