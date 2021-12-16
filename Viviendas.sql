-----------------------------CREAR-----------------------------
USE master
GO

IF DB_ID (N'Viviendas') IS NOT NULL
DROP DATABASE Viviendas;
GO

CREATE DATABASE Viviendas
ON 
(NAME = Viviendas_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\Viviendas.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
( NAME = Viviendas_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\Viviendas.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB) ;
GO

USE Viviendas
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

CREATE TABLE Municipio
(
    idMunicipio int IDENTITY (1,1),
    nombre varchar (50) not null,
	numero varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKMunicipio PRIMARY KEY(idMunicipio)
)

CREATE TABLE Persona
(
    idPersona int IDENTITY (1,1),
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
    curp varchar (18) not null,
	edad int not null,
	telefono char (10) not null,
    idMunicipio int not null,
    idVivienda int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPersona PRIMARY KEY(idPersona)
)

CREATE TABLE Vivienda
(
    idVivienda int IDENTITY (1,1),
    codigoPostal char (5) not null,
	calle varchar (50) not null,
	numero char (5) not null,
	colonia varchar (50) not null,
    idMunicipio int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKVivienda PRIMARY KEY(idVivienda)
)

CREATE TABLE ViviendaPersona
(
    idViviendaPersona int IDENTITY (1,1),
    idVivienda int not null,
    idPersona int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKViviendaPersona PRIMARY KEY(idViviendaPersona)
)

-----------------------------INDEX-----------------------------

CREATE INDEX IX_Usuario ON Usuario(idUsuario);
GO
CREATE INDEX IX_Municipio ON Municipio(idMunicipio);
GO
CREATE INDEX IX_Persona ON Persona(idPersona);
GO
CREATE INDEX IX_Vivienda ON Vivienda(idVivienda);
GO
CREATE INDEX IX_ViviendaPersona ON ViviendaPersona(idViviendaPersona);
GO

-----------------------------RELACIONES-----------------------------

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Municipio
ADD CONSTRAINT FKMunicipioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Municipio
ADD CONSTRAINT FKMunicipioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Persona
ADD CONSTRAINT FKPersonaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Persona
ADD CONSTRAINT FKPersonaUsuarioModifica 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Persona
ADD CONSTRAINT FKPersonaMunicipio 
FOREIGN KEY (idMunicipio) REFERENCES Municipio(idMunicipio)

ALTER TABLE Persona
ADD CONSTRAINT FKPersonaVivienda 
FOREIGN KEY (idVivienda) REFERENCES Vivienda(idVivienda)

ALTER TABLE Vivienda
ADD CONSTRAINT FKViviendaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Vivienda
ADD CONSTRAINT FKViviendaUsuarioModifica 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Vivienda
ADD CONSTRAINT FKViviendaMunicipio 
FOREIGN KEY (idMunicipio) REFERENCES Municipio(idMunicipio)

ALTER TABLE ViviendaPersona
ADD CONSTRAINT FKViviendaPersonaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE ViviendaPersona
ADD CONSTRAINT FKViviendaPersonaUsuarioModifica 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE ViviendaPersona
ADD CONSTRAINT FKViviendaPersonaVivienda 
FOREIGN KEY (idVivienda) REFERENCES Vivienda(idVivienda)

ALTER TABLE ViviendaPersona
ADD CONSTRAINT FKViviendaPersonaPersona 
FOREIGN KEY (idPersona) REFERENCES Persona(idPersona)

---------------POBLAR
-----------------------------RELACIONES-----------------------------

INSERT INTO Usuario (apellidoPaterno, apellidoMaterno, nombre, correo, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Munoz', ' Garcia', ' Daniela', ' DaGaMu@ghotmail.com', ' 12345.', 1, GETDATE()),
           ('Velazquez', ' Juarez', ' Edith', ' vejued@hotmal.com', ' 67891.', 1, GETDATE()),
           ('Fernandez', ' Lopez', ' Luis', ' Soccer19@outlook.com', ' 13467.', 1, GETDATE()),
           ('Rodriguez',' Gomez', ' Andrea', ' 06and06@gmail.com', ' 25897.', 1, GETDATE()),
           ('Torres', ' Garza', ' Yakelinne', ' yaki2425@gmail.com', ' 15973.', 1, GETDATE())
GO


INSERT INTO Municipio (nombre, numero, idUsuarioCrea, fechaCrea)
    VALUES ('Monclova', '018', 1, GETDATE()),
           ('Saltillo', '030', 1, GETDATE()),
           ('Ocampo', '023', 1, GETDATE()),
           ('Muzquiz', '020', 1, GETDATE()),
           ('Torreon', '035', 1, GETDATE())
GO

INSERT INTO Persona (apellidoPaterno, apellidoMaterno, nombre, curp, edad, telefono, idMunicipio, idVivienda, idUsuarioCrea, fechaCrea)
    VALUES ('Castillo',' Boone', ' Maria', ' CABM123456ABCDEFG', 20, '8661206835', 1, 2, 1, GETDATE()),
           ('Escobedo',' Martinez', ' Veronica', ' ESMV123456ABCDEFG', 21, '8667896532', 3, 4, 1, GETDATE()),
           ('Cortez',' Hernandez', ' Jared', ' COHJ123456ABCDEFG', 25, '8661234578', 5, 5, 1, GETDATE()),
           ('Lugo',' Aguayo', ' Lucia', ' LUAL123456ABCDEFG', 19, '8663572468', 4, 1, 1, GETDATE()),
           ('Sanchez',' Cardenas', ' Carmen', ' SACC123456ABCDEFG', 30, '8664716952', 2, 3, 1, GETDATE())
GO
INSERT INTO Vivienda (codigoPostal, calle, numero, colonia, idMunicipio, idUsuarioCrea, fechaCrea)
    VALUES ('15432',' Calle2',' 1042',' Col1', 2, 1, GETDATE()),
           ('25770',' Calle1',' 2568',' Col2', 1, 1, GETDATE()),
           ('19263',' Calle1',' 1631',' Col3', 4, 1, GETDATE()),
           ('36985',' Calle1',' 7895',' Col4', 3, 1, GETDATE()),
           ('57620',' Calle1',' 2056',' Col5', 5, 1, GETDATE())
GO

INSERT INTO ViviendaPersona (idVivienda, idPersona, idUsuarioCrea, fechaCrea)
    VALUES (1, 5, 1, GETDATE()),
           (2, 1, 1, GETDATE()),
           (3, 4, 1, GETDATE()),
           (4, 2, 1, GETDATE()),
		   (5, 3, 1, GETDATE())
GO

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Usuario
SELECT * FROM Persona
SELECT * FROM Municipio
SELECT * FROM Vivienda
SELECT * FROM ViviendaPersona

GO
-----------------------------VISTAS-----------------------------

CREATE VIEW PersonaViviendaCantidad AS SELECT p.idVivienda, count (v.idVivienda) as cantidad
FROM Persona p INNER JOIN Vivienda v ON p.idVivienda = v.idVivienda WHERE
v.idVivienda = 3 GROUP BY p.idVivienda
GO

CREATE VIEW PersonaMunicipioCantidad AS SELECT p.idMunicipio, count (m.idMunicipio) as cantidad
FROM Persona p INNER JOIN Municipio m ON p.idMunicipio = m.idMunicipio WHERE
m.idMunicipio = 2 GROUP BY p.idMunicipio
GO

CREATE VIEW ViviendaMunicipioCantidad AS SELECT v.idMunicipio, count (m.idMunicipio) as cantidad
FROM Vivienda v INNER JOIN Municipio m ON v.idMunicipio = m.idMunicipio WHERE
m.idMunicipio = 1 GROUP BY v.idMunicipio
GO

CREATE VIEW PersonaInformacionCompleta AS SELECT p.nombre, p.apellidoPaterno, p.apellidoMaterno, v.codigoPostal, v.calle, v.numero, v.colonia, m.nombre
FROM Persona p INNER JOIN  Vivienda v ON p.idVivienda = v.idVivienda INNER JOIN Municipio m ON v.idMunicipio = m.idMunicipio
WHERE p.idPersona = 1 GROUP BY p.nombre, p.apellidoPaterno, p.apellidoMaterno, v.codigoPostal, v.calle, v.numero, v.colonia, m.nombre
GO

CREATE VIEW ViviendaMunicipio AS SELECT v.idVivienda, v.codigoPostal, v.calle, v.numero, v.colonia, m.idMunicipio, m.nombre
FROM Vivienda v INNER JOIN Municipio m ON v.idMunicipio = m.idMunicipio
WHERE m.idMunicipio >= 1 GROUP BY v.idVivienda, v.codigoPostal, v.calle, v.numero, v.colonia, m.idMunicipio, m.nombre
GO
