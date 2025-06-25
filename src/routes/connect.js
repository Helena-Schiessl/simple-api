const express = require('express');
const { Pool } = require('pg');
const router = express.Router();
require('dotenv').config();

// cria pool com SSL habilitado
const pool = new Pool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: Number(process.env.DB_PORT),
  ssl: {
    rejectUnauthorized: false
  }
});

router.get('/connect', async (req, res) => {
  try {
    const result = await pool.query('SELECT version()');
    res.json({ version: result.rows[0].version });
  } catch (err) {
    res.status(500).json({
      message: 'Erro ao conectar com o banco de dados.',
      error: err.message
    });
  }
});

module.exports = router;
