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
-- Author:		brayan
-- Create date: 15-06-24
-- Description:	
-- =============================================
create PROCEDURE sp_createMethodSend 
	-- Add the parameters for the stored procedure here
	@nameMethod varchar(250), 
	@id_Supplier int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [dbo].[methodSend]
			([nameMethod]
			,[id_Supplier])
		VALUES
			(@nameMethod
			,@id_Supplier)
	return scope_identity();
END
GO
