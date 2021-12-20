------------------------------CREAR------------------------------
USE master
GO

IF DB_ID (N'ControlHospitalizacion') IS NOT NULL
DROP DATABASE ControlHospitalizacion;
GO
CREATE DATABASE ControlHospitalizacion
ON 
(NAME = ControlHospitalizacion_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\ControlHospitalizacion.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
( NAME = ControlHospitalizacion_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\ControlHospitalizacion.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB) ;
GO

USE ControlHospitalizacion
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

CREATE TABLE Cama
(
    idCama int IDENTITY (1,1),
    numero int not null,
    idPlanta int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCama PRIMARY KEY(idCama)
)

CREATE TABLE Diagnostico
(
    idDiagnostico int IDENTITY (1,1),
    codigo varchar (50) not null,
    descripcion varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKDiagnostico PRIMARY KEY(idDiagnostico)
)

CREATE TABLE Medico
(
    idMedico int IDENTITY (1,1),
    ficha char (5) not null,
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKMedico PRIMARY KEY(idMedico)
)

CREATE TABLE Paciente
(
    idPaciente int IDENTITY (1,1),
    NSS varchar (12) not null,
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
    RFC varchar (13) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPaciente PRIMARY KEY(idPaciente)
)

CREATE TABLE Pase
(
    idPase int IDENTITY (1,1),
    numero int not null,
    horaInicio datetime not null,
    horaFinal datetime not null,
    idPaciente int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPase PRIMARY KEY(idPase)
)

CREATE TABLE Planta
(
    idPlanta int IDENTITY (1,1),
    numero int not null,
    nombre varchar (50) not null,
    numeroCamas int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPlanta PRIMARY KEY(idPlanta)
)

CREATE TABLE DiagnosticoMedico
(
    idDiagnosticoMedico int IDENTITY (1,1),
    idDiagnostico int not null,
    idMedico int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKDiagnosticoMedico PRIMARY KEY(idDiagnosticoMedico)
)

CREATE TABLE PacienteCama
(
    idPacienteCama int IDENTITY (1,1),
    idPaciente int not null,
    idCama int not null,
    fecha datetime not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPacienteCama PRIMARY KEY(idPacienteCama)
)

CREATE TABLE PacienteDiagnostico
(
    idPacienteDiagnostico int IDENTITY (1,1),
    idPaciente int not null,
    idDiagnostico int not null,
    fecha datetime not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPacienteDiagnostico PRIMARY KEY(idPacienteDiagnostico)
)

CREATE TABLE PacienteMedico
(
    idPacienteMedico int IDENTITY (1,1),
    idPaciente int not null,
    idMedico int not null,
    fecha datetime not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPacienteMedico PRIMARY KEY(idPacienteMedico)
)

-----------------------------INDEX-----------------------------

CREATE INDEX IX_Usuario ON Usuario(idUsuario)
GO
CREATE INDEX IX_Cama ON Cama(idCama)
GO
CREATE INDEX IX_Diagnostico ON Diagnostico(idDiagnostico)
GO
CREATE INDEX IX_Medico ON Medico(idMedico)
GO
CREATE INDEX IX_Paciente ON Paciente(idPaciente)
GO
CREATE INDEX IX_Pase ON Pase(idPase)
GO
CREATE INDEX IX_Planta ON Planta(idPlanta)
GO
CREATE INDEX IX_DiagnosticoMedico ON DiagnosticoMedico(idDiagnosticoMedico)
GO
CREATE INDEX IX_PacienteCama ON PacienteCama(idPacienteCama)
GO
CREATE INDEX IX_PacienteDiagnostico ON PacienteDiagnostico(idPacienteDiagnostico)
GO
CREATE INDEX IX_PacienteMedico ON PacienteMedico(idPacienteMedico)
GO

-----------------------------RELACIONES-----------------------------

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Cama
ADD CONSTRAINT FKCamaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Cama
ADD CONSTRAINT FKCamaUsuarioModifica 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Cama
ADD CONSTRAINT FKCamaPlanta 
FOREIGN KEY (idPlanta) REFERENCES Planta(idPlanta)

ALTER TABLE Diagnostico
ADD CONSTRAINT FKDiagnosticoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Diagnostico
ADD CONSTRAINT FKDiagnosticoUsuarioModifica 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Medico
ADD CONSTRAINT FKMedicoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Medico
ADD CONSTRAINT FKMedicoUsuarioModifica 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Paciente
ADD CONSTRAINT FKPacienteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Paciente
ADD CONSTRAINT FKPacienteUsuarioModifica 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Pase
ADD CONSTRAINT FKPaseUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Pase
ADD CONSTRAINT FKPaseUsuarioModifica 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Pase
ADD CONSTRAINT FKPasePaciente 
FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)

