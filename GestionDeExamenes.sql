------------------------------CREAR------------------------------
USE master
GO

IF DB_ID (N'GestionDeExamenes') IS NOT NULL
DROP DATABASE GestionDeExamenes;
GO
CREATE DATABASE GestionDeExamenes
ON 
(NAME = GestionDeExamenes_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\GestionDeExamenes.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
( NAME = GestionDeExamenes_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\GestionDeExamenes.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB) ;
GO

USE GestionDeExamenes
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

CREATE TABLE Alumno
(
    idAlumno int IDENTITY (1,1),
    matricula varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
    grupo varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKAlumno PRIMARY KEY(idAlumno)
)

CREATE TABLE Examen
(
    idExamen int IDENTITY (1,1),
    numeroExamen int not null,
    numeroPreguntas int not null,
    fecha datetime not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKExamen PRIMARY KEY(idExamen)
)

CREATE TABLE Practica
(
    idPractica int IDENTITY (1,1),
    titulo varchar (50) not null,
    gradoDificultad int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPractica PRIMARY KEY(idPractica)
)

CREATE TABLE Profesor
(
    idProfesor int IDENTITY (1,1),
    matricula varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKProfesor PRIMARY KEY(idProfesor)
)

CREATE TABLE AlumnoExamen
(
    idAlumnoExamen int IDENTITY (1,1),
    idAlumno int not null,
    idExamen int not null,
    nota numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKAlumnoExamen PRIMARY KEY(idAlumnoExamen)
	)

CREATE TABLE AlumnoPractica
(
    idAlumnoPractica int IDENTITY (1,1),
    idAlumno int not null,
    idPractica int not null,
    fechaPractica datetime not null,
    notaPractica numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKAlumnoPractica PRIMARY KEY(idAlumnoPractica)
)

CREATE TABLE ProfesorPractica
(
    idProfesorPractica int IDENTITY (1,1),
    idProfesor int not null,
    idPractica int not null,
    fecha datetime not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKProfesorPractica PRIMARY KEY(idProfesorPractica)
)

-----------------------------INDEX-----------------------------

CREATE INDEX IX_Usuario ON Usuario(idUsuario)
GO
CREATE INDEX IX_Alumno ON Alumno(idAlumno);
GO
CREATE INDEX IX_Examen ON Examen(idExamen);
GO
CREATE INDEX IX_Practica ON Practica(idPractica);
GO
CREATE INDEX IX_Profesor ON Profesor(idProfesor);
GO
CREATE INDEX IX_AlumnoExamen ON AlumnoExamen(idAlumnoExamen);
GO
CREATE INDEX IX_AlumnoPractica ON AlumnoPractica(idAlumnoPractica);
GO
CREATE INDEX IX_ProfesorPractica ON ProfesorPractica(idProfesorPractica);
GO

-----------------------------RELACIONES-----------------------------

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Alumno
ADD CONSTRAINT FKAlumnoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Alumno
ADD CONSTRAINT FKAlumnoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Examen
ADD CONSTRAINT FKExamenUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Examen
ADD CONSTRAINT FKExamenUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Practica
ADD CONSTRAINT FKPracticaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Practica
ADD CONSTRAINT FKPracticaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Profesor
ADD CONSTRAINT FKProfesorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Profesor
ADD CONSTRAINT FKProfesorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE AlumnoExamen
ADD CONSTRAINT FKAlumnoExamenUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE AlumnoExamen
ADD CONSTRAINT FKAlumnoExamenUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE AlumnoExamen
ADD CONSTRAINT FKAlumnoExamenAlumno 
FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno)

ALTER TABLE AlumnoExamen
ADD CONSTRAINT FKAlumnoExamenExamen 
FOREIGN KEY (idExamen) REFERENCES Examen(idExamen)

ALTER TABLE AlumnoPractica
ADD CONSTRAINT FKAlumnoPracticaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE AlumnoPractica
ADD CONSTRAINT FKAlumnoPracticaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE AlumnoPractica
ADD CONSTRAINT FKAlumnoPracticaAlumno 
FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno)

