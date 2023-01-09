delimiter //
CREATE PROCEDURE create_order()
BEGIN

INSERT INTO wine_order (order_number, order_date, customer_id) VALUES
   (2, '11.12.2022', 1);
INSERT INTO order_item (quantity, order_id, wine_id) VALUES
     (3, 2, 2),
     (1, 2, 1);
END
//
delimiter ;

set autocommit = 0;

begin;
call create_order();
SELECT * FROM order_item;
SELECT * FROM wine_order;
COMMIT;

