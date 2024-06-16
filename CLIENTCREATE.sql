GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:    <Ceasar Calvo>
-- Create date:  <6/3/24>
-- Description:  <CRUD CLIENT>
-- =============================================
ALTER PROCEDURE SP_CreateClient
    @nameProvince NVARCHAR(20),
    @street NVARCHAR(100),
    @name NVARCHAR(100),
    @lastName NVARCHAR(100),
    @secondLastName NVARCHAR(100),
    @phone INT,
    @ERROR INT OUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
        
        DECLARE @IdProvince INT;
        DECLARE @IdAddress INT;
        DECLARE @IdPerson INT;
        DECLARE @IdClient INT;

        -- Verificar si la provincia ya existe
        SELECT @IdProvince = IdProvince
        FROM Province
        WHERE nameProvince = @nameProvince;

        -- Insertar en la tabla Province si no existe
        IF @IdProvince IS NULL
        BEGIN
            INSERT INTO Province (nameProvince)
            VALUES (@nameProvince);
            SET @IdProvince = SCOPE_IDENTITY();
        END

        -- Insertar en la tabla Address
        INSERT INTO Address (street, IdProvince)
        VALUES (@street, @IdProvince);
        SET @IdAddress = SCOPE_IDENTITY();

        -- Insertar en la tabla Person
        INSERT INTO Person (name, lastName, secondLastName, IdAddress)
        VALUES (@name, @lastName, @secondLastName, @IdAddress);
        SET @IdPerson = SCOPE_IDENTITY();

        -- Insertar en la tabla Client
        INSERT INTO Client (IdPerson)
        VALUES (@IdPerson);
        SET @IdClient = SCOPE_IDENTITY();

        -- Insertar en la tabla Phone
        INSERT INTO Phone (phone, IdPerson)
        VALUES (@phone, @IdPerson);

        -- Insertar en la tabla ShoppingHistory
        INSERT INTO ShoppingHistory (IdClient)
        VALUES (@IdClient);

        COMMIT TRANSACTION;
        SET @ERROR = 0; -- Éxito
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @ERROR = ERROR_NUMBER();
    END CATCH
END
GO



-- Ejemplo de ejecución del procedimiento almacenado
DECLARE @ERROR INT;

EXEC SP_CreateClient
    @nameProvince = 'San Jose',
    @street = '123 Main St',
    @name = 'John',
    @lastName = 'Doe',
    @secondLastName = 'Smith',
    @phone = 1452349,
    @ERROR = @ERROR OUTPUT;

SELECT @ERROR AS ErrorCode;
select * from Address

