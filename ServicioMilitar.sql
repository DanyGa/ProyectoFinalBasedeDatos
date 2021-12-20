------------------------------CREAR------------------------------
USE master
GO

IF DB_ID (N'ServicioMilitar') IS NOT NULL
DROP DATABASE ServicioMilitar;
GO

CREATE DATABASE ServicioMilitar
ON 
(NAME = ServicioMilitar_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\ServicioMilitar.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
( NAME = ServicioMilitar_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\ServicioMilitar.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB) ;
GO

USE ServicioMilitar
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

CREATE TABLE Compañia
(
    idCompañia int IDENTITY (1,1),
    actividad varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCompañia PRIMARY KEY (idCompañia)
)

CREATE TABLE Cuartel
(
    idCuartel int IDENTITY (1,1),
    ubicacion varchar (50) not null,
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCuartel PRIMARY KEY (idCuartel)
)

CREATE TABLE Cuerpo
(
    idCuerpo int IDENTITY (1,1),
    denominacion varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCuerpo PRIMARY KEY (idCuerpo)
)

CREATE TABLE Servicio
(
    idServicio int IDENTITY (1,1),
    descripcion varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKServicio PRIMARY KEY (idServicio)
)

CREATE TABLE Soldado
(
    idSoldado int IDENTITY (1,1),
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
    grado varchar (50) not null,
    idCompañia int not null,
    idCuartel int not null,
    idCuerpo int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKSoldado PRIMARY KEY (idSoldado)
)

CREATE TABLE CompañiaCuartel
(
    idCompañiaCuartel int IDENTITY (1,1),
    idCompañia int not null,
    idCuartel int not null,
	estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCompañiaCuartel PRIMARY KEY (idCompañiaCuartel)
)

CREATE TABLE ServicioSoldado
(
    idServicioSoldado int IDENTITY (1,1),
    idServicio int not null,
    idSoldado int not null,
    fecha datetime not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKServicioSoldado PRIMARY KEY (idServicioSoldado)
)

-----------------------------INDEX-----------------------------

CREATE INDEX IX_Usuario ON Usuario(idUsuario)
GO
CREATE INDEX IX_Compañia ON Compañia(idCompañia);
GO
CREATE INDEX IX_Cuartel ON Cuartel(idCuartel);
GO
CREATE INDEX IX_Cuerpo ON Cuerpo(idCuerpo);
GO
CREATE INDEX IX_Servicio ON Servicio(idServicio);
GO
CREATE INDEX IX_Soldado ON Soldado(idSoldado);
GO
CREATE INDEX IXC_ompañiaCuartel ON CompañiaCuartel(idCompañiaCuartel);
GO
CREATE INDEX IX_ServicioSoldado ON ServicioSoldado(idServicioSoldado);
GO

-----------------------------RELACIONES-----------------------------

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Compañia
ADD CONSTRAINT FKCompañiaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Compañia
ADD CONSTRAINT FKCompañiaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Cuartel
ADD CONSTRAINT FKCuartelUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Cuartel
ADD CONSTRAINT FKCuartelUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Cuerpo
ADD CONSTRAINT FKCuerpoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Cuerpo
ADD CONSTRAINT FKCuerpoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Servicio
ADD CONSTRAINT FKServicioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Servicio
ADD CONSTRAINT FKServicioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Soldado
ADD CONSTRAINT FKSoldadoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Soldado
ADD CONSTRAINT FKSoldadoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Soldado
ADD CONSTRAINT FKSoldadoCompañia 
FOREIGN KEY (idCompañia) REFERENCES Compañia(idCompañia)

ALTER TABLE Soldado
ADD CONSTRAINT FKSoldadoCuartel 
FOREIGN KEY (idCuartel) REFERENCES Cuartel(idCuartel)

ALTER TABLE Soldado
ADD CONSTRAINT FKSoldadoCuerpo 
FOREIGN KEY (idCuerpo) REFERENCES Cuerpo(idCuerpo)

ALTER TABLE CompañiaCuartel
ADD CONSTRAINT FKCompañiaCuartelUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE CompañiaCuartel
ADD CONSTRAINT FKCompañiaCuartelUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE CompañiaCuartel
ADD CONSTRAINT FKCompañiaCuartelCompañia 
FOREIGN KEY (idCompañia) REFERENCES Compañia(idCompañia)

ALTER TABLE CompañiaCuartel
ADD CONSTRAINT FKCompañiaCuartelCuartel 
FOREIGN KEY (idCuartel) REFERENCES Compañia(idCompañia)

ALTER TABLE ServicioSoldado
ADD CONSTRAINT FKServicioSoldadoServicio 
FOREIGN KEY (idServicio) REFERENCES Servicio(idServicio)

ALTER TABLE ServicioSoldado
ADD CONSTRAINT FKServicioSoldadoSoldado 
FOREIGN KEY (idSoldado) REFERENCES Soldado(idSoldado)

ALTER TABLE ServicioSoldado
ADD CONSTRAINT FKServicioSoldadoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE ServicioSoldado
ADD CONSTRAINT FKCServicioSoldadoUsuarioModifica 
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

INSERT INTO Compañia (actividad, idUsuarioCrea, fechaCrea)
    VALUES ('Actividad1', 1, GETDATE()),
           ('Actividad2', 1, GETDATE()),
           ('Actividad3', 1, GETDATE()),
           ('Actividad4', 1, GETDATE()),
           ('Actividad5', 1, GETDATE())
GO
INSERT INTO Cuartel (nombre, ubicacion, idUsuarioCrea, fechaCrea)
    VALUES ('Cuartel1', 'Ubicacion1', 1, GETDATE()),
           ('Cuartel2', 'Ubicacion2', 1, GETDATE()),
           ('Cuartel3', 'Ubicacion3', 1, GETDATE()),
           ('Cuartel4', 'Ubicacion4', 1, GETDATE()),
           ('Cuartel5', 'Ubicacion5', 1, GETDATE())
GO
INSERT INTO Cuerpo (denominacion, idUsuarioCrea, fechaCrea)
    VALUES ('Denominacion1', 1, GETDATE()),
           ('Denominacion2', 1, GETDATE()),
           ('Denominacion3', 1, GETDATE()),
           ('Denominacion4', 1, GETDATE()),
           ('Denominacion5', 1, GETDATE())
GO
INSERT INTO Servicio (descripcion, idUsuarioCrea, fechaCrea)
    VALUES ('Descripcion1', 1, GETDATE()),
           ('Descripcion2', 1, GETDATE()),
           ('Descripcion3', 1, GETDATE()),
           ('Descripcion4', 1, GETDATE()),
           ('Descripcion5', 1, GETDATE())
GO       
INSERT INTO Soldado (apellidoPaterno, apellidoMaterno, nombre, grado, idCompañia, idCuartel, idCuerpo, idUsuarioCrea, fechaCrea)
    VALUES ('Castillo',' Boone', ' Maria', ' Grado1', 1, 2, 3, 1, GETDATE()),
           ('Escobedo',' Martinez', ' Veronica', ' Grado2', 4, 5, 1, 1, GETDATE()),
           ('Cortez',' Hernandez', ' Jared', ' Grado3', 2, 3, 4, 1, GETDATE()),
           ('Lugo',' Aguayo', ' Lucia', ' Grado4', 5, 1, 2, 1, GETDATE()),
           ('Sanchez',' Cardenas', ' Carmen', ' Grado5', 3, 4, 5, 1, GETDATE())
GO   
INSERT INTO CompañiaCuartel (idCompañia, idCuartel, idUsuarioCrea, fechaCrea)
    VALUES (1, 5, 1, GETDATE()),
           (2, 4, 1, GETDATE()),
           (3, 3, 1, GETDATE()),
           (4, 2, 1, GETDATE()),
           (5, 1, 1, GETDATE())
GO

INSERT INTO ServicioSoldado (idServicio, idSoldado, fecha, idUsuarioCrea, fechaCrea)
    VALUES (1, 2, GETDATE(), 1, GETDATE()),
           (3, 4, GETDATE(), 1, GETDATE()),
           (5, 5, GETDATE(), 1, GETDATE()),
           (4, 3, GETDATE(), 1, GETDATE()),
           (2, 1, GETDATE(), 1, GETDATE())
GO

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Usuario
SELECT * FROM Compañia
SELECT * FROM Cuartel
SELECT * FROM Cuerpo
SELECT * FROM Servicio
SELECT * FROM Soldado
SELECT * FROM CompañiaCuartel
SELECT * FROM ServicioSoldado

--Borrar Registros CUIDADO!!!!!!!!!!!!!!--

DELETE FROM CompañiaCuartel WHERE idCompañiaCuartel = 3
DELETE FROM ServicioSoldado WHERE idServicioSoldado = 4

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM CompañiaCuartel
SELECT * FROM ServicioSoldado
GO

-----------------------------VISTAS-----------------------------

CREATE VIEW SoldadosCompañiaCantidad AS Select s.idCompañia, count(c.idCompañia) as cantidad
FROM Soldado s INNER JOIN Compañia c ON s.idCompañia = c.idCompañia WHERE
c.idCompañia = 2 GROUP BY s.idCompañia
GO

CREATE VIEW SoldadosCuartelCantidad AS Select s.idCuartel, count(cu.idCuartel) as cantidad
FROM Soldado s INNER JOIN Cuartel cu ON s.idCuartel = cu.idCuartel WHERE
cu.idCuartel = 3 GROUP BY s.idCuartel
GO

CREATE VIEW SoldadosCuerpoCantidad AS Select s.idCuerpo, count(cue.idCuerpo) as cantidad
FROM Soldado s INNER JOIN Cuerpo cue ON s.idCuerpo = cue.idCuerpo WHERE
cue.idCuerpo = 1 GROUP BY s.idCuerpo
GO

CREATE VIEW SoldadoCompañiaInfo AS SELECT s.idSoldado, s.nombre, s.apellidoPaterno, c.actividad 
FROM Soldado s INNER JOIN Compañia c ON s.idCompañia = c.idCompañia
WHERE c.idCompañia = 1 GROUP BY s.idSoldado, s.nombre, s.apellidoPaterno, c.actividad
GO

CREATE VIEW SoldadoCuartelInfo AS SELECT s.idSoldado, s.nombre, s.apellidoPaterno, cu.ubicacion
FROM Soldado s INNER JOIN Cuartel cu ON s.idCuartel = cu.idCuartel
WHERE cu.idCuartel >= 1 GROUP BY s.idSoldado, s.nombre, s.apellidoPaterno, cu.ubicacion
GO