ALTER TABLE Planta
ADD CONSTRAINT FKPlantaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Planta
ADD CONSTRAINT FKPlantaUsuarioModifica 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE DiagnosticoMedico
ADD CONSTRAINT FKDiagnosticoMedicoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE DiagnosticoMedico
ADD CONSTRAINT FKDiagnosticoMedicoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE DiagnosticoMedico
ADD CONSTRAINT FKDiagnosticoMedicoDiagnostico 
FOREIGN KEY (idDiagnostico) REFERENCES Diagnostico(idDiagnostico)

ALTER TABLE DiagnosticoMedico
ADD CONSTRAINT FKDiagnosticoMedicoMedico 
FOREIGN KEY (idMedico) REFERENCES Medico(idMedico)

ALTER TABLE PacienteCama
ADD CONSTRAINT FKPacienteCamaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE PacienteCama
ADD CONSTRAINT FKPacienteCamaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE PacienteCama
ADD CONSTRAINT FKPacienteCamaPaciente 
FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)

ALTER TABLE PacienteCama
ADD CONSTRAINT FKPacienteCamaCama 
FOREIGN KEY (idCama) REFERENCES Cama(idCama)

ALTER TABLE PacienteDiagnostico
ADD CONSTRAINT FKPacienteDiagnosticoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE PacienteDiagnostico
ADD CONSTRAINT FKPacienteDiagnosticoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica)REFERENCES Usuario(idUsuario)

ALTER TABLE PacienteDiagnostico
ADD CONSTRAINT FKPacienteDiagnosticoPaciente 
FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)

ALTER TABLE PacienteDiagnostico
ADD CONSTRAINT FKPacienteDiagnosticoDiagnostico 
FOREIGN KEY (idDiagnostico) REFERENCES Diagnostico(idDiagnostico)

ALTER TABLE PacienteMedico
ADD CONSTRAINT FKPacienteMedicoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE PacienteMedico
ADD CONSTRAINT FKPacienteMedicoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE PacienteMedico
ADD CONSTRAINT FKDPacienteMedicoPaciente 
FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)

ALTER TABLE PacienteMedico
ADD CONSTRAINT FKPacienteMedicoMedico 
FOREIGN KEY (idMedico) REFERENCES Medico(idMedico)

---------------POBLAR
-----------------------------RELACIONES-----------------------------

