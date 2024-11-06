const dotenv = require('dotenv');
const mongoose = require("mongoose");
mongoose.set("strictQuery", true);

dotenv.config();

async function connectToMongoDB(url) {
    try {
        console.log('Attempting to connect to MongoDB...');
        await mongoose.connect(url, {
            useNewUrlParser: true,
            useUnifiedTopology: true,  // These options help avoid deprecation warnings
        });
        console.log("MongoDB Connected successfully");
    } catch (error) {
        console.error("MongoDB connection error:", error);
        throw error;  // Throw error to stop the app from running if the connection fails
    }
}

module.exports = {
    connectToMongoDB,
};