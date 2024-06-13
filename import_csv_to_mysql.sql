create schema db_comercial;

create or replace table db_comercial.info_ventas(
id_factura varchar(100) primary key not null 
, numero_factura_sri varchar(100)
, estado varchar(100)
, fecha_creacion TIMESTAMP
, cliente_id varchar(100)
);

LOAD DATA local INFILE 'C:\\path\\to\\info_ventas.csv'
INTO TABLE db_comercial.info_ventas
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 lines
(id_factura,numero_factura_sri,estado,fecha_creacion,@cliente_id)
set cliente_id=TRIM(@cliente_id)+0
;

create or replace table db_comercial.info_cliente(
id_cliente varchar(100)primary key not null
, identificacion_cliente varchar(100)
, nombre_cliente varchar(100)
, estado varchar(100)
, fecha_creacion TIMESTAMP
, pais varchar(100)
);

LOAD DATA local INFILE 'C:\\path\\to\\info_cliente.csv'
INTO TABLE db_comercial.info_cliente
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

create or replace table db_comercial.admi_producto(
id_producto varchar(100)primary key not null
, nombre_producto varchar(100)
, categoria varchar(100)
, estado varchar(100)
, fecha_creacion TIMESTAMP
, valor_unitario decimal(18,0)
);

LOAD DATA local INFILE 'C:\\path\\to\\admi_producto.csv'
INTO TABLE db_comercial.admi_producto
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

create or replace table db_comercial.info_venta_detalle(
id_venta_detalle varchar(100)primary key not null
, documento_id varchar(100)
, producto_id varchar(100)
, cantidad varchar(100)
, valor_total decimal(18,0)
);

LOAD DATA local INFILE 'C:\\path\\to\\info_venta_detalle.csv'
INTO TABLE db_comercial.info_venta_detalle
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;