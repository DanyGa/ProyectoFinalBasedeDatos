------------------------------CREAR------------------------------
USE master
GO

IF DB_ID (N'AgenciadeViajesII') IS NOT NULL
DROP DATABASE AgenciadeViajesII;
GO
CREATE DATABASE AgenciadeViajesII
ON 
(NAME = AgenciadeViajesII_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\AgenciaDeViajesII.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
( NAME = AgenciadeViajes_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\AgenciaDeViajesII.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB) ;
GO

USE AgenciadeViajesII
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
    idCliente int IDENTITY,
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
    telefono char (10) not null,
    idHotel int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCliente PRIMARY KEY(idCliente)
)

CREATE TABLE Hotel
(
    idHotel int IDENTITY,
    nombre varchar (50) not null,
    plazasDisponibles int not null,
    codigoPostal char (5) not null,
	calle varchar (50) not null,
	numero char (5) not null,
	colonia varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKHotel PRIMARY KEY(idHotel)
)

CREATE TABLE PuntoDeRuta
(
    idPuntoDeRuta int IDENTITY,
    descripcion varchar (50) not null,
    tipo char (1) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPuntoDeRuta PRIMARY KEY(idPuntoDeRuta)
)

CREATE TABLE Tour
(
    idTour int IDENTITY,
    fecha datetime not null,
    finalidad varchar (50) not null,
	costos numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTour PRIMARY KEY(idTour)
)

CREATE TABLE ClienteHotel
(
    idClienteHotel int IDENTITY,
    idCliente int not null,
    idHotel int not null,
	fechaEntrada datetime not null,
	FechaSalida datetime not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKClienteHotel PRIMARY KEY(idClienteHotel)
)

CREATE TABLE ClienteTour
(
    idClienteTour int IDENTITY,
    idCliente int not null,
    idTour int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKClienteTour PRIMARY KEY(idClienteTour)
)

CREATE TABLE HotelPuntoDeRuta
(
    idHotelPuntoDeRuta int IDENTITY,
    idHotel int not null,
    idPuntoDeRuta int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKHotelPuntoDeRuta PRIMARY KEY(idHotelPuntoDeRuta)
)

CREATE TABLE PuntoDeRutaTour
(
    idPuntoDeRutaTour int IDENTITY,
    idPuntoDeRuta int not null,
    idTour int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPuntoDeRutaTour PRIMARY KEY(idPuntoDeRutaTour)
)

-----------------------------INDEX-----------------------------

CREATE INDEX IX_Usuario ON Usuario(idUsuario)
GO
CREATE INDEX IX_Cliente ON Cliente(idCliente)
GO
CREATE INDEX IX_Hotel ON Hotel(idHotel)
GO
CREATE INDEX IX_PuntoDeRuta ON PuntoDeRuta(idPuntoDeRuta)
GO
CREATE INDEX IX_Tour ON Tour(idTour)
GO
CREATE INDEX IX_ClienteHotel ON ClienteHotel(idClienteHotel)
GO
CREATE INDEX IX_ClienteTour ON ClienteTour(idClienteTour)
GO
CREATE INDEX IX_HotelPuntoDeRuta ON HotelPuntoDeRuta(idHotelPuntoDeRuta)
GO
CREATE INDEX IX_PuntoDeRutaTour ON PuntoDeRutaTour(idPuntoDeRutaTour)
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
ADD CONSTRAINT FKClienteHotel 
FOREIGN KEY (idHotel) REFERENCES Hotel(idHotel)

ALTER TABLE Hotel
ADD CONSTRAINT FKHotelUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Hotel
ADD CONSTRAINT FKHotelUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE PuntoDeRuta
ADD CONSTRAINT FKPuntoDeRutaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE PuntoDeRuta
ADD CONSTRAINT FKPuntoDeRutaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Tour
ADD CONSTRAINT FKTourUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Tour
ADD CONSTRAINT FKTourUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE ClienteHotel
ADD CONSTRAINT FKClienteHotelUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE ClienteHotel
ADD CONSTRAINT FKClienteHotelUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE ClienteHotel
ADD CONSTRAINT FKClienteHotelCliente
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)

ALTER TABLE ClienteHotel
ADD CONSTRAINT FKClienteHotelHotel
FOREIGN KEY (idHotel) REFERENCES Hotel(idHotel)

