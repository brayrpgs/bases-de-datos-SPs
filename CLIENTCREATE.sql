
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ceasar Calvo>
-- Create date: <6/1/24>
-- Description:	<CRUD CLIENT>
-- =============================================
Alter PROCEDURE SP_CreateClient 
--Parameter initialization
	--Province
	@IdProvince int,
	@nameProvince nvarchar(20),
	--Phone
	@IdPhone int,
	@phone int,

	--Address
	@IdAddress int,
	@street nvarchar (100),
	--Person
	@IdPerson int,
	@name nvarchar(100),
	@lastName nvarchar(100),
	@secondLastName nvarchar(100),
	--Client
	@IdClient int,
	--ShoppingHistory
	@IdShoppingHistory int,
	--Variables
	@ERROR INT OUT
	
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRAN

	BEGIN TRY

	INSERT INTO Province(
		nameProvince)
	VALUES(
		@nameProvince
	)
	SET @IdProvince = SCOPE_IDENTITY()

	INSERT INTO Phone(
		phone)
	VALUES(
		@phone
	)
	SET @IdPhone = SCOPE_IDENTITY()

	INSERT INTO Address(
		street,
		IdProvince)
	VALUES(
		@street,
		@IdProvince)
	SET @IdAddress = SCOPE_IDENTITY()

	INSERT INTO Person(
		name,
		lastName,
		secondLastName,
		IdPhone,
		IdAddress)
	VALUES(
		@name,
		@lastName,
		@secondLastName,
		@IdPhone,
		@IdAddress)
	SET @IdPerson = SCOPE_IDENTITY()

	INSERT INTO Client(
		IdPerson)
	VALUES(
		@IdPerson)
	SET @IdClient = SCOPE_IDENTITY()

	INSERT INTO ShoppingHistory(
		IdClient)
	VALUES(
		@IdClient)
	SET @IdShoppingHistory = SCOPE_IDENTITY()

	COMMIT

	END TRY

	BEGIN CATCH
	SET @ERROR = ERROR_NUMBER()
	ROLLBACK TRAN

	END CATCH

END
GO

DECLARE @Error INT;

EXEC SP_CreateClient
    @IdProvince = 0,
    @nameProvince = N'SomeProvince',
    @IdPhone = 0,
    @phone = 1234567890,
    @name = N'John',
    @lastName = N'Doe',
    @secondLastName = N'Smith',
    @IdAddress = 0,
    @street = N'SomeStreet',
    @IdPerson = 0,
    @IdClient = 0,
    @IdShoppingHistory = 0,
    @ERROR = @Error OUTPUT;

-- Check the value of @Error to see if there was an error
SELECT @Error AS ErrorCode;

select * from ShoppingHistory