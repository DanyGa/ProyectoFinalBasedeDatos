------------------------------CREAR------------------------------
USE master
GO

IF DB_ID (N'Banco') IS NOT NULL
DROP DATABASE Banco;
GO
CREATE DATABASE Banco
ON 
(NAME = Banco_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\Banco.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
( NAME = Banco_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\Banco.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB) ;
GO

USE Banco
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
	codigo varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
    curp char (18) not null,
	idCuenta int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCliente PRIMARY KEY(idCliente)
)

CREATE TABLE ClienteCuentaPrivilegio
(
    idClienteCuentaPrivilegio int IDENTITY (1,1),
    idCliente int not null,
    idCuenta int not null,
    idPrivilegio int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKClienteCuentaPrivilegio PRIMARY KEY(idClienteCuentaPrivilegio)
)

CREATE TABLE Cuenta
(
    idCuenta int IDENTITY (1,1),
	codigo varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
    idSucursal int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCuenta PRIMARY KEY(idCuenta)
)

CREATE TABLE Domiciliacion
(
    idDomiciliacion int IDENTITY (1,1),
    descripcion varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKDomiciliacion PRIMARY KEY(idDomiciliacion)
)

CREATE TABLE Prestamo
(
    idPrestamo int IDENTITY (1,1),
    cantidad numeric (10,2) not null,
    idCliente int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPrestamo PRIMARY KEY(idPrestamo)
)

CREATE TABLE Privilegio
(
    idPrivilegio int IDENTITY (1,1),
    tipo varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPrivilegio PRIMARY KEY(idPrivilegio)
)

CREATE TABLE Sucursal
(
    idSucursal int IDENTITY (1,1),
    codigo varchar (50) not null,
	codigoPostal char (6) not null,
	calle varchar (50) not null,
	numero char (5) not null,
	colonia varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKSucursal PRIMARY KEY(idSucursal)
)

CREATE TABLE CuentaCliente
(
    idCuentaCliente int IDENTITY (1,1),
    idCuenta int not null,
    idCliente int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCuentaCliente PRIMARY KEY(idCuentaCliente)
)

CREATE TABLE CuentaDomiciliacion
(
    idCuentaDomiciliacion int IDENTITY (1,1),
    idCuenta int not null,
    idDomiciliacion int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKClienteDomiciliacion PRIMARY KEY(idCuentaDomiciliacion)
)

-----------------------------INDEX-----------------------------

CREATE INDEX IX_Usuario ON Usuario(idUsuario)
GO
CREATE INDEX IX_Cliente ON Cliente(idCliente)
GO
CREATE INDEX IX_ClienteCuentaPrivilegio ON ClienteCuentaPrivilegio(idClienteCuentaPrivilegio)
GO
CREATE INDEX IX_Cuenta ON Cuenta(idCuenta)
GO
CREATE INDEX IX_Domiciliacion ON Domiciliacion(idDomiciliacion)
GO
CREATE INDEX IX_Prestamo ON Prestamo(idPrestamo)
GO
CREATE INDEX IX_Privilegio ON Privilegio(idPrivilegio)
GO
CREATE INDEX IX_Sucursal ON Sucursal(idSucursal)
GO
CREATE INDEX IX_CuentaCliente ON CuentaCliente(idCuentaCliente)
GO
CREATE INDEX IX_CuentaDomiciliacion ON CuentaDomiciliacion(idCuentaDomiciliacion)
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

ALTER TABLE Cliente
ADD CONSTRAINT FKClienteCuenta
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)

ALTER TABLE ClienteCuentaPrivilegio
ADD CONSTRAINT FKClienteCuentaPrivilegioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE ClienteCuentaPrivilegio
ADD CONSTRAINT FKClienteCuentaPrivilegioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE ClienteCuentaPrivilegio
ADD CONSTRAINT FKClienteCuentaPrivilegioCliente 
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)

ALTER TABLE ClienteCuentaPrivilegio
ADD CONSTRAINT FKClienteCuentaPrivilegioCuenta 
FOREIGN KEY (idCuenta) REFERENCES Cuenta(idCuenta)

ALTER TABLE ClienteCuentaPrivilegio
ADD CONSTRAINT FKClienteCuentaPrivilegioPrivilegio 
FOREIGN KEY (idPrivilegio) REFERENCES Privilegio(idPrivilegio)

ALTER TABLE Cuenta
ADD CONSTRAINT FKCuentaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Cuenta
ADD CONSTRAINT FKCuentaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Cuenta
ADD CONSTRAINT FKCuentaSucursal 
FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal)

