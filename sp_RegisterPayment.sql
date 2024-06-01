--Creacion de un pago dentro de la aplicacion
CREATE PROCEDURE sp_RegisterPayment
	
	@Order_Id INT,
	@Amount DECIMAL(10,2),
	@PaymentMethod_Id INT,
	@PaymentGenerated INT OUTPUT,
	@Message VARCHAR(100) OUTPUT

AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION 
	
	BEGIN TRY	
		
		--Obtenemos la fecha actual
		DECLARE @StartDate DATETIME = GETDATE();

		-- Insertamos en la tabla de pagos, el estado esta en pendiente por defecto! 
		INSERT INTO Payment 
		VALUES (@Order_Id, @StartDate, @Amount, 'Pendiente', @PaymentMethod_Id);

		SET @PaymentGenerated = SCOPE_IDENTITY();
		-- Simulacion del pago, se crea un rango de 0.0 a 1.0 y con un 70% de probabilidad de exito

		DECLARE @Range FLOAT = RAND(); -- Range tendra un valor de 0.0 a 1.0

		-- Si el rango esta dentro de 0.0 y 0.7 el pago sera exitoso
		IF @Range <= 0.7

		BEGIN 
			
			-- Se simula como si la transaccion llevo varios segundos en procesar los datos
			DECLARE @PastSeconds INT = ROUND(RAND(CHECKSUM(NEWID())) * 29 + 1, 0);

			-- Nueva fecha de la transaccion despues de la simulacion de verificacion
			DECLARE @EndDate DATETIME = DATEADD(SECOND, @PastSeconds, @StartDate);

			-- Calculo de los impuestos
			DECLARE @PaymentTransactionAmount DECIMAL(10,2) = @Amount + (@Amount * 0.13); 

			-- La transaccion se cumplio con exito
			INSERT INTO PaymentTransaction
			VALUES (@PaymentGenerated, @EndDate, @PaymentTransactionAmount, 'Exitosa');

			-- Se actualiza el estado del pedido que estaba pendiente por realizado
			UPDATE Payment
			SET PaymentStatus = 'Realizado'
			WHERE Payment_Id = @PaymentGenerated; 

			SET @Message = '!El pago se realizó correctamente! Numero generado: ' + CAST(@Range AS VARCHAR(10))

		END

		-- Si el rango es mayor de ese valor entonces el pago sera rechazado
		ELSE

		BEGIN
			
			-- Insertar dentro de una tabla donde se registraran los pagos que fueron rechazados 
			-- mediante la simulacion creada anteriormente
			INSERT INTO PaymentRejected 
			VALUES (@PaymentGenerated); 

			-- Se actualiza el estado del pedido que estaba pendiente por rechazado
			UPDATE Payment
			SET PaymentStatus = 'Rechazado'
			WHERE Payment_Id = @PaymentGenerated;

			SET @Message = '!El pago no se pudo realizar! Numero generado: ' + CAST(@Range AS VARCHAR(10))

		END

	COMMIT
	END TRY

	BEGIN CATCH

	SET @PaymentGenerated = 0;
	SET @Message = 'Algo salio mal';

	ROLLBACK TRANSACTION
	END CATCH
END