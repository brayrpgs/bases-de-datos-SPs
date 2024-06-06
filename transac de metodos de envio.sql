CREATE PROCEDURE CreateMethodSend
    @nameMethod VARCHAR(100),
    @id_Supplier INT
AS
BEGIN
    INSERT INTO methodSend (nameMethod, id_Supplier)
    VALUES (@nameMethod, @id_Supplier);
END;


CREATE PROCEDURE GetMethodSend
    @id_MethodSend INT
AS
BEGIN
    SELECT nameMethod FROM methodSend WHERE id_MethodSend = @id_MethodSend;
END;

CREATE PROCEDURE GetMethodSendAll
AS
BEGIN
    SELECT nameMethod FROM methodSend
END;


CREATE PROCEDURE UpdateMethodSend
    @id_MethodSend INT,
    @nameMethod VARCHAR(100),
    @id_Supplier INT
AS
BEGIN
    UPDATE methodSend
    SET nameMethod = @nameMethod,
        id_Supplier = @id_Supplier
    WHERE id_MethodSend = @id_MethodSend;
END;


CREATE PROCEDURE DeleteMethodSend
    @id_MethodSend INT
AS
BEGIN
    DELETE FROM methodSend WHERE id_MethodSend = @id_MethodSend;
END;