ALTER TABLE Domiciliacion
ADD CONSTRAINT FKDomiciliacionUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Domiciliacion
ADD CONSTRAINT FKDomiciliacionUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Prestamo
ADD CONSTRAINT FKPrestamoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Prestamo
ADD CONSTRAINT FKPrestamoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Prestamo
ADD CONSTRAINT FKPrestamoCliente 
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)

ALTER TABLE Privilegio
ADD CONSTRAINT FKPrivilegioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Privilegio
ADD CONSTRAINT FKPrivilegioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Sucursal
ADD CONSTRAINT FKSucursalUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Sucursal
ADD CONSTRAINT FKSucursalUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE CuentaCliente
ADD CONSTRAINT FKCuentaClienteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE CuentaCliente
ADD CONSTRAINT FKCuentaClienteUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE CuentaCliente
ADD CONSTRAINT FKCuentaClienteCuenta 
FOREIGN KEY (idCuenta) REFERENCES Cuenta(idCuenta)

ALTER TABLE CuentaCliente
ADD CONSTRAINT FKCCuentaClienteCliente 
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)

ALTER TABLE CuentaDomiciliacion
ADD CONSTRAINT FKCuentaDomiciliacionUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE CuentaDomiciliacion
ADD CONSTRAINT FKCuentaDomiciliacionUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE CuentaDomiciliacion
ADD CONSTRAINT FKCuentaDomiciliacionCuenta 
FOREIGN KEY (idCuenta) REFERENCES Cliente(idCliente)

ALTER TABLE CuentaDomiciliacion
ADD CONSTRAINT FKCuentaDomiciliacionDomiciliacion 
FOREIGN KEY (idDomiciliacion) REFERENCES Domiciliacion(idDomiciliacion)

---------------POBLAR
-----------------------------RELACIONES-----------------------------

