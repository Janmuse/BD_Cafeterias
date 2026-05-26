-- 1. El precio o costo de un producto no puede ser negativo
DELIMITER $$
CREATE TRIGGER tg_precio_no_negativo_insert
BEFORE INSERT ON Producto
FOR EACH ROW
BEGIN
    IF NEW.precio_venta < 0 OR NEW.costo_producto < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El precio o costo del producto no puede ser negativo.';
    END IF;
END$$

CREATE TRIGGER tg_precio_no_negativo_update
BEFORE UPDATE ON Producto
FOR EACH ROW
BEGIN
    IF NEW.precio_venta < 0 OR NEW.costo_producto < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El precio o costo del producto no puede ser negativo.';
    END IF;
END$$

-- 2. Un empleado solo puede pertenecer a una sucursal
CREATE TRIGGER tg_empleado_una_sucursal
BEFORE UPDATE ON Empleado
FOR EACH ROW
BEGIN
    IF OLD.id_sucursal != NEW.id_sucursal THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Un empleado no puede cambiar de sucursal directamente.';
    END IF;
END$$

-- 3. Las CURPs no se pueden repetir entre Empleado y Arrendatario
CREATE TRIGGER tg_curp_unica_empleado_insert
BEFORE INSERT ON Empleado
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM Arrendatario WHERE CURP = NEW.CURP) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La CURP ya existe en la tabla Arrendatario.';
    END IF;
END$$

CREATE TRIGGER tg_curp_unica_arrendatario_insert
BEFORE INSERT ON Arrendatario
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM Empleado WHERE CURP = NEW.CURP) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La CURP ya existe en la tabla Empleado.';
    END IF;
END$$

-- 5. Las ventas disminuyen el inventario
CREATE TRIGGER tg_venta_disminuye_inventario
AFTER INSERT ON Detalle_venta
FOR EACH ROW
BEGIN
    UPDATE Inventario
    SET cantidad = cantidad - NEW.cantidad
    WHERE id_producto = NEW.id_producto
      AND id_sucursal = (
          SELECT id_sucursal FROM Venta WHERE id_venta = NEW.id_venta
      );
END$$

-- 6. Las compras aumentan el inventario
CREATE TRIGGER tg_compra_aumenta_inventario
AFTER INSERT ON Detalle_compra
FOR EACH ROW
BEGIN
    -- Si ya existe el producto en esa sucursal, suma la cantidad
    IF EXISTS (
        SELECT 1 FROM Inventario
        WHERE id_producto = NEW.id_producto
          AND id_sucursal = (SELECT id_sucursal FROM Compra WHERE id_compra = NEW.id_compra)
    ) THEN
        UPDATE Inventario
        SET cantidad = cantidad + NEW.cantidad
        WHERE id_producto = NEW.id_producto
          AND id_sucursal = (SELECT id_sucursal FROM Compra WHERE id_compra = NEW.id_compra);
    ELSE
        -- Si no existe, inserta el registro en inventario
        INSERT INTO Inventario(cantidad, id_producto, id_sucursal)
        VALUES(
            NEW.cantidad,
            NEW.id_producto,
            (SELECT id_sucursal FROM Compra WHERE id_compra = NEW.id_compra)
        );
    END IF;
END$$


-- 7. No se puede vender si no hay inventario suficiente
CREATE TRIGGER tg_verificar_stock_antes_venta
BEFORE INSERT ON Detalle_venta
FOR EACH ROW
BEGIN
    DECLARE stock_actual INT;
    SELECT cantidad INTO stock_actual
    FROM Inventario
    WHERE id_producto = NEW.id_producto
      AND id_sucursal = (SELECT id_sucursal FROM Venta WHERE id_venta = NEW.id_venta);

    IF stock_actual IS NULL OR stock_actual < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Stock insuficiente para realizar la venta.';
    END IF;
END$$

DELIMITER ;