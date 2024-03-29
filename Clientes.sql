USE [Clientes]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 25/01/2024 6:02:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Cedula] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Telefono] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[PutClientePrueba]    Script Date: 25/01/2024 6:02:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PutClientePrueba]

@Cedula int = 0,
@nombre varchar(100) = '',
@Direccion varchar(100) = '',
@Telefono int = 0,
@option int = 1

AS
BEGIN	
	SET NOCOUNT ON;

	-- Opcion consulta
	IF (@option = 1 )
	BEGIN
		SELECT	*
		FROM	dbo.Clientes
	END

	-- Opcion insertar
	IF (@option = 2)
	BEGIN
		IF EXISTS(SELECT 1 FROM dbo.Clientes WHERE	Cedula = @Cedula)
		BEGIN 
			UPDATE	dbo.Clientes
			SET		Nombre = @nombre,
					Direccion = @Direccion,
					Telefono = @Telefono
			WHERE	Cedula = @Cedula
			
		END
		ELSE
		BEGIN
			INSERT INTO dbo.Clientes (Cedula, Nombre, Direccion, Telefono)
			VALUES (@Cedula, @nombre ,@Direccion, @Telefono)
		END		
	END

	-- Opcion actualizar
	IF (@option = 3)
	BEGIN
		UPDATE	dbo.Clientes
		SET		Nombre = @nombre,
				Direccion = @Direccion,
				Telefono = @Telefono
		WHERE	Cedula = @Cedula
	END

	-- Opcion eliminar
	IF (@option = 3)
	BEGIN
		DELETE 
		FROM	dbo.Clientes		
		WHERE	Cedula = @Cedula
	END
    
END
GO