INSERT INTO Usuario (apellidoPaterno, apellidoMaterno, nombre, correo, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Munoz', ' Garcia', ' Daniela', ' DaGaMu@ghotmail.com', ' 12345.', 1, GETDATE()),
           ('Velazquez', ' Juarez', ' Edith', ' vejued@hotmal.com', ' 67891.', 1, GETDATE()),
           ('Fernandez', ' Lopez', ' Luis', ' Soccer19@outlook.com', ' 13467.', 1, GETDATE()),
           ('Rodriguez',' Gomez', ' Andrea', ' 06and06@gmail.com', ' 25897.', 1, GETDATE()),
           ('Torres', ' Garza', ' Yakelinne', ' yaki2425@gmail.com', ' 15973.', 1, GETDATE())
GO

INSERT INTO Cliente (codigo, apellidoPaterno, apellidoMaterno, nombre, curp, idCuenta, idUsuarioCrea, fechaCrea)
    VALUES ('CBA',' Castillo',' Boone', ' Maria', ' CABM123456ABCDEFG', 1, 1, GETDATE()),
           ('EMV',' Escobedo',' Martinez', ' Veronica', ' ESMV123456ABCDEFG', 2, 1, GETDATE()),
           ('CHJ',' Cortez',' Hernandez', ' Jared', ' COHJ123456ABCDEFG', 3, 1, GETDATE()),
           ('LAL',' Lugo',' Aguayo', ' Lucia', ' LUAL123456ABCDEFG', 4, 1, GETDATE()),
           ('SCC',' Sanchez',' Cardenas', ' Carmen', ' SACC123456ABCDEFG', 5, 1, GETDATE())
GO

INSERT INTO Sucursal (codigo, codigoPostal, calle, numero, colonia, idUsuarioCrea, fechaCrea)
    VALUES ('S1',' 49321',' Calle1',' 2568',' Col1', 1, GETDATE()),
           ('S2',' 42411',' Calle1',' 1631',' Col2', 1, GETDATE()),
           ('S3',' 12345',' Calle1',' 7895',' Col3', 1, GETDATE()),
           ('S4',' 54780',' Calle1',' 2056',' Col4', 1, GETDATE()),
           ('S5',' 14520',' Calle1',' 2154',' Col5', 1, GETDATE())
GO

INSERT INTO Cuenta (codigo, apellidoPaterno, apellidoMaterno, nombre, idSucursal, idUsuarioCrea, fechaCrea)
    VALUES ('3135153123456789',' Castillo',' Boone', ' Maria', 1, 1, GETDATE()),
           ('3135253987654321',' Escobedo',' Martinez', ' Veronica', 2, 1, GETDATE()),
           ('3135353147258369',' Cortez',' Hernandez', ' Jared', 3, 1, GETDATE()),
           ('3135453951623847',' Lugo',' Aguayo', ' Lucia',  4, 1, GETDATE()),
           ('3135553456789123',' Sanchez',' Cardenas', ' Carmen', 5, 1, GETDATE())
GO

INSERT INTO Privilegio (tipo, idUsuarioCrea, fechaCrea)     
    VALUES ('P1', 1, GETDATE()),
           ('P2', 1, GETDATE()),
           ('P3', 1, GETDATE()),
           ('P4', 1, GETDATE()),
           ('P5', 1, GETDATE())
GO

INSERT INTO ClienteCuentaPrivilegio (idCliente, idCuenta, idPrivilegio, idUsuarioCrea, fechaCrea)
    VALUES (1, 2, 3, 1, GETDATE()),
           (4, 5, 1, 1, GETDATE()),
           (2, 3, 4, 1, GETDATE()),
           (5, 1, 2, 1, GETDATE()),
           (3, 4, 5, 1, GETDATE())
GO

INSERT INTO Domiciliacion (descripcion, idUsuarioCrea, fechaCrea)
    VALUES ('Descripcion1', 1, GETDATE()),
           ('Descripcion2', 1, GETDATE()),
           ('Descripcion3', 1, GETDATE()),
           ('Descripcion4', 1, GETDATE()),
           ('Descripcion5', 1, GETDATE())
GO

INSERT INTO Prestamo (cantidad, idCliente, idUsuarioCrea, fechaCrea)
    VALUES (100000.00, 1, 1, GETDATE()),
           (45000.00, 2, 1, GETDATE()),
           (70000.00, 3, 1, GETDATE()),
           (15200.00, 4, 1, GETDATE()),
           (25000.00, 5, 1, GETDATE())
GO

INSERT INTO CuentaCliente (idCuenta, idCliente, idUsuarioCrea, fechaCrea)
    VALUES (1, 1, 1, GETDATE()),
           (2, 2, 1, GETDATE()),
           (3, 3, 1, GETDATE()),
           (4, 4, 1, GETDATE()),
           (5, 5, 1, GETDATE())
GO

INSERT INTO CuentaDomiciliacion (idCuenta, idDomiciliacion, idUsuarioCrea, fechaCrea)
    VALUES (1, 3, 1, GETDATE()),
           (1, 3, 1, GETDATE()),
           (2, 1, 1, GETDATE()),
           (4, 4, 1, GETDATE()),
           (5, 1, 1, GETDATE())
GO

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Usuario
SELECT * FROM Cliente
SELECT * FROM ClienteCuentaPrivilegio
SELECT * FROM Cuenta
SELECT * FROM Domiciliacion
SELECT * FROM Prestamo
SELECT * FROM Privilegio
SELECT * FROM Sucursal
SELECT * FROM CuentaCliente
SELECT * FROM CuentaDomiciliacion

--Borrar Registros CUIDADO!!!!!!!!!!!!!!--

DELETE FROM CuentaDomiciliacion WHERE idCuentaDomiciliacion = 3

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM CuentaDomiciliacion
GO
-----------------------------VISTAS-----------------------------

CREATE VIEW ClienteCuentaCantidad AS Select c.idCuenta, count (cu.idCuenta) as cantidad
FROM Cliente c INNER JOIN Cuenta cu ON c.idCuenta = cu.idCuenta WHERE
c.idCuenta = 1 GROUP BY c.idCuenta
GO

CREATE VIEW CuentasSucursalCantidad AS SELECT cu.idSucursal, count (s.idSucursal) as cantidad
FROM Cuenta cu INNER JOIN Sucursal s ON cu.idSucursal = s.idSucursal WHERE
cu.idSucursal = 1 GROUP BY cu.idSucursal
GO

CREATE VIEW PrestamosClienteCantidad AS SELECT p.idCliente, count (c.idCliente) as cantidad
FROM Prestamo p INNER JOIN Cliente c ON p.idCliente = c.idCliente WHERE
c.idCliente = 1 GROUP BY p.idCliente
GO

CREATE VIEW PrestamoClienteDatos AS SELECT c.idCliente, c.apellidoPaterno, c.nombre, p.idPrestamo, p.cantidad
FROM Prestamo p INNER JOIN Cliente c ON p.idCliente = c.idCliente WHERE
c.idCliente = 1 GROUP BY c.idCliente, c.apellidoPaterno, c.nombre, p.idPrestamo, p.cantidad
GO

CREATE VIEW ClienteCuentas AS SELECT c.idCliente, c.nombre, c.apellidoPaterno, cu.idCuenta, cu.codigo
FROM Cliente c INNER JOIN Cuenta cu ON c.idCuenta = cu.idCuenta WHERE
c.idCliente = 1 GROUP BY c.idCliente, c.nombre, c.apellidoPaterno, cu.idCuenta, cu.codigo
GO
