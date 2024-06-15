-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brayan Rosales
-- Create date: 15-06-2024
-- Description:	sp_updateSuppliers
-- =============================================
CREATE PROCEDURE sp_UpdateSuppliers 
	-- Add the parameters for the stored procedure here
	@id_Supplier int,
	@nameSupplier varchar(50), 
	@informationSupplier varchar(500),
	@priceBase decimal(10,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	UPDATE [dbo].[suppliers]
	   SET [nameSupplier] = @nameSupplier
		  ,[informationSupplier] = @informationSupplier
		  ,[priceBase] = @priceBase
	 WHERE id_Supplier = @id_Supplier

	 RETURN 1;
END
GO
