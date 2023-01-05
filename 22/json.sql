CREATE TABLE wine_json (
  wine_id INT AUTO_INCREMENT PRIMARY KEY,
  wineName varchar(255) NOT NULL,
  price INT CHECK (price > 0),
  attributes JSON NOT NULL
);


INSERT INTO wine_json
    (wineName,price, attributes )
VALUES
    ('Wine1', 100, '{"type":"Cabernet Savignon", "year":"1994", "country":"Spain"}'),
    ('Wine2', 350, '{"type":"Merlot", "year":"2001", "country":"France"}'),
    ('Wine3', 350, '{"type":"Savignon Blanc", "year":"2010", "country":"New Zealand"}');
