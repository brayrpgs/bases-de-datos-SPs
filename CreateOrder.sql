CREATE PROCEDURE InsertOrder
    @IdClient INT,
    @id_shipment INT,
	@deleted BIT,
    @Orders_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM Client WHERE IdClient = @IdClient)
        BEGIN
            RAISERROR('El cliente con Id %d no existe.', 16, 1, @IdClient);
            RETURN;
        END
        
        -- Validar existencia del envío
        IF NOT EXISTS (SELECT 1 FROM Shipments WHERE id_shipment = @id_shipment)
        BEGIN
            RAISERROR('El envío con Id %d no existe.', 16, 1, @id_shipment);
            RETURN;
        END

        INSERT INTO Orders (IdClient, id_shipment, Deleted)
        VALUES (@IdClient, @id_shipment, @deleted);

        SET @Orders_id = SCOPE_IDENTITY();
    END TRY
    BEGIN CATCH
        SET @Orders_id = 0;
        THROW; -- Re-lanza la excepción para que sea capturada por la transacción externa
    END CATCH
END
GO

-- INSERTAR EN LA TABLA PRODUCTS_ORDERED (relacion 1 a n, un pedido n productos)
CREATE PROCEDURE InsertProductsOrdered
    @Orders_id INT, -- ID del pedido recién creado
    @ProductIds NVARCHAR(MAX), -- Lista de IDs de productos separados por comas
    @ProductsOrdered_id INT OUTPUT -- ID de la relación de productos ordenados que se devolverá
AS
BEGIN
    SET NOCOUNT ON; -- Evita que se devuelvan mensajes de cuenta de filas afectadas
    BEGIN TRY
 
	    IF NOT EXISTS (SELECT 1 FROM Orders WHERE Orders_id = @Orders_id)
        BEGIN
            RAISERROR('El pedido con Id %d no existe.', 16, 1, @Orders_id);
            RETURN;
        END
    
        DECLARE @ProductId INT; -- Variable para almacenar temporalmente cada ID de producto
        DECLARE @Index INT = 1; -- Índice inicial para el bucle
        DECLARE @ProductIdList TABLE (ProductId INT); -- Tabla temporal para almacenar los IDs de productos

        -- Divide la cadena de IDs de productos en una tabla
        WHILE LEN(@ProductIds) > 0
        BEGIN
            -- Extrae el primer ID de producto de la cadena
            SET @ProductId = CAST(SUBSTRING(@ProductIds, 1, CHARINDEX(',', @ProductIds + ',') - 1) AS INT);
            
            IF NOT EXISTS (SELECT 1 FROM Products WHERE ProductId = @ProductId)
            BEGIN
                RAISERROR('El producto con Id %d no existe.', 16, 1, @ProductId);
                RETURN;
            END
            
            -- Inserta el ID de producto en la tabla temporal
            INSERT INTO @ProductIdList (ProductId) VALUES (@ProductId);
            -- Elimina el ID de producto procesado de la cadena
            SET @ProductIds = STUFF(@ProductIds, 1, CHARINDEX(',', @ProductIds + ','), '');
        END

        -- Inserta cada producto en la tabla ProductsOrdered
        INSERT INTO ProductsOrdered (Orders_id, ID_PRODUCT)
        OUTPUT INSERTED.ProductsOrdered_id INTO @ProductIdList -- Captura el ID insertado
        SELECT @Orders_id, ProductId FROM @ProductIdList;

        -- Obtiene el último ID de ProductsOrdered insertado
        SELECT TOP 1 @ProductsOrdered_id = ProductsOrdered_id FROM ProductsOrdered WHERE Orders_id = @Orders_id ORDER BY ProductsOrdered_id DESC;
    END TRY
    BEGIN CATCH
        SET @ProductsOrdered_id = 0; -- Establece el valor de salida a 0 en caso de error
        THROW; -- Re-lanza la excepción para que sea capturada por la transacción externa
    END CATCH
END
GO


-- CREANDO SP CON LA TRANSACTION QUE INCLUYE LOS OTROS 2 SPS, PARA YA AGREGAR PEDIDOS DEFINITIVAMENTE

CREATE PROCEDURE InsertOrderWithProducts
    @IdClient INT,
    @ProductIds NVARCHAR(MAX), -- Lista de IDs de productos separados por comas
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
	EXEC @idShipmentOrder =  CreateShipment
			@id_Supplier = @idSupplier,
			@price_final = @priceFinal,
			@date_send = @dateArrival,
			@date_arrival = @dateArrival,
			@days_elapsed = @daysElapsed,
			@fkIdAddress = @idDireccion

        -- Insertar en Orders
        EXEC  InsertOrder
            @IdClient = @IdClient, 
            @id_shipment = @idShipmentOrder, 
			@Deleted = @DeletedVar,
            @Orders_id = @OrderCreated OUTPUT;

        -- Insertar en ProductsOrdered
        EXEC InsertProductsOrdered
            @Orders_id = @OrderCreated, 
            @ProductIds = @ProductIds, 
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
GO

-- VEMOS LOS VALORES RECIEN INSERTADOS
Select * from Orders
Select * from ProductsOrdered