CREATE PROCEDURE CreatePhone
    @phone INT,
    @id_Supplier INT
AS
BEGIN
    INSERT INTO Phone (phone, id_Supplier)
    VALUES (@phone, @id_Supplier);
END;

CREATE PROCEDURE GetPhone
    @id_Phone INT
AS
BEGIN
    SELECT phone FROM Phone WHERE id_Phone = @id_Phone;
END;

CREATE PROCEDURE GetPhoneAll
AS
BEGIN
    SELECT phone FROM Phone
END;

CREATE PROCEDURE UpdatePhone
    @id_Phone INT,
    @phone INT,
    @id_Supplier INT
AS
BEGIN
    UPDATE Phone
    SET phone = @phone,
        id_Supplier = @id_Supplier
    WHERE id_Phone = @id_Phone;
END;


CREATE PROCEDURE DeletePhone
    @id_Phone INT
AS
BEGIN
    DELETE FROM Phone WHERE id_Phone = @id_Phone;
END;
