-----------------------------CREAR-----------------------------
USE master
GO

IF DB_ID (N'AppleStore') IS NOT NULL
DROP DATABASE AppleStore;
GO

CREATE DATABASE AppleStore
ON 
(NAME = AppleStore_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\AppleStore.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
( NAME = AppleStore_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\AppleStore.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB) ;
GO
USE AppleStore
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

CREATE TABLE AdaptadorCorriente
(
    idAdaptadorCorriente int IDENTITY(1,1),
    especificacion varchar (50) not null,
    compatible varchar (50) not null,
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKAdaptadorCorriente PRIMARY KEY(idAdaptadorCorriente)
)

CREATE TABLE AirPods
(
    idAirPods int IDENTITY(1,1),
    modelo varchar (50) not null,
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKAirPods PRIMARY KEY(idAirPods)
)

CREATE TABLE AppleArcade
(
    idAppleArcade int IDENTITY(1,1),
    precio numeric (10,2) not null,
    diasPrueba datetime not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKAppleArcade PRIMARY KEY(idAppleArcade)
)

CREATE TABLE AppleBooks
(
    idAppleBooks int IDENTITY(1,1),
    descripcion varchar (200) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKAppleBooks PRIMARY KEY(idAppleBooks)
)

CREATE TABLE AppleFitnessPlus
(
    idAppleFitnessPlus int IDENTITY(1,1),
    precio numeric (10,2) not null,
    diasPrueba datetime not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKAppleFitnessPlus PRIMARY KEY(idAppleFitnessPlus)
)

CREATE TABLE AppleMusic
(
    idAppleMusic int IDENTITY(1,1),
    planT varchar (50) not null,
    precio numeric (10,2) not null,
    diasPrueba datetime not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKAppleMusic PRIMARY KEY(idAppleMusic)
)

CREATE TABLE ApplePencil
(
    idApplePencil int IDENTITY(1,1),
    generacion varchar (50) not null,
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKApplePencil PRIMARY KEY(idApplePencil)
)

CREATE TABLE ApplePodcast
(
    idApplePodcast int IDENTITY(1,1),
    descripcion varchar (200) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKApplePodcast PRIMARY KEY(idApplePodcast)
)

CREATE TABLE AppleTradeIn
(
    idAppleTradeIn int IDENTITY(1,1),
    dispositivo varchar (50) not null,
    valorCambio numeric (10,2) not null,
    idCliente int not null,	
    idProducto int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKAppleTradeIn PRIMARY KEY(idAppleTradeIn)
)

CREATE TABLE AppleTV
(
    idAppleTV int IDENTITY(1,1),
    resolucion char (5) not null,
    almacenamiento int not null,
    appleCare numeric (10,2) not null,
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKAppleTV PRIMARY KEY(idAppleTV)
)

CREATE TABLE AppleTVPlus
(
    idAppleTVPlus int IDENTITY(1,1),
    planT varchar (50) not null,
    precio numeric (10,2) not null,
    diasPrueba datetime not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKAppleTVPlus PRIMARY KEY(idAppleTVPlus)
)

CREATE TABLE AppleWatch
(
    idAppleWatch int IDENTITY(1,1),
    modelo varchar (50) not null,
    correa varchar (100) not null,
    colorCorrea varchar (50) not null,
    milimetros numeric (10,2) not null,
    appleCare numeric (10,2) not null,
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKAppleWatch PRIMARY KEY(idAppleWatch)
)

CREATE TABLE BaseCarga
(
    idBaseCarga int IDENTITY(1,1),
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKBaseCarga PRIMARY KEY(idBaseCarga)
)

CREATE TABLE CableCargador
(
    idCableCargador int IDENTITY(1,1),
    entrada varchar (50) not null,
    longitud char (5) not null,
	precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCableCargador PRIMARY KEY(idCableCargador)
)

CREATE TABLE Capacitación
(
    idCapacitación int IDENTITY(1,1),
    numDias int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCapacitación PRIMARY KEY(idCapacitación)
)

CREATE TABLE Cliente
(
    idCliente int IDENTITY(1,1),
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
    correo varchar (50) UNIQUE not null,
    contraseña varchar (50) not null,
    telefono char (11) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCliente PRIMARY KEY(idCliente)
)

CREATE TABLE Contrato
(
    idContrato int IDENTITY(1,1),
    firmaComprobada char (3) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKContrato PRIMARY KEY(idContrato)
)

CREATE TABLE Correa
(
    idCorrea int IDENTITY(1,1),
    tipo varchar (50) not null,
    color varchar (50) not null,
    milimetros numeric (10,2) not null,
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCorrea PRIMARY KEY(idCorrea)
)

CREATE TABLE Departamento
(
    idDepartamento int IDENTITY(1,1),
    nombre varchar (100) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKDepartamento PRIMARY KEY(idDepartamento)
)

CREATE TABLE Descuento
(
    idDescuento int IDENTITY(1,1),
    detalle varchar(50) not null,
    precioRebajado numeric (10,2) not null,
    idDescuentoEstudiante int null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKDescuento PRIMARY KEY(idDescuento)
)

CREATE TABLE DescuentoEstudiante
(
    idDescuentoEstudiante int IDENTITY(1,1),
    detalle varchar(100) not null,
    precioRebajado numeric (10,2) not null,
    idiPad int null,
    idMac int null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKDescuentoEstudiante PRIMARY KEY(idDescuentoEstudiante)
)

CREATE TABLE Envío
(
    idEnvío int IDENTITY(1,1),
    codigoPostal char (6) not null,
    calle varchar (50) not null,
    numero char (6) not null,
    colonia varchar (50) not null,
    idVenta int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKEnvío PRIMARY KEY(idEnvío)
)

CREATE TABLE Estado
(
    idEstado int IDENTITY(1,1),
    disponibilidad char (3) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKEstado PRIMARY KEY(idEstado)
)

CREATE TABLE Factura
(
    idFactura int IDENTITY(1,1),
    numero int not null,
    fecha datetime not null,
    precioTotal numeric (10,2) not null,
    idPago int not null,
    idVenta int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKFactura PRIMARY KEY(idFactura)
)

CREATE TABLE GeniusBar
(
    idGeniusBar int IDENTITY(1,1),
    reservacion char (5) not null,
    idProducto int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKGeniusBar PRIMARY KEY(idGeniusBar)
)

CREATE TABLE GiftCard
(
    idGiftCard int IDENTITY(1,1),
    codigo char (11) not null,
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKGiftCard PRIMARY KEY(idGiftCard)
)

CREATE TABLE HomePod
(
    idHomePod int IDENTITY(1,1),
    color varchar (50) not null,
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKHomePod PRIMARY KEY(idHomePod)
)

CREATE TABLE iCloud
(
    idiCloud int IDENTITY(1,1),
    planT varchar (50) not null,
    almacenamiento int not null,
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKiCloud PRIMARY KEY(idiCloud)
)

CREATE TABLE iPad
(
    idiPad int IDENTITY(1,1),
    modelo varchar (50) not null,
    pulgadas numeric (10,2) not null,
    color varchar (50) not null,
    almacenamiento int not null,
    conectividad numeric (10,2) not null,
    grabado varchar (50) not null,
    appleCare numeric (10,2) not null,
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKiPad PRIMARY KEY(idiPad)
)

CREATE TABLE iPhone
(
    idiPhone int IDENTITY(1,1),
    modelo varchar (50) not null,
    pulgadas numeric (10,2) not null,
    color varchar (50) not null,
    almacenamiento int not null,
    appleCare numeric (10,2) not null,
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKiPhone PRIMARY KEY(idiPhone)
)

CREATE TABLE iPod
(
    idiPod int IDENTITY(1,1),
    modelo varchar (50) not null,
    color varchar (50) not null,
    almacenamiento int not null,
    grabado varchar (50) not null,
    appleCare numeric (10,2) not null,
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKiPod PRIMARY KEY(idiPod)
)

CREATE TABLE Llavero
(
    idLlavero int IDENTITY(1,1),
    color varchar (50) not null,
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKLlavero PRIMARY KEY(idLlavero)
)

CREATE TABLE Mac
(
    idMac int IDENTITY(1,1),
    modelo varchar (200) not null,
    color varchar (50) not null,
    appleCare numeric (10,2) not null,
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKMac PRIMARY KEY(idMac)
)

CREATE TABLE MagSafe
(
    idMagSafe int IDENTITY(1,1),
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKMagSafe PRIMARY KEY(idMagSafe)
)

CREATE TABLE Orden
(
    idOrden int IDENTITY(1,1),
    numero int not null,
    fecha datetime not null,
    idCliente int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKOrden PRIMARY KEY(idOrden)
)

CREATE TABLE OrdenCancelada
(
    idOrdenCancelada int IDENTITY(1,1),
    fechaCancelada datetime not null,
    idOrden int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKOrdenCancelada PRIMARY KEY(idOrdenCancelada)
)

CREATE TABLE OrdenDetalle
(
    idOrdenDetalle int IDENTITY(1,1),
    numProducto int not null,
	precioTotal numeric (10,2) not null,
    idOrden int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKOrdenDetalle PRIMARY KEY(idOrdenDetalle)
)

CREATE TABLE Pago
(
    idPago int IDENTITY(1,1),
    tipo varchar (50) not null,
    aprobado char (5) not null,
    idTarjeta int null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPago PRIMARY KEY(idPago)
)

CREATE TABLE Producto
(
    idProducto int IDENTITY(1,1),
    codigo varchar (50) not null,
    idAdaptadorCorriente int null,
    idAirPods int null,
    idApplePencil int null,
    idAppleTV int null,
    idAppleWatch int null,
    idBaseCarga int null,
    idCableCargador int null,
    idCorrea int null,
    idEstado int not null,
    idGiftCard int null,
    idHomePod int null,
    idiPad int null,
    idiPhone int null,
    idiPod int null,
    idLlavero int null,
    idMac int null,
    idMagSafe int null,
    idSiriRemote int null,
    idSuperDrive int null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKProducto PRIMARY KEY(idProducto)
)

CREATE TABLE Proveedor
(
    idProveedor int IDENTITY(1,1),
    nombre varchar (50) not null,
    codigoPostal char (6) not null,
    calle varchar (50) not null,
    numero char (6) not null,
    ciudad varchar (50) not null,	
    pais varchar (50) not null,
    cantidad int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKProveedor PRIMARY KEY(idProveedor)
)

CREATE TABLE Publicidad
(
    idPublicidad int IDENTITY(1,1),
    tipo varchar (50) not null,
	idProducto int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPublicidad PRIMARY KEY(idPublicidad)
)

CREATE TABLE Puesto
(
    idPuesto int IDENTITY(1,1),
    nombre varchar (50) not null,
    salario numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPuesto PRIMARY KEY(idPuesto)
)

CREATE TABLE Reembolso
(
    idReembolso int IDENTITY(1,1),
    cantidad numeric (10,2) not null,
    tipo varchar (50) not null,
    idFactura int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKReembolso PRIMARY KEY(idReembolso)
)

CREATE TABLE Servicio
(
    idServicio int IDENTITY(1,1),
    descripcion varchar (200) not null,
    idAppleArcade int null,
    idAppleBooks int null,
    idAppleFitnessPlus int null,
    idAppleMusic int null,
    idApplePodcast int null,
    idAppleTVPlus int null,
    idiCloud int null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKServicio PRIMARY KEY(idServicio)
)

CREATE TABLE SiriRemote
(
    idSiriRemote int IDENTITY(1,1),
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKSiriRemote PRIMARY KEY(idSiriRemote)
)

CREATE TABLE Sucursal
(
    idSucursal int IDENTITY(1,1),
    codigoPostal char (6) not null,
    calle varchar (50) not null,
    numero char (6) not null,
    colonia varchar (50) not null,
    ciudad varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKSucursal PRIMARY KEY(idSucursal)
)

CREATE TABLE SuperDrive
(
    idSuperDrive int IDENTITY(1,1),
    precio numeric (10,2) not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKSuperDrive PRIMARY KEY(idSuperDrive)
)

CREATE TABLE Tarjeta
(
    idTarjeta int IDENTITY(1,1),
    nombre varchar (50) not null,
    digitos char (25) not null,
    mesExp char (3) not null,
    añoExp int not null,
    cvv int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTarjeta PRIMARY KEY(idTarjeta)
)

CREATE TABLE Trabajador
(
    idTrabajador int IDENTITY(1,1),
    apellidoPaterno varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    nombre varchar (50) not null,
    curp char (19) not null,
    codigoPostal char (6) not null,
    calle varchar (50) not null,
    numero char (6) not null,
    colonia varchar (50) not null,
    idContrato int not null,
    idPuesto int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKTrabajador PRIMARY KEY(idTrabajador)
)

CREATE TABLE Venta
(
    idVenta int IDENTITY(1,1),
    tipo varchar (50) not null,
    idOrden int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKVenta PRIMARY KEY(idVenta)
)

CREATE TABLE CapacitaciónTrabajador
(
    idCapacitaciónTrabajador int IDENTITY(1,1),
    idCapacitación int not null,
    idTrabajador int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKCapacitaciónTrabajador PRIMARY KEY(idCapacitaciónTrabajador)
)

CREATE TABLE OrdenDetalleDescuento
(
    idOrdenDetalleDescuento int IDENTITY(1,1),
    idOrdenDetalle int not null,
    idDescuento int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKOrdenDetalleDescuento PRIMARY KEY(idOrdenDetalleDescuento)
)

CREATE TABLE OrdenDetalleProducto
(
    idOrdenDetalleProducto int IDENTITY(1,1),
    idOrdenDetalle int not null,
    idProducto int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKOrdenDetalleProducto PRIMARY KEY(idOrdenDetalleProducto)
)

CREATE TABLE ProductoDepartamento
(
    idProductoDepartamento int IDENTITY(1,1),
    idProducto int not null,
    idDepartamento int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKProductoDepartamento PRIMARY KEY(idProductoDepartamento)
)

CREATE TABLE ProductoServicio
(
    idProductoServicio int IDENTITY(1,1),
    idProducto int not null,
    idServicio int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKProductoServicio PRIMARY KEY(idProductoServicio)
)

CREATE TABLE PublicidadProducto
(
    idPublicidadProducto int IDENTITY(1,1),
    idPublicidad int not null,
    idProducto int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKPublicidadProducto PRIMARY KEY(idPublicidadProducto)
)

CREATE TABLE SucursalProveedor
(
    idSucursalProveedor int IDENTITY(1,1),
    idSucursal int not null,
    idProveedor int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKSucursalProveedor PRIMARY KEY(idSucursalProveedor)
)

CREATE TABLE SucursalDepartamento
(
    idSucursalDepartamento int IDENTITY(1,1),
    idSucursal int not null,
    idDepartamento int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKSucursalDepartamento PRIMARY KEY(idSucursalDepartamento)
)

CREATE TABLE SucursalTrabajador
(
    idSucursalTrabajador int IDENTITY(1,1),
    idSucursal int not null,
    idTrabajador int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKSucursalTrabajador PRIMARY KEY(idSucursalTrabajador)
)

CREATE TABLE SucursalVenta
(
    idSucursalVenta int IDENTITY(1,1),
    idSucursal int not null,
    idVenta int not null,
    estatus bit default 1,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null,
    CONSTRAINT PKSucursalVenta PRIMARY KEY(idSucursalVenta)
)

-----------------------------INDEX-----------------------------

CREATE INDEX IX_Usuario ON Usuario(idUsuario)
GO
CREATE INDEX IX_AdaptadorCorriente ON AdaptadorCorriente(idAdaptadorCorriente)
GO
CREATE INDEX IX_AirPods ON AirPods(idAirPods)
GO
CREATE INDEX IX_AppleArcade ON AppleArcade(idAppleArcade)
GO
CREATE INDEX IX_AppleBooks ON AppleBooks(idAppleBooks)
GO
CREATE INDEX IX_AppleFitnessPlus ON AppleFitnessPlus(idAppleFitnessPlus)
GO
CREATE INDEX IX_AppleMusic ON AppleMusic(idAppleMusic)
GO
CREATE INDEX IX_ApplePencil ON ApplePencil(idApplePencil)
GO
CREATE INDEX IX_ApplePodcast ON ApplePodcast(idApplePodcast)
GO
CREATE INDEX IX_AppleTradeIn ON AppleTradeIn(idAppleTradeIn)
GO
CREATE INDEX IX_AppleTV ON AppleTV(idAppleTV)
GO
CREATE INDEX IX_AppleTVPlus ON AppleTVPlus(idAppleTVPlus)
GO
CREATE INDEX IX_AppleWatch ON AppleWatch(idAppleWatch)
GO
CREATE INDEX IX_BaseCarga ON BaseCarga(idBaseCarga)
GO
CREATE INDEX IX_CableCargador ON CableCargador(idCableCargador)
GO
CREATE INDEX IX_Capacitación ON Capacitación(idCapacitación)
GO
CREATE INDEX IX_Cliente ON Cliente(idCliente)
GO
CREATE INDEX IX_Contrato ON Contrato(idContrato)
GO
CREATE INDEX IX_Correa ON Correa(idCorrea)
GO
CREATE INDEX IX_Departamento ON Departamento(idDepartamento)
GO
CREATE INDEX IX_Descuento ON Descuento(idDescuento)
GO
CREATE INDEX IX_DescuentoEstudiante ON DescuentoEstudiante(idDescuentoEstudiante)
GO
CREATE INDEX IX_Envío ON Envío(idEnvío)
GO
CREATE INDEX IX_Estado ON Estado(idEstado)
GO
CREATE INDEX IX_Factura ON Factura(idFactura)
GO
CREATE INDEX IX_GeniusBar ON GeniusBar(idGeniusBar)
GO
CREATE INDEX IX_GiftCard ON GiftCard(idGiftCard)
GO
CREATE INDEX IX_HomePod ON HomePod(idHomePod)
GO
CREATE INDEX IX_iCloud ON iCloud(idiCloud)
GO
CREATE INDEX IX_iPad ON iPad(idiPad)
GO
CREATE INDEX IX_iPhone ON iPhone(idiPhone)
GO
CREATE INDEX IX_iPod ON iPod(idiPod)
GO
CREATE INDEX IX_Llavero ON Llavero(idLlavero)
GO
CREATE INDEX IX_Mac ON Mac(idMac)
GO
CREATE INDEX IX_MagSafe ON Usuario(idUsuario)
GO
CREATE INDEX IX_Orden ON Orden(idOrden)
GO
CREATE INDEX IX_OrdenCancelada ON OrdenCancelada(idOrdenCancelada)
GO
CREATE INDEX IX_OrdenDetalle ON OrdenDetalle(idOrdenDetalle)
GO
CREATE INDEX IX_Pago ON Pago(idPago)
GO
CREATE INDEX IX_Producto ON Producto(idProducto)
GO
CREATE INDEX IX_Proveedor ON Proveedor(idProveedor)
GO
CREATE INDEX IX_Publicidad ON Publicidad(idPublicidad)
GO
CREATE INDEX IX_Puesto ON Puesto(idPuesto)
GO
CREATE INDEX IX_Reembolso ON Reembolso(idReembolso)
GO
CREATE INDEX IX_Servicio ON Servicio(idServicio)
GO
CREATE INDEX IX_SiriRemote ON SiriRemote(idSiriRemote)
GO
CREATE INDEX IX_Sucursal ON Sucursal(idSucursal)
GO
CREATE INDEX IX_SuperDrive ON SuperDrive(idSuperDrive)
GO
CREATE INDEX IX_Tarjeta ON Tarjeta(idTarjeta)
GO
CREATE INDEX IX_Trabajador ON Trabajador(idTrabajador)
GO
CREATE INDEX IX_Venta ON Venta(idVenta)
GO
CREATE INDEX IX_CapacitaciónTrabajador ON CapacitaciónTrabajador(idCapacitaciónTrabajador)
GO
CREATE INDEX IX_OrdenDetalleDescuento ON OrdenDetalleDescuento(idOrdenDetalleDescuento)
GO
CREATE INDEX IX_OrdenDetalleProducto ON OrdenDetalleProducto(idOrdenDetalleProducto)
GO
CREATE INDEX IX_ProductoDepartamento ON ProductoDepartamento(idProductoDepartamento)
GO
CREATE INDEX IX_ProductoServicio ON ProductoServicio(idProductoServicio)
GO
CREATE INDEX IX_PublicidadProducto ON PublicidadProducto(idPublicidadProducto)
GO
CREATE INDEX IX_SucursalProveedor ON SucursalProveedor(idSucursalProveedor)
GO
CREATE INDEX IX_SucursalDepartamento ON SucursalDepartamento(idSucursalDepartamento)
GO
CREATE INDEX IX_SucursalTrabajador ON SucursalTrabajador(idSucursalTrabajador)
GO
CREATE INDEX IX_SucursalVenta ON SucursalVenta(idSucursalVenta)
GO

-----------------------------RELACIONES-----------------------------

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE AdaptadorCorriente
ADD CONSTRAINT FKAdaptadorCorrienteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE AdaptadorCorriente
ADD CONSTRAINT FKAdaptadorCorrienteUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE AirPods
ADD CONSTRAINT FKAirPodsUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE AirPods
ADD CONSTRAINT FKAirPodsUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE AppleArcade
ADD CONSTRAINT FKAppleArcadeUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE AppleArcade
ADD CONSTRAINT FKAppleArcadeUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE AppleBooks
ADD CONSTRAINT FKAppleBooksUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE AppleBooks
ADD CONSTRAINT FKAppleBooksUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE AppleFitnessPlus
ADD CONSTRAINT FKAppleFitnessPlusUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE AppleFitnessPlus
ADD CONSTRAINT FKAppleFitnessPlusUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE AppleMusic
ADD CONSTRAINT FKAppleMusicUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE AppleMusic
ADD CONSTRAINT FKAppleMusicUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE ApplePencil
ADD CONSTRAINT FKApplePencilUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE ApplePencil
ADD CONSTRAINT FKApplePencilUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE ApplePodcast
ADD CONSTRAINT FKApplePodcastUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE ApplePodcast
ADD CONSTRAINT FKApplePodcastUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE AppleTradeIn
ADD CONSTRAINT FKAppleTradeInUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE AppleTradeIn
ADD CONSTRAINT FKAppleTradeInUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE AppleTradeIn
ADD CONSTRAINT FKAppleTradeInCliente
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)

