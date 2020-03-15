DROP TABLE tickets; -- table with foreign keys dropped first because it references other tables
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE films(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  price INT,
  year VARCHAR(255)
);

CREATE TABLE customers(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  funds INT
);

CREATE TABLE tickets( -- table with foreign keys created last because it references other tables
  id SERIAL PRIMARY KEY,
  showing_date VARCHAR(255),
  showing_time VARCHAR(255),
  film_id INT REFERENCES films(id) ON DELETE CASCADE,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE
);
