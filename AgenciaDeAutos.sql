-----------------------------CREAR-----------------------------
USE master
GO

IF DB_ID (N'AgenciadeAutos') IS NOT NULL
DROP DATABASE AgenciadeAutos;
GO

CREATE DATABASE AgenciadeAutos
ON 
(NAME = AgenciadeAutos_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\AgenciadeAutos.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
( NAME = AgenciadeAutos_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\AgenciadeAutos.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB) ;
GO

USE AgenciadeAutos
GO

-----------------------------TABLAS-----------------------------

CREATE TABLE Usuario
(
    idUsuario int IDENTITY(1,1),
    nombre varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    correo varchar (50) UNIQUE not null,
    clave varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKUsuario PRIMARY KEY(idUsuario)
)

CREATE TABLE Agencia
(
    idAgencia int IDENTITY(1,1),
	nombre varchar (50) not null,
    clave varchar (50) not null,
	codigoPostal char (5) not null,
	calle varchar (50) not null,
	numero char (5) not null,
	colonia varchar (50) not null,
	estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKAgencia PRIMARY KEY(idAgencia)
)

CREATE TABLE Cliente
(
    idCliente int IDENTITY(1,1),
	apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
	clave varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCliente PRIMARY KEY(idCliente)
)

CREATE TABLE Coche
(
    idCoche int IDENTITY(1,1),
    marca varchar (50) not null,
    modelo varchar (50) not null,
    precio numeric (10) not null,
	clave varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCoche PRIMARY KEY(idCoche)
)

CREATE TABLE Garaje
(
    idGaraje int IDENTITY(1,1),
    numero varchar (50) not null,
    clave varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKGaraje PRIMARY KEY(idGaraje)
)

CREATE TABLE Reserva
(
    idReserva int IDENTITY(1,1),
	descripcion varchar (50) not null,
	clave varchar (50) not null,
	fechaComenzo datetime not null,
	fechaTermina datetime not null,
	idCliente int not null,
    idAgencia int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKReserva PRIMARY KEY(idReserva)
)

-----------------------------INDEX-----------------------------

CREATE INDEX IX_Usuario ON Usuario(idUsuario)
GO
CREATE INDEX IX_Agencia ON Agencia(idAgencia)
GO
CREATE INDEX IX_Cliente ON Cliente(idCliente)
GO
CREATE INDEX IX_Coche ON Coche(idCoche)
GO
CREATE INDEX IX_Garaje ON Garaje(idGaraje)
GO
CREATE INDEX IX_Reserva ON Reserva(idReserva)
GO

-----------------------------RELACIONES-----------------------------

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Agencia
ADD CONSTRAINT FKAgenciaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Agencia
ADD CONSTRAINT FKAgenciaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Coche
ADD CONSTRAINT FKCocheUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Coche
ADD CONSTRAINT FKCocheUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Cliente
ADD CONSTRAINT FKClienteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Cliente
ADD CONSTRAINT FKClienteUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Garaje
ADD CONSTRAINT FKGarajeUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Garaje
ADD CONSTRAINT FKGarajeUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Reserva
ADD CONSTRAINT FKReservaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Reserva
ADD CONSTRAINT FKReservaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Reserva
ADD CONSTRAINT FKReservaAgencia 
FOREIGN KEY (idAgencia) REFERENCES Agencia(idAgencia)

ALTER TABLE Reserva
ADD CONSTRAINT FKReservaCliente 
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)

---------------POBLAR
-----------------------------RELACIONES-----------------------------

