------------------------------CREAR------------------------------
USE master
GO

IF DB_ID (N'Universidad') IS NOT NULL
DROP DATABASE Universidad;
GO
CREATE DATABASE Universidad
ON 
(NAME = Universidad_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\Universidad.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
( NAME = Universidad_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\Universidad.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB) ;
GO

USE Universidad
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

CREATE TABLE AreaConocimiento
(
    idAreaConocimiento int IDENTITY,
    descripcion varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKAreaConocimiento PRIMARY KEY(idAreaConocimiento)
)

CREATE TABLE Catedra
(
    idCatedra int IDENTITY,
    nombre varchar (50) not null,
	ubicacion varchar (50) not null,
    idDepartamento int not null,
    idFacultad int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCatedra PRIMARY KEY(idCatedra)
)

CREATE TABLE Departamento
(
    idDepartamento int IDENTITY,
    nombre varchar (50) not null,
    idAreaConocimiento int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKDepartamento PRIMARY KEY(idDepartamento)
)

CREATE TABLE Facultad
(
    idFacultad int IDENTITY,
    nombre varchar (50) not null,
	codigoPostal char (5) not null,
	calle varchar (50) not null,
	numero char (5) not null,
	colonia varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKFacultad PRIMARY KEY(idFacultad)
)

CREATE TABLE Profesor
(
    idProfesor int IDENTITY,
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
    RFC varchar (13) not null,
    idDepartamento int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKProfesor PRIMARY KEY(idProfesor)
)

CREATE TABLE CatedraProfesor
(
    idCatedraProfesor int IDENTITY,
    idCatedra int not null,
    idProfesor int not null,
    fechaAdscrito date not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCatedraProfesor PRIMARY KEY(idCatedraProfesor)
)

CREATE TABLE DepartamentoFacultad
(
    idDepartamentoFacultad int IDENTITY,
    idDepartamento int not null,
    idFacultad int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKDepartamentoFacultad PRIMARY KEY(idDepartamentoFacultad)
)

-----------------------------INDEX-----------------------------

CREATE INDEX IX_Usuario ON Usuario(idUsuario)
GO
CREATE INDEX IX_AreaConocimiento ON AreaConocimiento(idAreaConocimiento)
GO
CREATE INDEX IX_Catedra ON Catedra(idCatedra)
GO
CREATE INDEX IX_Departamento ON Departamento(idDepartamento)
GO
CREATE INDEX IX_Facultad ON Facultad(idFacultad)
GO
CREATE INDEX IX_Profesor ON Profesor(idProfesor)
GO
CREATE INDEX IX_DepartamentoFacultad ON DepartamentoFacultad(idDepartamentoFacultad)
GO
CREATE INDEX IX_CatedraProfesor ON CatedraProfesor(idCatedraProfesor)
GO

-----------------------------RELACIONES-----------------------------

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE AreaConocimiento
ADD CONSTRAINT FKAreaConocimientoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE AreaConocimiento
ADD CONSTRAINT FKAreaConocimientoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Catedra
ADD CONSTRAINT FKCatedraUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Catedra
ADD CONSTRAINT FKCatedraUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Catedra
ADD CONSTRAINT FKCatedraDepartamento 
FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento)

ALTER TABLE Catedra
ADD CONSTRAINT FKCatedraFacultad 
FOREIGN KEY (idFacultad) REFERENCES Facultad(idFacultad)

ALTER TABLE Departamento
ADD CONSTRAINT FKDepartamentoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Departamento
ADD CONSTRAINT FKDepartamentoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Departamento
ADD CONSTRAINT FKDepartamentoAreaConocimiento 
FOREIGN KEY (idAreaConocimiento)
REFERENCES AreaConocimiento(idAreaConocimiento)

ALTER TABLE Facultad
ADD CONSTRAINT FKFacultadUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Facultad
ADD CONSTRAINT FKFacultadUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Profesor
ADD CONSTRAINT FKProfesorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Profesor
ADD CONSTRAINT FKProfesorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Profesor
ADD CONSTRAINT FKProfesorDepartamento 
FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento)

