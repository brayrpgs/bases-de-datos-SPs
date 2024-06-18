GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:    <ceasar>
-- Create date: <Fecha>
-- Description: Obtener registro de Security por correo y contrase�a
-- =============================================
CREATE PROCEDURE sp_GetSecurityByEmailAndPassword
    @Email NVARCHAR(255),
    @Password NVARCHAR(255),
    @Error INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Inicializar el c�digo de error
    SET @Error = 0;

    -- Buscar el registro por correo electr�nico y contrase�a
    SELECT
        IdSecurity,
        IdClient,
        Email,
        Password,
        TypeUser
    FROM
        Security
    WHERE
        Email = @Email
        AND Password = @Password;

    -- Verificar si se encontr� el registro
    IF @@ROWCOUNT = 0
    BEGIN
        SET @Error = 50001; -- No se encontr� el registro
    END
END
GO

DECLARE @Error INT;

EXEC sp_GetSecurityByEmailAndPassword
    @Email = 'nuevo@correo.com',
    @Password = 'nuevacontrase�a',
    @Error = @Error OUTPUT;

IF @Error = 0
BEGIN
    -- Se encontr� el registro, puedes procesar los datos aqu�
    PRINT 'Registro encontrado';
END
ELSE
BEGIN
    PRINT 'No se encontr� el registro. C�digo de error: ' + CAST(@Error AS VARCHAR(10));
END
SELECT *FROM SECURITY