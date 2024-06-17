-- Crear procedimiento almacenado para leer todos los pagos
CREATE PROCEDURE sp_ReadPayments
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Consulta para seleccionar todos los pagos
    SELECT Payment_Id, Order_Id, PaymentDate, Amount, PaymentStatus, PaymentMethod_Id
    FROM Payment;
END;