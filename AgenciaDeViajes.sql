------------------------------CREAR------------------------------
USE master
GO

IF DB_ID (N'AgenciadeViajes') IS NOT NULL
DROP DATABASE AgenciadeViajes;
GO
CREATE DATABASE AgenciadeViajes
ON 
(NAME = AgenciadeViajes_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\AgenciaDeViajes.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
( NAME = AgenciadeViajes_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\AgenciaDeViajes.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB) ;
GO

USE AgenciadeViajes
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

CREATE TABLE Hotel
(
    idHotel int IDENTITY (1,1),
    nombre varchar (50) not null,
    estado varchar (50) not null,
    ciudad varchar (50) not null,
    codigoPostal char (5) not null,
	calle varchar (50) not null,
	numero char (5) not null,
	colonia varchar (50) not null,
    telefono char (10) not null,
    plazasDisponibles int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKHotel PRIMARY KEY(idHotel)
)

CREATE TABLE Sucursal
(
    idSucursal int IDENTITY (1,1),
    codigoPostal char (6) not null,
	calle varchar (50) not null,
	numero char (5) not null,
	colonia varchar (50) not null,
    telefono char (10) not null,
	numeroPlaza int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKSucursal PRIMARY KEY(idSucursal)
)

CREATE TABLE Turista
(
    idTurista int IDENTITY (1,1),
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
    codigoPostal char (5) not null,
	calle varchar (50) not null,
	numero char (5) not null,
	colonia varchar (50) not null,
    telefono char (10) not null,
    idHotel int not null,
    idSucursal int not null,
    idVuelo int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTurista PRIMARY KEY(idTurista)
)


CREATE TABLE Vuelo
(
    idVuelo int IDENTITY (1,1),
    fechaHora datetime not null,
    paisOrigen varchar (50) not null,
    estadoOrigen varchar (50) not null,
    ciudadOrigen varchar (50) not null,
    paisDestino varchar (50) not null,
    estadoDestino varchar (50) not null,
    ciudadDestino varchar (50) not null,
    plazasTotales int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKVuelo PRIMARY KEY(idVuelo)
)

-----------------------------INDEX-----------------------------

CREATE INDEX IX_Usuario ON Usuario(idUsuario)
GO
CREATE INDEX IX_Hotel ON Hotel(idHotel);
GO
CREATE INDEX IX_Sucursal ON Sucursal(idSucursal);
GO
CREATE INDEX IX_Turista ON Turista(idTurista);
GO
CREATE INDEX IX_Vuelo ON Vuelo(idVuelo);
GO

-----------------------------RELACIONES-----------------------------

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Hotel
ADD CONSTRAINT FKHotelUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Hotel
ADD CONSTRAINT FKHotelUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Sucursal
ADD CONSTRAINT FKSucursalUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Sucursal
ADD CONSTRAINT FKSucursalUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Turista
ADD CONSTRAINT FKTuristaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Turista
ADD CONSTRAINT FKTuristaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Turista
ADD CONSTRAINT FKTuristaHotel 
FOREIGN KEY (idHotel) REFERENCES Hotel(idHotel)

ALTER TABLE Turista
ADD CONSTRAINT FKTuristaSucursal 
FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal)

ALTER TABLE Turista
ADD CONSTRAINT FKTuristaVuelo 
FOREIGN KEY (idVuelo) REFERENCES Vuelo(idVuelo)

ALTER TABLE Vuelo
ADD CONSTRAINT FKVueloUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Vuelo
ADD CONSTRAINT FKVueloUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

---------------POBLAR
-----------------------------RELACIONES-----------------------------

