USE [proyecto]
GO
/****** Object:  StoredProcedure [dbo].[InsertOrderWithProducts]    Script Date: 16/06/2024 23:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- CREANDO SP CON LA TRANSACTION QUE INCLUYE LOS OTROS 2 SPS, PARA YA AGREGAR PEDIDOS DEFINITIVAMENTE

ALTER PROCEDURE [dbo].[InsertOrderWithProducts]
    @IdClient INT,
    @ProductIds NVARCHAR(MAX), -- Lista de IDs de productos separados por comas
	@ProductCant NVARCHAR(MAX),
	@DeletedVar BIT, 
    @OrderCreated INT OUTPUT,
    @LastProductsOrdered INT OUTPUT,
    @Error VARCHAR(500) OUTPUT,

	-- Parametros SP insert Shipment
	@idSupplier INT,
	@priceFinal DECIMAL,
	@dateSend DATETIME,
	@dateArrival DATETIME,
	@daysElapsed INT,
	@idShipmentOrder INT,
	@idDireccion INT

AS
BEGIN
    SET NOCOUNT ON; -- Evita que se devuelvan mensajes de cuenta de filas afectadas
    BEGIN TRANSACTION;
    BEGIN TRY

		-- Insertar el shipment
	EXEC @idShipmentOrder = CreateShipment
			@id_Supplier = @idSupplier,
			@price_final = @priceFinal,
			@date_send = @dateArrival,
			@date_arrival = @dateArrival,
			@days_elapsed = @daysElapsed,
			@fkIdAddress = @idDireccion;

        -- Insertar en Orders
        EXEC InsertOrder
            @IdClient = @IdClient, 
            @id_shipment = @idShipmentOrder, 
			@Deleted = @DeletedVar,
            @Orders_id = @OrderCreated OUTPUT;

        -- Insertar en ProductsOrdered
        EXEC InsertProductsOrdered
            @Orders_id = @OrderCreated, 
            @ProductIds = @ProductIds, 
			@Quantities = @ProductCant,
            @ProductsOrdered_id = @LastProductsOrdered OUTPUT;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        SET @Error = ERROR_MESSAGE();
        PRINT 'Error al insertar el pedido: ' + @Error;
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
    END CATCH
END
