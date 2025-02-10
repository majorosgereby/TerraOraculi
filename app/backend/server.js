// Import modules
import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';
import https from "https";
import fs from "fs";
import dotenv from "dotenv";
import morgan from "morgan";

// Get __dirname equivalent in ES modules
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// HTTPS config
// https://dev.to/fredabod/building-an-express-app-with-an-https-server-2mbj
// https://chatgpt.com/share/67866246-2df8-8013-b0c4-e08c5c0f8965
// dotenv.config();

// Create an Express app
const app = express();

// middlewear for https
// app.use(morgan("dev"));

// Read SSL certificate and key files
// const options = {
//     key: fs.readFileSync(path.join(__dirname, "keys", "express-example-key.pem")),
//     cert: fs.readFileSync(path.join(__dirname, "keys", "express-example.pem")),
// };

// ENDPOINTS

// Serve static HTML files from '../content/pages' folder
app.use(express.static(path.join(__dirname, '..', 'content', 'pages')));

// Serve styles from '../content/styles' folder
app.use('/css', express.static(path.join(__dirname, '..', 'content', 'styles')));

// Serve images from '../content/assets' folder
app.use('/img', express.static(path.join(__dirname, '..', 'content', 'assets')));

// Start the server
const PORT = process.env.PORT || 8128;

// const server = https.createServer(options, app);

// server.listen(PORT, () => {
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
