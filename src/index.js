const express = require('express');
const dotenv = require('dotenv');
const { Pool } = require('pg');
const connectRoute = require('./routes/connect'); // importa a rota /connect

dotenv.config(); // Carrega variáveis do .env

// Log para verificar se as variáveis estão sendo carregadas
console.log('ENV:', {
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  db: process.env.DB_NAME,
  port: process.env.DB_PORT,
});

// Cria o pool de conexão fora das rotas (boa prática)
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


const app = express();
app.use(express.json());

// Rota principal
app.get('/', (req, res) => {
  res.send('API funcionando com sucesso!');
});

// Rota de teste do banco (SELECT NOW())
app.get('/db', async (req, res) => {
  try {
    const result = await pool.query('SELECT NOW()');
    res.json({ time: result.rows[0] });
  } catch (error) {
    console.error('Erro na consulta:', error);
    res.status(500).send('Erro na conexão com o banco');
  }
});

// Ativa a rota /connect
app.use('/', connectRoute);

// Sobe o servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
