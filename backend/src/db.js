const { Pool } = require('pg');

// Unix socket konekcija - BEZ passworda za local development
const pool = new Pool({
  user: 'postgres',
  host: '/var/run/postgresql',
  database: 'watchnext',
  port: 5432,
});

// Test konekcije na startu
pool.query('SELECT NOW()', (err, res) => {
  if (err) {
    console.error('❌ Database connection failed:', err.message);
  } else {
    console.log('✅ Database connected successfully at', res.rows[0].now);
  }
});

pool.on('error', (err) => {
  console.error('❌ Unexpected database error:', err);
});

module.exports = pool;