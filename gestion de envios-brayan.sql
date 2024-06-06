use proyecto

CREATE TABLE directions(
id_Direction int PRIMARY KEY identity,
--revisar con la tabla de ceasar que tiene Province
)

CREATE TABLE suppliers(
id_Supplier INT PRIMARY KEY IDENTITY,
nameSupplier varchar(50),
informationSupplier varchar(500),
priceBase decimal, --precio base por kilometro
)

create table Phone(
id_Phone INT PRIMARY KEY IDENTITY,
phone int,
id_Supplier INT FOREIGN KEY REFERENCES suppliers(id_Supplier)
)
CREATE TABLE methodSend(
id_MethodSend int PRIMARY KEY identity,
nameMethod varchar(100),
id_Supplier INT FOREIGN KEY REFERENCES suppliers(id_Supplier)
)

CREATE TABLE shipments(
id_shipment INT PRIMARY KEY IDENTITY,
id_Supplier INT FOREIGN KEY REFERENCES suppliers(id_Supplier),
price_final decimal,
date_send datetime,
date_arrival datetime,
days_elapsed  int
)