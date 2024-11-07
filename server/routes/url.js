const express = require('express');
const {handleGenerateNewShortURL, handleGetAnalytics} = require('../controllers/url');

const router = express.Router();

// Post Route
router.post("/", handleGenerateNewShortURL);

// Get Route
router.get("/analytics/:shortId ", handleGetAnalytics);

module.exports = router;