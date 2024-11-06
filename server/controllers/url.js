const { nanoid } = require('nanoid'); // shortid is deprecated
const URL = require("../models/url");
const { isURL } = require('validator'); // Package to validate the URL format


async function handleGenerateNewShortURL(req, res) {
    const body = req.body;

    // Check if the URL is provided
    if (!body.url) {
        return res.status(400).json({ error: 'URL is required' });
    }

    // Validate URL format using 'validator' package
    if (!isURL(body.url)) {
        return res.status(400).json({ error: 'Invalid URL format' });
    }

    // Generate a unique short ID of length 8-character ID (length can be adjusted)
    const shortID = nanoid(8); 

    try {
        // Check if the shortID already exists
        const existingURL =  await URL.findOne({shortId: shortID});
        if (existingURL) {
            // If the shortID already exists, recursively generate a new one
            return handleGenerateNewShortURL(req, res);
        }

        // Create the URL in the database
        await URL.create({
            shortId: shortID,
            redirectUrl: body.url,
            visitedHistory: [],
        });

        // Respond with the generated short ID
        return res.json({ id: shortID });
    }
    catch (error) {
        console.error('Error creating new short URL:', error);
        return res.status(500).json({ error: 'Server error, could not create short URL' });
    }
}

module.exports = {
    handleGenerateNewShortURL,
};