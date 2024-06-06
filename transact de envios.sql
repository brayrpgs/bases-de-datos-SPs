
-- CREATE
CREATE PROCEDURE CreateShipment
    @id_Supplier INT,
    @price_final DECIMAL,
    @date_send DATETIME,
    @date_arrival DATETIME,
    @days_elapsed INT
AS
    BEGIN
        INSERT INTO shipments (id_Supplier, price_final, date_send, date_arrival, days_elapsed)
        VALUES (@id_Supplier, @price_final, @date_send, @date_arrival, @days_elapsed);
    END


	-- READ
CREATE PROCEDURE ReadShipment
    @id_shipment INT
AS
	BEGIN
		SELECT price_final, date_send,date_arrival,days_elapsed
		FROM shipments
		WHERE id_shipment = @id_shipment;
	END
GO

	-- READ ALL
CREATE PROCEDURE ReadShipmentAll
    @id_shipment INT
AS
BEGIN
    SELECT price_final, date_send,date_arrival,days_elapsed
    FROM shipments
END
GO

-- UPDATE
CREATE PROCEDURE UpdateShipment
    @id_shipment INT,
    @id_Supplier INT,
    @price_final DECIMAL,
    @date_send DATETIME,
    @date_arrival DATETIME,
    @days_elapsed INT
AS
BEGIN
	UPDATE shipments
	SET id_Supplier = @id_Supplier,
		price_final = @price_final,
		date_send = @date_send,
		date_arrival = @date_arrival,
		days_elapsed = @days_elapsed
	WHERE id_shipment = @id_shipment;
END

-- DELETE
CREATE PROCEDURE DeleteShipment
    @id_shipment INT
AS
BEGIN
    DELETE FROM shipments WHERE id_shipment = @id_shipment;
END
GO