ALTER TABLE AppleTV
ADD CONSTRAINT FKAppleTVUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE AppleTV
ADD CONSTRAINT FKAppleTVUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE AppleTVPlus
ADD CONSTRAINT FKAppleTVPlusUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE AppleTVPlus
ADD CONSTRAINT FKAppleTVPlusUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE AppleWatch
ADD CONSTRAINT FKAppleWatchInUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE AppleWatch
ADD CONSTRAINT FKAppleWatchUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE BaseCarga
ADD CONSTRAINT FKBaseCargaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE BaseCarga
ADD CONSTRAINT FKBaseCargaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE CableCargador
ADD CONSTRAINT FKCableCargadorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE CableCargador
ADD CONSTRAINT FKCableCargadorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Capacitación
ADD CONSTRAINT FKCapacitaciónUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Capacitación
ADD CONSTRAINT FKCapacitaciónUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Cliente
ADD CONSTRAINT FKClienteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Cliente
ADD CONSTRAINT FKClienteUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Contrato
ADD CONSTRAINT FKContratoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Contrato
ADD CONSTRAINT FKContratoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Correa
ADD CONSTRAINT FKCorreaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Correa
ADD CONSTRAINT FKCorreaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Departamento
ADD CONSTRAINT FKDepartamentoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Departamento
ADD CONSTRAINT FKDepartamentoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Descuento
ADD CONSTRAINT FKDescuentoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Descuento
ADD CONSTRAINT FKDescuentoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Descuento
ADD CONSTRAINT FKDescuentoDescuentoEstudiante
FOREIGN KEY (idDescuentoEstudiante) REFERENCES DescuentoEstudiante(idDescuentoEstudiante)

