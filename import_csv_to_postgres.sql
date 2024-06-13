create schema db_comercial;

create or replace table db_comercial.info_ventas(
id_factura varchar(100) primary key not null 
, numero_factura_sri varchar(100)
, estado varchar(100)
, fecha_creacion TIMESTAMP
, cliente_id varchar(100)
);

COPY db_comercial.info_ventas(id_factura,numero_factura_sri,estado,fecha_creacion,cliente_id)
FROM '/path/to/info_ventas.csv'
DELIMITER ','
CSV HEADER;

create or replace table db_comercial.info_cliente(
id_cliente varchar(100)primary key not null
, identificacion_cliente varchar(100)
, nombre_cliente varchar(100)
, estado varchar(100)
, fecha_creacion TIMESTAMP
, pais varchar(100)
);

COPY db_comercial.info_clientes(id_cliente,identificacion_cliente,nombre_cliente,estado,fecha_creacion,pais)
FROM '/path/to/info_clientes.csv'
DELIMITER ','
CSV HEADER;

create or replace table db_comercial.admi_producto(
id_producto varchar(100)primary key not null
, nombre_producto varchar(100)
, categoria varchar(100)
, estado varchar(100)
, fecha_creacion TIMESTAMP
, valor_unitario decimal(18,0)
);

COPY db_comercial.admi_producto(id_facturaid_producto,nombre_producto,categoria,estado,fecha_creacion,valor_unitario)
FROM '/path/to/admi_producto.csv'
DELIMITER ','
CSV HEADER;

create or replace table db_comercial.info_venta_detalle(
id_venta_detalle varchar(100)primary key not null
, documento_id varchar(100)
, producto_id varchar(100)
, cantidad varchar(100)
, valor_total decimal(18,0)
);

COPY db_comercial.info_venta_detalle(id_venta_detalle,documento_id,producto_id,fcantidad,valor_total)
FROM '/path/to/info_venta_detalle.csv'
DELIMITER ','
CSV HEADER;