CREATE USER 'client'@'localhost'
DROP procedure IF EXISTS get_wine;

DELIMITER $$
CREATE DEFINER = 'client'@'localhost' PROCEDURE get_wine (IN in_year INTEGER, IN in_price INTEGER, IN in_typeName VARCHAR(55),
 IN in_order_by VARCHAR(255), IN in_offset INTEGER, IN in_records INTEGER)
BEGIN
SELECT winename, typename, price from wine left join wine_type on wine.wine_type_id = wine_type.wine_id
  where year > in_year AND price > in_price AND typename=in_typeName ORDER BY in_order_by LIMIT in_offset, in_records;
END$$
DELIMITER ;


CALL get_wine(2000, 50, 'Cabernet Sauvignon', 'price', 1, 2);



CREATE USER 'manager'@'localhost'
DROP procedure IF EXISTS get_orders;


DELIMITER $$
CREATE DEFINER = 'manager'@'localhost' PROCEDURE get_orders (IN in_group_by VARCHAR(255), IN in_interval_days integer)
BEGIN
select order_number, order_date, company_name, wineName, price, year, description from wine_order
    inner join order_item on order_item.order_id=wine_order.order_id
    inner join wine on order_item.wine_id=wine.wine_id
    inner join importer on wine.importer_id=importer.importer_id
    where  DATE_SUB(CURDATE(),INTERVAL in_interval_days DAY) <= order_date
    GROUP BY in_group_by;
END$$
DELIMITER ;

CALL get_orders('price', 1000);
