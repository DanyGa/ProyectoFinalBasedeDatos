-----------------------------CREAR-----------------------------
USE master
GO

IF DB_ID (N'ConcesionariodeAutomoviles') IS NOT NULL
DROP DATABASE ConcesionariodeAutomoviles;
GO

CREATE DATABASE ConcesionariodeAutomoviles
ON 
(NAME = ConcesionariodeAutomoviles_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\ConcesionarioDeAutomoviles.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
( NAME = ConcesionariodeAutomoviles_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\ConcesionarioDeAutomoviles.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB) ;
GO

USE ConcesionariodeAutomoviles
GO

-----------------------------TABLAS-----------------------------

CREATE TABLE Usuario
(
    idUsuario int IDENTITY(1,1),
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
    correo varchar (50) UNIQUE not null,
    clave varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKUsuario PRIMARY KEY(idUsuario)
)

CREATE TABLE Cliente
(
    idCliente int IDENTITY (1,1),
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
    RFC char (13) not null,
    codigoPostal char (5) not null,
	calle varchar (50) not null,
	numero char (5) not null,
	colonia varchar (50) not null,
    telefono char (11) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCliente PRIMARY KEY(idCliente)
)

CREATE TABLE CocheUsado
(
    idCocheUsado int IDENTITY (1,1),
    matricula varchar (50) not null,
    marca varchar (50) not null,
    modelo varchar (50) not null,
    precio numeric (10,2) not null,
    fechaCedido datetime not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCocheUsado PRIMARY KEY(idCocheUsado)
)

CREATE TABLE Opcion
(
    idOpcion int IDENTITY (1,1),
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKOpcion PRIMARY KEY(idOpcion)
)

CREATE TABLE Vehiculo
(
    idVehiculo int IDENTITY (1,1),
    marca varchar (50) not null,
    modelo varchar (50) not null,
    cilindros int not null,
	precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKVehiculo PRIMARY KEY(idVehiculo)
)

CREATE TABLE Vendedor
(
    idVendedor int IDENTITY (1,1),
	apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
    RFC char (13) not null,
    codigoPostal char (5) not null,
	calle varchar (50) not null,
	numero char (5) not null,
	colonia varchar (50) not null,
    telefono char (11) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKVendedor PRIMARY KEY(idVendedor)
)

CREATE TABLE Venta 
(
    idVenta int IDENTITY (1,1),
    matricula varchar (50) not null,
    fecha datetime not null,
    idVendedor int not null,
    idCliente int not null,
    idVehiculo int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKVenta PRIMARY KEY(idVenta)
)

CREATE TABLE VehiculoOpcion
(
    idVehiculoOpcion int IDENTITY (1,1),
    idVehiculo int not null,
    idOpcion int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKVehiculoOpcion PRIMARY KEY(idVehiculoOpcion)
)

CREATE TABLE VentaOpcion
(
    idVentaOpcion int IDENTITY (1,1),
    idVenta int not null,
    idOpcion int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKVentaOpcion PRIMARY KEY(idVentaOpcion)
)

-----------------------------INDEX-----------------------------

CREATE INDEX IX_Usuario ON Usuario(idUsuario)
GO
CREATE INDEX IX_Cliente ON Cliente(idCliente)
GO
CREATE INDEX IX_CocheUsado ON CocheUsado(idCocheUsado)
GO
CREATE INDEX IX_Opcion ON Opcion(idOpcion)
GO
CREATE INDEX IX_Vehiculo ON Vehiculo(idVehiculo)
GO
CREATE INDEX IX_Vendedor ON Vendedor(idVendedor)
GO
CREATE INDEX IX_Venta ON Venta(idVenta)
GO
CREATE INDEX IX_VehiculoOpcion ON VehiculoOpcion(idVehiculoOpcion)
GO
CREATE INDEX IX_VentaOpcion ON VentaOpcion(idVentaOpcion)
GO

-----------------------------RELACIONES-----------------------------

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Cliente
ADD CONSTRAINT FKClienteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Cliente
ADD CONSTRAINT FKClienteUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE CocheUsado
ADD CONSTRAINT FKCocheUsadoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE CocheUsado
ADD CONSTRAINT FKCocheUsadoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Opcion
ADD CONSTRAINT FKOpcionUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Opcion
ADD CONSTRAINT FKOpcionUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Vehiculo
ADD CONSTRAINT FKVehiculoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Vehiculo
ADD CONSTRAINT FKVehiculoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Vendedor
ADD CONSTRAINT FKVendedorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Vendedor
ADD CONSTRAINT FKVendedorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Venta
ADD CONSTRAINT FKVentaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Venta
ADD CONSTRAINT FKVentaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Venta 
ADD CONSTRAINT FKVentaCliente 
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)

