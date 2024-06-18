create table security(
IdSecurity INT PRIMARY KEY IDENTITY (1,1),
IdClient INT FOREIGN KEY REFERENCES Client(IdClient) ON DELETE CASCADE UNIQUE NULL,
Email nvarchar(255) UNIQUE not null,
Password nvarchar(255) not null,
typeUser tinyint not null
);