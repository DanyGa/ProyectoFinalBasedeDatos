------------------------------CREAR------------------------------
USE master
GO

IF DB_ID (N'USE LineasdelTren') IS NOT NULL
DROP DATABASE  LineasdelTren
GO
CREATE DATABASE  LineasdelTren
ON 
(NAME = LineasdelTren_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\LineasdelTren.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
( NAME = LineasdelTren_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\LineasdelTren.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB) ;
GO

USE LineasdelTren
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

CREATE TABLE Acceso
(
    idAcceso int IDENTITY,
    descripcion varchar (50) not null,
    ubicacion varchar (50) not null,
    idEstacion int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKAcceso PRIMARY KEY(idAcceso)
)

CREATE TABLE Cochera
(
    idCochera int IDENTITY,
    nombre varchar (50) not null,
    idEstacion int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCochera PRIMARY KEY(idCochera)
)

CREATE TABLE Estacion
(
    idEstacion int IDENTITY,
    nombre varchar (50) not null,
	ubicacion varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKEstacion PRIMARY KEY(idEstacion)
)

CREATE TABLE Linea
(
    idLinea int IDENTITY,
    nombre varchar (50) not null,
	ruta varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKLinea PRIMARY KEY(idLinea)
)

CREATE TABLE Tren
(
    idTren int IDENTITY,
    modelo varchar (50) not null,
    numeroVagones int not null,
	idLinea int not null,
	idCochera int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTren PRIMARY KEY(idTren)
)

CREATE TABLE AccesoLinea
(
    idAccesoLinea int IDENTITY,
    idAcceso int not null,
    idLinea int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKAccesoLinea PRIMARY KEY(idAccesoLinea)
)

CREATE TABLE LineaEstacion
(
    idLineaEstacion int IDENTITY,
    idLinea int not null,
    idEstacion int not null,
	orden varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKLineaEstacion PRIMARY KEY(idLineaEstacion)
)

-----------------------------INDEX-----------------------------

CREATE INDEX IX_Usuario ON Usuario(idUsuario)
GO
CREATE INDEX IX_Acceso ON Acceso(idAcceso)
GO
CREATE INDEX IX_Cochera ON Cochera(idCochera)
GO
CREATE INDEX IX_Estacion ON Estacion(idEstacion)
GO
CREATE INDEX IX_Linea ON Linea(idLinea)
GO
CREATE INDEX IX_Tren ON Tren(idTren)
GO
CREATE INDEX IX_AccesoLinea ON AccesoLinea(idAccesoLinea)
GO
CREATE INDEX IXEstacionLinea ON LineaEstacion(idLineaEstacion)
GO

-----------------------------RELACIONES-----------------------------

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Acceso
ADD CONSTRAINT FKAccesoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Acceso
ADD CONSTRAINT FKAccesoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Acceso
ADD CONSTRAINT FKAccesoEstacion 
FOREIGN KEY (idEstacion) REFERENCES Estacion(idEstacion)

ALTER TABLE Cochera
ADD CONSTRAINT FKCocheraUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Cochera
ADD CONSTRAINT FKCocheraUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Cochera
ADD CONSTRAINT FKCocheraEstacion 
FOREIGN KEY (idEstacion) REFERENCES Estacion(idEstacion)

ALTER TABLE Estacion
ADD CONSTRAINT FKEstacionUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Estacion
ADD CONSTRAINT FKEstacionUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Linea
ADD CONSTRAINT FKLineaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Linea
ADD CONSTRAINT FKLineaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Tren
ADD CONSTRAINT FKTrenUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Tren
ADD CONSTRAINT FKTrenLinea 
FOREIGN KEY (idLinea) REFERENCES Linea(idLinea)

ALTER TABLE Tren
ADD CONSTRAINT FKTrenCochera
FOREIGN KEY (idCochera) REFERENCES Cochera(idCochera)

ALTER TABLE Tren
ADD CONSTRAINT FKTrenUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE AccesoLinea
ADD CONSTRAINT FKAccesoLineaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE AccesoLinea
ADD CONSTRAINT FKAccesoLineaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE AccesoLinea
ADD CONSTRAINT FKAccesoLineaAcceso 
FOREIGN KEY (idAcceso) REFERENCES Acceso(idAcceso)

ALTER TABLE AccesoLinea
ADD CONSTRAINT FKAccesoLineaLinea 
FOREIGN KEY (idLinea) REFERENCES Acceso(idAcceso)

ALTER TABLE LineaEstacion
ADD CONSTRAINT FKLineaEstacionUsuarioCrea 
FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE LineaEstacion
ADD CONSTRAINT FKEstacionLineaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE LineaEstacion
ADD CONSTRAINT FKLineaEstacionLinea 
FOREIGN KEY (idLinea)
REFERENCES Linea(idLinea)

ALTER TABLE LineaEstacion
ADD CONSTRAINT FKLineaEstacionEstacion 
FOREIGN KEY (idEstacion)
REFERENCES Estacion(idEstacion)

---------------POBLAR
-----------------------------RELACIONES-----------------------------

INSERT INTO Usuario (apellidoPaterno, apellidoMaterno, nombre, correo, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Munoz', ' Garcia', ' Daniela', ' DaGaMu@ghotmail.com', ' 12345.', 1, GETDATE()),
           ('Velazquez', ' Juarez', ' Edith', ' vejued@hotmal.com', ' 67891.', 1, GETDATE()),
           ('Fernandez', ' Lopez', ' Luis', ' Soccer19@outlook.com', ' 13467.', 1, GETDATE()),
           ('Rodriguez',' Gomez', ' Andrea', ' 06and06@gmail.com', ' 25897.', 1, GETDATE()),
           ('Torres', ' Garza', ' Yakelinne', ' yaki2425@gmail.com', ' 15973.', 1, GETDATE())
GO

INSERT INTO Estacion (nombre, ubicacion, idUsuarioCrea, fechaCrea)
    VALUES ('Estacion1', ' Ubicacion1', 1, GETDATE()),
           ('Estacion2', ' Ubicacion2', 1, GETDATE()),
           ('Estacion3', ' Ubicacion3', 1, GETDATE()),
           ('Estacion4', ' Ubicacion4', 1, GETDATE()),
           ('Estacion5', ' Ubicacion5', 1, GETDATE())
GO

INSERT INTO Acceso (descripcion, ubicacion, idEstacion, idUsuarioCrea, fechaCrea)
    VALUES ('Descripcion1', ' Ubicacion1', 1, 1, GETDATE()),
           ('Descripcion2', ' Ubicacion2', 2, 1, GETDATE()),
           ('Descripcion3', ' Ubicacion3', 3, 1, GETDATE()),
           ('Descripcion4', ' Ubicacion4', 4, 1, GETDATE()),
           ('Descripcion5', ' Ubicacion5', 5, 1, GETDATE())
GO

INSERT INTO Cochera (nombre, idEstacion, idUsuarioCrea, fechaCrea)
    VALUES ('Cochera1', 1, 1, GETDATE()),
           ('Cochera2', 2, 1, GETDATE()),
           ('Cochera3', 3, 1, GETDATE()),
           ('Cochera4', 4, 1, GETDATE()),
           ('Cochera5', 5, 1, GETDATE())
GO

INSERT INTO Linea (nombre, ruta, idUsuarioCrea, fechaCrea)
    VALUES ('Linea1', 'Ruta1', 1, GETDATE()),
           ('Linea2', 'Ruta2', 1, GETDATE()),
           ('Linea3', 'Ruta3', 1, GETDATE()),
           ('Linea4', 'Ruta4', 1, GETDATE()),
           ('Linea5', 'Ruta5', 1, GETDATE())
GO

INSERT INTO Tren (modelo, numeroVagones, idLinea, idCochera, idUsuarioCrea, fechaCrea)
    VALUES ('Modelo1', 10, 1, 5, 1, GETDATE()),
           ('Modelo2', 10, 2, 3,1, GETDATE()),
           ('Modelo3', 15, 4, 1, 1, GETDATE()),
           ('Modelo4', 15, 5, 4, 1, GETDATE()),
           ('Modelo5', 20, 3, 2, 1, GETDATE())
GO

INSERT INTO AccesoLinea (idAcceso, idLinea, idUsuarioCrea, fechaCrea)
    VALUES (1, 5, 1, GETDATE()),
           (2, 4, 1, GETDATE()),
           (3, 3, 1, GETDATE()),
           (4, 2, 1, GETDATE()),
           (5, 1, 1, GETDATE())
GO


INSERT INTO LineaEstacion(idLinea, idEstacion, orden, idUsuarioCrea, fechaCrea)
    VALUES (1, 2, 'Orden1', 1, GETDATE()),
           (3, 4, 'Orden2', 1, GETDATE()),
           (5, 5, 'Orden3', 1, GETDATE()),
           (4, 3, 'Orden4', 1, GETDATE()),
           (2, 1, 'Orden5', 1, GETDATE())
GO

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Usuario
SELECT * FROM Acceso
SELECT * FROM Cochera
SELECT * FROM Estacion
SELECT * FROM Linea
SELECT * FROM Tren
SELECT * FROM AccesoLinea
SELECT * FROM LineaEstacion

--Borrar Registros CUIDADO!!!!!!!!!!!!!!--

DELETE FROM AccesoLinea WHERE idAccesoLinea = 3
DELETE FROM LineaEstacion WHERE idLineaEstacion = 4

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM AccesoLinea
SELECT * FROM LineaEstacion
GO
-----------------------------VISTAS-----------------------------

CREATE VIEW AccesoEstacionCantidad AS SELECT a.idEstacion ,count (e.idEstacion) as cantidad
FROM Acceso a INNER JOIN Estacion e ON a.idEstacion = e.idEstacion WHERE
e.idEstacion = 2 GROUP BY a.idEstacion
GO

CREATE VIEW CocheraEstacionCantidad AS SELECT c.idEstacion ,count (e.idEstacion) as cantidad
FROM Cochera c INNER JOIN Estacion e ON c.idEstacion = e.idEstacion WHERE
e.idEstacion = 3 GROUP BY c.idEstacion
GO

CREATE VIEW TrenLineaCantidad AS SELECT t.idLinea, count (l.idLinea) as cantidad
FROM Tren T INNER JOIN Linea l ON t.idLinea = l.idLinea WHERE
l.idLinea = 1 GROUP BY t.idLinea
GO

CREATE VIEW TrenCocheraCantidad AS SELECT t.idCochera, count (c.idCochera) as cantidad
FROM Tren T INNER JOIN Cochera c ON t.idCochera = c.idCochera WHERE
c.idCochera = 1 GROUP BY t.idCochera
GO

CREATE VIEW TrenLinea AS SELECT t.idTren, t.numeroVagones, l.nombre, l.ruta
FROM Tren t INNER JOIN Linea l ON t.idLinea = l.idLinea WHERE
l.idLinea >= 1 GROUP BY t.idTren, t.numeroVagones, l.nombre, l.ruta
GO