ALTER TABLE Venta 
ADD CONSTRAINT FKVentaVehiculo 
FOREIGN KEY (idVehiculo) REFERENCES Vehiculo(idVehiculo)

ALTER TABLE VehiculoOpcion
ADD CONSTRAINT FKVehiculoOpcionUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE VehiculoOpcion
ADD CONSTRAINT FKVehiculoOpcionUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE VehiculoOpcion
ADD CONSTRAINT FKVehiculoOpcionVehiculo 
FOREIGN KEY (idVehiculo) REFERENCES Vehiculo(idVehiculo)

ALTER TABLE VentaOpcion
ADD CONSTRAINT FKVentaOpcionUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE VentaOpcion
ADD CONSTRAINT FKVentaOpcionUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE VentaOpcion
ADD CONSTRAINT FKVentaOpcionOpcion 
FOREIGN KEY (idOpcion) REFERENCES Opcion(idOpcion)

ALTER TABLE VentaOpcion
ADD CONSTRAINT FKVentaOpcionVenta
FOREIGN KEY (idVenta) REFERENCES Venta(idVenta)


---------------POBLAR
-----------------------------RELACIONES-----------------------------

INSERT INTO Usuario (apellidoPaterno, apellidoMaterno, nombre, correo, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Munoz', ' Garcia', ' Daniela', ' DaGaMu@ghotmail.com', ' 12345.', 1, GETDATE()),
           ('Velazquez', ' Juarez', ' Edith', ' vejued@hotmal.com', ' 67891.', 1, GETDATE()),
           ('Fernandez', ' Lopez', ' Luis', ' Soccer19@outlook.com', ' 13467.', 1, GETDATE()),
           ('Rodriguez',' Gomez', ' Andrea', ' 06and06@gmail.com', ' 25897.', 1, GETDATE()),
           ('Torres', ' Garza', ' Yakelinne', ' yaki2425@gmail.com', ' 15973.', 1, GETDATE())
GO

INSERT INTO Cliente (apellidoPaterno, apellidoMaterno, nombre, RFC, codigoPostal, calle, numero, colonia, telefono, idUsuarioCrea, fechaCrea)
    VALUES ('Castillo',' Boone', ' Maria', ' CABM123456AB', ' 2577', ' Calle1', ' 1234',' Colonia1', '8661206835', 1, GETDATE()),
           ('Escobedo',' Martinez', ' Veronica', ' ESMV123456AB', ' 2577', ' Calle2',' 6789', 'Colonia2', '8667896532', 1, GETDATE()),
           ('Cortez',' Hernandez', ' Jared', ' COHJ123456AB', ' 2577', ' Calle3', ' 0987', 'Colonia3','8661234578', 1, GETDATE()),
           ('Lugo',' Aguayo', ' Lucia', ' LUAL123456AB', ' 2577', ' Calle4',' 5432',' Colonia4', '8663572468', 1, GETDATE()),
           ('Sanchez',' Cardenas', ' Carmen', ' SACC123456AB', ' 2577', ' Calle5',' 0147', ' Colonia5', '8664716952', 1, GETDATE())
GO

INSERT INTO CocheUsado (matricula, marca, modelo, precio, fechaCedido, idUsuarioCrea, fechaCrea)
    VALUES ('CHSB-1205', ' Marca1', ' Modelo1', 120000.00, GETDATE(), 1, GETDATE()),
           ('KITH-1230', ' Marca2', ' Modelo2', 114000.00, GETDATE(), 1, GETDATE()),
           ('PAJY-0922', ' Marca3', ' Modelo3', 100000.00, GETDATE(), 1, GETDATE()),
           ('LEHS-1004', ' Marca4', ' Modelo4', 220000.00, GETDATE(), 1, GETDATE()),
           ('HWHY-0035', ' Marca5', ' Modelo5', 111500.00, GETDATE(), 1, GETDATE())
GO

INSERT INTO Opcion (nombre, descripcion, idUsuarioCrea, fechaCrea)
    VALUES ('Opcion1', ' Descripcion1', 1, GETDATE()),
           ('Opcion2', ' Descripcion2', 1, GETDATE()),
           ('Opcion3', ' Descripcion3', 1, GETDATE()),
           ('Opcion4', ' Descripcion4', 1, GETDATE()),
           ('Opcion5', ' Descripcion5', 1, GETDATE())
GO

INSERT INTO Vehiculo (marca, modelo, cilindros, precio, idUsuarioCrea, fechaCrea)
    VALUES ('Ma1', ' Mo3', 8, 115000.00, 1, GETDATE()),
           ('Ma2', ' Mo5', 8, 105000.00, 1, GETDATE()),
           ('Ma1', ' Mo2', 8, 351000.00, 1, GETDATE()),
           ('Ma4', ' Mo8', 8, 278000.00, 1, GETDATE()),
           ('Ma5', ' Mo2', 8, 200000.00, 1, GETDATE())
GO

INSERT INTO Vendedor (apellidoPaterno, apellidoMaterno, nombre, RFC, codigoPostal, calle, numero, colonia, telefono, idUsuarioCrea, fechaCrea)
    VALUES ('Munoz', ' Garcia', ' Daniela', ' MUGD123456AB', ' 2578', ' Calle6', ' 9638',' Colonia6', ' 8661835456', 1, GETDATE()),
           ('Velazquez', ' Juarez', ' Edith', ' VEJE123456AB', ' 2578', ' Calle7', ' 5207',' Colonia7', ' 8667299878', 1, GETDATE()),
           ('Fernandez', ' Lopez', ' Luis', ' FELL123456AB', ' 2578', ' Calle8', ' 4108',' Colonia8', ' 8661676963', 1, GETDATE()),
           ('Rodriguez',' Gomez', ' Andrea', ' ROGA123456AB', ' 2578', ' Calle9', ' 5209',' Colonia9', ' 8669431741', 1, GETDATE()),
           ('Torres', ' Garza', ' Yakelinne', ' TOGY123456AB', ' 2578', ' Calle0', ' 6308',' Colonia0', ' 8669731425', 1, GETDATE())
GO

INSERT INTO Venta (fecha, matricula, idCliente, idVendedor, idVehiculo, idUsuarioCrea, fechaCrea)
    VALUES (GETDATE(), 'YAPQ-1234', 1, 2, 3, 1, GETDATE()),
           (GETDATE(), 'UIER-4567', 5, 5, 4, 1, GETDATE()),
           (GETDATE(), 'ACAB-8910', 4, 3, 2, 1, GETDATE()),
           (GETDATE(), 'ARSD-9876', 2, 1, 1, 1, GETDATE()),
           (GETDATE(), 'UWUL-4561', 3, 4, 5, 1, GETDATE())
GO

INSERT INTO VehiculoOpcion (idVehiculo, idOpcion, idUsuarioCrea, fechaCrea)
    VALUES (1, 2, 1, GETDATE()),
           (3, 4, 1, GETDATE()),
           (5, 5, 1, GETDATE()),
           (4, 3, 1, GETDATE()),
           (2, 1, 1, GETDATE())
GO

INSERT INTO VentaOpcion (idVenta, idOpcion, idUsuarioCrea, fechaCrea)
    VALUES (5, 4, 1, GETDATE()),
           (3, 2, 1, GETDATE()),
           (1, 1, 1, GETDATE()),
           (4, 5, 1, GETDATE()),
           (2, 3, 1, GETDATE())
GO

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Usuario
SELECT * FROM Cliente
SELECT * FROM CocheUsado
SELECT * FROM Opcion
SELECT * FROM Vehiculo
SELECT * FROM Vendedor
SELECT * FROM Venta
SELECT * FROM VehiculoOpcion
SELECT * FROM VentaOpcion

--Borrar Registros CUIDADO!!!!!!!!!!!!!!--

DELETE FROM CocheUsado WHERE idCocheUsado = 3

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM CocheUsado
GO

-----------------------------VISTAS-----------------------------

CREATE VIEW VentaClienteCantidad AS SELECT v.idCliente, count (c.idCliente) as cantidad
FROM Venta v INNER JOIN Cliente c ON v.idCliente = c.idCliente WHERE
c.idCliente = 2 GROUP BY v.idCliente
GO

CREATE VIEW VentaVehiculoCantidad AS SELECT v.idVehiculo, count (veh.idVehiculo) as cantidad
FROM Venta v INNER JOIN Vehiculo veh ON v.idVehiculo = veh.idVehiculo WHERE
veh.idVehiculo = 3 GROUP BY v.idVehiculo
GO

CREATE VIEW VentaCliente AS SELECT v.fecha, v.matricula, c.idCliente, c.nombre, c.apellidoPaterno
FROM Venta v INNER JOIN Cliente c ON v.idCliente = c.idCliente WHERE
v.idCliente <= 4 GROUP BY c.idCliente, v.matricula, c.nombre, c.apellidoPaterno, v.fecha
GO

CREATE VIEW VentaVehiculoPrecio AS SELECT v.matricula, veh.marca, veh.precio
FROM Venta v INNER JOIN Vehiculo veh ON v.idVehiculo = veh.idVehiculo WHERE
veh.idVehiculo = 3 GROUP BY v.matricula, veh.marca, veh.precio
GO

CREATE VIEW VentaClienteDireccion AS SELECT v.idCliente, c.codigoPostal, c.calle, c.numero, c.colonia
FROM Venta v INNER JOIN Cliente c ON v.idCliente = c.idCliente WHERE
v.idCliente <= 4 GROUP BY v.idCliente, c.codigoPostal, c.calle, c.numero, c.colonia
GO