ALTER TABLE DescuentoEstudiante
ADD CONSTRAINT FKDescuentoEstudianteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE DescuentoEstudiante
ADD CONSTRAINT FKDescuentoEstudianteUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE DescuentoEstudiante
ADD CONSTRAINT FKDescuentoEstudianteiPad
FOREIGN KEY (idiPad) REFERENCES iPad(idiPad)

ALTER TABLE DescuentoEstudiante
ADD CONSTRAINT FKDescuentoEstudianteMac
FOREIGN KEY (idMac) REFERENCES Mac(idMac)

ALTER TABLE Envío
ADD CONSTRAINT FKEnvíoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Envío
ADD CONSTRAINT FKEnvíoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Envío
ADD CONSTRAINT FKEnvíoVenta
FOREIGN KEY (idVenta) REFERENCES Venta(idVenta)

ALTER TABLE Estado
ADD CONSTRAINT FKEstadoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Estado
ADD CONSTRAINT FKEstadoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Factura
ADD CONSTRAINT FKFacturaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Factura
ADD CONSTRAINT FKFacturaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Factura
ADD CONSTRAINT FKFacturaPago
FOREIGN KEY (idPago) REFERENCES Pago(idPago)

ALTER TABLE Factura
ADD CONSTRAINT FKFacturaVenta
FOREIGN KEY (idVenta) REFERENCES Venta(idVenta)

ALTER TABLE GeniusBar
ADD CONSTRAINT FKGeniusBarUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE GeniusBar
ADD CONSTRAINT FKGeniusBarUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE GeniusBar
ADD CONSTRAINT FKGeniusBarProducto
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)

ALTER TABLE GiftCard
ADD CONSTRAINT FKGiftCardUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE GiftCard
ADD CONSTRAINT FKGiftCardUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE HomePod
ADD CONSTRAINT FKHomePodUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE HomePod
ADD CONSTRAINT FKHomePodUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE iCloud
ADD CONSTRAINT FKiCloudUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE iCloud
ADD CONSTRAINT FKiCloudUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE iPad
ADD CONSTRAINT FKiPadUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE iPad
ADD CONSTRAINT FKiPadUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE iPhone
ADD CONSTRAINT FKiPhoneUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE iPhone
ADD CONSTRAINT FKiPhoneUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE iPod
ADD CONSTRAINT FKiPodUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE iPod
ADD CONSTRAINT FKiPodUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Llavero
ADD CONSTRAINT FKLlaveroUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Llavero
ADD CONSTRAINT FKLlaveroUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Mac
ADD CONSTRAINT FKMacUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Mac
ADD CONSTRAINT FKMacUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE MagSafe
ADD CONSTRAINT FKMagSafeUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE MagSafe
ADD CONSTRAINT FKMagSafeUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Orden
ADD CONSTRAINT FKOrdenUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Orden
ADD CONSTRAINT FKOrdenUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Orden
ADD CONSTRAINT FKOrdenCliente
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)

ALTER TABLE OrdenCancelada
ADD CONSTRAINT FKOrdenCanceladaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE OrdenCancelada
ADD CONSTRAINT FKOrdenCanceladaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE OrdenCancelada
ADD CONSTRAINT FKOrdenCanceladaOrden
FOREIGN KEY (idOrden) REFERENCES Orden(idOrden)

ALTER TABLE OrdenDetalle
ADD CONSTRAINT FKOrdenDetalleUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE OrdenDetalle
ADD CONSTRAINT FKOrdenDetalleUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE OrdenDetalle
ADD CONSTRAINT FKOrdenDetalleOrden
FOREIGN KEY (idOrden) REFERENCES Orden(idOrden)

ALTER TABLE Pago
ADD CONSTRAINT FKPagoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Pago
ADD CONSTRAINT FKPagoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Pago
ADD CONSTRAINT FKPagoTarjeta
FOREIGN KEY (idTarjeta) REFERENCES Tarjeta(idTarjeta)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoAdaptadorCorriente
FOREIGN KEY (idAdaptadorCorriente) REFERENCES AdaptadorCorriente(idAdaptadorCorriente)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoAirPods
FOREIGN KEY (idAirPods) REFERENCES AirPods(idAirPods)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoApplePencil
FOREIGN KEY (idApplePencil) REFERENCES ApplePencil(idApplePencil)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoAppleTV
FOREIGN KEY (idAppleTV) REFERENCES AppleTV(idAppleTV)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoAppleWatch
FOREIGN KEY (idAppleWatch) REFERENCES AppleWatch(idAppleWatch)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoBaseCarga
FOREIGN KEY (idBaseCarga) REFERENCES BaseCarga(idBaseCarga)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoCableCargador
FOREIGN KEY (idCableCargador) REFERENCES CableCargador(idCableCargador)

ALTER TABLE Estado
ADD CONSTRAINT FKProductoEstado
FOREIGN KEY (idEstado) REFERENCES Estado(idEstado)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoGiftCard
FOREIGN KEY (idGiftCard) REFERENCES GiftCard(idGiftCard)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoHomePod
FOREIGN KEY (idHomePod) REFERENCES HomePod(idHomePod)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoiPad
FOREIGN KEY (idiPad) REFERENCES iPad(idiPad)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoiPhone
FOREIGN KEY (idiPhone) REFERENCES iPhone(idiPhone)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoiPod
FOREIGN KEY (idiPod) REFERENCES iPod(idiPod)

ALTER TABLE Llavero
ADD CONSTRAINT FKProductoLlavero
FOREIGN KEY (idLlavero) REFERENCES Llavero(idLlavero)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoMac
FOREIGN KEY (idMac) REFERENCES Mac(idMac)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoMagSafe
FOREIGN KEY (idMagSafe) REFERENCES MagSafe(idMagSafe)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoSiriRemote
FOREIGN KEY (idSiriRemote) REFERENCES SiriRemote(idSiriRemote)

ALTER TABLE Producto
ADD CONSTRAINT FKProductoSuperDrive
FOREIGN KEY (idSuperDrive) REFERENCES SuperDrive(idSuperDrive)

ALTER TABLE Proveedor
ADD CONSTRAINT FKProveedorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Proveedor
ADD CONSTRAINT FKProveedorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Publicidad
ADD CONSTRAINT FKPublicidadUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Publicidad
ADD CONSTRAINT FKPublicidadUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Puesto
ADD CONSTRAINT FKPuestoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Puesto
ADD CONSTRAINT FKPuestoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Reembolso
ADD CONSTRAINT FKReembolsoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Reembolso
ADD CONSTRAINT FKReembolsoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Reembolso
ADD CONSTRAINT FKReembolsoFactura
FOREIGN KEY (idFactura) REFERENCES Factura(idFactura)

ALTER TABLE Servicio
ADD CONSTRAINT FKServicioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Servicio
ADD CONSTRAINT FKServicioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Servicio
ADD CONSTRAINT FKServicioAppleArcade
FOREIGN KEY (idAppleArcade) REFERENCES AppleArcade(idAppleArcade)

ALTER TABLE Servicio
ADD CONSTRAINT FKServicioAppleBooks
FOREIGN KEY (idAppleBooks) REFERENCES AppleBooks(idAppleBooks)

ALTER TABLE Servicio
ADD CONSTRAINT FKServicioAppleFitnessPlus
FOREIGN KEY (idAppleFitnessPlus) REFERENCES AppleFitnessPlus(idAppleFitnessPlus)

ALTER TABLE Servicio
ADD CONSTRAINT FKServicioAppleMusic
FOREIGN KEY (idAppleMusic) REFERENCES AppleMusic(idAppleMusic)

ALTER TABLE Servicio
ADD CONSTRAINT FKServicioApplePodcast
FOREIGN KEY (idApplePodcast) REFERENCES ApplePodcast(idApplePodcast)

ALTER TABLE Servicio
ADD CONSTRAINT FKServicioAppleTVPlus
FOREIGN KEY (idAppleTVPlus) REFERENCES AppleTVPlus(idAppleTVPlus)

ALTER TABLE Servicio
ADD CONSTRAINT FKServicioiCloud
FOREIGN KEY (idiCloud) REFERENCES iCloud(idiCloud)

ALTER TABLE SiriRemote
ADD CONSTRAINT FKSiriRemoteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE SiriRemote
ADD CONSTRAINT FKSiriRemoteUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Sucursal
ADD CONSTRAINT FKSucursalUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Sucursal
ADD CONSTRAINT FKSucursalUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE SuperDrive
ADD CONSTRAINT FKSuperDriveUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE SuperDrive
ADD CONSTRAINT FKSuperDriveUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Tarjeta
ADD CONSTRAINT FKTarjetaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Tarjeta
ADD CONSTRAINT FKTarjetaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Trabajador
ADD CONSTRAINT FKTrabajadorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Trabajador
ADD CONSTRAINT FKTrabajadorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Trabajador
ADD CONSTRAINT FKTrabajadorContrato
FOREIGN KEY (idContrato) REFERENCES Contrato(idContrato)

ALTER TABLE Trabajador
ADD CONSTRAINT FKTrabajadorPuesto
FOREIGN KEY (idPuesto) REFERENCES Puesto(idPuesto)

ALTER TABLE Venta
ADD CONSTRAINT FKVentaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE Venta
ADD CONSTRAINT FKVentaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE Venta
ADD CONSTRAINT FKVentaOrden
FOREIGN KEY (idOrden) REFERENCES Orden(idOrden)

ALTER TABLE CapacitaciónTrabajador
ADD CONSTRAINT FKCapacitaciónTrabajadorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE CapacitaciónTrabajador
ADD CONSTRAINT FKCapacitaciónTrabajadorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE CapacitaciónTrabajador
ADD CONSTRAINT FKCapacitaciónTrabajadorCapacitación
FOREIGN KEY (idCapacitación) REFERENCES Capacitación(idCapacitación)

ALTER TABLE CapacitaciónTrabajador
ADD CONSTRAINT FKCapacitaciónTrabajadorTrabajador
FOREIGN KEY (idTrabajador) REFERENCES Trabajador(idTrabajador)

ALTER TABLE OrdenDetalleDescuento
ADD CONSTRAINT FKOrdenDetalleDescuentoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE OrdenDetalleDescuento
ADD CONSTRAINT FKOrdenDetalleDescuentoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE OrdenDetalleDescuento
ADD CONSTRAINT FKOrdenDetalleDescuentoOrdenDetalle
FOREIGN KEY (idOrdenDetalle) REFERENCES OrdenDetalle(idOrdenDetalle)

ALTER TABLE OrdenDetalleDescuento
ADD CONSTRAINT FKOrdenDetalleDescuentoDescuento
FOREIGN KEY (idDescuento) REFERENCES Descuento(idDescuento)

ALTER TABLE OrdenDetalleProducto
ADD CONSTRAINT FKOrdenDetalleProductoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE OrdenDetalleProducto
ADD CONSTRAINT FKOrdenDetalleProductoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE OrdenDetalleProducto
ADD CONSTRAINT FKOrdenDetalleProductoOrdenDetalle
FOREIGN KEY (idOrdenDetalle) REFERENCES OrdenDetalle(idOrdenDetalle)

ALTER TABLE OrdenDetalleProducto
ADD CONSTRAINT FKOrdenDetalleProductoProducto
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)

