CREATE PROCEDURE ReadOrder
    @id_order INT
AS
	BEGIN
	SELECT 
			o.Orders_id,
			o.IdClient,
			c.IdPerson,
			p.name AS ClientName,
			o.id_shipment,
			o.Deleted,
			s.id_Supplier,
			sup.nameSupplier AS SupplierName,
			s.price_final,
			s.date_send,
			s.date_arrival,
			s.days_elapsed,
			po.ProductsOrdered_id,
			po.ID_PRODUCT
		FROM 
			Orders o
		INNER JOIN 
			Client c ON o.IdClient = c.IdClient
		INNER JOIN 
			Person p ON c.IdPerson = p.IdPerson
		INNER JOIN 
			Shipments s ON o.id_shipment = s.id_shipment
		INNER JOIN 
			Suppliers sup ON s.id_Supplier = sup.id_Supplier
		INNER JOIN 
			ProductsOrdered po ON o.Orders_id = po.Orders_id
		WHERE 
			o.Orders_id = @id_order;

	END

CREATE PROCEDURE spDeleteOrder
    @OrderId INT,
    @Deleted BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si la orden existe
    IF NOT EXISTS (SELECT 1 FROM Orders WHERE Orders_id = @OrderId)
    BEGIN
        RAISERROR('La orden con Id %d no existe.', 16, 1, @OrderId);
        SET @Deleted = 0;
        RETURN;
    END

    -- Actualizar la columna Deleted a 1
    UPDATE Orders
    SET Deleted = 1
    WHERE Orders_id = @OrderId;

    -- Verificar si la actualización fue exitosa
    IF @@ROWCOUNT = 0
    BEGIN
        RAISERROR('No se pudo actualizar la orden con Id %d.', 16, 1, @OrderId);
        SET @Deleted = 0;
        RETURN;
    END

    -- Establecer el parámetro de salida a 1 para indicar éxito
    SET @Deleted = 1;
END
GO

