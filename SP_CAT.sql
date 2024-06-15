USE PROYECTO_PRUEBA_PRODUCTOS


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE Sp_InsertCategory
	@Cat_Code nvarchar (100),
	@Cat_Name nvarchar (100),
	@return int OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;


	IF @Cat_Code IS NULL OR @Cat_Code = '' OR @Cat_Name IS NULL OR @Cat_Name = '' 
    BEGIN
        SET @return = -1; 
        RETURN;
    END

	IF  DATALENGTH(@Cat_name) > 100
	BEGIN
	SET @return=-4
	RETURN;
	END

	BEGIN TRANSACTION
	BEGIN TRY


	IF NOT EXISTS (SELECT 1 FROM CATEGORY WHERE CODE_CATEGORY = @Cat_Code OR CATEGORY_NAME=@Cat_Name)
	BEGIN
	
	INSERT INTO CATEGORY (CODE_CATEGORY,CATEGORY_NAME)
	VALUES (@Cat_Code,@Cat_Name)
	COMMIT TRANSACTION
	set @return=1
	END
	ELSE
	BEGIN
	ROLLBACK TRANSACTION
	set @return=0
	END
	
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
	SET @return=-2
	END CATCH


END
GO


	--Eliminar

	SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE Sp_DeleteCategory
	@Cat_Code nvarchar (100),
	@return int OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;


	IF @Cat_Code IS NULL OR @Cat_Code = ''
    BEGIN
        SET @return = -1; 
        RETURN;
    END

	DECLARE @ID_CAT int


	IF EXISTS (SELECT 1 FROM CATEGORY WHERE CODE_CATEGORY = @Cat_Code)
	BEGIN
	SELECT @ID_CAT=ID_CATEGORY FROM CATEGORY WHERE CODE_CATEGORY=@Cat_Code
	
	IF NOT EXISTS (SELECT 1 FROM PRODUCT WHERE ID_CATEGORY=@ID_CAT)
	BEGIN
	
	BEGIN TRANSACTION
	BEGIN TRY

	DELETE FROM CATEGORY WHERE ID_CATEGORY=@ID_CAT
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


--SELECCIONAR UNA CATEGORIA


	SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE Sp_SelectCategory
	@Cat_Code nvarchar (100),
	@Cat_name nvarchar(100)output,
	@return_Id int OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;

	IF @Cat_Code IS NULL OR @Cat_Code = ''
    BEGIN
        RETURN;
    END

	IF EXISTS (SELECT 1 FROM CATEGORY WHERE CODE_CATEGORY=@Cat_Code)
	BEGIN
	SELECT @Cat_name=CATEGORY_NAME,@return_Id=ID_CATEGORY FROM CATEGORY WHERE CODE_CATEGORY=@Cat_Code
	END
	ELSE
	BEGIN
	SET @Cat_name='NS'
	SET @return_Id=-1
	END


END
GO

--MODIFICAR CATEGORIA

	SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE Sp_ModifyCategory
	@Cat_Code nvarchar (100),
	@Cat_name nvarchar(100),
	@return_Id int OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;

	IF @Cat_Code IS NULL OR @Cat_Code = '' OR @Cat_name IS NULL OR @Cat_name = '' 
    BEGIN
	SET @return_Id = -1
        RETURN;
    END

	IF  DATALENGTH(@Cat_Code) > 100 OR DATALENGTH(@Cat_name) > 100
	BEGIN
	SET @return_Id=-2
	RETURN;
	END

	IF EXISTS (SELECT 1 FROM CATEGORY WHERE CODE_CATEGORY=@Cat_Code)
	BEGIN

	IF NOT EXISTS (SELECT 1 FROM CATEGORY WHERE CATEGORY_NAME = @Cat_name AND CODE_CATEGORY <> @Cat_Code)
	BEGIN
	UPDATE CATEGORY SET CATEGORY_NAME= @Cat_name WHERE CODE_CATEGORY=@Cat_Code
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



