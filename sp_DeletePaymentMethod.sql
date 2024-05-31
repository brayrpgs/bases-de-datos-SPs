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
CREATE PROCEDURE sp_DeletePaymentMethod
    @IdToDelete INT,
    @IsDeleted BIT OUTPUT
AS
BEGIN
    -- Verificar si el registro deseado existe
    IF NOT EXISTS (SELECT 1 FROM PaymentMethod WHERE PaymentMethod_Id = @IdToDelete)
    BEGIN
        -- No se puede eliminar, porque el método de pago no existe
        SET @IsDeleted = 0;
    END
    ELSE
    BEGIN
        -- Eliminar el método de pago
        DELETE FROM PaymentMethod WHERE PaymentMethod_Id = @IdToDelete;

        -- Verificar si el registro fue eliminado correctamente
        IF @@ROWCOUNT > 0
        BEGIN
            -- El método de pago fue eliminado correctamente
            SET @IsDeleted = 1;
        END
        ELSE
        BEGIN
            -- No se pudo eliminar el método de pago
            SET @IsDeleted = 0;
        END
    END
END