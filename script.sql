-- Creando base de datos, para control de ventas de una Ferretería
create database Ferreteria
-- Cambiando la base de datos, para apuntar a Ferretería
use Ferreteria

-- Creando tabla para control de los productos en existencia.
create table Producto(
	codigo int identity(1,1) primary key,
	marca varchar(50) not null,
	nombre varchar(50) not null,
	precio money not null
)

-- Creando tabla para administración de clientes.
create table Cliente(
	idCliente int identity(1,1) primary key,
	nombre varchar(50) not null,
	direccion varchar(100) not null,
	telefono varchar(10) not null
)

-- Creando tablas para el registro de empleados.
create table Empleado(
	idEmpleado int identity(1,1) primary key,
	nombre varchar(50) not null,
	telefono varchar(10) not null
)

-- Creando tabla para elaboración de factura de venta
-- esta tabla implementa una llave primaria compuesta.
create table Factura
(
	folio int identity(1,1) not null,
	codigo int not null foreign key references Producto(codigo),
	idCliente int not null foreign key references Cliente(idCliente),
	idEmpleado int not null foreign key references Empleado(idEmpleado),
	cantidad int not null,
	constraint PK_Factura primary key (folio, codigo, idCliente)
)

