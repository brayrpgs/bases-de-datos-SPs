-- =============================================
CREATE PROCEDURE sp_DeleteSecurity
    @IdSecurity INT,
    @IsDeleted BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Security WHERE IdSecurity = @IdSecurity)
    BEGIN
        SET @IsDeleted = 0; -- No se encontró el registro
    END
    ELSE
    BEGIN
        DELETE FROM Security WHERE IdSecurity = @IdSecurity;

        IF @@ROWCOUNT > 0
        BEGIN
            SET @IsDeleted = 1; -- Registro eliminado correctamente
        END
        ELSE
        BEGIN
            SET @IsDeleted = 0; -- No se pudo eliminar el registro
        END
    END
END
GO

DECLARE @IsDeleted BIT;

EXEC sp_DeleteSecurity
    @IdSecurity = 2, -- Reemplaza con el IdSecurity que desees eliminar
    @IsDeleted = @IsDeleted OUTPUT;

SELECT @IsDeleted AS IsDeleted;

SELECT * FROM SECURITY