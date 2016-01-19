CREATE TABLE customers (id SERIAL PRIMARY KEY, first_name VARCHAR(255), last_name VARCHAR(255), email VARCHAR(255));

CREATE TABLE products (id SERIAL PRIMARY KEY, name VARCHAR(255), price money);

CREATE TABLE orders (cust_id integer REFERENCES customers, prod_id integer REFERENCES products, prod_qty integer);

INSERT INTO products (name, price) VALUES ('windex', 3.99);
INSERT INTO products (name, price) VALUES ('garden gnome', 10.00);
INSERT INTO products (name, price) VALUES ('snowblower', 299.99);
INSERT INTO products (name, price) VALUES ('mac & cheese', 2.00);
INSERT INTO products (name, price) VALUES ('lightbulb', 0.50);

INSERT INTO customers (first_name, last_name, email) VALUES ('Leonardo', 'Turtle', 'leo@turtles.org'), ('Donatello', 'Turtle', 'don@turtles.org');
INSERT INTO customers (first_name, last_name, email) VALUES ('Michelangelo', 'Turtle', 'mich@turtles.org'), ('Raphael', 'Turtle', 'raph@turtles.org');
INSERT INTO customers (first_name, last_name, email) VALUES ('Shredder', 'Dude', 'shreds@evil.com');

INSERT INTO ORDERS (cust_id, prod_id, prod_qty) VALUES (1,1,1), (2,3,27), (3,1,12), (3,4,1), (3,5,5);
INSERT INTO ORDERS (cust_id, prod_id, prod_qty) VALUES (5,5,20), (4,2,10000), (1,4,12), (1,5,5),(2,4,10);

