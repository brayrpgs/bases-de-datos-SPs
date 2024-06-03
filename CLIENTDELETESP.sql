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
CREATE PROCEDURE sp_DeleteClient
    @IdToDelete INT,
    @IsDeleted BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    
    IF NOT EXISTS (SELECT 1 FROM Client WHERE IdClient = @IdToDelete)
    BEGIN
       
        SET @IsDeleted = 0;
    END
    ELSE
    BEGIN
      
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
    @IdToDelete = 1,
    @IsDeleted = @IsDeleted OUTPUT;


SELECT @IsDeleted AS IsDeleted;

select * from Client
select * from Address
