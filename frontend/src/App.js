import React, { useState } from 'react'; // Import React and useState hook
import axios from 'axios'; // Import axios for making HTTP requests

const App = () => {
  const [query, setQuery] = useState(''); // State to store search query
  const [results, setResults] = useState([]); // State to store search results

  // Function to search stocks by name
  const searchStocks = async (event) => {
    event.preventDefault(); // Prevent form submission
    try {
      const response = await axios.get(`http://localhost:3000/search?q=${query}`); // Send GET request to backend
      setResults(response.data); // Update results state
    } catch (error) {
      console.error('Error fetching stocks:', error); // Handle errors
    }
  };

  return (
    <div style={{ padding: '20px' }}>
      <h1>Stock Search</h1>
      <form onSubmit={searchStocks}>
        <input
          type="text"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Search Stocks"
        />
        <button type="submit">Search</button>
      </form>
      <ul>
        {results.map((stock) => (
          <li key={stock.id}>
            <strong>{stock.name}</strong>: ${stock.price}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default App; // Export the App component
