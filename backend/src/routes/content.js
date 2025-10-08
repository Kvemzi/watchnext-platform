const express = require('express');
const router = express.Router();
const { getAllContent, getContentById } = require('../controllers/content');

router.get('/', getAllContent);
router.get('/:id', getContentById);

module.exports = router;
