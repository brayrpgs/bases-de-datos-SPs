
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE Sp_InsertSupplier

@code_supplier nvarchar (100),
@name_supplier nvarchar (100),
@bl_return int OUTPUT 
	
AS
BEGIN

	SET NOCOUNT ON;

	IF @code_supplier IS NULL OR @code_supplier = '' OR @name_supplier IS NULL OR @name_supplier = '' 
    BEGIN
        SET @bl_return = -1; 
        RETURN;
    END

	IF  DATALENGTH(@name_supplier) > 100 OR DATALENGTH(@code_supplier) > 100
	BEGIN
	SET @bl_return=-4
	RETURN;
	END

	BEGIN TRANSACTION
	BEGIN TRY


	IF NOT EXISTS (SELECT 1 FROM SUPPLIER WHERE SUPPLIER_CODE = @code_supplier OR SUPPLIER_NAME=@name_supplier)
	BEGIN
	
	INSERT INTO SUPPLIER(SUPPLIER_CODE,SUPPLIER_NAME)
	VALUES (@code_supplier,@name_supplier)
	COMMIT TRANSACTION
	set @bl_return=1
	END
	ELSE
	BEGIN
	ROLLBACK TRANSACTION
	set @bl_return=0
	END
	
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
	SET @bl_return=-2
	END CATCH
	

END
GO


--DECLARE @bl_return int;

--EXEC Sp_InsertSupplier
--    @code_supplier = N'449',
 --   @name_supplier = N'GOLLO',
 --   @bl_return = @bl_return OUTPUT;

--SELECT @bl_return AS ReturnCode;



--Eliminar proveedor

--Eliminar

	SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE Sp_DeleteSupplier
	@supplier_code nvarchar (100),
	@return int OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;


	IF @supplier_code IS NULL OR @supplier_code = ''
    BEGIN
        SET @return = -1; 
        RETURN;
    END

	DECLARE @ID_supplier int
	


	IF EXISTS (SELECT 1 FROM SUPPLIER WHERE SUPPLIER_CODE = @supplier_code)
	BEGIN
	SELECT @ID_supplier=ID_SUPPLIER FROM SUPPLIER WHERE SUPPLIER_CODE=@supplier_code
	
	IF NOT EXISTS (SELECT 1 FROM PRODUCT WHERE ID_SUPPLIER=@ID_supplier)
	BEGIN
	
	BEGIN TRANSACTION
	BEGIN TRY

	DELETE FROM SUPPLIER WHERE ID_SUPPLIER=@ID_supplier
	set @return=1
	COMMIT TRANSACTION

	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION
	set @return=-2

	END CATCH
	
	RETURN;
	END
	ELSE
	BEGIN
	SET @return=-3
	RETURN;
	END

	END
	ELSE
	BEGIN
	set @return=0
	return;
	END
	
	
END
GO



--DECLARE @ReturnValue INT;

--EXEC Sp_DeleteSupplier 
--    @supplier_code = N'',
--    @return = @ReturnValue OUTPUT;


--SELECT @ReturnValue AS ReturnValue;


--SELECCIONAR UN PROVEEDOR


	SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE Sp_SelectSupplier
	@code_supplier nvarchar (100),
	@name_supplier nvarchar(100)output,
	@return_Id int OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;

	IF @code_supplier IS NULL OR @code_supplier = ''
    BEGIN
        RETURN;
    END

	IF EXISTS (SELECT 1 FROM SUPPLIER WHERE SUPPLIER_CODE=@code_supplier)
	BEGIN
	SELECT @name_supplier=SUPPLIER_NAME,@return_Id=ID_SUPPLIER FROM SUPPLIER WHERE SUPPLIER_CODE=@code_supplier
	END
	ELSE
	BEGIN
	SET @name_supplier='NS'
	SET @return_Id=-1
	END


	END
GO


--DECLARE @code_sup nvarchar(100) = 'SUP-02933';
--DECLARE @sup_name nvarchar(100);
--DECLARE @return_Id int;

--EXEC Sp_SelectSupplier @code_sup, @sup_name OUTPUT, @return_Id OUTPUT;


--SELECT @sup_name AS CategoryName, @return_Id AS CategoryId;


--Modificar proveedor


	SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE Sp_ModifySupplier
	@code_supplier nvarchar (100),
	@name_supplier nvarchar(100),
	@return_Id int OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;

	IF @code_supplier IS NULL OR @code_supplier = '' OR @name_supplier IS NULL OR @name_supplier = '' 
    BEGIN
	SET @return_Id = -1
        RETURN;
    END

	IF  DATALENGTH(@code_supplier) > 100 OR DATALENGTH(@name_supplier) > 100
	BEGIN
	SET @return_Id=-2
	RETURN;
	END

	IF EXISTS (SELECT 1 FROM SUPPLIER WHERE SUPPLIER_CODE=@code_supplier)
	BEGIN

	IF NOT EXISTS (SELECT 1 FROM SUPPLIER WHERE SUPPLIER_NAME = @name_supplier AND SUPPLIER_CODE <> @code_supplier)
	BEGIN
	UPDATE SUPPLIER SET SUPPLIER_NAME= @name_supplier WHERE SUPPLIER_CODE=@code_supplier
	SET @return_Id=1
	RETURN;
	END
	ELSE
	BEGIN
	SET @return_Id=-3
	RETURN;
	END

	END
	ELSE
	BEGIN
	SET @return_Id=0
	RETURN;
	END
	


END
GO



--DECLARE @sup_code nvarchar(100) = 'abc123'; 
--DECLARE @sup_name nvarchar(100) = 'samsung'; 
--DECLARE @return_Id int;

--EXEC Sp_ModifySupplier @sup_code, @sup_name, @return_Id OUTPUT;


--SELECT @return_Id AS ReturnValue;