INSERT INTO Usuario (apellidoPaterno, apellidoMaterno, nombre, correo, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Munoz', ' Garcia', ' Daniela', ' DaGaMu@ghotmail.com', ' 12345.', 1, GETDATE()),
           ('Velazquez', ' Juarez', ' Edith', ' vejued@hotmal.com', ' 67891.', 1, GETDATE()),
           ('Fernandez', ' Lopez', ' Luis', ' Soccer19@outlook.com', ' 13467.', 1, GETDATE()),
           ('Rodriguez',' Gomez', ' Andrea', ' 06and06@gmail.com', ' 25897.', 1, GETDATE()),
           ('Torres', ' Garza', ' Yakelinne', ' yaki2425@gmail.com', ' 15973.', 1, GETDATE())
GO

INSERT INTO Agencia (nombre, clave, codigoPostal, calle, numero, colonia, idUsuarioCrea, fechaCrea)
    VALUES ('AutoCar', ' 1A', ' 2570', ' Av.Las torres', ' 1578', ' La Granja', 1, GETDATE()),
		   ('AutoCar', ' 2A', ' 2570', ' Av.Las torres', ' 1578', ' La Granja', 1, GETDATE()),
		   ('AutoCar', ' 3A', ' 2570', ' Av.Las torres', ' 1578', ' La Granja', 1, GETDATE()),
		   ('AutoCar', ' 4A', ' 2570', ' Av.Las torres', ' 1578', ' La Granja', 1, GETDATE()),
		   ('AutoCar', ' 5A', ' 2570', ' Av.Las torres', ' 1578', ' La Granja', 1, GETDATE()),
		   ('AutoCar', ' 6A', ' 2570', ' Av.Las torres', ' 1578', ' La Granja', 1, GETDATE())
           
GO

INSERT INTO Cliente (apellidoPaterno, apellidoMaterno, nombre, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Castillo',' Boone', ' Maria', ' 1C', 1, GETDATE()),
           ('Escobedo',' Martinez', ' Veronica', ' 2C', 1, GETDATE()),
		   ('Cortez',' Hernandez', ' Jared', ' 3C', 1, GETDATE()),
		   ('Lugo',' Aguayo', ' Lucia', '4C', 1, GETDATE()),
		   ('Sanchez',' Cardenas', ' Carmen', '5C', 1, GETDATE())
GO

INSERT INTO Coche (marca, modelo, precio, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Ma1', ' Mo1', 244000.00, ' Co1', 1, GETDATE()),
           ('Ma2', ' Mo2', 410000.00, ' Co2', 1, GETDATE()),
		   ('Ma3', ' Mo3', 358000.00, ' Co3', 1, GETDATE()),
		   ('Ma4', ' Mo4', 137000.00, ' Co4', 1, GETDATE()),
		   ('Ma5', ' Mo5', 231000.00, ' Co5', 1, GETDATE())
GO

INSERT INTO Garaje (numero, clave, idUsuarioCrea, fechaCrea)
    VALUES ('001', ' G1', 1, GETDATE()),
           ('002', ' G2', 1, GETDATE()),
		   ('003', ' G3', 1, GETDATE()),
		   ('004', ' G4', 1, GETDATE()),
		   ('005', ' G5', 1, GETDATE())
GO

INSERT INTO Reserva (descripcion, clave, fechaComenzo, fechaTermina, idCliente, idAgencia, idUsuarioCrea, fechaCrea)
    VALUES ('Coche en Reserva', ' R1', GETDATE(), GETDATE(), 2, 3, 1, GETDATE()),
           ('Coche en Reserva', ' R2', GETDATE(), GETDATE(), 5, 2, 1, GETDATE()),
           ('Coche en Reserva', ' R3', GETDATE(), GETDATE(), 1, 4, 1, GETDATE()),
           ('Coche en Reserva', ' R4', GETDATE(), GETDATE(), 4, 5, 1, GETDATE()),
           ('Coche en Reserva', ' R5', GETDATE(), GETDATE(), 2, 1, 1, GETDATE())
GO 

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Usuario
SELECT * FROM Agencia
SELECT * FROM Cliente
SELECT * FROM Coche
SELECT * FROM Garaje
SELECT * FROM Reserva

--Borrar Registros CUIDADO!!!!!!!!!!!!!!--

DELETE FROM Cliente WHERE idCliente = 3
DELETE FROM Coche WHERE idCoche = 4

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Cliente
SELECT * FROM Coche
GO


-----------------------------VISTAS-----------------------------

CREATE VIEW ReservaClienteCantidad AS SELECT r.idCliente, count (c.idCliente) as cantidad
FROM Reserva r INNER JOIN Cliente c ON r.idCliente = c.idCliente WHERE
c.idCliente = 2 GROUP BY r.idCliente
GO

CREATE VIEW ReservaAgenciaCantidad AS SELECT r.idAgencia, count (a.idAgencia) as cantidad
FROM Reserva r INNER JOIN Agencia a ON r.idAgencia = a.idAgencia WHERE
a.idAgencia = 3 GROUP BY r.idAgencia
GO

CREATE VIEW ReservaClaveAgenciaNombre AS SELECT r.idReserva, r.clave, a.idAgencia, a.nombre
FROM Reserva r INNER JOIN Agencia a ON r.idAgencia = a.idAgencia WHERE
a.idAgencia = 1 
GO

CREATE VIEW ReservaClientesNombres AS SELECT r.idReserva, c.nombre, c.apellidoPaterno, c.apellidoMaterno
FROM Reserva r INNER JOIN Cliente c ON r.idCliente = c.idCliente WHERE
c.idCliente = 1 
GO

CREATE VIEW ReservaClientesDescripcion AS SELECT r.descripcion, c.clave
FROM Reserva r INNER JOIN Cliente c ON r.idCliente = c.idCliente WHERE
c.idCliente = 3
GO