INSERT INTO Usuario (apellidoPaterno, apellidoMaterno, nombre, correo, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Munoz', ' Garcia', ' Daniela', ' DaGaMu@ghotmail.com', ' 12345.', 1, GETDATE()),
           ('Velazquez', ' Juarez', ' Edith', ' vejued@hotmal.com', ' 67891.', 1, GETDATE()),
           ('Fernandez', ' Lopez', ' Luis', ' Soccer19@outlook.com', ' 13467.', 1, GETDATE()),
           ('Rodriguez',' Gomez', ' Andrea', ' 06and06@gmail.com', ' 25897.', 1, GETDATE()),
           ('Torres', ' Garza', ' Yakelinne', ' yaki2425@gmail.com', ' 15973.', 1, GETDATE())
GO


INSERT INTO Hotel (nombre, estado, ciudad, codigoPostal, calle, numero, colonia, telefono, plazasDisponibles, idUsuarioCrea, fechaCrea)
    VALUES ('Hotel1',' Nuevo Leon', ' Monterrey', '12345', ' CalleM', '1436', ' ColoniaM', '8661206835', 35, 1, GETDATE()),
           ('Hotel2',' Coahuila', ' Saltillo', '67891', ' CalleS', '1425', ' ColoniaS', '8661472536', 40, 1, GETDATE()),
           ('Hotel3', 'Chihuahua', ' Chihuahua', '23456', ' CalleC', '2569', ' ColoniaC', '8663987485', 12, 1, GETDATE()),
           ('Hotel4', ' Jalisco', ' Tequila', '78952', ' CalleT', '4736', ' ColoniaT', '8614758933', 32, 1, GETDATE()),
           ('Hotel5', 'Zacatecas', ' Zacatecas', '15789', ' CalleZ', '2598', ' ColoniaZ', '8642956978', 14, 1, GETDATE())
GO

INSERT INTO Sucursal (codigoPostal, calle, numero, colonia, telefono, numeroPlaza, idUsuarioCrea, fechaCrea)
    VALUES ('12345', ' CalleB', '7859', ' ColB', '8974561236', 1, 1, GETDATE()),
           ('65498', ' CalleT', '3658', ' ColT', '8132561436', 2, 1, GETDATE()),
           ('78945', ' CalleS', '7812', ' ColS', '8462536984', 1, 1, GETDATE()),
           ('32165', ' CalleI', '2658', ' ColI', '8651239845', 2, 1, GETDATE()),
           ('58961', ' CalleU', '1354', ' ColU', '8661234598', 1, 1, GETDATE())
GO

INSERT INTO Vuelo (fechaHora, paisOrigen, estadoOrigen, ciudadOrigen, paisDestino, estadoDestino, ciudadDestino, plazasTotales, idUsuarioCrea, fechaCrea)
    VALUES (GETDATE(), 'Estados Unidos', ' Arkansas', ' Little Rock', ' Mexico', 'Ciudad de México', 'Ciudad de Mexico', 65, 1, GETDATE()),
           (GETDATE(), 'Estados Unidos', ' Texas', ' Dallas', ' Mexico', ' Nuevo Leon', ' Monterrey', 45, 1, GETDATE()),
           (GETDATE(), 'Mexico',' Coahuila',' Monclova', ' Mexico', ' Jalisco', ' Guadalajara', 90, 1, GETDATE()),
		   (GETDATE(), 'Mexico', ' Nuevo Leon', ' Monterrey', ' Mexico', ' Guerrero', ' Acapulco', 70, 1, GETDATE()),
           (GETDATE(), 'Mexico',' Coahuia',' Muzquiz', ' Mexico', ' Coahuila', 'Saltillo', 55, 1, GETDATE())
GO

INSERT INTO Turista (apellidoPaterno, apellidoMaterno, nombre, codigoPostal, calle, numero, colonia, telefono, idHotel, idSucursal, idVuelo, idUsuarioCrea, fechaCrea)
    VALUES ('Castillo',' Boone', ' Maria', ' 2577', ' Calle1', ' 1234',' Colonia1', '8661206835', 1, 2, 3, 1, GETDATE()),
           ('Escobedo',' Martinez', ' Veronica', ' 2577', ' Calle2',' 6789', 'Colonia2', '8667896532', 4, 5, 1, 1, GETDATE()),
           ('Cortez',' Hernandez', ' Jared', ' 2577', ' Calle3', ' 0987', 'Colonia3','8661234578', 2, 3, 4, 1, GETDATE()),
           ('Lugo',' Aguayo', ' Lucia', ' 2577', ' Calle4',' 5432',' Colonia4', '8663572468', 5, 1, 2, 1, GETDATE()),
           ('Sanchez',' Cardenas', ' Carmen', ' 2577', ' Calle5',' 0147', ' Colonia5', '8664716952', 3, 4, 5, 1, GETDATE())
GO

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Usuario
SELECT * FROM Hotel
SELECT * FROM Sucursal
SELECT * FROM Turista
SELECT * FROM Vuelo

--Borrar Registros CUIDADO!!!!!!!!!!!!!!--

DELETE FROM Turista WHERE idTurista = 1

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Turista
GO
-----------------------------VISTAS-----------------------------

CREATE VIEW TuristaHotelCantidad AS SELECT t.idHotel, count (h.idHotel) as cantidad
FROM Turista t INNER JOIN Hotel h ON t.idHotel = h.idHotel WHERE
h.idHotel = 2 GROUP BY t.idHotel
GO

CREATE VIEW TuristaSucursalCantidad AS SELECT t.idSucursal, count (s.idSucursal) as cantidad
FROM Turista t INNER JOIN Sucursal s ON t.idSucursal = s.idSucursal WHERE
s.idSucursal = 3 GROUP BY t.idSucursal
GO

CREATE VIEW TuristaVueloCantidad AS SELECT t.idVuelo, count (v.idVuelo) as cantidad
FROM Turista t INNER JOIN Vuelo v ON t.idVuelo = v.idVuelo WHERE
v.idVuelo = 1 GROUP BY t.idVuelo
GO

CREATE VIEW TuristaHotelDireccion AS SELECT t.idTurista, t.nombre, h.idHotel, h.codigoPostal, h.calle, h.numero, h.colonia
FROM Turista t INNER JOIN Hotel h ON t.idHotel = h.idHotel WHERE
h.idHotel = 1 GROUP BY t.idTurista, t.nombre, h.idHotel, h.codigoPostal, h.calle, h.numero, h.colonia
GO

CREATE VIEW TuristaOrigen AS SELECT t.idTurista, t.nombre, v.idVuelo, v.paisOrigen, v.estadoOrigen, v.ciudadOrigen
FROM Turista t INNER JOIN Vuelo v ON t.idVuelo = v.idVuelo WHERE
v.idVuelo = 1 GROUP BY t.idTurista, t.nombre, v.idVuelo, v.paisOrigen, v.estadoOrigen, v.ciudadOrigen
GO