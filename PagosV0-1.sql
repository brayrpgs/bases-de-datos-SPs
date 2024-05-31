--CREATE DATABASE pagosKendallV01;

USE pagosKendallV01;

GO


--Por normalizacion se crea una tabla de metodos de pago antes de la de pagos
CREATE TABLE PaymentMethod(

	PaymentMethod_Id INT PRIMARY KEY IDENTITY NOT NULL,
	PaymentMethodName VARCHAR(50) UNIQUE NOT NULL

);


--Creacion de la tabla de pagos 

CREATE TABLE Payment(

	Payment_Id INT PRIMARY KEY IDENTITY NOT NULL,
	Order_Id INT NOT NULL, --Llave primaria de pedidos
	PaymentDate DATETIME NOT NULL,
	Amount DECIMAL(10,2) NOT NULL,
	PaymentStatus VARCHAR(20) NOT NULL,
	PaymentMethod_Id INT,
	FOREIGN KEY (PaymentMethod_Id) REFERENCES PaymentMethod(PaymentMethod_Id)
	--FOREIGN KEY (Order_Id) REFERENCES Order(Order_Id) --FK de pagos (falta acoplar)

);

--Tabla de las transacciones de los pagos

CREATE TABLE PaymentTransaction(

	Transaction_Id INT PRIMARY KEY IDENTITY NOT NULL,
	Payment_Id INT NOT NULL,
	TransactionDate DATETIME NOT NULL,
	TransactionAmount DECIMAL(10,2) NOT NULL,
	TransactionStatus VARCHAR(20) NOT NULL,
	FOREIGN KEY (Payment_Id) REFERENCES Payment(Payment_Id)

);

