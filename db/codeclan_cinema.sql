DROP TABLE customers;
DROP TABLE films;
DROP TABLE tickets;

CREATE TABLE tickets(
  id SERIAL PRIMARY KEY,
  customer_id INT,
  film_id INT
);

CREATE TABLE films(
  title VARCHAR(255),
  price INT
);

CREATE TABLE customers(
  name VARCHAR(255),
  funds INT
);
