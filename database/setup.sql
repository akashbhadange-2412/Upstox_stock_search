CREATE DATABASE upstox; // Create a new database named upstox
\c upstox; // Connect to the upstox database

CREATE TABLE stocks (
  id SERIAL PRIMARY KEY, // Auto-incrementing ID
  name VARCHAR(255) NOT NULL, // Stock name
  price NUMERIC NOT NULL // Stock price
);

INSERT INTO stocks (name, price) VALUES
('Apple', 145.30), // Insert initial data
('Microsoft', 299.10),
('Google', 2725.60);