ALTER TABLE ProductoDepartamento
ADD CONSTRAINT FKProductoDepartamentoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE ProductoDepartamento
ADD CONSTRAINT FKProductoDepartamentoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE ProductoDepartamento
ADD CONSTRAINT FKProductoDepartamentoProducto
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)

ALTER TABLE ProductoDepartamento
ADD CONSTRAINT FKProductoDepartamentoDepartamento
FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento)

ALTER TABLE ProductoServicio
ADD CONSTRAINT FKProductoServicioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE ProductoServicio
ADD CONSTRAINT FKProductoServicioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE ProductoServicio
ADD CONSTRAINT FKProductoServicioProducto
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)

ALTER TABLE ProductoServicio
ADD CONSTRAINT FKProductoServicioServicio
FOREIGN KEY (idServicio) REFERENCES Servicio(idServicio)

ALTER TABLE PublicidadProducto
ADD CONSTRAINT FKPublicidadProductoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE PublicidadProducto
ADD CONSTRAINT FKPublicidadProductoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE PublicidadProducto
ADD CONSTRAINT FKPublicidadProductoPublicidad
FOREIGN KEY (idPublicidad) REFERENCES Publicidad(idPublicidad)

ALTER TABLE PublicidadProducto
ADD CONSTRAINT FKPublicidadProductoProducto
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)

ALTER TABLE SucursalProveedor
ADD CONSTRAINT FKSucursalProveedorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE SucursalProveedor
ADD CONSTRAINT FKSucursalProveedorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE SucursalProveedor
ADD CONSTRAINT FKSucursalProveedorSucursal
FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal)

ALTER TABLE SucursalProveedor
ADD CONSTRAINT FKSucursalProveedorProveedor
FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor)

ALTER TABLE SucursalDepartamento
ADD CONSTRAINT FKSucursalDepartamentoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE SucursalDepartamento
ADD CONSTRAINT FKSucursalDepartamentoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE SucursalDepartamento
ADD CONSTRAINT FKSucursalDepartamentoSucursal
FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal)

ALTER TABLE SucursalDepartamento
ADD CONSTRAINT FKSucursalDepartamentoDepartamento
FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento)

ALTER TABLE SucursalTrabajador
ADD CONSTRAINT FKSucursalTrabajadorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE SucursalTrabajador
ADD CONSTRAINT FKSucursalTrabajadorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE SucursalTrabajador
ADD CONSTRAINT FKSucursalTrabajadorSucursal
FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal)

ALTER TABLE SucursalTrabajador
ADD CONSTRAINT FKSucursalTrabajadorTrabajador
FOREIGN KEY (idTrabajador) REFERENCES Trabajador(idTrabajador)

ALTER TABLE SucursalVenta
ADD CONSTRAINT FKSucursalVentaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)

ALTER TABLE SucursalVenta
ADD CONSTRAINT FKSucursalVentaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)

ALTER TABLE SucursalVenta
ADD CONSTRAINT FKSucursalVentaSucursal
FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal)

ALTER TABLE SucursalVenta
ADD CONSTRAINT FKSucursalVentaVenta
FOREIGN KEY (idVenta) REFERENCES Venta(idVenta)

---------------POBLAR
-----------------------------RELACIONES-----------------------------

INSERT INTO Usuario (apellidoPaterno, apellidoMaterno, nombre, correo, clave, idUsuarioCrea, fechaCrea)
    VALUES ('Munoz', ' Garcia', ' Daniela Edith', ' I19050603@monclova.tecnm.mx', ' Tec12345.', 1, GETDATE())
GO

INSERT INTO AdaptadorCorriente (especificacion, compatible, precio, idUsuarioCrea, fechaCrea)
    VALUES ('USB-C 67w',' MacBook', 1549.00, 1, GETDATE()),
		   ('USB-C 140w',' MacBook', 2499.00, 1, GETDATE()),
		   ('USB-C 20w',' iPhone, iPad, AppleWatch, Airpods', 549.00, 1, GETDATE()),
		   ('USB-C 30w',' iPhone, iPad, MacBook', 1349.00, 1, GETDATE()),
		   ('USB-C 12w',' iPhone, iPad, AppleWatch, iPod', 549.00, 1, GETDATE()),
		   ('USB-C 96w',' MacBook', 1999.00, 1, GETDATE()),
		   ('USB 5w',' iPhone, iPad, AppleWatch, iPod', 549.00, 1, GETDATE())
GO

INSERT INTO AirPods (modelo, precio, idUsuarioCrea, fechaCrea)
    VALUES ('Tercera Generacion', 4499.00, 1, GETDATE()),
		   ('Pro', 5999.00, 1, GETDATE()),
		   ('Max', 13699.00, 1, GETDATE()),
		   ('Segunda Generacion', 3299.00, 1, GETDATE()),
		   ('Tercera Generacion', 4499.00, 1, GETDATE())
GO

INSERT INTO AppleArcade (precio, diasPrueba, idUsuarioCrea, fechaCrea)
    VALUES (69.00, GETDATE(), 1, GETDATE())           
GO

INSERT INTO AppleBooks (descripcion, idUsuarioCrea, fechaCrea)
    VALUES ('El principito, Antoine de Saint-Exupery', 1, GETDATE()),
		   ('Si ella supiera, Blake Pierce', 1, GETDATE()),
		   ('Del amor y otras formas de suicidio, Manolo Cruz', 1, GETDATE()),
		   ('Mitologia Griega: La guerra entre titanes y dioses , Charles Saintduval', 1, GETDATE()),
		   ('La divina comedia, Dante alighieri', 1, GETDATE()),
		   ('Buenas historias de malos dias,  Carlos Lerma', 1, GETDATE()),
		   ('Sun Tzu el arte de la guerra, Secretaria de la cultura', 1, GETDATE()),
		   ('Orgullo y prejuicio, Jane Austen', 1, GETDATE()),
		   ('La ultima jugada, Fernando Trujillo', 1, GETDATE()),
		   ('Maze Runner: Correr o Morir, James Dashner', 1, GETDATE())
GO

INSERT INTO AppleFitnessPlus (precio, diasPrueba, idUsuarioCrea, fechaCrea)
    VALUES (149.00, GETDATE(), 1, GETDATE()),
		   (899.00, GETDATE(), 1, GETDATE())
GO

INSERT INTO AppleMusic (planT, precio, diasPrueba, idUsuarioCrea, fechaCrea)
    VALUES ('Voice', 59.00, GETDATE(), 1, GETDATE()),
		   ('Estudiantes', 49.00, GETDATE(), 1, GETDATE()),
		   ('Individual', 99.00, GETDATE(), 1, GETDATE()),
		   ('Familiar', 149.00, GETDATE(), 1, GETDATE()) 
GO

INSERT INTO ApplePencil (generacion, precio, idUsuarioCrea, fechaCrea)
    VALUES ('Segunda Generacion', 3299.00, 1, GETDATE()),
		   ('Primera Generacion', 2399.00, 1, GETDATE())
GO

INSERT INTO ApplePodcast (descripcion, idUsuarioCrea, fechaCrea)
    VALUES ('Perdon por el Espanglish, Fa Orozco / Sofiberta', 1, GETDATE()),
		   ('Anything Goes, Emma Chamberlain', 1, GETDATE()),
		   ('Se regalan dudas, Dudas Medias', 1, GETDATE()),
		   ('ASMR en español, Leslie ASMR', 1, GETDATE()),
		   ('Daebak show, Eric Nam', 1, GETDATE()),
		   ('En terapia, Roberto Rocha', 1, GETDATE()),
		   ('EALE EL podcast, Daniela Rodrice', 1, GETDATE()),
		   ('Aprende mas Ingles, Daniel Welsch', 1, GETDATE()),
		   ('All ears English podcast, Lindsay McMahon / Michelle Kaplan', 1, GETDATE()),
		   ('El cotorreo Coreano, Ji Moon', 1, GETDATE())
GO

INSERT INTO Cliente (apellidoPaterno, apellidoMaterno, nombre, correo, contraseña, telefono, idUsuarioCrea, fechaCrea)
    VALUES ('Castillo',' Boone', ' Maria', ' txtsoobin@hotmail.com', ' sisoy123.', ' 8661203568', 1, GETDATE()),
           ('Escobedo',' Martinez', ' Veronica', ' dubaduwariwari@hotmail.com', ' cscycbkthk.', ' 8667891263', 1, GETDATE()),
		   ('Cortez',' Hernandez', ' Jared', ' Leto69@hotmail.com', ' hola789.', ' 8667412589', 1, GETDATE()),
		   ('Lugo',' Aguayo', ' Lucia', ' btsjin@hotmail.com', ' samchip1.', ' 8664268956', 1, GETDATE()),
		   ('Sanchez',' Cardenas', ' Carmen', ' frijolesrancios@hotmail.com', ' galleta123.', ' 8667326542', 1, GETDATE()),
		   ('Velazquez', ' Juarez', ' Edith', ' vejued@hotmal.com', ' holamundo.', ' 8661234578', 1, GETDATE()),
           ('Fernandez', ' Lopez', ' Luis', ' Soccer19@outlook.com', ' calle467.', ' 8663695847', 1, GETDATE()),
           ('Rodriguez',' Gomez', ' Andrea', ' 06and06@gmail.com', ' cuchara97.', ' 8661312468', 1, GETDATE()),
           ('Torres', ' Garza', ' Yakelinne', ' yaki2425@gmail.com', ' nosvemos3.', ' 8666520323', 1, GETDATE()),
           ('Juarez', ' Aguilar', ' Guadalupe', ' guada@gmail.com', ' sayonara.', ' 8667426569', 1, GETDATE())
GO

INSERT INTO AppleTV (resolucion, almacenamiento, appleCare, precio, idUsuarioCrea, fechaCrea)
    VALUES ('HD', 32, 799.00, 3799.00, 1, GETDATE()),
		   ('4K', 32, 799.00, 4499.00, 1, GETDATE()),
		   ('4K', 64, 799.00, 4999.00, 1, GETDATE())
GO

INSERT INTO AppleWatch (modelo, correa, colorCorrea, milimetros, appleCare, precio, idUsuarioCrea, fechaCrea)
    VALUES ('Series 7 Caja aluminio Verde', ' Correa con eslabones de piel', ' Verde secuoya', 0.41 , 2199.00, 11399.00, 1, GETDATE()),
		   ('Series 7 Caja aluminio Verde', ' Correa con eslabones de piel', ' Cereza oscuro', 0.45 , 2199.00, 12199.00, 1, GETDATE()),
		   ('Series SE Caja aluminio color oro', ' Correa loop deportiva', ' Rosa citrico/canela', 0.40 , 1499.00, 7499.00, 1, GETDATE()),
		   ('Series SE Caja aluminio color oro', ' Correa loop deportiva', ' Maiz/blanco', 0.44 , 1499.00, 8299.00, 1, GETDATE()),
		   ('Series 3 Caja aluminio Gris espacial', ' Correa deportiva', ' Negra', 0.42 , 1499.00, 5799.00, 1, GETDATE()),
		   ('Series 3 Caja aluminio Plata', ' Correa deportiva', ' Blanca', 0.42 , 1499.00, 5799.00, 1, GETDATE()),
		   ('Nike Series 7 Caja aluminio Blanco estelar', ' Correa deportiva nike', ' Brasa magica/carmesi palido', 0.45 , 2199.00, 10799.00, 1, GETDATE()),
		   ('Nike Series 7 Caja aluminio Azul medianoche', ' Correa loop deportiva nike', ' Blanco cumbre', 0.41 , 2199.00, 9999.00, 1, GETDATE()),
		   ('Hermes Series 7 Caja acero inoxidable Plata', ' Correa Circuit H Simple Tour', ' Rouge H/Noir', 0.45 , 3899.00, 34399.00, 1, GETDATE()),
		   ('Hermes Series 7 Caja acero inoxidable Plata', ' Correa Gourmette Double Tour', ' Fauve', 0.41 , 3899.00, 43099.00, 1, GETDATE())
