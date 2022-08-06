CREATE TABLE Asiste 
    ( 
     Cliente_id_cliente VARCHAR (20) NOT NULL , 
     Evento_id_evento VARCHAR (20) NOT NULL 
    ) 
;

ALTER TABLE Asiste ADD CONSTRAINT Asiste_PK PRIMARY KEY 
    (
     Cliente_id_cliente, 
     Evento_id_evento
    )
;

CREATE TABLE Cargo 
    ( 
     id_cargo VARCHAR (20) NOT NULL , 
     nombre_cargo VARCHAR (20) NOT NULL , 
     descripcion_cargo VARCHAR (20) NOT NULL , 
     Contrato_id_contrato VARCHAR (20) NOT NULL 
    ) 
;
CREATE UNIQUE INDEX Cargo__IDX 
    ON Cargo 
    ( 
     Contrato_id_contrato ASC 
    ) 
;

ALTER TABLE Cargo ADD CONSTRAINT Cargo_PK PRIMARY KEY 
    (
     id_cargo
    )
;

CREATE TABLE Cliente 
    ( 
     id_cliente VARCHAR (20) NOT NULL , 
     nombre_cliente VARCHAR (20) NOT NULL , 
     telefono_cliente NUMERIC (31) NOT NULL , 
     direccion_cliente VARCHAR (20) NOT NULL , 
     email_cliente VARCHAR (20) NOT NULL , 
     tipo_documento_cliente VARCHAR (20) NOT NULL , 
     Stand_id_stand DOUBLE NOT NULL 
    ) 
;
CREATE UNIQUE INDEX Cliente__IDX 
    ON Cliente 
    ( 
     Stand_id_stand ASC 
    ) 
;

ALTER TABLE Cliente ADD CONSTRAINT Cliente_PK PRIMARY KEY 
    (
     id_cliente
    )
;

CREATE TABLE Contrato 
    ( 
     id_contrato VARCHAR (20) NOT NULL , 
     salario_contrato DOUBLE NOT NULL , 
     fecha_inicio_contrato DATE NOT NULL , 
     tipo_contrato VARCHAR (20) NOT NULL , 
     Empleado_id_empleado VARCHAR (20) NOT NULL , 
     Cargo_id_cargo VARCHAR (20) NOT NULL 
    ) 
;
CREATE UNIQUE INDEX Contrato__IDX 
    ON Contrato 
    ( 
     Cargo_id_cargo ASC 
    ) 
;
CREATE UNIQUE INDEX Contrato__IDXv1 
    ON Contrato 
    ( 
     Empleado_id_empleado ASC 
    ) 
;

ALTER TABLE Contrato ADD CONSTRAINT Contrato_PK PRIMARY KEY 
    (
     id_contrato
    )
;

CREATE TABLE Departamento 
    ( 
     id_departamento VARCHAR (20) NOT NULL , 
     nombre_departamento VARCHAR (20) NOT NULL , 
     descripcion_departamento VARCHAR (20) NOT NULL 
    ) 
;

ALTER TABLE Departamento ADD CONSTRAINT Departamento_PK PRIMARY KEY 
    (
     id_departamento
    )
;

CREATE TABLE Detalles 
    ( 
     id_renglon VARCHAR (20) NOT NULL , 
     cantidad_prodren INTEGER NOT NULL , 
     precio_ren DOUBLE NOT NULL , 
     Transaccion_id_transaccion VARCHAR (20) NOT NULL 
    ) 
;

ALTER TABLE Detalles ADD CONSTRAINT Detalles_PK PRIMARY KEY 
    (
     id_renglon
    )
;

CREATE TABLE Empleado 
    ( 
     id_empleado VARCHAR (20) NOT NULL , 
     nombre_empleado VARCHAR (20) NOT NULL , 
     tipo_documento_empleado VARCHAR (20) NOT NULL , 
     telefono_empleado INTEGER NOT NULL , 
     direccion_empleado VARCHAR (20) NOT NULL , 
     email_empleado VARCHAR (20) NOT NULL , 
     Departamento_id_departamento VARCHAR (20) NOT NULL , 
     Contrato_id_contrato VARCHAR (20) NOT NULL 
    ) 
;
CREATE UNIQUE INDEX Empleado__IDX 
    ON Empleado 
    ( 
     Contrato_id_contrato ASC 
    ) 
;

ALTER TABLE Empleado ADD CONSTRAINT Empleado_PK PRIMARY KEY 
    (
     id_empleado
    )
