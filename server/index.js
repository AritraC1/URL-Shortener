const dotenv = require('dotenv');
const express = require('express');
const cors = require('cors');
const {connectToMongoDB} = require('./connections/mongoConnection')
const urlRoute = require('./routes/url');

// Load environment variables from .env file
dotenv.config();

const app = express();

// Constants from environment variables
const PORT = process.env.PORT_NUMBER || 5001;
const MONGOURL = process.env.MONGO_CONNECTION_STRING

// Middlewares
app.use(cors());
app.use(express.json());

// Database connection - default port + database name (short-url)
connectToMongoDB(MONGOURL)
.then(() => console.log('MongoDB Connected'))
.catch((error) => console.error('Failed to connect to MongoDB:', error)); 

// API endpoints
app.use("/url", urlRoute);

// Server Start 
app.listen(PORT, () => console.log(`Server is running on PORT: ${PORT}`));