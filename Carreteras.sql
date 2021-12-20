------------------------------CREAR------------------------------
USE master
GO

IF DB_ID (N'Carreteras') IS NOT NULL
DROP DATABASE Carreteras;
GO

CREATE DATABASE Carreteras
ON 
( NAME = Carreteras_dat,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\Carreteras.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
( NAME = Carreteras_log,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\Carreteras.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB) ;
GO
USE Carreteras
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

CREATE TABLE Carretera
(
    idCarretera int IDENTITY (1, 1),
    nombre varchar (50) not null,
    numero varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCarretera PRIMARY KEY(idCarretera)
)

CREATE TABLE Municipio
(
    idMunicipio int IDENTITY (1,1),
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKMunicipio PRIMARY KEY(idMunicipio)
)

CREATE TABLE Tramo
(
    idTramo int IDENTITY (1,1),
    nombre varchar (50) not null,
    idCarretera int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTramo PRIMARY KEY(idTramo)
)

CREATE TABLE MunicipioTramo
(
    idMunicipioTramo int IDENTITY (1,1),
    idMunicipio int not null,
    idTramo int not null,
	kilometroEntrada numeric (10,2),
	kilometroSalida numeric (10,2),
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKMunicipioTramo PRIMARY KEY(idMunicipioTramo)
)


------------------------------INDEX------------------------------

CREATE INDEX IX_Usuario ON Usuario(idUsuario)
GO
CREATE INDEX IX_Carretera ON Carretera(idCarretera)
GO
CREATE INDEX IX_Municipio ON Municipio(idMunicipio)
GO
CREATE INDEX IX_Tramo ON Tramo(idTramo)
GO
CREATE INDEX IX_MunicipioTramo ON MunicipioTramo(idMunicipioTramo)
GO


------------------------------RELACIONES------------------------------

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE Carretera
ADD CONSTRAINT FKCarreteraUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE Carretera
ADD CONSTRAINT FKCarreteraUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE Municipio
ADD CONSTRAINT FKMunicipioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Municipio
ADD CONSTRAINT FKMunicipioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Tramo
ADD CONSTRAINT FKTramoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Tramo
ADD CONSTRAINT FKTramoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Tramo
ADD CONSTRAINT FKTramoCarretera
FOREIGN KEY (idCarretera) REFERENCES Carretera(idCarretera)

ALTER TABLE MunicipioTramo
ADD CONSTRAINT FKMunicipioTramoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE MunicipioTramo
ADD CONSTRAINT FKMunicipioTramoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE MunicipioTramo
ADD CONSTRAINT FKMunicipioTramoMunicipio
FOREIGN KEY (idMunicipio) REFERENCES Municipio(idMunicipio)

ALTER TABLE MunicipioTramo
ADD CONSTRAINT FKMunicipioTramoTramo
FOREIGN KEY (idTramo) REFERENCES Tramo(idTramo)


---------------POBLAR
------------------------------Insertar Registros------------------------------

INSERT INTO Usuario (apellidoPaterno, apellidoMaterno, nombre, correo, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Munoz', ' Garcia', ' Daniela', ' DaGaMu@ghotmail.com', ' 12345.', 1, GETDATE()),
           ('Velazquez', ' Juarez', ' Edith', ' vejued@hotmal.com', ' 67891.', 1, GETDATE()),
           ('Fernandez', ' Lopez', ' Luis', ' Soccer19@outlook.com', ' 13467.', 1, GETDATE()),
           ('Rodriguez',' Gomez', ' Andrea', ' 06and06@gmail.com', ' 25897.', 1, GETDATE()),
           ('Torres', ' Garza', ' Yakelinne', ' yaki2425@gmail.com', ' 15973.', 1, GETDATE())
GO


INSERT INTO Carretera (nombre, numero, idUsuarioCrea, fechaCrea)
    VALUES ('Carretera1', ' Numero1', 1, GETDATE()),
           ('Carretera2', ' Numero2', 1, GETDATE()),
           ('Carretera3', ' Numero2', 1, GETDATE()),
           ('Carretera4', ' Numero3', 1, GETDATE()),
           ('Carretera5', ' Numero4', 1, GETDATE())
GO

INSERT INTO Municipio(nombre, idUsuarioCrea, fechaCrea)
    VALUES ('Monclova', 1, GETDATE()),
           ('Monterrey', 1, GETDATE()),
           ('Saltillo', 1, GETDATE()),
           ('Frontera', 1, GETDATE()),
           ('Mina', 1, GETDATE())
GO

INSERT INTO Tramo (nombre, idCarretera, idUsuarioCrea, fechaCrea)
    VALUES ('Tramo1', 1, 1, GETDATE()),
           ('Tramo2', 2, 1, GETDATE()),
           ('Tramo3', 3, 1, GETDATE()),
           ('Tramo4', 4, 1, GETDATE()),
           ('Tramo5', 5, 1, GETDATE())
GO

INSERT INTO MunicipioTramo (idMunicipio, idTramo, kilometroEntrada, kilometroSalida, idUsuarioCrea, fechaCrea)
    VALUES (5, 1, 10.00, 20.00, 1, GETDATE()),
           (4, 2, 20.00, 30.00, 1, GETDATE()),
           (3, 3, 30.00, 40.00, 1, GETDATE()),
           (2, 4, 40.00, 50.00, 1, GETDATE()),
           (1, 5, 500.00, 60.00, 1, GETDATE())
GO

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Usuario
SELECT * FROM Carretera
SELECT * FROM Municipio
SELECT * FROM Tramo
SELECT * FROM MunicipioTramo

--Borrar Registros CUIDADO!!!!!!!!!!!!!!--

DELETE FROM MunicipioTramo WHERE idMunicipioTramo = 3

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM MunicipioTramo
GO

-----------------------------VISTAS-----------------------------

CREATE VIEW TramoCarreteraCantidad AS SELECT t.idCarretera ,count (c.idCarretera) as cantidad
FROM Tramo t INNER JOIN Carretera c ON t.idCarretera = c.idCarretera WHERE
c.idCarretera = 2 GROUP BY t.idCarretera
GO

CREATE VIEW MunicipioTramoInfo AS SELECT m.nombre, t.idTramo, mt.kilometroEntrada, mt.kilometroSalida
FROM Municipio m INNER JOIN MunicipioTramo mt ON m.idMunicipio = mt.idMunicipio INNER JOIN Tramo t ON mt.idTramo = t.idTramo WHERE
m.idMunicipio >= 1 GROUP BY m.nombre, t.idTramo, mt.kilometroEntrada, mt.kilometroSalida
GO


