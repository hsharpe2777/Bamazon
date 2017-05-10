CREATE DATABASE bamazon_db;

USE bamazon_db;

CREATE TABLE products (
item_id INTEGER(30) AUTO_INCREMENT NOT NULL,
product_name VARCHAR(30) NOT NULL, 
department_name VARCHAR(30) NOT NULL,
price DECIMAL(30),
stock_quantity INTEGER (30),
PRIMARY KEY(item_id)
);



INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (1, "Nikey Air Boots", "Shoes", 70.00, 10);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (2, "Aphogee Conditioner", "Beauty", 15.99, 7);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Sturdiness Cast Iron Pan", "Kitchen Supplies", 24.99, 8);

INSERT INTO products ( product_name, department_name, price, stock_quantity)
VALUES ("Bundle Winter Coat", "Apparel", 79.00, 15);

INSERT INTO products ( product_name, department_name, price, stock_quantity)
VALUES ("Yummy Gummy Vitamins", "Health", 12.00, 12);

INSERT INTO products ( product_name, department_name, price, stock_quantity)
VALUES ("Candi Candle", "Home", 12.00, 15);

INSERT INTO products ( product_name, department_name, price, stock_quantity)
VALUES ("Jelly for the Belly (Grape)", "Food", 5.00, 10);

INSERT INTO products ( product_name, department_name, price, stock_quantity)
VALUES ("Miss Piggy's Jarred Pig Feet", "Food", 7.00, 10);

INSERT INTO products ( product_name, department_name, price, stock_quantity)
VALUES ("Kermity Dried Frog Legs", "Food", 25.00, 4);

INSERT INTO products ( product_name, department_name, price, stock_quantity)
VALUES ("Fury Leggings", "Apparel", 40.00, 3);

INSERT INTO products ( product_name, department_name, price, stock_quantity)
VALUES ("Tall Hat", "Apparel", 15.00, 1);

SELECT * FROM products;
