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
-- Author:		brayan Rosales
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE updateMethodSend 
	-- Add the parameters for the stored procedure here
	@id_Supplier int, 
	@nameMethod varchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	UPDATE [dbo].[methodSend]
	   SET [nameMethod] = @nameMethod
	 WHERE id_Supplier = @id_Supplier
	 RETURN scope_identity();

END
GO
