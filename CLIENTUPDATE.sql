GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:    Ceasar Calvo
-- Create date: 6/3/24
-- Description: CRUD CLIENT
-- =============================================
alter PROCEDURE sp_UpdateClientDetails
    @IdClient INT,
    @Name NVARCHAR(100),
    @LastName NVARCHAR(100),
    @SecondLastName NVARCHAR(100),
    @Phone INT,
    @Street NVARCHAR(100),
    @ProvinceName NVARCHAR(20),
    @IdToReturn INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Declaración de variables
    DECLARE @IdPerson INT;
    DECLARE @IdAddress INT;
    DECLARE @IdProvince INT;
    DECLARE @IdPhoneToUpdate INT;

    -- Validación de datos de entrada
    IF @Name IS NULL OR @LastName IS NULL OR @SecondLastName IS NULL OR @Phone IS NULL OR @Street IS NULL OR @ProvinceName IS NULL
    BEGIN
        RAISERROR('Los datos de entrada no pueden ser nulos', 16, 1);
        RETURN;
    END

    -- Verificar si el cliente existe
    IF NOT EXISTS (SELECT 1 FROM Client WHERE IdClient = @IdClient)
    BEGIN
        RAISERROR('El cliente no existe', 16, 1);
        RETURN;
    END

    -- Obtener IdPerson, IdAddress y IdPhone del cliente
    SELECT @IdPerson = p.IdPerson, @IdAddress = p.IdAddress, @IdPhoneToUpdate = ph.IdPhone
    FROM Client c
    JOIN Person p ON c.IdPerson = p.IdPerson
    LEFT JOIN Phone ph ON p.IdPerson = ph.IdPerson
    WHERE c.IdClient = @IdClient;

    -- Verificar si la persona existe
    IF @IdPerson IS NULL
    BEGIN
        RAISERROR('La persona asociada al cliente no existe', 16, 1);
        RETURN;
    END

    -- Obtener IdProvince a partir del nombre de la provincia o crear una nueva provincia
    SELECT @IdProvince = IdProvince FROM Province WHERE nameProvince = @ProvinceName;

    IF @IdProvince IS NULL
    BEGIN
        INSERT INTO Province (nameProvince)
        VALUES (@ProvinceName);

        SET @IdProvince = SCOPE_IDENTITY();
    END

    -- Verificar si el nuevo número de teléfono ya existe para otro registro
    IF EXISTS (SELECT 1 FROM Phone WHERE phone = @Phone AND IdPhone <> @IdPhoneToUpdate)
    BEGIN
        RAISERROR('El número de teléfono ya existe para otro registro', 16, 1);
        RETURN;
    END

    -- Verificar si el nuevo nombre de calle ya existe para otro registro en la misma provincia
    IF EXISTS (SELECT 1 FROM Address WHERE street = @Street AND IdProvince = @IdProvince AND IdAddress <> @IdAddress)
    BEGIN
        RAISERROR('El nombre de la calle ya existe para otro registro en la misma provincia', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION
    BEGIN TRY
        -- Actualizar la información de la persona
        UPDATE Person
        SET name = @Name, lastName = @LastName, secondLastName = @SecondLastName
        WHERE IdPerson = @IdPerson;

        -- Actualizar el teléfono
        IF @IdPhoneToUpdate IS NOT NULL
        BEGIN
            UPDATE Phone
            SET phone = @Phone
            WHERE IdPhone = @IdPhoneToUpdate;
        END
        ELSE
        BEGIN
            INSERT INTO Phone (phone, IdPerson)
            VALUES (@Phone, @IdPerson);
        END

        -- Actualizar la dirección
        UPDATE Address
        SET street = @Street, IdProvince = @IdProvince
        WHERE IdAddress = @IdAddress;

        -- Devolver el ID del cliente actualizado
        SET @IdToReturn = @IdClient;

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('Error al actualizar los datos del cliente', 16, 1);
        RETURN;
    END CATCH
END
GO

-- Declara una variable para almacenar el resultado del procedimiento
DECLARE @IdToReturn INT;

-- Ejemplo de ejecución del procedimiento almacenado
EXEC sp_UpdateClientDetails
    @IdClient = 3, -- ID del cliente que deseas actualizar (asegúrate de que exista en la base de datos)
    @Name = 'John Updated',
    @LastName = 'Doe Updated',
    @SecondLastName = 'Smith Updated',
    @Phone = 9821,
    @Street = '456 New St',
    @ProvinceName = 'Alajuela', -- Nombre de la provincia a actualizar
    @IdToReturn = @IdToReturn OUTPUT;

-- Verifica el resultado del procedimiento
SELECT @IdToReturn AS UpdatedClientId;






select * from Province	