ALTER TABLE ClienteTour
ADD CONSTRAINT FKClienteTourUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE ClienteTour
ADD CONSTRAINT FKClienteTourUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE ClienteTour
ADD CONSTRAINT FKClienteTourCliente 
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)

ALTER TABLE ClienteTour
ADD CONSTRAINT FKClienteTourTour 
FOREIGN KEY (idTour) REFERENCES Tour(idTour)

ALTER TABLE HotelPuntoDeRuta
ADD CONSTRAINT FKHotelPuntoDeRutaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE HotelPuntoDeRuta
ADD CONSTRAINT FKHotelPuntoDeRutaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE HotelPuntoDeRuta
ADD CONSTRAINT FKHotelPuntoDeRutaHotel 
FOREIGN KEY (idHotel) REFERENCES Hotel(idHotel)

ALTER TABLE HotelPuntoDeRuta
ADD CONSTRAINT FKHotelPuntoDeRutaPuntoDeRuta 
FOREIGN KEY (idPuntoDeRuta) REFERENCES PuntoDeRuta(idPuntoDeRuta)

ALTER TABLE PuntoDeRutaTour
ADD CONSTRAINT FKPuntoDeRutaTourUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE PuntoDeRutaTour
ADD CONSTRAINT FKPuntoDeRutaTourUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE PuntoDeRutaTour
ADD CONSTRAINT FKPuntoDeRutaTourPuntoDeRuta 
FOREIGN KEY (idPuntoDeRuta) REFERENCES PuntoDeRuta(idPuntoDeRuta)

ALTER TABLE PuntoDeRutaTour
ADD CONSTRAINT FKPuntoDeRutaTourTour 
FOREIGN KEY (idTour) REFERENCES Tour(idTour)

---------------POBLAR
-----------------------------RELACIONES-----------------------------

