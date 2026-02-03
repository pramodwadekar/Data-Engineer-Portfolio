DELIMITER //

CREATE PROCEDURE GetCustomerOrders(IN cust_id INT)
BEGIN
    SELECT o.OrderID, o.OrderDate
    FROM Orders o
    WHERE o.CustomerID = cust_id;
END //

DELIMITER ;

-- Call example
-- CALL GetCustomerOrders(1);