GO

INSERT INTO BaseCarga (precio, idUsuarioCrea, fechaCrea)
    VALUES (1999.00, 1, GETDATE()), 
		   (599.00, 1, GETDATE()), 
		   (699.00, 1, GETDATE()), 
		   (1499.00, 1, GETDATE())
GO

INSERT INTO CableCargador (entrada, longitud, precio, idUsuarioCrea, fechaCrea)
    VALUES ('Lightning a USB', ' 2 m', 799.00, 1, GETDATE()),
		   ('Lightning a USB', ' 1 m', 549.00, 1, GETDATE()),
		   ('Lightning a USB', ' 5 mm', 549.00, 1, GETDATE()),
		   ('USB-C', ' 2 m', 549.00, 1, GETDATE()),
		   ('USB-C', ' 1 m', 549.00, 1, GETDATE()),
		   ('Para Apple Watch', ' 1 m', 799.00, 1, GETDATE()),
		   ('USB-C Para Apple Watch', ' 1 m', 799.00, 1, GETDATE()),
		   ('30 pin a USB', ' 1 m', 549.00, 1, GETDATE()),
		   ('30 pin a USB', ' 2 m', 799.00, 1, GETDATE()),
		   ('30 pin a USB', ' 5 mm', 549.00, 1, GETDATE())
GO

INSERT INTO Correa (tipo, color, milimetros, precio, idUsuarioCrea, fechaCrea)
    VALUES ('Uniloop trenzada', ' Limonada rosa', 0.44, 2599.00, 1, GETDATE()),
		   ('Uniloop', ' Naranja melón', 0.44, 1199.00, 1, GETDATE()),
		   ('Attelage Double Tour', '  Bleu Lin', 0.41, 12299.00, 1, GETDATE()),
		   ('Deportiva', ' Lavanda inglesa', 0.45, 1199.00, 1, GETDATE()),
		   ('Deportiva', ' Black Unity', 0.44, 1199.00, 1, GETDATE()),
		   ('loop deportiva', ' Gris tornado/gris lobo', 0.45, 1199.00, 1, GETDATE()),
		   ('Eslabones', ' Plata', 0.42, 8299.00, 1, GETDATE()),
		   ('Milanés', ' Oro', 0.45, 2599.00, 1, GETDATE()),
		   ('Eslabones', ' Negro espacial', 0.42, 10499.00, 1, GETDATE()),
		   ('Correa Jumping Simple Tour', ' Rouge de Cœur/Rouge H', 0.44, 7699.00, 1, GETDATE())
GO

INSERT INTO Estado (disponibilidad, idUsuarioCrea, fechaCrea)
    VALUES ('Si', 1, GETDATE()),
		   ('No', 1, GETDATE())
GO

INSERT INTO GiftCard (codigo, precio, idUsuarioCrea, fechaCrea)
    VALUES ('123ABC456A', 100.00, 1, GETDATE()),
		   ('456DEF789B', 200.00, 1, GETDATE()),
		   ('789GHI147C', 300.00, 1, GETDATE()),
		   ('147JKL258D', 400.00, 1, GETDATE()),
		   ('258MNO369E', 500.00, 1, GETDATE()),
		   ('369PQR159F', 150.00, 1, GETDATE()),
		   ('159STU263G', 250.00, 1, GETDATE()),
		   ('263VWX487H', 450.00, 1, GETDATE()),
		   ('487YZA357I', 100.00, 1, GETDATE()),
		   ('357BFG125J', 200.00, 1, GETDATE())
GO

INSERT INTO HomePod (color, precio, idUsuarioCrea, fechaCrea)
    VALUES ('Gris espacial', 2599.00, 1, GETDATE()),
		   ('Azul', 2599.00, 1, GETDATE()),
		   ('Amarillo', 2599.00, 1, GETDATE()),
		   ('Naranja', 2599.00, 1, GETDATE()),
		   ('Blanco', 2599.00, 1, GETDATE())
GO

INSERT INTO iPad (modelo, pulgadas, color, almacenamiento, conectividad, grabado, appleCare, precio, idUsuarioCrea, fechaCrea)
    VALUES ('iPad Pro', 11.00, ' Gris espacial', 256, 3700.00, '', 3499.00, 26099.00, 1, GETDATE()),
		   ('iPad Pro', 12.90, ' Plata', 128, 3700.00, ' Hola', 3999.00, 30099.00, 1, GETDATE()),
		   ('iPad Air', 10.90, ' Azul cielo', 256, 3500.00, '', 1699.00, 22849.00, 1, GETDATE()),
		   ('iPad Air', 10.90, ' Verde', 256, 3500.00, 'STAN TXT', 1699.00, 18649.00, 1, GETDATE()),
		   ('iPad', 10.20, ' Gris espacial', 256, 3200.00, '', 1699.00, 15399.00, 1, GETDATE()),
		   ('iPad', 10.20, ' Plata', 64, 3200.00, 'Lover = Lo$er', 1699.00, 11699.00, 1, GETDATE()),
		   ('iPad Mini', 8.30, ' Gris espacial', 256, 3600.00, '', 1699.00, 19299.00, 1, GETDATE()),
		   ('iPad Mini', 8.30, ' Blanco estelar', 256, 3600.00, 'TaeTae', 16399.00, 19299.00, 1, GETDATE()),
		   ('iPad Mini', 8.30, ' Morado', 64, 3600.00, '', 1699.00, 15699.00, 1, GETDATE()),
		   ('iPad Pro', 12.90, ' Gris espacial', 1, 3700.00, 'Dubadu wari wari', 3999.00, 48999.00, 1, GETDATE())
GO

INSERT INTO iPhone (modelo, pulgadas, color, almacenamiento, appleCare, precio, idUsuarioCrea, fechaCrea)
    VALUES ('iPhone 13 Pro Max', 6.70, ' Azul sierra', 1, 5899.00, 41999.00, 1, GETDATE()),
		   ('iPhone 13 Pro', 6.10, ' Grafito', 1, 5899.00, 38999.00, 1, GETDATE()),
		   ('iPhone 13', 6.10, ' Rosa', 512, 4299.00, 28999.00, 1, GETDATE()),
		   ('iPhone 13 Mini', 5.4, ' Azul medianoche', 512, 4299.00, 25999.00, 1, GETDATE()),
		   ('iPhone 12', 6.10, 'Azul', 128, 4299.00, 19499.00, 1, GETDATE()),
		   ('iPhone 12 Mini', 5.40, ' Rojo', 128, 4299.00, 16499.00, 1, GETDATE()),
		   ('iPhone SE', 4.70, ' Blanco', 64, 2499.00, 10000.00, 1, GETDATE()),
		   ('iPhone SE', 4.70, ' Rojo', 128, 2499.00, 11999.00, 1, GETDATE()),
		   ('iPhone 11', 6.10, ' Verde', 64, 4299.00, 12999.00, 1, GETDATE()),
		   ('iPhone 11', 6.10, ' Morado', 128, 4299.00, 14499.00, 1, GETDATE())
GO

INSERT INTO iPod (modelo, color, almacenamiento, grabado, appleCare, precio, idUsuarioCrea, fechaCrea)
    VALUES ('Quinta generacion', ' Azul', 128, ' Owo', 999.00, 7199.00, 1, GETDATE()),
		   ('Quinta generacion', ' Rosa', 128, ' ', 999.00, 7199.00, 1, GETDATE()),
		   ('Quinta generacion', ' Oro', 128, ' TaeTae', 999.00, 7199.00, 1, GETDATE()),
		   ('Quinta generacion', ' Plata', 32, ' ', 999.00, 4699.00, 1, GETDATE()),
		   ('Quinta generacion', ' Gris espacial', 128, ' 1x0=Lovesong', 999.00, 7199.00, 1, GETDATE()),
		   ('Quinta generacion', ' Rojo', 128, ' ', 999.00, 7199.00, 1, GETDATE()),
		   ('Cuarta generacion', ' Oro', 32, ' TXT', 599.00, 3100.00, 1, GETDATE()),
		   ('Cuarta generacion', ' Plata', 32, ' ', 599.00, 3100.00, 1, GETDATE()),
		   ('Cuarta generacion', ' Gris espacial', 32, ' 19050203', 599.00, 3100.00, 1, GETDATE()),
		   ('Quinta generacion', ' Azul', 256, ' ', 599.00, 9699.00, 1, GETDATE())
GO

INSERT INTO Llavero (color, precio, idUsuarioCrea, fechaCrea)
    VALUES ('Rojo', 949.00, 1, GETDATE()),
		   ('Morado jacaranda', 949.00, 1, GETDATE()),
		   ('Rosa', 379.00, 1, GETDATE()),
		   ('Girasol', 799.00, 1, GETDATE()),
		   ('Azul báltico', 1099.00, 1, GETDATE()),
		   ('Blanco', 379.00, 1, GETDATE()),
		   ('Bleu Saphir', 8299.00, 1, GETDATE()),
		   ('Gold', 10699.00, 1, GETDATE()),
		   ('Fauve', 10699.00, 1, GETDATE()),
		   ('Piment', 6999.00, 1, GETDATE())
GO

INSERT INTO Mac (modelo, color, appleCare, precio, idUsuarioCrea, fechaCrea)
    VALUES ('MacBook Air', ' Plata', 6499.00, 30099.00, 1, GETDATE()),
		   ('MacBook Air', ' Oro', 6499.00, 30099.00, 1, GETDATE()),
		   ('MacBook Pro', ' Gris espacial', 6499.00, 60999.00, 1, GETDATE()),
		   ('MacBook Pro', ' Plata', 6499.00, 60999.00, 1, GETDATE()),
		   ('iMac', ' Azul', 6499.00, 41399.00, 1, GETDATE()),
		   ('iMac', ' Verde', 6499.00, 41399.00, 1, GETDATE()),
		   ('iMac', ' Rosa', 6499.00, 41399.00, 1, GETDATE()),
		   ('iMac', ' Plata', 6499.00, 41399.00, 1, GETDATE()),
		   ('iMac', ' Amarillo', 6499.00, 41399.00, 1, GETDATE()),
		   ('iMac', ' Morado', 6499.00, 41399.00, 1, GETDATE())
GO

INSERT INTO MagSafe (precio, idUsuarioCrea, fechaCrea)
    VALUES (999.00, 1, GETDATE()),
		   (3499.00, 1, GETDATE())
GO

INSERT INTO SiriRemote (precio, idUsuarioCrea, fechaCrea)
    VALUES (1499.00, 1, GETDATE()),
		   (549.00, 1, GETDATE())
GO

INSERT INTO SuperDrive (precio, idUsuarioCrea, fechaCrea)
    VALUES (1999.00, 1, GETDATE())           
GO

