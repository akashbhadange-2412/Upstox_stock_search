import express from 'express'; // Import Express framework
import { Pool } from 'pg'; // Import PostgreSQL client
import dotenv from 'dotenv'; // Import dotenv for environment variables

dotenv.config(); // Load environment variables from .env file

const app = express(); // Create an Express application
const pool = new Pool({
  user: process.env.DB_USER, // Database user
  host: process.env.DB_HOST, // Database host
  database: process.env.DB_DATABASE, // Database name
  password: process.env.DB_PASSWORD, // Database password
  port: parseInt(process.env.DB_PORT || '5432'), // Database port
});

// Define a GET endpoint for searching stocks
app.get('/search', async (req, res) => {
  const query = req.query.q as string; // Get query parameter
  try {
    const result = await pool.query('SELECT * FROM stocks WHERE name ILIKE $1', [`%${query}%`]); // Execute SQL query
    res.json(result.rows); // Send results as JSON
  } catch (err) {
    res.status(500).send(err.message); // Handle errors
  }
});

// Start the server on port 3000
app.listen(3000, () => {
  console.log('Server is running on port 3000'); // Log server start
});
