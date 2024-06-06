CREATE TABLE Orders (
    Orders_id INT PRIMARY KEY identity,
    IdClient INT,
    id_shipment INT,
    ProductsOrdered INT,
    FOREIGN KEY (IdClient) REFERENCES client (IdClient),
    FOREIGN KEY (id_shipment) REFERENCES shipments (id_shipment)
)

CREATE TABLE ProductsOrdered (
    ProductsOrdered_id INT PRIMARY KEY identity,	
    Orders_id INT FOREIGN KEY REFERENCES Orders(Orders_id),
	ID_PRODUCT INT FOREIGN KEY REFERENCES PRODUCT(ID_PRODUCT),
);


