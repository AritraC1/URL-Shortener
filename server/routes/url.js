const express = require('express');
const {handleGenerateNewShortURL} = require('../controllers/url');

const router = express.Router();

// Post Route
router.post("/", handleGenerateNewShortURL);

module.exports = router;