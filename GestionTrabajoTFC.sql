------------------------------CREAR------------------------------
USE master
GO

IF DB_ID (N'GestionTrabajoTFC') IS NOT NULL
DROP DATABASE GestionTrabajoTFC
GO

CREATE DATABASE GestionTrabajoTFC
ON 
( NAME = GestionTrabajoTFC_dat,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\GestionTrabajoTFC.mdf',
	SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON 
(NAME = GestionTrabajoTFC_log,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\GestionTrabajoTFC.ldf',
	SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB) ;
GO
USE GestionTrabajoTFC
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

CREATE TABLE Alumno
(
	idAlumno int IDENTITY(1,1),
	matricula varchar (50) UNIQUE not null,
	apellidoPaterno varchar (50) not null,
	apellidoMaterno varchar (50) not null,
	nombre varchar(50) not null,
	RFC varchar(13) not null,
	idGrupo int not null,
	idProfesor int not null,
	estatus bit default 1,
	idUsuarioCrea int not null,
	fechaCrea datetime not null,
	idUsuarioModifica int default null,
	fechaModifica datetime default null
	CONSTRAINT PKAlumno PRIMARY KEY(idAlumno) 
)

CREATE TABLE Grupo
(
	idGrupo int IDENTITY(1,1),
	nombre varchar (50) not null,
	numeroComponentes int default null,
	fechaIngreso datetime not null,
	estatus bit default 1,
	idUsuarioCrea int not null,
	fechaCrea datetime not null,
	idUsuarioModifica int default null,
	fechaModifica datetime default null
	CONSTRAINT PKGrupo PRIMARY KEY(idGrupo) 
)

CREATE TABLE Profesor
(
	idProfesor int IDENTITY(1,1),
	apellidoPaterno varchar (50) not null,
	apellidoMaterno varchar (50) not null,
	nombre varchar(50) not null,
	RFC varchar(13) not null,
	estatus bit default 1,
	idUsuarioCrea int not null,
	fechaCrea datetime not null,
	idUsuarioModifica int default null,
	fechaModifica datetime default null
	CONSTRAINT PKProfesor PRIMARY KEY(idProfesor) 
)

CREATE TABLE TFC
(
	idTFC int IDENTITY(1,1),
	orden int not null,
	fecha datetime not null,
	tema varchar (50) not null,
	idAlumno int not null,
	estatus bit default 1,
	idUsuarioCrea int not null,
	fechaCrea datetime not null,
	idUsuarioModifica int default null,
	fechaModifica datetime default null
	CONSTRAINT PKTFC PRIMARY KEY(idTFC)
)

CREATE TABLE Tribunal
(
	idTribunal int IDENTITY(1,1),
	componentes int not null,
	edificio char (5) not null,
	salon char (5) not null,
	fecha datetime not null,
	idAlumno int not null,
	estatus bit default 1,
	idUsuarioCrea int not null,
	fechaCrea datetime not null,
	idUsuarioModifica int default null,
	fechaModifica datetime default null
	CONSTRAINT PKTribunal PRIMARY KEY(idTribunal)
)

CREATE TABLE AlumnoProfesor
(
	idAlumnoProfesor int IDENTITY(1,1),
	idAlumno int not null,
	idProfesor int not null,
	estatus bit default 1,
	idUsuarioCrea int not null,
	fechaCrea datetime not null,
	idUsuarioModifica int default null,
	fechaModifica datetime default null
	CONSTRAINT PKAlumnoProfesor PRIMARY KEY(idAlumnoProfesor)
)

CREATE TABLE ProfesorTribunal
(
	idProfesorTribunal int IDENTITY(1,1),
	idProfesor int not null,
	idTribunal int not null,
	estatus bit default 1,
	idUsuarioCrea int not null,
	fechaCrea datetime not null,
	idUsuarioModifica int default null,
	fechaModifica datetime default null
	CONSTRAINT PKProfesorTribunal PRIMARY KEY(idProfesorTribunal)
)

------------------------------INDEX------------------------------

CREATE INDEX IX_Usuario ON Usuario(idUsuario)
GO
CREATE INDEX IX_Alumno ON Alumno(idAlumno)
GO
CREATE INDEX IX_Grupo ON Grupo(idGrupo)
GO
CREATE INDEX IX_Profesor ON Profesor(idProfesor)
GO
CREATE INDEX IX_TFC ON TFC(idTFC)
GO
CREATE INDEX IX_Tribunal ON Tribunal(idTribunal)
GO
CREATE INDEX IX_AlumnoProfesor ON AlumnoProfesor(idAlumnoProfesor)
GO
CREATE INDEX IX_ProfesorTribunal ON ProfesorTribunal(idProfesorTribunal)
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

ALTER TABLE Alumno
ADD CONSTRAINT FKAlumnoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE Alumno
ADD CONSTRAINT FKAlumnoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE Alumno 
ADD CONSTRAINT FKAlumnoGrupo 
FOREIGN KEY (idGrupo) REFERENCES Grupo(idGrupo)
GO

ALTER TABLE Alumno
ADD CONSTRAINT FKAlumnoProfesor 
FOREIGN KEY (idProfesor) REFERENCES Profesor(idProfesor)
GO

ALTER TABLE Grupo
ADD CONSTRAINT FKGrupoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE Grupo
ADD CONSTRAINT FKGrupoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE Profesor
ADD CONSTRAINT FKProfesorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE Profesor
ADD CONSTRAINT FKProfesorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE TFC
ADD CONSTRAINT FKTFCUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE TFC
ADD CONSTRAINT FKTFCUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE TFC
ADD CONSTRAINT FKTFCAlumno 
FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno)
GO

