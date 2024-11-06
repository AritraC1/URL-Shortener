const mongoose = require('mongoose');

const urlSchema = new mongoose.Schema(
    {
        shortId: {
            type: String,
            required: true,
            unique: true, // Ensure the shortId is unique in the collection
        },
        redirectUrl: {
            type: String,
            required: true,
        },
        visitHistory: [{
            timeStamp: {type: Number} // Track the timestamp of visits
            // Add more information here if needed (e.g., IP, user-agent)
        }],
    }, 
    {timestamps: true} // Automatically manage createdAt and updatedAt fields
);

// Define the URL model
const URL = mongoose.model('URL', urlSchema); // capitalized model name according naming convention

module.exports = URL;