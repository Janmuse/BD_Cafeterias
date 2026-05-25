create database cafeterias_tabasco_TEST;
use cafeterias_tabasco_TEST;

create table ciudad(
	id_ciudad int not null,
	nombre varchar(30) not null,
    
	primary key(id_ciudad)
);

create table sucursal(
	id_sucursal int not null,
	nombre varchar(100) not null,
	direccion varchar(100) not null,
	id_ciudad int not null,
    
	primary key(id_sucursal),
	foreign key(id_ciudad) references ciudad(id_ciudad)
);

create table rol_trabajador(
	id_rol int not null,
	rol varchar(30) not null,
    
	primary key(id_rol)
);

create table usuario(
	id_usuario int not null,
	id_rol int not null,
	username varchar(50) not null unique,
	password_hash varchar(255) not null,
	activo tinyint(1) default 1,
    
	primary key(id_usuario),
	foreign key(id_rol) references rol_trabajador(id_rol)
);

create table arrendatario(
	id_arrendatario int not null,
	nombre varchar(20) not null,
	apellido_pat varchar(20) not null,
	apellido_mat varchar(20),
	telefono varchar(20),
	id_usuario int not null,
	id_sucursal int not null,
    
	primary key(id_arrendatario),
	foreign key(id_sucursal) references sucursal(id_sucursal),
	foreign key(id_usuario) references usuario(id_usuario)
);

create table empleado(
	id_empleado int not null,
	nombre varchar(20) not null,
	apellido_pat varchar(20) not null,
	apellido_mat varchar(20),
	telefono varchar(20),
    
	id_usuario int not null,
	id_sucursal int not null,

	primary key(id_empleado),
	foreign key(id_sucursal) references sucursal(id_sucursal),
	foreign key(id_usuario) references usuario(id_usuario)
);

create table categoria(
	id_categoria int not null,
	nombre_categoria varchar(20) not null,
    
	primary key(id_categoria)
);

create table producto(
	id_producto int not null,
	id_categoria int not null,
	nombre_producto varchar(45) not null,
	unidad_medida varchar(45) not null,
	costo_producto decimal(10,2) not null,
	precio_venta decimal(10,2) not null,
    
	primary key(id_producto),
	foreign key(id_categoria) references categoria(id_categoria)
);

create table inventario(
	cantidad int not null default 0,
	id_producto int not null,
	id_sucursal int not null,
    
	foreign key(id_producto) references producto(id_producto),
	foreign key(id_sucursal) references sucursal(id_sucursal)
);

create table compra(
	id_compra int not null,
	fecha date not null,
	id_empleado int not null,
	id_sucursal int not null,
	total float default 0,
    
	primary key(id_compra),
	foreign key(id_empleado) references empleado(id_empleado),
	foreign key(id_sucursal) references sucursal(id_sucursal)
);

create table detalle_compra(
	cantidad int not null,
	id_producto int not null,
	id_compra int not null,
	precio_venta decimal(10,2) not null,
	subtotal decimal(10,2) not null,
    
	foreign key(id_compra) references compra(id_compra),
	foreign key(id_producto) references producto(id_producto)
);

create table venta(
	id_venta int not null,
	fecha date not null,
	id_empleado int not null,
	id_sucursal int not null,
	total float default 0,
    
	primary key(id_venta),
	foreign key(id_empleado) references empleado(id_empleado),
	foreign key(id_sucursal) references sucursal(id_sucursal)
);

create table detalle_venta(
	cantidad int not null,
	id_producto int not null,
	id_venta int not null,
	precio_venta decimal(10,2) not null,
	subtotal decimal(10,2) not null,
    
	foreign key(id_venta) references venta(id_venta),
	foreign key(id_producto) references producto(id_producto)
);