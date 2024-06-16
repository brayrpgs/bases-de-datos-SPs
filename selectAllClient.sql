alter PROCEDURE sp_selectAllClient
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        p.name as 'Nombre',
        p.lastName as 'Primer Appellido',
        p.secondLastName as 'Segundo Apellido',
        a.street as 'Calle',
        prov.nameProvince as 'Provincia',
        ph.phone as 'Telefono',
        c.IdClient as'Id de cliente',
        sh.IdShoppingHistory as 'Id Historial de compra'
    FROM
        Person p
        JOIN Address a ON p.IdAddress = a.IdAddress
        JOIN Province prov ON a.IdProvince = prov.IdProvince
        LEFT JOIN Client c ON p.IdPerson = c.IdPerson
        LEFT JOIN Phone ph ON p.IdPerson = ph.IdPerson
        LEFT JOIN ShoppingHistory sh ON c.IdClient = sh.IdClient;
END
GO

EXEC sp_selectAllClient;