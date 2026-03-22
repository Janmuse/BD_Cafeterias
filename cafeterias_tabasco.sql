-- ============================================================
--  SISTEMA DE CAFETERÍAS - BACHILLERES TABASCO
--  Generado con base en reglas de negocio + propuesta de productos
-- ============================================================

CREATE DATABASE IF NOT EXISTS cafeterias_tabasco
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_spanish_ci;

USE cafeterias_tabasco;

-- ============================================================
-- 1. UBICACIÓN
-- ============================================================
CREATE TABLE ubicacion (
    id_ubicacion   INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    calle          VARCHAR(150)        NOT NULL,
    municipio      VARCHAR(100)        NOT NULL,
    cp             CHAR(5)             NOT NULL,
    CONSTRAINT chk_cp CHECK (cp REGEXP '^[0-9]{5}$')
);

-- ============================================================
-- 2. CONCESIONARIO  (dueño de la sucursal — regla 7)
-- ============================================================
CREATE TABLE concesionario (
    id_concesionario  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre            VARCHAR(100) NOT NULL,
    telefono          VARCHAR(15),
    correo            VARCHAR(100)
);

-- ============================================================
-- 3. SUCURSAL
-- ============================================================
CREATE TABLE sucursal (
    id_sucursal       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre            VARCHAR(150)  NOT NULL,
    id_ubicacion      INT UNSIGNED  NOT NULL,
    id_concesionario  INT UNSIGNED  NOT NULL,
    CONSTRAINT fk_suc_ubi  FOREIGN KEY (id_ubicacion)     REFERENCES ubicacion(id_ubicacion),
    CONSTRAINT fk_suc_con  FOREIGN KEY (id_concesionario) REFERENCES concesionario(id_concesionario)
);

-- ============================================================
-- 4. PROVEEDOR  (regla 3)
-- ============================================================
CREATE TABLE proveedor (
    id_proveedor  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre        VARCHAR(100) NOT NULL,
    telefono      VARCHAR(15)
);

-- Proveedores reales extraídos de la propuesta
INSERT INTO proveedor (nombre) VALUES
    ('SAMS'),
    ('LA ESTRELLA'),
    ('COSTCO'),
    ('GEPP'),
    ('PEPSI'),
    ('SORIANA');

-- ============================================================
-- 5. SUCURSAL ↔ PROVEEDOR  (una sucursal puede tener varios — regla 1)
-- ============================================================
CREATE TABLE sucursal_proveedor (
    id_sucursal   INT UNSIGNED NOT NULL,
    id_proveedor  INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_sucursal, id_proveedor),
    CONSTRAINT fk_sp_suc  FOREIGN KEY (id_sucursal)  REFERENCES sucursal(id_sucursal),
    CONSTRAINT fk_sp_pro  FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

-- ============================================================
-- 6. EQUIPO  (regla 4)
-- ============================================================
CREATE TABLE equipo (
    id_equipo    INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre       VARCHAR(100)       NOT NULL,
    marca        VARCHAR(100),
    costo        DECIMAL(10,2)      NOT NULL,
    cantidad     SMALLINT UNSIGNED  NOT NULL DEFAULT 1
);

-- ============================================================
-- 7. SUCURSAL ↔ EQUIPO
-- ============================================================
CREATE TABLE sucursal_equipo (
    id_sucursal  INT UNSIGNED NOT NULL,
    id_equipo    INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_sucursal, id_equipo),
    CONSTRAINT fk_se_suc FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal),
    CONSTRAINT fk_se_equ FOREIGN KEY (id_equipo)   REFERENCES equipo(id_equipo)
);

-- ============================================================
-- 8. EMPLEADO  (reglas 5 y 6)
--    rol: cajero | cocinero | limpieza | auxiliar | supervisor | administrador
--    supervisor_id apunta al empleado que lo supervisa (auto-referencia)
-- ============================================================
CREATE TABLE empleado (
    id_empleado    INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre         VARCHAR(100)  NOT NULL,
    apellido_p     VARCHAR(80)   NOT NULL,
    apellido_m     VARCHAR(80),
    telefono       VARCHAR(15),
    rol            ENUM('cajero','cocinero','limpieza','auxiliar','supervisor','administrador') NOT NULL,
    id_sucursal    INT UNSIGNED  NOT NULL,
    supervisor_id  INT UNSIGNED  NULL,          -- NULL = no tiene supervisor
    CONSTRAINT fk_emp_suc FOREIGN KEY (id_sucursal)   REFERENCES sucursal(id_sucursal),
    CONSTRAINT fk_emp_sup FOREIGN KEY (supervisor_id) REFERENCES empleado(id_empleado)
);