;

CREATE TABLE Equipo_Estetica 
    ( 
     id_producto VARCHAR (20) NOT NULL , 
     referencia_equipo VARCHAR (20) NOT NULL 
    ) 
;

ALTER TABLE Equipo_Estetica ADD CONSTRAINT Equipo_Estetica_PK PRIMARY KEY 
    (
     id_producto
    )
;

CREATE TABLE Evento 
    ( 
     id_evento VARCHAR (20) NOT NULL , 
     nombre_evento VARCHAR (20) NOT NULL , 
     direccion_evento VARCHAR (20) NOT NULL , 
     precio_entrada_evento DOUBLE NOT NULL , 
     tipo_evento VARCHAR (20) NOT NULL , 
     descripcion_evento VARCHAR (20) NOT NULL 
    ) 
;

ALTER TABLE Evento ADD CONSTRAINT Evento_PK PRIMARY KEY 
    (
     id_evento
    )
;

CREATE TABLE Mantiene 
    ( 
     Empleado_id_empleado VARCHAR (20) NOT NULL , 
     Equipo_Estetica_id_producto VARCHAR (20) NOT NULL 
    ) 
;

ALTER TABLE Mantiene ADD CONSTRAINT Mantiene_PK PRIMARY KEY 
    (
     Empleado_id_empleado, 
     Equipo_Estetica_id_producto
    )
;

CREATE TABLE Pieza_Publicitaria 
    ( 
     id_publicidad VARCHAR (20) NOT NULL , 
     link_publicidad VARCHAR (20) NOT NULL , 
     Evento_id_evento VARCHAR (20) NOT NULL 
    ) 
;

ALTER TABLE Pieza_Publicitaria ADD CONSTRAINT Pieza_Publicitaria_PK PRIMARY KEY 
    (
     id_publicidad
    )
;

CREATE TABLE Producto 
    ( 
     id_producto VARCHAR (20) NOT NULL , 
     nombre_producto VARCHAR (20) NOT NULL , 
     descripcion_producto VARCHAR (20) NOT NULL , 
     precio_compra_producto DOUBLE NOT NULL , 
     precio_venta_producto DOUBLE NOT NULL , 
     Detalles_id_renglon VARCHAR (20) NOT NULL 
    ) 
;

ALTER TABLE Producto ADD CONSTRAINT Producto_PK PRIMARY KEY 
    (
     id_producto
    )
;

CREATE TABLE Proveedor 
    ( 
     id_proveedor VARCHAR (20) NOT NULL , 
     nombre_proveedor VARCHAR (20) NOT NULL , 
     telefono_proveedor NUMERIC (31) NOT NULL , 
     direccion_proveedor VARCHAR (20) NOT NULL , 
     email_proveedor VARCHAR (20) NOT NULL , 
     tipo_documento_proveedor VARCHAR (20) NOT NULL 
    ) 
;

ALTER TABLE Proveedor ADD CONSTRAINT Proveedor_PK PRIMARY KEY 
    (
     id_proveedor
    )
;

CREATE TABLE Stand 
    ( 
     id_stand DOUBLE NOT NULL , 
     precio_stand NUMERIC (31) NOT NULL , 
     tamaño_stand VARCHAR (20) NOT NULL , 
     ubicacion_stand VARCHAR (20) NOT NULL , 
     Evento_id_evento VARCHAR (20) NOT NULL , 
     Cliente_id_cliente VARCHAR (20) NOT NULL 
    )
;
CREATE UNIQUE INDEX Stand__IDX 
    ON Stand 
    ( 
     Cliente_id_cliente ASC 
    )
;

ALTER TABLE Stand ADD CONSTRAINT Stand_PK PRIMARY KEY 
    (
     id_stand
    )
;

CREATE TABLE Transaccion 
    ( 
     id_transaccion VARCHAR (20) NOT NULL , 
     fecha_transaccion DATE NOT NULL , 
     valor_total_transaccion DOUBLE NOT NULL , 
     tipo_transaccion VARCHAR (20) NOT NULL , 
     Cliente_id_cliente VARCHAR (20) NOT NULL , 
     Proveedor_id_proveedor VARCHAR (20) NOT NULL , 
     Empleado_id_empleado VARCHAR (20) NOT NULL 
    ) 
;

ALTER TABLE Transaccion ADD CONSTRAINT Transaccion_PK PRIMARY KEY 
    (
     id_transaccion
    )
;

