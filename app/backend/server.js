// Import modules
import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';

// Get __dirname equivalent in ES modules
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Create an Express app
const app = express();

// Serve static HTML files from '../content/pages' folder
app.use(express.static(path.join(__dirname, '..', 'content', 'pages')));

// Serve styles from '../content/styles' folder
app.use('/css', express.static(path.join(__dirname, '..', 'content', 'styles')));

// Serve images from '../content/assets' folder
app.use('/img', express.static(path.join(__dirname, '..', 'content', 'assets')));

// Start the server
const PORT = process.env.PORT || 8128;
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
