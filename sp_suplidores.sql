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
-- Author:		Bryan Rosales
-- Create date: 15-06-2024
-- Description:	sp de suplidores
-- =============================================
CREATE PROCEDURE sp_suppliers 
	-- Add the parameters for the stored procedure here
	@nameSupplier varchar(50), 
	@informationSupplier varchar(500),
	@priceBase decimal(10,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[suppliers]
			   ([nameSupplier]
			   ,[informationSupplier]
			   ,[priceBase])
		 VALUES
			   (@nameSupplier
			   ,@informationSupplier
			   ,@priceBase)
	return scope_identity();
END