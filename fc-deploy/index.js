const http = require('http');
const fs = require('fs');
const path = require('path');

// Read the HTML file
const htmlContent = fs.readFileSync(path.join(__dirname, 'index.html'), 'utf8');

// Create server
const server = http.createServer((req, res) => {
  // Set CORS headers to allow API calls from browser
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  
  if (req.method === 'OPTIONS') {
    res.writeHead(200);
    res.end();
    return;
  }
  
  // Serve HTML
  res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
  res.end(htmlContent);
});

// Function Compute handler
exports.handler = (req, res, context) => {
  server.emit('request', req, res);
};

// For local testing
if (require.main === module) {
  const PORT = process.env.PORT || 9000;
  server.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
}
