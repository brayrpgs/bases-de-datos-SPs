
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE Sp_addStockProduct
@code_Product nvarchar (100),
@quantity int,
@return int output

AS
BEGIN
	SET NOCOUNT ON;

	IF @code_Product IS NULL OR @code_Product = ''
	BEGIN
	SET @return=-1
	RETURN;
	END

	IF @quantity <=0
	BEGIN
	SET @return=-2
	RETURN;
	END

	DECLARE @ID_PROD INT

	BEGIN TRANSACTION
	BEGIN TRY


	IF EXISTS (SELECT 1 FROM PRODUCT WHERE PRODUCT_CODE=@code_Product)
	BEGIN

	SELECT @ID_PROD= ID_PRODUCT FROM PRODUCT WHERE PRODUCT_CODE= @code_Product

	IF EXISTS(SELECT 1 FROM STOCK WHERE ID_PRODUCT= @ID_PROD)
	BEGIN
	UPDATE STOCK SET QUANTITY+=@quantity WHERE ID_PRODUCT=@ID_PROD
	SET @return=1
	END

	ELSE
	BEGIN
	SET @return=-3
	END

	END
	ELSE
	BEGIN
	SET @return=-4
	END

	COMMIT TRANSACTION

	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
	SET @return=-10
	END CATCH


END
GO



--DECLARE @result INT;
--EXEC Sp_addStockProduct @code_Product = 'Prod-0194', @quantity = 50, @return = @result OUTPUT;
--SELECT @result AS ReturnCode;