-- ============================================================
-- 9. CATEGORÍA DE ARTÍCULO DE INVENTARIO
--    VDC  = Venta Directa al Consumidor
--    LOM  = Limpieza, Operaciones y Mantenimiento
--    INS  = Insumo (para elaborar platillos)
-- ============================================================
CREATE TABLE categoria_articulo (
    id_categoria  TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    clave         ENUM('VDC','LOM','INS') NOT NULL UNIQUE,
    descripcion   VARCHAR(100) NOT NULL
);

INSERT INTO categoria_articulo (clave, descripcion) VALUES
    ('VDC', 'Venta Directa al Consumidor'),
    ('LOM', 'Limpieza, Operaciones y Mantenimiento'),
    ('INS', 'Insumo para preparación de platillos');

-- ============================================================
-- 10. ARTÍCULO  (regla 8)
--     Los artículos VDC son los "productos terminados" (regla 11)
--     Los INS son insumos de cocina (regla 12)
-- ============================================================
CREATE TABLE articulo (
    id_articulo    INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre         VARCHAR(150)     NOT NULL,
    descripcion    VARCHAR(255),
    id_categoria   TINYINT UNSIGNED NOT NULL,
    id_proveedor   INT UNSIGNED,                 -- proveedor habitual
    precio_compra  DECIMAL(10,2),
    precio_venta   DECIMAL(10,2),                -- aplica sólo a VDC
    unidad_medida  VARCHAR(30)      NOT NULL DEFAULT 'pieza',
    CONSTRAINT fk_art_cat FOREIGN KEY (id_categoria) REFERENCES categoria_articulo(id_categoria),
    CONSTRAINT fk_art_pro FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

-- Artículos VDC de la propuesta (muestra representativa)
INSERT INTO articulo (nombre, id_categoria, id_proveedor, precio_compra, precio_venta, unidad_medida) VALUES
    -- Galletas / sólidos  (proveedor SAMS = 1)
    ('Galletas Emperador surtido',  1, 1, 12.45, 20.00, 'pieza'),
    ('Chokis',                      1, 1, 12.20, 20.00, 'pieza'),
    ('Arcoíris',                    1, 1, 14.07, 22.00, 'pieza'),
    ('Mini Mamut',                  1, 1,  2.30,  5.00, 'pieza'),
    -- Dulces / botanas  (proveedor LA ESTRELLA = 2)
    ('Sabrisurtido',                1, 2,  9.11, 18.00, 'pieza'),
    ('Tutsi',                       1, 2,  4.03,  8.00, 'pieza'),
    ('Rockaleta',                   1, 2,  6.75, 12.00, 'pieza'),
    ('Cupido',                      1, 2,  1.89,  5.00, 'pieza'),
    ('Lucas',                       1, 2,  7.60, 15.00, 'pieza'),
    ('Pulparindo',                  1, 2,  2.30,  5.00, 'pieza'),
    ('Rellerindo',                  1, 2,  1.14,  3.00, 'pieza'),
    ('Takis',                       1, 2,  6.68, 15.00, 'pieza'),
    ('Carlos V',                    1, 2,  2.88,  6.00, 'pieza'),
    ('Halls',                       1, 2,  6.57, 12.00, 'pieza'),
    -- Costco = 3
    ('Oreo',                        1, 3, 13.76, 25.00, 'pieza'),
    ('Payafiesta',                  1, 3,  2.49,  5.00, 'pieza'),
    -- Bebidas GEPP = 4
    ('Pepsi Black 600ml',           1, 4, 12.46, 25.00, 'pieza'),
    ('Sabores 600ml',               1, 4, 12.54, 25.00, 'pieza'),
    ('Gatorade 1L',                 1, 4, 23.33, 38.00, 'pieza');

-- ============================================================
-- 11. INVENTARIO  (regla 1 y 8)
--     Cada sucursal lleva su propio inventario de artículos
-- ============================================================
CREATE TABLE inventario (
    id_inventario  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_sucursal    INT UNSIGNED NOT NULL,
    id_articulo    INT UNSIGNED NOT NULL,
    cantidad       INT UNSIGNED NOT NULL DEFAULT 0,
    ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                         ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_inv (id_sucursal, id_articulo),
    CONSTRAINT fk_inv_suc FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal),
    CONSTRAINT fk_inv_art FOREIGN KEY (id_articulo) REFERENCES articulo(id_articulo)
);

-- ============================================================
-- 12. MENÚ  (regla 13)
-- ============================================================
CREATE TABLE menu (
    id_menu      INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_sucursal  INT UNSIGNED NOT NULL,
    nombre       VARCHAR(100) NOT NULL DEFAULT 'Menú principal',
    activo       TINYINT(1)   NOT NULL DEFAULT 1,
    CONSTRAINT fk_menu_suc FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal)
);

