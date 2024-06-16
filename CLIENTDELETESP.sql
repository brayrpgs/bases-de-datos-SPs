GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ceasar Calvo>
-- Create date: <6/2/24>
-- Description:	<CRUD CLIENT>
-- =============================================
ALTER PROCEDURE sp_DeleteClient
    @IdToDelete INT,
    @IsDeleted BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @IdPerson INT;
    DECLARE @IdAddress INT;
    
    -- Obtener el IdPerson correspondiente al IdClient
    SELECT @IdPerson = IdPerson FROM Client WHERE IdClient = @IdToDelete;
    
    IF NOT EXISTS (SELECT 1 FROM Client WHERE IdClient = @IdToDelete)
    BEGIN
        SET @IsDeleted = 0;
    END
    ELSE
    BEGIN
        -- Obtener el IdAddress correspondiente al IdPerson
        SELECT @IdAddress = IdAddress FROM Person WHERE IdPerson = @IdPerson;
        
        -- Eliminar el registro de la tabla Address
        DELETE FROM Address WHERE IdAddress = @IdAddress;
        
        -- Eliminar el registro de la tabla Person
        DELETE FROM Person WHERE IdPerson = @IdPerson;
        
        -- Eliminar el registro de la tabla Client
        DELETE FROM Client WHERE IdClient = @IdToDelete;
        
        IF @@ROWCOUNT > 0
        BEGIN
            SET @IsDeleted = 1;
        END
        ELSE
        BEGIN
            SET @IsDeleted = 0;
        END
    END
END
GO

DECLARE @IsDeleted BIT;

EXEC sp_DeleteClient
    @IdToDelete = 3,
    @IsDeleted = @IsDeleted OUTPUT;


SELECT @IsDeleted AS IsDeleted;

select * from ShoppingHistory
select * from Province
