GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:    <ceasar>
-- Create date: <Fecha>
-- Description: Actualizar detalles de seguridad
-- =============================================
ALTER PROCEDURE sp_UpdateSecurityDetails
    @IdSecurity INT,
    @IdClient INT = NULL,
    @Email NVARCHAR(255),
    @Password NVARCHAR(255),
    @TypeUser TINYINT,
    @Error INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Inicializar el código de error
    SET @Error = 0;

    -- Verificar si el registro existe
    IF NOT EXISTS (SELECT 1 FROM Security WHERE IdSecurity = @IdSecurity)
    BEGIN
        SET @Error = 50001; -- El registro de seguridad no existe
        RETURN;
    END

    -- Verificar si el correo electrónico ya está en uso por otro registro
    IF EXISTS (SELECT 1 FROM Security WHERE Email = @Email AND IdSecurity <> @IdSecurity)
    BEGIN
        SET @Error = 50002; -- El correo electrónico ya está en uso por otro registro
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Actualizar los datos del registro
        UPDATE Security
        SET IdClient = @IdClient,
            Email = @Email,
            Password = @Password,
            TypeUser = @TypeUser
        WHERE IdSecurity = @IdSecurity;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @Error = ERROR_NUMBER(); -- Asignar el código de error de SQL Server
    END CATCH
END
GO
DECLARE @Error INT;

EXEC sp_UpdateSecurityDetails
    @IdSecurity = 3, -- Reemplaza con el IdSecurity que deseas actualizar
    @IdClient = 5, -- Reemplaza con el IdClient correspondiente (puede ser NULL)
    @Email = 'nuevo@correo.com',
    @Password = 'nuevacontraseña',
    @TypeUser = 0, -- 0 para administrador, 1 para usuario regular
    @Error = @Error OUTPUT;

IF @Error = 0
    PRINT 'Actualización exitosa';
ELSE
    PRINT 'Error al actualizar los detalles de seguridad. Código de error: ' + CAST(@Error AS VARCHAR(10));

	SELECT * FROM SECURITY