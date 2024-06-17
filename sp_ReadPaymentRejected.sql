-- Procedimiento almacenado para leer todos los pagos rechazados
CREATE PROCEDURE sp_ReadPaymentRejected
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Consulta para seleccionar todos los pagos rechazados
    SELECT PaymentRejected_Id, Payment_Id
    FROM PaymentRejected;
END;
GO