-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bd_genolab
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_genolab
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_genolab` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `bd_genolab` ;

-- -----------------------------------------------------
-- Table `bd_genolab`.`forma_farmaceutica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_genolab`.`forma_farmaceutica` (
  `id_ffarmaceutica` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(40) CHARACTER SET 'utf8mb3' NOT NULL,
  `activo` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_ffarmaceutica`),
  UNIQUE INDEX `id_ffarmaceutica_UNIQUE` (`id_ffarmaceutica` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_genolab`.`articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_genolab`.`articulo` (
  `id_articulo` INT NOT NULL AUTO_INCREMENT,
  `id_ffarmaceutica` INT NOT NULL,
  `descripcion` VARCHAR(100) CHARACTER SET 'utf8mb3' NOT NULL,
  `concentracion` FLOAT NULL DEFAULT NULL,
  `codigo` VARCHAR(15) CHARACTER SET 'utf8mb3' NOT NULL,
  `activo` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_articulo`),
  UNIQUE INDEX `id_articulo_UNIQUE` (`id_articulo` ASC) VISIBLE,
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) VISIBLE,
  INDEX `fk_articulo_ffarmaceutica_idx` (`id_ffarmaceutica` ASC) VISIBLE,
  CONSTRAINT `fk_articulo_ffarmaceutica`
    FOREIGN KEY (`id_ffarmaceutica`)
    REFERENCES `bd_genolab`.`forma_farmaceutica` (`id_ffarmaceutica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_genolab`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_genolab`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) CHARACTER SET 'utf8mb3' NOT NULL,
  `tipo_documento` VARCHAR(45) CHARACTER SET 'utf8mb3' NOT NULL,
  `numero_documento` VARCHAR(45) CHARACTER SET 'utf8mb3' NOT NULL,
  `telefono` VARCHAR(45) CHARACTER SET 'utf8mb3' NOT NULL,
  `email` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `activo` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_cliente`),
  UNIQUE INDEX `id_cliente_UNIQUE` (`id_cliente` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_genolab`.`distrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_genolab`.`distrito` (
  `id_distrito` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(75) CHARACTER SET 'utf8mb3' NOT NULL,
  `activo` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_distrito`),
  UNIQUE INDEX `id_distrito_UNIQUE` (`id_distrito` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_genolab`.`sucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_genolab`.`sucursal` (
  `id_sucursal` INT NOT NULL AUTO_INCREMENT,
  `id_distrito` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `calle` VARCHAR(55) CHARACTER SET 'utf8mb3' NOT NULL,
  `numero` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `oficina` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `activo` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_sucursal`),
  UNIQUE INDEX `iddireccion_UNIQUE` (`id_sucursal` ASC) VISIBLE,
  INDEX `fk_direccion_cliente_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_direccion_distrito_idx` (`id_distrito` ASC) VISIBLE,
  CONSTRAINT `fk_sucursal_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `bd_genolab`.`cliente` (`id_cliente`),
  CONSTRAINT `fk_sucursal_distrito`
    FOREIGN KEY (`id_distrito`)
    REFERENCES `bd_genolab`.`distrito` (`id_distrito`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_genolab`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_genolab`.`rol` (
  `id_rol` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) CHARACTER SET 'utf8mb3' NOT NULL,
  `activo` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_rol`),
  UNIQUE INDEX `id_rol_UNIQUE` (`id_rol` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_genolab`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_genolab`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `id_rol` INT NOT NULL,
  `password` VARCHAR(50) CHARACTER SET 'utf8mb3' NOT NULL,
  `nombre` VARCHAR(100) CHARACTER SET 'utf8mb3' NOT NULL,
  `apellido` VARCHAR(100) CHARACTER SET 'utf8mb3' NOT NULL,
  `ci` VARCHAR(20) CHARACTER SET 'utf8mb3' NOT NULL,
  `email` VARCHAR(50) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `foto` VARCHAR(70) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `activo` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `idusuario_UNIQUE` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_usuario_rol_idx` (`id_rol` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_rol`
    FOREIGN KEY (`id_rol`)
    REFERENCES `bd_genolab`.`rol` (`id_rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_genolab`.`orden_de_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_genolab`.`orden_de_venta` (
  `id_orden` INT NOT NULL AUTO_INCREMENT,
  `id_sucursal` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `fecha_hora` DATETIME NOT NULL,
  `importe_total` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_orden`),
  INDEX `fk_orden_usuario_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_orden_sucursal_idx` (`id_sucursal` ASC) VISIBLE,
  UNIQUE INDEX `id_orden_UNIQUE` (`id_orden` ASC) VISIBLE,
  CONSTRAINT `fk_orden_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `bd_genolab`.`usuario` (`id_usuario`),
  CONSTRAINT `fk_orden_sucursal`
    FOREIGN KEY (`id_sucursal`)
    REFERENCES `bd_genolab`.`sucursal` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_genolab`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_genolab`.`factura` (
  `id_factura` INT NOT NULL AUTO_INCREMENT,
  `id_orden` INT NOT NULL,
  `codigo_autorizacion` VARCHAR(45) CHARACTER SET 'utf8mb3' NOT NULL,
  `fecha_hora` DATETIME NOT NULL,
  `activo` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_factura`),
  INDEX `fk_factura_orden_idx` (`id_orden` ASC) VISIBLE,
  UNIQUE INDEX `id_factura_UNIQUE` (`id_factura` ASC) VISIBLE,
  CONSTRAINT `fk_factura_orden`
    FOREIGN KEY (`id_orden`)
    REFERENCES `bd_genolab`.`orden_de_venta` (`id_orden`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_genolab`.`laboratorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_genolab`.`laboratorio` (
  `id_laboratorio` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(75) CHARACTER SET 'utf8mb3' NOT NULL,
  `procedencia` VARCHAR(75) CHARACTER SET 'utf8mb3' NOT NULL,
  `activo` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_laboratorio`),
  UNIQUE INDEX `id_laboratorio_UNIQUE` (`id_laboratorio` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_genolab`.`lote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_genolab`.`lote` (
  `id_lote` INT NOT NULL AUTO_INCREMENT,
  `id_articulo` INT NOT NULL,
  `id_laboratorio` INT NOT NULL,
  `fecha_fabricacion` DATE NOT NULL,
  `fecha_expiracion` DATE NOT NULL,
  `stock` INT NOT NULL,
  `precio_unitario` DECIMAL(5,2) NOT NULL,
  `activo` BIT(1) NOT NULL DEFAULT b'1',
  `codigo` VARCHAR(20) CHARACTER SET 'utf8mb3' NOT NULL,
  PRIMARY KEY (`id_lote`),
  UNIQUE INDEX `id_lote_UNIQUE` (`id_lote` ASC) VISIBLE,
  INDEX `fk_lote_articulo_idx` (`id_articulo` ASC) VISIBLE,
  INDEX `fk_lote_laboratorio_idx` (`id_laboratorio` ASC) VISIBLE,
  CONSTRAINT `fk_lote_articulo`
    FOREIGN KEY (`id_articulo`)
    REFERENCES `bd_genolab`.`articulo` (`id_articulo`),
  CONSTRAINT `fk_lote_laboratorio`
    FOREIGN KEY (`id_laboratorio`)
    REFERENCES `bd_genolab`.`laboratorio` (`id_laboratorio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_genolab`.`transaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_genolab`.`transaccion` (
  `id_transaccion` INT NOT NULL AUTO_INCREMENT,
  `id_lote` INT NOT NULL,
  `id_orden` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  PRIMARY KEY (`id_transaccion`),
  UNIQUE INDEX `id_transaccion_UNIQUE` (`id_transaccion` ASC) VISIBLE,
  INDEX `fk_transaccion_lote_idx` (`id_lote` ASC) VISIBLE,
  INDEX `fk_transaccion_orden_idx` (`id_orden` ASC) VISIBLE,
  CONSTRAINT `fk_transaccion_lote`
    FOREIGN KEY (`id_lote`)
    REFERENCES `bd_genolab`.`lote` (`id_lote`),
  CONSTRAINT `fk_transaccion_orden`
    FOREIGN KEY (`id_orden`)
    REFERENCES `bd_genolab`.`orden_de_venta` (`id_orden`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