-- ============================================================
-- 13. PLATILLO  (regla 11 y 13)
-- ============================================================
CREATE TABLE platillo (
    id_platillo   INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre        VARCHAR(150)  NOT NULL,
    descripcion   VARCHAR(255),
    precio_venta  DECIMAL(10,2) NOT NULL,
    disponible    TINYINT(1)    NOT NULL DEFAULT 1
);

-- ============================================================
-- 14. MENÚ ↔ PLATILLO
-- ============================================================
CREATE TABLE menu_platillo (
    id_menu      INT UNSIGNED NOT NULL,
    id_platillo  INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_menu, id_platillo),
    CONSTRAINT fk_mp_menu FOREIGN KEY (id_menu)     REFERENCES menu(id_menu),
    CONSTRAINT fk_mp_pla  FOREIGN KEY (id_platillo) REFERENCES platillo(id_platillo)
);

-- ============================================================
-- 15. RECETA: insumos necesarios por platillo  (regla 14)
--     id_articulo debe ser de categoría INS
-- ============================================================
CREATE TABLE receta (
    id_receta    INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_platillo  INT UNSIGNED      NOT NULL,
    id_articulo  INT UNSIGNED      NOT NULL,   -- insumo (INS)
    cantidad     DECIMAL(10,3)     NOT NULL,
    unidad       VARCHAR(30)       NOT NULL DEFAULT 'pieza',
    UNIQUE KEY uq_rec (id_platillo, id_articulo),
    CONSTRAINT fk_rec_pla FOREIGN KEY (id_platillo) REFERENCES platillo(id_platillo),
    CONSTRAINT fk_rec_art FOREIGN KEY (id_articulo) REFERENCES articulo(id_articulo)
);

-- ============================================================
-- 16. VENTA  (regla 10)
-- ============================================================
CREATE TABLE venta (
    id_venta    INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_sucursal INT UNSIGNED  NOT NULL,
    id_empleado INT UNSIGNED  NOT NULL,        -- cajero que registra
    fecha_hora  DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total       DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_ven_suc FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal),
    CONSTRAINT fk_ven_emp FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

-- ============================================================
-- 17. DETALLE DE VENTA
--     Puede incluir artículos VDC directos o platillos del menú
-- ============================================================
CREATE TABLE detalle_venta (
    id_detalle   INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_venta     INT UNSIGNED      NOT NULL,
    -- Un detalle es artículo VDC  O  platillo (sólo uno de los dos)
    id_articulo  INT UNSIGNED      NULL,
    id_platillo  INT UNSIGNED      NULL,
    cantidad     SMALLINT UNSIGNED NOT NULL DEFAULT 1,
    precio_unit  DECIMAL(10,2)     NOT NULL,
    subtotal     DECIMAL(10,2)     GENERATED ALWAYS AS (cantidad * precio_unit) STORED,
    CONSTRAINT fk_det_ven FOREIGN KEY (id_venta)     REFERENCES venta(id_venta),
    CONSTRAINT fk_det_art FOREIGN KEY (id_articulo)  REFERENCES articulo(id_articulo),
    CONSTRAINT fk_det_pla FOREIGN KEY (id_platillo)  REFERENCES platillo(id_platillo),
    CONSTRAINT chk_det_tipo CHECK (
        (id_articulo IS NOT NULL AND id_platillo IS NULL) OR
        (id_articulo IS NULL     AND id_platillo IS NOT NULL)
    )
);

-- ============================================================
-- TRIGGER: actualiza total de venta al insertar detalle
-- ============================================================
DELIMITER $$
CREATE TRIGGER trg_actualiza_total
AFTER INSERT ON detalle_venta
FOR EACH ROW
BEGIN
    UPDATE venta
    SET total = total + NEW.subtotal
    WHERE id_venta = NEW.id_venta;
END$$
DELIMITER ;

-- ============================================================
-- TRIGGER: descuenta del inventario al vender un artículo VDC
-- ============================================================
DELIMITER $$
CREATE TRIGGER trg_descuenta_inventario_vdc
AFTER INSERT ON detalle_venta
FOR EACH ROW
BEGIN
    DECLARE v_sucursal INT UNSIGNED;
    IF NEW.id_articulo IS NOT NULL THEN
        SELECT id_sucursal INTO v_sucursal FROM venta WHERE id_venta = NEW.id_venta;
        UPDATE inventario
        SET cantidad = cantidad - NEW.cantidad
        WHERE id_sucursal = v_sucursal
          AND id_articulo  = NEW.id_articulo;
    END IF;
END$$
DELIMITER ;
