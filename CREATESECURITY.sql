GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:    <CEASAR>
-- Create date: <6/17/2024>
-- Description: <CRUD Security>
-- =============================================
alter PROCEDURE SP_CreateSecurity
    @IdClient INT = NULL, -- Permitir valor nulo
    @Email NVARCHAR(255),
    @Password NVARCHAR(255),
    @TypeUser TINYINT,
    @ERROR INT OUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar si ya existe un registro con el mismo correo electrónico
        IF EXISTS (SELECT 1 FROM Security WHERE Email = @Email)
        BEGIN
            SET @ERROR = 2; -- Correo electrónico duplicado
            RAISERROR ('Ya existe un registro con el mismo correo electrónico.', 16, 1);
            RETURN;
        END

        -- Insertar en la tabla Security
        INSERT INTO Security (IdClient, Email, Password, TypeUser)
        VALUES (@IdClient, @Email, @Password, @TypeUser);

        COMMIT TRANSACTION;
        SET @ERROR = 0; -- Éxito
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @ERROR = ERROR_NUMBER();
    END CATCH
END
GO

DECLARE @ERROR INT;

EXEC SP_CreateSecurity
    @IdClient = 5, -- Reemplaza con el IdClient correspondiente
    @Email = 'ejjjJjeeemplwWWwwwo@ejemploo.com',
    @Password = 'contraseña123',
    @TypeUser = 0, -- 0 para administrador, 1 para usuario regular
    @ERROR = @ERROR OUTPUT;

SELECT @ERROR AS ErrorCode;

select * from security