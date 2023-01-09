-- Товары у которые заказывали 1 раз
SELECT wineName FROM wine
    INNER JOIN order_item
        ON wine.wine_id = order_item.wine_id
    GROUP BY wineName
    HAVING count(order_item.wine_id) = 1;
-- самый дорогой и самый дешевый товар в каждой категории

SELECT wine_type.typeName, max(price) FROM wine_type
   LEFT JOIN wine on wine.wine_type_id = wine_type.wine_id
        GROUP BY wine_type.typeName;

SELECT wine_type.typeName, min(price) FROM wine_type
    LEFT JOIN wine on wine.wine_type_id = wine_type.wine_id
        GROUP BY wine_type.typeName;

-- сделать rollup с количеством товаров по категориям
SELECT wine_type.typeName, count(wine.wine_id) FROM wine_type
    LEFT JOIN wine on wine.wine_type_id = wine_type.wine_id
        GROUP BY wine_type.typeName with ROLLUP;
