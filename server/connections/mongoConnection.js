const dotenv = require('dotenv');
const mongoose = require("mongoose");
mongoose.set("strictQuery", true);

dotenv.config();

async function connectToMongoDB(url) {
    return mongoose.connect(url);
}

module.exports = {
    connectToMongoDB,
};