INSERT INTO Producto (codigo, idAdaptadorCorriente, idAirPods, idApplePencil, idAppleTV, idAppleWatch, idBaseCarga, idCableCargador, idCorrea, idEstado, idGiftCard, idHomePod, idiPad, idiPhone, idiPod, idLlavero, idMac, idMagSafe, idSiriRemote, idSuperDrive, idUsuarioCrea, fechaCrea)
    VALUES ('12AB34CD', null, 1, null, null, null, null, null, null, 1, null, null, null, null, null, null, null, null, null, null, 1, GETDATE()),
		   ('12AB34EF', null, null, null, 1, null, null, null, null, 1, null, null, null, null, null, null, null, null, null, null, 1, GETDATE()),
		   ('12AB34GH', null, null, null, null, 1, null, null, null, 1, null, null, null, null, null, null, null, null, null, null, 1, GETDATE()),
		   ('12AB34IJ', null, null, null, null, null, null, null, 1, 1, null, null, null, null, null, null, null, null, null, null, 1, GETDATE()),
		   ('12AB34KL', null, null, null, null, null, null, null, null, 1, null, null, 1, null, null, null, null, null, null, null, 1, GETDATE()),
		   ('12AB34MN', null, null, null, null, null, null, null, null, 1, null, null, null, 1, null, null, null, null, null, null, 1, GETDATE()),
		   ('12AB34OP', null, null, null, null, null, null, null, null, 1, null, null, null, null, 1, null, null, null, null, null, 1, GETDATE()),
		   ('12AB34QR', null, null, null, null, null, null, null, null, 1, null, null, null, null, null, 1, null, null, null, null, 1, GETDATE()),
		   ('12AB34ST', null, null, null, null, null, null, null, null, 1, null, null, null, null, null, null, 1, null, null, null, 1, GETDATE()),
		   ('12AB34UV', null, null, null, null, null, null, null, null, 1, null, null, null, null, null, null, null, 1, null, null, 1, GETDATE())
GO

INSERT INTO AppleTradeIn (dispositivo, valorCambio, idCliente, idProducto, idUsuarioCrea, fechaCrea)
    VALUES ('iPhone 12 Pro', 8380.00, 1, 14, 1, GETDATE()),
		   ('iPad', 2500.00, 2, 13, 1, GETDATE()),
		   ('MacBook Air', 5430.00, 3, 17, 1, GETDATE()),
		   ('iPhone 12 Pro Max', 9020.00, 4, 14, 1, GETDATE()),
		   ('Watch series 6', 2500.00, 5, 6, 1, GETDATE()),
		   ('iPad Pro', 5400.00, 6, 13, 1, GETDATE()),
		   ('MacBook Pro', 11460.00, 7, 17, 1, GETDATE()),
		   ('iPhone 11', 5300.00, 8, 14, 1, GETDATE()),
		   ('iPhone 7 Plus', 1540.00, 9, 14, 1, GETDATE()),
		   ('iPad Air', 2855.00, 10, 13, 1, GETDATE())
GO

INSERT INTO AppleTVPlus (planT, precio, diasPrueba, idUsuarioCrea, fechaCrea)
    VALUES ('Mensual', 63.00, GETDATE(), 1, GETDATE())           
GO

INSERT INTO Capacitación (numDias, idUsuarioCrea, fechaCrea)
    VALUES (5, 1, GETDATE()),
		   (20, 1, GETDATE()),
		   (42, 1, GETDATE()),
		   (10, 1, GETDATE()),
		   (15, 1, GETDATE()),
		   (21, 1, GETDATE()),
		   (7, 1, GETDATE()),
		   (35, 1, GETDATE()),
		   (19, 1, GETDATE()),
		   (3, 1, GETDATE())
GO

INSERT INTO Contrato (firmaComprobada, idUsuarioCrea, fechaCrea)
    VALUES ('Si', 1, GETDATE()),
		   ('No', 1, GETDATE())
GO

INSERT INTO Departamento (nombre, idUsuarioCrea, fechaCrea)
    VALUES ('Dispositivos moviles', 1, GETDATE()),
		   ('Accesorios', 1, GETDATE()),
		   ('Atencion al Cliente', 1, GETDATE()),
		   ('Genius Lab', 1, GETDATE()),
		   ('Para el Hogar', 1, GETDATE()),
		   ('Computo', 1, GETDATE()),
		   ('Servicios', 1, GETDATE()),
		   ('Reciclaje', 1, GETDATE()),
		   ('Pedidos', 1, GETDATE()),
		   ('En linea', 1, GETDATE())
GO

INSERT INTO DescuentoEstudiante (detalle, precioRebajado, idiPad, idMac, idUsuarioCrea, fechaCrea)
    VALUES ('Descuento en iPad Pro', 19699.00, 1, null, 1, GETDATE()),
		   ('Descuento en iPad Air', 15149.00, 3, null, 1, GETDATE()),
		   ('Descuento en iPad', 8499.00, 5, null, 1, GETDATE()),
		   ('Descuento en iPad Mini', 12099.00, 7, null, 1, GETDATE()),
		   ('Descuento en MacBook Air', 23399.00, null, 1, 1, GETDATE()),
		   ('Descuento en MacBook Pro', 31799.00, null, 3, 1, GETDATE()),
		   ('Descuento en iMac', 32199.00, null, 8, 1, GETDATE())
GO

INSERT INTO Descuento (detalle, precioRebajado, idDescuentoEstudiante, idUsuarioCrea, fechaCrea)
    VALUES ('Rebajas del Buen Fin', 2154.00, null, 1, GETDATE()),  
		   ('Rebajas del Buen Fin', 5126.00, null, 1, GETDATE()),  
		   ('Rebajas del Buen Fin', 3984.00, null, 1, GETDATE()),  
		   ('Rebajas del Buen Fin', 200.00, null, 1, GETDATE()),  
		   ('Rebajas del Buen Fin', 1254.00, null, 1, GETDATE()),  
		   ('Descuento para Universitarios', 0.00, 1, 1, GETDATE()), 
		   ('Descuento para Universitarios', 0.00, 2, 1, GETDATE()), 
		   ('Descuento para Universitarios', 0.00, 3, 1, GETDATE()), 
		   ('Descuento para Universitarios', 0.00, 4, 1, GETDATE()), 
		   ('Descuento para Universitarios', 0.00, 5, 1, GETDATE())
GO

INSERT INTO Orden (numero, fecha, idCliente, idUsuarioCrea, fechaCrea)
    VALUES (01, GETDATE(), 1, 1, GETDATE()),
		   (02, GETDATE(), 2, 1, GETDATE()),
		   (03, GETDATE(), 3, 1, GETDATE()),
		   (04, GETDATE(), 4, 1, GETDATE()),
		   (05, GETDATE(), 5, 1, GETDATE()),
		   (06, GETDATE(), 6, 1, GETDATE()),
		   (07, GETDATE(), 7, 1, GETDATE()),
		   (08, GETDATE(), 8, 1, GETDATE()),
		   (09, GETDATE(), 9, 1, GETDATE()),
		   (010, GETDATE(), 10, 1, GETDATE())
GO

INSERT INTO Venta (tipo, idOrden, idUsuarioCrea, fechaCrea)
    VALUES ('Presencial', 10, 1, GETDATE()),
		   ('Presencial', 9, 1, GETDATE()),
		   ('En Linea', 8, 1, GETDATE()),
		   ('Presencial', 7, 1, GETDATE()),
		   ('Presencial', 6, 1, GETDATE()),
		   ('En Linea', 5, 1, GETDATE()),
		   ('En Linea', 4, 1, GETDATE()),
		   ('Presencial', 3, 1, GETDATE()),
		   ('Presencial', 2, 1, GETDATE()),
		   ('En Linea', 1, 1, GETDATE())
GO

INSERT INTO Envío (codigoPostal, calle, numero, colonia, idVenta, idUsuarioCrea, fechaCrea)
    VALUES ('25740', ' Av.Las Torres', ' 1578', ' La Granja', 1, 1, GETDATE()),
		   ('25861', ' Benito Juarez', '7859', ' Florencia', 2, 1, GETDATE()),
           ('25700', ' Tucanes', '3658', ' Progreso', 3, 1, GETDATE()),
           ('25689', ' Hermenegildo Galenana', '2545', 'Fracc. Aguilar', 4, 1, GETDATE()),
           ('24501', ' Ignacio', '2658', ' Independencia', 5, 1, GETDATE()),
           ('25684', ' Universidad', '1354', ' Flores', 6, 1, GETDATE()),
           ('25770', ' Av. Revolucion Mexicana', '1415', ' 288', 7, 1, GETDATE()),
           ('25892', ' Simon Bolivar', ' 4578', ' Libertad', 8, 1, GETDATE()),
           ('25146', ' Degollado', '1612', ' Carranza', 9, 1, GETDATE()),
           ('25470', ' Juan Antonio de la Fuente', '1548', ' Primero de Mayo', 10, 1, GETDATE())

GO

INSERT INTO Tarjeta (nombre, digitos, mesExp, añoExp, cvv, idUsuarioCrea, fechaCrea)
    VALUES ('Maria Castillo', '346298997862308', 02, 22, 780, 1, GETDATE()),
           ('Veronica Escobedo', '377430922725787', 05, 25, 319, 1, GETDATE()),
           ('Jared Cortez', '376804314545600', 01, 24, 278, 1, GETDATE()),
           ('Lucia Lugo', '5122590520209158', 05, 22, 847, 1, GETDATE()),
           ('Carmen Sanchez', '4709743661964362', 02, 22, 438, 1, GETDATE()),
           ('Edith Velazquez', '5154646185570895', 09, 23, 190, 1, GETDATE()),
           ('Luis Fernandez', '375559951811282', 06, 22, 381, 1, GETDATE()),
           ('Andrea Rodriguez', '4740572661692884', 01, 22, 195, 1, GETDATE()),
           ('Yakelinne Torres', '4349347129659972', 03, 23, 333, 1, GETDATE()),
           ('Guadalupe Juarez', '4452538377251602', 01, 27, 670, 1, GETDATE())
GO

INSERT INTO Pago (tipo, aprobado, idTarjeta, idUsuarioCrea, fechaCrea)
    VALUES ('Transferencia', ' Si', 10, 1, GETDATE()),
		   ('Transferencia', ' Si', 5, 1, GETDATE()),
		   ('Transferencia', ' Si', 9, 1, GETDATE()),
		   ('Transferencia', ' Si', 1, 1, GETDATE()),
		   ('Transferencia', ' Si', 4, 1, GETDATE()),
		   ('Efectivo', ' Si', null, 1, GETDATE()),
		   ('Efectivo', ' Si', null, 1, GETDATE()),
		   ('Efectivo', ' Si', null, 1, GETDATE()),
		   ('Efectivo', ' Si', null, 1, GETDATE()),
		   ('Efectivo', ' Si', null, 1, GETDATE())
GO

INSERT INTO Factura (numero, fecha, precioTotal, idPago, idVenta, idUsuarioCrea, fechaCrea)
    VALUES (001, GETDATE(), 48547.00, 1, 1, 1, GETDATE()),
		   (002, GETDATE(), 12504.00, 2, 2, 1, GETDATE()),
		   (003, GETDATE(), 45788.00, 3, 3, 1, GETDATE()),
		   (004, GETDATE(), 93247.00, 4, 4, 1, GETDATE()),
		   (005, GETDATE(), 125689.00, 5, 5, 1, GETDATE()),
		   (006, GETDATE(), 12587.00, 6, 6, 1, GETDATE()),
		   (007, GETDATE(), 126971.00, 7, 7, 1, GETDATE()),
		   (008, GETDATE(), 1248792.00, 8, 8, 1, GETDATE()),
		   (009, GETDATE(), 457807.00, 9, 9, 1, GETDATE()),
		   (010, GETDATE(), 498235.00, 10, 10, 1, GETDATE())
GO

INSERT INTO GeniusBar (reservacion, idProducto, idUsuarioCrea, fechaCrea)
    VALUES ('Si', 1, 1, GETDATE()),
		   ('Si', 2, 1, GETDATE()),
		   ('Si', 3, 1, GETDATE()),
		   ('Si', 4, 1, GETDATE()),
		   ('Si', 5, 1, GETDATE()),
		   ('Si', 6, 1, GETDATE()),
		   ('Si', 7, 1, GETDATE()),
		   ('Si', 8, 1, GETDATE()),
		   ('Si', 9, 1, GETDATE()),
		   ('Si', 10, 1, GETDATE())
GO

INSERT INTO iCloud (planT, almacenamiento, precio, idUsuarioCrea, fechaCrea)
    VALUES ('Plan 1', 5, 0.00, 1, GETDATE()),
		   ('Plan 2', 50, 17.00, 1, GETDATE()),
		   ('Plan 3', 200, 49.00, 1, GETDATE()),
		   ('Plan 4', 2000, 179.00, 1, GETDATE())
