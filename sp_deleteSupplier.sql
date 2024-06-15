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
-- Description:	delete de suplidores
-- =============================================
CREATE PROCEDURE sp_deleteSuppliers 
	-- Add the parameters for the stored procedure here
	@idSupplier int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from suppliers where id_Supplier = @idSupplier;
	return 1;
END
GO
