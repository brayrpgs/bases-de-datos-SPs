GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ceasar Calvo>
-- Create date: <6/3/24>
-- Description:	<CRUD CLIENT>
-- =============================================
CREATE PROCEDURE sp_UpdateClientDetails
    @IdClient INT,
    @Name NVARCHAR(100),
    @LastName NVARCHAR(100),
    @SecondLastName NVARCHAR(100),
    @Phone INT,
    @Street NVARCHAR(100),
    @IdProvince INT,
    @IdToReturn INT OUTPUT
AS
BEGIN
    DECLARE @IdPerson INT
    DECLARE @IdPhone INT
    DECLARE @IdAddress INT
    
    -- Verificar si el cliente existe
    IF NOT EXISTS (SELECT 1 FROM Client WHERE IdClient = @IdClient)
    BEGIN
        -- No se puede actualizar, el cliente no existe
        SET @IdToReturn = 0;
        RETURN;
    END
    
    -- Obtener IdPerson del cliente
    SELECT @IdPerson = IdPerson FROM Client WHERE IdClient = @IdClient;
    
    -- Verificar si la persona existe
    IF NOT EXISTS (SELECT 1 FROM Person WHERE IdPerson = @IdPerson)
    BEGIN
        -- No se puede actualizar, la persona no existe
        SET @IdToReturn = 0;
        RETURN;
    END
    
    -- Obtener IdPhone e IdAddress de la persona
    SELECT @IdPhone = IdPhone, @IdAddress = IdAddress FROM Person WHERE IdPerson = @IdPerson;
    
    -- Verificar si el nuevo número de teléfono ya existe para otro registro
    IF EXISTS (SELECT 1 FROM Phone WHERE phone = @Phone AND IdPhone <> @IdPhone)
    BEGIN
        -- No se puede actualizar, el número de teléfono ya existe para otro registro
        SET @IdToReturn = 0;
        RETURN;
    END
    
    -- Verificar si el nuevo nombre de calle ya existe para otro registro
    IF EXISTS (SELECT 1 FROM Address WHERE street = @Street AND IdAddress <> @IdAddress)
    BEGIN
        -- No se puede actualizar, el nombre de la calle ya existe para otro registro
        SET @IdToReturn = 0;
        RETURN;
    END
    
    -- Actualizar la información de la persona
    UPDATE Person
    SET name = @Name, lastName = @LastName, secondLastName = @SecondLastName
    WHERE IdPerson = @IdPerson;
    
    -- Actualizar el teléfono
    UPDATE Phone
    SET phone = @Phone
    WHERE IdPhone = @IdPhone;
    
    -- Actualizar la dirección
    UPDATE Address
    SET street = @Street, IdProvince = @IdProvince
    WHERE IdAddress = @IdAddress;
    
    -- Devolver el ID del cliente actualizado
    SET @IdToReturn = @IdClient;
END
GO

DECLARE @ReturnId INT;

EXEC sp_UpdateClientDetails
    @IdClient = 2, -- ID del cliente que deseas actualizar
    @Name = 'Bryan',
    @LastName = 'Rosales',
    @SecondLastName = 'Perez',
    @Phone = 123456789,
    @Street = 'La victoria',
    @IdProvince = 2, -- ID de la provincia actualizada
    @IdToReturn = @ReturnId OUTPUT;

-- Verifica el valor de @ReturnId para ver si la actualización fue exitosa
SELECT @ReturnId;

