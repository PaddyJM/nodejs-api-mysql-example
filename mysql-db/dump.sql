CREATE DATABASE test_db;
USE test_db;
SET GLOBAL sql_mode='';

CREATE TABLE clients (
	id int NOT NULL AUTO_INCREMENT,
	client_name VARCHAR(255),
  address_line_1 VARCHAR(255) NOT NULL,
	address_line_2 VARCHAR(255),
	town VARCHAR(255),
	postcode VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE orders (
	id int NOT NULL AUTO_INCREMENT,
	client_id INT,
	address_line_1 VARCHAR(255) NOT NULL,
	address_line_2 VARCHAR(255),
	town VARCHAR(255),
	postcode VARCHAR(255) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE products (
	id int NOT NULL AUTO_INCREMENT,
	product_name VARCHAR(255),
	PRIMARY KEY (id)
);

CREATE TABLE order_lines (
	id int NOT NULL AUTO_INCREMENT,
	order_id int,
	product_id int,
  quantity int,
	PRIMARY KEY (id),
	FOREIGN KEY (order_id) REFERENCES orders(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO clients ( client_name,
                      address_line_1,
                      address_line_2,
                      town,
                      postcode)
VALUES ( "Dunder Mifflin",
          "1 Business Park",
          "Nowhere",
          "Scranton",
          "SC0 T07");

INSERT INTO orders (client_id,
					  address_line_1,
						address_line_2,
						town,
						postcode)
VALUES (1,
		"1 Roady Road",
		"Wherever",
		"Townlington",
		"TO1 3WN");
		
INSERT INTO products ( product_name )
VALUES ( "small paper" ),
        ( "medium paper"),
        ( "large paper");

INSERT INTO order_lines ( order_id, product_id, quantity )
VALUES ( 1, 1, 9000 ),
        ( 1, 3, 7),
        ( 1, 2, 42);