ALTER TABLE Tribunal
ADD CONSTRAINT FKTribunalUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE Tribunal
ADD CONSTRAINT FKTribunalUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE Tribunal
ADD CONSTRAINT FKTribunalAlumno 
FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno)
GO

ALTER TABLE AlumnoProfesor
ADD CONSTRAINT FKAlumnoProfesorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE AlumnoProfesor
ADD CONSTRAINT FKAlumnoProfesorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE AlumnoProfesor
ADD CONSTRAINT FKAlumnoProfesorAlumno 
FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno)
GO

ALTER TABLE AlumnoProfesor
ADD CONSTRAINT FKAlumnoProfesorProfesor 
FOREIGN KEY (idProfesor) REFERENCES Profesor(idProfesor)

ALTER TABLE ProfesorTribunal
ADD CONSTRAINT FKProfesorTribunalUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE ProfesorTribunal
ADD CONSTRAINT FKProfesorTribunalUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO

ALTER TABLE ProfesorTribunal
ADD CONSTRAINT FKProfesorTribunalProfesor 
FOREIGN KEY (idProfesor) REFERENCES Profesor(idProfesor)
GO

ALTER TABLE ProfesorTribunal
ADD CONSTRAINT FKProfesorTribunalTribunal 
FOREIGN KEY (idTribunal) REFERENCES Tribunal(idTribunal)
GO

---------------POBLAR
------------------------------Insertar Registros------------------------------