ALTER TABLE AlumnoPractica
ADD CONSTRAINT FKAlumnoPracticaPractica 
FOREIGN KEY (idPractica) REFERENCES Practica(idPractica)

ALTER TABLE ProfesorPractica
ADD CONSTRAINT FKProfesorPracticaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE ProfesorPractica
ADD CONSTRAINT FKProfesorPracticaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE ProfesorPractica
ADD CONSTRAINT FKProfesorPracticaProfesor 
FOREIGN KEY (idProfesor) REFERENCES Profesor(idProfesor)

ALTER TABLE ProfesorPractica
ADD CONSTRAINT FKProfesorPracticaPractica 
FOREIGN KEY (idPractica) REFERENCES Practica(idPractica)

---------------POBLAR
-----------------------------RELACIONES-----------------------------

INSERT INTO Usuario (apellidoPaterno, apellidoMaterno, nombre, correo, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Munoz', ' Garcia', ' Daniela', ' DaGaMu@ghotmail.com', ' 12345.', 1, GETDATE()),
           ('Velazquez', ' Juarez', ' Edith', ' vejued@hotmal.com', ' 67891.', 1, GETDATE()),
           ('Fernandez', ' Lopez', ' Luis', ' Soccer19@outlook.com', ' 13467.', 1, GETDATE()),
           ('Rodriguez',' Gomez', ' Andrea', ' 06and06@gmail.com', ' 25897.', 1, GETDATE()),
           ('Torres', ' Garza', ' Yakelinne', ' yaki2425@gmail.com', ' 15973.', 1, GETDATE())
GO

INSERT INTO Alumno (matricula, apellidoPaterno, apellidoMaterno, nombre, grupo, idUsuarioCrea, fechaCrea)
    VALUES ('AMBA123',' Castillo',' Boone', ' Maria', ' A', 1, GETDATE()),
           ('AEMV123',' Escobedo',' Martinez', ' Veronica', ' E', 1, GETDATE()),
           ('ACHJ123',' Cortez',' Hernandez', ' Jared', ' B', 1, GETDATE()),
           ('ALAL123',' Lugo',' Aguayo', ' Lucia', ' C', 1, GETDATE()),
           ('ASCC123',' Sanchez',' Cardenas', ' Carmen', ' D', 1, GETDATE())
GO

INSERT INTO Examen (numeroExamen, numeroPreguntas, fecha, idUsuarioCrea, fechaCrea)
    VALUES (1, 50, GETDATE(), 1, GETDATE()),
           (2, 50, GETDATE(), 1, GETDATE()),
           (3, 50, GETDATE(), 1, GETDATE()),
           (1, 50, GETDATE(), 1, GETDATE()),
           (2, 50, GETDATE(), 1, GETDATE())
GO

INSERT INTO Practica (titulo, gradoDificultad, idUsuarioCrea, fechaCrea)
    VALUES ('Titulo1', 1, 1, GETDATE()),
           ('Titulo2', 2, 1, GETDATE()),
           ('Titulo3', 2, 1, GETDATE()),
           ('Titulo4', 3, 1, GETDATE()),
           ('Titulo5', 1, 1, GETDATE())
GO

INSERT INTO Profesor (matricula, apellidoPaterno, apellidoMaterno, nombre, idUsuarioCrea, fechaCrea)
    VALUES ('PMGD123', ' Munoz', ' Garcia', ' Daniela', 1, GETDATE()),
           ('PVJE123', ' Velazquez', ' Juarez', ' Edith', 1, GETDATE()),
           ('PFLL123', ' Fernandez', ' Lopez', ' Luis', 1, GETDATE()),
           ('PRGA123', ' Rodriguez',' Gomez', ' Andrea', 1, GETDATE()),
           ('PTGY123', ' Torres', ' Garza', ' Yakelinne', 1, GETDATE())
GO

INSERT INTO AlumnoExamen (idAlumno, idExamen, nota, idUsuarioCrea, fechaCrea)
    VALUES (1, 5, 69.30, 1, GETDATE()),
           (2, 4, 99.70, 1, GETDATE()),
           (3, 3, 80.00, 1, GETDATE()),
           (4, 2, 91.50, 1, GETDATE()),
           (5, 1, 70.00, 1, GETDATE())
GO

INSERT INTO AlumnoPractica (idAlumno, idPractica, fechaPractica, notaPractica, idUsuarioCrea, fechaCrea)
    VALUES (1, 1, GETDATE(), 40.25, 1, GETDATE()),
           (4, 2, GETDATE(), 100.00, 1, GETDATE()),
           (2, 3, GETDATE(), 48.25, 1, GETDATE()),
           (5, 4, GETDATE(), 88.18, 1, GETDATE()),
           (3, 5, GETDATE(), 66.25, 1, GETDATE())
GO

INSERT INTO ProfesorPractica (idProfesor, idPractica, fecha, idUsuarioCrea, fechaCrea)
    VALUES (5, 1, GETDATE(), 1, GETDATE()),
           (4, 2, GETDATE(), 1, GETDATE()),
           (3, 3, GETDATE(), 1, GETDATE()),
           (2, 4, GETDATE(), 1, GETDATE()),
           (1, 5, GETDATE(), 1, GETDATE())
GO

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Usuario
SELECT * FROM Alumno
SELECT * FROM Examen
SELECT * FROM Practica
SELECT * FROM Profesor
SELECT * FROM AlumnoExamen
SELECT * FROM AlumnoPractica
SELECT * FROM ProfesorPractica

--Borrar Registros CUIDADO!!!!!!!!!!!!!!--

DELETE FROM AlumnoExamen WHERE idAlumnoExamen= 3
DELETE FROM ProfesorPractica WHERE idProfesorPractica = 4

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM AlumnoExamen
SELECT * FROM ProfesorPractica
GO

-----------------------------VISTAS-----------------------------

CREATE VIEW AlumnoExamenCantidad AS SELECT a.idAlumno, count (e.idAlumno) as cantidad
FROM Alumno a INNER JOIN AlumnoExamen e ON a.idAlumno = e.idAlumno WHERE
e.idAlumno = 2 GROUP BY a.idAlumno
GO

CREATE VIEW AlumnoPracticaCantidad AS SELECT a.idAlumno, count (p.idAlumno) as cantidad
FROM Alumno a INNER JOIN AlumnoPractica p ON a.idAlumno = p.idAlumno WHERE
p.idAlumno = 3 GROUP BY a.idAlumno
GO

CREATE VIEW ProfesorPracticaCantidad AS SELECT pr.idProfesor, count (pp.idProfesor) as cantidad
FROM Profesor pr INNER JOIN ProfesorPractica pp ON pr.idProfesor = pp.idProfesor WHERE
pp.idProfesor = 1 GROUP BY pr.idProfesor
GO

CREATE VIEW AlumnoExamenInfo AS SELECT a.matricula, a.nombre, a.apellidoPaterno, a.apellidoMaterno, e.numeroExamen, e.numeroPreguntas, ae.nota
FROM Alumno a INNER JOIN AlumnoExamen ae ON a.idAlumno = ae.idAlumno INNER JOIN Examen e ON ae.idExamen = e.idExamen WHERE
a.idAlumno = 1 GROUP BY a.matricula, a.nombre, a.apellidoPaterno, a.apellidoMaterno, e.numeroExamen, e.numeroPreguntas, ae.nota
GO

CREATE VIEW AlumnoPracticaInfo AS SELECT a.matricula, a.nombre, a.apellidoPaterno, a.apellidoMaterno, p.titulo, p.gradoDificultad, ap.notaPractica, ap.fechaPractica
FROM Alumno a INNER JOIN AlumnoPractica ap ON a.idAlumno = ap.idAlumno INNER JOIN Practica p ON ap.idPractica = p.idPractica WHERE
a.idAlumno = 1 GROUP BY a.matricula, a.nombre, a.apellidoPaterno, a.apellidoMaterno, p.titulo, p.gradoDificultad, ap.notaPractica, ap.fechaPractica
GO
