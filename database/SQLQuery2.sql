-- Crear la base de datos
CREATE DATABASE bd_genolab;

-- Usar la base de datos
USE bd_genolab;

-- Crear la tabla de forma_farmaceutica
CREATE TABLE forma_farmaceutica (
    id_ffarmaceutica INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(40) NOT NULL,
    activo BIT NOT NULL
);


-- Crear la tabla laboratorio
CREATE TABLE laboratorio (
    id_laboratorio INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(75) NOT NULL,
    procedencia VARCHAR(75) NOT NULL,
    activo BIT NOT NULL
);



-- Crear la tabla distrito
CREATE TABLE distrito (
    id_distrito INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(75) NOT NULL,
    activo BIT NOT NULL
);




-- Crear la tabla cliente
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    tipo_documento VARCHAR(45) NOT NULL,
    numero_documento VARCHAR(45) NOT NULL,
    telefono VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    activo BIT NOT NULL
);


-- Crear la tabla articulo
CREATE TABLE articulo (
    id_articulo INT PRIMARY KEY IDENTITY(1,1),
    id_ffarmaceutica INT NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    concentracion FLOAT,
    codigo VARCHAR(15) NOT NULL,
    activo BIT NOT NULL,
    CONSTRAINT fk_articulo_ffarmaceutica FOREIGN KEY (id_ffarmaceutica) REFERENCES forma_farmaceutica (id_ffarmaceutica)
);



-- Crear la tabla lote
CREATE TABLE lote (
    id_lote INT PRIMARY KEY IDENTITY(1,1),
    id_articulo INT NOT NULL,
    id_laboratorio INT NOT NULL,
    fecha_fabricacion DATE NOT NULL,
    fecha_expiracion DATE NOT NULL,
    stock INT NOT NULL,
    precio_unitario DECIMAL(5,2) NOT NULL,
    activo BIT NOT NULL,
    codigo VARCHAR(20) NOT NULL,
    CONSTRAINT fk_lote_articulo FOREIGN KEY (id_articulo) REFERENCES articulo (id_articulo),
    CONSTRAINT fk_lote_laboratorio FOREIGN KEY (id_laboratorio) REFERENCES laboratorio (id_laboratorio)
);



-- Crear la tabla sucursal
CREATE TABLE sucursal (
    id_sucursal INT PRIMARY KEY IDENTITY(1,1),
    id_distrito INT NOT NULL,
    id_cliente INT NOT NULL,
    direccion varchar(200),
    activo BIT NOT NULL,
    CONSTRAINT fk_sucursal_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    CONSTRAINT fk_sucursal_distrito FOREIGN KEY (id_distrito) REFERENCES distrito (id_distrito)
);



-- Crear la tabla rol
CREATE TABLE rol (
    id_rol INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(60) NOT NULL,
    activo BIT NOT NULL
);



-- Crear la tabla usuario
CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY IDENTITY(1,1),
    id_rol INT NOT NULL,
    password VARCHAR(64) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    ci VARCHAR(20) NOT NULL,
    email VARCHAR(50),
    fecha_nacimiento DATE,
    foto VARCHAR(70),
    activo BIT NOT NULL,
    CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES rol (id_rol)
);



-- Crear la tabla orden_de_venta
CREATE TABLE orden_de_venta (
    id_orden INT PRIMARY KEY IDENTITY(1,1),
    id_sucursal INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    importe_total DECIMAL(10,2),
    numero_orden INT,
    CONSTRAINT fk_orden_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursal (id_sucursal),
    CONSTRAINT fk_orden_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);



-- Crear la tabla factura
CREATE TABLE factura (
    id_factura INT PRIMARY KEY IDENTITY(1,1),
    id_orden INT NOT NULL,
    codigo_autorizacion VARCHAR(45) NOT NULL,
    fecha_hora DATETIME NOT NULL,
    activo BIT NOT NULL,
    CONSTRAINT fk_factura_orden FOREIGN KEY (id_orden) REFERENCES orden_de_venta (id_orden)
);

-- Crear la tabla transaccion
CREATE TABLE transaccion (
    id_transaccion INT PRIMARY KEY IDENTITY(1,1),
    id_lote INT NOT NULL,
    id_orden INT NOT NULL,
    cantidad INT NOT NULL,
    fecha DATETIME NOT NULL,
    CONSTRAINT fk_transaccion_lote FOREIGN KEY (id_lote) REFERENCES lote (id_lote),
    CONSTRAINT fk_transaccion_orden FOREIGN KEY (id_orden) REFERENCES orden_de_venta (id_orden)
);

insert into rol values ('Administrador',1);