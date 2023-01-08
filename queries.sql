-- Inner Join
SELECT wineName, price, quantity FROM order_item
  INNER JOIN wine
      ON wine.wine_id = order_item.wine_id;

-- Left join
SELECT wineName, quantity FROM wine
    LEFT JOIN order_item
        ON wine.wine_id = order_item.wine_id;


-- WHere

-- фильтр по цене
SELECT wineName from wine WHERE
    price > 50;

-- фильтр по цене и названию вина
SELECT wineName FROM wine
    WHERE (price between 50 and 100)
        AND wineName like 'Na%';

-- фильтр по типу вина
SELECT wineName, price
    FROM wine
    WHERE wine_type_id IN (SELECT wine_id FROM wine_type WHERE typeName = 'Cabernet Sauvignon');

-- фильтр по типу вина и цене
SELECT wineName, price
    FROM wine
        WHERE wine_type_id IN (SELECT wine_id FROM wine_type WHERE typeName = 'Cabernet Sauvignon' and price > 100);

-- выбрать ордеры по году
SELECT order_number
    FROM wine_order
        WHERE extract(YEAR FROM order_date) > 2006;






-- customer
INSERT INTO customer (customerName, email) VALUES
     ('Maria', 'some@test.com');

-- Order
INSERT INTO wine_order (order_number, order_date, customer_id) VALUES
     (1, '11.12.2022', 1),
     (2, '22.12.2022', 1);

-- Importer
INSERT INTO importer (company_name) VALUES
    ('Company name');

-- wine type
INSERT INTO wine_type
(typename)
VALUES('Cabernet Sauvignon'),
      ('Syrah'),
      ('Zinfandel'),
      ('Pinot Noir'),
      ('Chardonnay'),
      ('Sauvignon Blanc'),
      ('Pinot Gris'),
      ('Riesling'),
      ('Merlot'),
      ('Nebbiolo'),
      ('Tempranillo');

-- winery

INSERT INTO winery
(wineryName, country)
VALUES('Lavaux vineyards', 'Switzerland'),
      ('Yarra Yering', 'Australia'),
      ('Chabagu Montelena', 'California'),
      ('Chard Farm Winery', 'New Zealand'),
      ('Marques de Riscal', 'Spain'),
      ('Mission Hill Winery', 'Canada'),
      ('Chabagu Ducru Beaucaillou', 'France'),
      ('Holden Manz Winery', 'South Africa'),
      ('Domino del Plata', 'Argentina'),
      ('Leeuwin Estate Winery', 'Australia');


-- Wine
INSERT INTO wine
(wineName, price, importer_id, winery_id, wine_type_id)
VALUES('Estate', 200, 1, 3, 1),
      ('Napa Valley', 85, 1, 3, 1),
      ('Potter Valley', 40, 1, 3, 8),
      ('finla mor', 42, 1, 4, 4),
      ('closeburn', 31, 1, 4, 5),
      ('Marqués de Riscal Reserva', 75, 1, 5, 11),
      ('Jagged Rock Vineyard', 40, 1, 5, 6),
      ('Fritzis Vineyard', 40, 1, 5, 6),
      ('Saint-Julien', 239, 1, 6, 9),
      ('HOLDEN MANZ VISIONAIRE', 200, 1, 7, 9),
      ('Susana Balbo', 35, 1, 8, 6),
      ('Art Series', 89, 1, 10, 1),
      ('Museum Release Art', 169, 1, 10, 1),
      ('NO. 3 MAGNUM', 250, 1, 2, 2);

-- Order item
INSERT INTO order_item (quantity, order_id, wine_id) VALUES
    (3, 1, 2),
    (1, 1, 1),
    (2, 1, 5),
    (5, 1, 2),
    (2, 1, 2);





