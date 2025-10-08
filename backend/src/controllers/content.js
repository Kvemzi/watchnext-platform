const pool = require('../db');

// Get all content
const getAllContent = async (req, res) => {
  try {
    const { type, limit = 50 } = req.query;
    
    let query = 'SELECT * FROM content WHERE 1=1';
    const values = [];
    
    if (type) {
      query += ' AND type = $1';
      values.push(type);
      query += ' ORDER BY imdb_rating DESC LIMIT $2';
      values.push(limit);
    } else {
      query += ' ORDER BY imdb_rating DESC LIMIT $1';
      values.push(limit);
    }
    
    const result = await pool.query(query, values);
    res.json({
      success: true,
      count: result.rows.length,
      data: result.rows
    });
  } catch (error) {
    console.error('Error fetching content:', error);
    res.status(500).json({ 
      success: false,
      error: 'Failed to fetch content' 
    });
  }
};

// Get content by ID
const getContentById = async (req, res) => {
  try {
    const { id } = req.params;
    const result = await pool.query('SELECT * FROM content WHERE id = $1', [id]);
    
    if (result.rows.length === 0) {
      return res.status(404).json({ 
        success: false,
        error: 'Content not found' 
      });
    }
    
    res.json({
      success: true,
      data: result.rows[0]
    });
  } catch (error) {
    console.error('Error fetching content:', error);
    res.status(500).json({ 
      success: false,
      error: 'Failed to fetch content' 
    });
  }
};

module.exports = {
  getAllContent,
  getContentById,
};