INSERT INTO Usuario (apellidoPaterno, apellidoMaterno, nombre, correo, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Munoz', ' Garcia', ' Daniela', ' DaGaMu@ghotmail.com', ' 12345.', 1, GETDATE()),
           ('Velazquez', ' Juarez', ' Edith', ' vejued@hotmal.com', ' 67891.', 1, GETDATE()),
           ('Fernandez', ' Lopez', ' Luis', ' Soccer19@outlook.com', ' 13467.', 1, GETDATE()),
           ('Rodriguez',' Gomez', ' Andrea', ' 06and06@gmail.com', ' 25897.', 1, GETDATE()),
           ('Torres', ' Garza', ' Yakelinne', ' yaki2425@gmail.com', ' 15973.', 1, GETDATE())
GO

INSERT INTO Hotel (nombre, codigoPostal, calle, numero, colonia, plazasDisponibles, idUsuarioCrea, fechaCrea)
    VALUES ('Hotel1', '12345', ' CalleM', '1436', ' ColoniaM', 35, 1, GETDATE()),
           ('Hotel2', '67891', ' CalleS', '1425', ' ColoniaS', 40, 1, GETDATE()),
           ('Hotel3', '23456', ' CalleC', '2569', ' ColoniaC', 12, 1, GETDATE()),
           ('Hotel4', '78952', ' CalleT', '4736', ' ColoniaT', 32, 1, GETDATE()),
           ('Hotel5', '15789', ' CalleZ', '2598', ' ColoniaZ', 14, 1, GETDATE())
GO

INSERT INTO Cliente (apellidoPaterno, apellidoMaterno, nombre, telefono, idHotel, idUsuarioCrea, fechaCrea)
    VALUES ('Castillo',' Boone', ' Maria', '8661206835', 3, 1, GETDATE()),
           ('Escobedo',' Martinez', ' Veronica', '8667896532', 1, 1, GETDATE()),
           ('Cortez',' Hernandez', ' Jared', '8661234578', 4, 1, GETDATE()),
           ('Lugo',' Aguayo', ' Lucia', '8663572468', 2, 1, GETDATE()),
           ('Sanchez',' Cardenas', ' Carmen', '8664716952', 5, 1, GETDATE())
GO

INSERT INTO PuntoDeRuta (descripcion, tipo, idUsuarioCrea, fechaCrea)
    VALUES ('Descripcion1', 'T', 1, GETDATE()),
           ('Descripcion2', 'X', 1, GETDATE()),
           ('Descripcion3', 'T', 1, GETDATE()),
           ('Descripcion4', 'X', 1, GETDATE()),
           ('Descripcion5', 'T', 1, GETDATE())
GO

INSERT INTO Tour (fecha, finalidad, costos, idUsuarioCrea, fechaCrea)
    VALUES (GETDATE(), ' Deportivo, Cultural', 1234.00, 1, GETDATE()),
           (GETDATE(), ' Deportivo', 4758.00,1, GETDATE()),
           (GETDATE(), ' Vacacional', 4863.00, 1, GETDATE()),
           (GETDATE(), ' Trabajo', 5675.00, 1, GETDATE()),
           (GETDATE(), ' Escolar', 1757.00, 1, GETDATE())
GO

INSERT INTO ClienteHotel (idCliente, idHotel, fechaEntrada, fechaSalida, idUsuarioCrea, fechaCrea)
    VALUES (1, 5, GETDATE(), GETDATE(), 1, GETDATE()),
           (2, 4, GETDATE(), GETDATE(), 1, GETDATE()),
           (3, 3, GETDATE(), GETDATE(), 1, GETDATE()),
           (4, 2, GETDATE(), GETDATE(), 1, GETDATE()),
           (5, 1, GETDATE(), GETDATE(), 1, GETDATE())
GO

INSERT INTO ClienteTour (idCliente, idTour, idUsuarioCrea, fechaCrea)
    VALUES (1, 2, 1, GETDATE()),
           (3, 4, 1, GETDATE()),
           (5, 5, 1, GETDATE()),
           (4, 3, 1, GETDATE()),
           (2, 1, 1, GETDATE())
GO

INSERT INTO HotelPuntoDeRuta (idHotel, idPuntoDeRuta, idUsuarioCrea, fechaCrea)
    VALUES (5, 4, 1, GETDATE()),
           (3, 2, 1, GETDATE()),
           (1, 1, 1, GETDATE()),
           (2, 3, 1, GETDATE()),
           (4, 5, 1, GETDATE())
GO

INSERT INTO PuntoDeRutaTour (idPuntoDeRuta, idTour, idUsuarioCrea, fechaCrea)
    VALUES (1, 3, 1, GETDATE()),
           (4, 2, 1, GETDATE()),
           (5, 1, 1, GETDATE()),
           (2, 5, 1, GETDATE()),
           (3, 4, 1, GETDATE())
GO

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Usuario
SELECT * FROM Cliente
SELECT * FROM Hotel
SELECT * FROM PuntoDeRutaTour
SELECT * FROM Tour
SELECT * FROM ClienteTour
SELECT * FROM HotelPuntoDeRuta
SELECT * FROM PuntoDeRutaTour

--Borrar Registros CUIDADO!!!!!!!!!!!!!!--

DELETE FROM HotelPuntoDeRuta WHERE idHotelPuntoDeRuta = 3
DELETE FROM PuntoDeRutaTour WHERE idPuntoDeRutaTour = 4

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM HotelPuntoDeRuta
SELECT * FROM PuntoDeRutaTour
GO

-----------------------------VISTAS-----------------------------

CREATE VIEW ClienteHotelCantidad AS SELECT c.idHotel, count (h.idHotel) as cantidad
FROM Cliente c INNER JOIN Hotel h ON c.idHotel = h.idHotel WHERE
c.idCliente = 1 GROUP BY c.idHotel
GO

CREATE VIEW ClienteHotelDireccion AS  SELECT c.nombre, c.apellidoPaterno, h.idHotel, h.codigoPostal, h.calle, h.numero, h.colonia
FROM Cliente c INNER JOIN Hotel h ON c.idHotel = h.idHotel WHERE
h.idHotel >= 1 GROUP BY c.nombre, c.apellidoPaterno, h.idHotel, h.codigoPostal, h.calle, h.numero, h.colonia
GO

CREATE VIEW ClienteFechadeEntrada AS  SELECT c.idCliente, c.nombre, c.apellidoPaterno, ch.fechaEntrada
FROM ClienteHotel ch INNER JOIN Cliente c ON ch.idCliente = c.idCliente WHERE
c.idCliente >= 1 GROUP BY c.idCliente, c.nombre, c.apellidoPaterno, ch.fechaEntrada
GO
