const express = require("express");
require("dotenv").config();

const app = express();
app.use(express.json());

const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.json({ message: "DevOps Backend API is running 🚀" });
});

app.get("/health", (req, res) => {
  res.status(200).json({
    status: "UP",
    service: "backend-api",
    timestamp: new Date(),
  });
});

app.listen(PORT, () => {
  console.log(`Backend API listening on port ${PORT}`);
});