ALTER TABLE Asiste 
    ADD CONSTRAINT Asiste_Cliente_FK FOREIGN KEY 
    ( 
     Cliente_id_cliente
    ) 
    REFERENCES Cliente 
    ( 
     id_cliente
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Asiste 
    ADD CONSTRAINT Asiste_Evento_FK FOREIGN KEY 
    ( 
     Evento_id_evento
    ) 
    REFERENCES Evento 
    ( 
     id_evento
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Cargo 
    ADD CONSTRAINT Cargo_Contrato_FK FOREIGN KEY 
    ( 
     Contrato_id_contrato
    ) 
    REFERENCES Contrato 
    ( 
     id_contrato
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Cliente 
    ADD CONSTRAINT Cliente_Stand_FK FOREIGN KEY 
    ( 
     Stand_id_stand
    ) 
    REFERENCES Stand 
    ( 
     id_stand
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Contrato 
    ADD CONSTRAINT Contrato_Cargo_FK FOREIGN KEY 
    ( 
     Cargo_id_cargo
    ) 
    REFERENCES Cargo 
    ( 
     id_cargo
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Contrato 
    ADD CONSTRAINT Contrato_Empleado_FK FOREIGN KEY 
    ( 
     Empleado_id_empleado
    ) 
    REFERENCES Empleado 
    ( 
     id_empleado
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Detalles 
    ADD CONSTRAINT Detalles_Transaccion_FK FOREIGN KEY 
    ( 
     Transaccion_id_transaccion
    ) 
    REFERENCES Transaccion 
    ( 
     id_transaccion
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Empleado 
    ADD CONSTRAINT Empleado_Contrato_FK FOREIGN KEY 
    ( 
     Contrato_id_contrato
    ) 
    REFERENCES Contrato 
    ( 
     id_contrato
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Empleado 
    ADD CONSTRAINT Empleado_Departamento_FK FOREIGN KEY 
    ( 
     Departamento_id_departamento
    ) 
    REFERENCES Departamento 
    ( 
     id_departamento
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Equipo_Estetica 
    ADD CONSTRAINT Equipo_Estetica_Producto_FK FOREIGN KEY 
    ( 
     id_producto
    ) 
    REFERENCES Producto 
    ( 
     id_producto
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Mantiene 
    ADD CONSTRAINT Mantiene_Empleado_FK FOREIGN KEY 
    ( 
     Empleado_id_empleado
    ) 
    REFERENCES Empleado 
    ( 
     id_empleado
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Mantiene 
    ADD CONSTRAINT Mantiene_Equipo_Estetica_FK FOREIGN KEY 
    ( 
     Equipo_Estetica_id_producto
    ) 
    REFERENCES Equipo_Estetica 
    ( 
     id_producto
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Pieza_Publicitaria 
    ADD CONSTRAINT Pieza_Publicitaria_Evento_FK FOREIGN KEY 
    ( 
     Evento_id_evento
    ) 
    REFERENCES Evento 
    ( 
     id_evento
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Producto 
    ADD CONSTRAINT Producto_Detalles_FK FOREIGN KEY 
    ( 
     Detalles_id_renglon
    ) 
    REFERENCES Detalles 
    ( 
     id_renglon
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Stand 
    ADD CONSTRAINT Stand_Cliente_FK FOREIGN KEY 
    ( 
     Cliente_id_cliente
    ) 
    REFERENCES Cliente 
    ( 
     id_cliente
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Stand 
    ADD CONSTRAINT Stand_Evento_FK FOREIGN KEY 
    ( 
     Evento_id_evento
    ) 
    REFERENCES Evento 
    ( 
     id_evento
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Transaccion 
    ADD CONSTRAINT Transaccion_Cliente_FK FOREIGN KEY 
    ( 
     Cliente_id_cliente
    ) 
    REFERENCES Cliente 
    ( 
     id_cliente
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Transaccion 
    ADD CONSTRAINT Transaccion_Empleado_FK FOREIGN KEY 
    ( 
     Empleado_id_empleado
    ) 
    REFERENCES Empleado 
    ( 
     id_empleado
    ) 
    ON DELETE NO ACTION 
;

ALTER TABLE Transaccion 
    ADD CONSTRAINT Transaccion_Proveedor_FK FOREIGN KEY 
    ( 
     Proveedor_id_proveedor
    ) 
    REFERENCES Proveedor 
    ( 
     id_proveedor
    ) 
    ON DELETE NO ACTION 
;