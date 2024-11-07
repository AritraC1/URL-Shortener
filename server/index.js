const dotenv = require('dotenv');
const express = require('express');
const cors = require('cors');
const { connectToMongoDB } = require('./connections/mongoConnection');
const urlRoute = require('./routes/url');
const URL = require('./models/url');
const morgan = require('morgan');  // For logging incoming requests
const portfinder = require('portfinder');

// Load environment variables from .env file
dotenv.config();

const app = express();

// Constants from environment variables
const MONGOURL = process.env.MONGO_CONNECTION_STRING;

// Middleware
app.use(cors());
app.use(express.json());
app.use(morgan('combined'));  // Logs all incoming requests also 'Morgan is a Node.js middleware that logs HTTP requests and responses to and from an application'

// Connect to MongoDB before starting the server
connectToMongoDB(MONGOURL)
    .then(() => {
        // Log that MongoDB has connected successfully
        console.log('MongoDB Connected');  // This line is added

        // Use portfinder to find an available port starting from 5002
        portfinder.getPort({ port: process.env.PORT_NUMBER || 5002 }, (err, port) => {
            if (err) {
                console.error('Error finding an available port:', err);
                return;
            }

            // Start the server only after a successful connection and finding an available port
            app.listen(port, () => {
                console.log(`Server is running on PORT: ${port}`);
            });
        });
    })
    .catch((error) => {
        console.error('Failed to connect to MongoDB, server will not start:', error);
    });

// API endpoints
app.use("/url", urlRoute);

app.get("/:shortId", async (req, res) => {
    const shortId = req.params.shortId;

    const entry = await URL.findOneAndUpdate(
        {
            shortId
        }, 
        {
            $push: {
                visitHistory: {
                    timestamp: Date.now(),
                },
            },
        }
    );
    res.redirect (entry.redirectUrl);
});

// Error Handling Middleware
app.use((err, req, res, next) => {
    console.error(err.stack);  // Log the error
    res.status(500).json({ message: 'Something went wrong!' });
});