GO

INSERT INTO OrdenCancelada (fechaCancelada, idOrden, idUsuarioCrea, fechaCrea)
    VALUES (GETDATE(), 1, 1, GETDATE()),
		   (GETDATE(), 2, 1, GETDATE()),
		   (GETDATE(), 3, 1, GETDATE()),
		   (GETDATE(), 4, 1, GETDATE()),
		   (GETDATE(), 5, 1, GETDATE())
GO

INSERT INTO OrdenDetalle (numProducto, precioTotal, idOrden, idUsuarioCrea, fechaCrea)
    VALUES (2, 48547.00, 1, 1, GETDATE()),
		   (1, 12504.00, 2, 1, GETDATE()),
		   (5, 45788.00, 3, 1, GETDATE()),
		   (3, 93247.00, 4, 1, GETDATE()),
		   (8, 125689.00, 5, 1, GETDATE()),
		   (2, 12587.00, 6, 1, GETDATE()),
		   (1, 126971.00, 7, 1, GETDATE()),
		   (2, 1248792.00, 8, 1, GETDATE()),
		   (7, 457807.00, 9, 1, GETDATE()),
		   (2, 498235.00, 10, 1, GETDATE())
GO

INSERT INTO Proveedor (nombre, codigoPostal, calle, numero, ciudad, pais, cantidad, idUsuarioCrea, fechaCrea)
    VALUES ('Apple Antara', ' 11520', ' Av. Ejercito Nacional', ' 843-B', ' Ciudad de México (CDMX)', ' Mexico', 462, 1, GETDATE()),
		   ('Apple Vía Santa Fe', ' 05109', ' Avenida Vasco de Quiroga', ' 3800', ' Ciudad de México (CDMX)', ' Mexico', 164, 1, GETDATE()),
		   ('Apple Country Club Plaza', ' 64112', ' Nichols Road', ' 227 ', ' Kansas City, MO', ' USA', 154, 1, GETDATE()),
		   ('Apple The Promenade at Chenal', ' 72223', ' Chenal Parkway', ' 17711', ' Little Rock, AR', ' USA', 614, 1, GETDATE()),
		   ('Apple Knox Street', ' 75205', ' Knox Street', ' 3101', ' Dallas, TX ', ' USA', 51, 1, GETDATE()),
		   ('Apple Century City', ' 90067', ' Santa Monica Boulevard', ' 10250', ' Los Angeles, CA', ' USA', 319, 1, GETDATE()),
		   ('Apple Lincoln Park', ' 60642', ' W. North Avenue', ' 801', ' Chicago, IL', ' USA', 318, 1, GETDATE()),
		   ('Apple Lenox Square', ' 30326', ' Peachtree Road NE', ' 3393', ' Atlanta, GA', ' USA', 158, 1, GETDATE()),
		   ('Apple Royal Hawaiian', ' 96815', ' Kalakaua Avenue', ' 2301', ' Honolulu, HI', ' USA', 123, 1, GETDATE()),
		   ('Apple Millenia', ' 32839', ' Conroy Road', ' 4200',  ' Orlando, FL', ' USA', 92, 1, GETDATE())
GO

INSERT INTO Publicidad (tipo, idProducto, idUsuarioCrea, fechaCrea)
    VALUES ('Comercial', 1, 1, GETDATE()),
		   ('Comercial', 2, 1, GETDATE()),
		   ('Comercial', 3, 1, GETDATE()),
		   ('Comercial', 4, 1, GETDATE()),
		   ('Imagen', 5, 1, GETDATE()),
		   ('Comercial', 6, 1, GETDATE()),
		   ('Imagen', 7, 1, GETDATE()),
		   ('Imagen', 8, 1, GETDATE()),
		   ('Imagen', 9, 1, GETDATE()),
		   ('Imagen', 10, 1, GETDATE())
GO

INSERT INTO Puesto (nombre, salario, idUsuarioCrea, fechaCrea)
    VALUES ('Cajero', 500.00 , 1, GETDATE()),
		   ('Gerente', 5500.00 , 1, GETDATE()),
		   ('Administrativo de información de clientes', 1200.00 ,1, GETDATE()),
		   ('Asistente de ventas', 1200.00 , 1, GETDATE()),
		   ('Empleado de promociones', 500.00 , 1, GETDATE()),
		   ('Reponedor de estanterías', 700.00 , 1, GETDATE()),
		   ('Gerente Financiero', 3650.00 , 1, GETDATE()),
		   ('Gerente de Recursos Humanos', 2500.00 , 1, GETDATE()),
		   ('Comunicaciones', 1200.00 , 1, GETDATE()),
		   ('Logistica', 2400.00 , 1, GETDATE())
GO

INSERT INTO Reembolso (cantidad, tipo, idFactura, idUsuarioCrea, fechaCrea)
    VALUES (48547.00, ' Transferencia', 1, 1, GETDATE()),
		   (12504.00, ' Transferencia', 2, 1, GETDATE()),
		   (45788.00, ' Transferencia', 3, 1, GETDATE()),
		   (93247.00, ' En efectivo', 4, 1, GETDATE()),
		   (125689.00, ' En efectivo', 5, 1, GETDATE())
GO

INSERT INTO Servicio (descripcion, idAppleArcade, idAppleBooks, idAppleFitnessPlus, idAppleMusic, idApplePodcast, idAppleTVPlus, idiCloud, idUsuarioCrea, fechaCrea)
    VALUES ('Servicio de pago', 1, null, 1, 1, null, 1, 1, 1, GETDATE()),
		   ('Servicio Gratis', null, 1, null, 1, 1, null, 1, 1, GETDATE())
GO

INSERT INTO Sucursal (codigoPostal, calle, numero, colonia, ciudad, idUsuarioCrea, fechaCrea)
    VALUES ('11520', ' Av. Ejercito Nacional', ' 843-B', ' Centro Comercial Antara Fashion Hall', ' Ciudad de México (CDMX)', 1, GETDATE()),
		   ('05109', ' Avenida Vasco de Quiroga', ' 3800', ' Lomas de Santa Fe, Antigua Mina de Totolapa', ' Ciudad de México (CDMX)', 1, GETDATE()),
		   ('64112', ' Nichols Road', ' 227 ', ' ', ' Kansas City, MO', 1, GETDATE()),
		   ('72223', ' Chenal Parkway', ' 17711', ' ', ' Little Rock, AR', 1, GETDATE()),
		   ('75205', ' Knox Street', ' 3101', ' ', ' Dallas, TX ', 1, GETDATE()),
		   ('90067', ' Santa Monica Boulevard', ' 10250', ' ', ' Los Angeles, CA', 1, GETDATE()),
		   ('60642', ' W. North Avenue', ' 801', ' ', ' Chicago, IL', 1, GETDATE()),
		   ('30326', ' Peachtree Road NE', ' 3393', ' ', ' Atlanta, GA', 1, GETDATE()),
		   ('96815', ' Kalakaua Avenue', ' 2301', ' ', ' Honolulu, HI', 1, GETDATE()),
		   ('32839', ' Conroy Road', ' 4200', ' ', ' Orlando, FL', 1, GETDATE())
GO

INSERT INTO Trabajador (apellidoPaterno, apellidoMaterno, nombre, curp, codigoPostal, calle, numero, colonia, idContrato, idPuesto, idUsuarioCrea, fechaCrea)
    VALUES ('Acosta', ' Torres', ' Victoria', ' ACTV140201ABCA3', ' 68370', ' Agustin Lara', ' 69', 'Ex-Normal Tuxtepec', 1, 1, 1, GETDATE()),
		   ('Enriquez', ' Perez', ' Jose', ' ENPJ140201ABCA5', ' 68300', ' Rio Nazas', ' 241', ' Centro Tuxtepec', 1, 2, 1, GETDATE()),
		   ('Cuevas', ' Mora', ' Mateo', ' CUMM0201ABCA6', ' 68360', ' 5 de Mayo', ' 779', ' Centro', 1, 3, 1, GETDATE()),
		   ('Jimenez', ' Gomez', ' Ivonne', ' JIGI140201ABCA4', ' 68380', ' Av. Independencia', ' 1024', ' Lomas del Pedregal', 1, 4, 1, GETDATE()),
		   ('Fuentes', ' Juares', ' Hector', ' FUJH140201ABCA2', ' 68335', ' Matamoros', ' 1060', ' La Piragua', 1, 5, 1, GETDATE()),
		   ('Aguilar', ' Soto', ' Maria del Refugio', ' AGSM140201ABCA1', ' 68310', ' Veracruz', ' 2020', ' Aguilar', 1, 6, 1, GETDATE()),
		   ('Ortiz', ' Gonzalez', ' Oscar', ' ORGO140201ABCA5', ' 68320', ' Blvr. Benito Juarez', ' 301',' Progreso', 1, 7, 1, GETDATE()),
		   ('Dominguez', ' Allende', ' Rosa', ' DOAR140201ABCA8', ' 68340', ' Hermenegildo Galeana', ' 859', ' Borja', 1, 8, 1, GETDATE()),
		   ('Hernandez', ' Solis', ' Sergio', ' HESS140201ABCA7', ' 68350', ' Blvr. Adolfo Lopez Mateo', ' 1466', ' Hipodromo', 1, 9, 1, GETDATE()),
		   ('Fernandez', ' Lugo', ' Isaias', ' FELI40201ABCA9', ' 68301', ' 20 de Noviembre', ' 1652',' Guadalupe', 1, 10, 1, GETDATE())
GO

INSERT INTO CapacitaciónTrabajador (idCapacitación, idTrabajador, idUsuarioCrea, fechaCrea)
    VALUES (1, 2, 1, GETDATE()),
		   (4, 3, 1, GETDATE()),
		   (5, 6, 1, GETDATE()),
		   (8, 7, 1, GETDATE()),
		   (9, 10, 1, GETDATE()),
		   (2, 1, 1, GETDATE()),
		   (3, 4, 1, GETDATE()),
		   (6, 5, 1, GETDATE()),
		   (7, 8, 1, GETDATE()),
		   (10, 9, 1, GETDATE())
GO

INSERT INTO OrdenDetalleDescuento (idOrdenDetalle, idDescuento, idUsuarioCrea, fechaCrea)
    VALUES (1, 10, 1, GETDATE()),
		   (2, 9, 1, GETDATE()),
		   (3, 8, 1, GETDATE()),
		   (4, 7, 1, GETDATE()),
		   (5, 6, 1, GETDATE()),
		   (6, 5, 1, GETDATE()),
		   (7, 4, 1, GETDATE()),
		   (8, 3, 1, GETDATE()),
		   (9, 2, 1, GETDATE()),
		   (10, 1, 1, GETDATE())
GO

INSERT INTO OrdenDetalleProducto (idOrdenDetalle, idProducto, idUsuarioCrea, fechaCrea)
    VALUES (10, 1, 1, GETDATE()),
		   (9, 2, 1, GETDATE()),
		   (8, 3, 1, GETDATE()),
		   (7, 4, 1, GETDATE()),
		   (6, 5, 1, GETDATE()),
		   (5, 6, 1, GETDATE()),
		   (4, 7, 1, GETDATE()),
		   (3, 8, 1, GETDATE()),
		   (2, 9, 1, GETDATE()),
		   (1, 10, 1, GETDATE())
GO

INSERT INTO ProductoDepartamento (idProducto, idDepartamento, idUsuarioCrea, fechaCrea)
    VALUES (1, 3, 1, GETDATE()),
		   (2, 4, 1, GETDATE()),
		   (5, 7, 1, GETDATE()),
		   (6, 8, 1, GETDATE()),
		   (9, 1, 1, GETDATE()),
		   (10, 2, 1, GETDATE()),
		   (3, 5, 1, GETDATE()),
		   (4, 6, 1, GETDATE()),
		   (7, 9, 1, GETDATE()),
		   (8, 10, 1, GETDATE())
