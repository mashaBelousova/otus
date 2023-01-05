CREATE database otus;
USE otus;

CREATE TABLE importer (importer_id INT AUTO_INCREMENT PRIMARY KEY, company_name varchar(255) NOT NULL);
CREATE TABLE wine_type (wine_id INT AUTO_INCREMENT PRIMARY KEY, typeName varchar(255) NOT NULL);
CREATE TABLE winery (winery_id INT AUTO_INCREMENT PRIMARY KEY, wineryName varchar(255) NOT NULL, country varchar(255) NOT NULL);
CREATE TABLE wine (
   wine_id INT AUTO_INCREMENT PRIMARY KEY,
   wineName varchar(255) NOT NULL,
   price INT CHECK (price > 0),
   importer_id INT,
   winery_id INT,
   wine_type_id INT,
   FOREIGN KEY (importer_id) REFERENCES importer(importer_id),
   FOREIGN KEY (winery_id) REFERENCES winery(winery_id),
   FOREIGN KEY (wine_type_id) REFERENCES wine_type(wine_id)
);

CREATE TABLE customer (customer_id INT AUTO_INCREMENT PRIMARY KEY, customerName varchar(255) NOT NULL, email varchar(255) NOT NULL);
CREATE TABLE wine_order (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  order_number INT NOT NULL,
  order_date timestamp NOT NULL,
  active boolean DEFAULT TRUE,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE order_item (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  quantity INT CHECK (quantity > 0),
  order_id INT REFERENCES wine_order(order_id),
  wine_id INT REFERENCES wine(wine_id)
);
