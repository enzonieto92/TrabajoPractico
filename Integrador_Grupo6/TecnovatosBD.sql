CREATE DATABASE [TecnovatosBD]
go

USE [TecnovatosBD]
go

---TABLAS

CREATE TABLE Marcas
(
CodMarca_Ma char(6) not null,
Descripcion_Ma varchar(30) not null,
CONSTRAINT PK_MARCAS PRIMARY KEY (CodMarca_Ma),
CONSTRAINT UK_MARCAS UNIQUE (Descripcion_Ma)
)

CREATE TABLE Categoria
(
CodCategoria_Cat char(6) not null,
Descripcion_Cat varchar(30) not null,
CONSTRAINT PK_CATEGORIA PRIMARY KEY (CodCategoria_Cat),
CONSTRAINT UK_CATEGORIA UNIQUE (Descripcion_Cat)
)

CREATE TABLE Colores
(
CodColor_Co char(6) not null,
Descripcion_Co varchar(30) not null,
CONSTRAINT PK_COLORES PRIMARY KEY (CodColor_Co),
CONSTRAINT UK_COLORES UNIQUE (Descripcion_Co)
)

CREATE TABLE Caracteristicas
(
CodCaracteristica_Car char(6) not null,
Nombre_Car varchar(30) not null,
CONSTRAINT PK_CARACTERISTICAS PRIMARY KEY (CodCaracteristica_Car),
CONSTRAINT UK_CARACTERISTICAS UNIQUE (Nombre_Car)
)

CREATE TABLE Productos
(
CodProducto_Pr char(6) not null,
CodMarcas_Pr char(6) not null,
CodCategoria_Pr char(6) not null,
Nombre_Pr varchar(50) not null,
Descripcion_Pr varchar(100) not null,
PrecioUnitario decimal(10,2) not null default 0.00,
URLimagen_Pr varchar(500) not null default 0,
Estado_Pr bit not null default 1,
CONSTRAINT PK_PRODUCTOS PRIMARY KEY (CodProducto_Pr),
CONSTRAINT FK_PRODUCTOS_MARCAS FOREIGN KEY (CodMarcas_Pr) REFERENCES Marcas (CodMarca_Ma),
CONSTRAINT FK_PRODUCTOS_CATEGORIAS FOREIGN KEY (CodCategoria_Pr) REFERENCES Categoria (CodCategoria_Cat)
)

CREATE TABLE CaracteristicasXproductosXcolores
(
CodProducto_CXPXC char(6) not null,
CodCaracteristicas_CXPXC char (6) not null,
CodColor_CXPXC char(6) not null,
Stock_CXPXC int not null default 0,
CONSTRAINT PK_CARACTERISTICASXPRODUCTOSXCOLORES PRIMARY KEY (CodProducto_CXPXC, CodCaracteristicas_CXPXC, CodColor_CXPXC),
CONSTRAINT FK_CARACTERISTICASXPRODUCTOSXCOLORES_PRODUCTOS FOREIGN KEY (CodProducto_CXPXC) REFERENCES Productos (CodProducto_Pr),
CONSTRAINT FK_CARACTERISTICASXPRODUCTOSXCOLORES_CARACTERISTICAS FOREIGN KEY (CodCaracteristicas_CXPXC) REFERENCES Caracteristicas (CodCaracteristica_Car),
CONSTRAINT FK_CARACTERISTICASXPRODUCTOSXCOLORES_COLORES FOREIGN KEY (CodColor_CXPXC) REFERENCES Colores (CodColor_Co)
)

CREATE TABLE Usuario
(
DNI_Us char(10) not null,
Email_Us varchar(60) not null,
Nombre_Us varchar(30) not null,
Apellido_Us varchar(30) not null,
FechaNacimiento_Us date not null,
Telefono_Us char(10) not null,
Usuario_Us varchar(30) not null,
Contraseña_Us varchar(30) not null,
Tipo_Us int not null default 1,
Estado_Us bit not null default 1,
CONSTRAINT PK_USUARIO PRIMARY KEY (DNI_Us),
CONSTRAINT UK_USUARIO UNIQUE (Usuario_Us, Contraseña_Us)
)

