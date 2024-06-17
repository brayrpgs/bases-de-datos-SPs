-- Procedimiento almacenado para leer todas las transacciones de pago
CREATE PROCEDURE sp_ReadPaymentTransactions
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Consulta para seleccionar todas las transacciones de pago
    SELECT Transaction_Id, Payment_Id, TransactionDate, TransactionAmount, TransactionStatus
    FROM PaymentTransaction;
END;
GO