INSERT INTO Usuario (apellidoPaterno, apellidoMaterno, nombre, correo, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Munoz', ' Garcia', ' Daniela', ' DaGaMu@ghotmail.com', ' 12345.', 1, GETDATE()),
           ('Velazquez', ' Juarez', ' Edith', ' vejued@hotmal.com', ' 67891.', 1, GETDATE()),
           ('Fernandez', ' Lopez', ' Luis', ' Soccer19@outlook.com', ' 13467.', 1, GETDATE()),
           ('Rodriguez',' Gomez', ' Andrea', ' 06and06@gmail.com', ' 25897.', 1, GETDATE()),
           ('Torres', ' Garza', ' Yakelinne', ' yaki2425@gmail.com', ' 15973.', 1, GETDATE())
GO

INSERT INTO Grupo (nombre, numeroComponentes, fechaIngreso, idUsuarioCrea, fechaCrea)
    VALUES('Grupo1', 15, GETDATE(), 1, GETDATE()),
          ('Grupo2', 22, GETDATE(), 1, GETDATE()),
          ('Grupo3', 8, GETDATE(), 1, GETDATE()),
          ('Grupo4', 9, GETDATE(), 1, GETDATE()),
          ('Grupo5', 20, GETDATE(), 1, GETDATE())
GO

INSERT INTO Profesor (apellidoPaterno, apellidoMaterno, nombre, RFC, idUsuarioCrea, fechaCrea)
    VALUES ('Munoz', ' Garcia', ' Daniela', ' MUGD123456AB', 1, GETDATE()),
           ('Velazquez', ' Juarez', ' Edith', ' VEJE123456AB', 1, GETDATE()),
           ('Fernandez', ' Lopez', ' Luis', ' FELL123456AB', 1, GETDATE()),
           ('Rodriguez',' Gomez', ' Andrea', ' ROGA123456AB', 1, GETDATE()),
           ('Torres', ' Garza', ' Yakelinne', ' TOGY123456AB', 1, GETDATE())
GO

INSERT INTO Alumno (matricula, apellidoPaterno, apellidoMaterno, nombre, RFC, idGrupo, idProfesor, idUsuarioCrea, fechaCrea)
    VALUES ('MBA123',' Castillo',' Boone', ' Maria', ' CABM123456AB', 1, 2, 1, GETDATE()),
           ('EMV123',' Escobedo',' Martinez', ' Veronica', ' ESMV123456AB', 3, 4, 1, GETDATE()),
           ('CHJ123',' Cortez',' Hernandez', ' Jared', ' COHJ123456AB', 5, 5, 1, GETDATE()),
           ('LAL123',' Lugo',' Aguayo', ' Lucia', ' LUAL123456AB', 4, 3, 1, GETDATE()),
           ('SCC123',' Sanchez',' Cardenas', ' Carmen', ' SACC123456AB', 2, 1, 1, GETDATE())
GO

INSERT INTO TFC (orden, fecha, tema, idAlumno, idUsuarioCrea, fechaCrea)
    VALUES(10, GETDATE(), ' Tema1', 1, 1, GETDATE()),
          (20, GETDATE(), ' Tema2', 2, 1, GETDATE()),
          (30, GETDATE(), ' Tema3', 3, 1, GETDATE()),
          (40, GETDATE(), ' Tema4', 4, 1, GETDATE()),
          (50, GETDATE(), ' Tema5', 5, 1, GETDATE())
GO

INSERT INTO Tribunal (componentes, edificio, salon, fecha, idAlumno, idUsuarioCrea, fechaCrea)
    VALUES(10, 'T01', 'T011', GETDATE(), 1, 1, GETDATE()),
          (10, 'T02', 'T021', GETDATE(), 2, 1, GETDATE()),
          (10, 'T03', 'T031', GETDATE(), 3, 1, GETDATE()),
          (10, 'T04', 'T041', GETDATE(), 4, 1, GETDATE()),
          (10, 'T05', 'T051', GETDATE(), 5, 1, GETDATE())
GO

INSERT INTO AlumnoProfesor (idAlumno, idProfesor, idUsuarioCrea, fechaCrea)
    VALUES(1, 5, 1, GETDATE()),
          (2, 4, 1, GETDATE()),
          (3, 3, 1, GETDATE()),
          (4, 2, 1, GETDATE()),
          (5, 1, 1, GETDATE())
GO

INSERT INTO ProfesorTribunal (idProfesor, idTribunal, idUsuarioCrea, fechaCrea)
    VALUES(1, 2, 1, GETDATE()),
          (4, 3, 1, GETDATE()),
          (5, 1, 1, GETDATE()),
          (2, 4, 1, GETDATE()),
          (3, 5, 1, GETDATE())
GO

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Usuario
SELECT * FROM Alumno
SELECT * FROM Grupo
SELECT * FROM Profesor
SELECT * FROM TFC
SELECT * FROM Tribunal
SELECT * FROM AlumnoProfesor
SELECT * FROM ProfesorTribunal

--Borrar Registros CUIDADO!!!!!!!!!!!!!!--

DELETE FROM AlumnoProfesor WHERE idAlumnoProfesor = 4

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM AlumnoProfesor
GO

-----------------------------VISTAS-----------------------------

CREATE VIEW AlumnoGrupoCantidad AS SELECT a.idGrupo ,count (g.idGrupo) as cantidad
FROM Alumno a INNER JOIN Grupo g ON a.idGrupo = g.idGrupo WHERE
g.idGrupo = 2 GROUP BY a.idGrupo
GO

CREATE VIEW AlumnoProfesorInformacion AS SELECT a.idAlumno, a.matricula, p.nombre, p.apellidoPaterno
FROM Alumno a INNER JOIN Profesor p ON a.idProfesor = p.idProfesor WHERE
p.idProfesor = 1 GROUP BY a.idAlumno, a.matricula, p.nombre, p.apellidoPaterno
GO

CREATE VIEW TFCAlumnoCantidad AS SELECT t.idAlumno, count(a.idAlumno) as cantidad
FROM TFC t INNER JOIN Alumno a ON t.idAlumno = a.idAlumno
WHERE a.idAlumno = 3 GROUP BY t.idAlumno
GO

CREATE VIEW AlumnoTFCInformación AS SELECT a.idAlumno, a.matricula, a.nombre, a.apellidoPaterno, t.tema
FROM Alumno a INNER JOIN TFC T ON t.idAlumno = a.idAlumno
WHERE a.idAlumno = 1 GROUP BY a.idAlumno, a.matricula, a.nombre, a.apellidoPaterno, t.tema
GO

CREATE VIEW TribunalAlumnoInformación AS SELECT a.idAlumno, a.matricula, a.nombre, a.apellidoPaterno, a.apellidoMaterno, t.fecha, t.edificio, t.salon
FROM Alumno a INNER JOIN Tribunal t ON t.idAlumno = a.idAlumno
WHERE a.idAlumno = 1 GROUP BY a.idAlumno, a.matricula, a.nombre, a.apellidoPaterno, a.apellidoMaterno, t.fecha, t.edificio, t.salon
GO
