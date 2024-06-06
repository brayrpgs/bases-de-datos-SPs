CREATE PROCEDURE CreateSupplier
    @nameSupplier VARCHAR(50),
    @informationSupplier VARCHAR(500),
    @priceBase DECIMAL
AS
BEGIN
    INSERT INTO suppliers (nameSupplier, informationSupplier, priceBase)
    VALUES (@nameSupplier, @informationSupplier, @priceBase);
END;


CREATE PROCEDURE GetSupplierForId
    @id_Supplier INT
AS
BEGIN
    SELECT 
		nameSupplier,
		informationSupplier,
		priceBase
	FROM suppliers WHERE id_Supplier = @id_Supplier;
END;

CREATE PROCEDURE GetSupplierAll
AS
BEGIN
    SELECT nameSupplier,
		informationSupplier,
		priceBase FROM suppliers
END;

CREATE PROCEDURE UpdateSupplier
    @id_Supplier INT,
    @nameSupplier VARCHAR(50),
    @informationSupplier VARCHAR(500),
    @priceBase DECIMAL
AS
BEGIN
    UPDATE suppliers
    SET nameSupplier = @nameSupplier,
        informationSupplier = @informationSupplier,
        priceBase = @priceBase
    WHERE id_Supplier = @id_Supplier;
END;

CREATE PROCEDURE DeleteSupplier
    @id_Supplier INT
AS
BEGIN
    DELETE FROM suppliers WHERE id_Supplier = @id_Supplier;
END;
