DELIMITER //

CREATE TRIGGER trg_reduce_stock
AFTER INSERT ON OrderItems
FOR EACH ROW
BEGIN
    UPDATE Products
    SET Stock = Stock - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END //

DELIMITER ;