CREATE TABLE MetodosEnvio
(
CodMetodoEnvio_Me char(6) not null,
Descripcion_Me varchar(30) not null,
CONSTRAINT PK_METODOSENVIO PRIMARY KEY (CodmetodoEnvio_Me)
)

CREATE TABLE MetodosPago
(
CodMetodoPago_Mp char(6) not null,
Descripcion_Mp varchar(30) not null,
CONSTRAINT PK_METODOSPAGO PRIMARY KEY (CodMetodoPago_Mp)
)

CREATE TABLE Facturas
(
NroFactura_Fa int not null identity (1,1),
DNI_Fa char(10) not null,
CodMetodoEnvio_Fa char(6) not null,
CodMetodoPago_Fa char(6) not null,
Fecha_Fa date not null,
DireccionEntrega_Fa varchar(60) not null,
Total_Fa decimal (8,2) not null default 0,
CONSTRAINT PK_FACTURAS PRIMARY KEY (NroFactura_Fa),
CONSTRAINT FK_FACTURAS_USUARIO FOREIGN KEY (DNI_Fa) REFERENCES Usuario (DNI_Us),
CONSTRAINT FK_FACTURAS_METODOSENVIO FOREIGN KEY (CodMetodoEnvio_Fa) REFERENCES MetodosEnvio (CodMetodoEnvio_Me),
CONSTRAINT FK_FACTURAS_METODOSPAGO FOREIGN KEY (CodMetodoPago_Fa) REFERENCES MetodosPago (CodMetodoPago_Mp)
)

CREATE TABLE DetalleFacturas
(
NroFactura_Df int not null,
CodProducto_Df char(6) not null,
CodCaracteristicas_Df char(6) not null,
CodColor_Df char(6) not null,
PrecioUnitario_Df decimal (8,2) not null,
Cantidad_Df int not null,
CONSTRAINT PK_DETALLEFACTURAS PRIMARY KEY (NroFactura_Df, CodProducto_Df, CodCaracteristicas_Df, CodColor_Df),
CONSTRAINT FK_DETALLEFACTURAS_FACTURAS FOREIGN KEY (NroFactura_Df) REFERENCES Facturas (NroFactura_Fa),
CONSTRAINT FK_DETALLEFACTURAS_CARACTERISTICASXPRODUCTOSXCOLORES FOREIGN KEY (CodProducto_Df, CodCaracteristicas_Df, CodColor_Df) REFERENCES  CaracteristicasXproductosXcolores (CodProducto_CXPXC, CodCaracteristicas_CXPXC, CodColor_CXPXC)
)

---Datos

insert into Colores(CodColor_Co,Descripcion_Co)
select '1','Blanco' union
select '2','Negro' union
select '3','Dorado' union
select '4','Azul'
go

--//////////////////////////////////////////////////////////

insert into Caracteristicas(CodCaracteristica_Car,Nombre_Car)
select '1','2GB' union
select '2','4GB' union
select '3','6GB' union
select '4','8GB' union
select '5','12GB' union
select '6','32GB'
go

--//////////////////////////////////////////////////////////

insert into Marcas(CodMarca_Ma,Descripcion_Ma)
select '1','Sony' union
select '2','Samsung' union
select '3','Motorola' union
select '4','Nvidia' union
select '5','Asus' union
select '6','MSI' union
select '7','Asrock' union
select '8','Xbox' union
select '9','CoolerMaster' union
select '10','Kolink' union
select '11','GameMax' union
select '12', 'Corsair' union
select '13','Lenovo' 
go

--//////////////////////////////////////////////////////////

insert into Categoria(CodCategoria_Cat,Descripcion_Cat)
select '1','Celulares' union
select '2','Tarjeta grafica' union
select '3','Mothers' union
select '4','Consolas de videojuego' union
select '5','Coolers' union
select '6','Gabinetes' union
select '7','Memorias RAM' union
select '8','Notebooks' 
go

--//////////////////////////////////////////////////////////

