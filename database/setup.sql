CREATE DATABASE upstox;
\c upstox

CREATE TABLE stocks (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price NUMERIC NOT NULL
);

INSERT INTO stocks (name, price) VALUES
('Apple', 145.30),
('Microsoft', 299.10),
('Google', 2725.60);
