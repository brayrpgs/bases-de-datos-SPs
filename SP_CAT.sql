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


DECLARE @ReturnValue INT;

EXEC Sp_InsertCategory 
    @Cat_Code = 'jkdjkd',
    @Cat_Name = 'lkdlskdls',
    @return = @ReturnValue OUTPUT;

-- Verificar el valor retornado
SELECT @ReturnValue AS ReturnValue;

-- Interpretar el valor retornado
IF @ReturnValue = 1
    PRINT 'Inserción exitosa.';
ELSE IF @ReturnValue = 0
    PRINT 'La categoría ya existe.';
ELSE IF @ReturnValue = -1
    PRINT 'Datos inválidos o error durante la inserción.';

	select * from CATEGORY



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

DECLARE @ReturnValue INT;

EXEC Sp_DeleteCategory 
    @Cat_Code = 'ST989',
    @return = @ReturnValue OUTPUT;

-- Verificar el valor retornado
SELECT @ReturnValue AS ReturnValue;

Select * from CATEGORY


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

DECLARE @Cat_Code nvarchar(100) = 'CAT-001'; -- Cambia 'TU_CATEGORIA' por el código de categoría que desees buscar
DECLARE @Cat_name nvarchar(100);
DECLARE @return_Id int;

EXEC Sp_SelectCategory @Cat_Code, @Cat_name OUTPUT, @return_Id OUTPUT;

-- Mostrar los resultados obtenidos
SELECT @Cat_name AS CategoryName, @return_Id AS CategoryId;


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

SELECT * FROM CATEGORY

DECLARE @Cat_Code nvarchar(100) = 'CAT-001'; -- Cambia 'Código_Categoria' por el código de la categoría que deseas modificar
DECLARE @Cat_name nvarchar(100) = 'TECNOLOGIA'; -- Cambia 'Nuevo_Nombre' por el nuevo nombre que deseas asignar a la categoría
DECLARE @return_Id int;

EXEC Sp_ModifyCategory @Cat_Code, @Cat_name, @return_Id OUTPUT;

-- Mostrar el valor de retorno
SELECT @return_Id AS ReturnValue;