ALTER TABLE CatedraProfesor
ADD CONSTRAINT FKCatedraProfesorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE CatedraProfesor
ADD CONSTRAINT FKCatedraProfesorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE CatedraProfesor
ADD CONSTRAINT FKCatedraProfesorCatedra 
FOREIGN KEY (idCatedra) REFERENCES Catedra(idCatedra)

ALTER TABLE CatedraProfesor
ADD CONSTRAINT FKCatedraProfesorProfesor 
FOREIGN KEY (idProfesor) REFERENCES Profesor(idProfesor)

ALTER TABLE DepartamentoFacultad
ADD CONSTRAINT FKDepartamentoFacultadUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE DepartamentoFacultad
ADD CONSTRAINT FKDepartamentoFacultadUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE DepartamentoFacultad
ADD CONSTRAINT FKDepartamentoFacultadDepartamento 
FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento)

ALTER TABLE DepartamentoFacultad
ADD CONSTRAINT FKDepartamentoFacultadFacultad 
FOREIGN KEY (idFacultad) REFERENCES Facultad(idFacultad)

---------------POBLAR
-----------------------------RELACIONES-----------------------------

INSERT INTO Usuario (apellidoPaterno, apellidoMaterno, nombre, correo, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Munoz', ' Garcia', ' Daniela', ' DaGaMu@ghotmail.com', ' 12345.', 1, GETDATE()),
           ('Velazquez', ' Juarez', ' Edith', ' vejued@hotmal.com', ' 67891.', 1, GETDATE()),
           ('Fernandez', ' Lopez', ' Luis', ' Soccer19@outlook.com', ' 13467.', 1, GETDATE()),
           ('Rodriguez',' Gomez', ' Andrea', ' 06and06@gmail.com', ' 25897.', 1, GETDATE()),
           ('Torres', ' Garza', ' Yakelinne', ' yaki2425@gmail.com', ' 15973.', 1, GETDATE())
GO

INSERT INTO AreaConocimiento (descripcion, idUsuarioCrea, fechaCrea)
    VALUES ('Area De Conocimiento A', 1, GETDATE()),
           ('Area De Conocimiento B', 1, GETDATE()),
           ('Area De Conocimiento C', 1, GETDATE()),
           ('Area De Conocimiento D', 1, GETDATE()),
           ('Area De Conocimiento E', 1, GETDATE())
GO

INSERT INTO Departamento (nombre, idAreaConocimiento, idUsuarioCrea, fechaCrea)
    VALUES ('Departamento1', 5, 1, GETDATE()),
           ('Departamento2', 3, 1, GETDATE()),
           ('Departamento3', 2, 1, GETDATE()),
           ('Departamento4', 4, 1, GETDATE()),
           ('Departamento5', 1, 1, GETDATE())
GO

INSERT INTO Facultad (nombre, codigoPostal, calle, numero, colonia, idUsuarioCrea, fechaCrea)
    VALUES ('Facultad1', '50501', 'Calle32', '1F1', 'Colonia1', 1, GETDATE()),
           ('Facultad2', '50501', 'Calle33', '2F2', 'Colonia1', 1, GETDATE()),
           ('Facultad3', '50501', 'Calle34', '3F3', 'Colonia1', 1, GETDATE()),
           ('Facultad4', '50501', 'Calle35', '4F4', 'Colonia2', 1, GETDATE()),
           ('Facultad5', '50501', 'Calle36', '5F5', 'Colonia2', 1, GETDATE())
GO

INSERT INTO Catedra (nombre, ubicacion, idDepartamento, idFacultad, idUsuarioCrea, fechaCrea)
    VALUES ('Catedra1', 'A lado de cafeteria', 1, 1, 1, GETDATE()),
           ('Catedra2', 'Detras de la facultad', 2, 2, 1, GETDATE()),
           ('Catedra3', 'En Patio Sur', 3, 3, 1, GETDATE()),
           ('Catedra4', 'En frente de Servicios',4, 4, 1, GETDATE()),
           ('Catedra5', 'Contra esquina del departamento', 5, 5, 1, GETDATE())
GO

INSERT INTO Profesor (apellidoPaterno, apellidoMaterno, nombre, RFC, idDepartamento, idUsuarioCrea, fechaCrea)
    VALUES ('Munoz', ' Garcia', ' Daniela', ' MUGD123456AB', 1, 1, GETDATE()),
           ('Velazquez', ' Juarez', ' Edith', ' VEJE123456AB', 1, 1, GETDATE()),
           ('Fernandez', ' Lopez', ' Luis', ' FELL123456AB', 1, 1, GETDATE()),
           ('Rodriguez',' Gomez', ' Andrea', ' ROGA123456AB', 1, 1, GETDATE()),
           ('Torres', ' Garza', ' Yakelinne', ' TOGY123456AB', 1, 1, GETDATE())
GO

INSERT INTO CatedraProfesor (idCatedra, idProfesor, fechaAdscrito, idUsuarioCrea, fechaCrea)
    VALUES (1, 2, GETDATE(), 1, GETDATE()),
           (4, 3, GETDATE(), 1, GETDATE()),
           (5, 1, GETDATE(), 1, GETDATE()),
           (2, 4, GETDATE(), 1, GETDATE()),
           (3, 5, GETDATE(), 1, GETDATE())
GO

INSERT INTO DepartamentoFacultad (idDepartamento, idFacultad, idUsuarioCrea, fechaCrea)
    VALUES (1, 1, 1, GETDATE()),
           (2, 2, 1, GETDATE()),
           (3, 3, 1, GETDATE()),
           (4, 4, 1, GETDATE()),
           (5, 5, 1, GETDATE())
GO

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Usuario
SELECT * FROM AreaConocimiento
SELECT * FROM Catedra
SELECT * FROM Departamento
SELECT * FROM Facultad
SELECT * FROM Profesor
SELECT * FROM CatedraProfesor
SELECT * FROM DepartamentoFacultad

--Borrar Registros CUIDADO!!!!!!!!!!!!!!--

DELETE FROM CatedraProfesor WHERE idCatedraProfesor = 3
DELETE FROM DepartamentoFacultad WHERE idDepartamentoFacultad = 4

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM CatedraProfesor
SELECT * FROM DepartamentoFacultad
GO
-----------------------------VISTAS-----------------------------

CREATE VIEW CatedraDepartamentoCantidad AS SELECT c.idDepartamento, count (d.idDepartamento) as cantidad
FROM Catedra c INNER JOIN Departamento d ON c.idDepartamento = d.idDepartamento WHERE
d.idDepartamento = 2 GROUP BY c.idDepartamento
GO

CREATE VIEW CatedraFacultadCantidad AS SELECT c.idFacultad, count (f.idFacultad) as cantidad
FROM Catedra c INNER JOIN Facultad f ON c.idFacultad = f.idFacultad WHERE
f.idFacultad = 3 GROUP BY c.idFacultad
GO

CREATE VIEW DepartamentoAreaConocimientoCantidad AS SELECT d.idAreaConocimiento,count (a.idAreaConocimiento) as cantidad
FROM Departamento d INNER JOIN AreaConocimiento a ON d.idAreaConocimiento = a.idAreaConocimiento WHERE
a.idAreaConocimiento = 1 GROUP BY d.idAreaConocimiento
GO

CREATE VIEW ProfesorDepartamentoCantidad AS SELECT p.idDepartamento, count (d.idDepartamento) as cantidad
FROM Profesor p INNER JOIN Departamento d ON p.idDepartamento = d.idDepartamento WHERE
d.idDepartamento = 1 GROUP BY p.idDepartamento
GO

CREATE VIEW DepartamentoAreaConocimientoInformación AS SELECT d.idDepartamento, d.nombre, a.descripcion
FROM Departamento d INNER JOIN AreaConocimiento a ON d.idAreaConocimiento = d.idAreaConocimiento WHERE 
d.idAreaConocimiento = 1 GROUP BY d.idDepartamento, d.nombre, a.descripcion
GO