INSERT INTO Usuario (apellidoPaterno, apellidoMaterno, nombre, correo, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Munoz', ' Garcia', ' Daniela', ' DaGaMu@ghotmail.com', ' 12345.', 1, GETDATE()),
           ('Velazquez', ' Juarez', ' Edith', ' vejued@hotmal.com', ' 67891.', 1, GETDATE()),
           ('Fernandez', ' Lopez', ' Luis', ' Soccer19@outlook.com', ' 13467.', 1, GETDATE()),
           ('Rodriguez',' Gomez', ' Andrea', ' 06and06@gmail.com', ' 25897.', 1, GETDATE()),
           ('Torres', ' Garza', ' Yakelinne', ' yaki2425@gmail.com', ' 15973.', 1, GETDATE())
GO

INSERT INTO Planta (numero, nombre, numeroCamas, idUsuarioCrea, fechaCrea)
    VALUES (1, 'Planta1', 0, 1, GETDATE()),
           (2, 'Planta2', 0, 1, GETDATE()),
           (3, 'Planta3', 15, 1, GETDATE()),
           (4, 'Planta4', 30, 1, GETDATE()),
           (5, 'Planta5', 30, 1, GETDATE())
GO

INSERT INTO Cama (numero, idPlanta, idUsuarioCrea, fechaCrea)
    VALUES (201, 3, 1, GETDATE()),
           (302, 3, 1, GETDATE()),
           (303, 3, 1, GETDATE()),
           (404, 4, 1, GETDATE()),
           (505, 5, 1, GETDATE())
GO

INSERT into Diagnostico (codigo, descripcion, idUsuarioCrea, fechaCrea)
    VALUES ('10D1112', ' Descripcion1', 1, GETDATE()),
           ('11D1213', ' Descripcion2', 1, GETDATE()),
           ('12D1314', ' Descripcion3', 1, GETDATE()),
           ('13D1415', ' Descripcion4', 1, GETDATE()),
           ('14D1516', ' Descripcion5', 1, GETDATE())
GO

INSERT INTO Medico (ficha, apellidoPaterno, apellidoMaterno, nombre, idUsuarioCrea, fechaCrea)
    VALUES ('M123D', ' Munoz', ' Garcia', ' Daniela', 1, GETDATE()),
           ('M456E', ' Velazquez', ' Juarez', ' Edith', 1, GETDATE()),
           ('M789L', ' Fernandez', ' Lopez', ' Luis', 1, GETDATE()),
           ('M582A', ' Rodriguez',' Gomez', ' Andrea', 1, GETDATE()),
           ('M613Y', ' Torres', ' Garza', ' Yakelinne', 1, GETDATE())
GO

INSERT INTO Paciente (NSS, apellidoPaterno, apellidoMaterno, nombre, RFC, idUsuarioCrea, fechaCrea)
    VALUES ('12345678911',' Castillo',' Boone', ' Maria', ' CABM123456AB', 1, GETDATE()),
           ('23456789123',' Escobedo',' Martinez', ' Veronica', ' ESMV123456AB', 1, GETDATE()),
           ('34567891234',' Cortez',' Hernandez', ' Jared', ' COHJ123456AB', 1, GETDATE()),
           ('45678912345',' Lugo',' Aguayo', ' Lucia', ' LUAL123456AB', 1, GETDATE()),
           ('56789123456',' Sanchez',' Cardenas', ' Carmen', ' SACC123456AB', 1, GETDATE())
GO

INSERT into Pase (numero, horaInicio, horafinal, idPaciente, idUsuarioCrea, fechaCrea)
    VALUES (1, GETDATE(), GETDATE(), 1, 1, GETDATE()),
           (2, GETDATE(), GETDATE(), 2, 1, GETDATE()),
           (3, GETDATE(), GETDATE(), 3, 1, GETDATE()),
           (4, GETDATE(), GETDATE(), 4, 1, GETDATE()),
           (5, GETDATE(), GETDATE(), 5, 1, GETDATE())
GO

INSERT INTO DiagnosticoMedico (idDiagnostico, idMedico, idUsuarioCrea, fechaCrea)
    VALUES (1, 2, 1, GETDATE()),
           (4, 3, 1, GETDATE()),
           (5, 1, 1, GETDATE()),
           (2, 4, 1, GETDATE()),
           (3, 5, 1, GETDATE())
GO

INSERT INTO PacienteCama (idPaciente, idCama, fecha, idUsuarioCrea, fechaCrea)
    VALUES (1, 5, GETDATE(), 1, GETDATE()),
           (2, 4, GETDATE(), 1, GETDATE()),
           (3, 3, GETDATE(), 1, GETDATE()),
           (4, 2, GETDATE(), 1, GETDATE()),
           (5, 1, GETDATE(), 1, GETDATE())          
GO        

INSERT INTO PacienteDiagnostico (idPaciente, idDiagnostico, fecha, idUsuarioCrea, fechaCrea)
    VALUES (1, 2, GETDATE(), 1, GETDATE()),
           (3, 4, GETDATE(), 1, GETDATE()),
           (5, 5, GETDATE(), 1, GETDATE()),
           (4, 3, GETDATE(), 1, GETDATE()),
           (2, 1, GETDATE(), 1, GETDATE())
GO

INSERT INTO PacienteMedico (idPaciente, idMedico, fecha, idUsuarioCrea, fechaCrea)
    VALUES (1, 4, GETDATE(), 1, GETDATE()),
           (3, 2, GETDATE(), 1, GETDATE()),
           (2, 3, GETDATE(), 1, GETDATE()),
           (5, 5, GETDATE(), 1, GETDATE()),
           (4, 1, GETDATE(), 1, GETDATE())
GO

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Usuario
SELECT * FROM Cama
SELECT * FROM Diagnostico
SELECT * FROM Medico
SELECT * FROM Paciente
SELECT * FROM Pase
SELECT * FROM Planta
SELECT * FROM DiagnosticoMedico
SELECT * FROM PacienteCama
SELECT * FROM PacienteDiagnostico
SELECT * FROM PacienteMedico

--Borrar Registros CUIDADO!!!!!!!!!!!!!!--

DELETE FROM DiagnosticoMedico WHERE idDiagnosticoMedico = 3
DELETE FROM PacienteCama WHERE idPacienteCama = 4

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM DiagnosticoMedico
SELECT * FROM PacienteCama
GO

-----------------------------VISTAS-----------------------------

CREATE VIEW CamaPlantaCantidad AS SELECT c.idPlanta, count (p.idPlanta) as cantidad
FROM Cama c INNER JOIN Planta p ON c.idPlanta = p.idPlanta WHERE
p.idPlanta = 2 GROUP BY c.idPlanta
GO

CREATE VIEW PasePacienteCantidad AS SELECT ps.idPaciente, count (pc.idPaciente) as cantidad
FROM Pase ps INNER JOIN Paciente pc ON pc.idPaciente = ps.idPaciente WHERE
pc.idPaciente = 3 GROUP BY ps.idPaciente
GO

CREATE VIEW CamaPlanta AS SELECT c.idCama, c.numero, p.nombre, p.numeroCamas
FROM Cama c INNER JOIN Planta p ON c.idPlanta = p.idPlanta WHERE
c.idCama >= 1 GROUP BY c.idCama, c.numero, p.nombre, p.numeroCamas
GO

CREATE VIEW PasePaciente AS SELECT ps.idPase, ps.numero, pc.idPaciente, pc.NSS, pc.nombre, pc.apellidoPaterno, pc.apellidoMaterno
FROM Pase ps INNER JOIN Paciente pc ON pc.idPaciente = ps.idPaciente WHERE
pc.idPaciente >= 1 GROUP BY  ps.idPase, ps.numero, pc.idPaciente, pc.NSS, pc.nombre, pc.apellidoPaterno, pc.apellidoMaterno
GO