insert into Productos(CodProducto_Pr, CodMarcas_Pr,CodCategoria_Pr,Nombre_Pr,Descripcion_Pr,PrecioUnitario,URLimagen_Pr,Estado_Pr)
select 1, 2, 1, 'Samsung Galaxy S23 Ultra','Amplia pantalla AMOLED vibrante en el S23 Ultra', 380000.00,'~/Imagenes/Productos/1.jpg', 1 union
select 2, 2, 1, 'Samsung Galaxy A72', 'Cámara de alta resolución en el A72', 145999.99, '~/Imagenes/Productos/2.jpg', 1 union
select 3, 3, 1, 'Motorola Edge 40 Pro',	'Potente rendimiento en el Edge 40 Pro', 219999.99,	'~/Imagenes/Productos/3.jpg', 1 union
select 4, 3, 1, 'Motorola Edge 30 Pro',	'Rendimiento rapidisimo en el Edge 30 Pro', 155000.00, '~/Imagenes/Productos/4.jpg',	1 union
select 5, 4, 2, 'NVIDIA RTX 3050', 'Potente tarjeta gráfica Nvidia 3050', 145000.00,'~/Imagenes/Productos/5.jpg', 1 union
select 6, 4, 2, 'NVIDIA RTX 2070', 'Potente gráfica', 120000.00, '~/Imagenes/Productos/6.jpg', 1 union
select 7, 5, 3,  'Asus Prime B550-K', 'Mothers', 85000.00, '~/Imagenes/Productos/7.jpg', 1 union
select 8, 1, 4, 'PlayStation 5', 'PlayStation 5 Sony 825GB', 350000.00, '~/Imagenes/Productos/9.jpg', 1 union
select 9, 8, 4, 'Xbox Series X', 'Xbox Series X 1TB', 300000.00, '~/Imagenes/Productos/10.jpg', 1 union
select 10, 6, 8, 'Notebook MSI', 'Potente',	255000.00, '~/Imagenes/Productos/20.jpg', 1
go


--//////////////////////////////////////////////////////////

insert into CaracteristicasXproductosXcolores(CodProducto_CXPXC,CodCaracteristicas_CXPXC, CodColor_CXPXC,Stock_CXPXC)
select '1','5','2','124' union
select '2','4','3','78' union
select '3','5','1','55' union
select '4','3','4','38' union
select '5','5','2','46'
go

--/////////////////////////////////////////////////////////

insert into Usuario (DNI_Us, Email_Us, Nombre_Us, Apellido_Us, FechaNacimiento_Us, Telefono_Us, Usuario_Us, Contraseña_Us, Tipo_Us, Estado_Us)
select '1111','admin@admin.com','admin','administrador','2023-06-15','11111111','admin','admin','2','1' union
select '2345', 'nahuel@gmail.com','nahuel','sandoval','2001-11-13','22213456','nahuelcapo','133011','1','1' union
select '3456','enzo@gmail.com','Enzo','Nieto','1999-10-12','35576234','enzoca23','rana23','1','1' union
select '4567', 'axel@gmail.com','axel','Mazo','2000-04-16','53132476','axelroca456','sapo3','1','1' union
select '5678','matias@gmail.com','matias','Rocha','1998-08-21','46473869','matiasmas43','mat2365','1','1'
go

--//////////////////////////////////////////////////////////

insert into MetodosEnvio(CodMetodoEnvio_Me,Descripcion_Me)
select '1','Retiro en Sucursal' union
select '2','A domiculio'
go

--//////////////////////////////////////////////////////////
insert into MetodosPago (CodMetodoPago_Mp,Descripcion_Mp)
select '1','Efectivo' union
select '2','Tarjeta'
go

--//////////////////////////////////////////////////////////
set identity_insert Facturas on

insert into Facturas(NroFactura_Fa,DNI_Fa,CodMetodoEnvio_Fa,CodMetodoPago_Fa,Fecha_Fa,DireccionEntrega_Fa,Total_Fa)
select 1,'2345','1','1','2023-06-18','Retiro en Sucursal','380000.00' union
select 2,'3456','2','1','2023-06-19','Chile 1844','145999.99' union
select 3,'4567','1','2','2023-06-20','Retiro en Sucursal','219999.99' union
select 4,'5678','2','2','2023-06-21','Santiago del estero 2394','535000.00'
go

