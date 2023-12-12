use bd_genolab;

-- insert into rol values ('Administrador',1);
select * from rol;
select * from usuario; 

select * from orden_de_venta;
select * from lote;

--delete from rol;
--delete from usuario;
SELECT
    u.id_usuario,
    u.id_rol,
    r.nombre AS rol_nombre,
    u.nombre,
    u.apellido,
    u.ci,
    u.email,
    u.activo
FROM
    usuario u
INNER JOIN
    rol r ON u.id_rol = r.id_rol
WHERE
    u.email = 'admin' AND u.password = '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918';

	SELECT
    u.id_usuario,
    u.id_rol,
    r.nombre AS rol_nombre,
    u.nombre,
    u.apellido,
    u.ci,
    u.email,
    u.activo
FROM
    usuario u
INNER JOIN
    rol r ON u.id_rol = r.id_rol
WHERE
    u.email = ? AND u.password = ?;

SELECT u.id_usuario, u.id_rol, r.nombre AS rol_nombre, u.nombre, u.apellido, u.ci, u.email, u.activo FROM usuario u INNER JOIN rol r ON u.id_rol = r.id_rol WHERE u.email = 'admin' AND u.password = '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918';

-- Modificar la tabla sucursal
--ALTER TABLE sucursal
--DROP COLUMN calle;

--ALTER TABLE sucursal
--DROP COLUMN numero;

--ALTER TABLE sucursal
--DROP COLUMN oficina;

-- Agregar la nueva columna
--ALTER TABLE sucursal
--ADD direccion VARCHAR(200) NOT NULL;

