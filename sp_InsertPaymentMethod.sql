USE [pagosKendallV01] --Cambiar al acoplar
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Kendall>
-- Create date: <Create, 31/05/2024>
-- Description:	<Description, sp>
-- =============================================
CREATE PROCEDURE sp_InsertPaymentMethod
    @PaymentMethodName VARCHAR(50),
    @IdToReturn INT OUTPUT
AS
BEGIN
    BEGIN TRY
        -- Intentar insertar un nuevo método de pago
        INSERT INTO PaymentMethod (PaymentMethodName)
        VALUES (@PaymentMethodName);
        
        -- Si se llega a este punto, la inserción fue exitosa
        SET @IdToReturn = SCOPE_IDENTITY();
    END TRY
    BEGIN CATCH
        -- Capturar el error y devolver el ID 0 para indicar un nombre repetido y la no inserccion
        SET @IdToReturn = 0;
    END CATCH
END

