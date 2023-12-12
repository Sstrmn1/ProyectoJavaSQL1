
USE bd_genolab
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'bd_genolab')      
     EXEC (N'CREATE SCHEMA bd_genolab')                                   
 GO                                                               

USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'articulo'  AND sc.name = N'bd_genolab'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'articulo'  AND sc.name = N'bd_genolab'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [bd_genolab].[articulo]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[bd_genolab].[articulo]
(
   [id_articulo] int IDENTITY(10, 1)  NOT NULL,
   [id_ffarmaceutica] int  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [descripcion] nvarchar(100)  NOT NULL,
   [concentracion] float(24)  NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [codigo] nvarchar(15)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0052: BIT literal was converted to BINARY literal
   */

   [activo] binary(1)  NOT NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'bd_genolab.articulo',
        N'SCHEMA', N'bd_genolab',
        N'TABLE', N'articulo'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'cliente'  AND sc.name = N'bd_genolab'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'cliente'  AND sc.name = N'bd_genolab'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [bd_genolab].[cliente]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[bd_genolab].[cliente]
(
   [id_cliente] int IDENTITY(11, 1)  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [nombre] nvarchar(100)  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [tipo_documento] nvarchar(45)  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [numero_documento] nvarchar(45)  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [telefono] nvarchar(45)  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [email] nvarchar(45)  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0052: BIT literal was converted to BINARY literal
   */

   [activo] binary(1)  NOT NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'bd_genolab.cliente',
        N'SCHEMA', N'bd_genolab',
        N'TABLE', N'cliente'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'distrito'  AND sc.name = N'bd_genolab'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'distrito'  AND sc.name = N'bd_genolab'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [bd_genolab].[distrito]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[bd_genolab].[distrito]
(
   [id_distrito] int IDENTITY(11, 1)  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [nombre] nvarchar(75)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0052: BIT literal was converted to BINARY literal
   */

   [activo] binary(1)  NOT NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'bd_genolab.distrito',
        N'SCHEMA', N'bd_genolab',
        N'TABLE', N'distrito'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'factura'  AND sc.name = N'bd_genolab'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'factura'  AND sc.name = N'bd_genolab'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [bd_genolab].[factura]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[bd_genolab].[factura]
(
   [id_factura] int IDENTITY(18, 1)  NOT NULL,
   [id_orden] int  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [codigo_autorizacion] nvarchar(45)  NOT NULL,
   [fecha_hora] datetime2(0)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0052: BIT literal was converted to BINARY literal
   */

   [activo] binary(1)  NOT NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'bd_genolab.factura',
        N'SCHEMA', N'bd_genolab',
        N'TABLE', N'factura'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'forma_farmaceutica'  AND sc.name = N'bd_genolab'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'forma_farmaceutica'  AND sc.name = N'bd_genolab'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [bd_genolab].[forma_farmaceutica]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[bd_genolab].[forma_farmaceutica]
(
   [id_ffarmaceutica] int IDENTITY(11, 1)  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [descripcion] nvarchar(40)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0052: BIT literal was converted to BINARY literal
   */

   [activo] binary(1)  NOT NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'bd_genolab.forma_farmaceutica',
        N'SCHEMA', N'bd_genolab',
        N'TABLE', N'forma_farmaceutica'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'laboratorio'  AND sc.name = N'bd_genolab'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'laboratorio'  AND sc.name = N'bd_genolab'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [bd_genolab].[laboratorio]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[bd_genolab].[laboratorio]
(
   [id_laboratorio] int IDENTITY(12, 1)  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [nombre] nvarchar(75)  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [procedencia] nvarchar(75)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0052: BIT literal was converted to BINARY literal
   */

   [activo] binary(1)  NOT NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'bd_genolab.laboratorio',
        N'SCHEMA', N'bd_genolab',
        N'TABLE', N'laboratorio'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'lote'  AND sc.name = N'bd_genolab'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'lote'  AND sc.name = N'bd_genolab'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [bd_genolab].[lote]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[bd_genolab].[lote]
(
   [id_lote] int IDENTITY(25, 1)  NOT NULL,
   [id_articulo] int  NOT NULL,
   [id_laboratorio] int  NOT NULL,
   [fecha_fabricacion] date  NOT NULL,
   [fecha_expiracion] date  NOT NULL,
   [stock] int  NOT NULL,
   [precio_unitario] decimal(5, 2)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0052: BIT literal was converted to BINARY literal
   */

   [activo] binary(1)  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [codigo] nvarchar(20)  NOT NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'bd_genolab.lote',
        N'SCHEMA', N'bd_genolab',
        N'TABLE', N'lote'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'orden_de_venta'  AND sc.name = N'bd_genolab'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'orden_de_venta'  AND sc.name = N'bd_genolab'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [bd_genolab].[orden_de_venta]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[bd_genolab].[orden_de_venta]
(
   [id_orden] int IDENTITY(26, 1)  NOT NULL,
   [id_sucursal] int  NOT NULL,
   [id_usuario] int  NOT NULL,
   [fecha_hora] datetime2(0)  NOT NULL,
   [importe_total] decimal(10, 2)  NULL,
   [numero_orden] int  NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'bd_genolab.orden_de_venta',
        N'SCHEMA', N'bd_genolab',
        N'TABLE', N'orden_de_venta'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'rol'  AND sc.name = N'bd_genolab'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'rol'  AND sc.name = N'bd_genolab'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [bd_genolab].[rol]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[bd_genolab].[rol]
(
   [id_rol] int IDENTITY(11, 1)  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [nombre] nvarchar(60)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0052: BIT literal was converted to BINARY literal
   */

   [activo] binary(1)  NOT NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'bd_genolab.rol',
        N'SCHEMA', N'bd_genolab',
        N'TABLE', N'rol'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sucursal'  AND sc.name = N'bd_genolab'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'sucursal'  AND sc.name = N'bd_genolab'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [bd_genolab].[sucursal]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[bd_genolab].[sucursal]
(
   [id_sucursal] int IDENTITY(11, 1)  NOT NULL,
   [id_distrito] int  NOT NULL,
   [id_cliente] int  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [direccion] nvarchar(200)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0052: BIT literal was converted to BINARY literal
   */

   [activo] binary(1)  NOT NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'bd_genolab.sucursal',
        N'SCHEMA', N'bd_genolab',
        N'TABLE', N'sucursal'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'transaccion'  AND sc.name = N'bd_genolab'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'transaccion'  AND sc.name = N'bd_genolab'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [bd_genolab].[transaccion]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[bd_genolab].[transaccion]
(
   [id_transaccion] int IDENTITY(34, 1)  NOT NULL,
   [id_lote] int  NOT NULL,
   [id_orden] int  NOT NULL,
   [cantidad] int  NOT NULL,
   [fecha] datetime2(0)  NOT NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'bd_genolab.transaccion',
        N'SCHEMA', N'bd_genolab',
        N'TABLE', N'transaccion'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'usuario'  AND sc.name = N'bd_genolab'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'usuario'  AND sc.name = N'bd_genolab'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [bd_genolab].[usuario]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[bd_genolab].[usuario]
(
   [id_usuario] int IDENTITY(18, 1)  NOT NULL,
   [id_rol] int  NOT NULL,
   [password] nvarchar(100)  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [nombre] nvarchar(100)  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [apellido] nvarchar(100)  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [ci] nvarchar(20)  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [email] nvarchar(50)  NULL,
   [fecha_nacimiento] date  NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [foto] nvarchar(70)  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0052: BIT literal was converted to BINARY literal
   */

   [activo] binary(1)  NOT NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'bd_genolab.usuario',
        N'SCHEMA', N'bd_genolab',
        N'TABLE', N'usuario'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_articulo_id_articulo'  AND sc.name = N'bd_genolab'  AND type in (N'PK'))
ALTER TABLE [bd_genolab].[articulo] DROP CONSTRAINT [PK_articulo_id_articulo]
 GO



ALTER TABLE [bd_genolab].[articulo]
 ADD CONSTRAINT [PK_articulo_id_articulo]
   PRIMARY KEY
   CLUSTERED ([id_articulo] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_cliente_id_cliente'  AND sc.name = N'bd_genolab'  AND type in (N'PK'))
ALTER TABLE [bd_genolab].[cliente] DROP CONSTRAINT [PK_cliente_id_cliente]
 GO



ALTER TABLE [bd_genolab].[cliente]
 ADD CONSTRAINT [PK_cliente_id_cliente]
   PRIMARY KEY
   CLUSTERED ([id_cliente] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_distrito_id_distrito'  AND sc.name = N'bd_genolab'  AND type in (N'PK'))
ALTER TABLE [bd_genolab].[distrito] DROP CONSTRAINT [PK_distrito_id_distrito]
 GO



ALTER TABLE [bd_genolab].[distrito]
 ADD CONSTRAINT [PK_distrito_id_distrito]
   PRIMARY KEY
   CLUSTERED ([id_distrito] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_factura_id_factura'  AND sc.name = N'bd_genolab'  AND type in (N'PK'))
ALTER TABLE [bd_genolab].[factura] DROP CONSTRAINT [PK_factura_id_factura]
 GO



ALTER TABLE [bd_genolab].[factura]
 ADD CONSTRAINT [PK_factura_id_factura]
   PRIMARY KEY
   CLUSTERED ([id_factura] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_forma_farmaceutica_id_ffarmaceutica'  AND sc.name = N'bd_genolab'  AND type in (N'PK'))
ALTER TABLE [bd_genolab].[forma_farmaceutica] DROP CONSTRAINT [PK_forma_farmaceutica_id_ffarmaceutica]
 GO



ALTER TABLE [bd_genolab].[forma_farmaceutica]
 ADD CONSTRAINT [PK_forma_farmaceutica_id_ffarmaceutica]
   PRIMARY KEY
   CLUSTERED ([id_ffarmaceutica] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_laboratorio_id_laboratorio'  AND sc.name = N'bd_genolab'  AND type in (N'PK'))
ALTER TABLE [bd_genolab].[laboratorio] DROP CONSTRAINT [PK_laboratorio_id_laboratorio]
 GO



ALTER TABLE [bd_genolab].[laboratorio]
 ADD CONSTRAINT [PK_laboratorio_id_laboratorio]
   PRIMARY KEY
   CLUSTERED ([id_laboratorio] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_lote_id_lote'  AND sc.name = N'bd_genolab'  AND type in (N'PK'))
ALTER TABLE [bd_genolab].[lote] DROP CONSTRAINT [PK_lote_id_lote]
 GO



ALTER TABLE [bd_genolab].[lote]
 ADD CONSTRAINT [PK_lote_id_lote]
   PRIMARY KEY
   CLUSTERED ([id_lote] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_orden_de_venta_id_orden'  AND sc.name = N'bd_genolab'  AND type in (N'PK'))
ALTER TABLE [bd_genolab].[orden_de_venta] DROP CONSTRAINT [PK_orden_de_venta_id_orden]
 GO



ALTER TABLE [bd_genolab].[orden_de_venta]
 ADD CONSTRAINT [PK_orden_de_venta_id_orden]
   PRIMARY KEY
   CLUSTERED ([id_orden] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_rol_id_rol'  AND sc.name = N'bd_genolab'  AND type in (N'PK'))
ALTER TABLE [bd_genolab].[rol] DROP CONSTRAINT [PK_rol_id_rol]
 GO



ALTER TABLE [bd_genolab].[rol]
 ADD CONSTRAINT [PK_rol_id_rol]
   PRIMARY KEY
   CLUSTERED ([id_rol] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_sucursal_id_sucursal'  AND sc.name = N'bd_genolab'  AND type in (N'PK'))
ALTER TABLE [bd_genolab].[sucursal] DROP CONSTRAINT [PK_sucursal_id_sucursal]
 GO



ALTER TABLE [bd_genolab].[sucursal]
 ADD CONSTRAINT [PK_sucursal_id_sucursal]
   PRIMARY KEY
   CLUSTERED ([id_sucursal] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_transaccion_id_transaccion'  AND sc.name = N'bd_genolab'  AND type in (N'PK'))
ALTER TABLE [bd_genolab].[transaccion] DROP CONSTRAINT [PK_transaccion_id_transaccion]
 GO



ALTER TABLE [bd_genolab].[transaccion]
 ADD CONSTRAINT [PK_transaccion_id_transaccion]
   PRIMARY KEY
   CLUSTERED ([id_transaccion] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_usuario_id_usuario'  AND sc.name = N'bd_genolab'  AND type in (N'PK'))
ALTER TABLE [bd_genolab].[usuario] DROP CONSTRAINT [PK_usuario_id_usuario]
 GO



ALTER TABLE [bd_genolab].[usuario]
 ADD CONSTRAINT [PK_usuario_id_usuario]
   PRIMARY KEY
   CLUSTERED ([id_usuario] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'articulo$id_articulo_UNIQUE'  AND sc.name = N'bd_genolab'  AND type in (N'UQ'))
ALTER TABLE [bd_genolab].[articulo] DROP CONSTRAINT [articulo$id_articulo_UNIQUE]
 GO



ALTER TABLE [bd_genolab].[articulo]
 ADD CONSTRAINT [articulo$id_articulo_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([id_articulo] ASC)

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'articulo$codigo_UNIQUE'  AND sc.name = N'bd_genolab'  AND type in (N'UQ'))
ALTER TABLE [bd_genolab].[articulo] DROP CONSTRAINT [articulo$codigo_UNIQUE]
 GO



ALTER TABLE [bd_genolab].[articulo]
 ADD CONSTRAINT [articulo$codigo_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([codigo] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'cliente$id_cliente_UNIQUE'  AND sc.name = N'bd_genolab'  AND type in (N'UQ'))
ALTER TABLE [bd_genolab].[cliente] DROP CONSTRAINT [cliente$id_cliente_UNIQUE]
 GO



ALTER TABLE [bd_genolab].[cliente]
 ADD CONSTRAINT [cliente$id_cliente_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([id_cliente] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'distrito$id_distrito_UNIQUE'  AND sc.name = N'bd_genolab'  AND type in (N'UQ'))
ALTER TABLE [bd_genolab].[distrito] DROP CONSTRAINT [distrito$id_distrito_UNIQUE]
 GO



ALTER TABLE [bd_genolab].[distrito]
 ADD CONSTRAINT [distrito$id_distrito_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([id_distrito] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'factura$id_factura_UNIQUE'  AND sc.name = N'bd_genolab'  AND type in (N'UQ'))
ALTER TABLE [bd_genolab].[factura] DROP CONSTRAINT [factura$id_factura_UNIQUE]
 GO



ALTER TABLE [bd_genolab].[factura]
 ADD CONSTRAINT [factura$id_factura_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([id_factura] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'forma_farmaceutica$id_ffarmaceutica_UNIQUE'  AND sc.name = N'bd_genolab'  AND type in (N'UQ'))
ALTER TABLE [bd_genolab].[forma_farmaceutica] DROP CONSTRAINT [forma_farmaceutica$id_ffarmaceutica_UNIQUE]
 GO



ALTER TABLE [bd_genolab].[forma_farmaceutica]
 ADD CONSTRAINT [forma_farmaceutica$id_ffarmaceutica_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([id_ffarmaceutica] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'laboratorio$id_laboratorio_UNIQUE'  AND sc.name = N'bd_genolab'  AND type in (N'UQ'))
ALTER TABLE [bd_genolab].[laboratorio] DROP CONSTRAINT [laboratorio$id_laboratorio_UNIQUE]
 GO



ALTER TABLE [bd_genolab].[laboratorio]
 ADD CONSTRAINT [laboratorio$id_laboratorio_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([id_laboratorio] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'lote$id_lote_UNIQUE'  AND sc.name = N'bd_genolab'  AND type in (N'UQ'))
ALTER TABLE [bd_genolab].[lote] DROP CONSTRAINT [lote$id_lote_UNIQUE]
 GO



ALTER TABLE [bd_genolab].[lote]
 ADD CONSTRAINT [lote$id_lote_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([id_lote] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'orden_de_venta$id_orden_UNIQUE'  AND sc.name = N'bd_genolab'  AND type in (N'UQ'))
ALTER TABLE [bd_genolab].[orden_de_venta] DROP CONSTRAINT [orden_de_venta$id_orden_UNIQUE]
 GO



ALTER TABLE [bd_genolab].[orden_de_venta]
 ADD CONSTRAINT [orden_de_venta$id_orden_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([id_orden] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'rol$id_rol_UNIQUE'  AND sc.name = N'bd_genolab'  AND type in (N'UQ'))
ALTER TABLE [bd_genolab].[rol] DROP CONSTRAINT [rol$id_rol_UNIQUE]
 GO



ALTER TABLE [bd_genolab].[rol]
 ADD CONSTRAINT [rol$id_rol_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([id_rol] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sucursal$iddireccion_UNIQUE'  AND sc.name = N'bd_genolab'  AND type in (N'UQ'))
ALTER TABLE [bd_genolab].[sucursal] DROP CONSTRAINT [sucursal$iddireccion_UNIQUE]
 GO



ALTER TABLE [bd_genolab].[sucursal]
 ADD CONSTRAINT [sucursal$iddireccion_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([id_sucursal] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'transaccion$id_transaccion_UNIQUE'  AND sc.name = N'bd_genolab'  AND type in (N'UQ'))
ALTER TABLE [bd_genolab].[transaccion] DROP CONSTRAINT [transaccion$id_transaccion_UNIQUE]
 GO



ALTER TABLE [bd_genolab].[transaccion]
 ADD CONSTRAINT [transaccion$id_transaccion_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([id_transaccion] ASC)

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'usuario$idusuario_UNIQUE'  AND sc.name = N'bd_genolab'  AND type in (N'UQ'))
ALTER TABLE [bd_genolab].[usuario] DROP CONSTRAINT [usuario$idusuario_UNIQUE]
 GO



ALTER TABLE [bd_genolab].[usuario]
 ADD CONSTRAINT [usuario$idusuario_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([id_usuario] ASC)

GO


USE bd_genolab
GO
IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'articulo'  AND sc.name = N'bd_genolab'  AND si.name = N'fk_articulo_ffarmaceutica_idx' AND so.type in (N'U'))
   DROP INDEX [fk_articulo_ffarmaceutica_idx] ON [bd_genolab].[articulo] 
GO
CREATE NONCLUSTERED INDEX [fk_articulo_ffarmaceutica_idx] ON [bd_genolab].[articulo]
(
   [id_ffarmaceutica] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE bd_genolab
GO
IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'sucursal'  AND sc.name = N'bd_genolab'  AND si.name = N'fk_direccion_cliente_idx' AND so.type in (N'U'))
   DROP INDEX [fk_direccion_cliente_idx] ON [bd_genolab].[sucursal] 
GO
CREATE NONCLUSTERED INDEX [fk_direccion_cliente_idx] ON [bd_genolab].[sucursal]
(
   [id_cliente] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE bd_genolab
GO
IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'sucursal'  AND sc.name = N'bd_genolab'  AND si.name = N'fk_direccion_distrito_idx' AND so.type in (N'U'))
   DROP INDEX [fk_direccion_distrito_idx] ON [bd_genolab].[sucursal] 
GO
CREATE NONCLUSTERED INDEX [fk_direccion_distrito_idx] ON [bd_genolab].[sucursal]
(
   [id_distrito] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE bd_genolab
GO
IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'factura'  AND sc.name = N'bd_genolab'  AND si.name = N'fk_factura_orden_idx' AND so.type in (N'U'))
   DROP INDEX [fk_factura_orden_idx] ON [bd_genolab].[factura] 
GO
CREATE NONCLUSTERED INDEX [fk_factura_orden_idx] ON [bd_genolab].[factura]
(
   [id_orden] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE bd_genolab
GO
IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'lote'  AND sc.name = N'bd_genolab'  AND si.name = N'fk_lote_articulo_idx' AND so.type in (N'U'))
   DROP INDEX [fk_lote_articulo_idx] ON [bd_genolab].[lote] 
GO
CREATE NONCLUSTERED INDEX [fk_lote_articulo_idx] ON [bd_genolab].[lote]
(
   [id_articulo] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE bd_genolab
GO
IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'lote'  AND sc.name = N'bd_genolab'  AND si.name = N'fk_lote_laboratorio_idx' AND so.type in (N'U'))
   DROP INDEX [fk_lote_laboratorio_idx] ON [bd_genolab].[lote] 
GO
CREATE NONCLUSTERED INDEX [fk_lote_laboratorio_idx] ON [bd_genolab].[lote]
(
   [id_laboratorio] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE bd_genolab
GO
IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'orden_de_venta'  AND sc.name = N'bd_genolab'  AND si.name = N'fk_orden_sucursal_idx' AND so.type in (N'U'))
   DROP INDEX [fk_orden_sucursal_idx] ON [bd_genolab].[orden_de_venta] 
GO
CREATE NONCLUSTERED INDEX [fk_orden_sucursal_idx] ON [bd_genolab].[orden_de_venta]
(
   [id_sucursal] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE bd_genolab
GO
IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'orden_de_venta'  AND sc.name = N'bd_genolab'  AND si.name = N'fk_orden_usuario_idx' AND so.type in (N'U'))
   DROP INDEX [fk_orden_usuario_idx] ON [bd_genolab].[orden_de_venta] 
GO
CREATE NONCLUSTERED INDEX [fk_orden_usuario_idx] ON [bd_genolab].[orden_de_venta]
(
   [id_usuario] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE bd_genolab
GO
IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'transaccion'  AND sc.name = N'bd_genolab'  AND si.name = N'fk_transaccion_lote_idx' AND so.type in (N'U'))
   DROP INDEX [fk_transaccion_lote_idx] ON [bd_genolab].[transaccion] 
GO
CREATE NONCLUSTERED INDEX [fk_transaccion_lote_idx] ON [bd_genolab].[transaccion]
(
   [id_lote] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE bd_genolab
GO
IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'transaccion'  AND sc.name = N'bd_genolab'  AND si.name = N'fk_transaccion_orden_idx' AND so.type in (N'U'))
   DROP INDEX [fk_transaccion_orden_idx] ON [bd_genolab].[transaccion] 
GO
CREATE NONCLUSTERED INDEX [fk_transaccion_orden_idx] ON [bd_genolab].[transaccion]
(
   [id_orden] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE bd_genolab
GO
IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'usuario'  AND sc.name = N'bd_genolab'  AND si.name = N'fk_usuario_rol_idx' AND so.type in (N'U'))
   DROP INDEX [fk_usuario_rol_idx] ON [bd_genolab].[usuario] 
GO
CREATE NONCLUSTERED INDEX [fk_usuario_rol_idx] ON [bd_genolab].[usuario]
(
   [id_rol] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'articulo$fk_articulo_ffarmaceutica'  AND sc.name = N'bd_genolab'  AND type in (N'F'))
ALTER TABLE [bd_genolab].[articulo] DROP CONSTRAINT [articulo$fk_articulo_ffarmaceutica]
 GO



ALTER TABLE [bd_genolab].[articulo]
 ADD CONSTRAINT [articulo$fk_articulo_ffarmaceutica]
 FOREIGN KEY 
   ([id_ffarmaceutica])
 REFERENCES 
   [bd_genolab].[bd_genolab].[forma_farmaceutica]     ([id_ffarmaceutica])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'factura$fk_factura_orden'  AND sc.name = N'bd_genolab'  AND type in (N'F'))
ALTER TABLE [bd_genolab].[factura] DROP CONSTRAINT [factura$fk_factura_orden]
 GO



ALTER TABLE [bd_genolab].[factura]
 ADD CONSTRAINT [factura$fk_factura_orden]
 FOREIGN KEY 
   ([id_orden])
 REFERENCES 
   [bd_genolab].[bd_genolab].[orden_de_venta]     ([id_orden])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'lote$fk_lote_articulo'  AND sc.name = N'bd_genolab'  AND type in (N'F'))
ALTER TABLE [bd_genolab].[lote] DROP CONSTRAINT [lote$fk_lote_articulo]
 GO



ALTER TABLE [bd_genolab].[lote]
 ADD CONSTRAINT [lote$fk_lote_articulo]
 FOREIGN KEY 
   ([id_articulo])
 REFERENCES 
   [bd_genolab].[bd_genolab].[articulo]     ([id_articulo])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'lote$fk_lote_laboratorio'  AND sc.name = N'bd_genolab'  AND type in (N'F'))
ALTER TABLE [bd_genolab].[lote] DROP CONSTRAINT [lote$fk_lote_laboratorio]
 GO



ALTER TABLE [bd_genolab].[lote]
 ADD CONSTRAINT [lote$fk_lote_laboratorio]
 FOREIGN KEY 
   ([id_laboratorio])
 REFERENCES 
   [bd_genolab].[bd_genolab].[laboratorio]     ([id_laboratorio])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'orden_de_venta$fk_orden_sucursal'  AND sc.name = N'bd_genolab'  AND type in (N'F'))
ALTER TABLE [bd_genolab].[orden_de_venta] DROP CONSTRAINT [orden_de_venta$fk_orden_sucursal]
 GO



ALTER TABLE [bd_genolab].[orden_de_venta]
 ADD CONSTRAINT [orden_de_venta$fk_orden_sucursal]
 FOREIGN KEY 
   ([id_sucursal])
 REFERENCES 
   [bd_genolab].[bd_genolab].[sucursal]     ([id_sucursal])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'orden_de_venta$fk_orden_usuario'  AND sc.name = N'bd_genolab'  AND type in (N'F'))
ALTER TABLE [bd_genolab].[orden_de_venta] DROP CONSTRAINT [orden_de_venta$fk_orden_usuario]
 GO



ALTER TABLE [bd_genolab].[orden_de_venta]
 ADD CONSTRAINT [orden_de_venta$fk_orden_usuario]
 FOREIGN KEY 
   ([id_usuario])
 REFERENCES 
   [bd_genolab].[bd_genolab].[usuario]     ([id_usuario])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sucursal$fk_sucursal_cliente'  AND sc.name = N'bd_genolab'  AND type in (N'F'))
ALTER TABLE [bd_genolab].[sucursal] DROP CONSTRAINT [sucursal$fk_sucursal_cliente]
 GO



ALTER TABLE [bd_genolab].[sucursal]
 ADD CONSTRAINT [sucursal$fk_sucursal_cliente]
 FOREIGN KEY 
   ([id_cliente])
 REFERENCES 
   [bd_genolab].[bd_genolab].[cliente]     ([id_cliente])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sucursal$fk_sucursal_distrito'  AND sc.name = N'bd_genolab'  AND type in (N'F'))
ALTER TABLE [bd_genolab].[sucursal] DROP CONSTRAINT [sucursal$fk_sucursal_distrito]
 GO



ALTER TABLE [bd_genolab].[sucursal]
 ADD CONSTRAINT [sucursal$fk_sucursal_distrito]
 FOREIGN KEY 
   ([id_distrito])
 REFERENCES 
   [bd_genolab].[bd_genolab].[distrito]     ([id_distrito])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'transaccion$fk_transaccion_lote'  AND sc.name = N'bd_genolab'  AND type in (N'F'))
ALTER TABLE [bd_genolab].[transaccion] DROP CONSTRAINT [transaccion$fk_transaccion_lote]
 GO



ALTER TABLE [bd_genolab].[transaccion]
 ADD CONSTRAINT [transaccion$fk_transaccion_lote]
 FOREIGN KEY 
   ([id_lote])
 REFERENCES 
   [bd_genolab].[bd_genolab].[lote]     ([id_lote])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'transaccion$fk_transaccion_orden'  AND sc.name = N'bd_genolab'  AND type in (N'F'))
ALTER TABLE [bd_genolab].[transaccion] DROP CONSTRAINT [transaccion$fk_transaccion_orden]
 GO



ALTER TABLE [bd_genolab].[transaccion]
 ADD CONSTRAINT [transaccion$fk_transaccion_orden]
 FOREIGN KEY 
   ([id_orden])
 REFERENCES 
   [bd_genolab].[bd_genolab].[orden_de_venta]     ([id_orden])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE bd_genolab
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'usuario$fk_usuario_rol'  AND sc.name = N'bd_genolab'  AND type in (N'F'))
ALTER TABLE [bd_genolab].[usuario] DROP CONSTRAINT [usuario$fk_usuario_rol]
 GO



ALTER TABLE [bd_genolab].[usuario]
 ADD CONSTRAINT [usuario$fk_usuario_rol]
 FOREIGN KEY 
   ([id_rol])
 REFERENCES 
   [bd_genolab].[bd_genolab].[rol]     ([id_rol])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE bd_genolab
GO
ALTER TABLE  [bd_genolab].[articulo]
 ADD DEFAULT NULL FOR [concentracion]
GO

ALTER TABLE  [bd_genolab].[articulo]
 ADD DEFAULT 0x1 FOR [activo]
GO


USE bd_genolab
GO
ALTER TABLE  [bd_genolab].[cliente]
 ADD DEFAULT NULL FOR [email]
GO

ALTER TABLE  [bd_genolab].[cliente]
 ADD DEFAULT 0x1 FOR [activo]
GO


USE bd_genolab
GO
ALTER TABLE  [bd_genolab].[distrito]
 ADD DEFAULT 0x1 FOR [activo]
GO


USE bd_genolab
GO
ALTER TABLE  [bd_genolab].[factura]
 ADD DEFAULT 0x1 FOR [activo]
GO


USE bd_genolab
GO
ALTER TABLE  [bd_genolab].[forma_farmaceutica]
 ADD DEFAULT 0x1 FOR [activo]
GO


USE bd_genolab
GO
ALTER TABLE  [bd_genolab].[laboratorio]
 ADD DEFAULT 0x1 FOR [activo]
GO


USE bd_genolab
GO
ALTER TABLE  [bd_genolab].[lote]
 ADD DEFAULT 0x1 FOR [activo]
GO


USE bd_genolab
GO
ALTER TABLE  [bd_genolab].[orden_de_venta]
 ADD DEFAULT NULL FOR [importe_total]
GO

ALTER TABLE  [bd_genolab].[orden_de_venta]
 ADD DEFAULT NULL FOR [numero_orden]
GO


USE bd_genolab
GO
ALTER TABLE  [bd_genolab].[rol]
 ADD DEFAULT 0x1 FOR [activo]
GO


USE bd_genolab
GO
ALTER TABLE  [bd_genolab].[sucursal]
 ADD DEFAULT 0x1 FOR [activo]
GO


USE bd_genolab
GO
ALTER TABLE  [bd_genolab].[usuario]
 ADD DEFAULT NULL FOR [email]
GO

ALTER TABLE  [bd_genolab].[usuario]
 ADD DEFAULT NULL FOR [fecha_nacimiento]
GO

ALTER TABLE  [bd_genolab].[usuario]
 ADD DEFAULT NULL FOR [foto]
GO

ALTER TABLE  [bd_genolab].[usuario]
 ADD DEFAULT 0x1 FOR [activo]
GO

