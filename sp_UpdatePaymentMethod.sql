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
CREATE PROCEDURE sp_UpdatePaymentMethod
	@IdToUpdate INT,
    @PaymentMethodName VARCHAR(50),
    @IdToReturn INT OUTPUT
AS
BEGIN
    -- Verificar si el registro deseado existe
    IF NOT EXISTS (SELECT 1 FROM PaymentMethod WHERE PaymentMethod_Id = @IdToUpdate)
    BEGIN
        -- No se puede actualizar, el método de pago no existe
        SET @IdToReturn = 0;
    END
    ELSE
    BEGIN
        -- Verificar si el nombre ya existe para otro registro diferente al actual
        IF EXISTS (SELECT 1 FROM PaymentMethod WHERE PaymentMethodName = @PaymentMethodName AND PaymentMethod_Id <> @IdToUpdate)
        BEGIN
            -- No se puede actualizar, el nombre ya existe para otro registro
            SET @IdToReturn = 0;
        END
        ELSE
        BEGIN
            -- Actualizar el método de pago existente
            UPDATE PaymentMethod
            SET PaymentMethodName = @PaymentMethodName
            WHERE PaymentMethod_Id = @IdToUpdate;

            -- Devolver el ID del método de pago actualizado
            SET @IdToReturn = @IdToUpdate;
        END
    END
END