USE PROYECTO_PRUEBA_PRODUCTOS;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Daniel Briones Vargas
-- Create date: 25-05-24
-- Description:	Sp que busca productos
-- =============================================
CREATE PROCEDURE sp_searchProduct
	@productName NVARCHAR(100),
	@categoryName NVARCHAR(100),
	@minPrice DECIMAL(10,2),
	@maxPrice DECIMAL(10,2),
	@ERROR INT OUT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRAN
		SET @ERROR = 0;
		BEGIN TRY
			SELECT 
				P.PRODUCT_NAME,
				P.PRODUCT_DESCRIPTION,
				P.PRICE,
				C.CATEGORY_NAME,
				S.SUPPLIER_NAME,
				I.PRODUCT_IMAGE,
				ST.QUANTITY
			FROM 
				PRODUCT P
			INNER JOIN 
				CATEGORY C ON P.ID_CATEGORY = C.ID_CATEGORY
			INNER JOIN 
				SUPPLIER S ON P.ID_SUPPLIER = S.ID_SUPPLIER
			LEFT JOIN 
				IMAGE_PRODUCT I ON P.ID_PRODUCT = I.ID_PRODUCT
			LEFT JOIN 
				STOCK ST ON P.ID_PRODUCT = ST.ID_PRODUCT
			WHERE 
				(@productName IS NOT NULL AND P.PRODUCT_NAME LIKE '%' + @productName + '%') OR
				(@categoryName IS NOT NULL AND C.CATEGORY_NAME LIKE '%' + @categoryName + '%') OR
				(@minPrice IS NOT NULL AND P.PRICE >= @minPrice) OR
				(@maxPrice IS NOT NULL AND P.PRICE <= @maxPrice);
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			SET @ERROR = ERROR_NUMBER()
			PRINT 'Error al buscar el producto'
			ROLLBACK TRAN
		END CATCH
END
GO
