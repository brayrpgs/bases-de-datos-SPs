GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:    <ceasar>
-- Create date: <Fecha>
-- Description: Obtener datos de la tabla Security
-- =============================================
CREATE PROCEDURE sp_GetSecurityData
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        IdSecurity,
        IdClient,
        Email,
        Password,
        TypeUser
    FROM
        Security;
END
GO

EXEC sp_GetSecurityData;