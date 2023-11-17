-- Create the database if it does not exist
IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'bd_genolab')
BEGIN
    CREATE DATABASE bd_genolab;
END
GO

-- Set the default schema
USE bd_genolab;
GO

-- Resto del script de creación de tablas...


-- -----------------------------------------------------
-- Table bd_genolab.forma_farmaceutica
-- -----------------------------------------------------
CREATE TABLE forma_farmaceutica (
    id_ffarmaceutica INT NOT NULL IDENTITY(1,1),
    descripcion VARCHAR(40) NOT NULL,
    activo BIT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_ffarmaceutica),
    CONSTRAINT UQ_id_ffarmaceutica UNIQUE (id_ffarmaceutica)
);
GO

-- -----------------------------------------------------
-- Table bd_genolab.articulo
-- -----------------------------------------------------
CREATE TABLE articulo (
    id_articulo INT NOT NULL IDENTITY(1,1),
    id_ffarmaceutica INT NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    concentracion FLOAT NULL,
    codigo VARCHAR(15) NOT NULL,
    activo BIT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_articulo),
    CONSTRAINT UQ_id_articulo UNIQUE (id_articulo),
    CONSTRAINT UQ_codigo UNIQUE (codigo),
    CONSTRAINT FK_articulo_ffarmaceutica FOREIGN KEY (id_ffarmaceutica)
        REFERENCES forma_farmaceutica (id_ffarmaceutica)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);
GO

-- -----------------------------------------------------
-- Table bd_genolab.laboratorio
-- -----------------------------------------------------
CREATE TABLE laboratorio (
    id_laboratorio INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(75) NOT NULL,
    procedencia VARCHAR(75) NOT NULL,
    activo BIT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_laboratorio),
    CONSTRAINT UQ_id_laboratorio UNIQUE (id_laboratorio)
);
GO

-- -----------------------------------------------------
-- Table bd_genolab.lote
-- -----------------------------------------------------
CREATE TABLE lote (
    id_lote INT NOT NULL IDENTITY(1,1),
    id_articulo INT NOT NULL,
    id_laboratorio INT NOT NULL,
    fecha_fabricacion DATE NOT NULL,
    fecha_expiracion DATE NOT NULL,
    stock INT NOT NULL,
    precio_unitario DECIMAL(5,2) NOT NULL,
    activo BIT NOT NULL DEFAULT 1,
    codigo VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_lote),
    CONSTRAINT UQ_id_lote UNIQUE (id_lote),
    CONSTRAINT FK_lote_articulo FOREIGN KEY (id_articulo)
        REFERENCES articulo (id_articulo)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT FK_lote_laboratorio FOREIGN KEY (id_laboratorio)
        REFERENCES laboratorio (id_laboratorio)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);
GO

-- -----------------------------------------------------
-- Table bd_genolab.rol
-- -----------------------------------------------------
CREATE TABLE rol (
    id_rol INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(60) NOT NULL,
    activo BIT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_rol)
);
GO

-- -----------------------------------------------------
-- Table bd_genolab.usuario
-- -----------------------------------------------------
CREATE TABLE usuario (
    id_usuario INT NOT NULL IDENTITY(1,1),
    id_rol INT NOT NULL,
    password VARCHAR(50) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    ci VARCHAR(20) NOT NULL,
    email VARCHAR(50) NULL,
    fecha_nacimiento DATE NULL,
    foto VARCHAR(70) NULL,
    activo BIT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_usuario),
    CONSTRAINT UQ_id_usuario UNIQUE (id_usuario),
    CONSTRAINT FK_usuario_rol FOREIGN KEY (id_rol)
        REFERENCES rol (id_rol)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);
GO

-- -----------------------------------------------------
-- Table bd_genolab.cliente
-- -----------------------------------------------------
CREATE TABLE cliente (
    id_cliente INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    tipo_documento VARCHAR(45) NOT NULL,
    numero_documento VARCHAR(45) NOT NULL,
    telefono VARCHAR(45) NOT NULL,
    email VARCHAR(45) NULL,
    activo BIT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_cliente),
    CONSTRAINT UQ_id_cliente UNIQUE (id_cliente)
);
GO

-- -----------------------------------------------------
-- Table bd_genolab.orden_de_venta
-- -----------------------------------------------------
CREATE TABLE orden_de_venta (
    id_orden INT NOT NULL IDENTITY(1,1),
    id_cliente INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    importe_total DECIMAL(10,2) NULL,
    PRIMARY KEY (id_orden),
    CONSTRAINT FK_orden_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT FK_orden_cliente FOREIGN KEY (id_cliente)
        REFERENCES cliente (id_cliente)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);
GO

-- -----------------------------------------------------
-- Table bd_genolab.transaccion
-- -----------------------------------------------------
CREATE TABLE transaccion (
    id_transaccion INT NOT NULL IDENTITY(1,1),
    id_lote INT NOT NULL,
    id_orden INT NOT NULL,
    cantidad INT NOT NULL,
    fecha DATETIME NOT NULL,
    PRIMARY KEY (id_transaccion),
    CONSTRAINT UQ_id_transaccion UNIQUE (id_transaccion),
    CONSTRAINT FK_transaccion_lote FOREIGN KEY (id_lote)
        REFERENCES lote (id_lote)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT FK_transaccion_orden FOREIGN KEY (id_orden)
        REFERENCES orden_de_venta (id_orden)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);
GO

-- -----------------------------------------------------
-- Table bd_genolab.distrito
-- -----------------------------------------------------
CREATE TABLE distrito (
    id_distrito INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(75) NOT NULL,
    activo BIT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_distrito),
    CONSTRAINT UQ_id_distrito UNIQUE (id_distrito)
);
GO

-- -----------------------------------------------------
-- Table bd_genolab.direccion
-- -----------------------------------------------------
CREATE TABLE direccion (
    iddireccion INT NOT NULL IDENTITY(1,1),
    id_distrito INT NOT NULL,
    id_cliente INT NOT NULL,
    calle VARCHAR(55) NOT NULL,
    numero VARCHAR(45) NULL,
    oficina VARCHAR(45) NULL,
    activo BIT NOT NULL DEFAULT 1,
    PRIMARY KEY (iddireccion),
    CONSTRAINT UQ_iddireccion UNIQUE (iddireccion),
    CONSTRAINT FK_direccion_cliente FOREIGN KEY (id_cliente)
        REFERENCES cliente (id_cliente)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT FK_direccion_distrito FOREIGN KEY (id_distrito)
        REFERENCES distrito (id_distrito)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);
GO

-- -----------------------------------------------------
-- Table bd_genolab.factura
-- -----------------------------------------------------
CREATE TABLE factura (
    id_factura INT NOT NULL IDENTITY(1,1),
    id_orden INT NOT NULL,
    codigo_autorizacion VARCHAR(45) NOT NULL,
    fecha_hora DATETIME NOT NULL,
    activo BIT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_factura),
    CONSTRAINT FK_factura_orden FOREIGN KEY (id_orden)
        REFERENCES orden_de_venta (id_orden)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);
GO
