-- !!!!!!!!!!!!!!!!!!!!! INSERT(3) !!!!!!!!!!!!!!!!!!!!!!!!!!

INSERT INTO wine.winery
(wineryname, country)
VALUES('Lavaux vineyards', 'Switzerland'),
        ('Yarra Yering', 'Australia'),
        ('Chateau Montelena', 'California'),
        ('Chard Farm Winery', 'New Zealand'),
        ('Marques de Riscal', 'Spain'),
        ('Mission Hill Winery', 'Canada'),
        ('Chateau Ducru Beaucaillou', 'France'),
        ('Holden Manz Winery', 'South Africa'),
        ('Domino del Plata', 'Argentina'),
        ('Leeuwin Estate Winery', 'Australia')
    returning wineryname, country;

INSERT INTO wine.importer
(companyname)
VALUES('Importer 1'),
      ('Importer 2'),
      ('Importer 3'),
      ('Importer 4'),
      ('Importer 5'),
      ('Importer 6'),
      ('Importer 7'),
      ('Importer 8'),
      ('Importer 9'),
      ('Importer 10')
    returning companyname;


INSERT INTO wine.winetype
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
      ('Tempranillo')
    returning typename;


ALTER TABLE wine.wine ADD year integer;

CREATE TABLE wine.wineyear (ID SERIAL primary key, year integer NOT NULL, wine varchar(255) NOT NULL);

INSERT INTO wine.wineyear
(year, wine)
VALUES(2018, 'Estate'),
      (2019, 'Napa Valley'),
      (2021, 'Potter Valley'),
      (2020, 'finla mor'),
      (2022, 'closeburn'),
      (2007, 'Marqués de Riscal Reserva'),
      (2021, 'Jagged Rock Vineyard'),
      (2021, 'Fritzis Vineyard'),
      (2015, 'Saint-Julien'),
      (2017, 'HOLDEN MANZ VISIONAIRE'),
      (2019, 'Susana Balbo'),
      (2017, 'Art Series'),
      (2009, 'Museum Release Art'),
      (2021, 'NO. 3 MAGNUM');


INSERT INTO wine.wine
(winename, price, importerid, wineryid, winetypeid)
VALUES('Estate', 200, 4, 3, 1),
      ('Napa Valley', 85, 2, 3, 1),
      ('Potter Valley', 40, 7, 3, 8),
      ('finla mor', 42, 8, 4, 4),
      ('closeburn', 31, 1, 4, 5),
      ('Marqués de Riscal Reserva', 75, 3, 5, 11),
      ('Jagged Rock Vineyard', 40, 6, 5, 6),
      ('Fritzis Vineyard', 40, 6, 5, 6),
      ('Saint-Julien', 239, 2, 6, 9),
      ('HOLDEN MANZ VISIONAIRE', 200, 1, 7, 9),
      ('Susana Balbo', 35, 7, 8, 6),
      ('Art Series', 89, 1, 10, 1),
      ('Museum Release Art', 169, 1, 10, 1),
      ('NO. 3 MAGNUM', 250, 4, 2, 2);

-- !!!!!!!!!!!!!!!!!!!!! UPDATE(4) !!!!!!!!!!!!!!!!!!!!!!!!!!
UPDATE wine.wine
SET year = y.year FROM wine.wineyear AS y WHERE wine.wine.winename=y.wine;

-- !!!!!!!!!!!!!!!!!!!!! DELETE(5) !!!!!!!!!!!!!!!!!!!!!!!!!!
DELETE FROM wine.wineyear y USING wine.wine w WHERE y.wine = w.winename AND w.price > 50;
TRUNCATE wine.wineyear;

-- !!!!!!!!!!!!!!!!!!!!! SELECT(1, 2) !!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT winename FROM wine.wine WHERE price BETWEEN 50 AND 100; -- найти вина с ценой 50-100
SELECT winename FROM wine.wine WHERE winename LIKE '%Valley%'; -- найти вина, где в названии присутствует Valley

-- покажутся все вина и их винодельни
SELECT winename, wineryname FROM wine.wine AS wine LEFT JOIN wine.winery AS winery ON wine.wineryid = winery.id;
-- покажутся все винодельни и их вина. если вин нет, то винадельни все равно покажутся, но столбец с вином будет пустым
SELECT winename, wineryname FROM wine.winery AS winery LEFT JOIN wine.wine AS wine ON wine.wineryid = winery.id;
-- покажутся все винодельни и их вина. если вин нет, то винадельни не покажутся
SELECT winename, wineryname FROM wine.winery AS winery INNER JOIN wine.wine AS wine ON wine.wineryid = winery.id;

-- !!!!!!!!!!!!!!!!!!!!! COPY(6) !!!!!!!!!!!!!!!!!!!!!!!!!!

COPY wine.wine (winename) TO '/var/www/file' (FORMAT csv);
