const express = require('express');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 8081;

// Serve static files from the public directory
app.use(express.static(path.join(__dirname, 'public')));

// Parse JSON and URL-encoded request bodies
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// API endpoint for health check
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'OK', message: 'Server is running' });
});

// API endpoint for server info
app.get('/api/info', (req, res) => {
  res.status(200).json({
    environment: process.env.NODE_ENV || 'production',
    timestamp: new Date().toISOString(),
    uptime: process.uptime()
  });
});

// Serve index.html for root path
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Catch-all to serve index.html for SPA routing
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
  console.log(`Environment: ${process.env.NODE_ENV || 'production'}`);
  console.log(`Visit http://localhost:${PORT} in your browser`);
});

module.exports = app;
