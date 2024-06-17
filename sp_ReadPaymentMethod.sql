-- Crear procedimiento almacenado para leer información de PaymentMethod
CREATE PROCEDURE sp_ReadPaymentMethods
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Consulta para seleccionar todos los registros de PaymentMethod
    SELECT PaymentMethod_Id, PaymentMethodName
    FROM PaymentMethod;
END;