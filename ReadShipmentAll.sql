USE [proyecto]
GO
/****** Object:  StoredProcedure [dbo].[ReadShipmentAll]    Script Date: 15/6/2024 00:42:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	-- READ ALL
ALTER PROCEDURE [dbo].[ReadShipmentAll]
AS
BEGIN
    SELECT id_shipment,price_final, date_send,date_arrival,days_elapsed
    FROM shipments
END