require('dotenv').config();
const express = require('express');
const cors = require('cors');
const pool = require('./src/db');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// Routes
const contentRoutes = require('./src/routes/content');
app.use('/api/content', contentRoutes);

// Health check
app.get('/health', async (req, res) => {
  try {
    const result = await pool.query('SELECT NOW()');
    res.json({ 
      status: 'healthy', 
      database: 'connected',
      timestamp: result.rows[0].now 
    });
  } catch (error) {
    res.status(500).json({ 
      status: 'unhealthy', 
      error: error.message 
    });
  }
});

// Root
app.get('/', (req, res) => {
  res.json({
    message: '🎬 WatchNext API',
    version: '1.0.0',
    endpoints: [
      'GET /health',
      'GET /api/content',
      'GET /api/content/:id',
      'GET /api/content?type=movie',
    ]
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`🎬 WatchNext API running on http://localhost:${PORT}`);
  console.log(`📊 Health check: http://localhost:${PORT}/health`);
});

module.exports = app;