--//////////////////////////////////////////////////////////

insert into DetalleFacturas(NroFactura_Df,CodProducto_Df,CodCaracteristicas_Df,CodColor_Df,PrecioUnitario_Df,Cantidad_Df)
select 1,'1','5','2','380000.00','1' union
select 2,'2','4','3','145999.99','1' union
select 3,'3','5','1','219999.99','1' union
select 4,'4','3','4','155000.00','1' union
select 4,'1','5','2','380000.00','1'
GO

--Procedimientos almacenados

CREATE PROCEDURE SPEliminarUsuario
(
@DNI CHAR(10)
)
AS
UPDATE Usuarios SET Estado_Us=0
WHERE DNI_Us=@DNI
GO



CREATE PROCEDURE SPActualizarUsuario
(
@DNI CHAR(10),
@Email VARCHAR(60),
@Nombre VARCHAR(30),
@Apellido VARCHAR(30),
@FechaNac DATE,
@Telefono CHAR(10),
@Usuario VARCHAR(30),
@Contraseña VARCHAR(30),
@Tipo  INT,
@Estado BIT
)
AS
UPDATE Usuario SET
DNI_Us=@DNI,
Email_Us=@Email,
Nombre_Us=@Nombre,
Apellido_Us=@Apellido,
FechaNacimiento_Us=@FechaNac,
Telefono_Us=@Telefono,
Usuario_Us=@Usuario,
Contraseña_Us=@Contraseña,
Tipo_Us=@Tipo,
Estado_Us=@Estado
WHERE DNI_Us=@DNI
GO

CREATE PROCEDURE SPInsertarUsuario
(
@DNI CHAR(10),
@Usuario VARCHAR(30),
@Contraseña VARCHAR(30),
@Email VARCHAR(60),
@Telefono CHAR(10),
@Nombre VARCHAR(30),
@Apellido VARCHAR(30),
@FechaNac DATE
)
AS
INSERT INTO Usuario (DNI_Us,Usuario_Us,Contraseña_Us,Email_Us,Telefono_Us,Nombre_Us,Apellido_Us,FechaNacimiento_Us)
VALUES (@DNI,@Usuario,@Contraseña,@Email,@Telefono,@Nombre,@Apellido,@FechaNac)
GO

CREATE PROCEDURE SPInsertarProducto
(
@CodProducto CHAR(6),
@CodMarca CHAR(6),
@CodCategoria CHAR(6),
@Descripcion VARCHAR(100),
@Nombre VARCHAR(20),
@UrlImagen VARCHAR(60),
@PrecioUnitario DECIMAL(10,2)
)
AS
INSERT INTO Productos (CodProducto_Pr,CodMarcas_Pr,CodCategoria_Pr,Descripcion_Pr,Nombre_Pr,UrlImagen_Pr,PrecioUnitario)
VALUES (@CodProducto,@CodMarca,@CodCategoria,@Descripcion,@Nombre,@UrlImagen,@PrecioUnitario)
GO

CREATE PROCEDURE SPEliminarProducto
(
@CodProducto CHAR(6)
)
AS
UPDATE Productos SET Estado_Pr=0
WHERE CodProducto_Pr=@CodProducto
GO

CREATE PROCEDURE SPActualizarProducto
(
@CodProducto CHAR(6),
@CodMarca CHAR(6),
@CodCategoria CHAR(6),
@Descripcion VARCHAR(100),
@Nombre VARCHAR(20),
@PrecioUnitario DECIMAL(10,2),
@Estado BIT
)
AS
UPDATE Productos SET
CodMarcas_Pr=@CodMarca,
CodCategoria_Pr=@CodCategoria,
Descripcion_Pr=@Descripcion,
Nombre_Pr=@Nombre,
PrecioUnitario=@PrecioUnitario,
Estado_Pr=@Estado
WHERE CodProducto_Pr=@CodProducto
GO

/*delete from Productos where CodProducto_Pr = '1'

exec [SPEliminarProducto] @CodProducto = '6'¨*/