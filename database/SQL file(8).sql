use bd_genolab;


alter table orden_de_venta
add column numero_orden int;

select * from orden_de_venta;

insert into orden_de_venta
(numero_orden,
id_usuario,
id_sucursal,
fecha_hora,
importe_total)
values
(123,
1,
1,
now(),
0
);

UPDATE orden_de_venta SET
fecha_hora = NOW(),
importe_total = 10
WHERE id_orden = 17;

SELECT
s.id_sucursal,
d.nombre AS distrito,
s.direccion
FROM sucursal s
INNER JOIN distrito d
ON s.id_distrito = d.id_distrito
INNER JOIN cliente
ON s.id_cliente = cliente.id_cliente
WHERE s.id_cliente = 5;
