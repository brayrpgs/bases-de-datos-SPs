-- Crear procedimiento almacenado para leer informaci�n de PaymentMethod
CREATE PROCEDURE sp_ReadPaymentMethods
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Consulta para seleccionar todos los registros de PaymentMethod
    SELECT PaymentMethod_Id, PaymentMethodName
    FROM PaymentMethod;
END;