GO

INSERT INTO ProductoServicio (idProducto, idServicio, idUsuarioCrea, fechaCrea)
    VALUES (1, 1, 1, GETDATE()),
		   (4, 2, 1, GETDATE()),
		   (2, 1, 1, GETDATE()),
		   (8, 2, 1, GETDATE()),
		   (6, 1, 1, GETDATE()),
		   (9, 2, 1, GETDATE()),
		   (3, 1, 1, GETDATE()),
		   (7, 2, 1, GETDATE()),
		   (5, 1, 1, GETDATE()),
		   (10, 2, 1, GETDATE())
GO

INSERT INTO PublicidadProducto (idPublicidad, idProducto, idUsuarioCrea, fechaCrea)
    VALUES (1, 3, 1, GETDATE()),
		   (4, 2, 1, GETDATE()),
		   (7, 5, 1, GETDATE()),
		   (6, 8, 1, GETDATE()),
		   (9, 1, 1, GETDATE()),
		   (2, 10, 1, GETDATE()),
		   (3, 6, 1, GETDATE()),
		   (5, 4, 1, GETDATE()),
		   (8, 7, 1, GETDATE()),
		   (10, 9, 1, GETDATE())
GO

INSERT INTO SucursalProveedor (idSucursal, idProveedor, idUsuarioCrea, fechaCrea)
    VALUES (5, 7, 1, GETDATE()),
		   (6, 6, 1, GETDATE()),
		   (7, 5, 1, GETDATE()),
		   (8, 4, 1, GETDATE()),
		   (9, 3, 1, GETDATE()),
		   (10, 2, 1, GETDATE()),
		   (1, 1, 1, GETDATE()),
		   (2, 10, 1, GETDATE()),
		   (3, 9, 1, GETDATE()),
		   (4, 8, 1, GETDATE())   
GO

INSERT INTO SucursalDepartamento (idSucursal, idDepartamento, idUsuarioCrea, fechaCrea)
    VALUES (1, 2, 1, GETDATE()),
		   (3, 4, 1, GETDATE()),
		   (5, 6, 1, GETDATE()),
		   (7, 8, 1, GETDATE()),
		   (9, 10, 1, GETDATE()),
		   (2, 1, 1, GETDATE()),
		   (4, 3, 1, GETDATE()),
		   (6, 5, 1, GETDATE()),
		   (8, 7, 1, GETDATE()),
		   (10, 9, 1, GETDATE())
GO

INSERT INTO SucursalTrabajador (idSucursal, idTrabajador, idUsuarioCrea, fechaCrea)
    VALUES (6, 4, 1, GETDATE()),
		   (3, 7, 1, GETDATE()),
		   (5, 5, 1, GETDATE()),
		   (8, 2, 1, GETDATE()),
		   (9, 1, 1, GETDATE()),
		   (10, 3, 1, GETDATE()),
		   (7, 6, 1, GETDATE()),
		   (1, 10, 1, GETDATE()),
		   (2, 8, 1, GETDATE()),
		   (4, 9, 1, GETDATE()) 
GO

INSERT INTO SucursalVenta (idSucursal, idVenta, idUsuarioCrea, fechaCrea)
    VALUES (1, 2, 1, GETDATE()),
		   (4, 3, 1, GETDATE()),
		   (5, 6, 1, GETDATE()),
		   (8, 7, 1, GETDATE()),
		   (9, 10, 1, GETDATE()),
		   (2, 1, 1, GETDATE()),
		   (3, 4, 1, GETDATE()),
		   (6, 5, 1, GETDATE()),
		   (10, 9, 1, GETDATE()),
		   (7, 8, 1, GETDATE())
GO

--Seleccionar la informacion de las tablas, para verificar que los datos en los reg sean correctos--

SELECT * FROM Usuario
SELECT * FROM AdaptadorCorriente
SELECT * FROM AirPods
SELECT * FROM AppleArcade
SELECT * FROM AppleBooks
SELECT * FROM AppleFitnessPlus
SELECT * FROM AppleMusic
SELECT * FROM ApplePencil
SELECT * FROM ApplePodcast
SELECT * FROM AppleTradeIn
SELECT * FROM AppleTV
SELECT * FROM AppleTVPlus
SELECT * FROM AppleWatch
SELECT * FROM BaseCarga
SELECT * FROM CableCargador
SELECT * FROM Capacitación
SELECT * FROM Cliente
SELECT * FROM Contrato
SELECT * FROM Correa
SELECT * FROM Departamento
SELECT * FROM Descuento
SELECT * FROM DescuentoEstudiante
SELECT * FROM Envío
SELECT * FROM Estado
SELECT * FROM Factura
SELECT * FROM GeniusBar
SELECT * FROM GiftCard
SELECT * FROM HomePod
SELECT * FROM iCloud
SELECT * FROM iPad
SELECT * FROM iPhone
SELECT * FROM iPod
SELECT * FROM Llavero
SELECT * FROM Mac
SELECT * FROM MagSafe
SELECT * FROM Orden
SELECT * FROM OrdenCancelada
SELECT * FROM OrdenDetalle
SELECT * FROM Pago
SELECT * FROM Producto
SELECT * FROM Proveedor
SELECT * FROM Publicidad
SELECT * FROM Puesto
SELECT * FROM Reembolso
SELECT * FROM Servicio
SELECT * FROM SiriRemote
SELECT * FROM Sucursal
SELECT * FROM SuperDrive
SELECT * FROM Tarjeta
SELECT * FROM Trabajador
SELECT * FROM Venta
SELECT * FROM CapacitaciónTrabajador
SELECT * FROM OrdenDetalleDescuento
SELECT * FROM OrdenDetalleProducto
SELECT * FROM ProductoDepartamento
SELECT * FROM ProductoServicio
SELECT * FROM PublicidadProducto
SELECT * FROM SucursalProveedor
SELECT * FROM SucursalDepartamento
SELECT * FROM SucursalTrabajador
SELECT * FROM SucursalVenta
GO

-----------------------------VISTAS-----------------------------

CREATE VIEW AppleTradeInClienteCantidad AS SELECT a.idCliente, count (c.idCliente) as cantidad
FROM AppleTradeIn a INNER JOIN Cliente c ON a.idCliente = c.idCliente WHERE
c.idCliente >= 1 GROUP BY a.idCliente
GO

CREATE VIEW AppleTradeInClienteNombre AS SELECT a.dispositivo, c.nombre, c.ApellidoPaterno
FROM AppleTradeIn a INNER JOIN Cliente c ON a.idCliente = c.idCliente WHERE
c.idCliente >= 1 GROUP BY a.dispositivo, c.nombre, c.ApellidoPaterno
GO

CREATE VIEW DescuentoDescuentoEstudianteCantidad AS SELECT d.idDescuentoEstudiante, count (de.idDescuentoEstudiante) as cantidad
FROM Descuento d INNER JOIN DescuentoEstudiante de ON de.idDescuentoEstudiante = d.idDescuentoEstudiante WHERE
de.idDescuentoEstudiante >= 1 GROUP BY d.idDescuentoEstudiante
GO

CREATE VIEW DescuentoDescuentoEstudianteIds AS SELECT d.idDescuento, d.detalle, d.precioRebajado, de.idiPad, de.idMac
FROM Descuento d INNER JOIN DescuentoEstudiante de ON de.idDescuentoEstudiante = d.idDescuentoEstudiante WHERE
de.idDescuentoEstudiante >= 1 GROUP BY d.idDescuento, d.detalle, d.precioRebajado, de.idiPad, de.idMac
GO

CREATE VIEW DescuentoEstudianteiPadCantidad AS SELECT de.idiPad, count (pa.idiPad) as cantidad
FROM DescuentoEstudiante de INNER JOIN iPad pa ON pa.idiPad = de.idiPad WHERE
pa.idiPad >= 1 GROUP BY de.idiPad
GO

CREATE VIEW DescuentoEstudianteiPadInfo AS SELECT de.idDescuentoEstudiante, de.precioRebajado, pa.modelo, pa.pulgadas, pa.color, pa.almacenamiento, pa.conectividad, pa.grabado, pa.appleCare, pa.precio
FROM DescuentoEstudiante de INNER JOIN iPad pa ON pa.idiPad = de.idiPad WHERE
pa.idiPad >= 1 GROUP BY de.idDescuentoEstudiante, de.precioRebajado, pa.modelo, pa.pulgadas, pa.color, pa.almacenamiento, pa.conectividad, pa.grabado, pa.appleCare, pa.precio
GO

CREATE VIEW DescuentoEstudianteMacCantidad AS SELECT de.idMac, count (m.idMac) as cantidad
FROM DescuentoEstudiante de INNER JOIN Mac m ON m.idMac = de.idMac WHERE
m.idMac >= 1 GROUP BY de.idMac
GO

CREATE VIEW DescuentoEstudianteMacInfo AS SELECT de.idDescuentoEstudiante, de.precioRebajado, m.modelo, m.color, m.appleCare, m.precio
FROM DescuentoEstudiante de INNER JOIN Mac m ON m.idMac = de.idMac WHERE
m.idMac >= 1 GROUP BY de.idDescuentoEstudiante, de.precioRebajado, m.modelo, m.color, m.appleCare, m.precio
GO

CREATE VIEW EnvioVentaCantidad AS SELECT e.idVenta, count (v.idVenta) as cantidad
FROM Envío e INNER JOIN Venta v ON v.idVenta = e.idVenta WHERE
v.idVenta >= 1 GROUP BY e.idVenta
GO

CREATE VIEW EnvioVentaDireccionT AS SELECT e.idEnvío, e.codigoPostal, e.calle, e.numero, e.colonia, v.idVenta, v.tipo
FROM Envío e INNER JOIN Venta v ON v.idVenta = e.idVenta WHERE
v.idVenta >= 1 GROUP BY e.idEnvío, e.codigoPostal, e.calle, e.numero, e.colonia, v.idVenta, v.tipo
GO

CREATE VIEW FacturaPagoCantidad AS SELECT f.idPago, count (p.idPago) as cantidad
FROM Factura f INNER JOIN Pago p ON f.idPago = p.idPago WHERE
p.idPago >= 1 GROUP BY f.idPago
GO

CREATE VIEW FacturaPagoInfo AS SELECT f.numero, f.fecha, f.precioTotal, p.tipo, p.aprobado
FROM Factura f INNER JOIN Pago p ON f.idPago = p.idPago WHERE
p.idPago >= 1 GROUP BY f.numero, f.fecha, f.precioTotal, p.tipo, p.aprobado
GO

CREATE VIEW FacturaVentaInfo AS SELECT f.numero, f.fecha, f.precioTotal, v.tipo
FROM Factura f INNER JOIN Venta v ON f.idPago = v.idVenta WHERE
v.idVenta >= 1 GROUP BY f.numero, f.fecha, f.precioTotal, v.tipo
GO

CREATE VIEW OrdenClienteCantidad AS SELECT o.idCliente, count (c.idCliente) as cantidad
FROM Orden o INNER JOIN Cliente c ON o.idCliente = c.idCliente WHERE
c.idCliente >= 1 GROUP BY o.idCliente
GO

CREATE VIEW OrdenClienteInfoTotal AS SELECT o.idOrden, o.numero, o.fecha, c.nombre, c.apellidoPaterno, c.correo, c.telefono
FROM Orden o INNER JOIN Cliente c ON o.idCliente = c.idCliente WHERE
c.idCliente >= 1 GROUP BY o.idOrden, o.numero, o.fecha, c.nombre, c.apellidoPaterno, c.correo, c.telefono
GO


