------------------------------CREAR------------------------------
USE master
GO

IF DB_ID (N'FutbolSoccer') IS NOT NULL
DROP DATABASE FutbolSoccer;
GO
CREATE DATABASE FutbolSoccer
ON 
(NAME = FutbolSoccer_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\FutbolSoccer.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
( NAME = FutbolSoccer_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\FutbolSoccer.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB) ;
GO

USE FutbolSoccer
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


CREATE TABLE Colegiado
(
    idColegiado int IDENTITY (1,1),
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
	RFC varchar (13) not null,
	idPartido int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKColegiado PRIMARY KEY(idColegiado)
)

CREATE TABLE Equipo
(
    idEquipo int IDENTITY (1,1),
    nombre varchar (50) not null,
	ciudad varchar (50) not null,
	equipoLocal varchar (50) not null,
	equipoVisitante varchar (50) not null,
	idPartido int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKEquipo PRIMARY KEY(idEquipo)
)

CREATE TABLE Jugador
(
    idJugador int IDENTITY (1,1),
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
    RFC varchar (50) not null,
    idEquipo int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKJugador PRIMARY KEY(idJugador)
)

CREATE TABLE Partido
(
    idPartido int IDENTITY (1,1),
    fecha datetime not null,
    lugar varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPartido PRIMARY KEY(idPartido)
)

CREATE TABLE Puesto
(
    idPuesto int IDENTITY (1,1),
    descripcion varchar (50) not null,
	idPartido int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPuesto PRIMARY KEY(idPuesto)
)

CREATE TABLE JugadorPuesto
(
    idJugadorPuesto int IDENTITY (1,1),
    idJugador int not null,
    idPuesto int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKJugadorPuesto PRIMARY KEY(idJugadorPuesto)
)

-----------------------------INDEX-----------------------------

CREATE INDEX IX_Usuario ON Usuario(idUsuario)
GO
CREATE INDEX IX_Colegiado ON Colegiado(idColegiado)
GO
CREATE INDEX IX_Equipo ON Equipo(idEquipo)
GO
CREATE INDEX IX_Jugador ON Jugador(idJugador)
GO
CREATE INDEX IX_Partido ON Partido(idPartido)
GO
CREATE INDEX IX_Puesto ON Puesto(idPuesto)
GO
CREATE INDEX IXJugadorPuesto ON JugadorPuesto(idJugadorPuesto)
GO

-----------------------------RELACIONES-----------------------------

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Colegiado
ADD CONSTRAINT FKColegiadoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Colegiado
ADD CONSTRAINT FKColegiadoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Colegiado
ADD CONSTRAINT FKColegiadoPartido
FOREIGN KEY (idPartido) REFERENCES Partido(idPartido)

ALTER TABLE Equipo
ADD CONSTRAINT FKEquipoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Equipo
ADD CONSTRAINT FKEquipoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Equipo
ADD CONSTRAINT FKEquipoPartido
FOREIGN KEY (idPartido) REFERENCES Partido(idPartido)

ALTER TABLE Jugador
ADD CONSTRAINT FKJugadorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Jugador
ADD CONSTRAINT FKJugadorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Jugador
ADD CONSTRAINT FKJugadorEquipo 
FOREIGN KEY (idEquipo) REFERENCES Equipo(idEquipo)

ALTER TABLE Partido
ADD CONSTRAINT FKPartidoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Partido
ADD CONSTRAINT FKPartidoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Puesto
ADD CONSTRAINT FKPuestoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Puesto
ADD CONSTRAINT FKPuestoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Puesto
ADD CONSTRAINT FKPuestoPartido
FOREIGN KEY (idPartido) REFERENCES Partido(idPartido)

ALTER TABLE JugadorPuesto
ADD CONSTRAINT FKJugadorPuestoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE JugadorPuesto
ADD CONSTRAINT FKJugadorPuestoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE JugadorPuesto
ADD CONSTRAINT FKJugadorPuestoJugador 
FOREIGN KEY (idJugador) REFERENCES Jugador(idJugador)

ALTER TABLE JugadorPuesto
ADD CONSTRAINT FKJugadorPuestoPuesto
FOREIGN KEY (idPuesto) REFERENCES Puesto(idPuesto)

---------------POBLAR
-----------------------------RELACIONES-----------------------------

INSERT INTO Usuario (apellidoPaterno, apellidoMaterno, nombre, correo, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Munoz', ' Garcia', ' Daniela', ' DaGaMu@ghotmail.com', ' 12345.', 1, GETDATE()),
           ('Velazquez', ' Juarez', ' Edith', ' vejued@hotmal.com', ' 67891.', 1, GETDATE()),
           ('Fernandez', ' Lopez', ' Luis', ' Soccer19@outlook.com', ' 13467.', 1, GETDATE()),
           ('Rodriguez',' Gomez', ' Andrea', ' 06and06@gmail.com', ' 25897.', 1, GETDATE()),
           ('Torres', ' Garza', ' Yakelinne', ' yaki2425@gmail.com', ' 15973.', 1, GETDATE())
GO

INSERT INTO Partido (fecha, Lugar, idUsuarioCrea, fechaCrea)
    VALUES (GETDATE(), 'Lugar1', 1, GETDATE()),
           (GETDATE(), 'Lugar2', 1, GETDATE()),
           (GETDATE(), 'Lugar3', 1, GETDATE()),
           (GETDATE(), 'Lugar4', 1, GETDATE()),
           (GETDATE(), 'Lugar5', 1, GETDATE())
GO

INSERT INTO Colegiado (apellidoPaterno, apellidoMaterno, nombre, RFC, idPartido, idUsuarioCrea, fechaCrea)
    VALUES ('Vazquez', ' Martinez', ' Antonio', 'VAMA123456AB',1, 1, GETDATE()),
           ('Fernandez',' Sepulveda', ' Santiago', 'FESS123456AB', 2, 1, GETDATE()),
           ('Juarez', ' Villasana', ' Jose', 'JUVJ123456AB', 3, 1, GETDATE())
GO

INSERT INTO Equipo (nombre, ciudad, equipoLocal, equipoVisitante, idPartido, idUsuarioCrea, fechaCrea)
    VALUES ('Equipo1', 'Monclova', 'EquipoLocal', 'EquipoVisitante', 1, 1, GETDATE()),
           ('Equipo2', 'Monterrey', 'EquipoLocal', 'EquipoVisitante', 2, 1, GETDATE()),
           ('Equipo3', 'Muzquiz', 'EquipoLocal', 'EquipoVisitante', 3, 1, GETDATE()),
           ('Equipo4', 'Matamoros', 'EquipoLocal', 'EquipoVisitante', 4, 1, GETDATE()),
           ('Equipo5', 'Nava', 'EquipoLocal', 'EquipoVisitante', 5, 1, GETDATE())
GO

INSERT INTO Jugador (apellidoPaterno, apellidoMaterno, nombre, RFC, idEquipo, idUsuarioCrea, fechaCrea)
    VALUES ('Castillo',' Boone', ' Mario', ' CABM123456AB', 2, 1, GETDATE()),
           ('Escobedo',' Martinez', ' Diego', ' ESMD123456AB', 4, 1, GETDATE()),
           ('Cortez',' Hernandez', ' Jared', ' COHJ123456AB', 5, 1, GETDATE()),
           ('Lugo',' Aguayo', ' Luis', ' LUAL123456AB', 3, 1, GETDATE()),
           ('Sanchez',' Cardenas', ' Carlos', ' SACC123456AB', 1, 1, GETDATE())
GO

INSERT INTO Puesto (descripcion, idPartido, idUsuarioCrea, fechaCrea)
    VALUES ('Decripcion1', 1, 1, GETDATE()),
           ('Decripcion2', 2, 1, GETDATE()),
           ('Decripcion3', 3, 1, GETDATE()),
           ('Decripcion4', 4, 1, GETDATE()),
           ('Decripcion5', 5, 1, GETDATE())
GO

INSERT INTO JugadorPuesto (idJugador, idPuesto, idUsuarioCrea, fechaCrea)
    VALUES (1, 2, 1, GETDATE()),
           (4, 3, 1, GETDATE()),
           (5, 5, 1, GETDATE()),
           (3, 4, 1, GETDATE()),
           (2, 1, 1, GETDATE())
GO

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Usuario
SELECT * FROM Colegiado
SELECT * FROM Equipo
SELECT * FROM Jugador
SELECT * FROM Partido
SELECT * FROM Puesto
SELECT * FROM JugadorPuesto

--Borrar Registros CUIDADO!!!!!!!!!!!!!!--

DELETE FROM Colegiado WHERE idColegiado = 3
DELETE FROM JugadorPuesto WHERE idJugadorPuesto = 4

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Colegiado
SELECT * FROM JugadorPuesto
GO

-----------------------------VISTAS-----------------------------

CREATE VIEW ColegiadoPartidoCantidad AS SELECT c.idPartido ,count (p.idPartido) as cantidad
FROM Colegiado c INNER JOIN Partido p ON c.idPartido = p.idPartido WHERE
p.idPartido = 2 GROUP BY c.idPartido
GO

CREATE VIEW EquipoPartidoCantidad AS SELECT e.idPartido ,count (p.idPartido) as cantidad
FROM Equipo e INNER JOIN Partido p ON e.idPartido = p.idPartido WHERE
p.idPartido = 3 GROUP BY e.idPartido
GO

CREATE VIEW JugadorEquipoCantidad AS SELECT j.idEquipo ,count (e.idEquipo) as cantidad
FROM Jugador j INNER JOIN Equipo e ON j.idEquipo = e.idEquipo WHERE
e.idEquipo = 1 GROUP BY j.idEquipo
GO

CREATE VIEW PuestoPartidoCantidad AS SELECT pu.idPartido ,count (p.idPartido) as cantidad
FROM Puesto pu INNER JOIN Partido p ON pu.idPartido = p.idPartido WHERE
p.idPartido = 1 GROUP BY pu.idPartido
GO

CREATE VIEW JugadorPuestoInformacion AS SELECT jp.idJugadorPuesto, j.nombre, j.apellidoPaterno, j.apellidoMaterno, pu.descripcion
FROM Jugador j INNER JOIN JugadorPuesto jp ON j.idJugador = jp.idJugador INNER JOIN Puesto pu ON jp.idPuesto = pu.idPuesto WHERE
j.idJugador >= 1 GROUP BY jp.idJugadorPuesto, j.nombre, j.apellidoPaterno, j.apellidoMaterno, pu.descripcion
GO